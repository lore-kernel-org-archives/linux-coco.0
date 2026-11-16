Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827397;
	b=gPGgNBwGSn2SzsJxk6M8eoU6xVK9YsWZC+eh8fgXD0tPPNmyr5CoyCKrU/qPtA0XHVNH
	 n5Zt5I7ymEyJbqgYPAJpGNIp6j7pf5Uri25sVIYzIdiyw+DXjyLD77/lGieKeNjUv+VOh
	 mEIyVZ6sHlHDLNJaWMQjjyMaJozHZJD2x1wDnoL9ZM2QnhCbHdA1fEis4Vbx5RTA6OWh7
	 rQyVXrUO9olN4lUbHyKoOqf6/Rc8HFl+8R7YvQc/XxVOEeU8oft6ElKVZOjTbH1nuI7d3
	 x6gUc0sf9tG1FRXetb7dvOtHasWcGJD89/3yCRY1ZRFVOKN7e4SLPk8l25iXq0SUnZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827397;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0hCtBUAYJKReef9NOWa2Bacr9JNdBEvcySxmI8OhtpE=;
	b=20XZxVVYBsWF+whI6JTIqJo7AChDk/wy6P4AYfyE/ykiGJ492q5lHu1h2DFolM5prpIs
	 Emks6Po4y+WRDi1UiHu/fwABDJO1JkQTewgYOoSVzOho+YJ0pTik9BWPqGe6TDsK8A1ye
	 d9kUhuRLRrHVmov+uiLvS37u6kTJHLdLEcBw/jxrElpW9UiRZWnY/5RftvQy9wFwcdJ2v
	 Go86rHf5hizpPsnA4p84+Xp/aedNoNIV0oQ7PKoo5YigphQYF1DAT0wz+1WYht+D3KuUt
	 UarwklVULwes3XCSgmYd6s3B8WiBogSR/3bgPyw8ok3JZp9p6UXWqYM+FpUwvadBEtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RDclvfoj;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73677607D22A
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 11:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73677607D22A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RDclvfoj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794827397; x=1826363397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OVIxJIE/I5SIUnCjJ5JkStY9lwhM2SXS9zZd3XbxvyA=;
  b=RDclvfojM1Evh4/y6coErW7xo/F/KwD6WOdXkwJbKKXKkK1ldMnDvqjL
   6p7y2ygxlQMVkbRae26RIpjuvdvF93X79Kvk1wJDY9NaUx5n0XX3Egp9b
   E7NcZeGCx4mG0dc+pZLC/mug4+S6zxHmT96EfE4lYPMPHA4hDHGUJy+ht
   +cpXlNCaLie9dFeSklioUoCW6jPrRtQwt9oUYGdXoxjs+7v2MTlkzX7gC
   Ki7tAEDLOhtzGAi5pCEq7LEneW2uRg/wKF2Gnzjw1o68ySYsc4d603NCL
   0LJYWZkrRw54DT8Gr7ZCgeuyQ3S1riEGSwTFanGFcs/i6rAuQOKpvIbOG
   g==;
X-CSE-ConnectionGUID: Zw+yEBdtTzG2zvFToAOmwA==
X-CSE-MsgGUID: YHkR9kZVTHO7N5e2H7BqFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3429630"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3429630"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:09:57 -0800
X-CSE-ConnectionGUID: nriNDE8OQpeJ1fY3idGMMw==
X-CSE-MsgGUID: bC8d151OS9aiAFX1v1ZT4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9848134"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:09:56 -0800
From: Chao Gao <chao.gao@intel.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: rick.p.edgecombe@intel.com,
	kevin.tian@intel.com,
	yilun.xu@intel.com,
	chao.p.peng@intel.com,
	baolu.lu@linux.intel.com,
	chao.gao@intel.com,
	Kiryl Shutsemau <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [RFC PATCH 6/7] coco/tdx-host: Program IDE keys and enable the IDE stream
Date: Mon, 16 Nov 2026 03:10:24 -0800
Message-ID: <20261116111037.3478844-7-chao.gao@intel.com>
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

With the IDE stream provisioned on root ports and the device, the stream
keys are next programmed via IDE_KM, and then the stream is enabled. The
trusted firmware (TSM) programs the keys into the root port, and sends
them to the device as IDE_KM messages over the SPDM session.

On TDX, TDH.IDE.STREAM.KM does both, and also enables the stream on the
root port. Like TDH.SPDM.CONNECT, it returns to the host whenever it
has an IDE_KM message for the device. Call it in the same loop that
relays the messages through the DOE mailbox.

Unlike TDH.SPDM.CONNECT, TDH.IDE.STREAM.KM is not subject to the TDX
module's concurrency limit, so don't serialize it with the mutex.

After the stream gets enabled on the root port, enable the stream on
the device from the host.

Teardown reverses these steps.

Based on work by Yilun.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 drivers/virt/coco/tdx-host/main.c | 48 +++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/virt/coco/tdx-host/main.c b/drivers/virt/coco/tdx-host/main.c
index 63209a712c28..040ceea45f8d 100644
--- a/drivers/virt/coco/tdx-host/main.c
+++ b/drivers/virt/coco/tdx-host/main.c
@@ -327,6 +327,37 @@ static void tdx_spdm_session_teardown(struct tdx_tsm_link *tlink)
 	tdx_spdm_delete(tlink);
 }
 
+enum tdx_ide_stream_km_op {
+	TDX_IDE_STREAM_KM_SETUP	= 0,
+	TDX_IDE_STREAM_KM_STOP	= 2,
+};
+
+static int tdx_ide_stream_km(struct tdx_tsm_link *tlink,
+			     enum tdx_ide_stream_km_op op)
+{
+	u64 sret, out_msg_sz;
+	int ret;
+
+	do {
+		sret = tdh_ide_stream_km(tlink->spdm_id, tlink->stream_id, op,
+					 tlink->in_msg, tlink->out_msg,
+					 &out_msg_sz);
+		ret = tdx_spdm_xfer_handler(tlink, sret, out_msg_sz);
+	} while (ret == -EAGAIN);
+
+	return ret;
+}
+
+static int tdx_ide_stream_key_program(struct tdx_tsm_link *tlink)
+{
+	return tdx_ide_stream_km(tlink, TDX_IDE_STREAM_KM_SETUP);
+}
+
+static void tdx_ide_stream_key_stop(struct tdx_tsm_link *tlink)
+{
+	tdx_ide_stream_km(tlink, TDX_IDE_STREAM_KM_STOP);
+}
+
 static void sel_stream_block_regs(struct pci_dev *pdev, struct pci_ide *ide,
 				  struct pci_ide_regs *regs)
 {
@@ -439,10 +470,25 @@ static int tdx_ide_stream_setup(struct tdx_tsm_link *tlink)
 	ide->partner[PCI_IDE_EP].default_stream = 1;
 	pci_ide_stream_setup(pdev, ide);
 
+	/* Key Programming for RP & target device, enable IDE stream for RP */
+	ret = tdx_ide_stream_key_program(tlink);
+	if (ret)
+		goto out_pci_ide_stream_teardown;
+
+	/* Enable IDE stream for target device */
+	ret = pci_ide_stream_enable(pdev, ide);
+	if (ret)
+		goto out_tdx_ide_stream_key_stop;
+
 	tlink->ide = ide;
 
 	return 0;
 
+out_tdx_ide_stream_key_stop:
+	tdx_ide_stream_key_stop(tlink);
+out_pci_ide_stream_teardown:
+	pci_ide_stream_teardown(pdev, ide);
+	pci_ide_stream_unregister(ide);
 out_tdx_ide_stream_delete:
 	tdx_ide_stream_delete(tlink);
 out_pci_ide_stream_free:
@@ -455,6 +501,8 @@ static void tdx_ide_stream_teardown(struct tdx_tsm_link *tlink)
 {
 	struct pci_ide *ide = tlink->ide;
 
+	pci_ide_stream_disable(ide->pdev, ide);
+	tdx_ide_stream_key_stop(tlink);
 	pci_ide_stream_teardown(ide->pdev, ide);
 	pci_ide_stream_unregister(ide);
 	tdx_ide_stream_delete(tlink);
-- 
2.52.0

