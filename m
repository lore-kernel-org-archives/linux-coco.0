Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25627482
	for <linux-coco@lists.linux.dev>; Wed, 30 Aug 2023 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693424024; x=1724960024;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c+jEDPqTHm9uescgnXUEsEv+dnWGPwPiDy6A7HSsyBA=;
  b=DZdDe+8tbibbBTcK5hFC/ahog59e/pD9yvz0YZbwjwua1JpPdfkBpYDL
   H+Rcbng0sDptO7VEENvRwM2EieQb2ybYane9e/KI0deSOzmmYNlNOH+Id
   RqOjI6WY6FvwemHdP4N/iWOgbcp/0FdeGDnAddvG+t4kky7kCPeyVTVcK
   qSYQ1adtdEU9FXCDfU8JIczwciE4JWykUd+aX4p4HmD76ApqJSrXwxssu
   HhZFiXC0a9/PykUejL8c6b1w2CIoC81QceG1/zu0tH5osf9/8FzCNTEZz
   q2B3DVbudL2/q/ntlglAXHnbPmhQoYpSQ5LhuQf/c9FmMRZhC4TjBI0A5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360723676"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="360723676"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 12:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="853844918"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="853844918"
Received: from nivakuma-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.212.238.163])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 12:33:43 -0700
Subject: [PATCH v3 5/5] virt: sevguest: Add TSM_REPORTS support for SNP_{GET,
 GET_EXT}_REPORT
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>,
 peterz@infradead.org, linux-kernel@vger.kernel.org, tglx@linutronix.de
Date: Wed, 30 Aug 2023 12:33:42 -0700
Message-ID: <169342402274.3934343.11704206926819634506.stgit@dwillia2-xfh.jf.intel.com>
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

The sevguest driver was a first mover in the confidential computing
space. As a first mover that afforded some leeway to build the driver
without concern for common infrastructure.

Now that sevguest is no longer a singleton [1] the common operation of
building and transmitting attestation report blobs can / should be made
common. In this model the so called "TSM-provider" implementations can
share a common envelope ABI even if the contents of that envelope remain
vendor-specific. When / if the industry agrees on an attestation record
format, that definition can also fit in the same ABI. In the meantime
the kernel's maintenance burden is reduced and collaboration on the
commons is increased.

Convert sevguest to use CONFIG_TSM_REPORTS to retrieve the blobs that
the SNP_{GET,GET_EXT}_REPORT ioctls produce. An example flow follows for
retrieving the SNP_GET_REPORT blob via the TSM interface utility,
assuming no nonce and VMPL==2:

    report=/sys/kernel/config/tsm/report/report0
    mkdir $report
    echo 2 > $report/privlevel
    dd if=/dev/urandom bs=64 count=1 > $report/inblob
    hexdump -C $report/outblob
    rmdir $report

...while the SNP_GET_EXT_REPORT flow needs to additionally set the
format to "extended":

    report=/sys/kernel/config/tsm/report/report1
    mkdir $report
    echo extended > $report/format
    dd if=/dev/urandom bs=64 count=1 > $report/inblob
    hexdump -C $report/outblob
    rmdir $report

The old ioctls can be lazily deprecated, the main motivation of this
effort is to stop the proliferation of new ioctls, and to increase
cross-vendor collaboration.

Note, only compile-tested.

Link: http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.com.notmuch [1]
Cc: Borislav Petkov <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dionna Glaze <dionnaglaze@google.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/coco/sev-guest/Kconfig     |    1 
 drivers/virt/coco/sev-guest/sev-guest.c |   83 +++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/virt/coco/sev-guest/Kconfig b/drivers/virt/coco/sev-guest/Kconfig
index da2d7ca531f0..1cffc72c41cb 100644
--- a/drivers/virt/coco/sev-guest/Kconfig
+++ b/drivers/virt/coco/sev-guest/Kconfig
@@ -5,6 +5,7 @@ config SEV_GUEST
 	select CRYPTO
 	select CRYPTO_AEAD2
 	select CRYPTO_GCM
+	select TSM_REPORTS
 	help
 	  SEV-SNP firmware provides the guest a mechanism to communicate with
 	  the PSP without risk from a malicious hypervisor who wishes to read,
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index c3c9e9ea691f..c7bbb8f372a3 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -16,10 +16,12 @@
 #include <linux/miscdevice.h>
 #include <linux/set_memory.h>
 #include <linux/fs.h>
+#include <linux/tsm.h>
 #include <crypto/aead.h>
 #include <linux/scatterlist.h>
 #include <linux/psp-sev.h>
 #include <linux/sockptr.h>
+#include <linux/cleanup.h>
 #include <uapi/linux/sev-guest.h>
 #include <uapi/linux/psp-sev.h>
 
@@ -759,6 +761,79 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
 	return key;
 }
 
+static u8 *sev_report_new(const struct tsm_desc *desc, void *data, size_t *outblob_len)
+{
+	struct snp_guest_dev *snp_dev = data;
+	const int report_size = SZ_4K;
+	const int ext_size = SZ_16K;
+	int ret, size;
+
+	if (desc->inblob_len != 64)
+		return ERR_PTR(-EINVAL);
+
+	if (desc->outblob_format == TSM_FORMAT_EXTENDED)
+		size = report_size + ext_size;
+	else
+		size = report_size;
+
+	u8 *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
+
+	guard(mutex)(&snp_cmd_mutex);
+	if (desc->outblob_format == TSM_FORMAT_EXTENDED) {
+		struct snp_ext_report_req ext_req = {
+			.data = { .vmpl = desc->privlevel },
+			.certs_address = (__u64)buf + report_size,
+			.certs_len = ext_size,
+		};
+		memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
+
+		struct snp_guest_request_ioctl input = {
+			.msg_version = 1,
+			.req_data = (__u64)&ext_req,
+			.resp_data = (__u64)buf,
+		};
+		struct snp_req_resp io = {
+			.req_data = KERNEL_SOCKPTR(&ext_req),
+			.resp_data = KERNEL_SOCKPTR(buf),
+		};
+
+		ret = get_ext_report(snp_dev, &input, &io);
+	} else {
+		struct snp_report_req req = {
+			.vmpl = desc->privlevel,
+		};
+		memcpy(&req.user_data, desc->inblob, desc->inblob_len);
+
+		struct snp_guest_request_ioctl input = {
+			.msg_version = 1,
+			.req_data = (__u64)&req,
+			.resp_data = (__u64)buf,
+		};
+		struct snp_req_resp io = {
+			.req_data = KERNEL_SOCKPTR(&req),
+			.resp_data = KERNEL_SOCKPTR(buf),
+		};
+
+		ret = get_report(snp_dev, &input, &io);
+	}
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	*outblob_len = size;
+	return_ptr(buf);
+}
+
+static const struct tsm_ops sev_tsm_ops = {
+	.name = KBUILD_MODNAME,
+	.report_new = sev_report_new,
+};
+
+static void unregister_sev_tsm(void *data)
+{
+	unregister_tsm(&sev_tsm_ops);
+}
+
 static int __init sev_guest_probe(struct platform_device *pdev)
 {
 	struct snp_secrets_page_layout *layout;
@@ -832,6 +907,14 @@ static int __init sev_guest_probe(struct platform_device *pdev)
 	snp_dev->input.resp_gpa = __pa(snp_dev->response);
 	snp_dev->input.data_gpa = __pa(snp_dev->certs_data);
 
+	ret = register_tsm(&sev_tsm_ops, snp_dev, &tsm_report_ext_type);
+	if (ret)
+		goto e_free_cert_data;
+
+	ret = devm_add_action_or_reset(&pdev->dev, unregister_sev_tsm, NULL);
+	if (ret)
+		goto e_free_cert_data;
+
 	ret =  misc_register(misc);
 	if (ret)
 		goto e_free_cert_data;

