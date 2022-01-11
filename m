Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246182C9D
	for <linux-coco@lists.linux.dev>; Tue, 11 Jan 2022 11:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641900794; x=1673436794;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PYSoQ6fOmg24GZrM6oddDOb8F96ELYtu5wYu0sHkD1Y=;
  b=BamnXA4lECXwXT2q5KwLetyECKfkCNbcJVGOKhPVChqtMQYckSEnYkyi
   l6qpdpnWUld9B80RrsVvgxmm2D6onvy5LtpSPzW2PIYNEaNuC/fdWFQaE
   pIVgZ5rwkpZR2BT/jVYUPUBvQwoXeCV+UDv0kZ0wrTJJ4tvqjQOT7vJFe
   zGwYdf5cc4LyzARHwrhAcIOwmgYaVe7Hd0gn7Xf7QyayXbIVSWY7hF4c3
   EBnW5F6bX9bqjhGIGF3dESU3pvTxSJSaWpTqh7MK7Va8WD8uBvAq+wmka
   o1uSClK5+76JG893xYzTOc/eo1GV9tlZT+3GsYTnTUe5uoMFhgQ0NdfJK
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243261603"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="243261603"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 03:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="515063269"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Jan 2022 03:33:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 1015C16B; Tue, 11 Jan 2022 13:33:18 +0200 (EET)
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
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2 0/7] Implement support for unaccepted memory
Date: Tue, 11 Jan 2022 14:33:07 +0300
Message-Id: <20220111113314.27173-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UEFI Specification version 2.9 introduces the concept of memory
acceptance: Some Virtual Machine platforms, such as Intel TDX or AMD
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

Kirill A. Shutemov (7):
  mm: Add support for unaccepted memory
  efi/x86: Get full memory map in allocate_e820()
  efi/x86: Implement support for unaccepted memory
  x86/boot/compressed: Handle unaccepted memory
  x86/mm: Reserve unaccepted memory bitmap
  x86/mm: Provide helpers for unaccepted memory
  x86/tdx: Unaccepted memory support

 Documentation/x86/zero-page.rst              |  1 +
 arch/x86/Kconfig                             |  1 +
 arch/x86/boot/compressed/Makefile            |  1 +
 arch/x86/boot/compressed/bitmap.c            | 86 ++++++++++++++++++
 arch/x86/boot/compressed/kaslr.c             | 14 ++-
 arch/x86/boot/compressed/misc.c              |  9 ++
 arch/x86/boot/compressed/tdx.c               | 67 ++++++++++++++
 arch/x86/boot/compressed/unaccepted_memory.c | 64 +++++++++++++
 arch/x86/include/asm/page.h                  |  5 ++
 arch/x86/include/asm/tdx.h                   |  2 +
 arch/x86/include/asm/unaccepted_memory.h     | 17 ++++
 arch/x86/include/uapi/asm/bootparam.h        |  3 +-
 arch/x86/kernel/e820.c                       | 10 +++
 arch/x86/kernel/tdx.c                        |  7 ++
 arch/x86/mm/Makefile                         |  2 +
 arch/x86/mm/unaccepted_memory.c              | 94 ++++++++++++++++++++
 drivers/firmware/efi/Kconfig                 | 14 +++
 drivers/firmware/efi/efi.c                   |  1 +
 drivers/firmware/efi/libstub/x86-stub.c      | 86 ++++++++++++++----
 include/linux/efi.h                          |  3 +-
 include/linux/page-flags.h                   |  4 +
 mm/internal.h                                | 15 ++++
 mm/memblock.c                                |  1 +
 mm/page_alloc.c                              | 21 ++++-
 24 files changed, 508 insertions(+), 20 deletions(-)
 create mode 100644 arch/x86/boot/compressed/bitmap.c
 create mode 100644 arch/x86/boot/compressed/unaccepted_memory.c
 create mode 100644 arch/x86/include/asm/unaccepted_memory.h
 create mode 100644 arch/x86/mm/unaccepted_memory.c

-- 
2.34.1

