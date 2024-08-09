Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E282194C6F
	for <linux-coco@lists.linux.dev>; Fri,  9 Aug 2024 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723208973; cv=none; b=tATEFO3zRQuCBa7tB8rU+4C9cw/9byuWzsT0c0F7thsDqNoJASXww4Ned7d9YENSJIdD9+lg6e/iBKO4QkqEl3rpUvsj3ElvWFzT78/7vguSC/sc0utksNIN2SGwT6/PLEosj3MQkO8YZS7sifUkhE8uH2TZ790x+syOJc0TXbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723208973; c=relaxed/simple;
	bh=PP8o0uXQr0k92CCJidXH4v3wHNxcydeY2QrhZ93Y2Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Phlyfw3ds65USLJ/T/hZBUfdUOuGTCM8LsZZ30lyCSNixIT3MitabmcwEg/bY3OAgXnLffNO5jMMdaC4rL3wizS1vyJiLhOafaBoEmxi8GBWaWxy3lTcrIwOxrqxVmR4cl3FgtR0Aeekr+q3jtJow4RKA4agdbM0ReRHQJsTNG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DntbDmOo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DntbDmOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723208971; x=1754744971;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PP8o0uXQr0k92CCJidXH4v3wHNxcydeY2QrhZ93Y2Fw=;
  b=DntbDmOo+HnpsMEUCQ+Az4Ry931k2GVooqsfD9Pm2qre+9o5OEMrltp5
   y3nIRn1+sa7yLRS8krGkAeUd8Uif3hd/hiwKuZZjzw3+l3iqDRIMgZmaF
   hqsa7qdk9kfKc5x88TbEeMrMUZ4qey//GGt5aIB0/fgvMEEbcKQob+lCM
   XOZ6a+Exdge95e+7FLQlAVG+jE8oLoKhYbhFyCgGeU6KaGubTdkQ2fYK5
   oQ8IRBS9A2JWbCRmBaYFM6GqzHR3TTuG6D4p7OqHWoXccWvkXxrq+Yr1B
   6otYYgSrT4Z92lK9qXAG2Ca5Ynt/heZWOUiEVykh2nk2gj4CmEXD3QsCQ
   g==;
X-CSE-ConnectionGUID: BecxskrxTdGYpz9nJgbqqw==
X-CSE-MsgGUID: mrVnTNqOQSGW2sYUhMzG5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="46788162"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="46788162"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 06:09:28 -0700
X-CSE-ConnectionGUID: +Sb1hv8/QfWFD6q+tpr6zA==
X-CSE-MsgGUID: Kv7oy5IZQjmyXreJVMdOVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57651636"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 09 Aug 2024 06:09:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id F177F597; Fri, 09 Aug 2024 16:09:24 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCHv5, REBASED 0/4] x86/tdx: Adjust TD settings on boot
Date: Fri,  9 Aug 2024 16:09:19 +0300
Message-ID: <20240809130923.3893765-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset adjusts a few TD settings on boot for the optimal functioning
of the system:

  - Disable EPT violation #VE on private memory if TD can control it

    The newer TDX module allows the guest to control whether it wants to
    see #VE on EPT violation on private memory. The Linux kernel does not
    want such #VEs and needs to disable them.

  - Enable virtualization of topology-related CPUID leafs X2APIC_APICID MSR;

    The ENUM_TOPOLOGY feature allows the VMM to provide topology
    information to the guest. Enabling the feature eliminates
    topology-related #VEs: the TDX module virtualizes accesses to the
    CPUID leafs and the MSR.

    It allows TDX guest to run with non-trivial topology configuration.

v5:
 - Rebased to current tip tree;
v4:
 - Drop unnecessary enumeration;
 - Drop TDG.SYS.RD wrapper;
 - CC stable@ for SEPT disable patch;
 - Update commit messages;
v3:
  - Update commit messages;
  - Rework patches 3/4 and 4/4;
v2:
  - Rebased;
  - Allow write to TDCS_TD_CTLS to fail;
  - Adjust commit messages;
Kirill A. Shutemov (4):
  x86/tdx: Introduce wrappers to read and write TD metadata
  x86/tdx: Rename tdx_parse_tdinfo() to tdx_setup()
  x86/tdx: Dynamically disable SEPT violations from causing #VEs
  x86/tdx: Enable CPU topology enumeration

 arch/x86/coco/tdx/tdx.c           | 140 +++++++++++++++++++++++++-----
 arch/x86/include/asm/shared/tdx.h |  13 ++-
 2 files changed, 130 insertions(+), 23 deletions(-)

-- 
2.43.0

