Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3D236827B
	for <linux-coco@lists.linux.dev>; Tue,  3 Feb 2026 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770149567; cv=none; b=Sx7lgtbSVML70OqgXjc/NcOlrqdpKAYhswbzT9Lln8Hun00FDRjVeEqguxV/5LfzMSw+i9O31Mlja8eeIFPGIPsnQo7JsZ8IM040hQKHBWkcM/KmWKlJqMLaLE0dZAZnidXwmx/YyVtG8dvfq957p5iI+pVEMZqX1mie4E6zY1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770149567; c=relaxed/simple;
	bh=FIof7DYQ8YAnpUNQ255+qFKJqv7JLf9E6vtY6I2uHL0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a3JvWsNua8h++0qZm0X+7CN2wS55Duxo/uRp7p/7ZMoGp7z77xkcnfTy9hlqYkCRHdxQP87KWxqt2tXFNQH+AvdXRURf7G3l5rE46KExMHF4xj3s8b8PUgvXhGgRdBMXNvoDruHUAwwjWqFxEKXkCmY4jFbG+bgB882j7juChew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WQQzmG0m; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WQQzmG0m"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c54e81eeab9so43763a12.3
        for <linux-coco@lists.linux.dev>; Tue, 03 Feb 2026 12:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770149566; x=1770754366; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6/I6jJ9cFq/C0EPaMkedZtBiJ7Dv2IDfYAyyp9jzoo=;
        b=WQQzmG0mK4PZYY0PviIxTRP/UJJJRB9FiW0rCbwaWBOD91UHs7NwV3xNnyByS/pyfo
         fjBGt9m8wFqNh2ltMwU9onbLHrTIVgkEAYzD16IaKs/Y/q0Id+qeM6kuGOwRokmIJkCz
         gP4g3vyblzUGiSU2znX/SuYBHmWnOpRsVCSZr0qe4qVZgOrAsegxl39aRqKK/ggUaEiB
         Nv7dJ/IFYomT2EK8wJisKCZS6tlZv8D0aFiNtQkd4coa60KVKGxQ1te5DQhL/T+Bo1zd
         gD0REXiFF0bAokHadFfUxnoKCc0FKoYTwQv6leKxLE4ixXzxFCeuSBRjyC7nZtvj18dC
         GYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770149566; x=1770754366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6/I6jJ9cFq/C0EPaMkedZtBiJ7Dv2IDfYAyyp9jzoo=;
        b=I4z5O/baJbZrufn4M1NMbZQiwpH3SZN895ZuDg1skAIEAly/Yk2OyWuuG1RxdX+GT4
         eu7vPM9cnmQW5THQe/Cm+2t2gazQsJjOZyEPjfh9JuJXNM/fob6660SUADdjHuM4j/hU
         x8M0b3Oimv0KHuYohk+xqcm+qxsTuPx9WsBnYM/kPToAlHnT8phCKxyL428Uy3g4/nyU
         4muZXcS5fZ70vFFKPliJaCF6dEpKJ8GpecREjvy6+nmGyYYApAXZS3Eitk5TAQ+pKbo7
         Ze6VOqnwz6Zmjmk78PgLXDNoVlb812z25HYknC/T/TWrtfI42uEWGv24RsVt2FkPlDGU
         h4sA==
X-Forwarded-Encrypted: i=1; AJvYcCXoDfUTtb8bpcexQy5x18aqeHPyPWp/oXZGzfhaT/jk9BJvPBSWMoUTmSDRZ6PgSnI/epzbB7AmKrS/@lists.linux.dev
X-Gm-Message-State: AOJu0YwFtlQTs0nuYfzBNkI7w40r1xi/F/gBaYOmOp+DLL2Kes6+y9vA
	kcY9W9mcZiP8gd6Vwf7ldDN0snUiOGgRJ+nlmn4SY83bC70PMcnULn2djLcefmcUS/Uy8x9HBSl
	1LvsEXg==
X-Received: from ploe16.prod.google.com ([2002:a17:903:2410:b0:2a3:1bf9:d25])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:194:b0:393:372c:dedf
 with SMTP id adf61e73a8af0-39372498a63mr518728637.68.1770149565819; Tue, 03
 Feb 2026 12:12:45 -0800 (PST)
Date: Tue, 3 Feb 2026 12:12:44 -0800
In-Reply-To: <de05853257e9cc66998101943f78a4b7e6e3d741.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-20-seanjc@google.com>
 <de05853257e9cc66998101943f78a4b7e6e3d741.camel@intel.com>
Message-ID: <aYJWvKagesT3FPfI@google.com>
Subject: Re: [RFC PATCH v5 19/45] KVM: Allow owner of kvm_mmu_memory_cache to
 provide a custom page allocator
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"bp@alien8.de" <bp@alien8.de>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "sagis@google.com" <sagis@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 03, 2026, Kai Huang wrote:
> On Wed, 2026-01-28 at 17:14 -0800, Sean Christopherson wrote:
> > Extend "struct kvm_mmu_memory_cache" to support a custom page allocator
> > so that x86's TDX can update per-page metadata on allocation and free().
> > 
> > Name the allocator page_get() to align with __get_free_page(), e.g. to
> > communicate that it returns an "unsigned long", not a "struct page", and
> > to avoid collisions with macros, e.g. with alloc_page.
> > 
> > Suggested-by: Kai Huang <kai.huang@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> I thought it could be more generic for allocating an object, but not just a
> page.
> 
> E.g., I thought we might be able to use it to allocate a structure which has
> "pair of DPAMT pages" so it could be assigned to 'struct kvm_mmu_page'.  But
> it seems you abandoned this idea.  May I ask why?  Just want to understand
> the reasoning here.

Because that requires more complexity and there's no known use case, and I don't
see an obvious way for a use case to come along.  All of the motiviations for a
custom allocation scheme that I can think of apply only to full pages, or fit
nicely in a kmem_cache.

Specifically, the "cache" logic is already bifurcated between "kmem_cache' and
"page" usage.  Further splitting the "page" case doesn't require modifications to
the "kmem_cache" case, whereas providing a fully generic solution would require
additional changes, e.g. to handle this code:

	page = (void *)__get_free_page(gfp_flags);
	if (page && mc->init_value)
		memset64(page, mc->init_value, PAGE_SIZE / sizeof(u64));

It certainly wouldn't be much complexity, but this code is already a bit awkward,
so I don't think it makes sense to add support for something that will probably
never be used.
