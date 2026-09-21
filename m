Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6AB4F649C
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014627; cv=pass; b=iiACFpzOkbRLteh+T6QzHUMDpwlqCs6ALJm5perT2smt3KCMh+9uFnC/TYFqMQWenfWMhOpOZh07BsuXlL1dQ7LhH0UEU/iQBhPahplGIwrDTGpuf1Z8TiyJfkhPkT+TJa8zjtulXzG1tFUVg+EhDyKRZbXfdKN7oA6PDJ18Rqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014627; c=relaxed/simple;
	bh=i8TfSstM+nFUfHowVBq661f9yHcafviHx7y2Zv6Y+6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYWHv/5nIsuWFziWdQxSkLWrV1o80538tpJTI4LMf9qOZv7oEvpc2SiQKXg1dC3cjj76K+ThoDYc1SgCCtNDqwz2CtP7c6GdaS97vEtIetNyLd0NIWS/bwUIuT3Dba8O5LBVcXZR1WHGjdsVvCI+XbefheGPRkzA8QkTeAD2bHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VT8K0Ye9; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VT8K0Ye9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so1240a12.1
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 11:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790014623; cv=none;
        d=google.com; s=arc-20260327;
        b=YwoNM/YpOD7MG0Om3kGjAO0XWJD3hE63+j5aBdYZP5QQLL/Cjd/jBNWioHxdqlgvuQ
         2YCdHjCND87EWKXty5l4NxJNI7VyHzzV1wcTjkwg+9JTsvIrPlN0RWYHnYvm9IoAfJTD
         P2I1wJnH+04/ktpJWl38OE82PGOU8MhUlPntF/j3UbHTS71GkiQPZ9DnUcYY+eF0XUxD
         OWb197Qcklu4/263KO8TGPSiBtxywfIVZyCrtMWkd6isDrg0RRemNNnxdJYq6PNIIMRB
         v2L5fF3xaP6DMXnJKETiKxxLqRoW46LGgkExTIH7QQEqSSEfyza0qzKAylD0Gnl7B2Wn
         BCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DhkO8C1Km+Np1GICbpHNNLqCS950Qr/leZl7SKXOzk4=;
        fh=HiGM8GKyhtNeShHScZ1jGBykqds6zzQnzJd1dbnc97w=;
        b=D8SIDA9K1UPJkW6aMHNyvhPSuUm+UZarXl+t9/UEQrU0/Kb9BplLykun4QBSr/jhw2
         +Q3NpzU3tEDYe17b9TRn3HNFKixyD9ZGj3LEkgbtD3ob2pHGT5zx8wOpTK34DGGTpmkz
         AvNEu6uZZSPhlAWb2Zs4Gq8cm+reEEfLcffkhlKZa8iE1Uxy8L2qz8HN9O4JCu4ZoEbE
         q64ZDe7hlZtgqtc8IKtkiENs5ECIKB2WNuiprKxnib5gK1T0GhukrPJh6lSTMqTA+K6t
         FXD7CHw/TaJkWsJZ7xF3szfSNYDtSd/aNqTX4KWBdEFfLslNuK6iwnfd7GXyVpzeXSYv
         vv+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790014623; x=1790619423; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DhkO8C1Km+Np1GICbpHNNLqCS950Qr/leZl7SKXOzk4=;
        b=VT8K0Ye9sRyzU2Eqcb+wLBzZNqeJEFO3EqtaGjNSvXNgDmLkleP4LHhz+CKCwU5gV6
         owYrKHrPfs7/nASuOX0Rs9dYimxa2HJw9Ohtd4NbudCEtcks/Bl85AI9c8SlW/qQcGeM
         YL4Kzkp+vMoNup06lGEOuMY1vtru/xyR0FcYZte0xOxaslLZ0sq8vmXPhIeEK1UtM+KQ
         jlgJf4U6bXHGraJ4K0++bU4VloYgpX8QC1mjSK+2cRl0GJ3aqDpXVgs8LYI1qah/PEKX
         qi1uTCwh+DfAkX4OHYjPLAM8a/rM5hLOrgF69USqZRI0jzLZFkLZ6K/9D4UnwcKoLM3b
         ZBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014623; x=1790619423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DhkO8C1Km+Np1GICbpHNNLqCS950Qr/leZl7SKXOzk4=;
        b=0xJXhlALCCyLN12sORl/QX/8rR9A3xoC6qlRsjgIQVtn/RW92otHWTE05lnFU5Po/Y
         pFMQFDfFH/SDoZIlZRil4dTnR76yfrXPSl3wW4P15ThTrVIV7PQUsD9ikeIu7S7LqL+N
         9ggkZRVD5sH6bmcPo0iCxdk+LqEKc44MIKi0MN5A6OWqefmwRUXuudv2rUhu6rG15ZaX
         vNLc6Xg7GiAmbbMFKzIhQSlNYNdNaA/h4y9MdlEpozDzCR0VzOiCR+cMhttQljBN7eC/
         3rfjx0MO/nzl2BKZ1oXL1vo++o4hM19xYG3jGSC2YUcvbOSZRFsxMIzd9YF4aRJicxpk
         GnrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIjQnM2bE4cei2BEPQBxkb2TevdaCzBgfm7D4G98dnbr2kMiN5mZahOgNpSPLAj/w2SCtAxJpaEetP@lists.linux.dev
X-Gm-Message-State: AFuF++nZ5rRCUYHYuRhFlzHJX9gK4qWSik4zF33Rd4oFwXCgCYlz2yQT
	MYHEXJYlu9tcMow5A+OhtPead/ZU05xxq6oMdPA3assLOrEiVEgsectPhL/XfSlw2yUyYP9rFAR
	Mn10syU9g30BkEzZ1ludiN5kgVq9s5ZL3ijGk4Sw=
X-Gm-Gg: AYBFou3cSsXSYbFR8oh4W3mOc5xX0rauigqb1iFWC/dI24rcJIFBbGIgmmXkH5azH26
	9anXNWm02KwwrZ+a7Dt7p+e1w5GUc7ugi0RdAjNYFxscOfrdtjsRSeq+BtyAiC0kRew9IWAt/Dd
	Pvv06zMNa5m4hdgUNkExSRqhMXkGCF9MOXtgy8d5Ha9IYmTFadVJvU5GwwrKOO5inqRBWRxHS3d
	b+++tz1UH8XbfMmIlunPcpcMs7UW77hMkCtdA2eDWMbiooYzJyxyMX4l6uTRxIAuPmKccMTes6u
	WtPp8rkd4vCvAlYYM9IjiaBMxOc/uU/4htnUbjBWZZ6aLDcEJyeb5lobopvdbraxAdxre79WFM2
	i9z7BjdBWD45S/9l+XzWeEA==
X-Received: by 2002:a05:6402:1042:b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6aaa0b62266mr3710a12.9.1790014622395; Mon, 21 Sep 2026 11:17:02
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
 <0b2d8858-b361-4a64-986a-4c179210fbec@amd.com> <aqlWt4jb4CSPnecN@google.com>
 <d6179d34-a4b0-4548-8298-b790b333d22f@amd.com> <CAJxe5ctcVxmhRSw3Gt0POQTzRKoxXo7+Y3CPDe7cUZvC0QPK+g@mail.gmail.com>
 <aqrhFvwFJsQTaEkz@google.com>
In-Reply-To: <aqrhFvwFJsQTaEkz@google.com>
From: Jacky Li <jackyli@google.com>
Date: Mon, 21 Sep 2026 11:16:49 -0700
X-Gm-Features: AcwNN1WyjYSX1uzNk8-9L0xtWomFK3mRNzacv9CeIaSJ0csFTNXZn02hHr10_0g
Message-ID: <CAJxe5csCb0DHZmJo9a-asXZ-tYdcyK1y0Y4Y9Uoixqn=sa8zRQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
To: Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:34=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> The problem is, I don't see how the guest can know when it needs to disca=
rd the
> VMPCK (post-request failures) versus when the VMPCK is still "fine" (pre-=
request
> errors).
>
> FWIW, I'm not terribly concerned about bleeding host issues into the gues=
t, I'm
> more concerned about ending up with deferred fatalities and a mess of an =
"ABI"
> between the guest and KVM with respect to handling failures.
>
> What if we "tickle" the resp_gpa before doing the request?  Similar to ho=
w CPUs
> probe bytes early in XSAVE/XRSTOR to avoid having to unwind later on.  In=
 this
> case, the response is restricted to a single page, so we only need to tic=
kle a
> single byte.  E.g.
>

Agree. I see your points and why this tickle idea is a great solution.
Actually, building on that idea, what do you think about using
kvm_vcpu_map() in the exact place that you did
kvm_write_guest(kvm, resp_gpa, &tickle, sizeof(tickle)) instead (and
unmapping afterwards)? A few reasons:

1. Like kvm_write_guest(), kvm_vcpu_map() also checks the existence and
   writability of the memslot via __gfn_to_hva_many(..., write=3Dtrue) and
   faults in the host page as writable, plus it pins the page across the
   firmware command.

2. kvm_vcpu_map() has cleaner semantics of acquiring and holding the
   guest response page in KVM until the response is delivered, rather
   than doing a dummy write to test the waters. This is somewhat
   consistent with the GHCB page itself, which stays mapped until the
   response is filled in.

3. Pinning the page prevents a malicious guest from converting resp_gpa
   to private between the pre-check and kvm_write_guest() after the
   guest_memfd in-place conversion patch series [1] is merged. (This
   assumes a future guest_memfd implementation, so it's less convincing
   than the first two points. This was also my original TOCTOU concern.
   And once we have either pre-check, on upstream today the guest has
   no way to change the memslot state before kvm_write_guest(), so I'll
   also drop the original TOCTOU commit message.)

[1] https://lore.kernel.org/lkml/20260830-gmem-inplace-conversion-v12-15-85=
e5fd25252a@google.com/
