Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E28A3242CA
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770308968; cv=none; b=E+3ShGjeFxkkIp1dlStRiX5MJE0PMCrvEFb6RmFDkMhAMqZgAzg4M6PxajF00pIi7EKmo3jxVcbXu/6t5dZfH3f3fEgmwBXaQRCB0ln7cow4msSeurGqKudJo5YRouOjFUzVpcCWFXktpLt1xZryU2QOJE6VCyuwJqabtZdZfDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770308968; c=relaxed/simple;
	bh=vZO/61lSQobupRA52ism1k91f8SSJ19uGRMSgNVUWDE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bq8uUlfy2jxwObMACEMxUMnENzSmEFiufF0kp++tejgOoPRpjkRiwiyhGGFaQr2QN5HVj02gaD0Qq7S2RrMQUwWQh672mbvf/cc1aROeO4DmpumclDs8dN9xwxPMAAMnq092/q2YFsmbxZZjQaQQgl/jc8tVDY9J9x0EVBvYuwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L5yQNWGZ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L5yQNWGZ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c56848e6f53so680376a12.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Feb 2026 08:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770308968; x=1770913768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brn1uDcN21+M3nqos+ToSMsJASFwbWfm4IhWvM2xjBA=;
        b=L5yQNWGZQvVu7i733ohthvS06dDRKneXrnADErCxFk1dshiCCVtApjhrebWncZJ+Zh
         OxdknW+aRdCoXhy+KGAsFq2567D2mRN7t5pSLIffz4UVp27WJShSW018zLRUKjSbDDR2
         cOpoPzqB6IopOboy15L58pYzlVcgdER5kZ1Bcn/6lGrz2xgLVil237BGndesbuk41UND
         cc0IWtLXjRfL1homn78iAK2cm0T7CvW9fTsN1IJwZMuJKP4RMolBFfMMNuneI3Uoy0fA
         eST9XjHqMdNPESYRofzqxuer2ndp40dq3OGpQSkIenvjMSZYEAsKJghAS9IRCXOUDd+a
         ZkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770308968; x=1770913768;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=brn1uDcN21+M3nqos+ToSMsJASFwbWfm4IhWvM2xjBA=;
        b=m1ne496uTfl+wJj6m0jzeg7m0EBwKgA9NSrNYWinPsyQgXe5z/jj3rAF/A2oi4FELv
         TYok7vHJ+8WxFzNMYoFOyNekyISWMypKgUSNxl4m5Wb3VCGSOyzJ3WIZrS94idh5/YL0
         yTG8NSZhYwgDnLYpvQMxPgjYsWQYAhzZN8epO497nX2p0KkMyIN7XV2+JAxXKNd1AGvc
         iyml3MUmEg7csJGpjlFfWtq3MB3zQeuwW/dFTfkMif6O0N4Zkitu2orXaVzRbF+UV/5v
         Dx/bFyvF3jQGdkm/+9e0jtqLRA0ZrbE6LLLRAzOnrrV3W54sli95GLiU+tYX9Rc73q50
         WqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFuZz234fwXZtGVs0kNmLQa3TBETFY6KSb7nbouRXzLnUcL849aDZ7doI6aBFLwoDZH3KywnQQeLxR@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0hOjcfw02zfaXYoErtF6tv0HxcSGQzbKysdEPEIBBdbTzgkzq
	T2x42ZY+5LbtkPJLYBcRTg4iytS80wLvZfg1SL8vt0lEJy9RiiZ5AaHd838cdDGutEjtcZGH9Kf
	D2uagVQ==
X-Received: from pgmc27.prod.google.com ([2002:a63:1c5b:0:b0:bc0:ea34:538])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3a94:b0:38d:ee68:2c55
 with SMTP id adf61e73a8af0-39372073827mr6943091637.15.1770308967830; Thu, 05
 Feb 2026 08:29:27 -0800 (PST)
Date: Thu, 5 Feb 2026 08:29:26 -0800
In-Reply-To: <aYKKnf7K3lRdUcxl@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260123145645.90444-1-chao.gao@intel.com> <20260123145645.90444-8-chao.gao@intel.com>
 <301f8156-bafe-440a-8628-3bf8fae74464@intel.com> <aXywVcqbXodADg4a@intel.com>
 <fedb3192-e68c-423c-93b2-a4dc2f964148@intel.com> <aYHmUCLRYL+JX1ga@intel.com>
 <aYIXFmT-676oN6j0@google.com> <aYKKnf7K3lRdUcxl@intel.com>
Message-ID: <aYTFZv9Mf_FqWM_k@google.com>
Subject: Re: [PATCH v3 07/26] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, x86@kernel.org, 
	reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com, 
	dan.j.williams@intel.com, yilun.xu@linux.intel.com, sagis@google.com, 
	vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com, 
	zhenzhong.duan@intel.com, rick.p.edgecombe@intel.com, kas@kernel.org, 
	dave.hansen@linux.intel.com, vishal.l.verma@intel.com, 
	Farrah Chen <farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026, Chao Gao wrote:
> >On Fri, Jan 30, 2026 at 8:23=E2=80=AFAM Dave Hansen <dave.hansen@intel.c=
om> wrote:
> >> On 1/30/26 00:08, Chao Gao wrote:
> >> > AFAIK, this is a CPU implementation issue. The actual requirement is=
 to
> >> > evict (flush and invalidate) all VMCSs __cached in SEAM mode__, but =
big
> >> > cores implement this by evicting the __entire__ VMCS cache. So, the
> >> > current VMCS is invalidated and cleared.
> >>
> >> But why is this a P-SEAMLDR thing and not a TDX module thing?
> >
> >My guess is that it's because the P-SEAMLDR code loads and prepares the =
new TDX-
> >Module by constructing the VMCS used for SEAMCALL using direct writes to=
 memory
> >(unless that TDX behavior has changed in the last few years).  And so it=
 needs
> >to ensure that in-memory representation is synchronized with the VMCS ca=
che.
> >
> >Hmm, but that doesn't make sense _if_ it really truly is SEAMRET that do=
es the VMCS
> >cache invalidation, because flushing the VMCS cache would ovewrite the i=
n-memory
> >state.
>=20
> My understanding is:
>=20
> 1. SEAMCALL/SEAMRET use VMCSs.
>=20
> 2. P-SEAMLDR is single-threaded (likely for simplicity). So, it uses a _s=
ingle_
>    global VMCS and only one CPU can call P-SEAMLDR calls at a time.
>=20
> 3. After SEAMRET from P-SEAMLDR, _if_ the global VMCS isn't flushed, othe=
r CPUs
>    cannot enter P-SEAMLDR because the global VMCS would be corrupted. (no=
te the
>    global VMCS is cached by the original CPU).
>=20
> 4. To make P-SEAMLDR callable on all CPUs, SEAMRET instruction flush VMCS=
s.
>    The flush cannot be performed by the host VMM since the global VMCS is=
 not
>    visible to it. P-SEAMLDR cannot do it either because SEAMRET is its fi=
nal
>    instruction and requires a valid VMCS.

No, this isn't the explanation.  I found the explanation in the pseudocode =
for
SEAMRET.  The "successful VM-Entry" path says this:

  current-VMCS =3D current-VMCS.VMCS-link-pointer
  IF inP_SEAMLDR =3D=3D 1; THEN
    If current-VMCS !=3D FFFFFFFF_FFFFFFFFH; THEN
      Ensure data for VMCS referenced by current-VMC is in memory
      Initialize implementation-specific data in all VMCS referenced by cur=
rent-VMCS
      Set launch state of VMCS referenced by current-VMCS to =E2=80=9Cclear=
=E2=80=9D
      current-VMCS =3D FFFFFFFF_FFFFFFFFH
    FI;
    inP_SEAMLDR =3D 0
  FI;

I.e. my guess about firmware (probably XuCode?) doing direct writes was cor=
rect,
I just guessed wrong on which VMCS.  Or rather, I didn't guess "all".

> The TDX Module has per-CPU VMCSs, so it doesn't has this problem.
>=20
> I'll check if SEAM ISA architects can join to explain this in more detail=
.
