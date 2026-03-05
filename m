Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B07E3630BD
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 22:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772749684; cv=pass; b=N1mFwUwnuUFPkWPy1FbR5uA8C5gh3AYV34WVfPqI1IGBGh/S1COEqV/4AUF0ehyC11zIpM/ILfUUdcTVdjMMsjrzeBrYgApzzxmWQJxx+lfPnlhiXRUnFbcXv683jrYugC7JSxJrRpMDVyC7gvOp7vxBtf622pKuQKOnirZ8sHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772749684; c=relaxed/simple;
	bh=p5fofGQFpMgyUNHVfu+CLNG2dMgWZmkRFyjtHgA6LDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kc+5UreecHBd5RGNqgGkR2AAZrXSq7+GCax7CCeFLybIdylU/XCFOySbw7P8k2OTZCwwWcB8JeZKolBDaFcmEwuE5g8yox6vN4K9H/M/Yh5les2I7u3EB4GIDunPgSyNXJvgTKHp/8IdTIhKo8Z5UmmQgilOFFWKVg+JuVXtqC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wkQmAz7o; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wkQmAz7o"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-660a4aa2aa9so3756a12.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 14:28:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772749681; cv=none;
        d=google.com; s=arc-20240605;
        b=anJw6Ux/Eu8XTcCPPb7quQ/w+mmiK9U6f2DtpB1AZRjKDjEkDmU3JUMtvR0MyPdgKG
         BNjxERaIDiVs1fGi4rWtfNGA3K/UsCgyKu2C9aNvRueLLGAp0D60oHknaT/6X8ZY3fYk
         eg9PdrCyVUrLq1f2mbI3eWXa9JAd/5E8cV8GwoMbuzX0BCwmh99wBSkNe23/jAzmh+7Y
         l5nNCfxYZBWJRgaJSsQE27/DO1ShKn3UdUTFkiNuroMExuc7Fd29Pa1qNVs9sDUY9LLX
         mSrA8ANxvCVzivIFP8D8HuKoAzneVaIvIjZzaZsV9E+x66i8yGjbgK2tmMYSaWYEmrYa
         qBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BUUij3Qtk7eI+wZrhr6CCGMZUD25vaaW1Pro/4vyRRA=;
        fh=EKi/cqLiBZaUxScCWsrf0wO72XiCTZDEY4mr6mOyNR8=;
        b=YuvjZVktHVCPhyKKReU+RBaOuvno3cTLgSAOJetNaIdTxhgP/R+g/oHjlhuNkZHz9w
         py35snYIqS+sIdyxXbrvi2nAhtmWfhEBA1k3YCf/8HTjzkEmq9RHfF4jJU+3fJ5LLFS4
         ICEw+74hcpH/g+3kQtprqv0pQ8rFEt+W1mti2miw3IbEh1U5ULNmMJQlpABwAifsbzQk
         KP/kUq6pmr+4ABjEXWZoK1tkUjSSdn6YgY9WeHhQTY7QqIYv+nHM2p5shQnvRdf3V7Hl
         It/m4PZZ+HBVjOjYbSon6juQ4eqWyoOkxIr6+ChbEKqqhFJz5heLU8Q8zd/hHHhCo+t8
         NvmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772749681; x=1773354481; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUUij3Qtk7eI+wZrhr6CCGMZUD25vaaW1Pro/4vyRRA=;
        b=wkQmAz7oMdPbUxhhP2rVYktsqiHhyvDCY3/OhJUaBboDpAGY4J/eWx/mE8Ap7pF8VK
         sXIvpw/ch7cmln2yl9BE5aAqzp0U2AkNaDtXw5Dwx6tGq8yUqahGT41m12/5H8GGBsRt
         8tY6OsrQoeb2Tl+8szBSYMuoK1SyB9fnWs3QcvGEPczqfubQFPD/Dd3a26xOMsur9Nu+
         L6851ZvuwLxVIsSe2AZcjgnqyQV/Wz4m4bDiCWHUyO/hS1TYoWmQzEW/B4zUQtz7vc9X
         ct/UgpFFY+jXjuuQbuzK0IerUPyTJMmwxlYHhX/STe5Liy43JeKHQ6qBlPvnpqRUJW+n
         pVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749681; x=1773354481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BUUij3Qtk7eI+wZrhr6CCGMZUD25vaaW1Pro/4vyRRA=;
        b=OKg83ES0H31ys1WkEKTn8s5QOUR3vAJH5kSzXB4HtoqOPton3okU+Qz0UlMivCIQwn
         3dLyYROkQ3MvyZZsKGWfU7Q+4iSfgwkeJ3/jnHnnZaFuyxlEv/zCvcFsDhUE96BVMIPF
         YC9BCzweNkwo/pXCRhlKnkcsg8ItrJa8TKW/H9TJ4PViaaV5WmcxfS3FcoUtrHtBGhkx
         pAaUrRerIfUSXBJDdX25RNzHSxITUxmP37MeJXAvLCRQlBUh6G5LJUVCZ5Zgfd9aiJGw
         lA06D0EmWbD8hJGOFZjy4n4Pq7pMe0IyJecxByd0GT0+OUHR6IY6+/4PiyTRhTw6akRV
         8ZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD+gi60PFM7TnsWjcxoV67ryKhPupVnKFZD0krvjGwV0mu15aEwsSN3xef5zA7DriQUWROg4/5JJy1@lists.linux.dev
X-Gm-Message-State: AOJu0YyStVepWIjPrmGsrBaV9E2KegjVdDyNbwh4wgOmLdrbSg+0vsrn
	ryfPrSk9OToXqD9VCWDXBr0XFgvhKmKqTqWJ6kzAxX7M59zrxk4LZL+XhIloyns2eok8qfHfm8K
	AhrkD9kaSGRf0iWMwBE4iHX+tZFWts/CXE0xYAPam
X-Gm-Gg: ATEYQzw368ADwq2MhBATMUklUjsIBhhgr3lsN9TkiexJyVDNJfUTDR72KxzSlWQGzPD
	70tqr1z90suhfPKe9Y8i7IUxsIdWaV2pEbyunTLJyw1203C+2Bj9jXK+g86cdcZNwKx4VLHDSeg
	OtNtSolZBKdnACu/U9qzk5P0l4WdvaVvbjz70xFv0GC1y1a7Mhvr9GOClllgzFK7jmOl/uFO4N6
	W+DDz1gH+wJWbPI/9YjG2wGwUjrsUEZIAj0viRsjjSnfS6kIbM1uHxp4ONgTPHACLFYHogv/wil
	1E04D0IgYYT/LkZyv+0Gj2Nn+w7pox91Vx7eHuA=
X-Received: by 2002:a05:6402:26c3:b0:661:1019:5388 with SMTP id
 4fb4d7f45d1cf-6618dc4a483mr15811a12.10.1772749681209; Thu, 05 Mar 2026
 14:28:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260206222829.3758171-1-sagis@google.com> <20260206222829.3758171-2-sagis@google.com>
 <20260217180511.rvgsx7y45xfmrxvz@amd.com> <037084a1-2019-4bd2-b1ed-7f34f9128e37@amd.com>
 <20260217191635.swit2awsmwrj57th@amd.com> <aZS_ePUyLcTyZ4Am@google.com>
In-Reply-To: <aZS_ePUyLcTyZ4Am@google.com>
From: Sagi Shahar <sagis@google.com>
Date: Thu, 5 Mar 2026 16:27:48 -0600
X-Gm-Features: AaiRm5334z_4bkOOOro7BUKnb0laFSF7mgIjilyebgCsWunDpdebWfBRXx0w8DU
Message-ID: <CAAhR5DHLAF7gsOhUGWQRX0f2nK8_efg_L+h3fCiYCym-u5tNGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] KVM: TDX: Allow userspace to return errors to
 guest for MAPGPA
To: Sean Christopherson <seanjc@google.com>
Cc: Michael Roth <michael.roth@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 1:20=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Feb 17, 2026, Michael Roth wrote:
> > On Tue, Feb 17, 2026 at 12:45:52PM -0600, Tom Lendacky wrote:
> > > On 2/17/26 12:05, Michael Roth wrote:
> > > >> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > > >> index 2d7a4d52ccfb..056a44b9d78b 100644
> > > >> --- a/arch/x86/kvm/vmx/tdx.c
> > > >> +++ b/arch/x86/kvm/vmx/tdx.c
> > > >> @@ -1186,10 +1186,21 @@ static void __tdx_map_gpa(struct vcpu_tdx =
*tdx);
> > > >>
> > > >>  static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
> > > >>  {
> > > >> +        u64 hypercall_ret =3D READ_ONCE(vcpu->run->hypercall.ret)=
;
> > > >>          struct vcpu_tdx *tdx =3D to_tdx(vcpu);
> > > >>
> > > >> -        if (vcpu->run->hypercall.ret) {
> > > >> -                tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_IN=
VALID_OPERAND);
> > > >> +        if (hypercall_ret) {
> > > >> +                if (hypercall_ret =3D=3D EAGAIN) {
> > > >> +                        tdvmcall_set_return_code(vcpu, TDVMCALL_S=
TATUS_RETRY);
> > > >> +                } else if (vcpu->run->hypercall.ret =3D=3D EINVAL=
) {
> > > >> +                        tdvmcall_set_return_code(
> > > >> +                                vcpu, TDVMCALL_STATUS_INVALID_OPE=
RAND);
> > > >> +                } else {
> > > >> +                        WARN_ON_ONCE(
> > > >> +                                kvm_is_valid_map_gpa_range_ret(hy=
percall_ret));
> > > >> +                        return -EINVAL;
> > > >> +                }
> > > >> +
> > > >>                  tdx->vp_enter_args.r11 =3D tdx->map_gpa_next;
> > > >>                  return 1;
> > > >>          }
> > > >
> > > > Maybe slightly more readable?
> > > >
> > > >     switch (hypercall_ret) {
> > > >     case EAGAIN:
> > > >         tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> > > >         /* fallthrough */
> > >
> > > I think you want a break here, not a fallthrough, so that you don't s=
et
> > > the return code twice with the last one not being correct for EAGAIN.
> >
> > Doh, thanks for the catch. I guess a break for the EINVAL case as well =
would
> > be more consistent then.
> >
> >     switch (hypercall_ret) {
> >     case EAGAIN:
> >         tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> >         break;
> >     case EINVAL:
> >         tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND)=
;
> >         break;
> >     case 0:
> >         break;
> >     case default:
> >         WARN_ON_ONCE(kvm_is_valid_map_gpa_range_ret(hypercall_ret));
> >         return -EINVAL;
> >     }
> >
> >     tdx->vp_enter_args.r11 =3D tdx->map_gpa_next;
> >     return 1;
>
> Heh, except then KVM will fail to handle the next chunk on success.  I li=
ke the
> idea of a switch statement, so what if we add that and dedup the error ha=
ndling?
>
> static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
> {
>         u64 hypercall_ret =3D READ_ONCE(vcpu->run->hypercall.ret);
>         struct vcpu_tdx *tdx =3D to_tdx(vcpu);
>         long rc;
>
>         switch (hypercall_ret) {
>         case 0:
>                 break;
>         case EAGAIN:
>                 rc =3D TDVMCALL_STATUS_RETRY;
>                 goto propagate_error;
>         case EINVAL:
>                 rc =3D TDVMCALL_STATUS_INVALID_OPERAND;
>                 goto propagate_error;
>         default:
>                 WARN_ON_ONCE(kvm_is_valid_map_gpa_range_ret(hypercall_ret=
));
>                 return -EINVAL;
>         }
>
>         tdx->map_gpa_next +=3D TDX_MAP_GPA_MAX_LEN;
>         if (tdx->map_gpa_next >=3D tdx->map_gpa_end)
>                 return 1;
>
>         /*
>          * Stop processing the remaining part if there is a pending inter=
rupt,
>          * which could be qualified to deliver.  Skip checking pending RV=
I for
>          * TDVMCALL_MAP_GPA, see comments in tdx_protected_apic_has_inter=
rupt().
>          */
>         if (kvm_vcpu_has_events(vcpu)) {
>                 rc =3D TDVMCALL_STATUS_RETRY;
>                 goto propagate_error;
>         }
>
>         __tdx_map_gpa(tdx);
>         return 0;
>
> propagate_error:
>         tdvmcall_set_return_code(vcpu, rc);
>         tdx->vp_enter_args.r11 =3D tdx->map_gpa_next;
>         return 1;
> }

Thanks for the review. I updated the code and sent out v4 for review.
