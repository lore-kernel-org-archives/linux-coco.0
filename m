Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755642848A
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033534; cv=none; b=E5X+n2Cc6PsdGZK4DvdBfgYD4OLAyU2bmKDsTQyFeqmlzh4qGeA53ojDoG3w9wobjnUgxtolhSy5Y/ZjA+BlkxpMzM70fAkAkEnfboEOelk5X0Jq+m0kFZfNsDRilqfhgkHmgv4IYQwyqphgZI7h9jT/RDokEnK5qhL16RPscjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033534; c=relaxed/simple;
	bh=tWIojze7Uj2EM7vNRu2AjQDw+wemuXBR7n+CBdw4tjY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k+X4qLZy4nxAmtCHtZQMa9iUZlPKC1fnJtwaqRt83zQ7Ob3+sVKRt3Sv10KPCVjh8ltjUHSy7Oebfj03y/S4SOMMBeYtJHR8pgN5GEs9AFnEuciqd8Q7lr0qekwnHS0BNjjnd47TGWZJBP+s3abmG+RT0LZQVrWqyCw/Io2tjk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N8mrnUWG; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N8mrnUWG"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29f29ae883bso1924555ad.3
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 14:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769033527; x=1769638327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6X4IkRQuNjfo8L0KHGq4+kOsjjdeSYBGnFI9g0tePg=;
        b=N8mrnUWGzRt+cV0+vLPfU7CzzAtEysL1nqp0M2k3zqkm58JZoih9VSwCzda15DEoVp
         4IMrN8fOBf4ltTBkarX+u0bK/gIUnWhuI6f+2NjDpla3eZliBhnhyaEB5vi6Y49o8/eo
         BVhgDkWVQPBUKvH+f6n+CZ9qsKj4z1J0BaGKkGn8k0UtxYjEFkxWPXW8l8NpihdZrUqX
         9beICS0/fmabABzfUAHqoLj6VRcKMRV2NxSkzJPMnKmlLqy+IEF+ztHp3a8GDUlRFzp8
         yCixRoQO0vs3J2EyfaamG+sOjVxywI0emDSIHtjCyTKPC5tG65qXhdOwAaQMifi8nOoE
         C4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769033527; x=1769638327;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C6X4IkRQuNjfo8L0KHGq4+kOsjjdeSYBGnFI9g0tePg=;
        b=spw6SxUp4eYdALAZCBhUvzP83LGjJAY5x/vDvh45s7NDigmQCdwnMP+seXzWA/cTlh
         iHFKmaLTRt+nxC/vVxg2mr0r/xkMLgZMXEsiILXsA+wCgQCRf6sneXYplqQiHWmCxQIz
         bFG1ZQ5343wvGYfejSTzw/vI539KPLzyJjMy9Vi1BQMdisRKGdepMHIsEiDyohPjXRsL
         pl1D2/KxwMqg5TkJnAURGDX5a1CbpcU+qStn8lKF4xzn6neQZBfKCB6b1i6ZqxIFXSIs
         jR6xuO/cQ8PvjmgUKKhp2S942l6YDcpzXoCd0Sxf3agMc8d3rg/qf8bndJyD19Z/K/ty
         RaSg==
X-Forwarded-Encrypted: i=1; AJvYcCWF84DBjhirteFjUd9fZHlYrELfo+LzFzMP1qyUhENhuYSJk5LSoecjGh0kHms6LGftVSzyXOU+6roj@lists.linux.dev
X-Gm-Message-State: AOJu0YyECMNEWMwrnhznuUZ57YE33tjy3p7Zx9ftk6dDBlMXMpLFKNET
	s5754aurVjW2P9YfsYpBNNhVDE7zFE/KOHSm4S3uJPvH5w6qMme+ep2E+b9J9kCHTBbdOOO54gL
	WtqNYzw==
X-Received: from plch11.prod.google.com ([2002:a17:902:f2cb:b0:2a7:61b8:be8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:9ce:b0:295:fc0:5a32
 with SMTP id d9443c01a7336-2a717518e27mr198109225ad.3.1769033526812; Wed, 21
 Jan 2026 14:12:06 -0800 (PST)
Date: Wed, 21 Jan 2026 14:12:05 -0800
In-Reply-To: <24665176b1e6b169441c9f6db9b5d02d073377a4.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
 <20251121005125.417831-12-rick.p.edgecombe@intel.com> <aWrdpZCCDDAffZRM@google.com>
 <24665176b1e6b169441c9f6db9b5d02d073377a4.camel@intel.com>
Message-ID: <aXFPNbCvKURxby1q@google.com>
Subject: Re: [PATCH v4 11/16] KVM: TDX: Add x86 ops for external spt cache
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Dave Hansen <dave.hansen@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Chao Gao <chao.gao@intel.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026, Rick P Edgecombe wrote:
> Sean, really appreciate you taking a look despite being overbooked.
>=20
> On Fri, 2026-01-16 at 16:53 -0800, Sean Christopherson wrote:
> > NAK.=C2=A0 I kinda sorta get why you did this?=C2=A0 But the pages KVM =
uses for page tables
> > are KVM's, not to be mixed with PAMT pages.
> >=20
> > Eww.=C2=A0 Definitely a hard "no".=C2=A0 In tdp_mmu_alloc_sp_for_split(=
), the allocation
> > comes from KVM:
> >=20
> > 	if (mirror) {
> > 		sp->external_spt =3D (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
> > 		if (!sp->external_spt) {
> > 			free_page((unsigned long)sp->spt);
> > 			kmem_cache_free(mmu_page_header_cache, sp);
> > 			return NULL;
> > 		}
> > 	}
>=20
> Ah, this is from the TDX huge pages series. There is a bit of fallout fro=
m TDX=20
> /coco's eternal nemesis: stacks of code all being co-designed at once.
>=20
> Dave has been directing us recently to focus on only the needs of the cur=
rent
> series. Now that we can test at each incremental step we don't have the s=
ame
> problems as before. But of course there is still desire for updated TDX h=
uge
> pages, etc to help with development of all the other WIP stuff.
>=20
> For this design aspect of how the topup caches work for DPAMT, he asked
> specifically for the DPAMT patches to *not* consider how TDX huge pages w=
ill use
> them.
>=20
> Now the TDX huge pages coverletter asked you to look at some aspects of t=
hat,
> and traditionally KVM side has preferred to=C2=A0look at how the code is =
all going to
> work together. The presentation of this was a bit rushed and confused, bu=
t
> looking forward, how do you want to do this?
>=20
> After the 130 patches ordeal, I'm a bit amenable to Dave's view. What do =
you
> think?

IMO, it's largely irrelevant for this discussion.  Bluntly, the code propos=
ed
here is simply bad.  S-EPT hugepage support just makes it worse.

The core issue is that the ownership of the pre-allocation cache is split a=
cross
KVM and the TDX subsystem (and within KVM, between tdx.c and the MMU), whic=
h makes
it extremely difficult to understand who is responsible for what, which in =
turn
leads to brittle code, and sets the hugepage series up to fail, e.g. by unn=
ecessarily
mixing S-EPT page allocation with PAMT maintenance.q

That aside, I generally agree with Dave.  The only caveat I'll throw in is =
that
I do think we need to _at least_ consider how things will likely play out w=
hen
all is said and done, otherwise we'll probably paint ourselves into a corne=
r.
E.g. we don't need to know exactly how S-EPT hugepage support will interact=
 with
DPAMT, but IMO we do need to be aware that KVM will need to demote pages ou=
tside
of vCPU context, and thus will need to pre-allocate pages for PAMT without =
having
a loaded/running vCPU.  That knowledge doesn't require active support in th=
e
DPAMT series, but it most definitely influences design decisions.
