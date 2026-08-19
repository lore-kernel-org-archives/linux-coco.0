Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F410D44A402
	for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133268; cv=none; b=aYDkP1N/ilgYjfipdHAxpd8GdaEmVFW2xvFXuU/M0jMs+joS99b2NNmaA3CyaeTDudh8vD9+Wbgf8wvGVfTdyaZsg22hb3KsbHrkddZJzYU+l3R9YqWpFm6XQvYvVxhGJunN5V0kFDHhGwmkc0CXtPa7G+F8j2+X0GWaP7f/V1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133268; c=relaxed/simple;
	bh=Aj4BbpCvC1P1zs3DT9QsENzN83UsNZEbFsx5rOEBRY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gu5M7pM6ceU0gTSvCgCnWPjkG3/z3OeNdg260S9s45oI1l3PyQWho1gf7ZupQAgK+0KpkkWTaCgzgZvmH5q9KAr9BNhUEcM/TgqVzsRAmhKrt0kTqOQ7QnElSTndFaVGV4sS0XeSwIyyXXbnFLMN0ogrz81actxrJqiYf7OwayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eF9euBV8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eF9euBV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787133255; x=1818669255;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Aj4BbpCvC1P1zs3DT9QsENzN83UsNZEbFsx5rOEBRY0=;
  b=eF9euBV8cMxAyHptVOSyffLZja4MchvuBdwOtjBG/d3qEvHwf2FYxdM4
   qoxeiZPzqfEQ3cKzn3LKMMbuZVuzo03iGHrAlW07UdM2co3w5Q23S008S
   ZkHNN18G3bjd2Bps+Um6QjC3XCGcH62q2MyC8nyxkOPGngRnr+/I48gj7
   Tr2m/vlH9i/u7KGAj+8b8a1uB7iovY6HFY0xblNhVYtn0SN5fg/7S0rSm
   MMrTfX7pU6keGS5fZdDTYsApaNDSsFTHLqIuXzWUctMrjrXNGUTaqqFYD
   tnwUhN/K343Npk9BAW7RSlv3Unp/KxVrCAgCF/c0ax8JX/hNYQ4uGCHUW
   Q==;
X-CSE-ConnectionGUID: UK6ZjDC9SnaeC2e2WhjONg==
X-CSE-MsgGUID: oWlCj6kiT26r6SdwTV/Euw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87514783"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87514783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 02:54:13 -0700
X-CSE-ConnectionGUID: Yg3i0htjTfun54+x/bRaTw==
X-CSE-MsgGUID: EYWJSPbwTe+DCYq0eKcN8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="303708823"
Received: from lxy-clx-4s.sh.intel.com ([10.239.48.33])
  by orviesa001.jf.intel.com with ESMTP; 19 Aug 2026 02:54:11 -0700
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
Subject: [PATCH v4 0/9] KVM: TDX: Enable VM-DoS Prevention Features for TDX
Date: Wed, 19 Aug 2026 17:48:54 +0800
Message-ID: <20260819094903.3060020-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is v4 of the series to enable the Notify VM Exit and Bus Lock VM
exit for TDX, which fixes the KVM CAP issue related with them and allow
userspace to actually enable the features.

Compared to v3, this v4 adds 5 more patches.  The first 8 patches target
for stable kernels while only the patch 9 doesn't have to.  Patch 1 is a
single patch to enable Notify VM exit for TDX.  Except patch 6, patch
2-7 are mandatory for enabling Bus Lock VM exit for TDX in patch 8.

Patch 6 itself is a fix for VMX and is OK for cc stable though maybe not
necessary.  Patch 6 is added to this series since it can help stop Sashiko
repeating its finding of VMX's pre-existing issue, and it's also necessary
for patch 9 to consilidate the exit handler for VMX and TDX.

There are other issues of existing code found during previous review, like
the EPT MISCONFIG handling.  Given they are not mandatory for enabling the
Notify VM exit and Bus Lock VM exit for TDX, the plan is to address them in
a follow-up series separately.

Please refer to v1 for a full background.

v3: https://lore.kernel.org/all/20260812080229.2481439-1-xiaoyao.li@intel.com/
v2: https://lore.kernel.org/all/20260810112200.2326727-1-xiaoyao.li@intel.com/
v1: https://lore.kernel.org/all/20260805031257.1844914-1-xiaoyao.li@intel.com/

Xiaoyao Li (9):
  KVM: TDX: Enable Notify VM exit
  KVM: TDX: Check if there is valid exit infos based on vp_enter_ret
  KVM: TDX: Set bits 31:16 to 0 for the synthesized Exit Reason
  KVM: TDX: Don't assume exit_reason[31:16] is all-0 in
    tdx_to_vmx_exit_reason()
  KVM: TDX: Update exit_reason on wait_for_sept_zap return
  KVM: VMX: Preserve negative return value in vmx_handle_exit() with bus
    lock detected
  KVM: VMX: Make handle_bus_lock_vmexit() a shared helper
  KVM: TDX: Enable Bus Lock VM exit
  KVM: VMX: Consolidate the exit handler for VMX and TDX

 arch/x86/kvm/vmx/common.h | 20 ++++++++++
 arch/x86/kvm/vmx/main.c   | 49 ++++++++++++++++++-----
 arch/x86/kvm/vmx/tdx.c    | 82 ++++++++++++++++++++++++++++++---------
 arch/x86/kvm/vmx/vmx.c    | 46 ++--------------------
 4 files changed, 126 insertions(+), 71 deletions(-)


base-commit: 1b731e5ded480bd1e5546aed35584238661ce72e
-- 
2.43.0

