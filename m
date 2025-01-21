Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A0C1F3D38
	for <linux-coco@lists.linux.dev>; Tue, 21 Jan 2025 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737479963; cv=none; b=Gi+CgCkadymF4KUVr661qaaGohwGbssro9x605x9iRw8+cMj8iemYB61ud23W7o+tF/GA7ajxBh9uhRff5vofVflX3cpTpdssS7IcGuGQgwc2rZz1vw6ovNZrmbl3nJZEujOrWRpJmR8t9zj0xEoxRTcRR7Z9DwF12jUCbrWCEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737479963; c=relaxed/simple;
	bh=u2B1225CIVkWnANI8zdzZEVtAbUKglhh/qPVN3HdLJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stuDuUl+KsfxFVRQAY6nU2N1Ly1ESf7FzTvSBzpBBColxICRiFMC2c52rJRBtv7o7QUtCY+tuJy98LyYxwnxBkaYtjP2NHLvhZ0dZclY5godcUZuRZ5ssISoI4cSRq7mOoNq6YKjaAXkIQoJGMWaonJGfy1oNrsGqqva+opV/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eWI/mwpA; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eWI/mwpA"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa66c1345caso273548266b.3
        for <linux-coco@lists.linux.dev>; Tue, 21 Jan 2025 09:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737479960; x=1738084760; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvT0wHqFgmeFSd1d/5qNXkmKtyfl0fos/htQQVE14io=;
        b=eWI/mwpA3EeZJU0cNRWdbKX7XohehbZFKDFITs+VpOoYYm5qYF+X87YEbWbkm5rgzp
         dUP7ZLilNUISRtkE2lXl9ZXdF9yxcVkloGeti7B1k8O1WowG0vAC1/kqwu8VZGi2fquy
         go3yn0PAyrA6odAzuU1Bkz6JkGPOGPkrEDWiRBveli+DEwgxOkYhQoLCp5VcL1ajoeH6
         /QEGCIDFR1aGnR8FASKN/KYytYjMlr7DQodUit3kCwRO/TfgVI2gsiZbMlJ5KziB4CPf
         0Yqo7pZb1oD2rD8+IpRvD3E3tBSWhphwaxXHXCVI7rSA0a2hk8+UTOriptQJrbSjl7Dl
         T7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737479960; x=1738084760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvT0wHqFgmeFSd1d/5qNXkmKtyfl0fos/htQQVE14io=;
        b=QzlVbS8ryF8GlGVoSIYyBmNIu0yu+e3PiRtD4dpzaUVTx6fWJ+oiB8xDCTzV+0BdHW
         d9kROkv68LY26AvHAVw5freCC2xl9jKgsdL6fHSq4smiCX/2LJ4ScK5uiZ0ofRm67WtE
         4fI9GPqMwP7gv+yZBtXX83pXPklr92Qb+XktBZ0MlGLKX1l67U7/QzP0r2S9yHplAfUK
         7Biq+VC3B+QXhKzIRY4BsN1BDQL4ozIii1B8S/KQMsih9xe4MsLOXwre763JfbTh1/3P
         ush5Keq7v9kjSafnQRNSSfCHlUjMBT4Vzms7WZRtT1bV9/1DeDE+t66Cv+wJZkkSbCd+
         L0HA==
X-Forwarded-Encrypted: i=1; AJvYcCWy4gq77wiSYHshYAtXIuvNrAFrYh1/tlGo7YnjfFIipbD0ZVFOFVqX6UVRoHSYKNls0d9fMwdOpucG@lists.linux.dev
X-Gm-Message-State: AOJu0YyXmEcUVlZg17L2zaW4jUIW8p5z79MUK1hI42+IT8yw3L45MXX4
	wBmZRqCluXHhauPOHpAedv24tyJvmIMe3VHHdV2nkilwkRFqtVIhbJ9gmKAx22y9CS3QgsLegpG
	tmeswc8QeOnLmUauKcIxAuc1m4HOGAY+RGDts
X-Gm-Gg: ASbGncvsuMxhZLd3RnMBJz8Ec5CvqCdR9TkAmUwqNt4VN8q307gQ0MfDnWFEfpGfw2y
	yicdiIaYda2pg+cAGQCIVX8xnBrdKYzzea88TD7sy6mkcwDTukiM=
X-Google-Smtp-Source: AGHT+IE2T563g0JRgyplghpBnxGXwll27PI7aZixKOdxjYYjAIR13bi252uUwK2w3uc597ZsGhAye1+zlmOPNSiYhDA=
X-Received: by 2002:a17:907:7b88:b0:ab3:61f5:13c7 with SMTP id
 a640c23a62f3a-ab38b4c9b89mr1575632966b.53.1737479959745; Tue, 21 Jan 2025
 09:19:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120215818.522175-1-huibo.wang@amd.com> <20250120215818.522175-2-huibo.wang@amd.com>
 <CAAH4kHZL-9R+MLLvArcwQ2Zpk+gtqYTvVMR01WA1kVJ9goq_sw@mail.gmail.com> <Z4_Qs2mAXK28IwJa@google.com>
In-Reply-To: <Z4_Qs2mAXK28IwJa@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 21 Jan 2025 09:19:08 -0800
X-Gm-Features: AbW1kvaIHOhJ15ezHtXOpMLPtWwxrO6MYTW0Y72uan59Mj6uqWnxbb2NWaU7SY0
Message-ID: <CAAH4kHaCTGxQ_D+KbhJQ+RYL4n5qeG4UnDNu5FK9+3KJLpNw0Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] KVM: Introduce KVM_EXIT_SNP_REQ_CERTS for SNP certificate-fetching
To: Sean Christopherson <seanjc@google.com>
Cc: Melody Wang <huibo.wang@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, roedel@suse.de, 
	Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	pankaj.gupta@amd.com, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 8:52=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Jan 21, 2025, Dionna Amalie Glaze wrote:
> > On Mon, Jan 20, 2025 at 1:58=E2=80=AFPM Melody Wang <huibo.wang@amd.com=
> wrote:
> > > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > > index 943bd074a5d3..4896c34ed318 100644
> > > --- a/arch/x86/kvm/svm/sev.c
> > > +++ b/arch/x86/kvm/svm/sev.c
> > > @@ -4064,6 +4064,30 @@ static int snp_handle_guest_req(struct vcpu_sv=
m *svm, gpa_t req_gpa, gpa_t resp_
> > >         return ret;
> > >  }
> > >
> > > +static int snp_complete_req_certs(struct kvm_vcpu *vcpu)
> > > +{
> > > +       struct vcpu_svm *svm =3D to_svm(vcpu);
> > > +       struct vmcb_control_area *control =3D &svm->vmcb->control;
> > > +
> > > +       if (vcpu->run->snp_req_certs.ret) {
> > > +               if (vcpu->run->snp_req_certs.ret =3D=3D ENOSPC) {
> > > +                       vcpu->arch.regs[VCPU_REGS_RBX] =3D vcpu->run-=
>snp_req_certs.npages;
> > > +                       ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
> > > +                                               SNP_GUEST_ERR(SNP_GUE=
ST_VMM_ERR_INVALID_LEN, 0));
> > > +               } else if (vcpu->run->snp_req_certs.ret =3D=3D EAGAIN=
) {
> > > +                       ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
> > > +                                               SNP_GUEST_ERR(SNP_GUE=
ST_VMM_ERR_BUSY, 0));
> >
> > Discussion, not a change request: given that my proposed patch [1] to
> > add rate-limiting for guest messages to the PSP generally was
> > rejected,
>
> For the record, it wasn't rejected outright.  I pointed out flaws in the =
proposed
> behavior[*], and AFAICT no one ever responded.  If I fully reject somethi=
ng, I
> promise I will make it abundantly clear :-)
>

Okay, well it was a no to the implementation strategy I had chosen and
did not have bandwidth to change. Your suggestion to exit to userspace
is more aligned with the topic of discussion now.

> [*] https://lore.kernel.org/all/Y8rEFpbMV58yJIKy@google.com
>
> > do we think it'd be proper to add a KVM_EXIT_SNP_REQ_MSG or
> > some such for the VMM to decide if the guest should have access to the
> > globally shared resource (PSP) via EAGAIN or 0?
>
> Can you elaborate?  I don't quite understand what you're suggesting.
>

I just mean that instead of only exiting to the VMM on an extended
guest request and this capability enabled, all guest requests exit to
the VMM to make the decision to permit access to the device. EAGAIN
means busy, try again later, and 0 means permit the request. That
allows for implementation-specific throttling policies to be
implemented.

> > [1] https://patchwork.kernel.org/project/kvm/cover/20230119213426.37931=
2-1-dionnaglaze@google.com/
> >
> > > +               } else {
> > > +                       ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
> > > +                                               SNP_GUEST_ERR(SNP_GUE=
ST_VMM_ERR_GENERIC, 0));
> > > +               }
> > > +
> > > +               return 1; /* resume guest */
> > > +       }
> > > +
> > > +       return snp_handle_guest_req(svm, control->exit_info_1, contro=
l->exit_info_2);
> > > +}



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
