Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7B33C00
	for <linux-coco@lists.linux.dev>; Wed, 22 Jun 2022 19:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655927938; x=1687463938;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/AkwmRb71k4NSPIVIddCWDYPziSccddt8BBoov0zW9c=;
  b=HCbR0t8H227ex0h5xoXchTVpXzTT0GKm1sO1f5C5ExtLEa9NpS2AW7Rx
   Hyyc58mc6J3+uHQyfrS0+/inE8YAYBynI8srmeJhZh1ot6A4d2/CgvVKO
   zd/FODI45XUeeCdEUFDoer2dom6p2YWWz4PpCjH8USadiwqfUM5IE68tt
   4tPNM3oMCinARLz2pjtwHBmGLpBgH0c0worDh7BJ898TCdjF11EFq9Mys
   mMoh0IwIzemkgLEiJpB0YhSuU65HAI1lWhPzJSgZ4RFBjv8PPXabJoMvT
   MibRSdo8yuguNa3+zx7GssXg6oIKkemBE7nufPxOtNEPe8N2wpfE7HPeG
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="281259171"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="281259171"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 12:58:58 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="677723423"
Received: from bshakya-mobl.amr.corp.intel.com (HELO [10.212.188.76]) ([10.212.188.76])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 12:58:56 -0700
Message-ID: <0f139dac-dabf-d6c0-21cf-e680ff2bddf6@intel.com>
Date: Wed, 22 Jun 2022 12:58:36 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv7 06/14] efi/x86: Implement support for unaccepted memory
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
 Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 marcelo.cerri@canonical.com, tim.gardner@canonical.com,
 khalid.elmously@canonical.com, philip.cox@canonical.com, x86@kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-7-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220614120231.48165-7-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/14/22 05:02, Kirill A. Shutemov wrote:
...
> +/*
> + * The accepted memory bitmap only works at PMD_SIZE granularity. If a request
> + * comes in to mark memory as unaccepted which is not PMD_SIZE-aligned, simply
> + * accept the memory now since it can not be *marked* as unaccepted.
> + */

/*
 * The accepted memory bitmap only works at PMD_SIZE granularity.  This
 * function takes unaligned start/end addresses and either:
 *  1. Accepts the memory immediately and in its entirety
 *  2. Accepts unaligned parts, and marks *some* aligned part unaccepted
 *
 * The function will never reach the bitmap_set() with zero bits to set.
 */


> +void process_unaccepted_memory(struct boot_params *params, u64 start, u64 end)
> +{
> +	/*
> +	 * Accept small regions that might not be able to be represented
> +	 * in the bitmap.  This is a bit imprecise and may accept some
> +	 * areas that could have been represented in the bitmap instead.

	/*
	 * Ensure that at least one bit will be set in the bitmap by
	 * immediately accepting all regions under 2*PMD_SIZE.  This is
	 * imprecise and may immediately accept some areas that could
	 * have been represented in the bitmap.  But, results in simpler
	 * code below.

> +	 * Consider case like this:
> +	 *
> +	 * | 4k | 2044k |    2048k   |
> +	 * ^ 0x0        ^ 2MB        ^ 4MB
> +	 *
> +	 * all memory in the range is unaccepted, except for the first 4k.
> +	 * The second 2M can be represented in the bitmap, but kernel accept it
> +	 * right away. The imprecision makes the code simpler by ensuring that
> +	 * at least one bit will be set int the bitmap below.
> +	 */

	...
	* Only the first 4k has been accepted.  The 0MB->2MB region can
	* not be represented in the bitmap.  The 2MB->4MB region can be
	* represented in the bitmap.  But, the 0MB->4MB region is
	* <2*PMD_SIZE and will be immediately accepted in its entirety.
	*/

> +	if (end - start < 2 * PMD_SIZE) {
> +		__accept_memory(start, end);
> +		return;
> +	}
> +
> +	/*
> +	 * No matter how the start and end are aligned, at least one unaccepted
> +	 * PMD_SIZE area will remain.
> +	 */

I'd probably add:

	... to be marked in the bitmap


<snip>
> @@ -607,6 +608,17 @@ setup_e820(struct boot_params *params, struct setup_data *e820ext, u32 e820ext_s
>  			e820_type = E820_TYPE_PMEM;
>  			break;
>  
> +		case EFI_UNACCEPTED_MEMORY:
> +			if (!IS_ENABLED(CONFIG_UNACCEPTED_MEMORY)) {
> +				efi_warn_once("The system has unaccepted memory,"
> +					     " but kernel does not support it\n");
> +				efi_warn_once("Consider enabling CONFIG_UNACCEPTED_MEMORY\n");
> +				continue;
> +			}
> +			e820_type = E820_TYPE_RAM;
> +			process_unaccepted_memory(params, d->phys_addr,
> +						  d->phys_addr + PAGE_SIZE * d->num_pages);
> +			break;
>  		default:
>  			continue;
>  		}
> @@ -671,6 +683,59 @@ static efi_status_t alloc_e820ext(u32 nr_desc, struct setup_data **e820ext,
>  	return status;
>  }
>  
> +static efi_status_t allocate_unaccepted_memory(struct boot_params *params,
> +					       __u32 nr_desc,
> +					       struct efi_boot_memmap *map)

I think this is misnamed.  This function is allocating a bitmap, not
"unaccepted_memory" itself.  Right?

> +{
> +	unsigned long *mem = NULL;
> +	u64 size, max_addr = 0;
> +	efi_status_t status;
> +	bool found = false;
> +	int i;
> +
> +	/* Check if there's any unaccepted memory and find the max address */
> +	for (i = 0; i < nr_desc; i++) {
> +		efi_memory_desc_t *d;
> +
> +		d = efi_early_memdesc_ptr(*map->map, *map->desc_size, i);
> +		if (d->type == EFI_UNACCEPTED_MEMORY)
> +			found = true;
> +		if (d->phys_addr + d->num_pages * PAGE_SIZE > max_addr)
> +			max_addr = d->phys_addr + d->num_pages * PAGE_SIZE;
> +	}
> +
> +	if (!found) {
> +		params->unaccepted_memory = 0;
> +		return EFI_SUCCESS;
> +	}
> +
> +	/*
> +	 * If unaccepted memory is present allocate a bitmap to track what
			
					  ^ comma

> +	 * memory has to be accepted before access.
> +	 *
> +	 * One bit in the bitmap represents 2MiB in the address space:
> +	 * A 4k bitmap can track 64GiB of physical address space.
> +	 *
> +	 * In the worst case scenario -- a huge hole in the middle of the
> +	 * address space -- It needs 256MiB to handle 4PiB of the address
> +	 * space.
> +	 *
> +	 * TODO: handle situation if params->unaccepted_memory is already set.
> +	 * It's required to deal with kexec.
> +	 *
> +	 * The bitmap will be populated in setup_e820() according to the memory
> +	 * map after efi_exit_boot_services().
> +	 */
> +	size = DIV_ROUND_UP(max_addr, PMD_SIZE * BITS_PER_BYTE);
> +	status = efi_allocate_pages(size, (unsigned long *)&mem, ULONG_MAX);
> +	if (status == EFI_SUCCESS) {
> +		memset(mem, 0, size);
> +		params->unaccepted_memory = (unsigned long)mem;
> +	}
> +
> +	return status;
> +}
> +
>  static efi_status_t allocate_e820(struct boot_params *params,
>  				  struct efi_boot_memmap *map,
>  				  struct setup_data **e820ext,
> @@ -691,6 +756,9 @@ static efi_status_t allocate_e820(struct boot_params *params,
>  		status = alloc_e820ext(nr_e820ext, e820ext, e820ext_size);
>  	}
>  
> +	if (IS_ENABLED(CONFIG_UNACCEPTED_MEMORY) && status == EFI_SUCCESS)
> +		status = allocate_unaccepted_memory(params, nr_desc, map);
> +
>  	efi_bs_call(free_pool, *map->map);
>  	return status;
>  }
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index 7d9b0bb47eb3..9c2fa94f2f93 100644
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

