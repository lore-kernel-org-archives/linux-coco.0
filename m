Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF475125A3
	for <linux-coco@lists.linux.dev>; Thu,  5 Oct 2023 13:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYTGLvi8"
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696511794; x=1728047794;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZXJ1Loo2clcYjSHbu/5/7ENvQ/32ZeG1I2EOrnfZPoM=;
  b=iYTGLvi8jfL/+ragLZnAdCJg8RWS6pJ7+LefKgbp2LHHwZU8g22lf+d0
   BzXwjRpDOdDQ2Z9xqef4OE2FL6DCvaMc5WgY/7MEPWBT4pe47iaBX8Y2u
   S8ho/RyKH8isHTnf2PPlB8KuW9bkYWkpdSazhLiCtTqwSqiSO4tu3zimk
   ieWszjWDDrYxR5IlWclcDnZrJXPkgFMyEUF3OC6u7HrJ4oOPqVTDHt40L
   Q22eHYeo0Uqh/HqUmnwDIJ/MpL7N6Gktgn0NMbX21Xq/st+7V24KxYJBP
   R3xkPODL3UnrFF4UxKTDpgCtsRIY8J2mXPit2DkrCgf7gXRpBzsU04kzd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="380767050"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="380767050"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="728449203"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="728449203"
Received: from skwasnia-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.222.71])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:14:16 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 0F3D410A12D; Thu,  5 Oct 2023 16:14:14 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe  <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	kexec@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 00/13] x86/tdx: Add kexec support
Date: Thu,  5 Oct 2023 16:13:49 +0300
Message-ID: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset adds bits and pieces to get kexec (and crashkernel) work on
TDX guest.

They bring kexec support to the point when we can start the new kernel,
but it will only be able to use single CPU. It should be enough to cover
the most common case: crashkernel.

The last patch implements CPU offlining according to the approved ACPI
spec change poposal[1]. It unlocks kexec with all CPUs visible in the target
kernel.

Please review. I would be glad for any feedback.

[1] https://lore.kernel.org/all/13356251.uLZWGnKmhe@kreacher

Kirill A. Shutemov (13):
  x86/acpi: Extract ACPI MADT wakeup code into a separate file
  kernel/cpu: Add support for declaring CPU hotplug not supported
  cpu/hotplug, x86/acpi: Disable CPU hotplug for ACPI MADT wakeup
  x86/kvm: Do not try to disable kvmclock if it was not enabled
  x86/kexec: Keep CR4.MCE set during kexec for TDX guest
  x86/mm: Make x86_platform.guest.enc_status_change_*() return errno
  x86/mm: Return correct level from lookup_address() if pte is none
  KVM: x86: Add config option to gate emergency virt callback support
  x86/tdx: Account shared memory
  x86/tdx: Convert shared memory back to private on kexec
  x86/mm: Make e820_end_ram_pfn() cover E820_TYPE_ACPI ranges
  x86/acpi: Do not attempt to bring up secondary CPUs in kexec case
  x86/acpi: Add support for CPU offlining for ACPI MADT wakeup method

 arch/x86/Kconfig                     |   8 +
 arch/x86/coco/core.c                 |   1 -
 arch/x86/coco/tdx/kexec.c            |   0
 arch/x86/coco/tdx/tdx.c              | 220 +++++++++++++++++++++-
 arch/x86/hyperv/ivm.c                |   9 +-
 arch/x86/include/asm/acpi.h          |   5 +
 arch/x86/include/asm/pgtable_types.h |   1 +
 arch/x86/include/asm/reboot.h        |   4 +-
 arch/x86/include/asm/x86_init.h      |   4 +-
 arch/x86/kernel/acpi/Makefile        |  11 +-
 arch/x86/kernel/acpi/boot.c          |  88 +--------
 arch/x86/kernel/acpi/madt.S          |  28 +++
 arch/x86/kernel/acpi/madt_wakeup.c   | 262 +++++++++++++++++++++++++++
 arch/x86/kernel/e820.c               |   9 +-
 arch/x86/kernel/kvmclock.c           |   9 +-
 arch/x86/kernel/reboot.c             |   4 +-
 arch/x86/kernel/relocate_kernel_64.S |   5 +
 arch/x86/kernel/x86_init.c           |   4 +-
 arch/x86/kvm/Kconfig                 |   5 +
 arch/x86/mm/mem_encrypt_amd.c        |   8 +-
 arch/x86/mm/pat/set_memory.c         |  17 +-
 include/acpi/actbl2.h                |  19 +-
 include/linux/cc_platform.h          |  10 -
 include/linux/cpu.h                  |   2 +
 kernel/cpu.c                         |  17 +-
 25 files changed, 604 insertions(+), 146 deletions(-)
 create mode 100644 arch/x86/coco/tdx/kexec.c
 create mode 100644 arch/x86/kernel/acpi/madt.S
 create mode 100644 arch/x86/kernel/acpi/madt_wakeup.c

-- 
2.41.0

