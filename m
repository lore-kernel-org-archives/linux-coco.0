Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA4726AABE
	for <linux-coco@lists.linux.dev>; Tue,  8 Jul 2025 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969977; cv=none; b=gCgwbsFFsW/oFWNFxRwX5MptpkAiZMqIHoyS63xThO1MQK32tP2EZz3zoXiW6T+d2+S49XfiuysxUS7ozAoe2DhEk5ZDOirOZYIILkrV5hxSfo3Vv15E1k195g2PKk5qndpT2q/UZlVh4cfZM09EzEuWT1YEnTr+pq21Iqe00rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969977; c=relaxed/simple;
	bh=wvJMYsc9yWz2URT+SK4ZAszSqtGgIMpsnmycjhsLP10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWFfLwXbLsWBq6VkYuv0OA78PbTy4UVL2GJXnD3cguBOZEe0oxkqMLxWFSR6qc+z+zBSQ8ntNLT79KbDSQtmNEEVhN00GSAdW8t+OBulfttolYncvs7nvVOJEifhHBqKAC/UNxfP97vUbHuU03SBh2n60Ted/qaWp4kXE/oXW+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4GBSrDf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4GBSrDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751969976; x=1783505976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wvJMYsc9yWz2URT+SK4ZAszSqtGgIMpsnmycjhsLP10=;
  b=m4GBSrDfsF+mnCSVg0jY++rqqN4gJtsxR4RznU6b72Sm4C3Y93tR3IZl
   WizHQgpT5Tgvkoa1zvvKnOeBxnuDgz5kmj0lRE+tgGGuomMLqoiWlcfkw
   yzcFXDx+PaQYeD+EAbydGnxvQwR7K77h63Rtz3rPN8sRgNBiYvbnumP5p
   VLoNCO48Wkpv5bW16QNC0M+cKxKqPUV1veBQz1HKfbR/1nYc6gqAbWUNa
   yITlAirNfsqsKULqmP2z7QHJ/PWi9UnqwP2mFsKYneCCGxUzLExC2iT3X
   hZOwxrxNk1VpnEicYck9TlUqjJ6GVIcehR8QBsJ90uCqaATF6XuB670uU
   w==;
X-CSE-ConnectionGUID: 4/uZl/gXSpCk7Godwp4lSw==
X-CSE-MsgGUID: X/XFM8BWQyewgWlIxpuCQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76751334"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="76751334"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 03:19:33 -0700
X-CSE-ConnectionGUID: TVh3WA+aQ0qfksSH3ynRVA==
X-CSE-MsgGUID: 1kOjowWnSzC9c4OYM785lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="155196381"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 08 Jul 2025 03:19:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id A0F741B5; Tue, 08 Jul 2025 13:19:27 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 2/3] MAINTAINERS: Add Rick Edgecombe as a TDX reviewer
Date: Tue,  8 Jul 2025 13:19:21 +0300
Message-ID: <20250708101922.50560-3-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250708101922.50560-1-kirill.shutemov@linux.intel.com>
References: <20250708101922.50560-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rick worked extensively to enable TDX in KVM. He will continue to work
on TDX and should be involved in discussions regarding TDX.

Add Rick as a TDX reviewer.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8071871ea59c..b0363770450f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26947,6 +26947,7 @@ F:	arch/x86/kernel/unwind_*.c
 X86 TRUST DOMAIN EXTENSIONS (TDX)
 M:	Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
 R:	Dave Hansen <dave.hansen@linux.intel.com>
+R:	Rick Edgecombe <rick.p.edgecombe@intel.com>
 L:	x86@kernel.org
 L:	linux-coco@lists.linux.dev
 S:	Supported
-- 
2.47.2

