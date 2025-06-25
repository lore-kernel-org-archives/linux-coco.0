Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5CA20012B
	for <linux-coco@lists.linux.dev>; Wed, 25 Jun 2025 21:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750886846; cv=none; b=dtGtWRADz0HQL0jGalVQbINbtexlaE25ST2dXe/sAUNJDmGAtL/rsqM1y25RNlPtwPRmHQ48xudwOSn8Xnr3+mnIy4TNENxxukVVWnVuNmrwHegBLtatNBhyNKc49rq3fKrUDe7Zp9GZX35nABMXXHWcheTa+g9zjCAncfi88OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750886846; c=relaxed/simple;
	bh=5/AIDMzcp9aAn9GVVD2wKIiPIrXAOBeyMNI9k6+uBv8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oILEYFN0u/LgYjCdw/AqKkLv5fmOwMkNff0X0m3W0iasYJ2+dHsNY2YKIftjOKHQ+8KOeQ6bIdfoHw4mICf4hBTCXA1RUla2lnmXuZGdJlJ9Vrz7fgKJ1adqLH5+Ef/AR5rcMIngv59lc+kPiiB7THRyqjVmA29fSTJjC0kyS2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gysbuZsw; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gysbuZsw"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so335606a12.3
        for <linux-coco@lists.linux.dev>; Wed, 25 Jun 2025 14:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750886843; x=1751491643; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDkUH/8hPd96nHKcCj5ct66aFf82AL3mnAQ30uxk9O8=;
        b=gysbuZswrAfN674oT9Z6Rsy7g3cLs27w3j0maweEh3sp7YGbBDAIEt0JrtUvTNel5G
         A6hdF5sC/eh4dlAV4xs0GPP1NGvGi+yJtt58RYjHs41FH6g+KnZSjYjOUxoaNVoKyk7r
         vodbPreghgG41VUKXXuQ5CtfarzfG6/MJhxaDeGAUmtd5U4d2vCww1nY0jGcV3/YVWyf
         u7KsvWWdGyJBbyjFbH50RcnGzGCSdz4cgTjCWim/f32tR+bYDBJWg6uKxcrbA6O0EiS5
         xtm3ubPSTcaSHiRMKk4vyZzkZX+wmoQQqMl6R9XS04tF0UsF4J9b9x0/RXLKCCsmz/BB
         jYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750886843; x=1751491643;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KDkUH/8hPd96nHKcCj5ct66aFf82AL3mnAQ30uxk9O8=;
        b=QOo9qp+jVI43rrmfI892h5/L942c898UIULiz2ZrHXP7MfuGsw3kupKD5mqU8GFhfQ
         2MkMcmuwhGPIVKG73ZVsUkPAnqW/2U9HTeeKzKK26r1s0B/FJRWVsZDiixfx5kNT7PMg
         4ilPky6SwRESmJ4Kpm07DHDwZZ7Isy5QNiov7yPUzCCdq1JVI5JmuUowkIs9lEMQDeKK
         M2hpnnWBy+wuUNmp1oDbbAm6NeRGv2Zh4avcAG6aA5JC20MypO5KqleLcKnqcCgWvREj
         nAIMpxa8kecPGENzHlygwhYZF3Co5+o5UBmfDIgSw4PqJiXz9SXpYk9ZqeglH2sAi3+i
         Ywaw==
X-Forwarded-Encrypted: i=1; AJvYcCWhGBQ6OcPoZWJ8KvtIF+n3ct3bmmqozLomaydPhgkn5FAIaj59HtMGPGaDeI4ootbJHlVIfSoonVku@lists.linux.dev
X-Gm-Message-State: AOJu0YyhPwBFo0y14+Egmn4cCWZIPHtQ+bClPo5bQeHw21CELCzC/pT4
	bIi5QnNqBuoZwLnnQ702uJSlEWCuibuzr6E/Tn4rrLufiNtHZwGjvThRa8MCLK7O27FEVZCJnv/
	OorYfPQ==
X-Google-Smtp-Source: AGHT+IHnNSiQClR98Tu2DIjJN0yUuPOY+tZ7wsPVNu+SogPTpvB/xoqOJtGyrrKUyaCs7hclUXM8so0Z7ms=
X-Received: from pjboi14.prod.google.com ([2002:a17:90b:3a0e:b0:2ff:6132:8710])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1aab:b0:235:eefe:68ec
 with SMTP id d9443c01a7336-23823fe1d8dmr78782915ad.19.1750886843038; Wed, 25
 Jun 2025 14:27:23 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:27:21 -0700
In-Reply-To: <d897ab70d48be4508a8a9086de1ff3953041e063.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
 <20250609191340.2051741-2-kirill.shutemov@linux.intel.com>
 <5cfb2e09-7ecb-4144-9122-c11152b18b5e@intel.com> <d897ab70d48be4508a8a9086de1ff3953041e063.camel@intel.com>
Message-ID: <aFxpuRLYA2L6Qfsi@google.com>
Subject: Re: [PATCHv2 01/12] x86/tdx: Consolidate TDX error handling
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Dave Hansen <dave.hansen@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	"bp@alien8.de" <bp@alien8.de>, Kai Huang <kai.huang@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025, Rick P Edgecombe wrote:
> On Wed, 2025-06-25 at 10:58 -0700, Dave Hansen wrote:
> > > --- a/arch/x86/kvm/vmx/tdx.c
> > > +++ b/arch/x86/kvm/vmx/tdx.c
> > > @@ -202,12 +202,6 @@ static DEFINE_MUTEX(tdx_lock);
> > > =C2=A0=20
> > > =C2=A0 static atomic_t nr_configured_hkid;
> > > =C2=A0=20
> > > -static bool tdx_operand_busy(u64 err)
> > > -{
> > > -	return (err & TDX_SEAMCALL_STATUS_MASK) =3D=3D TDX_OPERAND_BUSY;
> > > -}
> > > -
> > > -
> >=20
> > Isaku, this one was yours (along with the whitespace damage). What do
> > you think of this patch?
>=20
> I think this actually got added by Paolo, suggested by Binbin. I like the=
se
> added helpers a lot. KVM code is often open coded for bitwise stuff, but =
since
> Paolo added tdx_operand_busy(), I like the idea of following the pattern =
more
> broadly. I'm on the fence about tdx_status() though.

Can we turn them into macros that make it super obvious they are checking i=
f the
error code *is* xyz?  E.g.

#define IS_TDX_ERR_OPERAND_BUSY
#define IS_TDX_ERR_OPERAND_INVALID
#define IS_TDX_ERR_NO_ENTROPY
#define IS_TDX_ERR_SW_ERROR

As is, it's not at all clear that things like tdx_success() are simply chec=
ks,
as opposed to commands.
