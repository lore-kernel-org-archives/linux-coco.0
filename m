Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0534B72
	for <linux-coco@lists.linux.dev>; Mon, 19 Jul 2021 13:04:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D47582026F;
	Mon, 19 Jul 2021 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1626699504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=LwXdK5uAWXDCI6OJciCR9R6eLa4PIiXVh53sJmptP3c=;
	b=neZvnGnInSnEkzB1IdlipqMgL3Z6daIKX/sFFeckO08XBc31pvrmwW/CO+KeCmialTkt+V
	Gp0DmeYol+Pezvg6wKbU8W+pZM/PVM2Whd1amXUrYFK1i7pFcT6NJY5qjPx+FAhLTb1IHs
	Cy8AkeWFY4acLXye/R+zRQyQq/wnVB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1626699504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=LwXdK5uAWXDCI6OJciCR9R6eLa4PIiXVh53sJmptP3c=;
	b=qQNOp4HcOGQAZXDyag/swkRs/Kb1RUY8uopq2OeG8LJBcVpUTFvZ/AUu60+26JwVrU8hWc
	pilZCOUYyexlHRBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FD9413CE9;
	Mon, 19 Jul 2021 12:58:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4iESBvB29WDbagAAMHmgww
	(envelope-from <jroedel@suse.de>); Mon, 19 Jul 2021 12:58:24 +0000
Date: Mon, 19 Jul 2021 14:58:22 +0200
From: Joerg Roedel <jroedel@suse.de>
To: David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, Joerg Roedel <jroedel@suse.de>
Cc: x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev
Subject: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <YPV27hDPZUoVsIZt@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'd like to get some movement again into the discussion around how to
implement runtime memory validation for confidential guests and wrote up
some thoughts on it.
Below are the results in form of a proposal I put together. Please let
me know your thoughts on it and whether it fits everyones requirements.

Thanks,

	Joerg

Proposal for Runtime Memory Validation in Secure Guests on x86
==============================================================

This proposal describes a method and protocol for runtime validation of
memory in virtualization guests running with Intel Trusted Domain
Extensions (Intel-TDX) or AMD Secure Nested Paging (AMD-SNP).

AMD-SNP and Intel-TDX use different terms to discuss memory page states.
In AMD-SNP memory has to be 'validated' while in Intel-TDX is will be
'accepted'. This document uses the term 'validated' for both.

Problem Statement
-----------------

Virtualization guests which run with AMD-SNP or Intel-TDX need to
validate their memory before using it. The validation assigns a hardware
state to each page which allows the guest to detect when the hypervisor
tries to maliciously access or remap a guest-private page. The guest can
only access validated pages.

There are three ways the guest memory can be validated:

	I.   The firmware validates all of guest memory at boot time. This
	     is the simplest method which requires the least changes to
	     the Linux kernel. But this method is also very slow and
	     causes unwanted delays in the boot process, as verification
	     can take several seconds (depending on guest memory size).

	II.  The firmware only validates its own memory and memory
	     validation happens as the memory is used. This significantly
	     improves the boot time, but needs more intrusive changes to
	     the Linux kernel and its boot process.


	III. Approach I. and II. can be combined. The firmware only
	     validates the first X MB/GB of guest memory and the rest is
	     validated on-demand.

For method II. and III. the guest needs to track which pages have
already been validated to detect hypervisor attacks. This information
needs to be carried through the whole boot process.

This poses challenges on the Linux boot process, as there is currently
no way to forward information about validated memory up the boot chain.
This proposal tries to describe a way to solve these challenges.

Memory Validation through the Boot Process and in the Running System
--------------------------------------------------------------------

The memory is validated throughout the boot process as described below.
These steps assume a firmware is present, but this proposal does not
strictly require a firmware. The tasks done be the firmware can also be
done by the hypervisor before starting the guest. The steps are:

	1. The firmware validates all memory which will not be owned by
	   the boot loader or the OS.

	2. The firmware also validates the first X MB of memory, just
	   enough to run a boot loader and to load the compressed Linux
	   kernel image. X is not expected to be very large, 64 or 128
	   MB should be enough. This pre-validation should not cause
	   significant delays in the boot process.

	3. The validated memory is marked E820-Usable in struct
	   boot_params for the Linux decompressor. The rest of the
	   memory is also passed to Linux via new special E820 entries
	   which mark the memory as Usable-but-Invalid.

	4. When the Linux decompressor takes over control, it evaluates
	   the E820 table and calculates to total amount of memory
	   available to Linux (valid and invalid memory).

	   The decompressor allocates a physically contiguous data
	   structure at a random memory location which is big enough to
	   hold the the validation states of all 4kb pages available to
	   the guest. This data structure will be called the Validation
	   Bitmap through the rest of this document. The Validation
	   Bitmap is indexed by page frame numbers. 

	   It still needs to be determined how many bits are required
	   per page. This depends on the necessity to track validation
	   page-sizes. Two bits per page are enough to track the 3
	   page-sizes currently available on the x86 architecture.

	   The decompressor initializes the Validation Bitmap by first
	   validating its backing memory and then updating it with the
	   information from the E820 table. It will also update the
	   table if it changes the state of pages from invalid to valid
	   (and vice versa, e.g. for mapping a GHCB page).

	5. The 'struct boot_params' is extended to carry the location
	   and size of the Validation Bitmap to the extracted kernel
	   image.
	   In fact, since the decompressor already receives a 'struct
	   boot_params', it will check if it carries a Validation
	   Bitmap. If it does, the decompressor uses the existing one
	   instead of allocating a new one.

	6. When the extracted kernel image takes over control, it will
	   make sure the Validation Bitmap is up to date when memory
	   needs to be validated.

	7. When set up, the memblock and page allocators have to check
	   whether the memory they return is already validated, and
	   validate it if not.

	   This should happen after the memory is allocated and all
	   allocator-locks are dropped, but before the memory is
	   returned to the caller. This way the access to the
	   validation bitmap can be implemented without locking and only
	   using atomic instructions.

	   Under no circumstances the Linux kernel is allowed to
	   validate a page more than once. Doing this might create
	   attack vectors for the Hypervisor towards the guest.

	8. When memory is returned to the memblock or page allocators,
	   it is _not_ invalidated. In fact, all memory which is freed
	   need to be valid. If it was marked invalid in the meantime
	   (e.g. if it the memory was used for DMA buffers), the code
	   owning the memory needs to validate it again before freeing
	   it.

	   The benefit of doing memory validation at allocation time is
	   that it keeps the exception handler for invalid memory
	   simple, because no exceptions of this kind are expected under
	   normal operation.

The Validation Bitmap
---------------------

This document proposes the use of a Validation Bitmap to store the
validation state of guest pages. This section discusses the benefits of
this approach.

The Linux kernel already has an array to store various state for each
memory page in the system: The struct page array. While this would be a
natural place to also store page validation information, the Validation
Bitmap is chosen because having the information separated has some clear
benefits:

	- The Validation Bitmap is allocated in the Linux decompressor
	  and already available long before the struct page array is
	  initialized.

	- Since it is a simple in-memory data structure which is
	  physically contiguous, it can be passed along through the
	  various stages of the boot process.

	- It can even be passed to a new kernel booted via kexec/kdump,
	  making it trivial to enable these features for AMD-SNP and
	  Intel-TDX.

	- When memory validation happens in the memblock and page
	  allocators, there is no need for locking when making changes
	  to the Validation Bitmap, because:
	  
	    - Nobody will try to concurrently access the same bits, as
	      the code-path doing the validation is the only owner of
	      the memory.

	    - Updates can happen via atomic cmpxchg instructions
	      when multiple bits are used per page. If only one bit is
	      needed, atomic bit manipulation instructions will suffice.

	- NUMA-locality is not considered to be a problem for the
	  Validation Bitmap. Since memory is not invalidated upon free,
	  the data structure will become read-mostly over time.

Final Notes
-----------

This proposal does not introduce requirements about the firmware that
has to be used to run Intel-TDX or AMD-SNP guests. It works with UEFI
and non-UEFI firmwares, or with no firmware at all. This is important
for use-cases like Confidential Containers running in VMs, which often
use a very small firmware (or no firmware at all) for reducing boot
times.
