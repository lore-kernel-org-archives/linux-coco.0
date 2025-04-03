Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E319224BBF5
	for <linux-coco@lists.linux.dev>; Thu,  3 Apr 2025 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675006; cv=none; b=KPrhw4MspX3Blbj0zaR1BJMAZlNE8IeGcZTLyRb5/tTllIRuF54FFTomCed27SD+4xKe68wNJeNiUVdQJpdr+Qp5LyCrScdLTieIXWUAvvBRWkTQN5/1GXsyr6JttyNefdbzaugYxioBlktdjOVANjso9Meqx+PW73tsrxU4S80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675006; c=relaxed/simple;
	bh=nqTYW20eQeRWC6Ahiua5kvtbrZfZBXVwk+9t2ZFiCdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=A2UvwQZ/mIcw3mGJNr5T+Vt3pIsiCBfXZ5z6/IkMNhyw9uwZ52+DnOqnukiSwSCwmV/En0CgFfDtQsh76ztzpDViWiVC0aEbRmdvt+HpYtf0zbqufVzW+JEj1aSQAYKVKvW0bs2PYtakZ2kUSfrSnwFZzcirkPyMOcFG4kN0Vkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ia+CQo9r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ia+CQo9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743675004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHN/GOOnq6Txv1XxeXH0YVjxE8uHCc3AcxqH5SqtB70=;
	b=ia+CQo9rNSuam8FMxBKFu2kySJyjMoTsT8XuUOZVdWZdaRLHz1LAT3c3gA0VEnT0h2Ss4l
	AU4XefH6FR8fv+eDpx7QJsU4vzCz2iG2wUDO4ZxKUaar82WxmrfclDWcC3ZQHBilv1hbPs
	LERX//n1REiWf2sSWi1wSuyWD0SAiro=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-VF46mau5MfiPcPky5f3jQg-1; Thu, 03 Apr 2025 06:10:03 -0400
X-MC-Unique: VF46mau5MfiPcPky5f3jQg-1
X-Mimecast-MFC-AGG-ID: VF46mau5MfiPcPky5f3jQg_1743675002
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso4335765e9.0
        for <linux-coco@lists.linux.dev>; Thu, 03 Apr 2025 03:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743675001; x=1744279801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHN/GOOnq6Txv1XxeXH0YVjxE8uHCc3AcxqH5SqtB70=;
        b=MGIHoYaHm6SbH0FkJD4ORX8Ia45zC6c8UeTKgJ2MFkIgTCCe5+DDFdDIb4CDvYc3RD
         Rb2cN9hFPAWsgvAethytDPu+vrKkQyM1kTYJ7UPeYaGmCtyzK4rFetVBCeUuEQZImpLi
         YJmtKDa3li2xLy2CoMcaZbCb8jdaBrmNQAU6CRnRqxdyxXx3CM0ym8PSWH/q47a9pvvy
         KCo6A4ETQh9uGZDxWJhUBFwanoTXGnrLMZkmX+y6pqo/xVfoXygB6tR+bcFGycn6WuR5
         LSO6Fli0EeWI0I6QPs9Pl1noKxzvuHMLUcxqDyVbtFsrmmSAQjMHqSMe6vdHbPFxLBOV
         tO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3fC4euS69l2GoA0/NJXUrQIhb0F5NkKpoJaqH/cUoZtiPC37a7BwwMigF7FDzeCFC8o+qRmLjNQuM@lists.linux.dev
X-Gm-Message-State: AOJu0YwfVN0+mDtIdsFcNaOif056VtKzAWUUOmj3XEmZcmumkk9B+nxx
	FMHYd8Ppp1BRUoAfsA1zcXr3RuXOUt9Ti4U1gRYC5gGL0hCX8ljXCQXDBgnfThyOScQsrU0Xl6O
	gWTHVTDPyo13eNZ7rLwJsbJtWtdh7U9HC379F/ZhcFjBI/k7dvkcQWidZr5M=
X-Gm-Gg: ASbGncuGe4MEiExKMuI/IjlbXC93D4FOgviPYinX/+ISaLzuMz+isHZ/Yd1FiqbQytR
	Ag9+O7/VeeWiRnUvFpw0XxEfFwi/3HqaoXQIhLBW46WTeBmZqlm1kby/lOZxcxIj68blwdWF5/y
	5+ojGKYDaPGWWiXbwJRvm5Q079fhDUPBGW3etpXq8MVuo4a7tX4D6etaUcv9JXAnu4Gby1qh7xn
	1azYR5Nq/Ajh+GCn8Ja/2hr9chuyYRBCmiOoqUUHNCB/457K1lCuc014cu3v5SenDBsl3l6Fhr1
	XEVzpnnJcNTI3xJUAgR63NoK1LDJIr1n+d+QDcerhb0GQlScfIj5xOuUEKY3
X-Received: by 2002:a05:6000:1785:b0:39c:2661:4ce0 with SMTP id ffacd0b85a97d-39c3032df6fmr1771670f8f.13.1743675001477;
        Thu, 03 Apr 2025 03:10:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwZgz6CFxdlnhGWRxVWtOMzdrp4cTJAX2/XgXKjJ5i6StpXDDY/u+vUjfxZIDvSXh82PBRMA==
X-Received: by 2002:a05:6000:1785:b0:39c:2661:4ce0 with SMTP id ffacd0b85a97d-39c3032df6fmr1771614f8f.13.1743675000890;
        Thu, 03 Apr 2025 03:10:00 -0700 (PDT)
Received: from stex1.redhat.com (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a67b7sm1345908f8f.25.2025.04.03.03.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:10:00 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-coco@lists.linux.dev,
	linux-integrity@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Joerg Roedel <jroedel@suse.de>,
	Dionna Glaze <dionnaglaze@google.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-kernel@vger.kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v6 3/4] tpm: add SNP SVSM vTPM driver
Date: Thu,  3 Apr 2025 12:09:41 +0200
Message-ID: <20250403100943.120738-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403100943.120738-1-sgarzare@redhat.com>
References: <20250403100943.120738-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -CNioLVIsxtXSdFbBHdPHBWAVcmkrYEf-1mAlyaME-4_1743675002
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Stefano Garzarella <sgarzare@redhat.com>

Add driver for the vTPM defined by the AMD SVSM spec [1].

The specification defines a protocol that a SEV-SNP guest OS can use to
discover and talk to a vTPM emulated by the Secure VM Service Module (SVSM)
in the guest context, but at a more privileged level (VMPL0).

The new tpm-svsm platform driver uses two functions exposed by x86/sev
to verify that the device is actually emulated by the platform and to
send commands and receive responses.

The device cannot be hot-plugged/unplugged as it is emulated by the
platform, so we can use module_platform_driver_probe(). The probe
function will only check whether in the current runtime configuration,
SVSM is present and provides a vTPM.

This device does not support interrupts and sends responses to commands
synchronously. In order to have .recv() called just after .send() in
tpm_try_transmit(), the .status() callback returns 0, and both
.req_complete_mask and .req_complete_val are set to 0.

[1] "Secure VM Service Module for SEV-SNP Guests"
    Publication # 58019 Revision: 1.00

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v6:
- removed the `locality` field (set to 0) and the FIXME comment [Jarkko]
v5:
- removed cancel/status/req_* ops after rebase on master that cotains
  commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled} opt")
v4:
- moved "asm" includes after the "linux" includes [Tom]
- allocated buffer separately [Tom/Jarkko/Jason]
v3:
- removed send_recv() ops and followed the ftpm driver implementing .status,
  .req_complete_mask, .req_complete_val, etc. [Jarkko]
- removed link to the spec because those URLs are unstable [Borislav]
---
 drivers/char/tpm/tpm_svsm.c | 128 ++++++++++++++++++++++++++++++++++++
 drivers/char/tpm/Kconfig    |  10 +++
 drivers/char/tpm/Makefile   |   1 +
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_svsm.c

diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
new file mode 100644
index 000000000000..b9242c9eab87
--- /dev/null
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
+ *
+ * Driver for the vTPM defined by the AMD SVSM spec [1].
+ *
+ * The specification defines a protocol that a SEV-SNP guest OS can use to
+ * discover and talk to a vTPM emulated by the Secure VM Service Module (SVSM)
+ * in the guest context, but at a more privileged level (usually VMPL0).
+ *
+ * [1] "Secure VM Service Module for SEV-SNP Guests"
+ *     Publication # 58019 Revision: 1.00
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/tpm_svsm.h>
+
+#include <asm/sev.h>
+
+#include "tpm.h"
+
+struct tpm_svsm_priv {
+	void *buffer;
+};
+
+static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
+{
+	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
+	int ret;
+
+	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
+	if (ret)
+		return ret;
+
+	/*
+	 * The SVSM call uses the same buffer for the command and for the
+	 * response, so after this call, the buffer will contain the response
+	 * that can be used by .recv() op.
+	 */
+	return snp_svsm_vtpm_send_command(priv->buffer);
+}
+
+static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
+{
+	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
+
+	/*
+	 * The internal buffer contains the response after we send the command
+	 * to SVSM.
+	 */
+	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
+}
+
+static struct tpm_class_ops tpm_chip_ops = {
+	.flags = TPM_OPS_AUTO_STARTUP,
+	.recv = tpm_svsm_recv,
+	.send = tpm_svsm_send,
+};
+
+static int __init tpm_svsm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tpm_svsm_priv *priv;
+	struct tpm_chip *chip;
+	int err;
+
+	if (!snp_svsm_vtpm_probe())
+		return -ENODEV;
+
+	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/*
+	 * The maximum buffer supported is one page (see SVSM_VTPM_MAX_BUFFER
+	 * in tpm_svsm.h).
+	 */
+	priv->buffer = (void *)devm_get_free_pages(dev, GFP_KERNEL, 0);
+	if (!priv->buffer)
+		return -ENOMEM;
+
+	chip = tpmm_chip_alloc(dev, &tpm_chip_ops);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	dev_set_drvdata(&chip->dev, priv);
+
+	err = tpm2_probe(chip);
+	if (err)
+		return err;
+
+	err = tpm_chip_register(chip);
+	if (err)
+		return err;
+
+	dev_info(dev, "SNP SVSM vTPM %s device\n",
+		 (chip->flags & TPM_CHIP_FLAG_TPM2) ? "2.0" : "1.2");
+
+	return 0;
+}
+
+static void __exit tpm_svsm_remove(struct platform_device *pdev)
+{
+	struct tpm_chip *chip = platform_get_drvdata(pdev);
+
+	tpm_chip_unregister(chip);
+}
+
+/*
+ * tpm_svsm_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound
+ * at runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver tpm_svsm_driver __refdata = {
+	.remove = __exit_p(tpm_svsm_remove),
+	.driver = {
+		.name = "tpm-svsm",
+	},
+};
+
+module_platform_driver_probe(tpm_svsm_driver, tpm_svsm_probe);
+
+MODULE_DESCRIPTION("SNP SVSM vTPM Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:tpm-svsm");
diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index fe4f3a609934..dddd702b2454 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -234,5 +234,15 @@ config TCG_FTPM_TEE
 	help
 	  This driver proxies for firmware TPM running in TEE.
 
+config TCG_SVSM
+	tristate "SNP SVSM vTPM interface"
+	depends on AMD_MEM_ENCRYPT
+	help
+	  This is a driver for the AMD SVSM vTPM protocol that a SEV-SNP guest
+	  OS can use to discover and talk to a vTPM emulated by the Secure VM
+	  Service Module (SVSM) in the guest context, but at a more privileged
+	  level (usually VMPL0).  To compile this driver as a module, choose M
+	  here; the module will be called tpm_svsm.
+
 source "drivers/char/tpm/st33zp24/Kconfig"
 endif # TCG_TPM
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 2b004df8c04b..9de1b3ea34a9 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -45,3 +45,4 @@ obj-$(CONFIG_TCG_CRB) += tpm_crb.o
 obj-$(CONFIG_TCG_ARM_CRB_FFA) += tpm_crb_ffa.o
 obj-$(CONFIG_TCG_VTPM_PROXY) += tpm_vtpm_proxy.o
 obj-$(CONFIG_TCG_FTPM_TEE) += tpm_ftpm_tee.o
+obj-$(CONFIG_TCG_SVSM) += tpm_svsm.o
-- 
2.49.0

