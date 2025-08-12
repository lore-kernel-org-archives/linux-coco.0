Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E95311C17
	for <linux-coco@lists.linux.dev>; Tue, 12 Aug 2025 02:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754965901; cv=none; b=eKiFNzdSYAG1N/4S0S5Gf1UoI2uR6abLZHmtLtxsliG0X45gdCKdohK8JgYL4Cz4I9nc/1t3Hg5/tLWEJyk4z0OPXWLyysnrsoeoko6XVXda91tudeC5ynDnHN5jPMXWmqfXXvIUZi0UbDIBfRhfdTegK9o8Cyh5zjlBIXgA6BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754965901; c=relaxed/simple;
	bh=BJuyteyw9XvfwFNLKSUu1hI0HxKgX0sf6HX0jQtRbkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nH4nF5CS9qCmUwUNZfHh/YeAIw44WNpJSljYLhLgHx2zz+JxsCjERQxoHrW8l4HlYLuCw/ivI39awnqr1X4qEcpgZuqtFcRjap9pCdtyPo3i9NwqbsIY+qv94ajXmj3PYUTVkipU4E/rvkbzXiknnNJsM4LoHA22hOrKjrYiuSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M6bZs29P; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M6bZs29P"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-242d3be6484so51465ad.1
        for <linux-coco@lists.linux.dev>; Mon, 11 Aug 2025 19:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754965899; x=1755570699; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gigjc+YHl8yhW0BHFCQHAU5Qlxh88HdkyU2sD42vIKs=;
        b=M6bZs29P0vHfyz+khC9mzBH9F/QPd5ihIhTO54m9jVmjcxPpcEq/CpxGgKLjsppOgU
         quAZaG7YTG5rGHFP7ycYXaviICC4ewOgQOM+Bgb0kVODAWSk2CvfmWT3pKPXQrIrFPOw
         fEh+P3oFum0YihqJl/9IEIuDM7LIy2aIzzsGjWZWALwSATX1zbmOXAhVLM6QvnpJZad/
         im67hDo1om+K2aTpuxBXAhPdwXf1kZEC++T7wo03WmDb8ZguzSrR9qLSbmeNXshLp2Cu
         Y2ZXWZmK7mPg6QEeBPboLh3KKttpwOoWSBz1nDCZeXAspvKDqaA/5cXRUeE8fz0U7wcL
         3Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754965899; x=1755570699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gigjc+YHl8yhW0BHFCQHAU5Qlxh88HdkyU2sD42vIKs=;
        b=ttDM7yZlPNoqA39R6IJl2ANlcWA5QfsvuV1zKY80estZp0nPszi2dhBKf4vjpNPwYv
         Qs9Z/MqtRi32xHaC3iii/4+x0z8p05fVZttHmeqGiShdc8Jb/4jfhk0zbhxSWg/Ufhzb
         gQZMb5+kCZF6sSbBJh+wgx4UqUBsuo7viuLVN45GO3lcCjrk8wuNbawKsFjHacyfyj30
         oTNu8p94foYIeq2ir/YMqFhg4LdGjA5XPUjbkae0gSprVTAUNxOj+UG+rYUDwO7gtrM/
         Pk1Ip2IRCB7S8j7b0n/iXB35lSf+f8W7bv9HgaaXOdNUlBqOJuZrdL6+Qb4scLhQJ1Nu
         cYLg==
X-Forwarded-Encrypted: i=1; AJvYcCXOvGw2wxtZJMXyH9m88OQ5KHm+F7BhTRGNQ2bHDuCCETnTl8ClYIBDZbn7Z53Nw7blYFEl1MR+l+1n@lists.linux.dev
X-Gm-Message-State: AOJu0YxLRR189SqACeDis5yZxM1G4EvUQouAzJjXY8ttZyqtmEEoRRE2
	A9o++blreR4/oXnLRq2eHmNS7FMb7Ct8jJFP44Kt6MYYC3fYH4j7dwI9rYI6+j08+YHvxbwTvGC
	YeHeatPVc8bKSdSk4dXCN0pRydW+gaUp+Z8nd+cRI
X-Gm-Gg: ASbGnct3M9Zegz4OS9gbluqECAr5t2pLY3aVm/gVnwdOkJUDMnHK+CCsQZm9YhiFBCD
	+YlJ0WK8N4i+lmyrITzboJeg7PIVanghguejfLpvJqCV/+nfA2xOura9K8yLS4f1MZvUhryFjCt
	pytj1NlPp7zihfgy1YzjArUOzo8WXiwq9XdbG8YbheM8U+0GXHSurk7+/EYppOZTxdKCQlZuIha
	92Xob6r+KCfZM0MCHiKX+svJa2RWWlRp8Z/5Oh/nzFDy+xYv5Y=
X-Google-Smtp-Source: AGHT+IFjR7/59bLXqdMG45ijfjBsstuaKV8l0fouiyv83xrRxHek1RFBXQoId5l45vd44AddM38xuhfanRjJ9FBxe/c=
X-Received: by 2002:a17:903:3c65:b0:22e:1858:fc25 with SMTP id
 d9443c01a7336-242fedd3b9amr1268105ad.9.1754965899018; Mon, 11 Aug 2025
 19:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
 <d432b8b7cfc413001c743805787990fe0860e780.camel@intel.com>
 <sjhioktjzegjmyuaisde7ui7lsrhnolx6yjmikhhwlxxfba5bh@ss6igliiimas>
 <c2a62badf190717a251d269a6905872b01e8e340.camel@intel.com> <aJqgosNUjrCfH_WN@google.com>
In-Reply-To: <aJqgosNUjrCfH_WN@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 11 Aug 2025 19:31:26 -0700
X-Gm-Features: Ac12FXwemm5QfMsHojPrie984ICUoSlUXi0okP4W4I2ic6L7UZ6Sv14sh72jT4k
Message-ID: <CAGtprH9TX4s6jQTq0YbiohXs9jyHGOFvQTZD9ph8nELhxb3tgA@mail.gmail.com>
Subject: Re: [PATCHv2 00/12] TDX: Enable Dynamic PAMT
To: Sean Christopherson <seanjc@google.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	Chao Gao <chao.gao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kai Huang <kai.huang@intel.com>, 
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 7:02=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Mon, Aug 11, 2025, Rick P Edgecombe wrote:
> > On Mon, 2025-08-11 at 07:31 +0100, kas@kernel.org wrote:
> > > > I don't see any other reason for the global spin lock, Kirill was t=
hat
> > > > it?  Did you consider also adding a lock per 2MB region, like the
> > > > refcount? Or any other granularity of lock besides global? Not sayi=
ng
> > > > global is definitely the wrong choice, but seems arbitrary if I got=
 the
> > > > above right.
> > >
> > > We have discussed this before[1]. Global locking is problematic when =
you
> > > actually hit contention. Let's not complicate things until we actuall=
y
> > > see it. I failed to demonstrate contention without huge pages. With h=
uge
> > > pages it is even more dubious that we ever see it.
> > >
> > > [1]
> > > https://lore.kernel.org/all/4bb2119a-ff6d-42b6-acf4-86d87b0e9939@inte=
l.com/
> >
> > Ah, I see.
> >
> > I just did a test of simultaneously starting 10 VMs with 16GB of ram (n=
on huge
>
> How many vCPUs?  And were the VMs actually accepting/faulting all 16GiB?
>
> There's also a noisy neighbor problem lurking.  E.g. malicious/buggy VM s=
pams
> private<=3D>shared conversions and thus interferes with PAMT allocations =
for other
> VMs.
>
> > pages) and then shutting them down. I saw 701 contentions on startup, a=
nd 53
> > more on shutdown. Total wait time 2ms. Not horrible but not theoretical=
 either.
> > But it probably wasn't much of a cacheline bouncing worse case.
>
> Isn't the SEAMCALL done while holding the spinlock?  I assume the latency=
 of the
> SEAMCALL is easily the long pole in the flow.
>
> > And I guess this is on my latest changes not this exact v2, but it shou=
ldn't
> > have changed.
> >
> > But hmm, it seems Dave's objection about maintaining the lock allocatio=
ns would
> > apply to the refcounts too? But the hotplug concerns shouldn't actually=
 be an
> > issue for TDX because they gets rejected if the allocations are not alr=
eady
> > there. So complexity of a per-2MB lock should be minimal, at least
> > incrementally. The difference seems more about memory use vs performanc=
e.
> >
> > What gives me pause is in the KVM TDX work we have really tried hard to=
 not take
> > exclusive locks in the shared MMU lock path. Admittedly that wasn't bac=
ked by
> > hard numbers.
>
> Maybe not for TDX, but we have lots and lots of hard numbers for why taki=
ng mmu_lock
> for write is problematic.  Even if TDX VMs don't exhibit the same pattern=
s *today*
> as "normal" VMs, i.e. don't suffer the same performance blips, nothing gu=
arantees
> that will always hold true.
>
> > But an enormous amount of work went into lettings KVM faults happen und=
er the
> > shared lock for normal VMs. So on one hand, yes it's premature optimiza=
tion.
> > But on the other hand, it's a maintainability concern about polluting t=
he
> > existing way things work in KVM with special TDX properties.
> >
> > I think we need to at least call out loudly that the decision was to go=
 with the
> > simplest possible solution, and the impact to KVM. I'm not sure what Se=
an's
> > opinion is, but I wouldn't want him to first learn of it when he went d=
igging
> > and found a buried global spin lock in the fault path.
>
> Heh, too late, I saw it when this was first posted.  And to be honest, my=
 initial
> reaction was very much "absolutely not" (though Rated R, not PG).  Now th=
at I've
> had time to think things through, I'm not _totally_ opposed to having a s=
pinlock
> in the page fault path, but my overall sentiment remains the same.
>
> For mmu_lock and related SPTE operations, I was super adamant about not t=
aking
> exclusive locks because based on our experience with the TDP MMU, convert=
ing flows
> from exclusive to shared is usually significantly more work than developi=
ng code
> for "shared mode" straightaway (and you note above, that wasn't trivial f=
or TDX).
> And importantly, those code paths were largely solved problems.  I.e. I d=
idn't
> want to get into a situation where TDX undid the parallelization of the T=
DP MMU,
> and then had to add it back after the fact.
>
> I think the same holds true here.  I'm not completely opposed to introduc=
ing a
> spinlock, but I want to either have a very high level of confidence that =
the lock
> won't introduce jitter/delay (I have low confidence on this front, at lea=
st in
> the proposed patches), or have super clear line of sight to making the co=
ntention
> irrelevant, without having to rip apart the code.
>
> My biggest question at this point is: why is all of this being done on-de=
mand?
> IIUC, we swung from "allocate all PAMT_4K pages upfront" to "allocate all=
 PAMT_4K
> pages at the last possible moment".  Neither of those seems ideal.
>
> E.g. for things like TDCS pages and to some extent non-leaf S-EPT pages, =
on-demand
> PAMT management seems reasonable.  But for PAMTs that are used to track g=
uest-assigned
> memory, which is the vaaast majority of PAMT memory, why not hook guest_m=
emfd?

This seems fine for 4K page backing. But when TDX VMs have huge page
backing, the vast majority of private memory memory wouldn't need PAMT
allocation for 4K granularity.

IIUC guest_memfd allocation happening at 2M granularity doesn't
necessarily translate to 2M mapping in guest EPT entries. If the DPAMT
support is to be properly utilized for huge page backings, there is a
value in not attaching PAMT allocation with guest_memfd allocation.

> I.e. setup PAMT crud when guest_memfd is populated, not when the memory i=
s mapped
> into the guest.  That way setups that cares about guest boot time can pre=
allocate
> guest_memfd in order to get the PAMT stuff out of the way.
>
> You could do the same thing by prefaulting guest memory, but TDX has limi=
tations
> there, and I see very little value in precisely reclaiming PAMT memory wh=
en a
> leaf S-EPT is zapped, i.e. when a page is converted from private=3D>share=
d.  As
> above, that's just asking for noisy neighbor issues.
>
> The complaints with static PAMT are that it required burning 0.4% of memo=
ry even
> if the host isn't actively running TDX VMs.  Burning 0.4% of the memory a=
ssigned
> to a guest, regardless of whether it's map private or shared, seems accep=
table,
> and I think would give us a lot more flexibility in avoiding locking issu=
es.
>
> Similarly, we could bind a PAMT to non-leaf S-EPT pages during mmu_topup_=
memory_caches(),
> i.e. when arch.mmu_external_spt_cache is filled.  Then there would be no =
need for
> a separate vcpu->arch.pamt_page_cache, and more work would be done outsid=
e of
> mmu_lock.  Freeing SPTs would still be done under mmu_lock (I think), but=
 that
> should be a much rarer operation.
>
