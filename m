Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BF9322F
	for <linux-coco@lists.linux.dev>; Tue,  5 Apr 2022 23:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649202521; x=1680738521;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tsti2G/5iL+RgXBI2ZibkXK3KW/Q8xOXVOQ6AV2zHjs=;
  b=TENRrSLvTQTIe+WNo/tZVKZCZHOL01Q01Wb+qwobB+2q5otWnqrrGfij
   8PskMDSx2JMJaeI6c+6vqYT9SmIYUroMY+LrDyO4mKMeMye/qYEsZpcyQ
   BlCj3Uhe2UoOB7YAam5FW2Oa+aoCMKmPrXqmLg3gpgRhK2zFg/BXd+NJM
   jqrg72MoUSh8Twjh3bkz4m8uCckOdOB8bAN7kiMIqK3RpQNGTBRlRa+RH
   X9GOpezsfdJsyV/2uIGipOzdC+qbLhMNhs/cC8C2f1IYUgvhpykMVKfXJ
   MHbf78mD2oaxtEGiTe9oYWOYuVlhYOM+x/rwrNnkojwfXeArL2w2ZajXT
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="258479957"
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="258479957"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 16:48:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="620560765"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 05 Apr 2022 16:48:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 78046132; Wed,  6 Apr 2022 02:43:47 +0300 (EEST)
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
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv4 0/8] mm, x86/cc: Implement support for unaccepted memory
Date: Wed,  6 Apr 2022 02:43:35 +0300
Message-Id: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
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

Patches 1-6/7 are generic and don't have any dependencies on TDX. They
should serve AMD SEV needs as well. TDX-specific code isolated in the
last patch. This patch requires the core TDX patchset which is currently
under review.

v4:
 - PageBuddyUnaccepted() -> PageUnaccepted;
 - Use separate page_type, not shared with offline;
 - Rework interface between core-mm and arch code;
 - Adjust commit messages;
 - Ack from Mike;
Kirill A. Shutemov (8):
  mm: Add support for unaccepted memory
  efi/x86: Get full memory map in allocate_e820()
  efi/x86: Implement support for unaccepted memory
  x86/boot/compressed: Handle unaccepted memory
  x86/mm: Reserve unaccepted memory bitmap
  x86/mm: Provide helpers for unaccepted memory
  x86/tdx: Unaccepted memory support
  mm/vmstat: Add counter for memory accepting

 Documentation/x86/zero-page.rst              |  1 +
 arch/x86/Kconfig                             |  1 +
 arch/x86/boot/compressed/Makefile            |  1 +
 arch/x86/boot/compressed/bitmap.c            | 86 +++++++++++++++++++
 arch/x86/boot/compressed/kaslr.c             | 14 +++-
 arch/x86/boot/compressed/misc.c              | 11 +++
 arch/x86/boot/compressed/tdx.c               | 41 +++++++++
 arch/x86/boot/compressed/unaccepted_memory.c | 88 ++++++++++++++++++++
 arch/x86/coco/tdx/tdx.c                      | 29 +++++--
 arch/x86/include/asm/page.h                  |  5 ++
 arch/x86/include/asm/shared/tdx.h            | 20 +++++
 arch/x86/include/asm/tdx.h                   | 19 -----
 arch/x86/include/asm/unaccepted_memory.h     | 15 ++++
 arch/x86/include/uapi/asm/bootparam.h        |  3 +-
 arch/x86/kernel/e820.c                       | 10 +++
 arch/x86/mm/Makefile                         |  2 +
 arch/x86/mm/unaccepted_memory.c              | 58 +++++++++++++
 drivers/firmware/efi/Kconfig                 | 15 ++++
 drivers/firmware/efi/efi.c                   |  1 +
 drivers/firmware/efi/libstub/x86-stub.c      | 88 ++++++++++++++++----
 include/linux/efi.h                          |  3 +-
 include/linux/page-flags.h                   | 24 ++++++
 include/linux/vm_event_item.h                |  3 +
 mm/internal.h                                | 11 +++
 mm/memblock.c                                |  9 ++
 mm/page_alloc.c                              | 57 ++++++++++++-
 mm/vmstat.c                                  |  3 +
 27 files changed, 569 insertions(+), 49 deletions(-)
 create mode 100644 arch/x86/boot/compressed/bitmap.c
 create mode 100644 arch/x86/boot/compressed/unaccepted_memory.c
 create mode 100644 arch/x86/include/asm/unaccepted_memory.h
 create mode 100644 arch/x86/mm/unaccepted_memory.c

-- 
2.35.1

