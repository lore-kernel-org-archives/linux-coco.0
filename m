Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBFE361DD3
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180437; cv=none; b=e+It01rzPzxW8c4U+bp6ek7Prlv6alng+Mi6rKkv+J+BHUnHl1NGra63FZnBmlCMKYbxn36e8TKL/9EQUThxn8nfJFLwwD3WUCegdpvltuOjNk2pqMWqAlgKF00d9XFjqhubvXwCRjk0Cx6PjFHEamUOJ5wSQBAgsJq7U4VaKSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180437; c=relaxed/simple;
	bh=W/SuQAxt7ClBHx9qecLubHrb5FhNgT3NcUOt5cFlxEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEt3FmErL0BNso5lFAOXfJ5aN/MIrNNZqXCynSZh8+/7/oNkNr7kXS9/sYE52prLDqxvlJagLLgGUxIXxd+bMBlmr4S+HUcaQNgKr7NcHat1VzrTzfVdgybVtbRUMzgE164QtjT/CHvcRyiSH8pLysUFdrEJZLs+7qMA8HpmlzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKPfyle4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKPfyle4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769180435; x=1800716435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W/SuQAxt7ClBHx9qecLubHrb5FhNgT3NcUOt5cFlxEc=;
  b=EKPfyle4ZDnU5XgqXB/yuOAOilQYFg0hlUudHK3i8GtClxZ+zQUeniek
   DdmZEwGsaHuJbLuRUrc8VKBufJuND5qq4xXY8GgXym9qHLdrVn7lB0QXj
   scFVUs3+fTyhU4lxZqkiCpjxMOAYY1rPCgmt3usN0I/bnJ87eS2ZqhlhE
   uFRmm9PoD/ntrhU+T2aPStZrShpBD/BMoUYWdo7WNFLAJhhotiAiYO80D
   Eg+6lEKsvIt8tNZ+eYDopiI60Tl3vIAgVJNdf8IFUwtQUMi5yaVHK0+4q
   RDuA6ynIQSymBQ9vZ0gtoYknIkh1fFmgpmHFbK341qWTPf1bsvg5wSRdm
   A==;
X-CSE-ConnectionGUID: tJkgjtqXSJKWLbpUzW8dUw==
X-CSE-MsgGUID: m1Hunk5+S26hCS+O4l4YcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70334494"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70334494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:18 -0800
X-CSE-ConnectionGUID: 2XrvhoCXT7SVFEQgT9a3sA==
X-CSE-MsgGUID: AmhIpe1pTmaa59UY/q4DCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="237697190"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:18 -0800
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
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 20/26] x86/virt/seamldr: Do TDX per-CPU initialization after updates
Date: Fri, 23 Jan 2026 06:55:28 -0800
Message-ID: <20260123145645.90444-21-chao.gao@intel.com>
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

After installing the new TDX module, each CPU should be initialized
again to make the CPU ready to run any other SEAMCALLs. So, call
tdx_cpu_enable() on all CPUs.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 13c34e6378e0..ee672f381dd5 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -239,6 +239,7 @@ enum tdp_state {
 	TDP_START,
 	TDP_SHUTDOWN,
 	TDP_CPU_INSTALL,
+	TDP_CPU_INIT,
 	TDP_DONE,
 };
 
@@ -303,6 +304,9 @@ static int do_seamldr_install_module(void *seamldr_params)
 				scoped_guard(raw_spinlock, &seamldr_lock)
 					ret = seamldr_call(P_SEAMLDR_INSTALL, &args);
 				break;
+			case TDP_CPU_INIT:
+				ret = tdx_cpu_enable();
+				break;
 			default:
 				break;
 			}
-- 
2.47.3

