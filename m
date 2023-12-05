Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E154781F
	for <linux-coco@lists.linux.dev>; Tue,  5 Dec 2023 00:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIoxRmim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701737129; x=1733273129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BXT87HuHx1IXeFYwiHOiVWUcms/fvvDi+Ha0MJa2ebw=;
  b=VIoxRmimhkjgzknh+08m3U3jjd09Tt0tcOVbgWYleykQKRmUw/lBCMmn
   rA7EpTDR7Uc1fg4KzB6oC7owNSVnUvlKmGBCQj52ly3I2iFrq++2WKWbr
   EANjjFSQGIFqw0ZCnOObVdwoL5i7efvRe+JeBE6MD6kshkISYxKDbPX4N
   CU06MtMQ7r7ns3bQ37prjYuCTZu74c+VpawunI5UzOSvtN64Nwx52Jq1e
   4du0KA4IjIDQt+pB0K/xrQ9JWufGtWmQBnRK1CCxfDE3lFg7nrQqRThrG
   qU/n0y5QU0fInaFc6ca50yXX+RpTFuIGDO1lO7J3xzpTh0oeRJceqo37o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="392688616"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="392688616"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 16:45:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888704374"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="888704374"
Received: from abijaz-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.61.240])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 16:45:22 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 3177310A43D; Tue,  5 Dec 2023 03:45:20 +0300 (+03)
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
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>,
	Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv4 00/14] x86/tdx: Add kexec support
Date: Tue,  5 Dec 2023 03:44:56 +0300
Message-ID: <20231205004510.27164-1-kirill.shutemov@linux.intel.com>
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

The last patch implements CPU offlining according to the approved ACPI
spec change poposal[1]. It unlocks kexec with all CPUs visible in the target
kernel. It requires BIOS-side enabling. If it missing we fallback to booting
2nd kernel with single CPU.

Please review. I would be glad for any feedback.

v4:
  - Fix build for !KEXEC_CORE;
  - Cleaner ATLERNATIVE use;
  - Update commit messages and comments;
  - Add Reviewed-bys;
v3:
  - Rework acpi_mp_crash_stop_other_cpus() to avoid invoking hotplug state
    machine;
  - Free page tables if reset vector setup failed;
  - Change asm_acpi_mp_play_dead() to pass reset vector and PGD as arguments;
  - Mark acpi_mp_* variables as static and __ro_after_init;
  - Use u32 for apicid;
  - Disable CPU offlining if reset vector setup failed;
  - Rename madt.S -> madt_playdead.S;
  - Mark tdx_kexec_unshare_mem() as static;
  - Rebase onto up-to-date tip/master;
  - Whitespace fixes;
  - Reorder patches;
  - Add Reviewed-bys;
  - Update comments and commit messages;
v2:
  - Rework how unsharing hook ups into kexec codepath;
  - Rework kvmclock_disable() fix based on Sean's;
  - s/cpu_hotplug_not_supported()/cpu_hotplug_disable_offlining()/;
  - use play_dead_common() to implement acpi_mp_play_dead();
  - cond_resched() in tdx_shared_memory_show();
  - s/target kernel/second kernel/;
  - Update commit messages and comments;

[1] https://lore.kernel.org/all/13356251.uLZWGnKmhe@kreacher

Kirill A. Shutemov (14):
  x86/acpi: Extract ACPI MADT wakeup code into a separate file
  x86/apic: Mark acpi_mp_wake_* variables as __ro_after_init
  cpu/hotplug: Add support for declaring CPU offlining not supported
  cpu/hotplug, x86/acpi: Disable CPU offlining for ACPI MADT wakeup
  x86/kvm: Do not try to disable kvmclock if it was not enabled
  x86/kexec: Keep CR4.MCE set during kexec for TDX guest
  x86/mm: Make x86_platform.guest.enc_status_change_*() return errno
  x86/mm: Return correct level from lookup_address() if pte is none
  x86/tdx: Account shared memory
  x86/tdx: Convert shared memory back to private on kexec
  x86/mm: Make e820_end_ram_pfn() cover E820_TYPE_ACPI ranges
  x86/acpi: Rename fields in acpi_madt_multiproc_wakeup structure
  x86/acpi: Do not attempt to bring up secondary CPUs in kexec case
  x86/acpi: Add support for CPU offlining for ACPI MADT wakeup method

 arch/x86/Kconfig                     |   7 +
 arch/x86/coco/core.c                 |   1 -
 arch/x86/coco/tdx/kexec.c            |   0
 arch/x86/coco/tdx/tdx.c              | 205 ++++++++++++++-
 arch/x86/hyperv/ivm.c                |   9 +-
 arch/x86/include/asm/acpi.h          |   5 +
 arch/x86/include/asm/pgtable_types.h |   1 +
 arch/x86/include/asm/smp.h           |   1 +
 arch/x86/include/asm/x86_init.h      |   5 +-
 arch/x86/kernel/acpi/Makefile        |  11 +-
 arch/x86/kernel/acpi/boot.c          |  86 +------
 arch/x86/kernel/acpi/madt_playdead.S |  21 ++
 arch/x86/kernel/acpi/madt_wakeup.c   | 363 +++++++++++++++++++++++++++
 arch/x86/kernel/crash.c              |   4 +
 arch/x86/kernel/e820.c               |   9 +-
 arch/x86/kernel/kvmclock.c           |  12 +-
 arch/x86/kernel/reboot.c             |  22 +-
 arch/x86/kernel/relocate_kernel_64.S |   3 +
 arch/x86/kernel/x86_init.c           |   4 +-
 arch/x86/mm/mem_encrypt_amd.c        |   8 +-
 arch/x86/mm/pat/set_memory.c         |  17 +-
 include/acpi/actbl2.h                |  19 +-
 include/linux/cc_platform.h          |  10 -
 include/linux/cpu.h                  |   2 +
 kernel/cpu.c                         |  12 +-
 25 files changed, 689 insertions(+), 148 deletions(-)
 create mode 100644 arch/x86/coco/tdx/kexec.c
 create mode 100644 arch/x86/kernel/acpi/madt_playdead.S
 create mode 100644 arch/x86/kernel/acpi/madt_wakeup.c

-- 
2.41.0

