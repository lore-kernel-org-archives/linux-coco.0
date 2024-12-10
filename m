Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4157E1B394E
	for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841287; cv=none; b=ib/FMWiGScBz0JVQcKhalnV1xaW0G/b1yTUIH249O4WOJwIeb9CSVHdl/A97RLa4sWx8+k7OGqgXGUQi4OX6aZqBuWCWewKC62WWjR13JO+bcAEdJhjCF/Xz7jjAJX6Whg1Bx9VLCU1x0LVRFTDMLTDbMWLtSuxb0lIutSkQEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841287; c=relaxed/simple;
	bh=YV/Bg/GvqXh41XMQKcC78+GvpEsuDVEuBZeCJxhmFaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=IBPJ1jCzpO2X6dONK7ThK9iu9etKjM3oKRryvjkHPrA53A4gvBo+xFRPyZttM3ppvWopXLIszpw+4Dq2S88H1fWjVOZaN3Z0Fu4KxMZJwzt15HjC2KVctDm9EJu1bX60PWFYBAfxlAm+ljjfYqyion4YexpgDlMz9nE2x1Eq37U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2xaxKKi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2xaxKKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733841284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mDnBbe1BmERY/J1Wfq/4Vteahq+sGBYwUfN+slK2gHE=;
	b=H2xaxKKiJuCZ19KQb1m5yJRJpgBsa28kh3mTf2jeZfoFrZrNTs0RfTRaVcqnWhn/SbA5BL
	8En801zctxXhLODFBuvalnBCHT+1qDmFk/QmKq2T0B5cFpVpjLla5kbOM0P6ehzGmPOtPj
	kiZ+U7msxh6fuN+kcjZq02ZU2OW+BkE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-dLq21f8CPoSCmyFNzDoSsg-1; Tue, 10 Dec 2024 09:34:43 -0500
X-MC-Unique: dLq21f8CPoSCmyFNzDoSsg-1
X-Mimecast-MFC-AGG-ID: dLq21f8CPoSCmyFNzDoSsg
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d87d6c09baso101721626d6.3
        for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 06:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841280; x=1734446080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDnBbe1BmERY/J1Wfq/4Vteahq+sGBYwUfN+slK2gHE=;
        b=eeuNVLfJMG+Nl96hZKa+BsBxn0ROdDXyzPsRTkSGFXTBpuLPVmTZrxgLHoOj+j/1dk
         H0vrzEoQl4NKYa67pFQeJCD2bckhKM9VXsLsOy5ekxvT+pZMVj4GR8OTNomvpZHIpMPy
         8qTQ9LQkf7qf12ShV3XAJAC2szQEEnvY3J5dQrxEs/mhnTG1NUJcPUnMaunI6MngCJu/
         c1KNgdBhVjhZU2TIo/azY/T3F4qxEGsYqwybp3vYqsiqr0m7aHS4QLIseyMvTTJE3XS9
         6IG6NaF6ETcI+nwk2cPPBXBeocl8KZNwUa2uc/YaIbA3HiR1foWY3GFkR+5YJ2HnRpGT
         8xcw==
X-Gm-Message-State: AOJu0Yx4K/8jKUBZ29nvV0TL+pp4zQgbcdZstxq6zRzIXf6z8nkts7u7
	kSe5gEIKOGssu0EtCaiDG2aOnZ+SZD1wgp+OVzHpM06h5iv85M5Ohgrv5NM0FN5GeNQJ65FcKfN
	fL8b9ibRcb5pp0bUBxPxtIsD7UMAH0jJdtEJfteflnhx/P9azDFYIgpAIn+LYoex5V5nTieM2e1
	FdmemNsdtK/4qP9C8rwbioojJJ41EvMvFFwuh6vh4aYEE=
X-Gm-Gg: ASbGnctTjQtScBANX4VdkUGo5ZCNFfU1asiDPA4gqwWqqgKKkkQ7Zs84WICSXazGDo2
	ckbSxAagKCJF8VEl50DCeyD+c/CqDFIrBem+3kG7wQcNry5DuGresA+QRgokScLBcuwAunsoLYq
	ucHWBVg+PeuVE8JZ5zDNhNxaZ++85KdYFy/nz60vXjHOXnQsod6IFC5qAt3NQGtulmkfhR34rUn
	XwDvFNoklKikRUumcu57TDaxoMrQcqcdTjnm9UwToPP+7JVNJlY7xhJ7PxmzApjlyuuNr7rAP8C
	QhmuGa8rbuBiLBIns88W5+Emx/d95YA=
X-Received: by 2002:a05:6214:1c4b:b0:6cb:edd7:ac32 with SMTP id 6a1803df08f44-6d8e7118b40mr276775576d6.12.1733841280381;
        Tue, 10 Dec 2024 06:34:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd9Xhzi92yMy9pvFO8lvm7KNjYH3fF75o4ZDwOrQBpyHy5E2nWLC7J0gQUJoL3IfKFPJkFLA==
X-Received: by 2002:a05:6214:1c4b:b0:6cb:edd7:ac32 with SMTP id 6a1803df08f44-6d8e7118b40mr276774916d6.12.1733841279791;
        Tue, 10 Dec 2024 06:34:39 -0800 (PST)
Received: from step1.redhat.com (host-87-12-25-244.business.telecomitalia.it. [87.12.25.244])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9fd1f2sm60439976d6.81.2024.12.10.06.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:34:35 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-integrity@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	x86@kernel.org,
	Joerg Roedel <jroedel@suse.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 1/3] tpm: add generic platform device
Date: Tue, 10 Dec 2024 15:34:21 +0100
Message-ID: <20241210143423.101774-2-sgarzare@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210143423.101774-1-sgarzare@redhat.com>
References: <20241210143423.101774-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P7GMzixmQgXKdxfM2JmRo4Zi8L7NQx263_Gnk6cPo18_1733841282
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: James Bottomley <James.Bottomley@HansenPartnership.com>

This is primarily designed to support an enlightened driver for the
AMD svsm based vTPM, but it could be used by any platform which
communicates with a TPM device.  The platform must fill in struct
tpm_platform_ops as the platform_data and set the device name to "tpm"
to have the binding by name work correctly.  The sole sendrcv
function is designed to do a single buffer request/response conforming
to the MSSIM protocol.  For the svsm vTPM case, this protocol is
transmitted directly to the SVSM, but it could be massaged for other
function type platform interfaces.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
[SG] changed references/links to TCG TPM repo
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/tpm_platform.h    |  90 ++++++++++++++++++++
 drivers/char/tpm/tpm_platform.c | 141 ++++++++++++++++++++++++++++++++
 drivers/char/tpm/Kconfig        |   7 ++
 drivers/char/tpm/Makefile       |   1 +
 4 files changed, 239 insertions(+)
 create mode 100644 include/linux/tpm_platform.h
 create mode 100644 drivers/char/tpm/tpm_platform.c

diff --git a/include/linux/tpm_platform.h b/include/linux/tpm_platform.h
new file mode 100644
index 000000000000..95c17a75d59d
--- /dev/null
+++ b/include/linux/tpm_platform.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 James.Bottomley@HansenPartnership.com
+ *
+ * Interface specification for platforms wishing to activate the
+ * platform tpm device.  The device must be a platform device created
+ * with the name "tpm" and it must populate platform_data with struct
+ * tpm_platform_ops
+ */
+
+/*
+ * The current MSSIM TPM commands we support.  The complete list is
+ * in the TcpTpmProtocol header:
+ *
+ * https://github.com/TrustedComputingGroup/TPM/blob/main/TPMCmd/Simulator/include/TpmTcpProtocol.h
+ */
+
+#define TPM_SEND_COMMAND		8
+#define TPM_SIGNAL_CANCEL_ON		9
+#define TPM_SIGNAL_CANCEL_OFF		10
+/*
+ * Any platform specific commands should be placed here and should start
+ * at 0x8000 to avoid clashes with the MSSIM protocol.  They should follow
+ * the same self describing buffer format below
+ */
+
+#define TPM_PLATFORM_MAX_BUFFER		4096 /* max req/resp buffer size */
+
+/**
+ * struct tpm_platform_ops - the share platform operations
+ *
+ * @sendrcv:	Send a TPM command using the MSSIM protocol.
+ *
+ * The MSSIM protocol is designed for a network, so the buffers are
+ * self describing.  The minimum buffer size is sizeof(u32).  Every
+ * MSSIM command defines its own transport buffer and the command is
+ * sent in the first u32 array.  The only modification we make is that
+ * the MSSIM uses network order and we use the endianness of the
+ * architecture.  The response to every command (in the same buffer)
+ * is a u32 size preceded array.  Most of the MSSIM commands simply
+ * return zero here because they have no defined response.
+ *
+ * The only command with a defined request/response size is TPM_SEND_COMMAND
+ * The definition is in the structures below
+ */
+struct tpm_platform_ops {
+	int (*sendrcv)(u8 *buffer);
+};
+
+/**
+ * struct tpm_send_cmd_req - Structure for a TPM_SEND_COMMAND
+ *
+ * @cmd:	The command (must be TPM_SEND_COMMAND)
+ * @locality:	The locality
+ * @inbuf_size:	The size of the input buffer following
+ * @inbuf:	A buffer of size inbuf_size
+ *
+ * Note that MSSIM expects @inbuf_size to be equal to the size of the
+ * specific TPM command, otherwise an TPM_RC_COMMAND_SIZE error is
+ * returned.
+ */
+struct tpm_send_cmd_req {
+	u32	cmd;
+	u8	locality;
+	u32	inbuf_size;
+	u8	inbuf[];
+} __packed;
+
+/**
+ * struct tpm_req - generic request header for single word command
+ *
+ * @cmd:	The command to send
+ */
+struct tpm_req {
+	u32	cmd;
+} __packed;
+
+/**
+ * struct tpm_resp - generic response header
+ *
+ * @size:	The response size (zero if nothing follows)
+ *
+ * Note: most MSSIM commands simply return zero here with no indication
+ * of success or failure.
+ */
+
+struct tpm_resp {
+	s32	size;
+} __packed;
+
diff --git a/drivers/char/tpm/tpm_platform.c b/drivers/char/tpm/tpm_platform.c
new file mode 100644
index 000000000000..b53d74344d61
--- /dev/null
+++ b/drivers/char/tpm/tpm_platform.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Platform based TPM emulator
+ *
+ * Copyright (C) 2023 James.Bottomley@HansenPartnership.com
+ *
+ * Designed to handle a simple function request/response single buffer
+ * TPM or vTPM rooted in the platform.  This device driver uses the
+ * MSSIM protocol from the official TCG reference implementation
+ *
+ * https://github.com/TrustedComputingGroup/TPM
+ *
+ * to communicate between the driver and the platform.  This is rich
+ * enough to allow platform operations like cancellation The platform
+ * should not act on platform commands like power on/off and reset
+ * which can disrupt the TPM guarantees.
+ *
+ * This driver is designed to be single threaded (one call in to the
+ * platform TPM at any one time).  The threading guarantees are
+ * provided by the chip mutex.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/tpm_platform.h>
+
+#include "tpm.h"
+
+static struct tpm_platform_ops *pops;
+
+static u8 *buffer;
+/*
+ * FIXME: before implementing locality we need to agree what it means
+ * to the platform
+ */
+static u8 locality;
+
+static int tpm_platform_send(struct tpm_chip *chip, u8 *buf, size_t len)
+{
+	int ret;
+	struct tpm_send_cmd_req *req = (struct tpm_send_cmd_req *)buffer;
+
+	if (len > TPM_PLATFORM_MAX_BUFFER - sizeof(*req))
+		return -EINVAL;
+	req->cmd = TPM_SEND_COMMAND;
+	req->locality = locality;
+	req->inbuf_size = len;
+	memcpy(req->inbuf, buf, len);
+
+	ret = pops->sendrcv(buffer);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int tpm_platform_recv(struct tpm_chip *chip, u8 *buf, size_t len)
+{
+	struct tpm_resp *resp = (struct tpm_resp *)buffer;
+
+	if (resp->size < 0)
+		return resp->size;
+
+	if (len < resp->size)
+		return -E2BIG;
+
+	if (resp->size > TPM_PLATFORM_MAX_BUFFER - sizeof(*resp))
+		return -EINVAL;  // Invalid response from the platform TPM
+
+	memcpy(buf, buffer + sizeof(*resp), resp->size);
+
+	return resp->size;
+}
+
+static struct tpm_class_ops tpm_chip_ops = {
+	.flags = TPM_OPS_AUTO_STARTUP,
+	.send = tpm_platform_send,
+	.recv = tpm_platform_recv,
+};
+
+static struct platform_driver tpm_platform_driver = {
+	.driver = {
+		.name = "tpm",
+	},
+};
+
+static int __init tpm_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tpm_chip *chip;
+	int err;
+
+	if (!dev->platform_data)
+		return -ENODEV;
+
+	/*
+	 * in theory platform matching should mean this is always
+	 * true, but just in case anyone tries force binding
+	 */
+	if (strcmp(pdev->name, tpm_platform_driver.driver.name) != 0)
+		return -ENODEV;
+
+	if (!buffer)
+		buffer = kmalloc(TPM_PLATFORM_MAX_BUFFER, GFP_KERNEL);
+
+	if (!buffer)
+		return -ENOMEM;
+
+	pops = dev->platform_data;
+
+	chip = tpmm_chip_alloc(dev, &tpm_chip_ops);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	/*
+	 * Setting TPM_CHIP_FLAG_IRQ guarantees that ->recv will be
+	 * called straight after ->send and means we don't need to
+	 * implement any other chip ops.
+	 */
+	chip->flags |= TPM_CHIP_FLAG_IRQ;
+	err = tpm2_probe(chip);
+	if (err)
+		return err;
+
+	err = tpm_chip_register(chip);
+	if (err)
+		return err;
+
+	dev_info(dev, "TPM %s platform device\n",
+		 (chip->flags & TPM_CHIP_FLAG_TPM2) ? "2.0" : "1.2");
+
+	return 0;
+}
+
+module_platform_driver_probe(tpm_platform_driver, tpm_platform_probe);
+
+MODULE_AUTHOR("James Bottomley <James.Bottomley@HansenPartnership.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Platform TPM Driver");
+MODULE_ALIAS("platform:tpm");
diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 0fc9a510e059..b162f59305ef 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -225,5 +225,12 @@ config TCG_FTPM_TEE
 	help
 	  This driver proxies for firmware TPM running in TEE.
 
+config TCG_PLATFORM
+	tristate "Platform TPM Device"
+	help
+	  This driver requires a platform implementation to provide the
+	  TPM function.  It will not bind if the implementation is not
+	  present.
+
 source "drivers/char/tpm/st33zp24/Kconfig"
 endif # TCG_TPM
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 9bb142c75243..4b2c04e23bd3 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -44,3 +44,4 @@ obj-$(CONFIG_TCG_XEN) += xen-tpmfront.o
 obj-$(CONFIG_TCG_CRB) += tpm_crb.o
 obj-$(CONFIG_TCG_VTPM_PROXY) += tpm_vtpm_proxy.o
 obj-$(CONFIG_TCG_FTPM_TEE) += tpm_ftpm_tee.o
+obj-$(CONFIG_TCG_PLATFORM) += tpm_platform.o
-- 
2.47.1

