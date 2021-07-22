Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7972
	for <linux-coco@lists.linux.dev>; Thu, 22 Jul 2021 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626969462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dh05VWAySsgMXNYVhUYb9JqDex2rzz2KSdciloEnGI8=;
	b=jKvT9SdyLUXMX7hoM3usLKf6DwbYIPvRUgObuVdZcezu9SlPVMe3At/vfZxMJ9L8eAAGr6
	kxL5T9dXL/r8ZZCSmc0LxqUcQUguyz2rfVUC4iuxxNCjq9DQGVclwN1b41xobz0muwqqkU
	ol54rl0vW7qSQpyGsIKiwn47+odiqsk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-30R6WdHNMr6c8Zhb79m3Kw-1; Thu, 22 Jul 2021 11:57:41 -0400
X-MC-Unique: 30R6WdHNMr6c8Zhb79m3Kw-1
Received: by mail-wr1-f71.google.com with SMTP id d9-20020adffbc90000b029011a3b249b10so2601293wrs.3
        for <linux-coco@lists.linux.dev>; Thu, 22 Jul 2021 08:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Dh05VWAySsgMXNYVhUYb9JqDex2rzz2KSdciloEnGI8=;
        b=a0r/5jkC17yhzemZojCjPbjU0rNC9Vhj7TKlR+mp/aazs6ekqMLcVY+c2aPYp8AqT9
         lDmyFF6MhIsS9VujotysEZQOwle0iXdJoGe2Nh8VLzRrHw7IdlZ6yVOQsbSbGSSWXN3a
         YDIbSYnlqLYUMNuqtQ/Igx9xOkaz37AdmAnLeMf5dLsg3CYBGfqPPf0rjRh/rx8lQaL2
         Zq/G5xdB6SlF5M09GdYHCdCNYsNAdfL76k3XQF2XTEArb8DVJ6y1Wm9GdqYLgULG5Wdv
         cXLt54Fvx3KYLB20YB4/W6gr5h1RAbXk3Xn5MLJIoJnSZXkd/b3xTo/vSCbFgGxS1Cdg
         Qb1w==
X-Gm-Message-State: AOAM531vjNDIhtJSerXCfhP5W2nTqSCUZcu3JdgX8vCMXah3lHvsfOFO
	gIUp0g3Nxv9M/vgKy4stpHZ+KOtX14j+vcFURBBt6x/KoYqIDxyxLEWvjzh0bIVb2XSNr+kYyn4
	QgqBRestbl5lBTAAVL1BV80x1ZXhgnSwo2P/QVlvU5m+uc6YKKA200eEQqA/nfvbmV+Vyfw==
X-Received: by 2002:a05:6000:1c4:: with SMTP id t4mr654127wrx.181.1626969459850;
        Thu, 22 Jul 2021 08:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTGb2qTpqKwwB2vsF8+T0xHUvU8PZD+giVUQDrFjzQrPhmWnzevCt/+LHyVgMjumMjzTlMdA==
X-Received: by 2002:a05:6000:1c4:: with SMTP id t4mr654078wrx.181.1626969459478;
        Thu, 22 Jul 2021 08:57:39 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6970.dip0.t-ipconnect.de. [91.12.105.112])
        by smtp.gmail.com with ESMTPSA id a207sm3402712wme.27.2021.07.22.08.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 08:57:39 -0700 (PDT)
To: Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Jon Grimm <jon.grimm@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 "Kaplan, David" <David.Kaplan@amd.com>, Varad Gautam
 <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev
References: <YPV27hDPZUoVsIZt@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <b74e1f9d-5a3a-3e1b-7ed2-2c9e21dd08bf@redhat.com>
Date: Thu, 22 Jul 2021 17:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YPV27hDPZUoVsIZt@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.07.21 14:58, Joerg Roedel wrote:
> Hi,
> 
> I'd like to get some movement again into the discussion around how to
> implement runtime memory validation for confidential guests and wrote up
> some thoughts on it.
> Below are the results in form of a proposal I put together. Please let
> me know your thoughts on it and whether it fits everyones requirements.
> 
> Thanks,
> 
> 	Joerg
> 
> Proposal for Runtime Memory Validation in Secure Guests on x86
> ==============================================================
> 
> This proposal describes a method and protocol for runtime validation of
> memory in virtualization guests running with Intel Trusted Domain
> Extensions (Intel-TDX) or AMD Secure Nested Paging (AMD-SNP).
> 
> AMD-SNP and Intel-TDX use different terms to discuss memory page states.
> In AMD-SNP memory has to be 'validated' while in Intel-TDX is will be
> 'accepted'. This document uses the term 'validated' for both.
> 
> Problem Statement
> -----------------
> 
> Virtualization guests which run with AMD-SNP or Intel-TDX need to
> validate their memory before using it. The validation assigns a hardware
> state to each page which allows the guest to detect when the hypervisor
> tries to maliciously access or remap a guest-private page. The guest can
> only access validated pages.
> 
> There are three ways the guest memory can be validated:
> 
> 	I.   The firmware validates all of guest memory at boot time. This
> 	     is the simplest method which requires the least changes to
> 	     the Linux kernel. But this method is also very slow and
> 	     causes unwanted delays in the boot process, as verification
> 	     can take several seconds (depending on guest memory size).
> 
> 	II.  The firmware only validates its own memory and memory
> 	     validation happens as the memory is used. This significantly
> 	     improves the boot time, but needs more intrusive changes to
> 	     the Linux kernel and its boot process.
> 
> 
> 	III. Approach I. and II. can be combined. The firmware only
> 	     validates the first X MB/GB of guest memory and the rest is
> 	     validated on-demand.
> 
> For method II. and III. the guest needs to track which pages have
> already been validated to detect hypervisor attacks. This information
> needs to be carried through the whole boot process.
> 
> This poses challenges on the Linux boot process, as there is currently
> no way to forward information about validated memory up the boot chain.
> This proposal tries to describe a way to solve these challenges.
> 
> Memory Validation through the Boot Process and in the Running System
> --------------------------------------------------------------------
> 
> The memory is validated throughout the boot process as described below.
> These steps assume a firmware is present, but this proposal does not
> strictly require a firmware. The tasks done be the firmware can also be
> done by the hypervisor before starting the guest. The steps are:
> 
> 	1. The firmware validates all memory which will not be owned by
> 	   the boot loader or the OS.
> 
> 	2. The firmware also validates the first X MB of memory, just
> 	   enough to run a boot loader and to load the compressed Linux
> 	   kernel image. X is not expected to be very large, 64 or 128
> 	   MB should be enough. This pre-validation should not cause
> 	   significant delays in the boot process.
> 
> 	3. The validated memory is marked E820-Usable in struct
> 	   boot_params for the Linux decompressor. The rest of the
> 	   memory is also passed to Linux via new special E820 entries
> 	   which mark the memory as Usable-but-Invalid.
> 
> 	4. When the Linux decompressor takes over control, it evaluates
> 	   the E820 table and calculates to total amount of memory
> 	   available to Linux (valid and invalid memory).
> 
> 	   The decompressor allocates a physically contiguous data
> 	   structure at a random memory location which is big enough to
> 	   hold the the validation states of all 4kb pages available to
> 	   the guest. This data structure will be called the Validation
> 	   Bitmap through the rest of this document. The Validation
> 	   Bitmap is indexed by page frame numbers.
> 
> 	   It still needs to be determined how many bits are required
> 	   per page. This depends on the necessity to track validation
> 	   page-sizes. Two bits per page are enough to track the 3
> 	   page-sizes currently available on the x86 architecture.
> 
> 	   The decompressor initializes the Validation Bitmap by first
> 	   validating its backing memory and then updating it with the
> 	   information from the E820 table. It will also update the
> 	   table if it changes the state of pages from invalid to valid
> 	   (and vice versa, e.g. for mapping a GHCB page).
> 
> 	5. The 'struct boot_params' is extended to carry the location
> 	   and size of the Validation Bitmap to the extracted kernel
> 	   image.
> 	   In fact, since the decompressor already receives a 'struct
> 	   boot_params', it will check if it carries a Validation
> 	   Bitmap. If it does, the decompressor uses the existing one
> 	   instead of allocating a new one.
> 
> 	6. When the extracted kernel image takes over control, it will
> 	   make sure the Validation Bitmap is up to date when memory
> 	   needs to be validated.
> 
> 	7. When set up, the memblock and page allocators have to check
> 	   whether the memory they return is already validated, and
> 	   validate it if not.
> 
> 	   This should happen after the memory is allocated and all
> 	   allocator-locks are dropped, but before the memory is
> 	   returned to the caller. This way the access to the
> 	   validation bitmap can be implemented without locking and only
> 	   using atomic instructions.
> 
> 	   Under no circumstances the Linux kernel is allowed to
> 	   validate a page more than once. Doing this might create
> 	   attack vectors for the Hypervisor towards the guest.
> 
> 	8. When memory is returned to the memblock or page allocators,
> 	   it is _not_ invalidated. In fact, all memory which is freed
> 	   need to be valid. If it was marked invalid in the meantime
> 	   (e.g. if it the memory was used for DMA buffers), the code
> 	   owning the memory needs to validate it again before freeing
> 	   it.
> 
> 	   The benefit of doing memory validation at allocation time is
> 	   that it keeps the exception handler for invalid memory
> 	   simple, because no exceptions of this kind are expected under
> 	   normal operation.
> 
> The Validation Bitmap
> ---------------------
> 
> This document proposes the use of a Validation Bitmap to store the
> validation state of guest pages. This section discusses the benefits of
> this approach.
> 
> The Linux kernel already has an array to store various state for each
> memory page in the system: The struct page array. While this would be a
> natural place to also store page validation information, the Validation
> Bitmap is chosen because having the information separated has some clear
> benefits:
> 
> 	- The Validation Bitmap is allocated in the Linux decompressor
> 	  and already available long before the struct page array is
> 	  initialized.
> 
> 	- Since it is a simple in-memory data structure which is
> 	  physically contiguous, it can be passed along through the
> 	  various stages of the boot process.
> 
> 	- It can even be passed to a new kernel booted via kexec/kdump,
> 	  making it trivial to enable these features for AMD-SNP and
> 	  Intel-TDX.
> 
> 	- When memory validation happens in the memblock and page
> 	  allocators, there is no need for locking when making changes
> 	  to the Validation Bitmap, because:
> 	
> 	    - Nobody will try to concurrently access the same bits, as
> 	      the code-path doing the validation is the only owner of
> 	      the memory.
> 
> 	    - Updates can happen via atomic cmpxchg instructions
> 	      when multiple bits are used per page. If only one bit is
> 	      needed, atomic bit manipulation instructions will suffice.
> 
> 	- NUMA-locality is not considered to be a problem for the
> 	  Validation Bitmap. Since memory is not invalidated upon free,
> 	  the data structure will become read-mostly over time.
> 
> Final Notes
> -----------
> 
> This proposal does not introduce requirements about the firmware that
> has to be used to run Intel-TDX or AMD-SNP guests. It works with UEFI
> and non-UEFI firmwares, or with no firmware at all. This is important
> for use-cases like Confidential Containers running in VMs, which often
> use a very small firmware (or no firmware at all) for reducing boot
> times.
> 

Although most probably not what people want to have, but I'd just like 
to mention something that might be possible. It essentially hotplugs 
memory during boot what has been suggested here already ...

1. Start the VM with small memory (e.g., 256MiB)
2. Let the firmware validate all boot memory
3. Use virtio-mem to expose additional memory to the VM

As the VM boots up, virtio-mem will add the requested amount of memory 
to the guest. While it gets added, it will get validated and exposed to 
the page allocator.

kexec might need some thought if we end up invalidating parts of our 
validated boot memory (I assume that will happen when sharing memory). 
We would have to express these semantics in the e820 map we forward to 
out new kernel.

Pretty much all you'd need to do is teach virtio-mem encrypted memory 
semantics. Shouldn't be too hard I guess, but we would have to look into 
the details.

-- 
Thanks,

David / dhildenb

