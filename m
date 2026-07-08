Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AD23FCB0B
	for <linux-coco@lists.linux.dev>; Wed,  8 Jul 2026 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549727; cv=none; b=MXRqNSQxNLAckmemalOXl2y8vUTOS7ivoGxFbDSSqt3mx1Q/A/Wpk8PXt8WdDXXBg3pjBguFAyn3v5Rg+B2HFEyeCFg52ZB+UmPYEVIbCbMTv/l+692uGJ32FgriQ5/bSWECwFSqeOxgJs8I4m5JIbjCHLAvN3ACSeM0JA3ilOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549727; c=relaxed/simple;
	bh=qCA37wA3EA6gLbZcSOYMhW0pz2I6zUDqTzOTNLMrEfg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pVYYCW6JDGPvAkoRGsnvhaB9u7zbPZkTP9UO2LFLThUsVxMHcz8PnRa9b8I/MWxrckmNEpAFnEJ7UKaaeWkHO1hpB3fME2i8UQcMnnXJ6OGGtKoQ5z2XPqLzDMquFG+a93kCfkyUJN3weJyB/mtcb2k7EIb7hwNc+DS/jZzj5S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wPkkUUOB; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wPkkUUOB"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8484739a9cbso298024b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 08 Jul 2026 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783549726; x=1784154526; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=413Nqq7+aCGB4j6hzx7bP0Ff/HXDE9aVqFD21FJRzaM=;
        b=wPkkUUOBQSuXjChw0o/ae+yQNYLYia4PtK5ftx3+Qvt7vEhPGekx8pkTH9Dl3BD14n
         L0N5juNbVe6kXqYA160+DxMlSLSd06JYcoZyeWCJDjq+y188mgzEiCj1Fq6GIyLIiHlM
         X5915V6ygT3W0lexxb0H6mwFCWReanVOdDcya8Sg8jWG2Yb5SpQnGzKO5MnLvRtKtp9N
         XSS6RPfRYVUyIRcSCZtTmKhnvWeQ8jfCroq2KlG601CCOutAKrcbOfINHcUCz23ihmd9
         IYQ38aFEpdWYxg+Ao5pVV+RLsb85hKOPjbt4b8qH6cgGAxbNV38nW63YSJd9hyZscD3O
         K2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783549726; x=1784154526;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=413Nqq7+aCGB4j6hzx7bP0Ff/HXDE9aVqFD21FJRzaM=;
        b=odylARqXeT8LXwBDBLWS/qOEfJLVVlMhtvctqvOtmc4TliFv1erf/mYQ5KSznsnaBQ
         smEecm/Ey6VXYqTEQYKYeaOngxf+kbGsjqqwRUaAzXdM1m9k/aI/HWCVy+aKkp0zgmsm
         H+PPVPvmWvAwPt1XeWA5aYRyq5gzDOPI6jqicMRQIOP/wdR7V74mbwA5UNoGipdqGKsI
         rJsstWnj/m4L7QXP4kEMnpxHqlkZ225YTpU72Jxz1/w1Xbb5v8vF6e+alyREAC49WfNo
         UI3QpKD+Ow2gk/J2xe6Rqb19rFQmAlbm5N433R4flNNfeVVj+ORBrQz0S02oxPDZnBZM
         yrOA==
X-Forwarded-Encrypted: i=1; AHgh+RqMhgC098lpgR17TUDK3wycwyHwiLyv39RbII8Jf0HXSh8Y9+TiiFEK/Eu/S1LHSsOMxi5Qr2DzwU8E@lists.linux.dev
X-Gm-Message-State: AOJu0Yy06YeyEFgZfFzvV0ui+GiHuzzOcWXQhshLp1ozktukKV1B/mtK
	M99GTFA1+wYB4EkTcaunSJ5GM2WbtRkZxYIYKUfsxb2wDNKAFC+1LBsz4KgI74rGRKjLCLMJvzx
	d19zi7g==
X-Received: from pfbbe12.prod.google.com ([2002:a05:6a00:1f0c:b0:847:8449:eef1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1a87:b0:845:df5c:2567
 with SMTP id d2e1a72fcca58-8485ab611b4mr183492b3a.25.1783549725769; Wed, 08
 Jul 2026 15:28:45 -0700 (PDT)
Date: Wed, 8 Jul 2026 15:28:45 -0700
In-Reply-To: <20260708220915.GI2169894@pedri>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260629100301.GA1743876@pedri> <akMQ3J6fK3DUBsPH@google.com>
 <23a9173f6e278ca7dfedce3374626c6ea3e1b47a.camel@intel.com>
 <6a445e4be6b12_3a3568100db@djbw-dev.notmuch> <akVNdxCzk-n4bgMv@google.com>
 <9df36c49e6be69dd9eece71f70a404a84b1563ab.camel@intel.com>
 <20260704054342.GB2169894@pedri> <akvsgVjwb00P1EuA@google.com>
 <08c9bf2f-75be-4244-b99c-153ec1f604ca@intel.com> <20260708220915.GI2169894@pedri>
Message-ID: <ak7PHTGEuxAZCvXw@google.com>
Subject: Re: [PATCH v2 16/17] KVM: TDX: Add in-kernel Quote generation
From: Sean Christopherson <seanjc@google.com>
To: Peter Fang <peter.fang@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"djbw@kernel.org" <djbw@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, Yilun Xu <yilun.xu@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sohil Mehta <sohil.mehta@intel.com>, 
	Zhenzhong Duan <zhenzhong.duan@intel.com>, Kishen Maloor <kishen.maloor@intel.com>, 
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 08, 2026, Peter Fang wrote:
> On Wed, Jul 08, 2026 at 01:47:29PM -0700, Dave Hansen wrote:
> > On 7/6/26 10:57, Sean Christopherson wrote:
> > > What is "the S3M" though?  Is it a separate chip a la AMD's PSP/ASP?  Is it a
> > > per-package thing? Per-core?
> > I'll give you my rough software guy mental model of what it is: Each
> > package has its own S3M. They are microcontrollers which are discrete
> > from the CPU cores. Each S3M gets some CPU physical address space routed
> > over to it.
> > 
> > > How is it accessed, and what are the "rules" for for those
> > > accesses?  What types of latencies are we looking at?
> > 
> > As far as I know, the latency for one round trip to/from S3M is on the
> > order of a "real" device. It has a physical address and when the OS
> > wants to talk to it, those addresses are mapped with ioremap(). It's
> > similar to any modern I/O device control plane. Note, though, that for
> > TDX, there's no ioremap() because the I/O is hidden in the TDX module.
> > 
> > The real overhead comes because the I/O window is essentially 4 bytes
> > wide (IIRC) and all the data that comes in and out of it has to be
> > squeezed through that window. It reminds me of a UART, but with a
> > slightly more arcane interface.
> > 
> > For TDX, though, the craziness is mostly hidden in the TDX module.
> 
> I'll just add that this design decision comes from the fact that we're
> looking at different kinds of future attestation stuff. Some of it is
> quite complex (like post-quantum crypto). Some of it may even require
> more complicated interactions with the S3M. Hiding these details allows
> all this crypto stuff to look like just another TDX module release.

IMO, that's not a good thing.  Burying more code and more complexity in what is
supposed to be a minimal TCB doesn't seem like a "win".  I can certainly
appreciate that interacting with the S3M microcontroller isn't something we want
in KVM, but that's why drivers/ exists.

> The host kernel shouldn't be burdened with attestation intricacies, 

Oh, but the kernel has to be, at least to the point where the kernel has enough
information to guarantee backwards compatibility, enumerate choices, etc.  If
you're saying that the TDX module will always generate reports that are compatible
across TDX Module updates, then we probably don't have anything to worry about,
but it seems unlikely everything can Just Work while also updating the core crypto
algorithms and whatnot.

> and the TDX module should just make sure the new module "works".
