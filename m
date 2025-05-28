Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1114428E572
	for <linux-coco@lists.linux.dev>; Wed, 28 May 2025 18:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456741; cv=none; b=j38tbC2yhrJ7B49RJrN9Gx/bjfovm3bm5G+RLTUksRRLHkvgSW5+0PTSm0iggjxhFnjGnUP2rEOkwHtwaQRhq59TFsGfl3n4R0Q8CmK+pE45kaBbISr9a5iO/66G9pfOZrxGWkzahFxs+StQb0APQLM4uLH+3ATdZcCUnTrz9dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456741; c=relaxed/simple;
	bh=TrwTeeb3eSq6peBGpyS2fjLOHTgsDFfooNNEDI35gec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQ6b+Yyhx9XUkmMKInlBlcyQfAPtz1BUNMMak5Q85VsdBe0kMYUkOmJGtaeYH2YKsiPtCWWK0P2DOvNYXm68PAhisfHoP5YUrdHEIAuPXD2ZwJwe4ev8enKaSeOjyPWtW24UDuSQTUPj98KB3uOobQu4/TOEPwMVicoL4lDZsRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=25sAQPeR; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="25sAQPeR"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3109f106867so70933a91.1
        for <linux-coco@lists.linux.dev>; Wed, 28 May 2025 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748456737; x=1749061537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVVqFr1BE8q6eml8zA1z0lK7aGNcSUfClXnZn98OgHk=;
        b=25sAQPeRdUo0wp2knkFd7xgjii6ZIfyQZmwAnthB6eu5WQCSXjlWOPKZo6qq5Px2V7
         NaqaS17c1yEHsUo+C8c9MZOywk177QwqiRWNSzSs5dybOTBS16F+DJHWaCloz1fbkgV4
         i2nG/7u0gnZuAHfujpy/9ZaS1iRQ/69CVyUxiIbpKnhwAF8w5jgEQJux129kWA0oIyYb
         J4DaGHk3+Aoo4ydVJqYHeSzxoXykaZQOMa0yRTE50kclMKmR/KFxAe7q/Mcrl8OOCQLz
         33LY18YdI7QWLL74D9X+DBwfC1492vMcQvcjMhj2J6Njp9qNV2N35Dhpo2fi7DhV9Cbd
         fUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456737; x=1749061537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVVqFr1BE8q6eml8zA1z0lK7aGNcSUfClXnZn98OgHk=;
        b=ho+7GuoGoCHU5qn7Deu8d5W9P5sUW2pXwTvca+ic4dsLN45ioTX+aLWgeDYLWn03KE
         3oTVJ1DgboHl/8D7+e1F+rYOo7uNeYyXdulCzj+cuuoPkvkxfUzyZtbaZmwkae9Nd+WW
         iNejRrfMblSI7yRIPSHci3vG1RY+zlPyAzEHVbSy6Sao4VXUbXZH6O4tVgF79FYy420W
         KcF2OZwKaqK1CEhFoJxLMOSc6OLdVvaaXaAXvEzTITWOV/HTWAvxeq3GhHLC+YKgDarW
         TTfM+Rq4YJy/3HVLke30xwyodDqPSqgyPRoJGaUFyJsTQ1H6K3JDYpUvNScB19WmFkRN
         kA1g==
X-Forwarded-Encrypted: i=1; AJvYcCW4Ej0rlxmJrIGQPr0KJyn5e4fHJcE/dFC947W7ZhtQB2vaJZ0GvyE0cAKuVGJh8ChrlftXozCQMN2S@lists.linux.dev
X-Gm-Message-State: AOJu0YxNDgtFL06H5ztlQl7ivH0q5jKB+6OxZtAgzHyTQDYAfsNh8QPX
	6ZNfJiCulcVq1Ffms7AAkAZ/hv4tr/XJN2GH63EBfjuYAjsZDD2plW65JOfmIoOOGAm79K3sSbO
	r+DWkmr3/Gm88X7mlCqYX29Ek53lXc74GDFHlYzOv
X-Gm-Gg: ASbGncvbvOjLGW6YhteCM38ZWGNnnOzRrxMwfSsrK1alE38+vfNEmO2TzlhkmbeIvCh
	rcnC75jL8DoD/TWMvKLRWBSBW3IQxKiWNGtNXwtDNESdLHLjvcgVPUGchKcH4jYG7cWy5AbYWuq
	RHFoDNAPFKu+555Ut2YIY9fHgiSGFzFjJG/sOp30cB3LY/nNwHwKqBCDAg9/Hp7FxNea8qH6kwE
	A==
X-Google-Smtp-Source: AGHT+IFijwOh+awYdgO4HAk/X8m/A4OWZUBHS7nOP52Vw8xKVE09sTMEC6FE21p5hEzwxtb4ty4X3loZKiHFU1jBNbA=
X-Received: by 2002:a17:90b:3852:b0:30e:8c5d:8ed with SMTP id
 98e67ed59e1d1-3110f31a4fbmr26532549a91.19.1748456737021; Wed, 28 May 2025
 11:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250515220400.1096945-1-dionnaglaze@google.com>
 <20250515220400.1096945-2-dionnaglaze@google.com> <aCZtdN0LhkRqm1Vn@google.com>
 <CAAH4kHai8JStj+=HUiPVxbH9P79GorviG2GykEP7jQ=NB2MbUQ@mail.gmail.com> <aC4ZJyRPpX6eLKsC@google.com>
In-Reply-To: <aC4ZJyRPpX6eLKsC@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 28 May 2025 11:25:23 -0700
X-Gm-Features: AX0GCFte05v61MvXwGYneIeTEvRS5b_Es3A7BflZae2g4_6rbG1Vveaf5-F60xY
Message-ID: <CAAH4kHZkuD4UsXRGED6qecfAkeFpd8sLc+0osDhnKP4T5VmSYQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kvm: sev: Add SEV-SNP guest request throttling
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 11:19=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Fri, May 16, 2025, Dionna Amalie Glaze wrote:
> > > > @@ -4015,6 +4042,12 @@ static int snp_handle_guest_req(struct vcpu_=
svm *svm, gpa_t req_gpa, gpa_t resp_
> > > >
> > > >       mutex_lock(&sev->guest_req_mutex);
> > > >
> > > > +     if (!__ratelimit(&sev->snp_guest_msg_rs)) {
> > > > +             svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VM=
M_ERR_BUSY, 0));
> > > > +             ret =3D 1;
> > > > +             goto out_unlock;
> > >
> > > Can you (or anyone) explain what a well-behaved guest will do in in r=
esponse to
> > > BUSY?  And/or explain why KVM injecting an error into the guest is be=
tter than
> > > exiting to userspace.
> >
> > Ah, I missed this question. The guest is meant to back off and try agai=
n
> > after waiting a bit.  This is the behavior added in
> > https://lore.kernel.org/all/20230214164638.1189804-2-dionnaglaze@google=
.com/
>
> Nice, it's already landed and considered legal VMM behavior.
>
> > If KVM returns to userspace with an exit type that the guest request wa=
s
> > throttled, then what is user space supposed to do with that?
>
> The userspace exit doesn't have to notify userspace that the guest was th=
rottled,
> e.g. KVM could exit on _every_ request and let userspace do its own throt=
tling.
>
> I have no idea whether or not that's sane/useful, which is why I'm asking=
.  The
> cover letter, changelog, and documentation are all painfully sparse with =
respect
> to explaining why *this* uAPI is the right uAPI.
>
> > It could wait a bit before trying KVM_RUN again, but with the enlighten=
ed
> > method, the guest could at least work on other kernel tasks while it wa=
its
> > for its turn to get an attestation report.
>
> Nothing prevents KVM from providing userspace a way to communicate VMM_ER=
R_BUSY,
> e.g. as done for KVM_EXIT_SNP_REQ_CERTS:
>
> https://lore.kernel.org/all/20250428195113.392303-2-michael.roth@amd.com
>
> > Perhaps this is me not understanding the preferred KVM way of doing thi=
ngs.
>
> The only real preference at play is to not end up with uAPI and ABI that =
doesn't
> fit "everyone's" needs.  It's impossible to fully future-proof KVM's ABI,=
 but we
> can at least perform due diligence to ensure we didn't simply pick the th=
e path
> of least resistance.
>
> The bar gets lowered a tiny bit if we go with a module param (which I thi=
nk we
> should do), but I'd still like an explanation of why a fairly simple rate=
limiting
> mechanism is the best overall approach.

Before I send out a revised patchset with changed commit text, what do
you think about the following

    The AMD-SP is a precious resource that doesn't have a scheduler other
    than a mutex lock queue. To avoid customers from causing a DoS, a
    kernel module parameter for rate limiting guest requests is added.
[Addition:]
    The kernel module parameter is a lower bound kernel-imposed rate limit
    for any SEV-SNP VM-initiated guest request. This does not preclude the
    addition of a new KVM exit type for SEV-SNP guest requests for
    userspace to impose any additional throttling logic. The default value =
of
    0 maintains the previous behavior that there is no imposed rate limit o=
n
    guest requests.


We could still ask Michael to change KVM_EXIT_SNP_REQ_CERTS  to
KVM_EXIT_SNP_GUEST_REQ
and for the exit structure to include msg_type as well as the
gfn+npages when the kind is an extended request for an attestation
report so that we don't need to have two exit types.

Regardless of that change for additional throttling opportunities, I
think the system-wide imposed lower bound is important for quelling
noisy neighbors to some degree.


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
