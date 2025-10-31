Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5C831579B
	for <linux-coco@lists.linux.dev>; Fri, 31 Oct 2025 21:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761946140; cv=none; b=RYFB1Qjn8en1yd/ggtE0cmZaXZraNCq+gVpZ1fKz10aIppwP3MInCt8CtThsL1DS0QU+Q8GCDZpHlSWgsuNFLg+GMgpa6HmMglGNHB/YuzrMUyYwqEuzrwSz1tl9GCOFLCRANUmLXUOpbAz0gJ1T6bkAJakWzvJZaYgYlhsADmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761946140; c=relaxed/simple;
	bh=1G8qRuErF8GgTGqucbYdUsT9Z9+h3SPQ8N4hTV6R9mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZlFpa0Tta37O4Muc2iloALesOUJ7iaKFUzL/JvsS0jc4BF8pSizKI4491R3HokOnIr+9ZlGgDCEnP3ryb6bfQOBM3x++rhbAVjlZewMl6HFARHN9Ef5fW4P8hjCT+W8NF+hmsH1Yu7NzV2HGNObKatB8vZueJ3zT0E/GfQOpdCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqVuyFPQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqVuyFPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761946138; x=1793482138;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1G8qRuErF8GgTGqucbYdUsT9Z9+h3SPQ8N4hTV6R9mI=;
  b=AqVuyFPQWbvuQnA3pPjnll9PxuvKg3B0Q/7QtnWlxjt/cNi31Iz9Lr4t
   BD+67ryBaJwVswfUAqnv4fM2hQ53NpgtYTGlpJqm58mj387K/43oWql8g
   BsZaokQon1pmE8FfSq2ICWeKoHrdJr3yLKetQUgXRGuGhmU4fusfliM/4
   w3hme5dHJTJNVLZI/H7podcS/JTCmbRlPJfwvKqceSfuxjWcig8yA585/
   g54V50QaDG1Zzlgtxop+tXuyyCo/CwWAo4idilz0J/mu1HhafxvKYOr2m
   0f/bDVHgvmYgnr6yqiHgP9w3WXYGPl7IFNrBeOyvoPfsft6jYq+w1GDKN
   Q==;
X-CSE-ConnectionGUID: 2eXOaWHYT2WYeC5VJbb3bA==
X-CSE-MsgGUID: HEvXyHSBQXamMtboEGuV7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64043618"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64043618"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 14:28:58 -0700
X-CSE-ConnectionGUID: h7iZ9APtT4yLqWJgAMegYQ==
X-CSE-MsgGUID: ngcy0mRNQC2NP7mHij0o9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="216986651"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2025 14:28:59 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-pci@vger.kernel.org
Cc: linux-coco@lists.linux.dev,
	gregkh@linuxfoundation.org,
	aik@amd.com,
	aneesh.kumar@kernel.org,
	yilun.xu@linux.intel.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lukas Wunner <lukas@wunner.de>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v8 0/9] PCI/TSM: Core infrastructure for PCI device security (TDISP)
Date: Fri, 31 Oct 2025 14:28:52 -0700
Message-ID: <20251031212902.2256310-1-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes since v7 [1]:
- Pick up Reviewed-by tags from Jonathan, Alexey, and Aneesh.
- Simplify put_tsm_dev() (Jonathan)
- Misc cleanups (Jonathan)
- Drop IDR usage (switched to class_find_device()) (Carlos)
- Keep local drivers/bus/pci.c style for pci_walk_bus_reverse() (Jonathan)
- Clarify commit message for "PCI/TSM: Establish Secure Sessions and
  Link Encryption" (Jonathan)
- Fixup up documentation for 'struct pci_tsm_ops' (Jonathan)
- Clarify DSM lifetime comment (Jonathan)
- Fix alloc_stream_index() when the host bridge supports 256 streams
  (Aneesh)
- Drop PCI_IDE_ATTR_GROUP in favor of ifdef in C (Jonathan)
- Mirror setup sequence at unwind in tsm_unregister() (Jonathan)

[1]: http://lore.kernel.org/20251024020418.1366664-1-dan.j.williams@intel.com

This set will be available on Monday at
https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/log/?h=staging
(rebasing branch) or devsec-20251103 (immutable tag). That branch
additionally contains address association support, Stream ID uniqueness
compability quirk, updated samples/devsec/ (now with multifunction
device and simple bind support), and an updated preview of v2 of "[PATCH
0/7] PCI/TSM: TEE I/O infrastructure" (fixes x86 encrypted ioremap and
other changes) [2].

[2]: http://lore.kernel.org/20250827035259.1356758-1-dan.j.williams@intel.com

It passes an updated regression test using samples/devsec/. See this
commit on the staging branch for that test:

https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/commit/?id=44932bffdcc1

Status: sufficient review for linux-next
----------------------------------------
Thanks to the folks that gave this topic another review this past week.
At this point it feels ready for linux-next exposure especially after
seeing work-in-progress rebases for SEV-TIO, CCA, and TDX Connect.

Next steps:
-----------
- Push this series to linux-next

- Post the next rev of "PCI/TSM: TEE I/O infrastructure"

- See at least one vendor "connect" implementation queued in an arch
  tree, or pull one into tsm.git

Updated Cover letter:
---------------------

Trusted execution environment (TEE) Device Interface Security Protocol
(TDISP) is a chapter name in the PCI Express Base Specification (r7.0).
It describes an alphabet soup of mechanisms, SPDM, CMA, IDE, TSM/DSM,
that system software uses to establish trust in a device and assign it
to a confidential virtual machine (CVM). It is a protocol for
dynamically extending the Trusted Computing Boundary (TCB) of a CVM with
a PCI device interface enabled to issue DMA to CVM private memory.

The acronym soup problem is extended by each platform architecture
having distinct TEE Security Manager (TSM) API implementations /
capabilities, and each endpoint Device Security Manager (DSM) having its
own idiosyncratic behaviors and requirements around TDISP state
transitions.

Despite all that opportunity for differentiation, there is a significant
portion of the implementation that is cross-vendor common. The PCI/TSM
extension of the PCI core subsystem is a library for TSM drivers to
establish link encryption and enable device access to confidential
memory.

This foundational phase is focused on host-side link encryption, the
next phase focuses on guest-side locking and accepting devices, the
phase after that focuses on all the host-side setup for private DMA and
private MMIO. There are more phases beyond that, like device
attestation, but the goal is upstream manageable incremental steps that
provide tangible value to Linux at each step.

Dan Williams (9):
  coco/tsm: Introduce a core device for TEE Security Managers
  PCI/IDE: Enumerate Selective Stream IDE capabilities
  PCI: Introduce pci_walk_bus_reverse(), for_each_pci_dev_reverse()
  PCI/TSM: Establish Secure Sessions and Link Encryption
  PCI: Add PCIe Device 3 Extended Capability enumeration
  PCI: Establish document for PCI host bridge sysfs attributes
  PCI/IDE: Add IDE establishment helpers
  PCI/IDE: Report available IDE streams
  PCI/TSM: Report active IDE streams

 drivers/pci/Kconfig                           |  18 +
 drivers/virt/coco/Kconfig                     |   3 +
 drivers/pci/Makefile                          |   2 +
 drivers/virt/coco/Makefile                    |   1 +
 Documentation/ABI/testing/sysfs-bus-pci       |  51 ++
 Documentation/ABI/testing/sysfs-class-tsm     |  19 +
 .../ABI/testing/sysfs-devices-pci-host-bridge |  45 ++
 Documentation/driver-api/pci/index.rst        |   1 +
 Documentation/driver-api/pci/tsm.rst          |  21 +
 drivers/pci/pci.h                             |  19 +
 include/linux/device/bus.h                    |   3 +
 include/linux/pci-doe.h                       |   4 +
 include/linux/pci-ide.h                       |  81 +++
 include/linux/pci-tsm.h                       | 157 +++++
 include/linux/pci.h                           |  28 +
 include/linux/tsm.h                           |  17 +
 include/uapi/linux/pci_regs.h                 |  89 +++
 drivers/base/bus.c                            |  38 ++
 drivers/pci/bus.c                             |  39 ++
 drivers/pci/doe.c                             |   2 -
 drivers/pci/ide.c                             | 587 ++++++++++++++++
 drivers/pci/pci-sysfs.c                       |   4 +
 drivers/pci/probe.c                           |  31 +-
 drivers/pci/remove.c                          |   6 +
 drivers/pci/search.c                          |  62 +-
 drivers/pci/tsm.c                             | 643 ++++++++++++++++++
 drivers/virt/coco/tsm-core.c                  | 163 +++++
 MAINTAINERS                                   |   7 +-
 28 files changed, 2128 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-tsm
 create mode 100644 Documentation/ABI/testing/sysfs-devices-pci-host-bridge
 create mode 100644 Documentation/driver-api/pci/tsm.rst
 create mode 100644 include/linux/pci-ide.h
 create mode 100644 include/linux/pci-tsm.h
 create mode 100644 drivers/pci/ide.c
 create mode 100644 drivers/pci/tsm.c
 create mode 100644 drivers/virt/coco/tsm-core.c


base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
-- 
2.51.0

