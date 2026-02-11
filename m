Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558091D5170
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 00:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769055; cv=none; b=piEB4btkY/r4oX8j8cEjh0l93qo2/oWOGLzNk5OwUzYksJZL6MrtR0LfmA4uktFdrNI5Zz6qICgM3OdjTdSc8wBacanpJyE7qgjZbTosvocztd0Mv1S6VedHQwyV+ukfm4N0Ys//j8YtEydEh3BS1Nko8QMT/2PcNE+7oYVFPC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769055; c=relaxed/simple;
	bh=YO+1oAM2dVy6fMUoqaEvAvR+d5ARX+Qw7vLhLECpBEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ba5ZQyUAJOQnhJqX2T72QPW5qA4Zy7rOT0VqO4OA1b9UwEH54mHWme06u3coIvRE95B+MnuuiE1jtVbMAqI6lpal35A1VvNXCo26glUfiAIDFtvibKY+HSwQ6wqZ0RfBwuRsMmyc86PhjZhGro7/91+qEqctNU5igkSpmXXfX10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=levV3fUr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="levV3fUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770769054; x=1802305054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YO+1oAM2dVy6fMUoqaEvAvR+d5ARX+Qw7vLhLECpBEQ=;
  b=levV3fUrxudQI4yVk0MkLI/G3jJUDrRuMR2cNz7WpFxiCQtjciPfwMui
   5xH9SHZb8NXLdRF0Exe3gJx7w2KQ0ksQ5RTj2IczTjiHnKRjdmqJgRXeQ
   h3mrTmlxhNOcIU6ubpUC9T9DE4nsTkriLZECKmBDSpsaAcL3NgApKmnDE
   GK0oQr3m3QS71TDWqs+7kWInLshBfdtV66dz8pDPydozM0ly/IaGE3Ipg
   hfI9pFouxn69TtAnGkvGXlxs1EBwuVGA2IBM0Mif9QqB9UutlqF34MoWT
   1CvIT3RQEIrylttAQ+E9VaZWg56KBRgdjwtI9YCD24Txuikvh4hiE04PR
   Q==;
X-CSE-ConnectionGUID: Qr8BeqwPT0i9O+hxhdOl2w==
X-CSE-MsgGUID: 0UEkx5HPQeODs0HeEpXCtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83279910"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83279910"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 16:17:32 -0800
X-CSE-ConnectionGUID: Lm7NabfnTMai3eowDhcu4A==
X-CSE-MsgGUID: XRdfSyFyRfiMVWFwQpiKTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216242058"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 16:17:31 -0800
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>,
	"Kirill A . Shutemov" <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Subject: [PATCH v1 3/3] virt: tdx-guest: Increase Quote buffer size to 128KB
Date: Tue, 10 Feb 2026 16:17:12 -0800
Message-ID: <20260211001712.1531955-4-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel platforms are transitioning from traditional SGX-based
attestation toward DICE-based attestation as part of a broader move
toward open and standardized attestation models. DICE enables layered
and extensible attestation, where evidence is accumulated across
multiple boot stages.

With SGX-based attestation, Quote sizes are typically under 8KB, as the
payload consists primarily of Quote data and a small certificate bundle.
Existing TDX guest code sizes the Quote buffer accordingly.

DICE-based attestation produces significantly larger Quotes due to the
inclusion of evidence (certificate chains) from multiple boot layers.
The cumulative Quote size can reach approximately 100KB.

Increase GET_QUOTE_BUF_SIZE to 128KB to ensure sufficient buffer
capacity for DICE-based Quote payloads.

Reviewed-by: Fang Peter <peter.fang@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 Documentation/ABI/testing/configfs-tsm-report | 4 ++++
 drivers/virt/coco/tdx-guest/tdx-guest.c       | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-tsm-report b/Documentation/ABI/testing/configfs-tsm-report
index ca3352cfd2f1..7a6a5045a7d5 100644
--- a/Documentation/ABI/testing/configfs-tsm-report
+++ b/Documentation/ABI/testing/configfs-tsm-report
@@ -73,6 +73,10 @@ Description:
 		Library Revision 0.8 Appendix 4,5
 		https://download.01.org/intel-sgx/latest/dcap-latest/linux/docs/Intel_TDX_DCAP_Quoting_Library_API.pdf
 
+		Intel TDX platforms with DICE-based attestation use CBOR Web Token
+		(CWT) format for the Quote payload. This is indicated by the Quote
+		size exceeding 8KB.
+
 What:		/sys/kernel/config/tsm/report/$name/generation
 Date:		September, 2023
 KernelVersion:	v6.7
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 4e239ec960c9..4252b147593a 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -160,8 +160,10 @@ static void tdx_mr_deinit(const struct attribute_group *mr_grp)
 /*
  * Intel's SGX QE implementation generally uses Quote size less
  * than 8K (2K Quote data + ~5K of certificate blob).
+ * DICE-based attestation uses layered evidence that requires
+ * larger Quote size (~100K).
  */
-#define GET_QUOTE_BUF_SIZE		SZ_8K
+#define GET_QUOTE_BUF_SIZE		SZ_128K
 
 #define GET_QUOTE_CMD_VER		1
 
-- 
2.43.0

