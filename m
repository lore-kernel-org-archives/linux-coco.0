Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8620C2CA1
	for <linux-coco@lists.linux.dev>; Tue, 11 Jan 2022 17:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641921447; x=1673457447;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RGhmLRA+Ko+65nLFSDiANiovr+79v13U5lKGY955p7U=;
  b=CvkJb9Bx8tVAZEm909NFZSdTr/5i1ZASbZ/qo6UISsWanjZUp8lOo8zu
   XSrxfDztgwjudRWo8RtOeZOi87elObF23KKX1+r9c1dvwhpn3UvarNZ3Q
   zQp+2I/fHl/TbHAd8QTiWkUSmIBMjSB02KlHOqpVNSMXP5q5XGIf5qp/g
   8djXTQWEf7PkGpoDvHTIK5WuonRpHuET4eLx6Y3tHCo4d/8um9WnEjqxU
   bK7bsOvoYQAqS+7TEBZElfcjHsaBwDwRFLr6EuD83LJ1mnddYTZSbizsT
   F+v+/cuuph85TCunV84DW8lGidCcUqsXux/nam+U4XTipTHmc8rxym8WK
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="224236626"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="224236626"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 09:17:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="613284688"
Received: from padhika1-mobl.amr.corp.intel.com (HELO [10.209.13.65]) ([10.209.13.65])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 09:17:25 -0800
Message-ID: <b3348430-1b91-4b8b-b70c-76d48f8737f7@intel.com>
Date: Tue, 11 Jan 2022 09:17:19 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCHv2 3/7] efi/x86: Implement support for unaccepted memory
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220111113314.27173-1-kirill.shutemov@linux.intel.com>
 <20220111113314.27173-4-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220111113314.27173-4-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/22 03:33, Kirill A. Shutemov wrote:
...
> +void mark_unaccepted(struct boot_params *params, u64 start, u64 end)
> +{
> +	/*
> +	 * The accepted memory bitmap only works at PMD_SIZE granularity.
> +	 * If a request comes in to mark memory as unaccepted which is not
> +	 * PMD_SIZE-aligned, simply accept the memory now since it can not be
> +	 * *marked* as unaccepted.
> +	 */
> +
> +	/* Immediately accept whole range if it is within a PMD_SIZE block: */
> +	if ((start & PMD_MASK) == (end & PMD_MASK)) {
> +		npages = (end - start) / PAGE_SIZE;
> +		__accept_memory(start, start + npages * PAGE_SIZE);
> +		return;
> +	}

I still don't quite like how this turned out.  It's still a bit unclear 
to the reader that this has covered all the corner cases.  I think this 
needs a better comment:

	/*
	 * Handle <PMD_SIZE blocks that do not end at a PMD boundary.
	 *
	 * Immediately accept the whole block.  This handles the case
	 * where the below round_{up,down}() would "lose" a small,
	 * <PMD_SIZE block.
	 */
	if ((start & PMD_MASK) == (end & PMD_MASK)) {
		...
		return;
	}

	/*
	 * There is at least one more block to accept.  Both 'start'
	 * and 'end' may not be PMD-aligned.
	 */


> +	/* Immediately accept a <PMD_SIZE piece at the start: */
> +	if (start & ~PMD_MASK) {
> +		__accept_memory(start, round_up(start, PMD_SIZE));
> +		start = round_up(start, PMD_SIZE);
> +	}
> +
> +	/* Immediately accept a <PMD_SIZE piece at the end: */
> +	if (end & ~PMD_MASK) {
> +		__accept_memory(round_down(end, PMD_SIZE), end);
> +		end = round_down(end, PMD_SIZE);
> +	}

	/*
	 * 'start' and 'end' are now both PMD-aligned.
	 * Record the range as being unaccepted:
	 */

> +	if (start == end)
> +		return;

Does bitmap_set()not accept zero-sized 'len' arguments?

> +	bitmap_set((unsigned long *)params->unaccepted_memory,
> +		   start / PMD_SIZE, (end - start) / PMD_SIZE);
> +}

The code you have there is _precise_.  It will never eagerly accept any 
area that _can_ be represented in the bitmap.  But, that's kinda hard to 
describe.  Maybe we should be a bit more sloppy about accepting things 
up front to make it easier to describe:

	/*
	 * Accept small regions that might not be
	 * able to be represented in the bitmap:
	 */
	if (end - start < PMD_SIZE*2) {
		npages = (end - start) / PAGE_SIZE;
		__accept_memory(start, start + npages * PAGE_SIZE);
		return;
	}

	/*
	 * No matter how the start and end are aligned, at
	 * least one unaccepted PMD_SIZE area will remain.
	 */

	... now do the start/end rounding

That has the downside of accepting a few things that it doesn't *HAVE* 
to accept.  But, its behavior is very easy to describe.

> diff --git a/arch/x86/include/asm/unaccepted_memory.h b/arch/x86/include/asm/unaccepted_memory.h
> new file mode 100644
> index 000000000000..cbc24040b853
> --- /dev/null
> +++ b/arch/x86/include/asm/unaccepted_memory.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2020 Intel Corporation */
> +#ifndef _ASM_X86_UNACCEPTED_MEMORY_H
> +#define _ASM_X86_UNACCEPTED_MEMORY_H
> +
> +#include <linux/types.h>
> +
> +struct boot_params;
> +
> +void mark_unaccepted(struct boot_params *params, u64 start, u64 num);
> +
> +#endif
> diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
> index b25d3f82c2f3..16bc686a198d 100644
> --- a/arch/x86/include/uapi/asm/bootparam.h
> +++ b/arch/x86/include/uapi/asm/bootparam.h
> @@ -217,7 +217,8 @@ struct boot_params {
>   	struct boot_e820_entry e820_table[E820_MAX_ENTRIES_ZEROPAGE]; /* 0x2d0 */
>   	__u8  _pad8[48];				/* 0xcd0 */
>   	struct edd_info eddbuf[EDDMAXNR];		/* 0xd00 */
> -	__u8  _pad9[276];				/* 0xeec */
> +	__u64 unaccepted_memory;			/* 0xeec */
> +	__u8  _pad9[268];				/* 0xef4 */
>   } __attribute__((packed));
>   
>   /**
> diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
> index 2c3dac5ecb36..36c1bf33f112 100644
> --- a/drivers/firmware/efi/Kconfig
> +++ b/drivers/firmware/efi/Kconfig
> @@ -243,6 +243,20 @@ config EFI_DISABLE_PCI_DMA
>   	  options "efi=disable_early_pci_dma" or "efi=no_disable_early_pci_dma"
>   	  may be used to override this option.
>   
> +config UNACCEPTED_MEMORY
> +	bool
> +	depends on EFI_STUB
> +	help
> +	   Some Virtual Machine platforms, such as Intel TDX, introduce
> +	   the concept of memory acceptance, requiring memory to be accepted
> +	   before it can be used by the guest. This protects against a class of
> +	   attacks by the virtual machine platform.

	Some Virtual Machine platforms, such as Intel TDX, require
	some memory to be "accepted" by the guest before it can be used.
	This requirement protects against a class of attacks by the
	virtual machine platform.

Can we make this "class of attacks" a bit more concrete?  Maybe:

	This mechanism helps prevent malicious hosts from making changes
	to guest memory.

??

> +	   UEFI specification v2.9 introduced EFI_UNACCEPTED_MEMORY memory type.
> +
> +	   This option adds support for unaccepted memory and makes such memory
> +	   usable by kernel.
> +
>   endmenu
>   
>   config EFI_EMBEDDED_FIRMWARE
> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index ae79c3300129..abe862c381b6 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -740,6 +740,7 @@ static __initdata char memory_type_name[][13] = {
>   	"MMIO Port",
>   	"PAL Code",
>   	"Persistent",
> +	"Unaccepted",
>   };
>   
>   char * __init efi_md_typeattr_format(char *buf, size_t size,
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
> index a0b946182b5e..346b12d6f1b2 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -9,12 +9,14 @@
>   #include <linux/efi.h>
>   #include <linux/pci.h>
>   #include <linux/stddef.h>
> +#include <linux/bitmap.h>
>   
>   #include <asm/efi.h>
>   #include <asm/e820/types.h>
>   #include <asm/setup.h>
>   #include <asm/desc.h>
>   #include <asm/boot.h>
> +#include <asm/unaccepted_memory.h>
>   
>   #include "efistub.h"
>   
> @@ -504,6 +506,13 @@ setup_e820(struct boot_params *params, struct setup_data *e820ext, u32 e820ext_s
>   			e820_type = E820_TYPE_PMEM;
>   			break;
>   
> +		case EFI_UNACCEPTED_MEMORY:
> +			if (!IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
> +				continue;
> +			e820_type = E820_TYPE_RAM;
> +			mark_unaccepted(params, d->phys_addr,
> +					d->phys_addr + PAGE_SIZE * d->num_pages);
> +			break;
>   		default:
>   			continue;
>   		}
> @@ -575,6 +584,9 @@ static efi_status_t allocate_e820(struct boot_params *params,
>   {
>   	efi_status_t status;
>   	__u32 nr_desc;
> +	bool unaccepted_memory_present = false;
> +	u64 max_addr = 0;
> +	int i;
>   
>   	status = efi_get_memory_map(map);
>   	if (status != EFI_SUCCESS)
> @@ -589,9 +601,55 @@ static efi_status_t allocate_e820(struct boot_params *params,
>   		if (status != EFI_SUCCESS)
>   			goto out;
>   	}
> +
> +	if (!IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
> +		goto out;
> +
> +	/* Check if there's any unaccepted memory and find the max address */
> +	for (i = 0; i < nr_desc; i++) {
> +		efi_memory_desc_t *d;
> +
> +		d = efi_early_memdesc_ptr(*map->map, *map->desc_size, i);
> +		if (d->type == EFI_UNACCEPTED_MEMORY)
> +			unaccepted_memory_present = true;
> +		if (d->phys_addr + d->num_pages * PAGE_SIZE > max_addr)
> +			max_addr = d->phys_addr + d->num_pages * PAGE_SIZE;
> +	}
> +
> +	/*
> +	 * If unaccepted memory present allocate a bitmap to track what memory

			       ^ is

> +	 * has to be accepted before access.
> +	 *
> +	 * One bit in the bitmap represents 2MiB in the address space: one 4k
> +	 * page is enough to track 64GiB or physical address space.

That's a bit awkward and needs a "or->of".  Perhaps:

	* One bit in the bitmap represents 2MiB in the address space:
	* A 4k bitmap can track 64GiB of physical address space.

> +	 * In the worst case scenario -- a huge hole in the middle of the
> +	 * address space -- It needs 256MiB to handle 4PiB of the address
> +	 * space.
> +	 *
> +	 * TODO: handle situation if params->unaccepted_memory has already set.
> +	 * It's required to deal with kexec.

What happens today with kexec() since its not dealt with?
