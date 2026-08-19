Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221BA469837
	for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133276; cv=none; b=pvKmzWthhHCm+d9QCo2w1o/kjgsEFlYcvGkkFrkNaau0YWz3vTpFalQAF1aJ2GkOPFvl/ToM6Lo68kXgjwxOA75etJ6nuyyrQRaTwi/aS2iQQH3h0SGlnqLlYVdTez7QqgCk8Ur5qfE6Bliml2qLV+Yd673PUCDg/ispvCs9Ny0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133276; c=relaxed/simple;
	bh=pNkqq2dwqlcQDn1HUnduSrLVReavua1ZNSuOBY8FdLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lh7Lhjq3ysSO32ImMocxSNk8kz1P5RRxt6/Fej01Sg4aYSwVMRO3sR2NhTk7+/PqnkPMHXQTcna98CWB2u9SoNIRkoXkgrCC+I45kf+sEc5QdLqH9Fomg8X5IMTqCQRl3mbOCBG2guF99zRhk5uusaXV2f4ozjvAA5jhBrHVifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3LDqPo1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3LDqPo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787133270; x=1818669270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pNkqq2dwqlcQDn1HUnduSrLVReavua1ZNSuOBY8FdLM=;
  b=F3LDqPo1TcoHecTVpX6OL5MdMNWH2PiWP1bPComJ53yzpOHFm4XXKVMX
   tDOx7l2CoLpvyjWDYLHWkt8hWnCbwU5tSVKp2w4mmlgI72eRT0okZWv+f
   XtySZ8zRC5Cbqxspx0aXSE3IGyVVN5l+87/1pBl+ZUfbwfLAEsb0BmZjk
   CiZ2u45cAbj/L/l3On+rdBeh71F8mgdyNehUNyEwmHhJ87wMoEiMpurfj
   YzSyHJfeSlmwXzPV6gaNnClNn6ZJpGOzf4jbnaxP0Pc7AkYEGgh+7uCcj
   85Xm6/Jgp3sTDkMf13BV2+vc5T+F33BQO5/bIgW9D4FT7I189/dmiS4eN
   g==;
X-CSE-ConnectionGUID: P9pD7ptyTA+rsFU6l172Ng==
X-CSE-MsgGUID: SPaXEzTWRde9BjHO8p1yAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87514956"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87514956"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 02:54:28 -0700
X-CSE-ConnectionGUID: oe0TwS+QQ2+rLWoWKduaBw==
X-CSE-MsgGUID: vjNQwiIKQ3u9GcJt6a6Emw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="303708878"
Received: from lxy-clx-4s.sh.intel.com ([10.239.48.33])
  by orviesa001.jf.intel.com with ESMTP; 19 Aug 2026 02:54:23 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Xiaoyao Li <xiaoyao.li@intel.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	nik.borisov@suse.com
Subject: [PATCH v4 5/9] KVM: TDX: Update exit_reason on wait_for_sept_zap return
Date: Wed, 19 Aug 2026 17:48:59 +0800
Message-ID: <20260819094903.3060020-6-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819094903.3060020-1-xiaoyao.li@intel.com>
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update exit_reason to a value with bit[31:16] cleared and bit[15:0]
set to TDX_INVALID_EXIT_REASON when it needs to return early due to
wait_for_sept_zap in tdx_vcpu_run().  This avoids the stale exit_reason
of the previous Exit being consumed twice.

Fixes: 4b2abc49712b ("KVM: TDX: Kick off vCPUs when SEAMCALL is busy during TD page removal")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
Changes in v4:
- new patch;
---
 arch/x86/kvm/vmx/tdx.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 987092283955..014710945e8a 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1088,8 +1088,21 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 	 * allowing vCPU entry to avoid contention with tdh_vp_enter() and
 	 * TDCALLs.
 	 */
-	if (unlikely(READ_ONCE(to_kvm_tdx(vcpu->kvm)->wait_for_sept_zap)))
+	if (unlikely(READ_ONCE(to_kvm_tdx(vcpu->kvm)->wait_for_sept_zap))) {
+		/*
+		 * The vCPU never entered the guest, but this looks like a
+		 * handled exit to the caller.  Synthesize an invalid exit
+		 * reason so the previous exit's stale value isn't consumed
+		 * a second time.
+		 *
+		 * Make it super clear that bit[31:16] is cleared to 0 and only
+		 * basic exit reason (bit[15:0]) is set to the synthesized
+		 * invalid exit reason.
+		 */
+		vt->exit_reason.full = 0;
+		vt->exit_reason.basic = TDX_INVALID_EXIT_REASON;
 		return EXIT_FASTPATH_EXIT_HANDLED;
+	}
 
 	trace_kvm_entry(vcpu, run_flags & KVM_RUN_FORCE_IMMEDIATE_EXIT);
 
-- 
2.43.0

