Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67304246782
	for <linux-coco@lists.linux.dev>; Fri, 23 May 2025 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994041; cv=none; b=p3jCeXJlYODi9zfJERxxVCfSOzqdUWsN8dFIZyFMp9kw3jvtRgHZPxE1NIJ/Vfon/xDhbVYsD0X5hjNVJ4EBAEJS54RIGXGur2GK4YonHOH9tei+/ziBtts86WNXERqEtjJePdWBP1HYJ8qpoCJK/92wWGBzQxXibT2ZLh1ucs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994041; c=relaxed/simple;
	bh=z0i0/IXCqbcVFjIzw3ueLhZMcxcGtEoHNUIB6t7zan8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqshVlYtuHtKvmVg8uWLm1c8Ls5NJA+vazIemOhzTXAPxa4sTjqxqWqYPyV+Ct+tSzGBPCrxO8UxB31YqwnhgSJKzT1q0YA5qGM3Fdn0wADFJ5U4OwcsOLHRhpDL5j/1Do2XDprYXBA6WPCDvPSDjPFBx8IXAzOlL6CYZC4p99M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlVxZ1jH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlVxZ1jH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747994040; x=1779530040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z0i0/IXCqbcVFjIzw3ueLhZMcxcGtEoHNUIB6t7zan8=;
  b=YlVxZ1jHdlT+spx+qJJuZ6vbEMrJNfz/FYoCpNBigHSGdF9oUhsIqsH0
   VnqDYO4NjOXaCvk/cxDC8OjWyGCOhBd5DLzUoUyyRUoC0pWOOu6WUHHwu
   rbU2Lc0aueb4PJIl6jMQnXqR+r7qejNYE87xC+ylTpct7gazl0CLRivXH
   3pf1Fe/WcoOckThiFVnWIKwG4tEGrZEffgAGbh+dJ16ti6YWqWvUUTNK6
   XZeYt6NczRWLAFv2mvK4HAe29N5RaLgZ9jJ1D4NX619xI7frFk7tyR0t7
   DZNSYC0v2t+LJVJND7KJP6QIaKx1rp4Vb3ZGBVVorEJa8zKyEgEe4dVw4
   Q==;
X-CSE-ConnectionGUID: aK/j0GbdQEyRYlFgBN3RdQ==
X-CSE-MsgGUID: 1pnr/fgJTq2Zuti+BJBCvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75444269"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="75444269"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:53:58 -0700
X-CSE-ConnectionGUID: 9TZeUvwGS6S9vS7yl4WNcg==
X-CSE-MsgGUID: obpdoiXhTq+asbZ9XygFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="164315100"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:53:58 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	x86@kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	pbonzini@redhat.com,
	eddie.dong@intel.com,
	kirill.shutemov@intel.com,
	dave.hansen@intel.com,
	dan.j.williams@intel.com,
	kai.huang@intel.com,
	isaku.yamahata@intel.com,
	elena.reshetova@intel.com,
	rick.p.edgecombe@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 20/20] x86/virt/seamldr: Enable TD-Preserving Updates
Date: Fri, 23 May 2025 02:52:43 -0700
Message-ID: <20250523095322.88774-21-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250523095322.88774-1-chao.gao@intel.com>
References: <20250523095322.88774-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All necessary steps for TD-Preserving updates have been integrated.
Remove the temporary guard to enable TD-Preserving updates.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index fe8f98701429..c6e40a7418d3 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -350,12 +350,6 @@ static int do_seamldr_install_module(void *params)
 	return ret;
 }
 
-/*
- * Temporary flag to guard TD-Preserving updates. This will be removed once
- * all necessary components for its support are integrated.
- */
-static bool td_preserving_ready;
-
 DEFINE_FREE(free_seamldr_params, struct seamldr_params *,
 	    if (!IS_ERR_OR_NULL(_T)) free_seamldr_params(_T))
 
@@ -365,9 +359,6 @@ static int seamldr_install_module(const u8 *data, u32 size)
 							  GFP_KERNEL);
 	int ret;
 
-	if (!td_preserving_ready)
-		return -EOPNOTSUPP;
-
 	if (!info)
 		return -ENOMEM;
 
-- 
2.47.1

