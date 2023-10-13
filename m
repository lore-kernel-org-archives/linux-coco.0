Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47487FC
	for <linux-coco@lists.linux.dev>; Fri, 13 Oct 2023 02:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwZNJgDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697163260; x=1728699260;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mdonGl/i/0BKQ8PQUIrcBW2HdwOpqtRUtLjK/eEDDYU=;
  b=WwZNJgDiU+hcnwGyh5wby76D9PTSpQaSvIx0fj7oVAi6oRjsWB335wy2
   YQrokilra52vqJHVYs4A7YC2olLWUWRJHGhw71ETe7hpyyaSKAbyj8KZf
   /XNnKqCP2OgfVQ8lBb1pqmUCKrLYW7qoo4Uu7BUKRFaF038/0wVMZfj9G
   myFFPNHY/RnLfoQ+Hq/vpA8Kt4prpnng9fRVdkWzqOdNdvg3kOvaMKNeb
   GqdwmzouNw26jq3vJuQO8TPJ6sn7eQHXuL5lPiuL0SvTPQUBmr9iKMBTb
   gO0T3kx9+SCnT9BNxlpMvGgSKV8oZaW7511zSoQu5g7BE+MiYq6m7G+90
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364451972"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="364451972"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783957075"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783957075"
Received: from jamieko-mobl1.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.108.60])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:14:19 -0700
Subject: [PATCH v6 4/7] virt: sevguest: Prep for kernel internal
 get_ext_report()
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 peterz@infradead.org, sathyanarayanan.kuppuswamy@linux.intel.com,
 dave.hansen@linux.intel.com, bp@alien8.de
Date: Thu, 12 Oct 2023 19:14:18 -0700
Message-ID: <169716325872.984874.619152658914711562.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
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
Cc: Brijesh Singh <brijesh.singh@amd.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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

