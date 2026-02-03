Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10CC2D9499
	for <linux-coco@lists.linux.dev>; Tue,  3 Feb 2026 20:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770150729; cv=none; b=fhmO2MdUR6C3jqlqKAC0XJJr5oVDyUvPEfod2IeDcSrYRjHgEAo/5Cya6sBOuK1Vq4fLdglYv/9WWUJ9cpz9YZuh/NSj6kT8o57d+1wDz/PiMNIxmHLmVr6GK7iJtWDDcWViXWUf5FbDOV1lLNnREKir5oblm735yIbHSnakkNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770150729; c=relaxed/simple;
	bh=bKHWA8su8QIXIXtDVlgoocC0CLqf6RJFADPLXMN6Yqg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YOQnsOjS6gUZKDbv8ypfaK9whW0CKXYvgwoZLARCUIYt4XG3ZezwF49SgKTBuRFS9sOnmlTZ2auk3DUK1q7MjbFdJjkLW5wsLZ2PL2uY5A6TqCesjk7/3b6esACZa4TzNjr68C2i+/HA7osnZKr8azZqeGikh5pB1P+QdpCkydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OirPO8T7; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OirPO8T7"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29f1f79d6afso67376325ad.0
        for <linux-coco@lists.linux.dev>; Tue, 03 Feb 2026 12:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770150727; x=1770755527; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sro3VZZ5Btk693WGQpZmCjZMxNDIjNnXRKqN3fdBlbA=;
        b=OirPO8T7KxBCCZWDtuDaEwlCWlCJDspDXiEuoxnt5LaPiqTgKWsJTespP5LqAlENFJ
         QkHVXHiZ6xJZ3NxR4wWwoGZUZCv6/xMKDHomSkrkScJW1rQMkxBOrlQPsd0+za/0t48j
         Kp1CAOOBuIiOoIeL2RgMerY1meYQAftLgE0wPqTfyeihXR71jeVpwCXx9lhpHOPSoEfs
         cl3dPDZRSlhpq7Tnz+xuM+Ip/lguzakMPqEdT+smiptJup1hDgUAWu5+pAuNM/Gq+fmw
         tEgAcP4JdKnV601yxOulds9M0DXnVLmxn2Aa3K6G8cyUyBCdzappzXgkmduE/HmGF/ov
         T3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770150727; x=1770755527;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Sro3VZZ5Btk693WGQpZmCjZMxNDIjNnXRKqN3fdBlbA=;
        b=JbAMbsMXmbwaB9hexAmy6py2SC/zdkN+hRnyoFXNIvONKmrg9IisyyZNk342n7jgsG
         jyD2ySs2KgLBD2gi7ERG9VcCd4H13KhxIti6wIfKqyyk49i1zM+QElcUcodubdE1gLza
         gSmc+HKgwqhBt2MrZ3eJkhQetxawp3YclX/Q9KavnKO8nRxHrWs35wiDNHJrTcg72pW2
         3grRteW5Dl3TOTUjW/lK8UldpjFL2UUaNP/ynJN9KXYgRRLSCYP8sadPx7oze0ry59w6
         +COt3eOJhLRmun7x951hJO7CDlIC+ZZFGVvjLTa2PnMri3ee01XqKRtZ99uoYyYXuWTZ
         ajvg==
X-Forwarded-Encrypted: i=1; AJvYcCU47N+ZRdZgiq3r+6Wyo/UNvZqzyYgPkAqjVQRrmBfL86hy41r7JHQieLkfaNttTKPH5k+YbXCuRKHO@lists.linux.dev
X-Gm-Message-State: AOJu0YwsbCxcHXAFdzDHNIdR86oMfq3FjuOVsql9RZCy71IJUd+QrsP6
	tuU3KSTE3Y81y99kfKRXCSL3NQ2xd0J1ObZ+goAw/CyfH80hD/v5l0sDIfWqjtSR8bIhcmU56ci
	QKg9xdg==
X-Received: from plav14.prod.google.com ([2002:a17:902:f0ce:b0:2a7:6eb5:7e34])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e807:b0:2a7:b8f9:5a5e
 with SMTP id d9443c01a7336-2a933feb333mr5180435ad.46.1770150727058; Tue, 03
 Feb 2026 12:32:07 -0800 (PST)
Date: Tue, 3 Feb 2026 12:32:05 -0800
In-Reply-To: <8c5aca4bacb31475a510e6a109956e7fa4a63de5.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-12-seanjc@google.com>
 <cd7c140a-247b-44a7-80cc-80fd177d22bb@intel.com> <aXvEgD69vDTPj4z5@google.com>
 <8c5aca4bacb31475a510e6a109956e7fa4a63de5.camel@intel.com>
Message-ID: <aYJbRTi_Z28F9is-@google.com>
Subject: Re: [RFC PATCH v5 11/45] x86/tdx: Add helpers to check return status codes
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "ackerleytng@google.com" <ackerleytng@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"sagis@google.com" <sagis@google.com>, "tglx@kernel.org" <tglx@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	Vishal Annapurve <vannapurve@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026, Rick P Edgecombe wrote:
> On Thu, 2026-01-29 at 12:35 -0800, Sean Christopherson wrote:
> > On Thu, Jan 29, 2026, Dave Hansen wrote:
> > > On 1/28/26 17:14, Sean Christopherson wrote:
> > > ...
> > > > =C2=A0=C2=A0	err =3D tdh_mng_vpflushdone(&kvm_tdx->td);
> > > > -	if (err =3D=3D TDX_FLUSHVP_NOT_DONE)
> > > > +	if (IS_TDX_FLUSHVP_NOT_DONE(err))
> > > > =C2=A0=C2=A0		goto out;
> > > > =C2=A0=C2=A0	if (TDX_BUG_ON(err, TDH_MNG_VPFLUSHDONE, kvm)) {
> > >=20
> > > I really despise the non-csopeable, non-ctaggable, non-greppable name=
s
> > > like this. Sometimes it's unavoidable. Is it really unavoidable here?
> > >=20
> > > Something like this is succinct enough and doesn't have any magic ##
> > > macro definitions:
> > >=20
> > > =C2=A0	TDX_ERR_EQ(err, TDX_FLUSHVP_NOT_DONE)
>=20
> I like the editor friendliness. The only downside is that it puts the onu=
s on
> the caller to make sure supported defines are passed into TDX_ERR_EQ().

Eh, that's easy enough to handle with a static_assert().

> Today there are a few special cases like IS_TDX_NON_RECOVERABLE().

Why bother with a wrapper for that one?  It's a single bit, just test that =
bit.
For me, providing IS_TDX_NON_RECOVERABLE() is _more_ confusing, because it
suggests that there's a NON_RECOVERABLE error, when in fact (IIUC) it's mor=
e or
less a modifier.

> I don't know, I'm ok either way. I lean towards keeping it as in this pat=
ch
> because we already had an error code bit interpretation bug:
> https://lore.kernel.org/kvm/24d2f165-f854-4996-89cf-28d644c592a3@intel.co=
m/
>=20
> So the centralization of bit interpretation seems like a real win.
>=09
> > FWIW, I have zero preference on this.=C2=A0 I included the patch purely=
 because it was
> > already there.
>=20
> Ha, actually we all had a long thread on this:
> https://lore.kernel.org/kvm/70484aa1b553ca250d893f80b2687b5d915e5309.came=
l@intel.com/

Oh, it's _that_ discussion :-)

What I meant was, "I don't have a strong preference between TDX_ERR_EQ() an=
d
this patch".  What I didn't like was tdx_operand_invalid(), because that re=
ads
like a command and it's not at all clear that it's macro-like in behavior.

I'd vote for IS_TDX_ERR() over TDX_ERR_EQ(), but either works for me (as do=
es
this patch).

> I see now that we closed it with you but never got Dave's final buy in.
