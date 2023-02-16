Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A65553A2
	for <linux-coco@lists.linux.dev>; Thu, 16 Feb 2023 12:46:05 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4DEEA1EC052A;
	Thu, 16 Feb 2023 13:46:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1676551563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ZqBaTyUq+/8HiR92mwl2yPYyLN2fWif2NArmQh+IzA=;
	b=BNM4ohXRfPujeH3MiwTJmKCzLSP9XXLlBnUxwxGe1Y1vpXutEobUp0flNyeH6EhQa/VARV
	6vYy70w8BHYzQWDrhefzSBYF6xqlXLTO3ZkXNDawxRU8fhSOXj8xFEROdUb1M4aivL3CQu
	Jx+HbiHfMX+zxdSd28InZG7qSHGfges=
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
Subject: [PATCH 06/11] virt/coco/sev-guest: Do some code style cleanups
Date: Thu, 16 Feb 2023 13:45:57 +0100
Message-Id: <20230216124602.26849-1-bp@alien8.de>
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

Remove unnecessary linebreaks, make the code more compact.

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 drivers/virt/coco/sev-guest/sev-guest.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index e72289de2b28..d430e2be2a22 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -392,18 +392,14 @@ static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code, in
 
 	rc = __handle_guest_request(snp_dev, exit_code, fw_err);
 	if (rc) {
-		dev_alert(snp_dev->dev,
-			  "Detected error from ASP request. rc: %d, fw_err: %llu\n",
-			  rc, *fw_err);
+		dev_alert(snp_dev->dev, "Detected error from ASP request. rc: %d, fw_err: %llu\n", rc, *fw_err);
 		snp_disable_vmpck(snp_dev);
 		return rc;
 	}
 
 	rc = verify_and_dec_payload(snp_dev, resp_buf, resp_sz);
 	if (rc) {
-		dev_alert(snp_dev->dev,
-			  "Detected unexpected decode failure from ASP. rc: %d\n",
-			  rc);
+		dev_alert(snp_dev->dev, "Detected unexpected decode failure from ASP. rc: %d\n", rc);
 		snp_disable_vmpck(snp_dev);
 		return rc;
 	}
-- 
2.35.1

