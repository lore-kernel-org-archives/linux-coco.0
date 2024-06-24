Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E689D13A879
	for <linux-coco@lists.linux.dev>; Mon, 24 Jun 2024 11:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719229333; cv=none; b=Lizsfsz0MrWKyDJzV5WIoSjXjW0u+JWJ2efLoKnaZXx7akl/s85Rfy15GY4lQgr1IPm2Lz4X1tfokMTnn96wfjdfEw/0VcJiNFRMIvn+90Swtsz386VV7iF5vZgNbo7rNrI3Qvs03EEF6+SKdg7RA4Aq5VeBCZ0H0bXmbKnwyWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719229333; c=relaxed/simple;
	bh=iSbfWvXYta9oIC3pQiKk7SO/YQbwSadMdcOSZpo1Kr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=glvM9oCasJBHvjp0mkeaEnpASmRczsSZwLgjuMuHJFneZ/pGNLsuiACnusbqNxod1b2+DgLVeJ3qw4BJcViFNQmX1zI6B+Zt8HR1Z7+j3Nk9UXm/UX+EWOjHzjer5qODthoQYGNMPCgBl7/rcipEPQO4Cpb6haO8r5Y84bYr0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpoWophZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpoWophZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719229331; x=1750765331;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iSbfWvXYta9oIC3pQiKk7SO/YQbwSadMdcOSZpo1Kr8=;
  b=fpoWophZzD557kel/SQmdqvBfFdmrAS5LyOZtzyWiaIkMd++BW8keyxu
   jX+qOx1/MA7uGuBLykjVYaQbJHBxpN9AbBynHKHZn8ixoEl4xqfg9CSwN
   xTfvU6NmHBgFo7S0+U65+pYLgAf7exgh8shzosWdUgQsS2pWKYHFQPnmv
   MEnI1gI2GvSdnXlYW5APavpGQmePHRHEmxJZUVIRXOy7gmOUp6v1HT83k
   32/7m4bYySCLscQvfRMzEdNe1R81PKRV/g53bRYL9U78AUnYjrYNpgajC
   ztO5G6NC6khugyAU+VV5FkB2He0kXRGsqilfJbD4QLVawx6RHT/GaWaxo
   g==;
X-CSE-ConnectionGUID: DCvOyFbaRjyXs/Pd5/Emvg==
X-CSE-MsgGUID: ezNlw5zSSliNJd2XTxIVeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16019286"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="16019286"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 04:42:09 -0700
X-CSE-ConnectionGUID: RvWKRCd7T1GRBP10xmAVYA==
X-CSE-MsgGUID: PNxehxMvTZiuSOfTM/2hSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43713922"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 24 Jun 2024 04:42:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 414A51BD; Mon, 24 Jun 2024 14:42:04 +0300 (EEST)
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
Subject: [PATCHv5 0/4] x86/tdx: Adjust TD settings on boot
Date: Mon, 24 Jun 2024 14:41:45 +0300
Message-ID: <20240624114149.377492-1-kirill.shutemov@linux.intel.com>
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

