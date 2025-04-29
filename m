Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D1B223338
	for <linux-coco@lists.linux.dev>; Tue, 29 Apr 2025 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745904828; cv=none; b=N20vH36HmQlL9G7ngqCwitd5F0rBMbTGudDSWnSfBxohryWYrhfDQaS+iLuy+GMyEcEmbVZ8jMDwtg062FxsRTA+nxRqlAHzbyvyac+BAZLCLkKqMmdpzFjqqNAMWszFYPNZzSPYMWEvS9sQdJ3dZsWiUT6sqdGyiZNtZcfaKWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745904828; c=relaxed/simple;
	bh=xp2q1oLovaG2gCi+D9VlJbURJtJtK22UvOxVmFRhCwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f43EDKhvQaT/6wpE+y0gq1d4xfGcUgBtmMDouFWYQM7fFZqXOjmwI9twAo2w2+gZIOjD6423nSVJDyzta0dYwM8WMd8HOTAiILIqHWBvHDxEwOPgShk8awaWsW8gyO8OVCouyZKGcisJ0+9Hq/UIhshkYrD4lUkd28GeWa752R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQmOwKN6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQmOwKN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745904827; x=1777440827;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xp2q1oLovaG2gCi+D9VlJbURJtJtK22UvOxVmFRhCwI=;
  b=kQmOwKN6mgPsW7zlnjjGpZ79nfQFwYABj1K+zszQzKdsRxapjrwmD5/4
   JGgMaAJ92RA6y1tHTLojwynJo+i2HkHJprGf35s/2wprDa9R/ZNHwT3md
   5Wj/ZPv69kMYTEkuuJW0R1zcTiCNUdQf/d24tjYcn7j60TsXPTvhqATIw
   NLZmevHz8QZXg2rZJenmusSq9Ne3PfWyRAJJTtvYJDJ2Ydz5ctBnmMxpq
   yg5PoenQmrpq81dSdf4FCCXPW+dZF6mN/66Xi1OCkc6mFhz9iD7bNM+9R
   yATn36fhy3Z2p+lEFOoQN32JxuYRTxoFj88AMr8SMK10idzD/QX1eMbT6
   Q==;
X-CSE-ConnectionGUID: D4IugmlHQiSyYCBOn8iFhQ==
X-CSE-MsgGUID: KFZ/i1jASiCaPvI92MhJxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47401601"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47401601"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 22:33:47 -0700
X-CSE-ConnectionGUID: bqJyseuTTT+Woue+n/go7Q==
X-CSE-MsgGUID: nrguRKTSQfu1sn9UJVNr4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138532242"
Received: from unknown (HELO CannotLeaveINTEL.bj.intel.com) ([10.238.153.146])
  by fmviesa005.fm.intel.com with ESMTP; 28 Apr 2025 22:33:44 -0700
From: Jun Miao <jun.miao@intel.com>
To: kirill.shutemov@linux.intel.com,
	ave.hansen@linux.intel.com
Cc: x86@kernel.org,
	linux-coco@lists.linux.dev,
	jun.miao@intel.com,
	fan.du@intel.com,
	zhiquan1.li@intel.com
Subject: [PATCH 0/1][Bug Report] and fix TDX cpuid0x2 #VE causing segfault
Date: Tue, 29 Apr 2025 09:29:17 -0400
Message-ID: <20250429132918.1284811-1-jun.miao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi

[TDX Bug Report]

There is a segfault, when boot a upstream kernel as TDX guest.
- Boot log:
[   46.902055] systemd[1]: segfault at 55c974b82650 ip 00007f252eef09c2 sp 00007ffcd94fe7b8 error 4 in libc.so.6[7f252ee28000+175000] likely on CPU 1 (core 1, socket 0)
[   46.903302] Code: 00 0f 18 8e 00 31 00 00 0f 18 8e 40 31 00 00 0f 18 8e 80 31 00 00 0f 18 8e c0 31 00 00 62 e1 fe 48 6f 06 62 e1 fe 48 6f 4e 01 <62> e1 fe 48 6f 66 40 62 e1 fe 48 6f 6e 41 62 61 fe 48 6f 86 00 20
[   46.905516] systemd[1]: Caught <SEGV> from PID 1958225488.
[   46.921256] systemd[1]: Caught <SEGV>, dumped core as pid 346.
[   46.922056] systemd[1]: Freezing execution.

- Gest kernel version:
  Linux version 6.15.0-rc4
- Guest qcow2:
  rhel-guest-image-9.2-20230414.17.x86_64.qcow2
- TDX module info:
  TDX module: 1.5.16.00.0869 (build_date 20250219, Production module), TDX_FEATURES0 0x226f3f0fbf
  TDX_FEATURES0.VE_REDUCTION (bit 30) = 1
  TDX_FEATURES0.CPUID2_VIRT (bit 29) = 1

The root cases:
Glibc 2.34 and newer segfault if CPUID leaf 0x2 reports zero.
https://sourceware.org/bugzilla/show_bug.cgi?id=30037
That is #VE on CPUID leaf 0x2 is handled by returning all-0 to the code which executed CPUID.
In many cases, an all-0 value is not the correct value, and may cause improper operation.
Although, the bits of VE_REDUCETION and VIRT_CPUID2 are marked "1" as supported in TDX FEATURES0, their functionality fails during runtime stress tests.


[Solution]

Add VIRT_CPUID2 virtualization if REDUCE_VE was not successful to avoiding the segfault when glibc invoked the CPUID leaf 0x2.
Since the enable_cpu_topology_enumeration() was very little and can be integrated into reduce_unnecessary_ve().

[PATCH 1/1] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE was not successful

***  ***

Zhiquan Li (1):
  x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE was not
    successful

 arch/x86/coco/tdx/tdx.c | 56 +++++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 21 deletions(-)

-- 
2.43.0

