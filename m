Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C10831DD85
	for <linux-coco@lists.linux.dev>; Thu, 18 Sep 2025 23:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758237792; cv=none; b=IswxfkaYoHFurlwh5nPnFCBMzdvMC4y8vLs1cMP/fL1RQAIH68VSilmNbc0mTUL84V0KqC5BcNAXo6Pe41VvYbCw96PTRr+N8R4/37hQ24WjKG+lHuN5YoJL6MVKQJ3z4e3JtrMIjwtJSM2l+i3aL875d44A/0oGuz8ym0e0aVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758237792; c=relaxed/simple;
	bh=x1kfSJSD+ZsZVDmROQy13II+aAyWoHke/JipsQ6+0Tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkcwBiw6ZjujFGkgyMt6sRVs2SzE6rGiPro0Od9MjIepmyjLsuFn9NovYvtiEmzc+bx4N/t8V6yB+cR3/PJJG2I/JlGiB0f/vGcPmDTJ8m0Qqs7tUsU0omxOk6V9nwOtEYWtHIBBh1kzZhW6bBKwjJAnbZXMyRhzjJi/8LqwDVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOuw+fkf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOuw+fkf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758237791; x=1789773791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x1kfSJSD+ZsZVDmROQy13II+aAyWoHke/JipsQ6+0Tw=;
  b=dOuw+fkfcJ2hy539BFYzJk/Pg4LYZW/1oGIR+3CDbzyq52/bXck27J/f
   5zuRJoGOw2h7IpAmfV89O+xngFZCN7GV2Rx1HXJsM8eHqAKu5moBnIn3e
   wkFgn1a2j4JP8fAm95VPf8Ok4THWrL0yYq7uqAVDBlX2Ymcqks6iyTr40
   LhhRfaHW7sWhRr+oYy4JzQxDrpdnRKHMBjPO7SSXTxAXIGv+1CGuEP2vq
   ep38Brtb3FmR0RpGcRmMpSB3OS97xpUyZkFfmhPhVBredXruvX0NVw3eO
   U0OOcfW2BB+Z3Qbm+MdoehMAw70irOVHTYgiEONQi0XUqAHhSg1NrO4zM
   A==;
X-CSE-ConnectionGUID: 8v3fKsG2QL+hONxD1Wf/Ow==
X-CSE-MsgGUID: SayWLh1/S6iRh2AvMcTyZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60735483"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="60735483"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 16:23:08 -0700
X-CSE-ConnectionGUID: PcYxYFTjQVqHLOTcVtY++g==
X-CSE-MsgGUID: 7oI4sD50TVK8yQ1mWtZEjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="176491483"
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.139])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 16:23:07 -0700
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: kas@kernel.org,
	bp@alien8.de,
	chao.gao@intel.com,
	dave.hansen@linux.intel.com,
	isaku.yamahata@intel.com,
	kai.huang@intel.com,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	tglx@linutronix.de,
	x86@kernel.org,
	yan.y.zhao@intel.com,
	vannapurve@google.com
Cc: rick.p.edgecombe@intel.com,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v3 16/16] Documentation/x86: Add documentation for TDX's Dynamic PAMT
Date: Thu, 18 Sep 2025 16:22:24 -0700
Message-ID: <20250918232224.2202592-17-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918232224.2202592-1-rick.p.edgecombe@intel.com>
References: <20250918232224.2202592-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Expand TDX documentation to include information on the Dynamic PAMT
feature.

The new section explains PAMT support in the TDX module and how Dynamic
PAMT affects the kernel memory use.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[Add feedback, update log]
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
v3:
 - Trim down docs to be about things that user cares about, instead
   of development history and other details like this.
---
 Documentation/arch/x86/tdx.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
index 719043cd8b46..d07132c99cc6 100644
--- a/Documentation/arch/x86/tdx.rst
+++ b/Documentation/arch/x86/tdx.rst
@@ -99,6 +99,27 @@ initialize::
 
   [..] virt/tdx: module initialization failed ...
 
+Dynamic PAMT
+------------
+
+PAMT is memory that the TDX module needs to keep data about each page
+(think like struct page). It needs to handed to the TDX module for its
+exclusive use. For normal PAMT, this is installed when the TDX module
+is first loaded and comes to about 0.4% of system memory.
+
+Dynamic PAMT is a TDX feature that allows VMM to allocate part of the
+PAMT as needed (the parts for tracking 4KB size pages). The other page
+sizes (1GB and 2MB) are still allocated statically at the time of
+TDX module initialization. This reduces the amount of memory that TDX
+uses while TDs are not in use.
+
+When Dynamic PAMT is in use, dmesg shows it like:
+  [..] virt/tdx: Enable Dynamic PAMT
+  [..] virt/tdx: 10092 KB allocated for PAMT
+  [..] virt/tdx: module initialized
+
+Dynamic PAMT is enabled automatically if supported.
+
 TDX Interaction to Other Kernel Components
 ------------------------------------------
 
-- 
2.51.0

