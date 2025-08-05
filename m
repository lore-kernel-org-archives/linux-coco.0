Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711A517BA6
	for <linux-coco@lists.linux.dev>; Tue,  5 Aug 2025 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754401759; cv=none; b=Me/V35fd6pOBJ6SKmJ7itIVhf2umng7Gq6EK1fphWJalHJW5ll0Mr6IX5W3cZ3sJEIueE0UAl2Y8UR9ZVRj5Hg30/f+DEcv/Gb3u6GX6ph4KwjW+Faaum3Tn9th7vqBcQEQAlyTFv9kA3l7napwDtPgSk5qYSj9gAVxswsf6kVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754401759; c=relaxed/simple;
	bh=4+Xv8HdJDjCg0JB1inWUoSSIwe9H0xI17e7G1z+kA+4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D5CPtnVV70iWgkLIEgQ2Wn/BRkFVjDTt+eG22VZ1RXveUebyPEj9Z5H2EKwEpAoFR6qUdav/dKsc7G9xhyabrCFbxILXowDKnp0yebAgt8OwIShXaeFAIuAKcAX4fp384oq80//DfSRGfJKiTand0XjMrRJ4cVLrpqxI6Z+4Urc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o3M1Iucn; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o3M1Iucn"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-24011c9da24so48888965ad.1
        for <linux-coco@lists.linux.dev>; Tue, 05 Aug 2025 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754401758; x=1755006558; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D4i1z/XvcGAbannfCkDoRIkqe8/O998kxAd0zY9gLJc=;
        b=o3M1IucnGNcypTvMGnwYYpJI0k3ySTAS1Rn+IKRPB0mNnrAEJn1i4X4XgM85Ao4GHF
         n+0EcxEshM8e/G+qpcht/a4evSN/WdAcrFzGri1qNq2vf9GTCWQz7X1gWGS9wSsUlNaq
         rVDaBib3G29a8xFFWIPCfLN51W1NFxK58/IMxyehgJJQUkt+3U6dd1tBNn6VBvDwKJ/k
         2+D6dchlkpfJNf2eVDk0vJH9nCQiPfNabLfxG8ekiLJY9llqE24ICduaXXMcSHraZArW
         mlavrLwJ12Ol5mdDOBdc7RUx5aCqR0mEx7UwI3m0t88on27Q9TRC5WmzGlNAkN+bV7cI
         dNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754401758; x=1755006558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4i1z/XvcGAbannfCkDoRIkqe8/O998kxAd0zY9gLJc=;
        b=loFPZsXdKNKuv0dz0m2709zJW0AVbNx0pb4n/wb6WOsUYXGsg8eGzri57028aqmoYh
         zRzh46VBHEwL+WU5TKUibTHUNGZ/lLkZ4uWMxhTfrO9JPpORWUHTBCSc9Xh2saoeEiAF
         KVMsmHRSyIw6jHGkmZiPgeh/wdd8yMJCeSgHPEJDrvrT62e93noC65veE1ZLmnqKjhVo
         OZWOQk5McvDkQE5hDYxXB4c8EmP1B8F04+fTFxjfR5qWP+P/Fjv80ZxFsjGMV9v7SJBg
         KBGyw9pa+q70XEitM0gXn+hy/1uxxm33SCHWbi1myNhTQdMfeGP8LLXgl4ZwMQB/A8ya
         7RhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqMGovas8F51A5WOVsrCsl4/eBWuSA4oGw0PmAy7H9zxq1C8nQS9+CYQl1S6Hz5PC/we31uc1V+loY@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+++lGVkYbIj5mHTKLRZZJILfMQVzqwzvbgLSQD94P2K/Xw3Zm
	2qGsxac91+5VnybYZEU8jGgpFs0ZdCIhBVKBPpKNadcyyZPDJ1GzgRCgxpBEZJndJvsZSoaBcYX
	R59BCfw==
X-Google-Smtp-Source: AGHT+IFKrK4DyvDs6icrv139iiVhcAJ0rM2fF5QOWM4aN0sWp3WOepuMUy4R3vBuKLLHhh/FqQWKc6J3ksg=
X-Received: from plbu12.prod.google.com ([2002:a17:902:e20c:b0:240:801d:1089])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2451:b0:240:ac96:e054
 with SMTP id d9443c01a7336-24288d93ae0mr51708995ad.23.1754401757653; Tue, 05
 Aug 2025 06:49:17 -0700 (PDT)
Date: Tue, 5 Aug 2025 06:49:15 -0700
In-Reply-To: <6891826bbbe79_cff99100f7@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250523095322.88774-1-chao.gao@intel.com> <20250523095322.88774-8-chao.gao@intel.com>
 <aIhUVyJVQ+rhRB4r@yilunxu-OptiPlex-7050> <688bd9a164334_48e5100f1@dwillia2-xfh.jf.intel.com.notmuch>
 <aIwhUb3z9/cgsMwb@yilunxu-OptiPlex-7050> <688cdc169163a_32afb100b3@dwillia2-mobl4.notmuch>
 <aJBamtHaXpeu+ZR6@yilunxu-OptiPlex-7050> <68914d8f61c20_55f0910074@dwillia2-xfh.jf.intel.com.notmuch>
 <aJFUspObVxdqInBo@google.com> <6891826bbbe79_cff99100f7@dwillia2-xfh.jf.intel.com.notmuch>
Message-ID: <aJIL2wR3p1o_N4ZE@google.com>
Subject: Re: [RFC PATCH 07/20] x86/virt/tdx: Expose SEAMLDR information via sysfs
From: Sean Christopherson <seanjc@google.com>
To: dan.j.williams@intel.com
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	linux-coco@lists.linux.dev, x86@kernel.org, kvm@vger.kernel.org, 
	pbonzini@redhat.com, eddie.dong@intel.com, kirill.shutemov@intel.com, 
	dave.hansen@intel.com, kai.huang@intel.com, isaku.yamahata@intel.com, 
	elena.reshetova@intel.com, rick.p.edgecombe@intel.com, 
	Farrah Chen <farrah.chen@intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 04, 2025, dan.j.williams@intel.com wrote:
> Sean Christopherson wrote:
> > On Mon, Aug 04, 2025, dan.j.williams@intel.com wrote:
> > > Xu Yilun wrote:
> > > > So my idea is to remove tdx_tsm device (thus disables tdx_tsm driver) on
> > > > vmxoff.
> > > > 
> > > >   KVM                TDX core            TDX TSM driver
> > > >   -----------------------------------------------------
> > > >   tdx_disable()
> > > >                      tdx_tsm dev del
> > > >                                          driver.remove()
> > > >   vmxoff()
> > > > 
> > > > An alternative is to move vmxon/off management out of KVM, that requires
> > > > a lot of complex work IMHO, Chao & I both prefer not to touch it.
> > 
> > Eh, it's complex, but not _that_ complex.
> > 
> > > It is fine to require that vmxon/off management remain within KVM, and
> > > tie the lifetime of the device to the lifetime of the kvm_intel module*.
> > 
> > Nah, let's do this right.  Speaking from experience; horrible, make-your-eyes-bleed
> > experience; playing games with kvm-intel.ko to try to get and keep CPUs post-VMXON
> > will end in tears.
> > 
> > And it's not just TDX-feature-of-the-day that needs VMXON to be handled outside
> > of KVM, I'd also like to do so to allow out-of-tree hypervisors to do the "right
> > thing"[*].  Not because I care deeply about out-of-tree hypervisors, but because
> > the lack of proper infrastructure for utilizing virtualization hardware irks me.
> > 
> > The basic gist is to extract system-wide resources out of KVM and into a separate
> > module, so that e.g. tdx_tsm or whatever can take a dependency on _that_ module
> > and elevate refcounts as needed.  All things considered, there aren't so many
> > system-wide resources that it's an insurmountable task.
> >
> > I can provide some rough patches to kickstart things.  It'll probably take me a
> > few weeks to extract them from an old internal branch, and I can't promise they'll
> > compile.  But they should be good enough to serve as an RFC.
> > 
> > https://lore.kernel.org/all/ZwQjUSOle6sWARsr@google.com
> 
> Sounds reasonable to me.
> 
> Not clear on how it impacts tdx_tsm implementation. The lifetime of this
> tdx_tsm device can still be bound by tdx_enable() / tdx_cleanup(). The
> refactor removes the need for the autoprobe hack below. It may also
> preclude async vmxoff cases by pinning? Or does pinning still not solve
> the reasons for bouncing vmx on suspend/shutdown?

What exactly is the concern with suspend/shutdown?

Suspend should be a non-issue, as userspace tasks need to be frozen before the
kernel fires off the suspend notifiers.  Ditto for a normal shutdown.

Forced shutdown will be asynchronous with respect to running vCPUs, but all bets
are off on a forced shutdown.  Ditto for disabling VMX via NMI shootdown on a
crash.
