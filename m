Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79639192D70
	for <linux-coco@lists.linux.dev>; Tue, 21 Jan 2025 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737478327; cv=none; b=C9lgOBYDTHPd7VDep77lAQAMfDtUdysKU/ngZnH+19lUVYbb8HIBMDTGNjQHxBqqlCWDzoG1TSgi8NcAV/F4pVc50trTkuORqfcXzbFaXZZ4G0Ujs+8Wc6tu9jW+yA6f55sC9F7C4YB9oWIvHMO4i9ZNsWrXrRWHzIa1g1k0AIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737478327; c=relaxed/simple;
	bh=Cfq7dOuH8IKxACGY1ONgtep+oYU2dAXFSEktjpolXKQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LbBcLhGPyhmH7KbU+SVBRvSLt3Qe1pb7Y2Bb1K+/mfGMk15nRERyyjvh/N8vcVKWO73wilyUt0bLYEM3w61RRQfdDa4YH1UoW7jLJkGB8x6yFy18Ps6iSBuUx/fm7J+infV7bgoKV1EJ4zHePhq3+hZ52vp3ae5B/Ptjb9veLDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J+ipdnxq; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J+ipdnxq"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2eebfd6d065so15951639a91.3
        for <linux-coco@lists.linux.dev>; Tue, 21 Jan 2025 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737478325; x=1738083125; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vanCL9vX2YGo3j10SsliegdRcGeoN0tzUbAnVNu00e4=;
        b=J+ipdnxqfXEhVbO/hub10Nm4ayDD3eQgKfuJV9SJO7fUNlt9DLxlEVb9i9WzTskPsO
         8i5PUkyAUDJf7nVv11Vw/GAp5m3W/v2uxMIxWFeXVlhef2AqRo4khEgxE+Qtt3rf3D9O
         Ei6k9BIVOvWL3KJDTZ0K+LkreyMGBJcaKcboWnkDCAzvAIiHBmKldGA5nGn43GCVwj+/
         dxF4EbJKLd9T4gkJWKYop16tK1lqkLWhYYzXGk31UxeL/8aYJD3m6O51tBPfbh97wtbF
         Eut+d/xUEIJP3tu5W7k5F3cKFVnwPaaVPKutegfYu2PmKlNV7ehS4I8GkZHQPGf4YTzG
         /q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737478325; x=1738083125;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vanCL9vX2YGo3j10SsliegdRcGeoN0tzUbAnVNu00e4=;
        b=wkbldGluOwIlw8Lzln/5JoBeVOUDb45vZNi0AtPMqKknQQtEa4pWa31Ytxy5VudSVm
         Y3jPwjJTEo5DtGGhxJxtt/fUsqY8P7BD0Ue3ZPRDY/Wl4BSjyAm7xpsDo2F8CLHD+/z1
         DEX3scbEVLfQt/f5mUPAmnipII+SOT7k93kNI77Qe/Izcg1Z+ajKlLwZP/TlHkQ4mAmD
         ErtMvKqbOFya3ZSzU4Ftimh+UYOaW/BiMkaTzdzWo5S9H7FbuCryBIG3UksVLR/pQheb
         goTxNE56jL3ljcmpM6M736dy8Km+t4be0Ppcw8n0gjJD3bN6fhDDaFR5U6DzGNucMFn8
         ejvw==
X-Forwarded-Encrypted: i=1; AJvYcCXH6fzuWw15RXxwKVANIRB2zh23Uv2HlyxC1eP3XWIHNt+OKWvJN1gBGG+cEzqUhkn1PFU3JWmV5IXv@lists.linux.dev
X-Gm-Message-State: AOJu0YxLwOv5yOMZXvUQ293JU5KpNHYGVVs0LLkQoFT2JgwWEW/ZLLR0
	Cnqu2vGlQw+Uo0JneE2T7LHvxj66A9ojDzCrOhtLd/grfR0YX5skdguItCaDiCiiu+thjaZ8xIc
	m0w==
X-Google-Smtp-Source: AGHT+IHXgQjtXQTO+sAFYluyyMRqgYC+WSGpYCWP3vvuJUdftImnUJ8vLEZRgcWJPE48b1Om4zLopDGykcw=
X-Received: from pjbcv6.prod.google.com ([2002:a17:90a:fd06:b0:2ea:29de:af10])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a41:b0:2ea:4c8d:c7a2
 with SMTP id 98e67ed59e1d1-2f782d4ed35mr28239094a91.24.1737478324838; Tue, 21
 Jan 2025 08:52:04 -0800 (PST)
Date: Tue, 21 Jan 2025 08:52:03 -0800
In-Reply-To: <CAAH4kHZL-9R+MLLvArcwQ2Zpk+gtqYTvVMR01WA1kVJ9goq_sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250120215818.522175-1-huibo.wang@amd.com> <20250120215818.522175-2-huibo.wang@amd.com>
 <CAAH4kHZL-9R+MLLvArcwQ2Zpk+gtqYTvVMR01WA1kVJ9goq_sw@mail.gmail.com>
Message-ID: <Z4_Qs2mAXK28IwJa@google.com>
Subject: Re: [PATCH v4 1/1] KVM: Introduce KVM_EXIT_SNP_REQ_CERTS for SNP certificate-fetching
From: Sean Christopherson <seanjc@google.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Melody Wang <huibo.wang@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, roedel@suse.de, 
	Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	pankaj.gupta@amd.com, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025, Dionna Amalie Glaze wrote:
> On Mon, Jan 20, 2025 at 1:58=E2=80=AFPM Melody Wang <huibo.wang@amd.com> =
wrote:
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index 943bd074a5d3..4896c34ed318 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -4064,6 +4064,30 @@ static int snp_handle_guest_req(struct vcpu_svm =
*svm, gpa_t req_gpa, gpa_t resp_
> >         return ret;
> >  }
> >
> > +static int snp_complete_req_certs(struct kvm_vcpu *vcpu)
> > +{
> > +       struct vcpu_svm *svm =3D to_svm(vcpu);
> > +       struct vmcb_control_area *control =3D &svm->vmcb->control;
> > +
> > +       if (vcpu->run->snp_req_certs.ret) {
> > +               if (vcpu->run->snp_req_certs.ret =3D=3D ENOSPC) {
> > +                       vcpu->arch.regs[VCPU_REGS_RBX] =3D vcpu->run->s=
np_req_certs.npages;
> > +                       ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
> > +                                               SNP_GUEST_ERR(SNP_GUEST=
_VMM_ERR_INVALID_LEN, 0));
> > +               } else if (vcpu->run->snp_req_certs.ret =3D=3D EAGAIN) =
{
> > +                       ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
> > +                                               SNP_GUEST_ERR(SNP_GUEST=
_VMM_ERR_BUSY, 0));
>=20
> Discussion, not a change request: given that my proposed patch [1] to
> add rate-limiting for guest messages to the PSP generally was
> rejected,

For the record, it wasn't rejected outright.  I pointed out flaws in the pr=
oposed
behavior[*], and AFAICT no one ever responded.  If I fully reject something=
, I
promise I will make it abundantly clear :-)

[*] https://lore.kernel.org/all/Y8rEFpbMV58yJIKy@google.com

> do we think it'd be proper to add a KVM_EXIT_SNP_REQ_MSG or
> some such for the VMM to decide if the guest should have access to the
> globally shared resource (PSP) via EAGAIN or 0?

Can you elaborate?  I don't quite understand what you're suggesting.

> [1] https://patchwork.kernel.org/project/kvm/cover/20230119213426.379312-=
1-dionnaglaze@google.com/
>=20
> > +               } else {
> > +                       ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
> > +                                               SNP_GUEST_ERR(SNP_GUEST=
_VMM_ERR_GENERIC, 0));
> > +               }
> > +
> > +               return 1; /* resume guest */
> > +       }
> > +
> > +       return snp_handle_guest_req(svm, control->exit_info_1, control-=
>exit_info_2);
> > +}
