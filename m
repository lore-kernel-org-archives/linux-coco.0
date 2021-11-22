Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8EA68
	for <linux-coco@lists.linux.dev>; Mon, 22 Nov 2021 21:34:11 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id m15so16375821pgu.11
        for <linux-coco@lists.linux.dev>; Mon, 22 Nov 2021 13:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C6kqWf8YL8Pc2dhuN/yLLDflJewwm9k+jgx8JhJxfWI=;
        b=Y4jFEgnmso7slD8LmL+kHkcNuNHAU/37pom02AnkOXJQBehxeoCWnx+y1Ay+5jTHkt
         coGzrMB4Xgugt8yyYmw4BNvCxgmlYN0WS0xiPHG+ISwHq0tRZ0Mg7IiiBPlthWJPFiIc
         wbqm5LT0GOi5tfvtMY7V2y7btZs0kYlE9HXxCc1Dt0dpcJXHkADQLyitH82pTJmfJ5ze
         ti+OahblPqZ4/SyJAQN7CRkytCBKXGQQVU2LWiqdmqN/xzx6cdci5pw1hiM9FeGyHAYZ
         n+aaI/WVszqxWu+ZAg88mTKSERwgqTtW0RqEMFl6fIZ87hlbdUk2bmolJLE3N3NqCFBX
         bNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C6kqWf8YL8Pc2dhuN/yLLDflJewwm9k+jgx8JhJxfWI=;
        b=B3+YTYI+avTjiZfzKphrTMGckEYaz14Wy0WX64SK7tX7dAdY/4nrtAWLEPuN7HS4gh
         Q/qjBAs7XsHclbYU21v9C6AhG3EEbBRRu8snPAdmsjv6TXR215sImaXTtJZGhHfyb7I7
         jnwmb6r3c1S6jKTxHi4fBwXhEKtUU22lTUsql65yfM3qe9KZRv0WLld2qFWHc8mKdWi3
         kHZmVtdKyTiy58FTjnRJq9myFXDftPOkL+kWtxa5x2XEfTfLGveTQd5vvcxyIAsWpe+O
         kuMKlOglhXQAouuS6LcCSuXQ94+hCkN0URuElhXqPhhPps95fYTVxTf7wPlojGo9BwpQ
         BiSQ==
X-Gm-Message-State: AOAM532APMNAwwmRc5uW1SmGwl26nrt0cSIBrArLh6+YQ6CVEEZSlQHO
	+iKCwFSSBBTIe9vKr0qhNUKyJQ==
X-Google-Smtp-Source: ABdhPJzg1Ma8Ooke2Tu2SRT4bzBeuNYSa3FNKmTYJnIPrnbr5F4nQ/snq2bFZz6CLLSh1eNnhZn30Q==
X-Received: by 2002:a63:87c1:: with SMTP id i184mr35130pge.75.1637616850788;
        Mon, 22 Nov 2021 13:34:10 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id c5sm8228997pjm.52.2021.11.22.13.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 13:34:10 -0800 (PST)
Date: Mon, 22 Nov 2021 21:34:06 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Peter Gonda <pgonda@google.com>,
	x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <Thomas.Lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH Part2 v5 00/45] Add AMD Secure Nested Paging (SEV-SNP)
 Hypervisor Support
Message-ID: <YZwMzpx8422JiJTS@google.com>
References: <20210820155918.7518-1-brijesh.singh@amd.com>
 <CAMkAt6o0ySn1=iLYsH0LCnNARrUbfaS0cvtxB__y_d+Q6DUzfA@mail.gmail.com>
 <daf5066b-e89b-d377-ed8a-9338f1a04c0d@amd.com>
 <d673f082-9023-dafb-e42e-eab32a3ddd0c@intel.com>
 <f15597a0-e7e0-0a57-39fd-20715abddc7f@amd.com>
 <5f3b3aab-9ec2-c489-eefd-9136874762ee@intel.com>
 <d83e6668-bec4-8d1f-7f8a-085829146846@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d83e6668-bec4-8d1f-7f8a-085829146846@amd.com>

On Mon, Nov 22, 2021, Brijesh Singh wrote:
> 
> On 11/22/21 1:14 PM, Dave Hansen wrote:
> > On 11/22/21 11:06 AM, Brijesh Singh wrote:
> > > > 3. Kernel accesses guest private memory via a kernel mapping.  This one
> > > >     is tricky.  These probably *do* result in a panic() today, but
> > > >     ideally shouldn't.
> > > KVM has defined some helper functions to maps and unmap the guest pages.
> > > Those helper functions do the GPA to PFN lookup before calling the
> > > kmap(). Those helpers are enhanced such that it check the RMP table
> > > before the kmap() and acquire a lock to prevent a page state change
> > > until the kunmap() is called. So, in the current implementation, we
> > > should *not* see a panic() unless there is a KVM driver bug that didn't
> > > use the helper functions or a bug in the helper function itself.
> > 
> > I don't think this is really KVM specific.
> > 
> > Think of a remote process doing ptrace(PTRACE_POKEUSER) or pretty much
> > any generic get_user_pages() instance.  As long as the memory is mapped
> > into the page tables, you're exposed to users that walk the page tables.
> > 
> > How do we, for example, prevent ptrace() from inducing a panic()?
> > 
> 
> In the current approach, this access will induce a panic(). In general,
> supporting the ptrace() for the encrypted VM region is going to be
> difficult.

But ptrace() is just an example, any path in the kernel that accesses a gup'd
page through a kernel mapping will explode if handed a guest private page.

> The upcoming TDX work to unmap the guest memory region from the current process
> page table can easily extend for the SNP to cover the current limitations.

That represents an ABI change though.  If KVM allows userspace to create SNP guests
without any guarantees that userspace cannot coerce the kernel into accessing guest
private memory, then we are stuck supporting that behavior even if KVM later gains
the ability to provide such guarantees through new APIs.

If allowing this behavior was only a matter of the system admin opting into a
dangerous configuration, I would probably be ok merging SNP with it buried behind
EXPERT or something scarier, but this impacts KVM's ABI as well as kernel internals,
e.g. the hooks in kvm_vcpu_map() and friends are unnecessary if KVM can differentiate
between shared and private gfns in its memslots, as gfn_to_pfn() will either fail or
point at memory that is guaranteed to be in the shared state.
