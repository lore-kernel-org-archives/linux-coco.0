Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC83D25B687
	for <linux-coco@lists.linux.dev>; Mon, 17 Nov 2025 02:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763347127; cv=none; b=ZzAOE1s4vJcmfZMDAWiWR9mu93D6wZ7r8tBZo8JrQGJiFGHAadwzm4RL3AFHrYLQL2rXH+IxhaJCx+/4c5kEr2gEFOae9JraucYop6NW1FdVbcTFEV6G/NZe09qW1tBvw+OA8vbWZoenzCBzIlkV3/65ci7ZpiZ5qai0z1FNOLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763347127; c=relaxed/simple;
	bh=Qzu5/4T6S1os8tzPghPrA00nkhB5gZ8VRPDx/+4Efhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rzX6pW/NRw7LpkS9H8Z4O/BpTdSWKFKNRA1jyvKn8VXcl9cRu8RQNv4+XH+8pzJHu/2DF0QBMAoMmzczPk/lBwM/AtHwjmovBlvYrQk/vdPtpAau8rfHMDGc2W77W6+NxM1D+rQl2xQpjqkAI/LOZGvHm6imfI3AfFoDTn0+CRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvnpMHnP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvnpMHnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763347126; x=1794883126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qzu5/4T6S1os8tzPghPrA00nkhB5gZ8VRPDx/+4Efhs=;
  b=MvnpMHnPKttf46sGHk03d4+zp1ik2+uKLTEABid8/2Nhiwn98CujmOxB
   H3jH+CWi5AtTyhM8fSTAOvDUWpDHuCd4rK3cD7znZQhiGHRPYiMKmEE0X
   SiLengz7ApMmDn56uHlMoFV3fVdyFMeZ8Fs/m6f1PmFWoqrviypqg8boS
   6/V1fcEgrY6VKxruvodKxayv60bb6WdXNdMxyPcXhHsFIw+dQL2SKOJFv
   /Gl3IHwsPMPD/lSqM1+iJKb7x0niLbEmJlfwYehMwttU0eGbc2BrNwrL8
   mIzE6+4wXz7wKBEKm+71C7E8vh/RyJu+WqMU0liKzuHMjSY8N7PkyCeU+
   g==;
X-CSE-ConnectionGUID: Fy3BnhqqQwuCHTwijpJg5A==
X-CSE-MsgGUID: 3l8KLmLFQ6eVooZvekVCKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82729558"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="82729558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 18:38:46 -0800
X-CSE-ConnectionGUID: XrZFkQvCQbu0117IxfTZtA==
X-CSE-MsgGUID: 0vxXJKTrSx+69IqHN9g3+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="227658318"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2025 18:38:42 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: chao.gao@intel.com,
	dave.jiang@intel.com,
	baolu.lu@linux.intel.com,
	yilun.xu@linux.intel.com,
	yilun.xu@intel.com,
	zhenzhong.duan@intel.com,
	kvm@vger.kernel.org,
	rick.p.edgecombe@intel.com,
	dave.hansen@linux.intel.com,
	dan.j.williams@intel.com,
	kas@kernel.org,
	x86@kernel.org
Subject: [PATCH v1 14/26] mm: Add __free() support for folio_put()
Date: Mon, 17 Nov 2025 10:22:58 +0800
Message-Id: <20251117022311.2443900-15-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
References: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow for the declaration of struct folio * variables that trigger
folio_put() when they go out of scope.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 include/linux/mm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d16b33bacc32..2456bb775e27 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1425,6 +1425,8 @@ static inline void folio_put(struct folio *folio)
 		__folio_put(folio);
 }
 
+DEFINE_FREE(folio_put, struct folio *, if (_T) folio_put(_T))
+
 /**
  * folio_put_refs - Reduce the reference count on a folio.
  * @folio: The folio.
-- 
2.25.1

