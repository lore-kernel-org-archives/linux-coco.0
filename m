Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401C8F6B
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 21:03:03 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303IdN8l013018
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LC4VyaQtaA6GHsrOMQVk/B7OcprnCGzLD/Q+5axiFCk=;
 b=mxscvcwUHK6svwVNx/AE1C0KLSsdeP3tgxgrcW3i+nx6NeNRAarVXaFtpPKhCylyLZqO
 ef9a53xzmKRefQixJw1zOJxYYqk1l2qLcEeI2g9rRXCHY5GUe9EYMfxCQTZhidYWjxdn
 GaVAJrU4d/pCnA+0fjoz1V2IPPGtqsu0C6QMzaRn92/DPaCbw0vjDMUKl454DvxffS1g
 6HNL2gTn19FM0gJM6PaU7v5RHyRaZ7/xjd3I3lxu4QfOzhYFQifU2J6Vwb2BPrThw6TL
 xP63RUQuspAyRmG/WLGZ6YBhbUz/aeXOuGwrAcbDb18kprUgNiPQskidI+UPX0pWtqPv 7A== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvjk2e45w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 03 Jan 2023 21:03:01 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 303IblMR010043
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:03:00 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mtcq7by33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 03 Jan 2023 21:03:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 303L2xOK8192622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:03:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 224FB7805E
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:35:26 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFB5B7805C
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:35:25 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.64.53])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:35:25 +0000 (GMT)
Message-ID: <826af61ac2097a14eee0d81cb869eba9c4fdef8b.camel@linux.ibm.com>
Subject: [RFC 1/3] tpm: add generic platform device
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: linux-coco@lists.linux.dev
Date: Tue, 03 Jan 2023 16:02:58 -0500
In-Reply-To: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
References: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C-u9UgApR7kfSiK_m08773UaEL5WtFIR
X-Proofpoint-GUID: C-u9UgApR7kfSiK_m08773UaEL5WtFIR
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_07,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=790 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301030178

From: James Bottomley <James.Bottomley@HansenPartnership.com>

This is primarily designed to support an enlightened driver for the
AMD svsm based vTPM, but it could be used by any platform which
communicates with a TPM device.  The platform must fill in struct
tpm_platform_ops as the platform_data and set the device name to "tpm"
to have the binding by name work correctly.  The sole sendrecv
function is designed to do a single buffer request/response conforming
to the MSSIM protocol.  For the svsm vTPM case, this protocol is
transmitted directly to the SVSM, but it could be massaged for other
function type platform interfaces.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/char/tpm/Kconfig        |   7 ++
 drivers/char/tpm/Makefile       |   1 +
 drivers/char/tpm/tpm_platform.c | 138 ++++++++++++++++++++++++++++++++
 include/linux/tpm_platform.h    | 107 +++++++++++++++++++++++++
 4 files changed, 253 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_platform.c
 create mode 100644 include/linux/tpm_platform.h

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 4a5516406c22..c00ecec1d710 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -198,5 +198,12 @@ config TCG_FTPM_TEE
 	help
 	  This driver proxies for firmware TPM running in TEE.
 
+config TCG_PLATFORM
+	tristate "Platform TPM Device"
+	help
+	  This driver requires a platform implementation to provide
the
+	  TPM function.  It will not bind if the implementation is not
+	  present.
+
 source "drivers/char/tpm/st33zp24/Kconfig"
 endif # TCG_TPM
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 66d39ea6bd10..d87512a64ffd 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -41,3 +41,4 @@ obj-$(CONFIG_TCG_XEN) += xen-tpmfront.o
 obj-$(CONFIG_TCG_CRB) += tpm_crb.o
 obj-$(CONFIG_TCG_VTPM_PROXY) += tpm_vtpm_proxy.o
 obj-$(CONFIG_TCG_FTPM_TEE) += tpm_ftpm_tee.o
+obj-$(CONFIG_TCG_PLATFORM) += tpm_platform.o
diff --git a/drivers/char/tpm/tpm_platform.c
b/drivers/char/tpm/tpm_platform.c
new file mode 100644
index 000000000000..46d60fd23a0d
--- /dev/null
+++ b/drivers/char/tpm/tpm_platform.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Platform based TPM emulator
+ *
+ * Copyright (C) 2023 James.Bottomley@HansenPartnership.com
+ *
+ * Designed to handle a simple function request/response single buffer
+ * TPM or vTPM rooted in the platform.  This device driver uses the
+ * MSSIM protocol from the Microsoft reference implementation
+ *
+ * https://github.com/microsoft/ms-tpm-20-ref
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
+static int tpm_platform_send(struct tpm_chip *chip, u8 *buf, size_t
len)
+{
+	int ret;
+	struct tpm_send_cmd_req *req = (struct tpm_send_cmd_req
*)buffer;
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
+static int tpm_platform_recv(struct tpm_chip *chip, u8 *buf, size_t
len)
+{
+	struct tpm_resp *resp = (struct tpm_resp *)buffer;
+
+	if (resp->size < 0)
+		return resp->size;
+
+	if (len < resp->size)
+		return -E2BIG;
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
+	if(strcmp(pdev->name, tpm_platform_driver.driver.name) != 0)
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
+MODULE_AUTHOR("James Bottomley
<James.Bottomley@HansenPartnership.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Platform TPM Driver");
+MODULE_ALIAS("platform:tpm");
diff --git a/include/linux/tpm_platform.h
b/include/linux/tpm_platform.h
new file mode 100644
index 000000000000..a90089affe0b
--- /dev/null
+++ b/include/linux/tpm_platform.h
@@ -0,0 +1,107 @@
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
+ *
https://github.com/microsoft/ms-tpm-20-ref/blob/main/TPMCmd/Simulator/include/TpmTcpProtocol.h
+ */
+
+#define TPM_SEND_COMMAND		8
+#define TPM_SIGNAL_CANCEL_ON		9
+#define TPM_SIGNAL_CANCEL_OFF		10
+/*
+ * Any platform specific commands should be placed here and should
start
+ * at 0x8000 to avoid clashes with the MSSIM protocol.  They should
follow
+ * the same self describing buffer format below
+ */
+
+#define TPM_PLATFORM_MAX_BUFFER		4096 /* max req/resp
buffer size */
+
+/**
+ * struct tpm_platform_ops - the share platform operations
+ *
+ * @sendrecv:	Send a TPM command using the MSSIM protocol.
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
+ * The only command with a defined request/response size is
TPM_SEND_COMMAND
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
+ * Note that @inbuf_size must be large enough to hold the response so
+ * represents the maximum buffer size, not the size of the specific
+ * TPM command.
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
+ * Note: most MSSIM commands simply return zero here with no
indication
+ * of success or failure.
+ */
+
+struct tpm_resp {
+	s32	size;
+} __packed;
+
+
+
+
+
+/*
+ *
+ *  uint32_t TPM_SEND_COMMAND, uint8_t Locality, uint32_t
InBufferSize,
+ *    uint8_t[InBufferSize] InBuffer
+ *
+ * Where the InBufferSize must be big enough to hold the response
+ * because it represents the maximum allowable response size.  So if
+ * the first u32 is TPM_SEND_COMMAND, the minimum buffer size is
+ * 9. The response is
+ *
+ * uint32_t OutBufferSize, uint8_t[OutBufferSize] OutBuffer
+ * 
+ */
-- 
2.35.3


