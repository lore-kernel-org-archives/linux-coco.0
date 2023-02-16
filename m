Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E145663
	for <linux-coco@lists.linux.dev>; Thu, 16 Feb 2023 12:41:34 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 46F871EC052A;
	Thu, 16 Feb 2023 13:41:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1676551292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4bntOdeDDY2iFHdEiwzJrRB8goPUnj16esNodV3hJ0=;
	b=DvhQG+78+yGjnGxjuLAqaMcmOXpg/my16qz7OpgunJn1Q6vJFHqYUUAp7cE4OJvn8ief3K
	o6RENlUxBcm3Qoym7cmdkuv6YPMlYI4ViamkjNz9aiskRhu3i5+XG1sYYnbDfaTcBNvDXA
	2QyW4jKk6PJhX80L640zpOVHNDp+7Ng=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Dionna Glaze <dionnaglaze@google.com>,
	Joerg Roedel <jroedel@suse.de>,
	Michael Roth <michael.roth@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Peter Gonda <pgonda@google.com>,
	Tom Lendacky <Thomas.Lendacky@amd.com>,
	linux-coco@lists.linux.dev,
	x86@kernel.org
Subject: [PATCH 03/11] virt/coco/sev-guest: Simplify extended guest request handling
Date: Thu, 16 Feb 2023 13:41:12 +0100
Message-Id: <20230216124120.26578-4-bp@alien8.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230216124120.26578-1-bp@alien8.de>
References: <20230216124120.26578-1-bp@alien8.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Return a specific error code - -ENOSPC - to signal the too small cert
data buffer instead of checking exit code and exitinfo2.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/sev.c                   |  8 +++--
 drivers/virt/coco/sev-guest/sev-guest.c | 46 ++++++++++++++-----------
 2 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index c644c34372e8..ee53cab887fa 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -2212,12 +2212,14 @@ int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, unsigned
 	if (ghcb->save.sw_exit_info_2) {
 		/* Number of expected pages are returned in RBX */
 		if (exit_code == SVM_VMGEXIT_EXT_GUEST_REQUEST &&
-		    ghcb->save.sw_exit_info_2 == SNP_GUEST_REQ_INVALID_LEN)
+		    ghcb->save.sw_exit_info_2 == SNP_GUEST_REQ_INVALID_LEN) {
 			input->data_npages = ghcb_get_rbx(ghcb);
+			ret = -ENOSPC;
+		} else {
+			ret = -EIO;
+		}
 
 		*fw_err = ghcb->save.sw_exit_info_2;
-
-		ret = -EIO;
 	}
 
 e_put:
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index edaf6031c6d9..5b4cddf44a3a 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -322,7 +322,8 @@ static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code, in
 				u8 type, void *req_buf, size_t req_sz, void *resp_buf,
 				u32 resp_sz, __u64 *fw_err)
 {
-	unsigned long err;
+	unsigned long err, override_err = 0;
+	unsigned int override_npages = 0;
 	u64 seqno;
 	int rc;
 
@@ -338,6 +339,7 @@ static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code, in
 	if (rc)
 		return rc;
 
+retry_request:
 	/*
 	 * Call firmware to process the request. In this function the encrypted
 	 * message enters shared memory with the host. So after this call the
@@ -346,17 +348,24 @@ static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code, in
 	 */
 	rc = snp_issue_guest_request(exit_code, &snp_dev->input, &err);
 
-	/*
-	 * If the extended guest request fails due to having too small of a
-	 * certificate data buffer, retry the same guest request without the
-	 * extended data request in order to increment the sequence number
-	 * and thus avoid IV reuse.
-	 */
-	if (exit_code == SVM_VMGEXIT_EXT_GUEST_REQUEST &&
-	    err == SNP_GUEST_REQ_INVALID_LEN) {
-		const unsigned int certs_npages = snp_dev->input.data_npages;
+	switch (rc) {
+	case -ENOSPC:
+		/*
+		 * If the extended guest request fails due to having too
+		 * small of a certificate data buffer, retry the same
+		 * guest request without the extended data request in
+		 * order to increment the sequence number and thus avoid
+		 * IV reuse.
+		 */
+		override_npages = snp_dev->input.data_npages;
+		exit_code	= SVM_VMGEXIT_GUEST_REQUEST;
 
-		exit_code = SVM_VMGEXIT_GUEST_REQUEST;
+		/*
+		 * Override the error to inform callers the given extended
+		 * request buffer size was too small and give the caller the
+		 * required buffer size.
+		 */
+		override_err	= SNP_GUEST_REQ_INVALID_LEN;
 
 		/*
 		 * If this call to the firmware succeeds, the sequence number can
@@ -366,19 +375,14 @@ static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code, in
 		 * of the VMPCK and the error code being propagated back to the
 		 * user as an ioctl() return code.
 		 */
-		rc = snp_issue_guest_request(exit_code, &snp_dev->input, &err);
-
-		/*
-		 * Override the error to inform callers the given extended
-		 * request buffer size was too small and give the caller the
-		 * required buffer size.
-		 */
-		err = SNP_GUEST_REQ_INVALID_LEN;
-		snp_dev->input.data_npages = certs_npages;
+		goto retry_request;
 	}
 
 	if (fw_err)
-		*fw_err = err;
+		*fw_err = override_err ?: err;
+
+	if (override_npages)
+		snp_dev->input.data_npages = override_npages;
 
 	if (rc) {
 		dev_alert(snp_dev->dev,
-- 
2.35.1

