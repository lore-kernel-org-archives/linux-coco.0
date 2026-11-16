Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827393;
	b=UtomO97XaY2/GxeOvDuMxayae1tfhwPKIb8uG4uQKvlOqDkUlzKE/7L4vR9bGVtJm4nw
	 deWDkc7hcOMWT9tr3wC4doSWCyj85+fmX7VUGYzyZHCIVhCl9iaJc7+y246NPdRhbzCFk
	 8HDrMvF4kHjNDtf0gMqipTPxvcfTZmRkLsFdN/MXOf0lCoF3555DwX0P07gYLxmnl8eBC
	 rHNs6xEkFiPLT59bB0MimJNXt3l0tKpuXS2VYFiWEw1Yugnbey04t6xV+MrIjdCtyoHzh
	 E2i7H7NPq1gbigK65zZiO+ttXoEkDEYo1qP5lk6PGXfdH7thsnMr814cp7wFbPaZqig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827393;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P3cJOvgm1t/vUBV/SgDsnTWVy5reKbszdOnvyiXGN6k=;
	b=23MVx8jrlbvTvGqvlCyoTfia0YeMc8K99SEPFz36G/g6UvONOiwVmTmK0ii8J4zxT3KI
	 YbVmi6emWBuGo1aUirpHB05NT+rN025fW9znNJr/Odo0s7l5JEEHSjIquAZiFhMQJGZi9
	 Tmh6/JodSZskRxplo+HgXLR2agCGN9AZ5UGSBudsv5PCXK5Jv0vGYHwCBYlWSM7/3HrBH
	 cgoXqiqrHqKUacrVoZrIbD2IWJNDQyScnOBcE9W6sUcvwxUXmdlZFPvE6rseg1Sf1QeRs
	 ETBxxGIMIPx/aGQvhbxE5BoNtO9YZ5k2IOkiHeSRkx3f9RJiNPmGOOZfyd5QGluTu9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehJ6Jh7z;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E19E606FA49
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 11:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E19E606FA49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehJ6Jh7z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794827394; x=1826363394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WX4WJPA0q/4AFwvPGb2TbFrG51YgUZPK8MybkUla+48=;
  b=ehJ6Jh7zij9Uf3XkAM2MNyqmnGBngVPAY5GJmIjphuIPm+Ur0bBdQXUh
   wyVdlwx9iMPGM+ol/tPM95xXYbXaPwwKaysR41nMFSxoe8LkL4q/SJusf
   UOXWG9T+dirL1wqKzxo/c96Bm8ZjqnOWv9E7aKWZPXutJqUWEJlHGYGgs
   3xFFbkWaDk5j5VOUiT5Kq2kkC4O9+KxPAa+M18OOsytoeeCVXBP9DudpM
   y/wrhcWCfxLbpta47eaJAhnuPahNcKjrZ3Mv34rCsOPMjaE38KCbHu3jL
   k433OsaaOdQNwdzMi09DzbQ2rve+ILNed7JIUSzlDRFws75E+nJSEi+/i
   w==;
X-CSE-ConnectionGUID: JcsoRwG5QXGlw1CilaluXw==
X-CSE-MsgGUID: DUIJpIboRT2jtiLP6kfXpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3429609"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3429609"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:09:53 -0800
X-CSE-ConnectionGUID: 3YCKRXbhSay3EmMiCPSV/A==
X-CSE-MsgGUID: fl6FsRpvRGaeCKZWG1igZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9848122"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:09:53 -0800
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: rick.p.edgecombe@intel.com,
	kevin.tian@intel.com,
	yilun.xu@intel.com,
	chao.p.peng@intel.com,
	baolu.lu@linux.intel.com,
	chao.gao@intel.com,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [RFC PATCH 2/7] coco/tdx-host: Establish an SPDM session with the device
Date: Mon, 16 Nov 2026 03:10:20 -0800
Message-ID: <20261116111037.3478844-3-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261116111037.3478844-1-chao.gao@intel.com>
References: <20261116111037.3478844-1-chao.gao@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting up PCIe link encryption requires a secure channel to the device
to exchange keys. This channel is an SPDM session over the device's PCI
DOE mailbox.

The TDX module cannot access the DOE mailbox but needs to exchange SPDM
messages with the device, so the host relays SPDM messages between the
two.

TDH.SPDM.CONNECT establishes the session and TDH.SPDM.DISCONNECT tears
it down. Both may need several message exchanges with the device.
Whenever the TDX module has a message for the device, the SEAMCALL
returns with a dedicated status code. The host sends the message to the
device and calls the SEAMCALL again with the device's response, until
the SEAMCALL completes.

Call both SEAMCALLs in such a loop. The DOE transfer itself is a stub
for now.

Pass the messages through two pages per device, one for each direction.
One pair is enough because PCI/TSM serializes operations on a device.

The TDX module limits how many TDH.SPDM.CONNECT and TDH.SPDM.DISCONNECT
calls can run at the same time. The limit is implementation-specific,
and a call over the limit fails with TDX_OPERAND_BUSY. For simplicity,
serialize them across all devices with a mutex.

Based on work by Yilun.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 arch/x86/include/asm/shared/tdx_errno.h |   1 +
 drivers/virt/coco/tdx-host/main.c       | 131 +++++++++++++++++++++++-
 2 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/shared/tdx_errno.h b/arch/x86/include/asm/shared/tdx_errno.h
index ee411b360e20..6581cec7e097 100644
--- a/arch/x86/include/asm/shared/tdx_errno.h
+++ b/arch/x86/include/asm/shared/tdx_errno.h
@@ -27,6 +27,7 @@
 #define TDX_EPT_WALK_FAILED			0xC0000B0000000000ULL
 #define TDX_EPT_ENTRY_STATE_INCORRECT		0xC0000B0D00000000ULL
 #define TDX_METADATA_FIELD_NOT_READABLE		0xC0000C0200000000ULL
+#define TDX_SPDM_REQUEST			0x00000F5700000000ULL
 
 /*
  * TDX module operand ID, appears in 31:0 part of error code as
diff --git a/drivers/virt/coco/tdx-host/main.c b/drivers/virt/coco/tdx-host/main.c
index 919e77ae2326..32755d70dac5 100644
--- a/drivers/virt/coco/tdx-host/main.c
+++ b/drivers/virt/coco/tdx-host/main.c
@@ -44,11 +44,26 @@ static inline u32 tdisp_func_id(struct pci_dev *pdev)
 	return func_id;
 }
 
+#define SPDM_CAP_HBEAT		BIT(13)
+#define SPDM_CAP_KEY_UPD	BIT(14)
+
+struct spdm_config_info_t {
+	u32 vmm_spdm_cap;
+	u8 spdm_session_policy;
+	u8 certificate_slot_mask;
+	u8 raw_bitstream_requested;
+	u8 reserved[4089];
+} __packed;
+
+static_assert(sizeof(struct spdm_config_info_t) == 4096);
+
 struct tdx_tsm_link {
 	struct pci_tsm_pf0 pci;
 	u32 func_id;
 
 	u64 spdm_id;
+	struct page *in_msg;
+	struct page *out_msg;
 	unsigned int spdm_mt_nr_pages;
 	void *spdm_mt;
 };
@@ -58,9 +73,89 @@ static struct tdx_tsm_link *to_tdx_tsm_link(struct pci_tsm *tsm)
 	return container_of(tsm, struct tdx_tsm_link, pci.base_tsm);
 }
 
+static int tdx_spdm_msg_exchange(struct tdx_tsm_link *tlink)
+{
+	/* TODO: implement the PCI DOE transfer */
+	return 0;
+}
+
+/*
+ * When serving SEAMCALLs, the TDX module extensions work like service thread
+ * pools. The number of service threads is limited per service type (or
+ * "per extension" in terms of TDX). When the host issues a request via
+ * SEAMCALL but the TDX module can't find an available thread, it returns
+ * TDX_OPERAND_BUSY. Currently the thread number limit for the TDISP extension
+ * is 1. So a mutex could work to prevent SEAMCALL busy returns.
+ */
+static DEFINE_MUTEX(tdx_spdm_lock);
+
+static int tdx_spdm_xfer_handler(struct tdx_tsm_link *tlink, u64 sret,
+				 u64 out_msg_sz)
+{
+	int ret;
+
+	if (sret == TDX_SPDM_REQUEST) {
+		ret = tdx_spdm_msg_exchange(tlink);
+		if (ret < 0)
+			return ret;
+
+		return -EAGAIN;
+	}
+
+	if (sret == TDX_SUCCESS)
+		return 0;
+
+	return -EIO;
+}
+
+static int tdx_spdm_session_connect(struct tdx_tsm_link *tlink)
+{
+	struct spdm_config_info_t *spdm_conf;
+	u64 sret, out_msg_sz;
+	int ret;
+
+	/* create & fill SPDM configuration buffer - a single page */
+	spdm_conf = kzalloc_obj(*spdm_conf);
+	if (!spdm_conf)
+		return -ENOMEM;
+
+	spdm_conf->certificate_slot_mask = 0xff;
+
+	do {
+		mutex_lock(&tdx_spdm_lock);
+		sret = tdh_spdm_connect(tlink->spdm_id,
+					virt_to_page(spdm_conf),
+					tlink->in_msg, tlink->out_msg,
+					NULL, &out_msg_sz);
+		mutex_unlock(&tdx_spdm_lock);
+		ret = tdx_spdm_xfer_handler(tlink, sret, out_msg_sz);
+	} while (ret == -EAGAIN);
+
+	kfree(spdm_conf);
+
+	return ret;
+}
+
+static void tdx_spdm_session_disconnect(struct tdx_tsm_link *tlink)
+{
+	u64 sret, out_msg_sz;
+	int ret;
+
+	do {
+		mutex_lock(&tdx_spdm_lock);
+		sret = tdh_spdm_disconnect(tlink->spdm_id, tlink->in_msg,
+					   tlink->out_msg, &out_msg_sz);
+		mutex_unlock(&tdx_spdm_lock);
+		ret = tdx_spdm_xfer_handler(tlink, sret, out_msg_sz);
+	} while (ret == -EAGAIN);
+
+	WARN_ON(ret);
+}
+
 static int tdx_spdm_create(struct tdx_tsm_link *tlink)
 {
 	const struct tdx_sys_info *tdx_sysinfo = tdx_get_sysinfo();
+	struct page *in_msg_page, *out_msg_page;
 	struct tdx_hpa_list_info info;
 	unsigned int nr_pages;
 	u64 spdm_id, sret;
@@ -70,12 +165,21 @@ static int tdx_spdm_create(struct tdx_tsm_link *tlink)
 	if (!tdx_sysinfo)
 		return -ENXIO;
 
+	ret = -ENOMEM;
+	in_msg_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (!in_msg_page)
+		return ret;
+
+	out_msg_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (!out_msg_page)
+		goto out_free_in_msg;
+
 	nr_pages = tdx_sysinfo->tdx_connect.spdm_mt_page_count;
 
 	spdm_mt = alloc_pages_exact(nr_pages * PAGE_SIZE,
 				    GFP_KERNEL | __GFP_ZERO);
 	if (!spdm_mt)
-		return -ENOMEM;
+		goto out_free_out_msg;
 
 	ret = tdx_hpa_list_info_setup(&info, spdm_mt, nr_pages);
 	if (ret)
@@ -92,11 +196,17 @@ static int tdx_spdm_create(struct tdx_tsm_link *tlink)
 
 	tlink->spdm_id = spdm_id;
 	tlink->spdm_mt = spdm_mt;
+	tlink->in_msg = in_msg_page;
+	tlink->out_msg = out_msg_page;
 	tlink->spdm_mt_nr_pages = nr_pages;
 	return 0;
 
 out_free_spdm_mt:
 	free_pages_exact(spdm_mt, nr_pages * PAGE_SIZE);
+out_free_out_msg:
+	__free_page(out_msg_page);
+out_free_in_msg:
+	__free_page(in_msg_page);
 	return ret;
 }
 
@@ -112,16 +222,33 @@ static void tdx_spdm_delete(struct tdx_tsm_link *tlink)
 		return;
 	}
 
+	__free_page(tlink->in_msg);
+	__free_page(tlink->out_msg);
 	free_pages_exact(tlink->spdm_mt, tlink->spdm_mt_nr_pages * PAGE_SIZE);
 }
 
 static int tdx_spdm_session_setup(struct tdx_tsm_link *tlink)
 {
-	return tdx_spdm_create(tlink);
+	int ret;
+
+	ret = tdx_spdm_create(tlink);
+	if (ret)
+		return ret;
+
+	ret = tdx_spdm_session_connect(tlink);
+	if (ret)
+		goto out_spdm_delete;
+
+	return 0;
+
+out_spdm_delete:
+	tdx_spdm_delete(tlink);
+	return ret;
 }
 
 static void tdx_spdm_session_teardown(struct tdx_tsm_link *tlink)
 {
+	tdx_spdm_session_disconnect(tlink);
 	tdx_spdm_delete(tlink);
 }
 
-- 
2.52.0

