Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291EE367F5B
	for <linux-coco@lists.linux.dev>; Sun, 15 Mar 2026 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773583190; cv=none; b=HWjD+YlEfCCeoC2MLkIJz16/ov7Yg/dz6mBn8Nnk7P5JxqirDCclsna7iNZjwr1FAglEHcMEUDf7L5h5WDYw0ourtAkWquUca8v9NhaW4sO2BxGEmGQeg2bmzxosHM6ecHj+/CXmfEl1vbsPnqPXL+EtlguSLtaKydEq9Y9/Z0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773583190; c=relaxed/simple;
	bh=++GAWHtFRzuZ2kWjliZqn74GIC5sgxuhyQCc1cMypwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZInEuva6w/GFlbw8vTsaoYM2wE/XABQ0pzjNrvALVhUQvE9fLqrH/1BeXR+1klrNHbcYuqZC2hbu8V0ULKhW8yfMmEmah7WvqpX76AwdKudW5RALiCGhYvuLnidL1IIz2FoWon+a0ifzJW9D0n11U269712O/lmQVI1vYTPuqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEvCc2X8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEvCc2X8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773583187; x=1805119187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=++GAWHtFRzuZ2kWjliZqn74GIC5sgxuhyQCc1cMypwQ=;
  b=BEvCc2X8mtikLayJEWrpBH5LeRe3gzAtufhr6LDuGVlvnUxRCb+9m0nA
   IYIvbJgOPVUPs6u3IKGY2xo4F6LxgGy2A+vrTLjh0ySjUbnaHOyrDUnLd
   Gbvs8yZfIFPdqUETbZaj7uRkvYH6InkCauylZWjaEf9sCpbGrA89ffnbt
   zGmlNMBgDBa/gPmFrkw7h0BaxiRkvP8ZYZwGU8qupTB9/DzP531yYLLXF
   t0rFCQIIGortsjLZckqpCF1Lsg44MQyDDvgLq0vRr1c2N/q3zGiACJRmg
   nen9qj9L77UBiElkfJGtSB1bsUFrVstOm3NqqAt3FDJbNNRhLJQox8lkJ
   Q==;
X-CSE-ConnectionGUID: YS1kthZlTN2vFCgAQJuE0A==
X-CSE-MsgGUID: GFymS4dLSDOf5YQFKsHatQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74732520"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="74732520"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:59:42 -0700
X-CSE-ConnectionGUID: zR3pIQYwSXeY+eiNQhZSxw==
X-CSE-MsgGUID: 4fAGjPkYQ+ePkgfydZeFgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="226123059"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:59:42 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: binbin.wu@linux.intel.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	nik.borisov@suse.com,
	paulmck@kernel.org,
	pbonzini@redhat.com,
	reinette.chatre@intel.com,
	rick.p.edgecombe@intel.com,
	sagis@google.com,
	seanjc@google.com,
	tony.lindgren@linux.intel.com,
	vannapurve@google.com,
	vishal.l.verma@intel.com,
	yilun.xu@linux.intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 14/22] x86/virt/seamldr: Do TDX per-CPU initialization after updates
Date: Sun, 15 Mar 2026 06:58:34 -0700
Message-ID: <20260315135920.354657-15-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315135920.354657-1-chao.gao@intel.com>
References: <20260315135920.354657-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After installing the new TDX module, each CPU needs to be initialized
again to make the CPU ready to run any other SEAMCALLs. So, call
tdx_cpu_enable() on all CPUs.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index a64271f94aed..4d8c96d82c05 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -188,6 +188,7 @@ enum module_update_state {
 	MODULE_UPDATE_START,
 	MODULE_UPDATE_SHUTDOWN,
 	MODULE_UPDATE_CPU_INSTALL,
+	MODULE_UPDATE_CPU_INIT,
 	MODULE_UPDATE_DONE,
 };
 
@@ -250,6 +251,9 @@ static int do_seamldr_install_module(void *seamldr_params)
 				args.rcx = __pa(seamldr_params);
 				ret = seamldr_call(P_SEAMLDR_INSTALL, &args);
 				break;
+			case MODULE_UPDATE_CPU_INIT:
+				ret = tdx_cpu_enable();
+				break;
 			default:
 				break;
 			}
-- 
2.47.3

