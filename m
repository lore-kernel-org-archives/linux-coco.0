Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3B02C85
	for <linux-coco@lists.linux.dev>; Sat, 13 Nov 2021 00:10:31 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id o4so20861020oia.10
        for <linux-coco@lists.linux.dev>; Fri, 12 Nov 2021 16:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eKWR0Y85NN7RyQ3kGVx0D7iJn85BJCX0K42JtUXarAU=;
        b=JYfrhOhYB5iowTwOaEQsAuvCl/7R6EpEwANtkrLj6rABd0tsys3aea7mOPld/+PLvS
         lnZ9icq3oa1InotU4n42ZayV+SYueUbrC0oGp1+SPmpM39juy6KfrNpk1Pf4rBTRANq0
         Ucn/np3CXWU1FoBpNmNZ8oi//yUyN/x933NJXo+85Fd/x+GNxvPpqyLiRHiNizgHYyDC
         wViGb08gcQ7pCgch4yZJlEhogV7AxCAo1x/Wlq7EnDSnSk3ihoFnZqaHvnc2z1KqTYDQ
         H01Zkd7mlwdp8BHlR+MLHR1KlyTNIvJFFqa4rFh80ZZu5DtDqNwaO1HIid09OxqCERZT
         gGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eKWR0Y85NN7RyQ3kGVx0D7iJn85BJCX0K42JtUXarAU=;
        b=AlJiFweZvN06rcTG+c+3BWWRAm4TQFhmGVXi93M1+6IUDT3OhkXQMJ0EFNNotjU72d
         cQbKUcX3sWRpoZ4UyNqCwqpyD0luffGs6uBA4MPwTu+eGkHB254q/SEdI/rUcedXD8M/
         DGgiO/cDRzS1YGPn4qPhGJUsIh8r6m+wwY6pkysyons2BYQ1UM6LvgwUpwciQHGNxcmU
         lS7IlynHGgiI7Z5QkcJYWzMY4Q4GtijyP1WZXZPCr8pGxd2R0VgTwomQhBaOroS+qiv6
         uH4vvnN/QDiAqTHc64fkGpBpBU43GFLaLTKRcPz5o4qpHm/BaEyI0q3IdPoLGj1nMWeo
         Y23A==
X-Gm-Message-State: AOAM532OM8RPBimYyKO1BU+Ib7diVDL6vXjTCJ1Ygsk67N4RRu939S59
	9Bm+HQcebBD+wm1dFmRLArE1XcLzXYpwyc0s9IerDg==
X-Google-Smtp-Source: ABdhPJx9yxkxXBkwcUqi9sbNpn5OrCz3LM/gA5pbKkH6GuxZuW6RD9lgnKKdhAxYNPawJLvgPOHidPn+AyZzaBVvkWQ=
X-Received: by 2002:aca:2319:: with SMTP id e25mr29645817oie.164.1636762230285;
 Fri, 12 Nov 2021 16:10:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210820155918.7518-1-brijesh.singh@amd.com> <CAMkAt6o0ySn1=iLYsH0LCnNARrUbfaS0cvtxB__y_d+Q6DUzfA@mail.gmail.com>
 <061ccd49-3b9f-d603-bafd-61a067c3f6fa@intel.com> <YY6z5/0uGJmlMuM6@zn.tnic>
 <YY7FAW5ti7YMeejj@google.com> <YY7I6sgqIPubTrtA@zn.tnic> <YY7Qp8c/gTD1rT86@google.com>
 <YY7USItsMPNbuSSG@zn.tnic> <CAMkAt6o909yYq3NfRboF3U3V8k-2XGb9p_WcQuvSjOKokmMzMA@mail.gmail.com>
 <YY8AJnMo9nh3tyPB@google.com>
In-Reply-To: <YY8AJnMo9nh3tyPB@google.com>
From: Marc Orr <marcorr@google.com>
Date: Fri, 12 Nov 2021 16:10:18 -0800
Message-ID: <CAA03e5G=fY7_qESCuoHW3_VdVbDWekqQxmvLPzWNepBqJjyCXg@mail.gmail.com>
Subject: Re: [PATCH Part2 v5 00/45] Add AMD Secure Nested Paging (SEV-SNP)
 Hypervisor Support
To: Sean Christopherson <seanjc@google.com>
Cc: Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@intel.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	Tom Lendacky <Thomas.Lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, 
	Michael Roth <Michael.Roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

> > > If *it* is the host kernel, then you probably shouldn't do that -
> > > otherwise you just killed the host kernel on which all those guests are
> > > running.
> >
> > I agree, it seems better to terminate the single guest with an issue.
> > Rather than killing the host (and therefore all guests). So I'd
> > suggest even in this case we do the 'convert to shared' approach or
> > just outright terminate the guest.
> >
> > Are there already examples in KVM of a KVM bug in servicing a VM's
> > request results in a BUG/panic/oops? That seems not ideal ever.
>
> Plenty of examples.  kvm_spurious_fault() is the obvious one.  Any NULL pointer
> deref will lead to a BUG, etc...  And it's not just KVM, e.g. it's possible, if
> unlikely, for the core kernel to run into guest private memory (e.g. if the kernel
> botches an RMP change), and if that happens there's no guarantee that the kernel
> can recover.
>
> I fully agree that ideally KVM would have a better sense of self-preservation,
> but IMO that's an orthogonal discussion.

I don't think we should treat the possibility of crashing the host
with live VMs nonchalantly. It's a big deal. Doing so has big
implications on the probability that any cloud vendor wil bee able to
deploy this code to production. And aren't cloud vendors one of the
main use cases for all of this confidential compute stuff? I'm
honestly surprised that so many people are OK with crashing the host.
