Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6F377
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 01:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPcVpDSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697764609; x=1729300609;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jh/Yc8SoC9zos6+YRphKef5pCNuzurYG/EOsA+9eN1c=;
  b=EPcVpDSkkq4g/JhufwDsIZ0doZoxSlcWacxchUNRmoMU3WeHhaZOSYqx
   ThtcbM0pQO3G9fJ5HDwZRhxvYsy8dVbLqv3DpC3OzsUjXy+rU43ZM/F22
   gJmevmrEpuRxtINtuVctioqabJ7F46DKWPWU8pFzh8zjflYg2i7lZ0Xvi
   hoXL8pfeuRem02R4wcYKhtXcfrW2xER7ynm+8SsXAeguZVNh8jlhKKYHu
   E/FvkKg0jvdtyvkXwGmYY+4aE/AArD/8wW3KtIyZFppdI3k39AHov7BAS
   BmL9p6J3QGoYPbJwPapz43nTHd5iuDhiM93+hE2S7fGSiaWkhCnutfFcM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452886063"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="452886063"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 18:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733793481"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="733793481"
Received: from hilldani-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.27.118])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 18:16:48 -0700
Subject: [PATCH v7 4/7] virt: sevguest: Prep for kernel internal
 get_ext_report()
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, peterz@infradead.org,
 dave.hansen@linux.intel.com, x86@kernel.org
Date: Thu, 19 Oct 2023 18:16:48 -0700
Message-ID: <169776460837.1705513.5859428460464277772.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

In preparation for using the configs-tsm facility to convey attestation
blobs to userspace, switch to using the 'sockptr' api for copying
payloads to provided buffers where 'sockptr' handles user vs kernel
buffers.

While configfs-tsm is meant to replace existing confidential computing
ioctl() implementations for attestation report retrieval the old ioctl()
path needs to stick around for a deprecation period.

No behavior change intended.

Cc: Borislav Petkov <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dionna Glaze <dionnaglaze@google.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/coco/sev-guest/sev-guest.c |   44 +++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 5bee58ef5f1e..e5f8f115f4af 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -19,6 +19,7 @@
 #include <crypto/aead.h>
 #include <linux/scatterlist.h>
 #include <linux/psp-sev.h>
+#include <linux/sockptr.h>
 #include <uapi/linux/sev-guest.h>
 #include <uapi/linux/psp-sev.h>
 
@@ -475,6 +476,11 @@ static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code,
 	return 0;
 }
 
+struct snp_req_resp {
+	sockptr_t req_data;
+	sockptr_t resp_data;
+};
+
 static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg)
 {
 	struct snp_guest_crypto *crypto = snp_dev->crypto;
@@ -555,22 +561,25 @@ static int get_derived_key(struct snp_guest_dev *snp_dev, struct snp_guest_reque
 	return rc;
 }
 
-static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg)
+static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg,
+			  struct snp_req_resp *io)
+
 {
 	struct snp_ext_report_req *req = &snp_dev->req.ext_report;
 	struct snp_guest_crypto *crypto = snp_dev->crypto;
 	struct snp_report_resp *resp;
 	int ret, npages = 0, resp_len;
+	sockptr_t certs_address;
 
 	lockdep_assert_held(&snp_cmd_mutex);
 
-	if (!arg->req_data || !arg->resp_data)
+	if (sockptr_is_null(io->req_data) || sockptr_is_null(io->resp_data))
 		return -EINVAL;
 
-	if (copy_from_user(req, (void __user *)arg->req_data, sizeof(*req)))
+	if (copy_from_sockptr(req, io->req_data, sizeof(*req)))
 		return -EFAULT;
 
-	/* userspace does not want certificate data */
+	/* caller does not want certificate data */
 	if (!req->certs_len || !req->certs_address)
 		goto cmd;
 
@@ -578,8 +587,13 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 	    !IS_ALIGNED(req->certs_len, PAGE_SIZE))
 		return -EINVAL;
 
-	if (!access_ok((const void __user *)req->certs_address, req->certs_len))
-		return -EFAULT;
+	if (sockptr_is_kernel(io->resp_data)) {
+		certs_address = KERNEL_SOCKPTR((void *)req->certs_address);
+	} else {
+		certs_address = USER_SOCKPTR((void __user *)req->certs_address);
+		if (!access_ok(certs_address.user, req->certs_len))
+			return -EFAULT;
+	}
 
 	/*
 	 * Initialize the intermediate buffer with all zeros. This buffer
@@ -609,21 +623,19 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 	if (arg->vmm_error == SNP_GUEST_VMM_ERR_INVALID_LEN) {
 		req->certs_len = snp_dev->input.data_npages << PAGE_SHIFT;
 
-		if (copy_to_user((void __user *)arg->req_data, req, sizeof(*req)))
+		if (copy_to_sockptr(io->req_data, req, sizeof(*req)))
 			ret = -EFAULT;
 	}
 
 	if (ret)
 		goto e_free;
 
-	if (npages &&
-	    copy_to_user((void __user *)req->certs_address, snp_dev->certs_data,
-			 req->certs_len)) {
+	if (npages && copy_to_sockptr(certs_address, snp_dev->certs_data, req->certs_len)) {
 		ret = -EFAULT;
 		goto e_free;
 	}
 
-	if (copy_to_user((void __user *)arg->resp_data, resp, sizeof(*resp)))
+	if (copy_to_sockptr(io->resp_data, resp, sizeof(*resp)))
 		ret = -EFAULT;
 
 e_free:
@@ -636,6 +648,7 @@ static long snp_guest_ioctl(struct file *file, unsigned int ioctl, unsigned long
 	struct snp_guest_dev *snp_dev = to_snp_dev(file);
 	void __user *argp = (void __user *)arg;
 	struct snp_guest_request_ioctl input;
+	struct snp_req_resp io;
 	int ret = -ENOTTY;
 
 	if (copy_from_user(&input, argp, sizeof(input)))
@@ -664,7 +677,14 @@ static long snp_guest_ioctl(struct file *file, unsigned int ioctl, unsigned long
 		ret = get_derived_key(snp_dev, &input);
 		break;
 	case SNP_GET_EXT_REPORT:
-		ret = get_ext_report(snp_dev, &input);
+		/*
+		 * As get_ext_report() may be called from the ioctl() path and a
+		 * kernel internal path (configfs-tsm), decorate the passed
+		 * buffers as user pointers.
+		 */
+		io.req_data = USER_SOCKPTR((void __user *)input.req_data);
+		io.resp_data = USER_SOCKPTR((void __user *)input.resp_data);
+		ret = get_ext_report(snp_dev, &input, &io);
 		break;
 	default:
 		break;

