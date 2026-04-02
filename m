Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1263381AE8
	for <linux-coco@lists.linux.dev>; Thu,  2 Apr 2026 23:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775172948; cv=none; b=YBcuXNGipNhTLPWBjjPsWLcctpth3YYXfd+Hs4xUbI9l4avzvXyNMsxaF/6M4Gp+X9e+4JM/dtmlvVZDgG+wTGB9gkCIzZrZGAzlYFpA+fZC7r+ChbD5NDQsYiFty57KcygMfKeQiumt9soNQ3U5GOa3+Z66Wl8ixR3ADY/l9AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775172948; c=relaxed/simple;
	bh=qTEpyjbyHUq8In6TOKNr9toPTGYwjz+iaKpJIBBuxJc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cwc1KIyF+K3M2E3qTH1vzf+B2DGvpfgig1kB2hxhUAp2EoqApeziaLbHS3zdfmLUjJ8hMUQ87WB1HS3dEcie3pg7OEvRA0GHcG9cu+03hCgO10NUF3wLFNedPvSxf6M0TglwCyGcAyOlWZda1AV7EgpaBScQBEDiV6HGemsT4kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IxEuSbhh; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IxEuSbhh"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so923670a12.1
        for <linux-coco@lists.linux.dev>; Thu, 02 Apr 2026 16:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775172946; x=1775777746; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xt03N7DxSFnebsLjUZPOloGXKpbWKI0ZYVGhb08HfFU=;
        b=IxEuSbhhThiw+nCc/8vlXn1dZtoF24OvQJ9X4zDQ0FVchLZabd1KXvnoK0rdvuKLAX
         yT/HW1VZeBAG/vubP3C5YmjjGnX9p1VH8iwFEJTyBADHXIonVFwtd6irXifKxpV0EGdP
         rENoHQziLxdomRPwhO3t2vyLOXgTMnMrdiNUl+k34HJ6o4aFLv0+eAAmQqCN8IK+WzDC
         +CJTVJt8QJCCgIXAdCAHZ3P7Sm2loxSxUDyEev6z52UeOwM8VdQovHOtp9l9dmlCye60
         pf526xlfUSfsjjuk0LQQL6Oqhvg+CBOWaCZufu1ey503MuyHYsnCgE0bt6sdpPQ5VW91
         Goew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775172946; x=1775777746;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xt03N7DxSFnebsLjUZPOloGXKpbWKI0ZYVGhb08HfFU=;
        b=cSB2LdmAU/tQssnUEd73b3YGZkM8DM0aG/4t2RN4KKg2LotPOFuaNr40vXNzZidcMs
         4/My5UBg+7ICw4iQ9pvdb6fuppMB9RxAmrLxwm7EYDeJ4k6KG0bPScMfCQy8Gj+K/k+f
         ElPc65g53lwqgr41TzHmFSFF0r1eg8S6NF2AKIY4fdM1IJIJHsVH4bXBzpAxPhfN8HUr
         Fvgx7e9qCT8coL+SIrnMhmeki6r8ASER/XDLtSz3/7Z1XrSmHX6DoCfRvQ778BJAlBcI
         +t/ZU8XaSmOvA0BCp9HlZ2gINVoks1gjDJxD7JO7LlxI/GsjRX59JtaHCCR1ckNgWkc3
         nrcg==
X-Forwarded-Encrypted: i=1; AJvYcCWtpWrrXSbGsWjW2mlRQPpDsTQV7LBfacyR4S0im6TWcAmXF3lALLrHLcEL54dxsYULnDZznzEjjRlG@lists.linux.dev
X-Gm-Message-State: AOJu0YwDVeSXAEpHyZqCd6twq6uL4WqOds+Wbga7C6YhGmQ60CPV0HAv
	vrN9/4QZQkEONRiWeNgbr4rYYh4q11Id8WyStjGJdc1cyxuNiesZFaZYjzSv/mN234nDm+kxxOl
	RdO/rAQ==
X-Received: from pgcv5.prod.google.com ([2002:a05:6a02:5305:b0:c73:9a1a:387d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3951:b0:39c:50b4:cd50
 with SMTP id adf61e73a8af0-39f2f19b018mr622103637.61.1775172945555; Thu, 02
 Apr 2026 16:35:45 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:35:44 -0700
In-Reply-To: <CAEvNRgGknoP=QscA-efLB0LSS03XttsdN3v0KBVROAXTknAakw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260319005605.8965-1-yan.y.zhao@intel.com> <20260319005703.8983-1-yan.y.zhao@intel.com>
 <CAEvNRgGknoP=QscA-efLB0LSS03XttsdN3v0KBVROAXTknAakw@mail.gmail.com>
Message-ID: <ac79UM6t0Y0pWoRO@google.com>
Subject: Re: [PATCH 1/2] x86/virt/tdx: Use PFN directly for mapping guest
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, pbonzini@redhat.com, dave.hansen@linux.intel.com, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, kas@kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, kai.huang@intel.com, rick.p.edgecombe@intel.com, 
	yilun.xu@linux.intel.com, vannapurve@google.com, sagis@google.com, 
	binbin.wu@linux.intel.com, xiaoyao.li@intel.com, isaku.yamahata@intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 02, 2026, Ackerley Tng wrote:
> Yan Zhao <yan.y.zhao@intel.com> writes:
> 
> >
> > [...snip...]
> >
> > -u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, struct page *page, struct page *source, u64 *ext_err1, u64 *ext_err2)
> > +u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, kvm_pfn_t pfn, struct page *source,
> > +		     u64 *ext_err1, u64 *ext_err2)
> >  {
> >  	struct tdx_module_args args = {
> >  		.rcx = gpa,
> >  		.rdx = tdx_tdr_pa(td),
> > -		.r8 = page_to_phys(page),
> > +		.r8 = PFN_PHYS(pfn),
> >  		.r9 = page_to_phys(source),
> 
> Perhaps in some future patch, are we considering also passing pfn instead of
> struct page for source? Would we also update kvm_tdx->page_add_src to be a
> kvm_pfn_t?

Probably?

I assume you're asking in the context of in-place conversion, where KVM will
allow a single guest_memfd page to be both the source and the dest?

Right now, KVM requires the source page to be a GUP'able page, specifically so
that KVM can obtain a reference and ensure the page isn't freed until KVM is done
with it.  If/when the source and dest are one and the same, then I don't think
we'd want to GUP the page (and there would be no need to since this would all run
while holding gmem's filemap_invalidate_lock()), at which point, yeah, passing a
"struct page" doesn't make much sense, and passing kvm_pfn_t or u64 or whatever
seems like the obvious choice.
