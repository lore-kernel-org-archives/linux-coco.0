Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8E91848
	for <linux-coco@lists.linux.dev>; Tue, 17 May 2022 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652801705; x=1684337705;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dQmG2pBx6efTJZuUSuJPwLK2pMKYkkt2bP5q7lj134c=;
  b=iyXkf4ZtgJuoyyQDF38VHPhsXRyhStGUekD8WQMePxDGSbF3dPfAlYT6
   IM5nAbuz5H5gJwq9NLX54rv61Alt2O7htQJAPJbEm1XPaVgha8yRSIn0E
   qdubu9zC4AIFz757rgkEYpPv2IQp9dBTZaKnw6vOW6+BE43NK0HeBcJOa
   AnvqLAPIvT6AoqDOiEktb/+hJUWQnekJKlnPD0QGMGUiQduydnJFhnLyO
   mEmlzxAMZisepXUa2bmDyqllpNe5qvO/+xOprvS1SYrR9xgFh3CbWFazK
   5Aoso3/O0XMXPHHwXvseHY2bjPLyv++KOzUjHvPZEfaBQ1ncRsblXBzeq
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="268803729"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="268803729"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 08:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="713901584"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 17 May 2022 08:34:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 48B97159; Tue, 17 May 2022 18:34:50 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	marcelo.cerri@canonical.com,
	tim.gardner@canonical.com,
	khalid.elmously@canonical.com,
	philip.cox@canonical.com,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv6 00/15] mm, x86/cc: Implement support for unaccepted memory
Date: Tue, 17 May 2022 18:34:29 +0300
Message-Id: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UEFI Specification version 2.9 introduces the concept of memory
acceptance: some Virtual Machine platforms, such as Intel TDX or AMD
SEV-SNP, requiring memory to be accepted before it can be used by the
guest. Accepting happens via a protocol specific for the Virtual
Machine platform.

Accepting memory is costly and it makes VMM allocate memory for the
accepted guest physical address range. It's better to postpone memory
acceptance until memory is needed. It lowers boot time and reduces
memory overhead.

The kernel needs to know what memory has been accepted. Firmware
communicates this information via memory map: a new memory type --
EFI_UNACCEPTED_MEMORY -- indicates such memory.

Range-based tracking works fine for firmware, but it gets bulky for
the kernel: e820 has to be modified on every page acceptance. It leads
to table fragmentation, but there's a limited number of entries in the
e820 table

Another option is to mark such memory as usable in e820 and track if the
range has been accepted in a bitmap. One bit in the bitmap represents
2MiB in the address space: one 4k page is enough to track 64GiB or
physical address space.

In the worst-case scenario -- a huge hole in the middle of the
address space -- It needs 256MiB to handle 4PiB of the address
space.

Any unaccepted memory that is not aligned to 2M gets accepted upfront.

The approach lowers boot time substantially. Boot to shell is ~2.5x
faster for 4G TDX VM and ~4x faster for 64G.

TDX-specific code isolated from the core of unaccepted memory support. It
supposed to help to plug-in different implementation of unaccepted memory
such as SEV-SNP.

The tree can be found here:

https://github.com/intel/tdx.git guest-unaccepted-memory

v6:
 - Fix load_unaligned_zeropad() on machine with unaccepted memory;
 - Clear PageUnaccepted() on merged pages, leaving it only on head;
 - Clarify error handling in allocate_e820();
 - Fix build with CONFIG_UNACCEPTED_MEMORY=y, but without TDX;
 - Disable kexec at boottime instead of build conflict;
 - Rebased to tip/master;
 - Spelling fixes;
 - Add Reviewed-by from Mike and David;
v5:
 - Updates comments and commit messages;
   + Explain options for unaccepted memory handling;
 - Expose amount of unaccepted memory in /proc/meminfo
 - Adjust check in page_expected_state();
 - Fix error code handling in allocate_e820();
 - Centralize __pa()/__va() definitions in the boot stub;
 - Avoid includes from the main kernel in the boot stub;
 - Use an existing hole in boot_param for unaccepted_memory, instead of adding
   to the end of the structure;
 - Extract allocate_unaccepted_memory() form allocate_e820();
 - Complain if there's unaccepted memory, but kernel does not support it;
 - Fix vmstat counter;
 - Split up few preparatory patches;
 - Random readability adjustments;
v4:
 - PageBuddyUnaccepted() -> PageUnaccepted;
 - Use separate page_type, not shared with offline;
 - Rework interface between core-mm and arch code;
 - Adjust commit messages;
 - Ack from Mike;
Kirill A. Shutemov (15):
  x86/boot: Centralize __pa()/__va() definitions
  mm: Add support for unaccepted memory
  efi/x86: Get full memory map in allocate_e820()
  x86/boot: Add infrastructure required for unaccepted memory support
  efi/x86: Implement support for unaccepted memory
  x86/boot/compressed: Handle unaccepted memory
  x86/mm: Reserve unaccepted memory bitmap
  x86/mm: Provide helpers for unaccepted memory
  x86/mm: Avoid load_unaligned_zeropad() stepping into unaccepted memory
  x86/mm: Report unaccepted memory in /proc/meminfo
  x86: Disable kexec if system has unaccepted memory
  x86/tdx: Make _tdx_hypercall() and __tdx_module_call() available in
    boot stub
  x86/tdx: Refactor try_accept_one()
  x86/tdx: Add unaccepted memory support
  mm/vmstat: Add counter for memory accepting

 Documentation/x86/zero-page.rst          |   1 +
 arch/x86/Kconfig                         |   1 +
 arch/x86/boot/bitops.h                   |  40 +++++++
 arch/x86/boot/compressed/Makefile        |   1 +
 arch/x86/boot/compressed/align.h         |  14 +++
 arch/x86/boot/compressed/bitmap.c        |  43 +++++++
 arch/x86/boot/compressed/bitmap.h        |  49 ++++++++
 arch/x86/boot/compressed/bits.h          |  36 ++++++
 arch/x86/boot/compressed/compiler.h      |   9 ++
 arch/x86/boot/compressed/efi.h           |   1 +
 arch/x86/boot/compressed/find.c          |  54 +++++++++
 arch/x86/boot/compressed/find.h          |  80 +++++++++++++
 arch/x86/boot/compressed/ident_map_64.c  |   8 --
 arch/x86/boot/compressed/kaslr.c         |  35 ++++--
 arch/x86/boot/compressed/math.h          |  37 ++++++
 arch/x86/boot/compressed/mem.c           | 111 +++++++++++++++++
 arch/x86/boot/compressed/minmax.h        |  61 ++++++++++
 arch/x86/boot/compressed/misc.c          |   6 +
 arch/x86/boot/compressed/misc.h          |  15 +++
 arch/x86/boot/compressed/pgtable_types.h |  25 ++++
 arch/x86/boot/compressed/sev.c           |   2 -
 arch/x86/boot/compressed/tdx.c           |  78 ++++++++++++
 arch/x86/coco/tdx/tdx.c                  |  94 +++++++--------
 arch/x86/include/asm/page.h              |   3 +
 arch/x86/include/asm/set_memory.h        |   2 +
 arch/x86/include/asm/shared/tdx.h        |  47 ++++++++
 arch/x86/include/asm/tdx.h               |  19 ---
 arch/x86/include/asm/unaccepted_memory.h |  25 ++++
 arch/x86/include/uapi/asm/bootparam.h    |   2 +-
 arch/x86/kernel/e820.c                   |  10 ++
 arch/x86/mm/Makefile                     |   2 +
 arch/x86/mm/init.c                       |   8 ++
 arch/x86/mm/pat/set_memory.c             |   2 +-
 arch/x86/mm/unaccepted_memory.c          | 144 +++++++++++++++++++++++
 drivers/firmware/efi/Kconfig             |  14 +++
 drivers/firmware/efi/efi.c               |   1 +
 drivers/firmware/efi/libstub/x86-stub.c  | 103 +++++++++++++---
 include/linux/efi.h                      |   3 +-
 include/linux/page-flags.h               |  31 +++++
 include/linux/vm_event_item.h            |   3 +
 mm/internal.h                            |  12 ++
 mm/memblock.c                            |   9 ++
 mm/page_alloc.c                          |  87 +++++++++++++-
 mm/vmstat.c                              |   3 +
 44 files changed, 1215 insertions(+), 116 deletions(-)
 create mode 100644 arch/x86/boot/compressed/align.h
 create mode 100644 arch/x86/boot/compressed/bitmap.c
 create mode 100644 arch/x86/boot/compressed/bitmap.h
 create mode 100644 arch/x86/boot/compressed/bits.h
 create mode 100644 arch/x86/boot/compressed/compiler.h
 create mode 100644 arch/x86/boot/compressed/find.c
 create mode 100644 arch/x86/boot/compressed/find.h
 create mode 100644 arch/x86/boot/compressed/math.h
 create mode 100644 arch/x86/boot/compressed/mem.c
 create mode 100644 arch/x86/boot/compressed/minmax.h
 create mode 100644 arch/x86/boot/compressed/pgtable_types.h
 create mode 100644 arch/x86/include/asm/unaccepted_memory.h
 create mode 100644 arch/x86/mm/unaccepted_memory.c

-- 
2.35.1

