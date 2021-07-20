Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705F70
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 00:26:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3182961002;
	Tue, 20 Jul 2021 00:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626740783;
	bh=IrZr03z2SQRxc1W/xuTvhpX0Ux1VQDmxsw9XbqpRfYo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=RjdsKTIpIlVlfQh6IP8KYojvOEw02JEfzQ+dqxGxqzSZeGxO6k7xEsmxzMgsxIcWq
	 K7vszQ3DVEEF8OUKBNiIiV54hKrhQqOOz70VicNBVTmH6Bx+UdkcRzEXHYV3ZknBAn
	 CXNnGzBeNqsJ7lns3dQb3iFE2QS/hleXhtXp2JTh3UTRFAcuCC/qpsowOw3jcyN0M8
	 vDtH+GO/canQLIxYJDvjSBxJ2gx6VsAhEfNrRybWuvrjFwYxV7taMSQ+zYvKBSxqXE
	 NZAhhh3BGmlqrqU7rTrKzUkYKC00cSEmAGqYaK5oPJjP18bcpY21HcMBkybSD/EkM9
	 ZsRw+kEdZfj7A==
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
To: Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>,
 Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>,
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
From: Andy Lutomirski <luto@kernel.org>
Message-ID: <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
Date: Mon, 19 Jul 2021 17:26:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YPV27hDPZUoVsIZt@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/19/21 5:58 AM, Joerg Roedel wrote:

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

At the risk of asking a potentially silly question, would it be
reasonable to treat non-validated memory as not-present for kernel
purposes and hot-add it in a thread as it gets validated?  Or would this
result in poor system behavior before enough memory is validated?
Perhaps we should block instead of failing allocations if we want more
memory than is currently validated?

--Andy
