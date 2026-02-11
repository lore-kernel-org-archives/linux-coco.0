Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7644714A60C
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 00:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769054; cv=none; b=Ihhho70drTHzSctb+nRYtV61U4ZwF4DvCczsFDp/vJekQarFmMRDgKpZCpFZMKosfKkIAVna5XYL6d0QuaJ9O5XsuzdvB+o+PjV0+MbUcwIQdDVVQBkzfP+PJrSGoImYl7UDN6jLbDOXkEDof8Z+F0FZcg0l3wSMY9A334NZOqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769054; c=relaxed/simple;
	bh=ZXKgLjfjUMF5Zlz2aryYjTREBzkzCvURKUYVMjQVPYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R7UM8nI+pFvaqiEHWnHO1LD57WDfdhanzbM0szm//Fzn5qfJc6CGne+7dyYhYLm3cqToc/pBu8JYh+nxn0tke89/ksKNakl1ngF4tcxH5vbep8gaJ2HG4XgFTLo2RHFqDMoQuOWExuAHhF7qeXzGnlCM6XzgInWxjVsg6Q8mvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZpU0CJk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZpU0CJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770769054; x=1802305054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZXKgLjfjUMF5Zlz2aryYjTREBzkzCvURKUYVMjQVPYo=;
  b=lZpU0CJk8mFpk/+nW+0cUPffOoHni05J1IIzgDlII4u7OPwgRgn1NGmM
   5zWMMSDWLxscy6WiCl1S+KLi1LWVsqU4ikEra7PT5YJ02Bkb3vCU6o7xn
   AeQFHtbZzRwAaBBNvf5yLPHGGuztTsVM8sWstcNBSmNhB9jaf873Kf2AA
   B2kqE8WsQFcc8OwF4WJMT7mccMWL7lik/13eAAVjJnYVbWTaFdX9XEJ/z
   zNFO5wB7n/5ecWUDRNVHH7onhHVYq8Mni+bS6RgWo0onITTnPPkj2xeKj
   3oDKeEgKYHR3F58jrAXX+ccbP5zJXFpQYwNIcFsTTGgGAmXtxaZ6CH80y
   g==;
X-CSE-ConnectionGUID: tDtbngI4QPiavlEPeWNvAw==
X-CSE-MsgGUID: UEUbv2RqTf+T/jCOLR3qfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83279907"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83279907"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 16:17:31 -0800
X-CSE-ConnectionGUID: EK55xVOhSfmhaG8fYIV/7g==
X-CSE-MsgGUID: B5KCxlnoRuW/g3YGiK9VfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216242055"
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
Subject: [PATCH v1 2/3] virt: tsm: Increase TSM_REPORT_OUTBLOB_MAX to 16MB
Date: Tue, 10 Feb 2026 16:17:11 -0800
Message-ID: <20260211001712.1531955-3-sathyanarayanan.kuppuswamy@linux.intel.com>
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

Confidential Computing (CoCo) attestation is evolving toward
standardized models such as DICE (Device Identifier Composition Engine)
and Post-Quantum Cryptography (PQC), which rely on layered certificate
chains and larger cryptographic signatures.

A typical PQC certificate can range from 5KB to 15KB, and DICE-based
architectures accumulate these certificates across multiple boot
stages. In such configurations, the total attestation evidence can
reach several megabytes, exceeding the current 32KB limit.

Increase TSM_REPORT_OUTBLOB_MAX to 16MB to accommodate these larger
certificate chains. This provides sufficient headroom to handle
evolving requirements without requiring frequent updates to the limit.

TSM_REPORT_OUTBLOB_MAX is used by the configfs read interface to cap
the maximum allowed binary blob size for outblob, auxblob and
manifestblob attributes. Hence, the per-open-file worst case memory
allocation increases from 32KB to 16MB. Multiple concurrent readers
multiply this cost (e.g., N readers of an M-byte blob incur NxM bytes
of vmalloc-backed memory). However, allocations are performed on demand
and remain proportional to the actual blob length, not the configured
maximum.

Reviewed-by: Fang Peter <peter.fang@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 include/linux/tsm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index a3b7ab668eff..7f72a154b6b2 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -8,7 +8,7 @@
 #include <linux/device.h>
 
 #define TSM_REPORT_INBLOB_MAX 64
-#define TSM_REPORT_OUTBLOB_MAX SZ_32K
+#define TSM_REPORT_OUTBLOB_MAX SZ_16M
 
 /*
  * Privilege level is a nested permission concept to allow confidential
-- 
2.43.0

