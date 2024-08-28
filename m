Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5AE158DDC
	for <linux-coco@lists.linux.dev>; Wed, 28 Aug 2024 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837715; cv=none; b=QPaBCyGlgZCTGe+qJK7gulE2fJ7InUoxdD0PRbxUMK5Hxl+qZ02VQb3zRQdHpZo4HDDn+VyEtuVoiV963FemLKJJoFeyPnD6tBa+NVfK1XXaBCA/JHwzf/QiOZ/8dnoNYuMUWmG6l5xIHfa130BRVixFkBdwBXum4hne6sDzh9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837715; c=relaxed/simple;
	bh=t8JNuYfwtOeTK9Dg36GtLBeI0Y10Y8AjR6Ydwcr+7SY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aW3zdv4l6DkvnI+eBnLahJB3eUCavENDCH6lmMlG71tVeaAKOphOSyyn/e+Y1uj32riZhbf87MCPFG9XYSRW04D2V5NA3vbsdLxAytP/xGEOO1ilaUi7F2oj3EiCwO+jBXqXPOuEe1hAxTUMtvkwiTsHvOMLhCDZ7k9JKXxfFmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8rcGRyc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8rcGRyc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724837715; x=1756373715;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t8JNuYfwtOeTK9Dg36GtLBeI0Y10Y8AjR6Ydwcr+7SY=;
  b=N8rcGRyc1KppR9P1CYIUoGPrqab+ToelQZwFc+YnbrfX7j3XkPki1H4i
   5DUstVsJOQ7GgRxj58PYggiG2aA32E1ZZ5CzCHPEDM0+aHkTk3SslFgCS
   79d2psqk+CLPekCBTPklIpVnK3x3swJ2fP/9NHFMnRk5mmBBkBxpGyhZg
   qaomWqcgYKLDSQBaNmOk5NgoVjkmWUAylhlXXmC8LTcv+9kOl0jxPDdB2
   LDY6FG6m3Rce4tYd6hRLVbYxSaPByicp9uRZGcNr60e2JaAdmB60h46kN
   0FsEveQ9pHPwXKamE23eY0/YOKVP8MvWqB5JCC/RJgNVUPvVAq6UtTy/V
   g==;
X-CSE-ConnectionGUID: mUvVy4/ATh29uDDhXDQZOA==
X-CSE-MsgGUID: Yh7GEbNrRpSf0NTJSsrrMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27123853"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="27123853"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 02:35:14 -0700
X-CSE-ConnectionGUID: l7hfddM3RLe/MAIoF30TWA==
X-CSE-MsgGUID: nX/iouNOQsetzRo4GI2VZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="93879076"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 28 Aug 2024 02:35:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 64761142; Wed, 28 Aug 2024 12:35:10 +0300 (EEST)
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
Subject: [PATCHv6 0/4] x86/tdx: Adjust TD settings on boot
Date: Wed, 28 Aug 2024 12:35:01 +0300
Message-ID: <20240828093505.2359947-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

v6:
 - Updated commit messages and comments;
 - Acks from Kai;
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
2.45.2

