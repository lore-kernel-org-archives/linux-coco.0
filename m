Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3E23DC84C
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223048; cv=none; b=Z7zsHfKsP/VkmnYbOllKz+2bULA018mFhFWlcBMiDHypixaT9aZXJbjre+DxVan5yPwIqgHGAsKY2jZaQYVDB7VsRG7BZE9JUk/3c3xZGWIRU1maFGapLTfwGdnzN+aj6u+2IFDoDid0vt2Rc/6aA2fKAYoPhUqEp1JcRPlCsUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223048; c=relaxed/simple;
	bh=JQa5FNeWED3rrZq0gAECLsVrZmVq3d+PNBvpEZdW1eA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhdVFCNajkDnlO4V3TZkexZ7ta68dxd9Zklq2WN8CbUpAzHEtU7WeT3XRbjOtohZy2957/ShHwDx7sUvP9xzfqIRhpIR36gBNg5nd3eGIGhb0EaCN/JotuDBgl6unXOdSNfXNESCBDWLUwdYoSKtm85Q+Z5Nep5031Q3irjtlvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EavQoMuu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EavQoMuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223046; x=1821759046;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JQa5FNeWED3rrZq0gAECLsVrZmVq3d+PNBvpEZdW1eA=;
  b=EavQoMuusCJdUGrfJ/oghDyFtkIG2IczYVIPMwWqE2PF2i0RJomJN7p3
   /A46QkN5w/NdP5IcnqE1LquA0kUKDh8Klhdn22+Qt98G8kga47M4cJNSn
   3cjWv0rY2x4l0vHl4IBS1MKvuVCMQg4xQK1lFCZospzh1dhCKwsHqeecG
   TnyuBPaNfBQuCGAHTKLImmiobirbs6gSPjTbPZ+n97hqajkwZLOXBqAFO
   YVl/Z80nCDnukrfLZeyZ8kPsd2hYKcfWJxS8iiSuAoVdLJGZGrQRGtqUv
   bNKYHwQEL8hag6aEsVRyJ6hJarVRQeMijMFgwEu9hNRt6meDdEO7aNJRJ
   Q==;
X-CSE-ConnectionGUID: cCRWI3V2Tka/4eqqG2ZjXw==
X-CSE-MsgGUID: NuOB7lr8Sim3AEz6hf0EnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002425"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002425"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:10:45 -0700
X-CSE-ConnectionGUID: hDeiAdZbTFCnfENQjTq84Q==
X-CSE-MsgGUID: amnt4uz+QVyzQ9HozFFyLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009284"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:10:41 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@intel.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	jgg@nvidia.com,
	nicolinc@nvidia.com,
	aik@amd.com,
	aneesh.kumar@kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	yilun.xu@linux.intel.com,
	chao.gao@intel.com,
	vishal.l.verma@intel.com,
	xiaoyao.li@intel.com,
	kevin.tian@intel.com,
	chao.p.peng@intel.com
Subject: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect PCIe TDISP (phase2)
Date: Thu, 24 Sep 2026 12:10:17 +0800
Message-ID: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a complete TDX Connect phase 2 guest-side implementation. It's
based on Dan's last TSM Phase2 [1](rebased to v7.3-rc4), plus Nicolin's
PATCH3-4 in [2] to address Jason's comments at [3].

We are posting the entire sequence together with two primary objectives:

1. We're sharing our TSM Phase 2 implementation to kick off some early
   design alignment on cross-architecture paradigms. This is geared toward
   community feedback rather than formal TSM maintainer review.

2. TDX developers have been working on the TDX module facing patches (the
   wrappers) which are not expected to change significantly unless a
   fundamental redesign of the generic guest TSM core occurs. So comments
   on those patches are welcomed.

TDX Connect Background
======================

TDX Connect extends basic TDX with low-level guest and host interfaces
to establish trust for TDISP-supported devices. To ensure security
isolation, the architecture delegates only non-security-sensitive,
auxiliary operations (such as physical routing) to the untrusted host.
Meanwhile, the guest retains full governance over all secure operations,
e.g., strictly controlling access to private MMIO in LOCKED state by
requiring explicit guest actions, such as MMIO acceptance.

PATCH Organization
==================

This series is structured into four distinct, logical subsections based on
secure operations to facilitate review.

1. Unlock <-> Lock Flow (patch1-6):
   Handles the TDI device's TDISP state transitions, initiated via the PCI
   TSM sysfs interface (/sys/bus/pci/devices/.../tsm/[un]lock).
   - adds tdx tsm guest driver framework
   - adds TDCM hypercall infrastructure
   - queries device's TEE-IO capability with TDCM_OP_CHECK_TEEIO_SUPP hypercall
   - transitions TDI device to TDI_STATE_CONFIG_[UN]LOCKED with TDCM_OP_[UN]BIND
     hypercall

2. Private MMIO Acceptance (patch7-10):
   Private MMIO ranges described in the TDI Report must be accepted by TDX
   module before guest access is permitted.
   - capture TDI report in lock().
   - accept each MMIO range mapped in Secure EPT (SEPT).

3. TDI Activation (patch11-12):
   Guest transitions the TDI into the active RUN state after MMIO
   acceptance.
   - guest calls TDG.TDI.START, passing the Bind Session ID recorded
     during the lock phase. This guarantees that the guest authorizes the
     activation of the same bind instance the host established.
   - guest notifies the host via TDCM_OP_START_TDI to finalize host side
     hardware setup, e.g., switch TDISP state to RUN.

4. Private DMA Acceptance (patch13-15):
   Before a TDI can perform DMA to guest private memory, its secure DMA
   mapping must also be accepted. This happens during driver load stage.
   - the enable_dma callback issues TDG.DMAR.ACCEPT to set secure PASID
     table entry to present state.
   - the secure PASID table entry is cleared in unlock stage implicitly
     so disable_dma is a no-op currently.

This series originates from a PoC written by Yilun, thanks to him for his
foundational work.

The whole tree is here [4], please comment. Thanks.

BRs,
Zhenzhong

[1] https://lore.kernel.org/linux-coco/20260705220819.2472765-1-djbw@kernel.org/
[2] https://lore.kernel.org/all/cover.1789010941.git.nicolinc@nvidia.com/
[3] https://lore.kernel.org/all/20260916124849.GD3196566@ziepe.ca/
[4] https://github.com/intel-staging/tdx/tree/v7.3-rc4_tdx_connect_phase2.for_upstream

Zhenzhong Duan (15):
  x86/tdx: Export tdg_vm_rd() for tdx-guest module
  x86/tdx: Add TDCM hypercall wrapper for TDX Connect
  x86/tdx: Add TDG.TDI.RD module call wrapper for TDX Connect
  virt: tdx-guest: Support devsec TSM for secure devices
  virt: tdx-guest: Add TDCM helpers and TEE-IO support check
  virt: tdx-guest: Support TDI bind and unbind operations
  PCI/TSM: Track Device Interface Report MMIO range index
  x86/tdx: Add TDG.MMIO.ACCEPT module call wrapper for TDX Connect
  virt: tdx-guest: Capture the TDI report during device lock
  virt: tdx-guest: Set up and accept private MMIO ranges
  x86/tdx: Add TDG.TDI.START module call wrapper for TDX Connect
  virt: tdx-guest: Support Trust Device Interface (TDI) activation
  x86/tdx: Add __tdcall_saved() helper
  x86/tdx: Add TDG.DMAR.ACCEPT module call wrapper for TDX Connect
  virt: tdx-guest: Accept default DMAR entry during PCI driver attach

 arch/x86/coco/tdx/Makefile                    |   2 +
 arch/x86/coco/tdx/tdcall.S                    |  17 +
 arch/x86/coco/tdx/tdx.c                       |   8 +-
 arch/x86/coco/tdx/tdx_connect.c               | 166 ++++++
 arch/x86/include/asm/shared/tdx.h             |   7 +
 arch/x86/include/asm/tdx.h                    |  77 +++
 drivers/pci/tsm/core.c                        |   1 +
 drivers/virt/coco/tdx-guest/Kconfig           |  15 +
 drivers/virt/coco/tdx-guest/Makefile          |   3 +
 drivers/virt/coco/tdx-guest/connect.c         | 474 ++++++++++++++++++
 .../coco/tdx-guest/{tdx-guest.c => main.c}    |   6 +
 drivers/virt/coco/tdx-guest/tdx-guest.h       |  20 +
 include/linux/pci-tsm.h                       |   1 +
 13 files changed, 791 insertions(+), 6 deletions(-)
 create mode 100644 arch/x86/coco/tdx/tdx_connect.c
 create mode 100644 drivers/virt/coco/tdx-guest/connect.c
 rename drivers/virt/coco/tdx-guest/{tdx-guest.c => main.c} (98%)
 create mode 100644 drivers/virt/coco/tdx-guest/tdx-guest.h

-- 
2.52.0

