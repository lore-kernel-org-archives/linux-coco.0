Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D198E14A60C
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 00:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769053; cv=none; b=PjIMUSbyBFohBxOqC29iYN0xrlcwCzg++FOk+A4sPFQCyQ32+mgMLmqccRJRp4l9FxxNe/pt6rYcpvfctdkpFewjBbQ8Uw9Q5Jvy154YqHYPMZlo4GcO3LjI8s1EDEUGfT1RdEV4WLAIZ7JEmdXhAElDuNzCRtyb23bQmCPCRl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769053; c=relaxed/simple;
	bh=MsI7Wvk1cuHB1npc3aiaj/aSJFWdS31eWIZasm68TIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GlE/f4SBTwAHy1PzCBhAXKZcEN1IQkynfhAQG+eR9XxXCYbkgACGAZfbFoRT9+zdRVc/ckC9L0Ssxt1UKwpmqFFT2lXus7uABJZa4lKr9sO96MCAEQJpiskS16ghhxrV2Uud3ZejNV0vpkSJ3s8IPORDUUJcpIeU6tM6qTrUYW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGTjhE0W; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGTjhE0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770769052; x=1802305052;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MsI7Wvk1cuHB1npc3aiaj/aSJFWdS31eWIZasm68TIw=;
  b=RGTjhE0WLDjlOGLdPz/YqSLwt8+bCNvfPlzRYeDdIuXYgoOfOTCQ+qjI
   VraV7B8D3gA2nVYIINqvdbr8KNkJZMzKE/oyjfJCMll4lc77JUOHxvqYN
   DR8m9Kw5VfawV9AfX6I5LoiQJlmxV3EpVFy0X3djlX6PbDmm+v85MkMkM
   GuxqqxrL3J69bqd6YQ/gg3w+QKixd0NBQzXOL2fb0YNtGkVwX/uP4hHHS
   MzK9ECzAjAp8sY9kOqMMuRX3wxVQa+X3YAE+pVpyvTZP3bVaHLv8DBv7f
   0tDZazKl44hq6juk+Gb3WM2zgZSHgRaxljEB5NtoDsdyxGigDOopTrb9a
   A==;
X-CSE-ConnectionGUID: d550GC7dTJCn66QKhwkuiA==
X-CSE-MsgGUID: 1BU/mnh7R22NYBJcqcXxqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83279901"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83279901"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 16:17:31 -0800
X-CSE-ConnectionGUID: 34K1ZSD9TyK0+rKa+4V8Vw==
X-CSE-MsgGUID: qjD+vf0gT+27R157il/9uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216242050"
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
Subject: [PATCH v1 0/3] Increase CoCo attestation report buffer size
Date: Tue, 10 Feb 2026 16:17:09 -0800
Message-ID: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This patch series addresses buffer size limitations in the Confidential
Computing (CoCo) attestation stack. These changes are necessary to
support emerging security requirements such as DICE-based attestation
and Post-Quantum Cryptography (PQC).

DICE relies on layered evidence collected across multiple boot stages,
where each stage contributes to a cumulative certificate chain. This
process can increase the total report size to over 100KB. Furthermore,
with PQC support enabled, evidence size can reach several MB due to
larger cryptographic signatures and certificates.

Current Intel platforms use SGX-based attestation with Quote sizes
typically under 8KB. Newer Intel platforms will support DICE-based
attestation, requiring larger buffers.

This series extends the TSM framework to support reports up to 16MB,
providing sufficient headroom for these security standards. It also
increases the TDX Quote buffer size to 128KB to accommodate DICE-based
attestation.

Patch Details:

Patch 1/3 - Documents TSM binary blob size limits.      
Patch 2/3 - Increases the generic TSM maximum output blob size from
            32KB to 16MB.
Patch 3/3 - Increases the TDX-specific GET_QUOTE_BUF_SIZE from 8KB to
            128KB to support DICE-based attestation.

Kuppuswamy Sathyanarayanan (3):
  virt: tsm: Document size limits for outblob attributes
  virt: tsm: Increase TSM_REPORT_OUTBLOB_MAX to 16MB
  virt: tdx-guest: Increase Quote buffer size to 128KB

 Documentation/ABI/testing/configfs-tsm-report | 16 ++++++++++++++++
 drivers/virt/coco/tdx-guest/tdx-guest.c       |  4 +++-
 include/linux/tsm.h                           |  2 +-
 3 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.43.0

