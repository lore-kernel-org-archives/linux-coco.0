Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069C10957
	for <linux-coco@lists.linux.dev>; Wed,  7 Feb 2024 02:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707273822; cv=none; b=iAIC9Bs5gucKkdh/vEu5N7M9H9iN9fz+y3ZUxM5erJqSB1NEUQzIx2VpEKP8QNx02eIW7ibZCiUjpGnNSS+pp1m7t3ssypMpXDPSEA0CXBqtjQ8+KuFUrBGknN76MTQEE7ecQvhqnxp2ET5nZEbuj0DD60KwKpNCFcOK0B80X0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707273822; c=relaxed/simple;
	bh=yAc2qDg86yKSHh+BWfG2RTtPpu6Cksg1ErI8pCgZ7jE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qsz5mdFEdNH7pUxh53+O4HeUfN2TrZeefGe8BWvWtaTzbIXjNa/FeJL7YZpqIE0p5VBVCcQ0mQluE9fl9KVxSqFSG09/7b0hArFxv5SuFQ7cvPbB0+Dkc9KiJtH2Dju8WxtfvYm/ZHovHk2F5R1JU3Ionoskpi5EA42tqsIbDao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r7M9088Z; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r7M9088Z"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6b9f4a513so244038276.3
        for <linux-coco@lists.linux.dev>; Tue, 06 Feb 2024 18:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707273820; x=1707878620; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7guOO3K6cZeccVPYodTSSR3CLbTuFzc0JepOhwBqf8=;
        b=r7M9088ZHvKaYsq5sC83fk5MeAsOuvhKtibIS9tcH8xBwlE5nxD5LiaNNgDBJpo0xt
         k+a5kKSWs4EzzxWuSAtG3vtyiCHfUO5ErJViuWvlysDWhFJ8ll0rPYl6p/WjqbGibjCs
         7deIit0KATctrX6fK+Fk4m0BRQiDrGbKJSE4vFJpCbUmcbCuQdwR/xw9qM00xCKbJk4Q
         uhNsDcVnWMzQkKKpCrgo6HZeJxRIorT2c8Dj0YTPFCNC7MsyhcdYLg3lzCzaizxgxg9J
         2t2rBqf/j8s143UsTsZKH5kkOZb0o/dn31PaezFYIuDa2rb78Lz2zbm5UPVGFETP8Ah8
         Ll4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707273820; x=1707878620;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g7guOO3K6cZeccVPYodTSSR3CLbTuFzc0JepOhwBqf8=;
        b=pJ0bjfWHGhRdB5KrpD/w0nOxEEMu8mEoAtu3vBh6LqRK7MeLZKCG1gy0FFBUh+LJ3v
         7AH9q1gTwgY+zbR4KGUe7SLUe0H2LN8rKvs4HvRPQJT4x1HEXmoPjWChoEjduRkHDPvy
         xvNk/7ZtVwi1APykcGUpW9Z7KjAaJtK3e99frETEpUxLDghPoR85jCZkcwhGjLtH5zMf
         hshsvOo+4rd5hYKOfDdAWMovCKMD/SsxOc4PQDuRG5UArq3FiBKzwSEZm/oV+XI6JK7B
         UkSk/ppKPkefHlA/dnJrY71zLcf2N6vSxK1WhNi3Z8SakdEhcehVwM/AS/zxjFJoNQ0i
         3E+Q==
X-Gm-Message-State: AOJu0Yy1SyXNvIiJ1td7A/yP0lmhmycGA2mrfiD40nV4WX9bsHMICn/t
	aBq9qB2Yjm3oCS8OHpEPm98wY5Ow4AukpkAExQsjFNtDbwlMb8kdqc+Id/7Sr+TXPzvvlANWhoe
	g7w==
X-Google-Smtp-Source: AGHT+IHFKn95FP8tDKGyeHSLkuyZnMtdrnlqEFcDN45UncE4QphOeyXOIkcKI10ZFatjnFxEnz3hwTc5JAw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2485:b0:dc2:550b:a4f4 with SMTP id
 ds5-20020a056902248500b00dc2550ba4f4mr906756ybb.1.1707273820039; Tue, 06 Feb
 2024 18:43:40 -0800 (PST)
Date: Tue, 6 Feb 2024 18:43:38 -0800
In-Reply-To: <CABgObfa_PbxXdj9v7=2ZXfqQ_tJgdQTrO9NHKOQ691TSKQDY2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231230172351.574091-1-michael.roth@amd.com> <20231230172351.574091-19-michael.roth@amd.com>
 <ZZ67oJwzAsSvui5U@google.com> <20240116041457.wver7acnwthjaflr@amd.com>
 <Zb1yv67h6gkYqqv9@google.com> <CABgObfa_PbxXdj9v7=2ZXfqQ_tJgdQTrO9NHKOQ691TSKQDY2A@mail.gmail.com>
Message-ID: <ZcLuGxZ-w4fPmFxd@google.com>
Subject: Re: [PATCH v11 18/35] KVM: SEV: Add KVM_SEV_SNP_LAUNCH_UPDATE command
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, zhi.a.wang@intel.com, 
	Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 07, 2024, Paolo Bonzini wrote:
> On Fri, Feb 2, 2024 at 11:55=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > > It doesn't really matter if the attributes are set before or after
> > > KVM_SNP_LAUNCH_UPDATE, only that by the time the guest actually launc=
hes
> > > they pages get set to private so they get faulted in from gmem. We co=
uld
> > > document our expectations and enforce them here if that's preferable
> > > however. Maybe requiring KVM_SET_MEMORY_ATTRIBUTES(private) in advanc=
e
> > > would make it easier to enforce that userspace does the right thing.
> > > I'll see how that looks if there are no objections.
> >
> > Userspace owns whether a page is PRIVATE or SHARED, full stop.  If KVM =
can't
> > honor that, then we need to come up with better uAPI.
>=20
> Can you explain more verbosely what you mean?

As proposed, snp_launch_update_gfn_handler() doesn't verify the state of th=
e
gfns' attributes.  But that's a minor problem and probably not a sticking p=
oint.

My overarching complaint is that the code is to be wildly unsafe, or at the=
 very
least brittle.  Without guest_memfd's knowledge, and without holding any lo=
cks
beyond kvm->lock, it=20

 1) checks if a pfn is shared in the RMP
 2) copies data to the page
 3) converts the page to private in the RMP
 4) does PSP stuff
 5) on failure, converts the page back to shared in RMP
 6) conditionally on failure, writes to the page via a gfn

I'm not at all confident that 1-4 isn't riddled with TOCTOU bugs, and that'=
s
before KVM gains support for intrahost migration, i.e. before KVM allows mu=
ltiple
VM instances to bind to a single guest_memfd.

But I _think_ we mostly sorted this out at PUCK.  IIRC, the plan is to have=
 guest_memfd
provide (kernel) APIs to allow arch/vendor code to initialize a guest_memfd=
 range.
That will give guest_memfd complete control over the state of a given page,=
 will
allow guest_memfd to take the appropriate locks, and if we're lucky, will b=
e reusable
by other CoCo flavors beyond SNP.

> > > > > +                  * When invalid CPUID function entries are dete=
cted, the firmware
> > > > > +                  * corrects these entries for debugging purpose=
 and leaves the
> > > > > +                  * page unencrypted so it can be provided users=
 for debugging
> > > > > +                  * and error-reporting.
> > > >
> > > > Why?  IIUC, this is basically backdooring reads/writes into guest_m=
emfd to avoid
> > > > having to add proper mmap() support.
> >
> > Yes, I am specifically complaining about writing guest memory on failur=
e, which is
> > all kinds of weird.
>=20
> It is weird but I am not sure if you are complaining about firmware
> behavior or something else.

This proposed KVM code:

+                               host_rmp_make_shared(pfns[i], PG_LEVEL_4K, =
true);
+
+                               ret =3D kvm_write_guest_page(kvm, gfn, kvad=
dr, 0, PAGE_SIZE);
+                               if (ret)
+                                       pr_err("Failed to write CPUID page =
back to userspace, ret: 0x%x\n",
+                                              ret);


I have no objection to propagating error/debug information back to userspac=
e,
but it needs to be routed through the source page (or I suppose some dedica=
ted
error page, but that seems like overkill).  Shoving the error information i=
nto
guest memory is gross.

But this should naturally go away when the requirement that the source be
covered by the same memslot also goes away.
