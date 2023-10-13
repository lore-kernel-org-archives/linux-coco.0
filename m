Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A1A35
	for <linux-coco@lists.linux.dev>; Fri, 13 Oct 2023 02:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDWrSk5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697163249; x=1728699249;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FGP5GnOF217bOrSRsYw4B3DWPrkpjQxAzps+qo1V+KY=;
  b=DDWrSk5pqfmLy6k1Oh+yanhRuKz2L9HO1fjiy8mk9MHHHb7VflrI5xE3
   hS2Lp0z46uLdF4LDjz6mDTL2hl7c+CdN9QmsFrlT6hnFux5HIpGecEJqI
   Ux+WtmwombqT7hU6nGSscVlL+HI6KzwpEXB+QzkYOc59eG4zk3nsY5n+b
   AP2vFGgMjDILvHFLFG+Ed6gV2FP09gXcnQ9NmhYtwg2n13vLn+nnhu4CX
   1/+l33svYfxatD3Q/bqkVUNYLZG/Z2U7Z4dkwxiN2SyyLlvWLLni375Lo
   fw/E4zs+X7rJy29V5HvAB/f7Mts1V5LH4BbQazcJMh7aMxDhTfLZkEO6U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387940544"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="387940544"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820390863"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="820390863"
Received: from jamieko-mobl1.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.108.60])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:14:01 -0700
Subject: [PATCH v6 1/7] virt: sevguest: Fix passing a stack buffer as a
 scatterlist target
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 peterz@infradead.org, sathyanarayanan.kuppuswamy@linux.intel.com,
 dave.hansen@linux.intel.com, bp@alien8.de
Date: Thu, 12 Oct 2023 19:14:01 -0700
Message-ID: <169716324106.984874.16725001839918638832.stgit@dwillia2-xfh.jf.intel.com>
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

CONFIG_DEBUG_SG highlights that get_{report,ext_report,derived_key)()}
are passing stack buffers as the @req_buf argument to
handle_guest_request(), generating a Call Trace of the following form:

    WARNING: CPU: 0 PID: 1175 at include/linux/scatterlist.h:187 enc_dec_message+0x518/0x5b0 [sev_guest]
    [..]
    Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/26/2023
    RIP: 0010:enc_dec_message+0x518/0x5b0 [sev_guest]
    Call Trace:
     <TASK>
    [..]
     handle_guest_request+0x135/0x520 [sev_guest]
     get_ext_report+0x1ec/0x3e0 [sev_guest]
     snp_guest_ioctl+0x157/0x200 [sev_guest]

Note that the above Call Trace was with the DEBUG_SG BUG_ON()s converted
to WARN_ON()s.

This is benign as long as there are no hardware crypto accelerators
loaded for the aead cipher, and no subsequent dma_map_sg() is performed
on the scatterlist. However, sev-guest can not assume the presence of
an aead accelerator nor can it assume that CONFIG_DEBUG_SG is disabled.

Resolve this bug by allocating virt_addr_valid() memory, similar to the
other buffers am @snp_dev instance carries, to marshal requests from
user buffers to kernel buffers.

Reported-by: Peter Gonda <pgonda@google.com>
Closes: http://lore.kernel.org/r/CAMkAt6r2VPPMZ__SQfJse8qWsUyYW3AgYbOUVM0S_Vtk=KvkxQ@mail.gmail.com
Fixes: fce96cf04430 ("virt: Add SEV-SNP guest driver")
Cc: Borislav Petkov <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dionna Glaze <dionnaglaze@google.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>
Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/coco/sev-guest/sev-guest.c |   45 +++++++++++++++++--------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 97dbe715e96a..5bee58ef5f1e 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -57,6 +57,11 @@ struct snp_guest_dev {
 
 	struct snp_secrets_page_layout *layout;
 	struct snp_req_data input;
+	union {
+		struct snp_report_req report;
+		struct snp_derived_key_req derived_key;
+		struct snp_ext_report_req ext_report;
+	} req;
 	u32 *os_area_msg_seqno;
 	u8 *vmpck;
 };
@@ -473,8 +478,8 @@ static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code,
 static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg)
 {
 	struct snp_guest_crypto *crypto = snp_dev->crypto;
+	struct snp_report_req *req = &snp_dev->req.report;
 	struct snp_report_resp *resp;
-	struct snp_report_req req;
 	int rc, resp_len;
 
 	lockdep_assert_held(&snp_cmd_mutex);
@@ -482,7 +487,7 @@ static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_io
 	if (!arg->req_data || !arg->resp_data)
 		return -EINVAL;
 
-	if (copy_from_user(&req, (void __user *)arg->req_data, sizeof(req)))
+	if (copy_from_user(req, (void __user *)arg->req_data, sizeof(*req)))
 		return -EFAULT;
 
 	/*
@@ -496,7 +501,7 @@ static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_io
 		return -ENOMEM;
 
 	rc = handle_guest_request(snp_dev, SVM_VMGEXIT_GUEST_REQUEST, arg,
-				  SNP_MSG_REPORT_REQ, &req, sizeof(req), resp->data,
+				  SNP_MSG_REPORT_REQ, req, sizeof(*req), resp->data,
 				  resp_len);
 	if (rc)
 		goto e_free;
@@ -511,9 +516,9 @@ static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_io
 
 static int get_derived_key(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg)
 {
+	struct snp_derived_key_req *req = &snp_dev->req.derived_key;
 	struct snp_guest_crypto *crypto = snp_dev->crypto;
 	struct snp_derived_key_resp resp = {0};
-	struct snp_derived_key_req req;
 	int rc, resp_len;
 	/* Response data is 64 bytes and max authsize for GCM is 16 bytes. */
 	u8 buf[64 + 16];
@@ -532,11 +537,11 @@ static int get_derived_key(struct snp_guest_dev *snp_dev, struct snp_guest_reque
 	if (sizeof(buf) < resp_len)
 		return -ENOMEM;
 
-	if (copy_from_user(&req, (void __user *)arg->req_data, sizeof(req)))
+	if (copy_from_user(req, (void __user *)arg->req_data, sizeof(*req)))
 		return -EFAULT;
 
 	rc = handle_guest_request(snp_dev, SVM_VMGEXIT_GUEST_REQUEST, arg,
-				  SNP_MSG_KEY_REQ, &req, sizeof(req), buf, resp_len);
+				  SNP_MSG_KEY_REQ, req, sizeof(*req), buf, resp_len);
 	if (rc)
 		return rc;
 
@@ -552,8 +557,8 @@ static int get_derived_key(struct snp_guest_dev *snp_dev, struct snp_guest_reque
 
 static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg)
 {
+	struct snp_ext_report_req *req = &snp_dev->req.ext_report;
 	struct snp_guest_crypto *crypto = snp_dev->crypto;
-	struct snp_ext_report_req req;
 	struct snp_report_resp *resp;
 	int ret, npages = 0, resp_len;
 
@@ -562,18 +567,18 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 	if (!arg->req_data || !arg->resp_data)
 		return -EINVAL;
 
-	if (copy_from_user(&req, (void __user *)arg->req_data, sizeof(req)))
+	if (copy_from_user(req, (void __user *)arg->req_data, sizeof(*req)))
 		return -EFAULT;
 
 	/* userspace does not want certificate data */
-	if (!req.certs_len || !req.certs_address)
+	if (!req->certs_len || !req->certs_address)
 		goto cmd;
 
-	if (req.certs_len > SEV_FW_BLOB_MAX_SIZE ||
-	    !IS_ALIGNED(req.certs_len, PAGE_SIZE))
+	if (req->certs_len > SEV_FW_BLOB_MAX_SIZE ||
+	    !IS_ALIGNED(req->certs_len, PAGE_SIZE))
 		return -EINVAL;
 
-	if (!access_ok((const void __user *)req.certs_address, req.certs_len))
+	if (!access_ok((const void __user *)req->certs_address, req->certs_len))
 		return -EFAULT;
 
 	/*
@@ -582,8 +587,8 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 	 * the host. If host does not supply any certs in it, then copy
 	 * zeros to indicate that certificate data was not provided.
 	 */
-	memset(snp_dev->certs_data, 0, req.certs_len);
-	npages = req.certs_len >> PAGE_SHIFT;
+	memset(snp_dev->certs_data, 0, req->certs_len);
+	npages = req->certs_len >> PAGE_SHIFT;
 cmd:
 	/*
 	 * The intermediate response buffer is used while decrypting the
@@ -597,14 +602,14 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 
 	snp_dev->input.data_npages = npages;
 	ret = handle_guest_request(snp_dev, SVM_VMGEXIT_EXT_GUEST_REQUEST, arg,
-				   SNP_MSG_REPORT_REQ, &req.data,
-				   sizeof(req.data), resp->data, resp_len);
+				   SNP_MSG_REPORT_REQ, &req->data,
+				   sizeof(req->data), resp->data, resp_len);
 
 	/* If certs length is invalid then copy the returned length */
 	if (arg->vmm_error == SNP_GUEST_VMM_ERR_INVALID_LEN) {
-		req.certs_len = snp_dev->input.data_npages << PAGE_SHIFT;
+		req->certs_len = snp_dev->input.data_npages << PAGE_SHIFT;
 
-		if (copy_to_user((void __user *)arg->req_data, &req, sizeof(req)))
+		if (copy_to_user((void __user *)arg->req_data, req, sizeof(*req)))
 			ret = -EFAULT;
 	}
 
@@ -612,8 +617,8 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 		goto e_free;
 
 	if (npages &&
-	    copy_to_user((void __user *)req.certs_address, snp_dev->certs_data,
-			 req.certs_len)) {
+	    copy_to_user((void __user *)req->certs_address, snp_dev->certs_data,
+			 req->certs_len)) {
 		ret = -EFAULT;
 		goto e_free;
 	}

