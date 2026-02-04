Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E1126738C
	for <linux-coco@lists.linux.dev>; Wed,  4 Feb 2026 01:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770167794; cv=none; b=kMidJaTFggzEqk3a46Za3EA1fCgBNoA/aiGYURxiN2uabAzmGXDH3ciHRJE1SMqlu4yJDsEGdslKjEdULmCaaQhv9JRgISUTtbWFnEi6oE+cV3wEeDvlWXRpLTRAd5SmYuEZreCRrYKZxNBNkoyDRYGqxNIJpmceMQyu5MWqZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770167794; c=relaxed/simple;
	bh=ChG3/8B1IJ9YT6VcPtOFh51Ez1qY+VBv1xR91btVjlQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eJJVEWPw7+88TrZysk2fcNy+1Hd+2RpguSiMG7OlYORBh5oHfgQqIGXjnmEIh2XA9ECznh851q1YqW/O/c4FYNOfUzYCfX4OXID9MtCyHTGYyh4L+41Ahj3vefFJ7nlPL7w+B6mxnY+fOsReM4qnYoEwotCA1bw2QYrQnffu4rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HasdA+88; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HasdA+88"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-352ec74a925so11937144a91.2
        for <linux-coco@lists.linux.dev>; Tue, 03 Feb 2026 17:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770167792; x=1770772592; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEfaDVPh64vLaMwr0r7Iy/qbZqBS6ygDFXVfCEVBmSo=;
        b=HasdA+888xBWOU50UtjooWfKyB+5SDRz5O1tcp0SVPUyGn8nuU7fO4cYtWQ+AM/8Xf
         WbDlkMi36SYKYSsjdk7iixQqHNZGDgTGy/z3juzTNRC5of+8gwwLn8XekbdnXFnYEJcw
         AykJP5wz9NjBuTNtOWZOPtjrcYl/PXuAix8TSf/uEysrwaqciOABLYV6kF6PZN/uR30g
         NdLJCvFrFlPyaCFjkrZF1B8cpEthMIxbrVs2a42GvKVr+nCSLVB+Zvj2j5fPIV3sLNl+
         04birvPrG8/dqzqVWw6uTB3dPAncU/UT4j/ckyeN9HpXfOlvzZ4CC7H7Ox9avA3auBHc
         sY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770167792; x=1770772592;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mEfaDVPh64vLaMwr0r7Iy/qbZqBS6ygDFXVfCEVBmSo=;
        b=fp/2jDsq513WEiV96WlVC7WJBExq9r5XiOxtyGu87lknjXV3izqf6yqeWD0JtyjwvZ
         GbtsXZ7DxoOwzH53oFWXpOnf6oVebcmD8EO5bPdm6geVO07tP0Pa4ecJCycMPIUxPQqJ
         Q1pCHH5CjvW4fFtZgL3Pw14pDELVcX5G5liZnBaSWCoOZprwalIbSfJck84SHy68Kkhc
         Zf4HFmJDkkowL35Sr8kn0ytyCDPKvv5t9ZYJHrUCIcvlV1tLFF4kWBWyxr4oU0G3T6nF
         TNxl5YFMlcU3eKgtHntE1fvZ/sSEMyej2kMHKEiqb5ZRJKN+64Th+g8hivcwh7K/YzOD
         rk2g==
X-Forwarded-Encrypted: i=1; AJvYcCVFkkuWLmaDdg7HkG3kkxv6gF8kHZl830MJ+VdTFjgqfHxmp6y+tETH9+WjdeOq210E3aU4MONzdWsS@lists.linux.dev
X-Gm-Message-State: AOJu0YyFdGO6h/na668xd/Y66Ql0Wpv0weSr9qTFXrgtiuV12GjIsQq3
	AEcS0pA3uUJ/Gq2H/vjGpyZ1NTn6jLW3B8h6uTGenl6ht8X2YLfu+p50xhiK8QHh6GrreqEsgpN
	k2an7/Q==
X-Received: from pjro9.prod.google.com ([2002:a17:90a:b889:b0:34c:567d:ede4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:270d:b0:34e:808c:95eb
 with SMTP id 98e67ed59e1d1-354871bef6bmr1029972a91.32.1770167792234; Tue, 03
 Feb 2026 17:16:32 -0800 (PST)
Date: Tue, 3 Feb 2026 17:16:30 -0800
In-Reply-To: <e3feb0224cf2665a71ba6147e4e3e3bb30f96760.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-5-seanjc@google.com>
 <f9f65b0fad57db12e21d2168d02bac036615fb7f.camel@intel.com>
 <aXwJIkFJw_4mRl70@google.com> <e3feb0224cf2665a71ba6147e4e3e3bb30f96760.camel@intel.com>
Message-ID: <aYKd7qSExlJrbolH@google.com>
Subject: Re: [RFC PATCH v5 04/45] KVM: x86: Make "external SPTE" ops that can
 fail RET0 static calls
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"sagis@google.com" <sagis@google.com>, "tglx@kernel.org" <tglx@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	Vishal Annapurve <vannapurve@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026, Rick P Edgecombe wrote:
> On Thu, 2026-01-29 at 17:28 -0800, Sean Christopherson wrote:
> >=20
> > Hmm, that's probably doable, but definitely in a separate patch.=C2=A0
> > E.g. something
> > like:
>=20
> I think it would be a good change. But after more consideration, I
> think the original patch is good on its own. Better to turn a bug into
> a deterministic thing, than an opportunity to consume stack. Seems to
> be what you intended.
>=20
> Another idea would be to have a variant that returns an error instead
> of 0 so the callers can have there error logic triggered, but it's all
> incremental value on top of this.

I don't like that idea, at all.  First and foremost, I don't want to litter=
 KVM
with WARNs for things that simply can't happen.  I'm fine adding infrastruc=
ture
that hides the sanity checks, but I don't want to bleed that into callers.

The other aspect I dislike is that returning a specific errno could lead to=
 all
sorts of weirdness and hidden dependencies.

All in all, I think we'd be increasing the chances of creating bugs just to=
 harden
against issues that in all likelihood will never happen.
