Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5D2212549
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 01:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768440153; cv=pass; b=R29Ooux9KxjycXC0LcBbbyk6TkFbXor/nraUxY7VMsS9uGtrEaDI4RxFsLL+WmTy22RR7K/G6csHB4YP1lifMRqnOTKyHpbOrlVFraHe9idVOJiPZKlFZeafj/G5bEND0Jb53Nur26uyiPegec5uS1dgYpsJmRz/tsDSHuEOFvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768440153; c=relaxed/simple;
	bh=Bnim1PgEw5wqREk32FnL86aokygw8Ib577rInchTGa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHIGqNcHGGOYMVTjSErrRe9ysOkLkFpJTMpTjh0wO9DxVP4S0/mNuNOjqfhLjJL4yq59ZyzRWo2tKh7ftespwvk2RESmDkQq1Gf/oTD5mLciSzaXSUe0ywtXNOLT9DHJTRhHKi4EXq8KhERe8uc+FJLaBYMP5rFOekmA5zAF1no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cniZTM+j; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cniZTM+j"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5014b5d8551so173111cf.0
        for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 17:22:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768440151; cv=none;
        d=google.com; s=arc-20240605;
        b=a05KOYepm5N0qHtY3IhFV0fJPc53WlxbQXg+LzOu3DZqGymHCecLLWFwfu3EdnVolq
         bIa7GwNAXwDE34SfQ+YR23+O1YdB59ciPClJ65YNtIS7bG/mFk8tAObEhv5nrd8wM4ix
         6nc0X4O148LJXP6O7kKM7fNE0XCD9dQG6u/4QkPlcyiW+k279eMoAieptKnhpcrGZHaz
         1Ii/+zkI8Drc6iuGt6Qg3RSTcciqSj0H7RhZvu7GCLahI7+/iME29aMWypD7CHR4d6UR
         uMpXK6ye41i5sx12DXWBibOOxGXLXXrrnVa+P4Q95PLSfTyOOGp//+YLpyGMgh1G/87y
         A4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sFi2PWseoVJquVrwoMhwmvEVm3PHBthNk0di0Pcowfg=;
        fh=0bwvjnfTaZwks58h0jXQL0zB+fjbJdQFIy5ODJAYzMU=;
        b=eM8acCR/imjbuZXhjyJ8Nu7YlA2ZBrqFxF96NwbVjO0KzTbxZGoPg6Hjzm1S25mox4
         QWHlplCwIwjpRZIR4cpRuPjpNdceA8EemVrHl1Is+pE2pQEg+XCmmg2PPBRI2nGDeOZ9
         1xFBSyZuhyA/4kb/G9gju66EPtMpa8EMki9+/nPMOVPgAsOgkYK4mKbpB3kerGD8Web+
         paVRIPJdpae/XrfZlc7VBxMQA1gY8K80DVJHLCzuXpKpUtwntn+ck4vqHHQjhrhK0Obc
         0bn1iwEnt+jVeCy611aF06i+J7WeoFAISDtqk6WfAq9TxmmdMZv+AKu94kWLOfeP7LXE
         FQCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768440151; x=1769044951; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFi2PWseoVJquVrwoMhwmvEVm3PHBthNk0di0Pcowfg=;
        b=cniZTM+j927LXgFY07v2pBd3HTQGuFntAGZRtOfH9JxaPq9WuwZdQC8yaU6djBG9yV
         1Ts9zcBFVC9E5vyu0CCR87oLa52dlHDfUPjhO9qSeDrqtvl3miXXwRfxKRqjwJfushZ4
         scuLO9VgH7G/x/CxxRvJOqcMbMqm7z1ivGAb0sMFVzQPZp/iFB9QiNdlmUeUFXn6LAvV
         qGwP1YHGFGHV5xGEc5qnArCVIYWCQLcrxIvM3GInt7y1L/b62xY4j/TLLhMx6T6sF9+b
         wnA8/ubMaNGsJum2jZO4PGk+tEZCDTdN+eumnNLesfZAqJ6sV9YdhxCAyzN6U6pVcu4U
         dr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768440151; x=1769044951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sFi2PWseoVJquVrwoMhwmvEVm3PHBthNk0di0Pcowfg=;
        b=Rh16Re56vGe7uzPbnaagwsct7CPhwX+/EK7zGf39VZdLDQ5E2P8f0avktiVtgQboP1
         xS+a/Qh/7Ai64qpSJMUVw7EDySH356NJitRcGkJQvduEIdxHAzkDxxAzJu23BXZNDPDs
         PJgYHcorppHgzhfP61uAO9wKvq/6/oJX8CeRRtzkRqoAWwLTEvZJXWuYgMSMHN+FdkC2
         apIgZQsJnQ0VK4HE7O4cW3oPs5Ko9YygTVVMf+/a6AwCF1ABZwFZADkaEWxA4NYJdcIK
         ILgVIg70PB8VKKtnnl3ow3jBi64j5IGgsNjkYDl1jI3uGDeFleCBRmHWUgm4SwDiVzk5
         KYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCURAchgxDwnJ/0Hr6xhoZLcvOIOlhnjBIKdghsxwvc9gppWKAOm6OJLV4ywZ5SAXzpZ3P/k0XRJcv35@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+BAz6ICzyCIEEpCZ2zB2xhJo+K2cwkf3njx9Rv76lOZptT/35
	MGyDfvxieleg4KDx5zK+DOZs3CHljcCbx9b6b/hsoO1KaxEutucg2m5c9zCWwgUqennKbislzej
	T77Sn7RDeAmw/L/c/WrgXWBY7zMlp26XAAL8DPbTj
X-Gm-Gg: AY/fxX5zDZT2syCoBgCJsgvYYoPKueJ/QkfMs56ZPbTMfmo3XB/dLMI9mTU3w7eMGBh
	FNLyIrp+5ZgDfMQexUXhLh1NFgkGfwLqneUxU8r6GV5CzDyfF+y/f7OcHcWlltp5aObyyrWSRTs
	p0sRpMCJVgUECFdKvDSBHF8F4U7IGypKxB5gaMOue4QibJ2oPhRRj7dvZFhoU+97S9wv6Yz2Ue8
	ulfK3yFK5woGj3RkyXz82xzITOrJ6iT4brk9it4nDZEITt8vlm1P12VQdqPfS3/+W1VgdQeNDuY
	x/45sXezquu7kanma5bakPV1W2Q=
X-Received: by 2002:a05:622a:10b:b0:4ff:c109:6a4 with SMTP id
 d75a77b69052e-501debdf6bemr5297681cf.4.1768440150607; Wed, 14 Jan 2026
 17:22:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260114003015.1386066-1-sagis@google.com> <43a0558a-4cca-4d9c-97dc-ffd085186fd9@intel.com>
 <aWe8zESCJ0ZeAOT3@google.com> <aWgPFQOQRr3xcMjh@google.com>
In-Reply-To: <aWgPFQOQRr3xcMjh@google.com>
From: Sagi Shahar <sagis@google.com>
Date: Wed, 14 Jan 2026 19:22:19 -0600
X-Gm-Features: AZwV_QiJtsMlwE9fwof0hDggEeZkKPE35Uk4FvzQENJq3Az30USGqu48l1mKWN8
Message-ID: <CAAhR5DHN+MTXX8v6LMWsQzKfpRefFwNO62hH+4iKiMpaSKiYvQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: TDX: Allow userspace to return errors to guest for MAPGPA
To: Sean Christopherson <seanjc@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Vishal Annapurve <vannapurve@google.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 3:48=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> +Mike
>
> On Wed, Jan 14, 2026, Sean Christopherson wrote:
> > On Wed, Jan 14, 2026, Xiaoyao Li wrote:
> > > On 1/14/2026 8:30 AM, Sagi Shahar wrote:
> > > So it needs to be
> > >
> > >     if (vcpu->run->hypercall.ret =3D=3D -EBUSY)
> > >             tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> > >     else
> > >             tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OP=
ERAND);
> >
> > No, because assuming everything except -EBUSY translates to
> > TDVMCALL_STATUS_INVALID_OPERAND paints KVM back into the same corner it=
s already
> > in.  What I care most about is eliminating KVM's assumption that a non-=
zero
> > hypercall.ret means TDVMCALL_STATUS_INVALID_OPERAND.
> >
> > For the new ABI, I see two options:
> >
> >  1. Translate -errno as done in this patch.
> >  2. Propagate hypercall.ret directly to the TDVMCALL return code, i.e. =
let
> >     userspace set any return code it wants.
> >
> > #1 has the downside of needing KVM changes and new uAPI every time a ne=
w return
> > code is supported.
> >
> > #2 has the downside of preventing KVM from establishing its own ABI aro=
und the
> > return code, and making the return code vendor specific.  E.g. if KVM e=
ver wanted
> > to do something in response to -EBUSY beyond propagating the error to t=
he guest,
> > then we can't reasonably do that with #2.
> >
> > Whatever we do, I want to change snp_complete_psc_msr() and snp_complet=
e_one_psc()
> > in the same patch, so that whatever ABI we establish is common to TDX a=
nd SNP.
> >
> > See also https://lore.kernel.org/all/Zn8YM-s0TRUk-6T-@google.com.
>
> Aha!  Finally.  I *knew* we had discussed this more recently.  The SNP se=
ries to
> add KVM_EXIT_SNP_REQ_CERTS uses a similar pattern.  Note its intentional =
use of
> positive values, because that's what userspace sees in errno.  This code =
should
> do the same.  Oh, and we need to choose between EAGAIN and EBUSY...
>
>         switch (READ_ONCE(vcpu->run->snp_req_certs.ret)) {
>         case 0:
>                 return snp_handle_guest_req(svm, control->exit_info_1,
>                                             control->exit_info_2);
>         case ENOSPC:
>                 vcpu->arch.regs[VCPU_REGS_RBX] =3D vcpu->run->snp_req_cer=
ts.npages;
>                 return snp_req_certs_err(svm, SNP_GUEST_VMM_ERR_INVALID_L=
EN);
>         case EAGAIN:
>                 return snp_req_certs_err(svm, SNP_GUEST_VMM_ERR_BUSY);
>         case EIO:
>                 return snp_req_certs_err(svm, SNP_GUEST_VMM_ERR_GENERIC);
>         default:
>                 break;
>         }
>

I think EAGAIN makes more sense semantically in this case. So
something like this?

-               tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPER=
AND);
+               if (vcpu->run->hypercall.ret =3D=3D EAGAIN)
+                       tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETR=
Y);
+               else if (vcpu->run->hypercall.ret =3D=3D EINVAL)
+                       tdvmcall_set_return_code(vcpu,
TDVMCALL_STATUS_INVALID_OPERAND);
+               else
+                       return -EINVAL;
+

>
> https://lore.kernel.org/all/20260109231732.1160759-2-michael.roth@amd.com
