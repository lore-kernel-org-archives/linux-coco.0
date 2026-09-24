Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6043C13EE
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223072; cv=none; b=i4Keq03tP99vxGs5A6ujynot4V0iJEIMloAME2P+weL9F7z5Awy6HwuvdhkZj+bdXB2jHH+W1164jBBH2FiYXZUo32qAxx0prw+O58kMPejzCHsj0py2Mldy8Dk3lWMnSxH1c1D2QT2skXhpjl7IOCX42l7j2Upe6NzcOg2csww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223072; c=relaxed/simple;
	bh=0T18OoCOMHVjohB+Bo7M221XR7tFQdFCwwrIBDlyGhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gb5gGH33a2Q4ful32pPG+cZKghx9tTOxbL+EL4PzA791BEfNoGVVHf72YzCmtwMCP5m5+073luokQJgjYOH9OhZ9T5/8cysn/AZhk/Ug/HZBIce2hlKQqbLddyop1hfP2a3ewY/2gkHsFYME+3aMsqNgqLj9jiND/8o/3G6hHXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g53ATk97; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g53ATk97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223071; x=1821759071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0T18OoCOMHVjohB+Bo7M221XR7tFQdFCwwrIBDlyGhY=;
  b=g53ATk97vWkElMGfRtuOPpIjeM91yewv79e+Ym5Xs1yV1JavandcpV9n
   +43kJ+nCGdUNYqBaWFRN8z+4jd1vDV7zhJ4WSjlPl+76xdi4WY0hN77OX
   s2k2emtbjwCZe5NBAyiTfDhYKSTvNlZsOko+USO69L9E1GSAFy2wh6nkt
   JQ+HmTC9m0XtKUbqc+2gPEhTIJWNEdJYhNM9Wury0DZD1eiY973XjKlTT
   zJPmZkUb70dYJDNmL67KzpmyIiovjcof2JBXtsJCl1qt8SYi4xPOMKztF
   o4QKMSF4znAunoeXasLMXkTDQ2CxRkCNBTlJZ4xgeslJyblmit6Hwbuzo
   Q==;
X-CSE-ConnectionGUID: LAUmUzBUSsWlIrdijRU8KA==
X-CSE-MsgGUID: 7WWe/EvqTxm+tqllnNzA2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002481"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002481"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:11 -0700
X-CSE-ConnectionGUID: 8rzRJ5BXRI+E0eh/60mrsQ==
X-CSE-MsgGUID: XqidyVTYTmK9/DZUtz4GLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009366"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:06 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@intel.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	jgg@nvidia.com,
	nicolinc@nvidia.com,
	aik@amd.com,
	aneesh.kumar@kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	yilun.xu@linux.intel.com,
	chao.gao@intel.com,
	vishal.l.verma@intel.com,
	xiaoyao.li@intel.com,
	kevin.tian@intel.com,
	chao.p.peng@intel.com
Subject: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO support check
Date: Thu, 24 Sep 2026 12:10:22 +0800
Message-ID: <20260924041032.1096569-6-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement internal helper wrappers tdx_tdcm_alloc(), tdx_tdcm_run(),
and tdx_tdcm_free() to manage execution context lifecycle for TDX Connect
TEE-IO Device Control and Management (TDCM) commands.

Use these infrastructures to deploy all TDCM commands to orchestrate
trusted device management, beginning with the first command,
TDCM_OP_CHECK_TEEIO_SUPP, executed during the secure device locking
sequence.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 arch/x86/include/asm/tdx.h            |  48 +++++++++
 drivers/virt/coco/tdx-guest/connect.c | 139 ++++++++++++++++++++++++++
 2 files changed, 187 insertions(+)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 4937e23d5483..71cd701d346f 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -105,6 +105,54 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data);
 u64 tdx_hcall_get_quote(u8 *buf, size_t size);
 
 #ifdef CONFIG_TDX_CONNECT_GUEST
+enum tdcm_operation {
+	TDCM_OP_CHECK_TEEIO_SUPP	= 1,
+	TDCM_OP_BIND			= 2,
+	TDCM_OP_GET_DEV_INFO		= 3,
+	TDCM_OP_GET_TDI_REPORT		= 4,
+	TDCM_OP_START_TDI		= 5,
+	TDCM_OP_GET_TDI_STATE		= 6,
+	TDCM_OP_UNBIND			= 7,
+};
+
+enum tdcm_status {
+	TDCM_STATUS_WAIT		= 0,
+	TDCM_STATUS_COMPLETED		= 1,
+	TDCM_STATUS_ERROR		= 2,
+};
+
+enum tdcm_error {
+	TDCM_ERROR_TDX_MODULE		= 10,
+	TDCM_ERROR_TDXIO_DEVICE		= 11,
+	TDCM_ERROR_SPDM_MESSAGE		= 12,
+	TDCM_ERROR_IDE_KM_MESSAGE	= 13,
+	TDCM_ERROR_TDISP_MESSAGE	= 14,
+	TDCM_ERROR_INVALID_STATE	= 15,
+};
+
+struct tdvmcall_tdcm {
+	__u16 operation;  /* See enum tdcm_operation */
+	__u8  version;
+	__u8  rsvd0;
+	__u32 rsvd1;
+
+	__u8  status;     /* See enum tdcm_status */
+	__u8  error;      /* See enum tdcm_error */
+	__u16 rsvd2;
+	__u32 rsvd3;
+
+	__u32 data_length;
+
+	__u8  data[];
+} __packed;
+
+struct tdcm_rsp_check_teeio_supp {
+	__u8 is_supported;
+	__u8  data[];
+} __packed;
+
+#define MAX_TDI_REPORT_SIZE	(16 * PAGE_SIZE)
+
 u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector);
 int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *value);
 #endif
diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
index 80ae7c19e179..1f52a187b30f 100644
--- a/drivers/virt/coco/tdx-guest/connect.c
+++ b/drivers/virt/coco/tdx-guest/connect.c
@@ -7,13 +7,127 @@
 
 #define pr_fmt(fmt)		KBUILD_MODNAME ": tdx_connect: " fmt
 
+#include <linux/iopoll.h>
 #include <linux/pci.h>
 #include <linux/pci-tsm.h>
+#include <linux/set_memory.h>
 #include <linux/tsm.h>
 #include <asm/tdx.h>
 
 #include "tdx-guest.h"
 
+/**
+ * struct tdcm_ctx - TEE-IO Device Configuration and Management (TDCM) context
+ * @buf: Pointer to 4KB-aligned shared memory (>= one page) used as the command
+ *       buffer on input and the response buffer on output.
+ * @buf_size: Total size of the shared memory buffer.
+ * @max_rsp_data_sz: Maximum expected size of the response data.
+ * @rsp_data_sz: Actual size of the response data populated by the VMM.
+ * @devid: Device Identifier.
+ */
+struct tdcm_ctx {
+	struct tdvmcall_tdcm *buf;
+	size_t buf_size;
+	u32 max_rsp_data_sz;
+	u32 rsp_data_sz;
+	u16 devid;
+};
+
+#define to_tdcm_rsp_data(tdcm)	((tdcm)->buf->data)
+
+#define TDCM_POLL_DELAY_US	10000
+#define TDCM_POLL_TIMEOUT_US	(10 * USEC_PER_SEC)
+
+static int tdx_tdcm_run(struct tdcm_ctx *tdcm)
+{
+	struct tdvmcall_tdcm *buf = tdcm->buf;
+	u8 status;
+	int ret;
+	u64 r;
+
+	r = tdx_hcall_tdcm(tdcm->devid, buf, tdcm->buf_size, 0);
+	if (r)
+		return -EFAULT;
+
+	ret = read_poll_timeout(READ_ONCE, status, status != TDCM_STATUS_WAIT,
+				TDCM_POLL_DELAY_US, TDCM_POLL_TIMEOUT_US, false, buf->status);
+	if (ret) {
+		pr_err("TDCM request %d timed out\n", buf->operation);
+		return ret;
+	}
+
+	/* Ensure subsequent data reads are ordered after the status observation */
+	virt_rmb();
+
+	/*
+	 * Cache VMM response data length to avoid referencing buf->data_length
+	 * directly in case a malicious VMM changes buf->data_length between the
+	 * validation below and the subsequent reads.
+	 */
+	tdcm->rsp_data_sz = READ_ONCE(buf->data_length);
+
+	if (status != TDCM_STATUS_COMPLETED || tdcm->rsp_data_sz > tdcm->max_rsp_data_sz ||
+	    (tdcm->max_rsp_data_sz && !tdcm->rsp_data_sz)) {
+		pr_err("TDCM request %d failed: status 0x%x, error 0x%x, max_rsp_data_sz 0x%x, returned 0x%x\n",
+		       buf->operation, status, buf->error, tdcm->max_rsp_data_sz,
+		       tdcm->rsp_data_sz);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static struct tdcm_ctx *tdx_tdcm_alloc(struct pci_dev *pdev, u8 operation,
+				       size_t cmd_data_sz, size_t rsp_data_sz)
+{
+	struct tdvmcall_tdcm *buf;
+	size_t buf_size;
+	int ret;
+
+	buf_size = max(cmd_data_sz, rsp_data_sz);
+	buf_size = struct_size_t(struct tdvmcall_tdcm, data, buf_size);
+	buf_size = PAGE_ALIGN(buf_size);
+
+	struct tdcm_ctx *tdcm __free(kfree) = kzalloc(sizeof(*tdcm), GFP_KERNEL);
+	if (!tdcm)
+		return ERR_PTR(-ENOMEM);
+
+	buf = alloc_pages_exact(buf_size, GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	ret = set_memory_decrypted((unsigned long)buf, PHYS_PFN(buf_size));
+	if (ret) {
+		free_pages_exact(buf, buf_size);
+		return ERR_PTR(ret);
+	}
+
+	memset(buf, 0, buf_size);
+	buf->operation = operation;
+	buf->status = TDCM_STATUS_WAIT;
+	buf->data_length = cmd_data_sz;
+
+	tdcm->buf = buf;
+	tdcm->buf_size = buf_size;
+	tdcm->max_rsp_data_sz = rsp_data_sz;
+	tdcm->devid = pci_dev_id(pdev);
+
+	return_ptr(tdcm);
+}
+
+static void tdx_tdcm_free(struct tdcm_ctx *tdcm)
+{
+	if (set_memory_encrypted((unsigned long)tdcm->buf, PHYS_PFN(tdcm->buf_size)))
+		pr_err("Failed to encrypt TDCM buf, leak it\n");
+	else
+		free_pages_exact(tdcm->buf, tdcm->buf_size);
+
+	kfree(tdcm);
+}
+
+DEFINE_FREE(tdx_tdcm_free, struct tdcm_ctx *,
+	if (!IS_ERR_OR_NULL(_T)) tdx_tdcm_free(_T))
+
 struct tdx_devsec {
 	struct pci_tsm_devsec pci;
 };
@@ -23,6 +137,28 @@ static struct tdx_devsec *to_tdx_devsec(struct pci_tsm *tsm)
 	return container_of(tsm, struct tdx_devsec, pci.base_tsm);
 }
 
+static bool tdx_is_dev_teeio_support(struct tdx_devsec *tdevsec)
+{
+	struct pci_dev *pdev = tdevsec->pci.base_tsm.pdev;
+	struct tdcm_rsp_check_teeio_supp *rsp;
+	int ret;
+
+	struct tdcm_ctx *tdcm __free(tdx_tdcm_free) =
+		tdx_tdcm_alloc(pdev, TDCM_OP_CHECK_TEEIO_SUPP, 0, sizeof(*rsp));
+	if (IS_ERR(tdcm))
+		return false;
+
+	ret = tdx_tdcm_run(tdcm);
+	if (ret)
+		return false;
+
+	if (tdcm->rsp_data_sz != sizeof(*rsp))
+		return false;
+
+	rsp = (struct tdcm_rsp_check_teeio_supp *)to_tdcm_rsp_data(tdcm);
+	return !!rsp->is_supported;
+}
+
 static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
 {
 	int ret;
@@ -35,6 +171,9 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
 	if (ret)
 		return ERR_PTR(ret);
 
+	if (!tdx_is_dev_teeio_support(tdevsec))
+		return ERR_PTR(-EOPNOTSUPP);
+
 	return &no_free_ptr(tdevsec)->pci.base_tsm;
 }
 
-- 
2.52.0

