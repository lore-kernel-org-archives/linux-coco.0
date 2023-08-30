Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615B7482
	for <linux-coco@lists.linux.dev>; Wed, 30 Aug 2023 19:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693424012; x=1724960012;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yHkxxHhfcS/p1Zj4sNJBN+HXPs+0Ubf8u2ycubsIO3g=;
  b=SBeaC4Qyf5+PlBFTUMKA2ALHthlhb7WbfDQfjGX0XbNDmcws2nyW2YlC
   fC0LLvEWhG3IfVqTe1Kt0qj8bTltGl/KeZxfoCOfZlIpSThrP8o9vC2lX
   b4JTuyxbn4gpf7RIcjbyiisxzvd6Z8GWawER3BugZ07KaGEY6IVF49FS1
   zblQRNZ6GmAVS4DJcRvJj/+s7PyAs/bXWcL8XbYjY2wNse1fpajh0+8QS
   eu7iL9447xU/Y2x1GMfrHaEqSRo9JYTyBzglRbDSzXh/BszIyuncMSnPa
   lDvkoT9oh/ekkRzbA8oCPTTHWlhwBbL0rIs5zkIboXQ3F5MwWhDRo4oTB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360723642"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="360723642"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 12:33:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="853844831"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="853844831"
Received: from nivakuma-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.212.238.163])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 12:33:31 -0700
Subject: [PATCH v3 3/5] virt: sevguest: Prep for kernel internal {get,
 get_ext}_report()
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>,
 peterz@infradead.org, linux-kernel@vger.kernel.org, tglx@linutronix.de
Date: Wed, 30 Aug 2023 12:33:30 -0700
Message-ID: <169342401062.3934343.10039181536465702635.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
References: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
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
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/coco/sev-guest/sev-guest.c |   50 ++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 97dbe715e96a..c3c9e9ea691f 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -19,6 +19,7 @@
 #include <crypto/aead.h>
 #include <linux/scatterlist.h>
 #include <linux/psp-sev.h>
+#include <linux/sockptr.h>
 #include <uapi/linux/sev-guest.h>
 #include <uapi/linux/psp-sev.h>
 
@@ -470,7 +471,13 @@ static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code,
 	return 0;
 }
 
-static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg)
+struct snp_req_resp {
+	sockptr_t req_data;
+	sockptr_t resp_data;
+};
+
+static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg,
+		      struct snp_req_resp *io)
 {
 	struct snp_guest_crypto *crypto = snp_dev->crypto;
 	struct snp_report_resp *resp;
@@ -479,10 +486,10 @@ static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_io
 
 	lockdep_assert_held(&snp_cmd_mutex);
 
-	if (!arg->req_data || !arg->resp_data)
+	if (sockptr_is_null(io->req_data) || sockptr_is_null(io->resp_data))
 		return -EINVAL;
 
-	if (copy_from_user(&req, (void __user *)arg->req_data, sizeof(req)))
+	if (copy_from_sockptr(&req, io->req_data, sizeof(req)))
 		return -EFAULT;
 
 	/*
@@ -501,7 +508,7 @@ static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_io
 	if (rc)
 		goto e_free;
 
-	if (copy_to_user((void __user *)arg->resp_data, resp, sizeof(*resp)))
+	if (copy_to_sockptr(io->resp_data, resp, sizeof(*resp)))
 		rc = -EFAULT;
 
 e_free:
@@ -550,22 +557,25 @@ static int get_derived_key(struct snp_guest_dev *snp_dev, struct snp_guest_reque
 	return rc;
 }
 
-static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg)
+static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg,
+			  struct snp_req_resp *io)
+
 {
 	struct snp_guest_crypto *crypto = snp_dev->crypto;
 	struct snp_ext_report_req req;
 	struct snp_report_resp *resp;
 	int ret, npages = 0, resp_len;
+	sockptr_t certs_address;
 
 	lockdep_assert_held(&snp_cmd_mutex);
 
-	if (!arg->req_data || !arg->resp_data)
+	if (sockptr_is_null(io->req_data) || sockptr_is_null(io->resp_data))
 		return -EINVAL;
 
-	if (copy_from_user(&req, (void __user *)arg->req_data, sizeof(req)))
+	if (copy_from_sockptr(&req, io->req_data, sizeof(req)))
 		return -EFAULT;
 
-	/* userspace does not want certificate data */
+	/* caller does not want certificate data */
 	if (!req.certs_len || !req.certs_address)
 		goto cmd;
 
@@ -573,8 +583,13 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 	    !IS_ALIGNED(req.certs_len, PAGE_SIZE))
 		return -EINVAL;
 
-	if (!access_ok((const void __user *)req.certs_address, req.certs_len))
-		return -EFAULT;
+	if (sockptr_is_kernel(io->resp_data)) {
+		certs_address = KERNEL_SOCKPTR((void *)req.certs_address);
+	} else {
+		certs_address = USER_SOCKPTR((void __user *)req.certs_address);
+		if (!access_ok(certs_address.user, req.certs_len))
+			return -EFAULT;
+	}
 
 	/*
 	 * Initialize the intermediate buffer with all zeros. This buffer
@@ -604,21 +619,19 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 	if (arg->vmm_error == SNP_GUEST_VMM_ERR_INVALID_LEN) {
 		req.certs_len = snp_dev->input.data_npages << PAGE_SHIFT;
 
-		if (copy_to_user((void __user *)arg->req_data, &req, sizeof(req)))
+		if (copy_to_sockptr(io->req_data, &req, sizeof(req)))
 			ret = -EFAULT;
 	}
 
 	if (ret)
 		goto e_free;
 
-	if (npages &&
-	    copy_to_user((void __user *)req.certs_address, snp_dev->certs_data,
-			 req.certs_len)) {
+	if (npages && copy_to_sockptr(certs_address, snp_dev->certs_data, req.certs_len)) {
 		ret = -EFAULT;
 		goto e_free;
 	}
 
-	if (copy_to_user((void __user *)arg->resp_data, resp, sizeof(*resp)))
+	if (copy_to_sockptr(io->resp_data, resp, sizeof(*resp)))
 		ret = -EFAULT;
 
 e_free:
@@ -631,6 +644,7 @@ static long snp_guest_ioctl(struct file *file, unsigned int ioctl, unsigned long
 	struct snp_guest_dev *snp_dev = to_snp_dev(file);
 	void __user *argp = (void __user *)arg;
 	struct snp_guest_request_ioctl input;
+	struct snp_req_resp io;
 	int ret = -ENOTTY;
 
 	if (copy_from_user(&input, argp, sizeof(input)))
@@ -651,15 +665,17 @@ static long snp_guest_ioctl(struct file *file, unsigned int ioctl, unsigned long
 		return -ENOTTY;
 	}
 
+	io.req_data = USER_SOCKPTR((void __user *)input.req_data);
+	io.resp_data = USER_SOCKPTR((void __user *)input.resp_data);
 	switch (ioctl) {
 	case SNP_GET_REPORT:
-		ret = get_report(snp_dev, &input);
+		ret = get_report(snp_dev, &input, &io);
 		break;
 	case SNP_GET_DERIVED_KEY:
 		ret = get_derived_key(snp_dev, &input);
 		break;
 	case SNP_GET_EXT_REPORT:
-		ret = get_ext_report(snp_dev, &input);
+		ret = get_ext_report(snp_dev, &input, &io);
 		break;
 	default:
 		break;

