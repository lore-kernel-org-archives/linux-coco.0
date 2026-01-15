Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9DD200113
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 01:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768440075; cv=pass; b=Zwmwf2+mKtWr9Js7wVCkqmF7SUMwWHtnZU8bfIUVS06EZPaXRr1duY9EaNQznTa+kaiTf2A4K26Xf5XWARRNSLkdRIEf1F+N0EptTSbYcc+bt3qCdijrAVIX2uHuAmdcocA+K8jmOfQ4JwbNEfiKaipnRODFTjxDsxWDYGmg+6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768440075; c=relaxed/simple;
	bh=9Vx4Yf9QlwPgcHE+BnyuwDRF989+DVeuIOgw7vMjjwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJy+H9kasNZMNNOAlyjI6sXrl3HHtutaOActdCSutWiTPlfQthUbQ2UPKvLDvB7jZqcP3E5r1nHiXWZkCFxJIKeA5RNuNpEIsc0Heuv1LgtUBHo/MdTF1J2XM+/JuKKedjtFzlZcRbqUxVC6wPkRdvM9yk60uKfpqQOJAGM6XoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nerAAs69; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nerAAs69"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5014b5d8551so172871cf.0
        for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 17:21:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768440073; cv=none;
        d=google.com; s=arc-20240605;
        b=Klx7mG5lLimCRmg4pXVJzWAyKSRHmCzr3ji0dYsoz8xNWClzxk9nyT/45VoqxqS92F
         wnZPQ6DBePJAOIhOXjlcAg/rn2llk7uFqB/W3HKPj9GjVk+u0jOP0makWhXZjrWJiude
         rSis54tIsY+6oFgcqMop/PjqkUcgok2fguJDtP1ITfUB0s9ySm38VlgvLA9Yok0fNw6m
         ZDtAf96E7mvz4+Nh2s4tByjWYxsYdkJ7bRLd1xE1/0BU8os5BGqcyzbq8Y65vTsz+8Zb
         aM/zVfnI/PMbnOnfxeTJJ19L2oex/jGVWY7n7j0fuExg/jTgukgxO5A6r/d7oqpNnvVx
         LAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=elZ+7z9St5n4o5etqR0ku5zcMBWid3JlUNNzB3S48Ko=;
        fh=VNCVOGs1+HFoQuv2WuSBq2jXLOBz/XQHD+v/iS7MI70=;
        b=WzlDgtcN5kH9XAedCKqiXpfNeIIsxDjNH2b5guEc/BaNEqxjzXSAonm9CYQcEpT+rJ
         UFfff2/bg+F5Ih4howXGqSwc1U3S/KfcYmbHg2mQ8H8p3Lk0hFuZkR3UNeEEiBm8wT1w
         O9nmUDjXpgH5MHQGEqHyYngILTt8kZZ0/bxQ2URPeJM1ekXgdR1TaJI6sSK4PByEyL9Z
         uxYNJoCXLFpb9UUj56BLIReqIdVad3i1ZjsXm1MpF5zw5ndiTskkWgTLg4CKGUHlY7Ny
         21wA6jvfqdI2XVHzsQb6tPuKY+i1b1bJw4Bup4klmEsec2xb4vokhiHnwLN2huwM9w8y
         /WGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768440073; x=1769044873; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elZ+7z9St5n4o5etqR0ku5zcMBWid3JlUNNzB3S48Ko=;
        b=nerAAs69guhYYdfMt0kblYvdS6aUiuCE8vJLsoB972fbj8wDyIWX1CJFIxRX00Cid6
         8NmHjKlHHsCznZZbO/+g4qSM8VGUYZ6qSmvcvaeaCHaDxN4qjw5KbZUxvJOeDZ7aq++W
         3VH4gQnAeSe/C2Wy9qQwl7WvvVwtY5jwR8L6AJ1Ji0UwaK75zyjDLxfl1v6MmZuYnUS1
         8ViaIevEy4Qtkosa8e2tn9KJerMq9aMBR7OMfWmGuPUcA3CB1scyqhTX3G3+f9FKRBRn
         Y12YJ4ONvhTDl0Y0SrvvagOVZCbln7WFMq6WV2JFOwQE3vHPHsM/vj5+iXFRSKsbbGWb
         m7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768440073; x=1769044873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=elZ+7z9St5n4o5etqR0ku5zcMBWid3JlUNNzB3S48Ko=;
        b=GLlfw9I8dcU1EojVi84DflT3CPxoySCfgz7ALXNDCmYV/1SAOkqgcZwCqKZG56+2rX
         qN4k9WkisupD/7sj6hdXKz+dq1sPutacedN5svmYGFRd4hMQkObXBTuEysj8clFUIGcK
         cah6YfDqa7rhatW2FT7umW7TuquSQuqduf6im5x/P3NZzXQPvLDFOqJhdRrBkaCDTlMR
         D6fNcq2DlGoG8w5ip3GopXe1PNo0u65TbiSjiKCryc3IkWXxbg3yf03R95TveCfyak5Z
         7jodYzkIJNkfLqTr/SHb0b1BopouE8ZFeFyuMYngHMAIJQs5s9HVRB5wb/0tkVqdjE1i
         18IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOe70ZY1a46Hv6VgQaR+KPQQ1MzVqpFjIrwArMs1uDXwILBmCNCoSdXVv68MvBOZowKwCTDPRPISja@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3BEAfuB5F31dMKwMpwqpib+1xtKdCGbdzIBl3XAhzYrlaVeVe
	gHBwrXSHwGHcfH76+b/T6hRe43w5kfpiwEWkmJI5B4sUDrKY/xXrQFBGz9lJDcD2VsGBQlUr1oi
	GcDS3mnGPo04i/c7XqkaSn1EvjeNQfek+jhIE7ldr
X-Gm-Gg: AY/fxX7vfw4KDU2ADlPJh1jPcnQ7AL6lOWUNFbq1uhMXX5+IK6ADYsNm6uwtnuSXADf
	zQcw6iUe80dqoZvJt8Jehzh58rbzEAJNFxa4s2iRdy7KocCazELqRw1Vq+XJFWJPcZCAdxk3+T8
	tZZX00EfpHgVeko/exfcZ8CJCD6Y154PE3Zp9WVMiBGULYl62mrLWed3dQaPC0CHFLE+yhJOkfa
	idmLIsH04wnAig2MTjAZTwMd4ofgfF3vTRNZ1jgfnyArPbcMojXCwQghytjJ4JqPPzqYjcav0ma
	WMf+4v6pOuNCHZjChrWFQJRRsvI=
X-Received: by 2002:a05:622a:120d:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5026ecd7aeamr2823351cf.1.1768440072287; Wed, 14 Jan 2026
 17:21:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260114003015.1386066-1-sagis@google.com> <43a0558a-4cca-4d9c-97dc-ffd085186fd9@intel.com>
 <aWe8zESCJ0ZeAOT3@google.com>
In-Reply-To: <aWe8zESCJ0ZeAOT3@google.com>
From: Sagi Shahar <sagis@google.com>
Date: Wed, 14 Jan 2026 19:21:01 -0600
X-Gm-Features: AZwV_QjdTQ51NiLFDHGPdrtD9_djmbDXN-sHxsuLIZzWSLHmOkAx6u9yZZZenTo
Message-ID: <CAAhR5DE=ypkYwqEGEJBZs5A2N9OCVaL_9Jxi5YN5X7rNpKSZTw@mail.gmail.com>
Subject: Re: [PATCH] KVM: TDX: Allow userspace to return errors to guest for MAPGPA
To: Sean Christopherson <seanjc@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 9:57=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Jan 14, 2026, Xiaoyao Li wrote:
> > On 1/14/2026 8:30 AM, Sagi Shahar wrote:
> > > From: Vishal Annapurve <vannapurve@google.com>
> > >
> > > MAPGPA request from TDX VMs gets split into chunks by KVM using a loo=
p
> > > of userspace exits until the complete range is handled.
> > >
> > > In some cases userspace VMM might decide to break the MAPGPA operatio=
n
> > > and continue it later. For example: in the case of intrahost migratio=
n
> > > userspace might decide to continue the MAPGPA operation after the
> > > migrration is completed
>
> migration
>
> > > Allow userspace to signal to TDX guests that the MAPGPA operation sho=
uld
> > > be retried the next time the guest is scheduled.
>
> To Xiaoyao's point, changes like this either need new uAPI, or a detailed
> explanation in the changelog of why such uAPI isn't deemed necessary.
>
> > > Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> > > Co-developed-by: Sagi Shahar <sagis@google.com>
> > > Signed-off-by: Sagi Shahar <sagis@google.com>
> > > ---
> > >   arch/x86/kvm/vmx/tdx.c | 8 +++++++-
> > >   1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > > index 2d7a4d52ccfb..3244064b1a04 100644
> > > --- a/arch/x86/kvm/vmx/tdx.c
> > > +++ b/arch/x86/kvm/vmx/tdx.c
> > > @@ -1189,7 +1189,13 @@ static int tdx_complete_vmcall_map_gpa(struct =
kvm_vcpu *vcpu)
> > >     struct vcpu_tdx *tdx =3D to_tdx(vcpu);
> > >     if (vcpu->run->hypercall.ret) {
> > > -           tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OP=
ERAND);
> > > +           if (vcpu->run->hypercall.ret =3D=3D -EBUSY)
> > > +                   tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RE=
TRY);
> > > +           else if (vcpu->run->hypercall.ret =3D=3D -EINVAL)
> > > +                   tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_IN=
VALID_OPERAND);
> > > +           else
> > > +                   return -EINVAL;
> >
> > It's incorrect to return -EINVAL here.
>
> It's not incorrect, just potentially a breaking change.
>
> > The -EINVAL will eventually be
> > returned to userspace for the VCPU_RUN ioctl. It certainly breaks users=
pace.
>
> It _might_ break userspace.  It certainly changes KVM's ABI, but if no us=
erspace
> actually utilizes the existing ABI, then userspace hasn't been broken.
>
> And unless I'm missing something, QEMU _still_ doesn't set hypercall.ret.=
  E.g.
> see this code in __tdx_map_gpa().
>
>         /*
>          * In principle this should have been -KVM_ENOSYS, but userspace =
(QEMU <=3D9.2)
>          * assumed that vcpu->run->hypercall.ret is never changed by KVM =
and thus that
>          * it was always zero on KVM_EXIT_HYPERCALL.  Since KVM is now ov=
erwriting
>          * vcpu->run->hypercall.ret, ensuring that it is zero to not brea=
k QEMU.
>          */
>         tdx->vcpu.run->hypercall.ret =3D 0;
>
> AFAICT, QEMU kills the VM if anything goes wrong.
>
> So while I initially had the exact same reaction of "this is a breaking c=
hange
> and needs to be opt-in", we might actually be able to get away with just =
making
> the change (assuming no other VMMs care, or are willing to change themsel=
ves).

Is there a better source of truth for whether QEMU uses hypercall.ret
or just point to this comment in the commit message.

>
> > So it needs to be
> >
> >       if (vcpu->run->hypercall.ret =3D=3D -EBUSY)
> >               tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> >       else
> >               tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OP=
ERAND);
>
> No, because assuming everything except -EBUSY translates to
> TDVMCALL_STATUS_INVALID_OPERAND paints KVM back into the same corner its =
already
> in.  What I care most about is eliminating KVM's assumption that a non-ze=
ro
> hypercall.ret means TDVMCALL_STATUS_INVALID_OPERAND.
>
> For the new ABI, I see two options:
>
>  1. Translate -errno as done in this patch.
>  2. Propagate hypercall.ret directly to the TDVMCALL return code, i.e. le=
t
>     userspace set any return code it wants.
>
> #1 has the downside of needing KVM changes and new uAPI every time a new =
return
> code is supported.
>
> #2 has the downside of preventing KVM from establishing its own ABI aroun=
d the
> return code, and making the return code vendor specific.  E.g. if KVM eve=
r wanted
> to do something in response to -EBUSY beyond propagating the error to the=
 guest,
> then we can't reasonably do that with #2.
>
> Whatever we do, I want to change snp_complete_psc_msr() and snp_complete_=
one_psc()
> in the same patch, so that whatever ABI we establish is common to TDX and=
 SNP.
>
> See also https://lore.kernel.org/all/Zn8YM-s0TRUk-6T-@google.com.
>
> > But I'm not sure if such change breaks the userspace ABI that if needs =
to be
> > opted-in.
