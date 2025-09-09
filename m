Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF1278F3E
	for <linux-coco@lists.linux.dev>; Tue,  9 Sep 2025 18:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757442204; cv=none; b=GKJXLfbgiuyVvePjTZvthVpOdlTpbdiqfQO+s1621/CmkDt1F/iS4q5z0LbmAsRFoJQQSG2ghF9IJi1d2Hn2FG/lSh0/G5ND/gh7CTBzFpxi3ZhuTnj+LWkYR5SnuJ0/yFyoC8ubH8tkEuyRkOfZAuA9J7G3qBcBJV3QIomIf+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757442204; c=relaxed/simple;
	bh=ayXq+M/IXmtH+qzE3s/vt9E1QhH2xZ1MYd7INE929wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IXS2o9tI78YGmZWiQhhqKsv6CPjltmJ0fr5+JFS296aC9Kxb0AGB0hZO0H8pklP9xjwlTh4eyTnuJVQxXHY196ijIiLuLJUQhaA+OFnb1coyLi6QgZkju5jI2XyIw5J/GUWY4YRd1j4T2CVBLujD4jBTgsDUC1P4CZa19xKbkvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVpfT6ku; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVpfT6ku"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-624fdf51b44so3772539a12.1
        for <linux-coco@lists.linux.dev>; Tue, 09 Sep 2025 11:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757442201; x=1758047001; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PUVP7FKAOtU/TwsRsEeYoSFs2VmQKSg6Oic7Qyd3DY=;
        b=IVpfT6kuNzDYSPVqZp/C3B4iEfM4FPPfclYtGA9HN6vLRAY6skAKwB4UzoVAkCSyzU
         mRs6THURNcc+nKed+/UNrDUdrFtJ5f+qT+e359E5jQxyUYG1fEi2Efecg6JcmsfWcajV
         IhA4dQSLUhdc+KewFr3RTZj/4SAn8u2kuHrCl/1kYypDbjUJp8TFPeSvMR2keBWuYGvG
         wH5b1DHnzdbpHUdq8sz6ReQPDNh5xZIkxAROb+419Y8wUWpFHt40FV63UEOiuyjbi/IA
         sOiq0QlAy16/vH94Ml9gPJDVratHDr7wIoLTJwWOmF4S6IWyCiK13WZJTW8DKdywmEz9
         qE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757442201; x=1758047001;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PUVP7FKAOtU/TwsRsEeYoSFs2VmQKSg6Oic7Qyd3DY=;
        b=VgOIFHsmVbvi2Y0Ug9CKAkdmpdlahVbEGoMr6bt8/8AMLpsHSGY9fXHFk7d1oRb1Bt
         hVXR5vWxNIzJ0m+wQc7//ssF4sLv1HGPcS8W11/bSKR0a3RmavTBMRizlC/Q6M4JlyRj
         RDijsIkUBwcgRlHLR4lyPiKKo3obWKQhU8D1nKZ2LNXNfUL308ETVU+WbL2xPL9YKTTx
         Eb9J1/wNSoeBiMVF6JNt/PWeQLl4wf7qjy+OCOfgQZe/G1nc4BfZQ2nyKN3lfEFwlz4V
         6Qzs4mv7FXzoaP91/r+6D0Xa5e4dKvXn+wVpjbK2TM0ZnzkeOpp7k81ouGZBxgWnCM4h
         AvQg==
X-Forwarded-Encrypted: i=1; AJvYcCVb3hoT22nRHdpN6co1VkQCJ6Lfnu9GPKwexPWiICVzKVxSTPpiCOtSCf2ByASN39OwdSZ7sDqBd8+g@lists.linux.dev
X-Gm-Message-State: AOJu0YyTMl7XJ4xf2iv3dMRzvI1rtn9hXrQx5BlUdMLAFVD3hoNzHhE8
	GEi/9Y4UwpnZ4JpjaLF1ylKHJAytuAGgd33zmpn+q2ZUP8eBtbhD7wg/
X-Gm-Gg: ASbGncs4+QtvxEHgjuqUxHodyOZYvkzoCtbWmyUeiVP68yhguz+946i5AlQzYNVVJN8
	38S3WCOeZGFW+zMbzgwpGCVil/HJSHBZKUQ2AseIz5s+qdjc5jdCbJfJqmSfY85MyUavPWak3pH
	0cJO6thfs7sgULmsDSGkFirZFJX3yjbeQ4BlnCvaP48LBLBIAlmjTK1zOAcyLB/uVQfBTMeuoam
	CccCErFNL+RjlVz/IbTzqgKAjc4wzCRtDZgqsVW1aqd1/MhqvFpSiRwTSDmLXXihiV+8sv2kq6m
	UV1vEBKjIP6BrYEBP0Oyg3pA9cvupQUk3Zn3jOm144AVAzmEu04R8K8ZXchUF/s0KjF1cg2rFlk
	W+VRoU/pG6QF4giTLCkkYSOSBlhSAyLc=
X-Google-Smtp-Source: AGHT+IG6IL42h/9FNE6j6CpH2K3Mce2bZXCFt5O8zybEj1g1GeIFSi2pHiMl3l2RmkPRMJ29sOuVmg==
X-Received: by 2002:a05:6402:358f:b0:628:bee2:b32f with SMTP id 4fb4d7f45d1cf-628bee2b7d1mr7116519a12.10.1757442200742;
        Tue, 09 Sep 2025 11:23:20 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-62c01bdb7f4sm1765335a12.50.2025.09.09.11.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:23:20 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 09 Sep 2025 21:23:07 +0300
Subject: [PATCH v3] mfd: max77705: rework interrupts
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-max77705-fix_interrupt_handling-v3-1-233c5a1a20b5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIpwwGgC/43Nyw6CMBQE0F8hXVvTR+jDlf9hDEG4wE2gkBYbD
 OHfLWx0p8uZTM6sJIBHCOSSrcRDxICjS0GeMlJ1pWuBYp0yEUzkzEhOh3LRWrOcNrgU6Gbw/jn
 NRdrWPbqWMmNsBaCsVDVJyuQhLY+H2z3lDsM8+tdxGPne/m9HTjnVEpg2jAvI+bUdSuzP1TiQ3
 Y7i41mmf3ti9+zDKKVEY4389rZtewMfMrV/HgEAAA==
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 "Kirill A. Shutemov" <kas@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
 kvm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757442199; l=3969;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=ayXq+M/IXmtH+qzE3s/vt9E1QhH2xZ1MYd7INE929wc=;
 b=66TYJUIuxw3yPPu486grXeNmMd8ThQFhW/B+yOmNoPfG13vTLT9sur8zphKWfPUk3IDIg1uK3
 nFCtqugAYkVB1wJ12k33rDY3CIy8SKPKOuPR5qJubiAcp9MkB3hOwTH
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Current implementation describes only MFD's own topsys interrupts.
However, max77705 has a register which indicates interrupt source, i.e.
it acts as an interrupt controller. There's 4 interrupt sources in
max77705: topsys, charger, fuelgauge, usb type-c manager.

Setup max77705 MFD parent as an interrupt controller. Delete topsys
interrupts because currently unused.

Remove shared interrupt flag, because we're are an interrupt controller
now, and subdevices should request interrupts from us.

Fixes: c8d50f029748 ("mfd: Add new driver for MAX77705 PMIC")

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Max77705 has a register, which indicates, who is triggering irq. There
may be 4 irq sources in max77705: charger, fuelgauge, usb type-c
manager ic, and so-called 'topsys'. Hence, max77705 mfd parent device is
an interrupt controller. This series implements interrupt controller in
max77705 mfd.
---
Changes in v3:
- remove shared flag
- Link to v2: https://lore.kernel.org/r/20250907-max77705-fix_interrupt_handling-v2-1-79b86662f983@gmail.com

Changes in v2:
- remove unused interrupt declarations
- Link to v1: https://lore.kernel.org/r/20250831-max77705-fix_interrupt_handling-v1-1-73e078012e51@gmail.com
---
Changes to v2:
- delete topsys interrupts declarations
Changes to v3:
- remove shared irq flag, and describe why in commit msg
---
 drivers/mfd/max77705.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/max77705.c b/drivers/mfd/max77705.c
index 6b263bacb8c2..62dbc63efa8d 100644
--- a/drivers/mfd/max77705.c
+++ b/drivers/mfd/max77705.c
@@ -61,21 +61,21 @@ static const struct regmap_config max77705_regmap_config = {
 	.max_register = MAX77705_PMIC_REG_USBC_RESET,
 };
 
-static const struct regmap_irq max77705_topsys_irqs[] = {
-	{ .mask = MAX77705_SYSTEM_IRQ_BSTEN_INT, },
-	{ .mask = MAX77705_SYSTEM_IRQ_SYSUVLO_INT, },
-	{ .mask = MAX77705_SYSTEM_IRQ_SYSOVLO_INT, },
-	{ .mask = MAX77705_SYSTEM_IRQ_TSHDN_INT, },
-	{ .mask = MAX77705_SYSTEM_IRQ_TM_INT, },
+static const struct regmap_irq max77705_irqs[] = {
+	{ .mask = MAX77705_SRC_IRQ_CHG, },
+	{ .mask = MAX77705_SRC_IRQ_TOP, },
+	{ .mask = MAX77705_SRC_IRQ_FG, },
+	{ .mask = MAX77705_SRC_IRQ_USBC, },
 };
 
-static const struct regmap_irq_chip max77705_topsys_irq_chip = {
-	.name		= "max77705-topsys",
-	.status_base	= MAX77705_PMIC_REG_SYSTEM_INT,
-	.mask_base	= MAX77705_PMIC_REG_SYSTEM_INT_MASK,
+static const struct regmap_irq_chip max77705_irq_chip = {
+	.name		= "max77705",
+	.status_base	= MAX77705_PMIC_REG_INTSRC,
+	.ack_base	= MAX77705_PMIC_REG_INTSRC,
+	.mask_base	= MAX77705_PMIC_REG_INTSRC_MASK,
 	.num_regs	= 1,
-	.irqs		= max77705_topsys_irqs,
-	.num_irqs	= ARRAY_SIZE(max77705_topsys_irqs),
+	.irqs		= max77705_irqs,
+	.num_irqs	= ARRAY_SIZE(max77705_irqs),
 };
 
 static int max77705_i2c_probe(struct i2c_client *i2c)
@@ -110,19 +110,12 @@ static int max77705_i2c_probe(struct i2c_client *i2c)
 
 	ret = devm_regmap_add_irq_chip(dev, max77705->regmap,
 					i2c->irq,
-					IRQF_ONESHOT | IRQF_SHARED, 0,
-					&max77705_topsys_irq_chip,
+					IRQF_ONESHOT, 0,
+					&max77705_irq_chip,
 					&irq_data);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add IRQ chip\n");
 
-	/* Unmask interrupts from all blocks in interrupt source register */
-	ret = regmap_update_bits(max77705->regmap,
-				 MAX77705_PMIC_REG_INTSRC_MASK,
-				 MAX77705_SRC_IRQ_ALL, (unsigned int)~MAX77705_SRC_IRQ_ALL);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Could not unmask interrupts in INTSRC\n");
-
 	domain = regmap_irq_get_domain(irq_data);
 
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,

---
base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
change-id: 20250831-max77705-fix_interrupt_handling-0889cee6936d

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

