Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6AC1842
	for <linux-coco@lists.linux.dev>; Mon, 14 Aug 2023 07:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691999007; x=1723535007;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZKEMKTZcxb+bR5sevS5HirhkX4iYwm8FNvR5plo9bz8=;
  b=VWEVNru1WosXoIKBAKM58S325WdDeF7SUP2fNWcoO1+fV7uNAWSDM1Z1
   Ql/6nLLzQpVrCAVAq7ERS0bDt0rcA7Bcjsoa3IAPSJeejHcrqYri7oGH5
   vz15PBBIg7AuvfMz1LLDqqagoLt01tSQ11UiLe59YEv8mJ+YBn2Us2az1
   1ezX/hzU8c7HbF0xCT/9+8E6+AX+KofTXZ2c7rS7jhN1wWovydkezHZGp
   Oi6QlQ0l/4LkYfRZVbaKDa/ujR+CN5FUvqy/A5yHczNyBwX7hURBhS3sB
   IA9V4DGEHKvPnu36mTxEK2Hz4ZDKAtWNg08BoP9SZwYPSlCuGE7wzupVY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="438314731"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="438314731"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 00:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="907142138"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="907142138"
Received: from navanban-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.127.25])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 00:43:27 -0700
Subject: [PATCH v2 3/5] virt: sevguest: Prep for kernel internal {get,
 get_ext}_report()
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>,
 peterz@infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 14 Aug 2023 00:43:26 -0700
Message-ID: <169199900677.1782217.12516417657696965559.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

In preparation for using the TSM key facility to convey attestation blobs
to userspace, add an argument to flag whether @arg is a user buffer or a
kernel buffer.

While TSM keys is meant to replace existing confidenital computing
ioctl() implementations for attestation report retrieval the old ioctl()
path needs to stick around for a deprecation period.

No behavior change intended, just introduce the copy wrappers and @type
argument.

Note that these wrappers are similar to copy_{to,from}_sockptr(). If
this approach moves forward that concept is something that can be
generalized into a helper with a generic name.

Cc: Borislav Petkov <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dionna Glaze <dionnaglaze@google.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/coco/sev-guest/sev-guest.c |   48 ++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 97dbe715e96a..f48c4764a7a2 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -470,7 +470,32 @@ static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code,
 	return 0;
 }
 
-static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg)
+enum snp_arg_type {
+	SNP_UARG,
+	SNP_KARG,
+};
+
+static unsigned long copy_from(void *to, unsigned long from, unsigned long n,
+			       enum snp_arg_type type)
+{
+	if (type == SNP_UARG)
+		return copy_from_user(to, (void __user *)from, n);
+	memcpy(to, (void *)from, n);
+	return 0;
+}
+
+static unsigned long copy_to(unsigned long to, const void *from,
+			     unsigned long n, enum snp_arg_type type)
+{
+	if (type == SNP_UARG)
+		return copy_to_user((void __user *)to, from, n);
+	memcpy((void *)to, from, n);
+	return 0;
+}
+
+static int get_report(struct snp_guest_dev *snp_dev,
+		      struct snp_guest_request_ioctl *arg,
+		      enum snp_arg_type type)
 {
 	struct snp_guest_crypto *crypto = snp_dev->crypto;
 	struct snp_report_resp *resp;
@@ -482,7 +507,7 @@ static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_io
 	if (!arg->req_data || !arg->resp_data)
 		return -EINVAL;
 
-	if (copy_from_user(&req, (void __user *)arg->req_data, sizeof(req)))
+	if (copy_from(&req, arg->req_data, sizeof(req), type))
 		return -EFAULT;
 
 	/*
@@ -501,7 +526,7 @@ static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_io
 	if (rc)
 		goto e_free;
 
-	if (copy_to_user((void __user *)arg->resp_data, resp, sizeof(*resp)))
+	if (copy_to(arg->resp_data, resp, sizeof(*resp), type))
 		rc = -EFAULT;
 
 e_free:
@@ -550,7 +575,9 @@ static int get_derived_key(struct snp_guest_dev *snp_dev, struct snp_guest_reque
 	return rc;
 }
 
-static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_ioctl *arg)
+static int get_ext_report(struct snp_guest_dev *snp_dev,
+			  struct snp_guest_request_ioctl *arg,
+			  enum snp_arg_type type)
 {
 	struct snp_guest_crypto *crypto = snp_dev->crypto;
 	struct snp_ext_report_req req;
@@ -562,7 +589,7 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 	if (!arg->req_data || !arg->resp_data)
 		return -EINVAL;
 
-	if (copy_from_user(&req, (void __user *)arg->req_data, sizeof(req)))
+	if (copy_from(&req, arg->req_data, sizeof(req), type))
 		return -EFAULT;
 
 	/* userspace does not want certificate data */
@@ -611,14 +638,13 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 	if (ret)
 		goto e_free;
 
-	if (npages &&
-	    copy_to_user((void __user *)req.certs_address, snp_dev->certs_data,
-			 req.certs_len)) {
+	if (npages && copy_to(req.certs_address, snp_dev->certs_data,
+			      req.certs_len, type)) {
 		ret = -EFAULT;
 		goto e_free;
 	}
 
-	if (copy_to_user((void __user *)arg->resp_data, resp, sizeof(*resp)))
+	if (copy_to(arg->resp_data, resp, sizeof(*resp), type))
 		ret = -EFAULT;
 
 e_free:
@@ -653,13 +679,13 @@ static long snp_guest_ioctl(struct file *file, unsigned int ioctl, unsigned long
 
 	switch (ioctl) {
 	case SNP_GET_REPORT:
-		ret = get_report(snp_dev, &input);
+		ret = get_report(snp_dev, &input, SNP_UARG);
 		break;
 	case SNP_GET_DERIVED_KEY:
 		ret = get_derived_key(snp_dev, &input);
 		break;
 	case SNP_GET_EXT_REPORT:
-		ret = get_ext_report(snp_dev, &input);
+		ret = get_ext_report(snp_dev, &input, SNP_UARG);
 		break;
 	default:
 		break;

