Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F8D354F6
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="La//Ce0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697002067; x=1728538067;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oj1DVsciywRdCYgg5NWbHAjtb/Z2QB8aHAHdJytRB4A=;
  b=La//Ce0ejLNSLbN/6/ISi4hYDO8IoJzFlrM3pnnXT/FgaJPfOnLMJ9gV
   89xrQo/EHx7RjvCEivHJqZ76a1wDZMA5r9mfjaz366NCwOlocm8j9oEma
   VXhtifBysZU/8mbwIKjZAhY0JFC0fJzpiaaPrv0cuBlDTUIkmEV3XgL1o
   bQkH/2rFIb5OX9AWOnRt7BWTD9h20NDBS0siLgVQ0Kod9HOh2Pj0ROJ5g
   ewEjgTl2DJR4VuAUjF4Et5uORHgBM500JsPFoycGzW+JzVdqVvKmnYfUP
   26vuam6I7Lfp05XPDA2mxWbJMwbKZt8wlcWUr6S81I9IbJvSkRylQECxu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387424365"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="387424365"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 22:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747322623"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="747322623"
Received: from mghorpad-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.251.2.142])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 22:27:46 -0700
Subject: [PATCH v5 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, peterz@infradead.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, dave.hansen@linux.intel.com,
 bp@alien8.de
Date: Tue, 10 Oct 2023 22:27:46 -0700
Message-ID: <169700206636.779347.12625001287120171667.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
References: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
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
    hexdump -C $report/outblob
    cat $report/certs
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
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/coco/sev-guest/Kconfig     |    1 
 drivers/virt/coco/sev-guest/sev-guest.c |  139 +++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)

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
index e5f8f115f4af..7fdc5a774eab 100644
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
 
@@ -768,6 +770,135 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
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
+	int certs_size = 0, cert_count, i, offset;
+	struct tsm_desc *desc = &report->desc;
+	struct snp_guest_dev *snp_dev = data;
+	struct snp_msg_report_resp_hdr hdr;
+	const int report_size = SZ_4K;
+	const int ext_size = SZ_16K;
+	int ret, size = report_size + ext_size;
+	u8 *certs_address;
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
+		mutex_unlock(&snp_cmd_mutex);
+		return -ENOTTY;
+	}
+
+	certs_address = buf + report_size;
+	struct snp_ext_report_req ext_req = {
+		.data = { .vmpl = desc->privlevel },
+		.certs_address = (__u64)certs_address,
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
+	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
+		struct snp_msg_cert_entry *certs = buf + report_size;
+
+		if (memcmp(&certs[i], &zero_ent, sizeof(zero_ent)) == 0)
+			break;
+		certs_size += certs[i].length;
+	}
+	cert_count = i;
+
+	/* No certs to report */
+	if (cert_count == 0)
+		return 0;
+
+	/* sanity check that the entire certs table with metadata fits */
+	if ((cert_count + 1) * sizeof(zero_ent) + certs_size > ext_size)
+		return -ENXIO;
+
+	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
+	if (!cbuf)
+		return -ENOMEM;
+
+	/* Concatenate returned certs */
+	for (i = 0, offset = 0; i < cert_count; i++) {
+		struct snp_msg_cert_entry *certs = buf + report_size;
+
+		memcpy(cbuf + offset, certs_address + certs[i].offset, certs[i].length);
+		offset += certs[i].length;
+	}
+
+	report->certs = no_free_ptr(cbuf);
+	report->certs_len = certs_size;
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
@@ -841,6 +972,14 @@ static int __init sev_guest_probe(struct platform_device *pdev)
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

