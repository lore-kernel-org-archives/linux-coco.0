Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E159A35
	for <linux-coco@lists.linux.dev>; Fri, 13 Oct 2023 02:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4O7j+mR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697163271; x=1728699271;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wZu4CEcSJiZHj/oKJrXazEHDcs4ZzhxiR3BIRAyZnH0=;
  b=P4O7j+mRSZK6XqpO6r8L7gG9+jE9Plrq8jd7foCq2c/zKayI/Zjyb43+
   HW9A4VFnTo7HO1YQg5xYW9wMtKxsS8y+SlQYTF/NWO4yTxBIBi/AoL7s8
   d+q3VnOZulz5ZM5QN0cUg2TwXGH6Hmb9o4fwR07+EanbjM/XWa6GdK+ms
   lbf8w2YvGJM6T+SsykOTEp16YBOi2iFAKxQCuxi6sMNp5PYjBCPjaqe+7
   oBPaG+ec0XCxpQnjQyy+W/NMu9Z5bxQ48RG1O64K7irxxG5RsdT/0UQMP
   Ceqg5wfU9AiecL9e5Qy3KfcpKt0/20Yk0JJQf8C/BX+JRoB21ESlvnJrF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364451991"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="364451991"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783957118"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783957118"
Received: from jamieko-mobl1.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.108.60])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:14:30 -0700
Subject: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 peterz@infradead.org, sathyanarayanan.kuppuswamy@linux.intel.com,
 dave.hansen@linux.intel.com, bp@alien8.de
Date: Thu, 12 Oct 2023 19:14:30 -0700
Message-ID: <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
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

Convert sevguest to use CONFIG_TSM_REPORTS to retrieve the data that
the SNP_GET_EXT_REPORT ioctl produces. An example flow follows for
retrieving the report blob via the TSM interface utility,
assuming no nonce and VMPL==2:

    report=/sys/kernel/config/tsm/report/report0
    mkdir $report
    echo 2 > $report/privlevel
    dd if=/dev/urandom bs=64 count=1 > $report/inblob
    hexdump -C $report/outblob # SNP report
    hexdump -C $report/auxblob # cert_table
    rmdir $report

Given that the platform implementation is free to return empty
certificate data if none is available it lets configfs-tsm be simplified
as it only needs to worry about wrapping SNP_GET_EXT_REPORT, and leave
SNP_GET_REPORT alone.

The old ioctls can be lazily deprecated, the main motivation of this
effort is to stop the proliferation of new ioctls, and to increase
cross-vendor collaboration.

Link: http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.com.notmuch [1]
Cc: Borislav Petkov <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dionna Glaze <dionnaglaze@google.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>
Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/coco/sev-guest/Kconfig     |    1 
 drivers/virt/coco/sev-guest/sev-guest.c |  133 +++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

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
index e5f8f115f4af..f3ca083127af 100644
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
 
@@ -768,6 +770,129 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
 	return key;
 }
 
+struct snp_msg_report_resp_hdr {
+	u32 status;
+	u32 report_size;
+	u8 rsvd[24];
+};
+#define SNP_REPORT_INVALID_PARAM 0x16
+#define SNP_REPORT_INVALID_KEY_SEL 0x27
+
+struct snp_msg_cert_entry {
+	unsigned char guid[16];
+	u32 offset;
+	u32 length;
+};
+
+static int sev_report_new(struct tsm_report *report, void *data)
+{
+	static const struct snp_msg_cert_entry zero_ent = { 0 };
+	struct snp_msg_cert_entry *cert_table;
+	struct tsm_desc *desc = &report->desc;
+	struct snp_guest_dev *snp_dev = data;
+	struct snp_msg_report_resp_hdr hdr;
+	const int report_size = SZ_4K;
+	const int ext_size = SEV_FW_BLOB_MAX_SIZE;
+	int ret, size = report_size + ext_size;
+	u32 certs_size, i;
+
+	if (desc->inblob_len != 64)
+		return -EINVAL;
+
+	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	guard(mutex)(&snp_cmd_mutex);
+
+	/* Check if the VMPCK is not empty */
+	if (is_vmpck_empty(snp_dev)) {
+		dev_err_ratelimited(snp_dev->dev, "VMPCK is disabled\n");
+		return -ENOTTY;
+	}
+
+	cert_table = buf + report_size;
+	struct snp_ext_report_req ext_req = {
+		.data = { .vmpl = desc->privlevel },
+		.certs_address = (__u64)cert_table,
+		.certs_len = ext_size,
+	};
+	memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
+
+	struct snp_guest_request_ioctl input = {
+		.msg_version = 1,
+		.req_data = (__u64)&ext_req,
+		.resp_data = (__u64)buf,
+		.exitinfo2 = 0xff,
+	};
+	struct snp_req_resp io = {
+		.req_data = KERNEL_SOCKPTR(&ext_req),
+		.resp_data = KERNEL_SOCKPTR(buf),
+	};
+
+	ret = get_ext_report(snp_dev, &input, &io);
+
+	if (ret)
+		return ret;
+
+	memcpy(&hdr, buf, sizeof(hdr));
+	if (hdr.status == SNP_REPORT_INVALID_PARAM)
+		return -EINVAL;
+	if (hdr.status == SNP_REPORT_INVALID_KEY_SEL)
+		return -EINVAL;
+	if (hdr.status)
+		return -ENXIO;
+	if ((hdr.report_size + sizeof(hdr)) > report_size)
+		return -ENOMEM;
+
+	void *rbuf __free(kvfree) = kvzalloc(hdr.report_size, GFP_KERNEL);
+	if (!rbuf)
+		return -ENOMEM;
+
+	memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
+	report->outblob = no_free_ptr(rbuf);
+	report->outblob_len = hdr.report_size;
+
+	certs_size = 0;
+	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
+		if (memcmp(&cert_table[i], &zero_ent, sizeof(zero_ent)) == 0)
+			break;
+		certs_size = max(certs_size, cert_table[i].offset + cert_table[i].length);
+	}
+
+	/* No certs to report */
+	if (!certs_size)
+		return 0;
+
+	/*
+	 * cert_table reports more data than fits in ext_size the
+	 * userspace cert_table walker can decide what happens next,
+	 * truncate the output
+	 */
+	if (certs_size > ext_size)
+		certs_size = ext_size;
+
+	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
+	if (!cbuf)
+		return -ENOMEM;
+
+	memcpy(cbuf, cert_table, certs_size);
+	report->auxblob = no_free_ptr(cbuf);
+	report->auxblob_len = certs_size;
+
+	return 0;
+}
+
+static const struct tsm_ops sev_tsm_ops = {
+	.name = KBUILD_MODNAME,
+	.report_new = sev_report_new,
+};
+
+static void unregister_sev_tsm(void *data)
+{
+	tsm_unregister(&sev_tsm_ops);
+}
+
 static int __init sev_guest_probe(struct platform_device *pdev)
 {
 	struct snp_secrets_page_layout *layout;
@@ -841,6 +966,14 @@ static int __init sev_guest_probe(struct platform_device *pdev)
 	snp_dev->input.resp_gpa = __pa(snp_dev->response);
 	snp_dev->input.data_gpa = __pa(snp_dev->certs_data);
 
+	ret = tsm_register(&sev_tsm_ops, snp_dev, &tsm_report_ext_type);
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

