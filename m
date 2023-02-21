Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4EE1FDB
	for <linux-coco@lists.linux.dev>; Tue, 21 Feb 2023 11:34:38 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B7E561EC064D;
	Tue, 21 Feb 2023 12:34:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1676979276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmJP6KJzP645UaTSE0lRF5lUFM34wl43txCaH4JG/ds=;
	b=gr+Ft10dPKgV49IOliEOEH6OOeK1mkIT1loIM1M/fMuVqQ3tJZgbmQy7PpsirIEuEwMHOf
	JOXiXKY+LNCKKaxs6n5oY8RWbpub0Vft/lwwfzMbCv7vQU/PuvN6mX5I69/r/VZbAbYQWu
	T1bhTRA4CSVexbPlRIP74fjb9yyI29k=
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
Subject: [PATCH -v2 02/11] virt/coco/sev-guest: Check SEV_SNP attribute at probe time
Date: Tue, 21 Feb 2023 12:34:19 +0100
Message-Id: <20230221113428.19324-3-bp@alien8.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230221113428.19324-1-bp@alien8.de>
References: <20230221113428.19324-1-bp@alien8.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

No need to check it on every ioctl. And yes, this is a common SEV driver
but it does only SNP-specific operations currently. This can be
revisited later, when more use cases appear.

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/sev.c                   | 3 ---
 drivers/virt/coco/sev-guest/sev-guest.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 679026a640ef..c644c34372e8 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -2183,9 +2183,6 @@ int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, unsigned
 	struct ghcb *ghcb;
 	int ret;
 
-	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
-		return -ENODEV;
-
 	if (!fw_err)
 		return -EINVAL;
 
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 4ec4174e05a3..edaf6031c6d9 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -689,6 +689,9 @@ static int __init sev_guest_probe(struct platform_device *pdev)
 	void __iomem *mapping;
 	int ret;
 
+	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+		return -ENODEV;
+
 	if (!dev->platform_data)
 		return -ENODEV;
 
-- 
2.35.1

