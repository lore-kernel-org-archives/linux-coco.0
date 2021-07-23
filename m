Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93585168
	for <linux-coco@lists.linux.dev>; Fri, 23 Jul 2021 15:23:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA45860F21;
	Fri, 23 Jul 2021 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627053830;
	bh=rIVVX56Er+gPYHopcMPbUn0+ekQKoAGxWPP1/dZXNmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DGavItcgaWLFeNPpXrBE1MZ0hkekyHqanxhAhhkJS3tPKMoOxnBNi9Yd2nsRz+rgM
	 5dTFO8mFIPp1Dq+8lXUI4LNV9/IxszCQAkv8LJhW+M95kVWhYa0nfXa/lq3anO9xBK
	 gIUG8aybqPvy4Dq2ycPt3IBR5Yt4ohQq7qnVAtu/EKFl9o4uZD01HB4EZp2kAyelQi
	 LCtTceYs/zReHpqEYheOeXIzqBAI3aKNv+fxTJjV26/F4GA+/ORT+Y9Dp4uNALYW36
	 82WQdPetXdmLdp/3aGm+NG0kfFESBLfP5/j3I6zx0u45H2tlW9L+fjC4n7CozGQbTH
	 MGPa6eQrANf9Q==
Date: Fri, 23 Jul 2021 18:23:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <YPre+9mTzPYp5Vt+@kernel.org>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210722195130.beazbb5blvj3mruo@box>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722195130.beazbb5blvj3mruo@box>

On Thu, Jul 22, 2021 at 10:51:30PM +0300, Kirill A. Shutemov wrote:
> On Mon, Jul 19, 2021 at 02:58:22PM +0200, Joerg Roedel wrote:
> > Hi,
> > 
> > I'd like to get some movement again into the discussion around how to
> > implement runtime memory validation for confidential guests and wrote up
> > some thoughts on it.
> > Below are the results in form of a proposal I put together. Please let
> > me know your thoughts on it and whether it fits everyones requirements.
> 
> Okay, below is my first take on the topic.
> 
> Please don't mind code structuring, naming, etc. It's early PoC and aimed
> to test the approach.
> 
> I ended up combing your idea with bitmap with PageOffline(): early boot
> code uses bitmap, but on page allocator init I mark unaccepted pages with
> PageOffline(). This way page allocator need to touch the bitmap only when
> it steps on PageOffline() which shouldn't be often once things settle
> after boot.
> 
> One bit in the bitmap represents 2M region. Any unaligned chunks gets
> accepted when we construct the bitmap. This way one 4K page can represent
> 64 GiB of physical address space.
> 
> I still don't touch decompresser code. This is something I'll look into
> next. Given the density of the bitmap. It should be enough to have a
> single-page bitmap allocated in decompresser.
> 
> Any feedback is welcome.
> 
> diff --git a/arch/x86/include/asm/e820/types.h b/arch/x86/include/asm/e820/types.h
> index 314f75d886d0..98f281752a30 100644
> --- a/arch/x86/include/asm/e820/types.h
> +++ b/arch/x86/include/asm/e820/types.h
> @@ -28,6 +28,8 @@ enum e820_type {
>  	 */
>  	E820_TYPE_PRAM		= 12,
>  
> +	E820_TYPE_UNACCEPTED	= 13, /* XXX: is there a standardized type ? */
> +
>  	/*
>  	 * Special-purpose memory is indicated to the system via the
>  	 * EFI_MEMORY_SP attribute. Define an e820 translation of this
> diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
> index 7555b48803a8..21972e9159fe 100644
> --- a/arch/x86/include/asm/page.h
> +++ b/arch/x86/include/asm/page.h
> @@ -71,6 +71,11 @@ static inline void copy_user_page(void *to, void *from, unsigned long vaddr,
>  extern bool __virt_addr_valid(unsigned long kaddr);
>  #define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long) (kaddr))
>  
> +void mark_unaccepted(phys_addr_t start, phys_addr_t end);
> +void accept_pages(phys_addr_t start, phys_addr_t end);
> +
> +void maybe_set_page_offline(struct page *page, unsigned int order);
> +void clear_page_offline(struct page *page, unsigned int order);
>  #endif	/* __ASSEMBLY__ */
>  
>  #include <asm-generic/memory_model.h>
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index bc0657f0deed..4cd80d107a06 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -196,6 +196,7 @@ static void __init e820_print_type(enum e820_type type)
>  	case E820_TYPE_UNUSABLE:	pr_cont("unusable");			break;
>  	case E820_TYPE_PMEM:		/* Fall through: */
>  	case E820_TYPE_PRAM:		pr_cont("persistent (type %u)", type);	break;
> +	case E820_TYPE_UNACCEPTED:	pr_cont("unaccepted");			break;
>  	default:			pr_cont("type %u", type);		break;
>  	}
>  }
> @@ -763,7 +764,9 @@ void __init e820__register_nosave_regions(unsigned long limit_pfn)
>  
>  		pfn = PFN_DOWN(entry->addr + entry->size);
>  
> -		if (entry->type != E820_TYPE_RAM && entry->type != E820_TYPE_RESERVED_KERN)
> +		if (entry->type != E820_TYPE_RAM &&
> +		    entry->type != E820_TYPE_RESERVED_KERN &&
> +		    entry->type != E820_TYPE_UNACCEPTED)
>  			register_nosave_region(PFN_UP(entry->addr), pfn);
>  
>  		if (pfn >= limit_pfn)
> @@ -864,7 +867,8 @@ static unsigned long __init e820_end_pfn(unsigned long limit_pfn, enum e820_type
>  
>  unsigned long __init e820__end_of_ram_pfn(void)
>  {
> -	return e820_end_pfn(MAX_ARCH_PFN, E820_TYPE_RAM);
> +	return max(e820_end_pfn(MAX_ARCH_PFN, E820_TYPE_RAM),
> +		   e820_end_pfn(MAX_ARCH_PFN, E820_TYPE_UNACCEPTED));
>  }
>  
>  unsigned long __init e820__end_of_low_ram_pfn(void)
> @@ -1064,6 +1068,7 @@ static const char *__init e820_type_to_string(struct e820_entry *entry)
>  	case E820_TYPE_PMEM:		return "Persistent Memory";
>  	case E820_TYPE_RESERVED:	return "Reserved";
>  	case E820_TYPE_SOFT_RESERVED:	return "Soft Reserved";
> +	case E820_TYPE_UNACCEPTED:	return "Unaccepted Memory";
>  	default:			return "Unknown E820 type";
>  	}
>  }
> @@ -1072,6 +1077,7 @@ static unsigned long __init e820_type_to_iomem_type(struct e820_entry *entry)
>  {
>  	switch (entry->type) {
>  	case E820_TYPE_RESERVED_KERN:	/* Fall-through: */
> +	case E820_TYPE_UNACCEPTED:	/* Fall-through: */
>  	case E820_TYPE_RAM:		return IORESOURCE_SYSTEM_RAM;
>  	case E820_TYPE_ACPI:		/* Fall-through: */
>  	case E820_TYPE_NVS:		/* Fall-through: */
> @@ -1095,6 +1101,7 @@ static unsigned long __init e820_type_to_iores_desc(struct e820_entry *entry)
>  	case E820_TYPE_SOFT_RESERVED:	return IORES_DESC_SOFT_RESERVED;
>  	case E820_TYPE_RESERVED_KERN:	/* Fall-through: */
>  	case E820_TYPE_RAM:		/* Fall-through: */
> +	case E820_TYPE_UNACCEPTED:	/* Fall-through: */
>  	case E820_TYPE_UNUSABLE:	/* Fall-through: */
>  	default:			return IORES_DESC_NONE;
>  	}
> @@ -1118,6 +1125,7 @@ static bool __init do_mark_busy(enum e820_type type, struct resource *res)
>  		return false;
>  	case E820_TYPE_RESERVED_KERN:
>  	case E820_TYPE_RAM:
> +	case E820_TYPE_UNACCEPTED:
>  	case E820_TYPE_ACPI:
>  	case E820_TYPE_NVS:
>  	case E820_TYPE_UNUSABLE:
> @@ -1220,7 +1228,8 @@ void __init e820__reserve_resources_late(void)
>  		struct e820_entry *entry = &e820_table->entries[i];
>  		u64 start, end;
>  
> -		if (entry->type != E820_TYPE_RAM)
> +		if (entry->type != E820_TYPE_RAM &&
> +		    entry->type != E820_TYPE_UNACCEPTED)
>  			continue;
>  
>  		start = entry->addr + entry->size;
> @@ -1318,9 +1327,14 @@ void __init e820__memblock_setup(void)
>  		if (entry->type == E820_TYPE_SOFT_RESERVED)
>  			memblock_reserve(entry->addr, entry->size);
>  
> -		if (entry->type != E820_TYPE_RAM && entry->type != E820_TYPE_RESERVED_KERN)
> +		if (entry->type != E820_TYPE_RAM &&
> +		    entry->type != E820_TYPE_RESERVED_KERN &&
> +		    entry->type != E820_TYPE_UNACCEPTED)
>  			continue;

If I understand correctly, you assume that

* E820_TYPE_RAM and E820_TYPE_RESERVED_KERN regions are already accepted by
  firmware/booloader
* E820_TYPE_UNACCEPTED would have been E820_SYSTEM_RAM if we'd disabled
  encryption

What happens with other types? Particularly E820_TYPE_ACPI and
E820_TYPE_NVS that may reside in memory and might have been accepted by
BIOS.

>  
> +		if (entry->type == E820_TYPE_UNACCEPTED)
> +			mark_unaccepted(entry->addr, end);
> +
>  		memblock_add(entry->addr, entry->size);
>  	}
>  
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 72920af0b3c0..db9d1bcac9ed 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -944,6 +944,8 @@ void __init setup_arch(char **cmdline_p)
>  	if (movable_node_is_enabled())
>  		memblock_set_bottom_up(true);
>  #endif
> +	/* TODO: make conditional */
> +	memblock_set_bottom_up(true);
  
If memory is accepted during memblock allocations this should not really
matter.
Bottom up would be preferable if we'd like to reuse as much of already
accepted memory as possible before page allocator is up.

>  	x86_report_nx();
>  
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index e527d829e1ed..582e398f953a 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -463,7 +463,9 @@ phys_pte_init(pte_t *pte_page, unsigned long paddr, unsigned long paddr_end,
>  			    !e820__mapped_any(paddr & PAGE_MASK, paddr_next,
>  					     E820_TYPE_RAM) &&
>  			    !e820__mapped_any(paddr & PAGE_MASK, paddr_next,
> -					     E820_TYPE_RESERVED_KERN))
> +					     E820_TYPE_RESERVED_KERN) &&
> +			    !e820__mapped_any(paddr & PAGE_MASK, paddr_next,
> +					     E820_TYPE_UNACCEPTED))
>  				set_pte_init(pte, __pte(0), init);
>  			continue;
>  		}
> @@ -518,7 +520,9 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
>  			    !e820__mapped_any(paddr & PMD_MASK, paddr_next,
>  					     E820_TYPE_RAM) &&
>  			    !e820__mapped_any(paddr & PMD_MASK, paddr_next,
> -					     E820_TYPE_RESERVED_KERN))
> +					     E820_TYPE_RESERVED_KERN) &&
> +			    !e820__mapped_any(paddr & PMD_MASK, paddr_next,
> +					     E820_TYPE_UNACCEPTED))
>  				set_pmd_init(pmd, __pmd(0), init);
>  			continue;
>  		}
> @@ -606,7 +610,9 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
>  			    !e820__mapped_any(paddr & PUD_MASK, paddr_next,
>  					     E820_TYPE_RAM) &&
>  			    !e820__mapped_any(paddr & PUD_MASK, paddr_next,
> -					     E820_TYPE_RESERVED_KERN))
> +					     E820_TYPE_RESERVED_KERN) &&
> +			    !e820__mapped_any(paddr & PUD_MASK, paddr_next,
> +					     E820_TYPE_UNACCEPTED))
>  				set_pud_init(pud, __pud(0), init);
>  			continue;
>  		}
> @@ -697,7 +703,9 @@ phys_p4d_init(p4d_t *p4d_page, unsigned long paddr, unsigned long paddr_end,
>  			    !e820__mapped_any(paddr & P4D_MASK, paddr_next,
>  					     E820_TYPE_RAM) &&
>  			    !e820__mapped_any(paddr & P4D_MASK, paddr_next,
> -					     E820_TYPE_RESERVED_KERN))
> +					     E820_TYPE_RESERVED_KERN) &&
> +			    !e820__mapped_any(paddr & P4D_MASK, paddr_next,
> +					     E820_TYPE_UNACCEPTED))
>  				set_p4d_init(p4d, __p4d(0), init);
>  			continue;
>  		}
> diff --git a/arch/x86/mm/mem_encrypt_common.c b/arch/x86/mm/mem_encrypt_common.c
> index da94fc2e9b56..f51bb39963f2 100644
> --- a/arch/x86/mm/mem_encrypt_common.c
> +++ b/arch/x86/mm/mem_encrypt_common.c
> @@ -44,3 +44,86 @@ int arch_has_restricted_virtio_memory_access(void)
>  }
>  EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
>  
> +/* TODO: make dynamic. Enough for 64GiB */
> +static DECLARE_BITMAP(unaccepted_memory, 32768);
> +static DEFINE_SPINLOCK(unaccepted_memory_lock);
> +
> +#define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
> +#define PMD_NR (1 << PMD_ORDER)
> +
> +void mark_unaccepted(phys_addr_t start, phys_addr_t end)
> +{
> +	unsigned int npages;
> +
> +	if (start & ~PMD_MASK) {
> +		npages = (round_up(start, PMD_SIZE) - start) / PAGE_SIZE;
> +		tdx_hcall_gpa_intent(start, npages, TDX_MAP_PRIVATE);
> +		start = round_up(start, PMD_SIZE);
> +	}
> +
> +	if (end & ~PMD_MASK) {
> +		npages = (end - round_down(end, PMD_SIZE)) / PAGE_SIZE;
> +		end = round_down(end, PMD_SIZE);
> +		tdx_hcall_gpa_intent(end, npages, TDX_MAP_PRIVATE);
> +	}
> +
> +	npages = (end - start) / PMD_SIZE;
> +	spin_lock(&unaccepted_memory_lock);
> +	bitmap_set(unaccepted_memory, start / PMD_SIZE, npages);
> +	spin_unlock(&unaccepted_memory_lock);
> +}
> +
> +static void __accept_pages(phys_addr_t start, phys_addr_t end)
> +{
> +	unsigned int rs, re;
> +
> +	bitmap_for_each_set_region(unaccepted_memory, rs, re,
> +				   start / PMD_SIZE, end / PMD_SIZE) {
> +		tdx_hcall_gpa_intent(rs * PMD_SIZE, (re - rs) * PMD_NR,
> +				     TDX_MAP_PRIVATE);
> +
> +		bitmap_clear(unaccepted_memory, rs, re - rs);
> +	}
> +}
> +
> +void accept_pages(phys_addr_t start, phys_addr_t end)
> +{
> +	spin_lock(&unaccepted_memory_lock);
> +	__accept_pages(start, end);
> +	spin_unlock(&unaccepted_memory_lock);
> +}
> +
> +void maybe_set_page_offline(struct page *page, unsigned int order)
> +{
> +	phys_addr_t addr = page_to_phys(page);
> +	bool unaccepted = true;
> +	unsigned int i;
> +
> +	spin_lock(&unaccepted_memory_lock);
> +	if (order < PMD_ORDER) {
> +		BUG_ON(test_bit(addr / PMD_SIZE, unaccepted_memory));
> +		goto out;
> +	}
> +
> +	for (i = 0; i < (1 << (order - PMD_ORDER)); i++) {
> +		if (!test_bit(addr / PMD_SIZE + i, unaccepted_memory)) {
> +			unaccepted = false;
> +			break;
> +		}
> +	}
> +
> +	if (unaccepted)
> +		__SetPageOffline(page);
> +	else
> +		__accept_pages(addr, addr + (PAGE_SIZE << order));
> +out:
> +	spin_unlock(&unaccepted_memory_lock);
> +}
> +
> +void clear_page_offline(struct page *page, unsigned int order)
> +{
> +	phys_addr_t addr = page_to_phys(page);
> +	accept_pages(addr, addr + (PAGE_SIZE << order));
> +	__ClearPageOffline(page);
> +}
> +
> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index 4b7ee3fa9224..86e85e267ee3 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -737,6 +737,7 @@ static __initdata char memory_type_name[][13] = {
>  	"MMIO Port",
>  	"PAL Code",
>  	"Persistent",
> +	"Unaccepted",
>  };
>  
>  char * __init efi_md_typeattr_format(char *buf, size_t size,
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
> index f14c4ff5839f..dc3aebd493b3 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -504,6 +504,9 @@ setup_e820(struct boot_params *params, struct setup_data *e820ext, u32 e820ext_s
>  			e820_type = E820_TYPE_PMEM;
>  			break;
>  
> +		case EFI_UNACCEPTED_MEMORY:
> +			e820_type = E820_TYPE_UNACCEPTED;
> +			break;
>  		default:
>  			continue;
>  		}
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index 6b5d36babfcc..d43cc872b582 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -108,7 +108,8 @@ typedef	struct {
>  #define EFI_MEMORY_MAPPED_IO_PORT_SPACE	12
>  #define EFI_PAL_CODE			13
>  #define EFI_PERSISTENT_MEMORY		14
> -#define EFI_MAX_MEMORY_TYPE		15
> +#define EFI_UNACCEPTED_MEMORY		15
> +#define EFI_MAX_MEMORY_TYPE		16
>  
>  /* Attribute values: */
>  #define EFI_MEMORY_UC		((u64)0x0000000000000001ULL)	/* uncached */
> diff --git a/mm/memblock.c b/mm/memblock.c
> index afaefa8fc6ab..f7423ad0a692 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -814,6 +814,7 @@ int __init_memblock memblock_reserve(phys_addr_t base, phys_addr_t size)
>  	memblock_dbg("%s: [%pa-%pa] %pS\n", __func__,
>  		     &base, &end, (void *)_RET_IP_);
>  
> +	accept_pages(base, base + size);

Hmm, I'm not sure memblock_reserve() is the right place to accept pages. It
can be called to reserve memory owned by firmware which not necessarily
would be encrypted. Besides, memblock_reserve() may be called for absent
memory, could be it'll confuse TDX/SEV?

Ideally, the call to accept_pages() should live in
memblock_alloc_range_nid(), but unfortunately there still stale
memblock_find_in_range() + memblock_reserve() pairs in x86 setup code.

>  	return memblock_add_range(&memblock.reserved, base, size, MAX_NUMNODES, 0);
>  }
>  
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index aaa1655cf682..0356329b1ea7 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -857,6 +857,9 @@ static inline bool page_is_buddy(struct page *page, struct page *buddy,
>  	if (buddy_order(buddy) != order)
>  		return false;
>  
> +	if (PageOffline(buddy) || PageOffline(page))
> +		return false;
> +
>  	/*
>  	 * zone check is done late to avoid uselessly calculating
>  	 * zone/node ids for pages that could never merge.
> @@ -959,6 +962,9 @@ static inline void del_page_from_free_list(struct page *page, struct zone *zone,
>  	if (page_reported(page))
>  		__ClearPageReported(page);
>  
> +	if (PageOffline(page))
> +		clear_page_offline(page, order);
> +
>  	list_del(&page->lru);
>  	__ClearPageBuddy(page);
>  	set_page_private(page, 0);
> @@ -1123,7 +1129,8 @@ static inline void __free_one_page(struct page *page,
>  static inline bool page_expected_state(struct page *page,
>  					unsigned long check_flags)
>  {
> -	if (unlikely(atomic_read(&page->_mapcount) != -1))
> +	if (unlikely(atomic_read(&page->_mapcount) != -1) &&
> +	    !PageOffline(page))
>  		return false;
>  
>  	if (unlikely((unsigned long)page->mapping |
> @@ -1666,6 +1673,8 @@ void __init memblock_free_pages(struct page *page, unsigned long pfn,
>  {
>  	if (early_page_uninitialised(pfn))
>  		return;
> +
> +	maybe_set_page_offline(page, order);
>  	__free_pages_core(page, order);
>  }
>  
> @@ -1757,10 +1766,12 @@ static void __init deferred_free_range(unsigned long pfn,
>  	if (nr_pages == pageblock_nr_pages &&
>  	    (pfn & (pageblock_nr_pages - 1)) == 0) {
>  		set_pageblock_migratetype(page, MIGRATE_MOVABLE);
> +		maybe_set_page_offline(page, pageblock_order);
>  		__free_pages_core(page, pageblock_order);
>  		return;
>  	}
>  
> +	accept_pages(pfn << PAGE_SHIFT, (pfn + nr_pages) << PAGE_SHIFT);
>  	for (i = 0; i < nr_pages; i++, page++, pfn++) {
>  		if ((pfn & (pageblock_nr_pages - 1)) == 0)
>  			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
> -- 
>  Kirill A. Shutemov
> 

-- 
Sincerely yours,
Mike.
