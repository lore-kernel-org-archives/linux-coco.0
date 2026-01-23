Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31B23358D9
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180415; cv=none; b=EIZFtKR6jFqaYQT0Nga4SIKceOrD1RmMobGFzS4VR56OTe/VmlkJ7nZxKyRQ/E2sEeKfWJXXpT65scTyjq6/fJxqhkoFnm319gpMaJ4p/96ktx3cmPMNUVxZi5QbCgW6a9JZ7/MTv7ZV7kRwRrIDTXTLV0CdxITdwxwJ9dUb0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180415; c=relaxed/simple;
	bh=vgLz4SF3EU8nW3xjV4de4zODfdoo/xqh0j1ukDOOGJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XkbGZJeJ7cdlf+V7M4+HvroLO3smoFq0qkgktYa3CgX6mDCqTcIl0Fzl3qSfaHvKwaUQzzfJ9HG4a8kr5+tGhsc28vxljU0Qh8NqI1Z9cVbWk31//gO1mZJcsxMTOKfISF1fMsNLnjRoxQJPUXVb0DSF7/P2J3iHp7CP+tqPfZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiY4Q6Qg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiY4Q6Qg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769180411; x=1800716411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vgLz4SF3EU8nW3xjV4de4zODfdoo/xqh0j1ukDOOGJ4=;
  b=IiY4Q6QgDF7gyj7lfxcS6YtO1YlBHGlIAZH4YvtwVFWGDejuPH29VWMV
   PYJzwvfkh4l2x2bJJ88z5AaUEm2MHPj0YoFREVBtEwUpDaHY4C+uOOXOh
   11lc6s873C0af0sUetP6XwRMz7EfHkUyOvcyT7JAzRWulvPuntZxemTvO
   b1o2eJBt7hto/K2rr3SvSyU1DETn87reKiRD9NCvSbFKXHNHo4zepBxe9
   fdqyH1UrPsdjlme60+7HukL+/6uej6k6c4OpgANQb+MSjYlPTALVoZUTx
   fkmCA6Q9KfKRACy/qSlA12u6U807fcDcicapeJcUOJdc7rq6yQjGdmV24
   Q==;
X-CSE-ConnectionGUID: +074gVwETo6wEBzTI9lcIw==
X-CSE-MsgGUID: 4IHpCZqXQx+/OvwmKUR5zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70334326"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70334326"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:07 -0800
X-CSE-ConnectionGUID: tbH5XHWYSAOdGjZg9lbF3A==
X-CSE-MsgGUID: N3K3CeK9TF+u85mW7YlRlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="237697016"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:07 -0800
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	x86@kernel.org
Cc: reinette.chatre@intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	dan.j.williams@intel.com,
	yilun.xu@linux.intel.com,
	sagis@google.com,
	vannapurve@google.com,
	paulmck@kernel.org,
	nik.borisov@suse.com,
	zhenzhong.duan@intel.com,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	vishal.l.verma@intel.com,
	Chao Gao <chao.gao@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 01/26] x86/virt/tdx: Print SEAMCALL leaf numbers in decimal
Date: Fri, 23 Jan 2026 06:55:09 -0800
Message-ID: <20260123145645.90444-2-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123145645.90444-1-chao.gao@intel.com>
References: <20260123145645.90444-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both TDX spec and kernel defines SEAMCALL leaf numbers as decimal. Printing
them in hex makes no sense. Correct it.

Suggested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
v2:
 - print leaf numbers with %llu
---
 arch/x86/virt/vmx/tdx/tdx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 5ce4ebe99774..dbc7cb08ca53 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -63,7 +63,7 @@ typedef void (*sc_err_func_t)(u64 fn, u64 err, struct tdx_module_args *args);
 
 static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
 {
-	pr_err("SEAMCALL (0x%016llx) failed: 0x%016llx\n", fn, err);
+	pr_err("SEAMCALL (%llu) failed: 0x%016llx\n", fn, err);
 }
 
 static inline void seamcall_err_ret(u64 fn, u64 err,
-- 
2.47.3

