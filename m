Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B72B4FECC8
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 18:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016781; cv=none; b=FacKkv+c3GzmIWzkTZWbqdHT2Qc8KM+802asjN6BcbmDgQLesXv6eQAFLTYzX0AhkFvAn0CrwgAtEJdO6TKiqtcsf307qnARnxeOvF83tNvk5ijfwaNT400olO15I+BbyAccC5UErWfBrwD4iBTpSiCxh9tm+zn8D5CifaWd+E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016781; c=relaxed/simple;
	bh=JGvsE3qprxPos+efsPkq/3seFxa9aaaj4N7CPfDha88=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A5CdV+IKyFH/PKo4CihZ+YNV64t9UcfuOIt3vPX+TO1VB1fShvepYQW7whotfJe/XtXCYr7WIU3Lnv9ot0eGwN1pKnKRqkHclapX9k1/BeBGOpNvWR9kl6vSLHi0yPans9Z+J7+glaQrbmpMJJZW4REY2Ng5rbcMNmPXANHZYKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYD1WQOs; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYD1WQOs"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-854f274dd69so3399556b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790016779; x=1790621579; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/5YTcsXPaj8qnFsGtVLuToOw955UXBQDL4CSdNlovXI=;
        b=bYD1WQOsDsYuO1qMSHxjCHADcecrTt7zeeh+a0R+EB8ll5YRRHSaX9W/us0bUCQyc3
         5PgeV2Bl4j8n28sSoh39hW8BA776q5E8EN5DGmbo3CWhSmHGKbYeWu+lbBrUiEWva3fJ
         Nz+FAm2QxgxpwVXdyJmCnM/uo0Kmh/L2BXggj/w7ctUg3N1SsuhJrAYJFKnnsgiTYbYz
         UQs+oaWWGzmg6GqctvaysIhKiTSt4zv4t9+wOOIleIHCl/lSELifIS01pQo9N3f9e29p
         elYnH+lF21BHBUccYbRB8qIEOxb3rKRzZ5yxFnSmC0jMJcYbGDqF+90r9met4L2iyX3k
         7TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790016779; x=1790621579;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5YTcsXPaj8qnFsGtVLuToOw955UXBQDL4CSdNlovXI=;
        b=yrRsNUJeNG8Jo4HsGSM6RpS/LbtcxiblxGZCSpacX/SIqolTpnQyA/WcOpC1y2Yglz
         5f14nYF+G7Chrn263n9pt38GD5hh5Yek2PLjXZjq1JPgYAflwZoUFCSLwqkTnHeiMnSm
         A0Nh5Qi0neC9V2iEvTXik1tnjXR3XWD+ixCI6sT0Pwaq3TFXic81iilUq4yeKMltID9R
         np9aJBHhM1BSH9sBzGG/mLX8bOw6J5E+mpPuzA3e7nnjDlSpL0y7i3OrhL0PD0sSPcuh
         xnO6n8OU0QdBaFXxe5G4+IT4OziexWsDKU4YameDGmmfY3JzJunFGXdoREvObewMXufw
         Rw2g==
X-Forwarded-Encrypted: i=1; AKwUvBwv8/3c7MOttE3DjvExZ+dDbh7bg2rIJZbg0e94g/JZQ1hSwk6MOFNDXQ9Q1JdK747w3Ys/Lpzegc3I@lists.linux.dev
X-Gm-Message-State: AFuF++mCpuOy/EhCYzUUBGKr3KRt5desVQwOU0OGScIPo95DG+jz/k7o
	VgpZndMb2Dr+l/nQ8XMdbWrJWppsUakwifqDFV1Z5WXH5aJdt6SrvUej4EJV7nKPoe+MN7pCLRa
	fonwUHQ==
X-Received: from pfcs23.prod.google.com ([2002:a05:6a00:6fd7:b0:87a:f5a1:c5c0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14cd:b0:872:fd1:7c22
 with SMTP id d2e1a72fcca58-874ddd05bf4mr16110399b3a.16.1790016778532; Mon, 21
 Sep 2026 11:52:58 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:52:57 -0700
In-Reply-To: <CAJxe5csCb0DHZmJo9a-asXZ-tYdcyK1y0Y4Y9Uoixqn=sa8zRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
 <0b2d8858-b361-4a64-986a-4c179210fbec@amd.com> <aqlWt4jb4CSPnecN@google.com>
 <d6179d34-a4b0-4548-8298-b790b333d22f@amd.com> <CAJxe5ctcVxmhRSw3Gt0POQTzRKoxXo7+Y3CPDe7cUZvC0QPK+g@mail.gmail.com>
 <aqrhFvwFJsQTaEkz@google.com> <CAJxe5csCb0DHZmJo9a-asXZ-tYdcyK1y0Y4Y9Uoixqn=sa8zRQ@mail.gmail.com>
Message-ID: <arF9CXWC_UDYUMmf@google.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
From: Sean Christopherson <seanjc@google.com>
To: Jacky Li <jackyli@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026, Jacky Li wrote:
> On Wed, Sep 16, 2026 at 11:34=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > The problem is, I don't see how the guest can know when it needs to dis=
card the
> > VMPCK (post-request failures) versus when the VMPCK is still "fine" (pr=
e-request
> > errors).
> >
> > FWIW, I'm not terribly concerned about bleeding host issues into the gu=
est, I'm
> > more concerned about ending up with deferred fatalities and a mess of a=
n "ABI"
> > between the guest and KVM with respect to handling failures.
> >
> > What if we "tickle" the resp_gpa before doing the request?  Similar to =
how CPUs
> > probe bytes early in XSAVE/XRSTOR to avoid having to unwind later on.  =
In this
> > case, the response is restricted to a single page, so we only need to t=
ickle a
> > single byte.  E.g.
> >
>=20
> Agree. I see your points and why this tickle idea is a great solution.
> Actually, building on that idea, what do you think about using
> kvm_vcpu_map() in the exact place that you did
> kvm_write_guest(kvm, resp_gpa, &tickle, sizeof(tickle)) instead (and
> unmapping afterwards)? A few reasons:
>=20
> 1. Like kvm_write_guest(), kvm_vcpu_map() also checks the existence and
>    writability of the memslot via __gfn_to_hva_many(..., write=3Dtrue) an=
d
>    faults in the host page as writable, plus it pins the page across the
>    firmware command.
>=20
> 2. kvm_vcpu_map() has cleaner semantics of acquiring and holding the
>    guest response page in KVM until the response is delivered, rather
>    than doing a dummy write to test the waters. This is somewhat
>    consistent with the GHCB page itself, which stays mapped until the
>    response is filled in.

No, kvm_vcpu_map() actually has far worse semantics.  GUP pins the *page*, =
it does
not pin the userspace mapping.  I.e. kvm_vcpu_map() guarantees that KVM won=
't write
to a freed page, but that's literally it.  E.g. if userspace mprotect()'s t=
he page
to make it read-only, KVM will write to what is supposed to be a RO page.  =
Or if
userspace completely unmaps the page, KVM will write to soon-to-be-freed me=
mory.

We're actively trying to remove kvm_vcpu_map() to replace all usage with
"struct gfn_to_pfn_cache" APIs, as the gpc functionally is tied into mmu_no=
tifiers,
i.e. guards against things like mprotect(), munmap(), etc.

So if we wanted to do something other than a uaccess, a gpc would be the wa=
y to
go.  But I'm not convinced that's the right choice here.  There is zero dan=
ger to
the host beyond what already exists with private memory in general.  I.e. i=
f
guest_memfd leaves a dangling userspace mapping, then the host is hosed reg=
ardless
of what this code does.  Using a gpc could guarantee the write goes through=
 or
fails early, but IMO that's not worth the extra complexity involved with us=
ing a
gpc, because I'm not convinced that continuing on is the best outcome if th=
e
response GPA mapping is being concurrently modified.

> 3. Pinning the page prevents a malicious guest from converting resp_gpa
>    to private between the pre-check and kvm_write_guest() after the
>    guest_memfd in-place conversion patch series [1] is merged.=20

Who cares?  The guest can only hurt itself by converting resp_gpa to privat=
e.

>    (This assumes a future guest_memfd implementation, so it's less convin=
cing
>    than the first two points. This was also my original TOCTOU concern.  =
And
>    once we have either pre-check, on upstream today the guest has no way =
to
>    change the memslot state before kvm_write_guest(), so I'll also drop t=
he
>    original TOCTOU commit message.)
>=20
> [1] https://lore.kernel.org/lkml/20260830-gmem-inplace-conversion-v12-15-=
85e5fd25252a@google.com/
