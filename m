Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEE614F6C
	for <linux-coco@lists.linux.dev>; Wed, 11 Sep 2024 23:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726097508; cv=none; b=HHXXO9/h5u/8PumliSoDjK4GCUWxGOE+W30L+E44CQAMwQiv8nIEcKxzc4vOGblHU8ziNN911jFC0/HHxhCIDqbI+441sVsbDrzvXYpzXljmL+FimVy1hEsSxBleYSLCvuLKgvsaM20aVl9NLWsqNvi83rnwWQWzPsK6KAzwwG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726097508; c=relaxed/simple;
	bh=z9U4HbiEuFhGKos1gmTUMjT6OYGXO8JxmAs6sF5RZLg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rzp8J8sqx+kqU6cCpK6c7oOJ95IIbp89TZ5NvQdJ+dbyvgyNMgltp58fzRlyRQh1yIecHb/j7c4pQOAf8tpCMyxElmZYJAjQvftACpp7jzDVqqYmzefRVMezp7umNQKS0BYsWp0gykyrpM7ZfeI6QvIFGQ8VmuAeQW/qxIOHhKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fMr71ufK; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fMr71ufK"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-206f405f453so5847865ad.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Sep 2024 16:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726097507; x=1726702307; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pHnlH+pH4QGhSAdS+6z8R3FVfMy6IzZKMdnVMkZg7oo=;
        b=fMr71ufKNyoFEK30E2+0qhAqH6a5nOYjLo2geafW1FqoMU1KDSoNjDEMzDZS/g5G9y
         Y/VbI4+V2V58nexmBKi98cHFqVgOINz9jirlQZgcE5Ag0MPPehR2IU1ppv9VHx3kgHRt
         EcnN83qj0UaLkPSyTEoLISGQTYZRZKJAuJmG2Lag0XtHwQIaqiefrfBOQjxlfRNDqVki
         kYvHfgQXc/EM79rtYY3rN8isRKEjB1wSYYHLCnYguXh5tQYjN15c+i4QlQAEbJ2GFho9
         yz6Q1Fz4/N+YliPaCzk0LyrTpDzPWuCL1NZcoqtQ4s3CvPxUXnqbzKthGDHllKzPUwYT
         JrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097507; x=1726702307;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHnlH+pH4QGhSAdS+6z8R3FVfMy6IzZKMdnVMkZg7oo=;
        b=QtjrwiXhFDN3/2Qreq4cWsgPIdXqANLdRX7Zvbqm9fBaOijS+BTrYNYeIChgVl6hrU
         6c7PNm73Q3BFgyh47mRwoXcQ3Gv1UZmmXv8h7PzUFVpcRj/j2DBWI0JT75iAaQSKEFJN
         jRv1nZp6xvpfObLTlpwF/fGVzxMkLU/SXmgcORkniIqhwqcfxPzkbG5Lhm3zcJqrD5sX
         J6d+GwDM/2FhTQB09IdTwGt1GugtMbfjVUEf7RPjsb0V1i0eYJG2dIA2kXlQJxtuqT89
         yTTqN8mSIbw6H4BVrCEawCaf25kDwbJDFApTVbd9kv3jpCGoudDMTvVZ4As7cEjnv8x3
         z6vA==
X-Forwarded-Encrypted: i=1; AJvYcCVv3PA9TYFrQSi4xrCZn29+n5WP+5MEVnNulG4sYKaKpMC8lemeEbfwSh6L2z/7f7eneuk9DkWaDU4t@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc0l+5PIBLW6AvuSmc99XQJ/kaiTk7gFD63BSTh0RHrta0qFH/
	nbuXkNiMtSqrlcON/5i8uoyrgCaqtQH887JQNHQZEKLPPh33+S/sKsC7jC7OmWEnWlbebBS/a7+
	JbA==
X-Google-Smtp-Source: AGHT+IFNRwx2gTMhNsyitKZnT2yohlwJlFqNdkxyBgStEIKIu3twZqn2Lqc71xWomvSuKolY1sCGDK/a+ZE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c950:b0:206:8c37:bcc7 with SMTP id
 d9443c01a7336-2076e315e2emr484135ad.1.1726097506689; Wed, 11 Sep 2024
 16:31:46 -0700 (PDT)
Date: Wed, 11 Sep 2024 16:31:45 -0700
In-Reply-To: <8e3146250f31db92fa42a29a892858c9ec33aeab.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240602115444.1863364-1-kirill.shutemov@linux.intel.com>
 <8992921e-7343-4279-9953-0c042d8baf90@intel.com> <crv2ak76xudopm7xnbg6zp2ntw4t2gni3vlowm7otl7xyu72oz@rt2ncbmodsth>
 <Zl9sXGj890yerBPJ@google.com> <8e3146250f31db92fa42a29a892858c9ec33aeab.camel@intel.com>
Message-ID: <ZuIoYUnJ9uJoSLzm@google.com>
Subject: Re: [PATCH] x86/tdx: Enhance code generation for TDCALL and SEAMCALL wrappers
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"haiyangz@microsoft.com" <haiyangz@microsoft.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kys@microsoft.com" <kys@microsoft.com>, 
	Dexuan Cui <decui@microsoft.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"hpa@zytor.com" <hpa@zytor.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"wei.liu@kernel.org" <wei.liu@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 28, 2024, Rick P Edgecombe wrote:
> On Tue, 2024-06-04 at 12:34 -0700, Sean Christopherson wrote:
> > 
> > If we're willing to suffer a few gnarly macros, I think we get a
> > satisfactory mix of standardized arguments and explicit operands, and
> > generate vastly better code.
> 
> Hi Sean,
> 
> We are kind of stuck on improving the code generation for the existing calls.
> x86 maintainers don't seem to be enthusiastic about tackling this urgently and
> there is not consensus on how to weigh source code clarity with code generation
> sanity [0]. I think we are going to table it for the time being, unless it's a
> showstopper for you.

I'll survive.

> An option is still to have a separate helper infrastructure for KVM's calls, but
> as discussed originally this duplicates code.

Ya.  Tangentially related to this topic, at some point in the not-to-distant
future, I think we need to have a discussion for how to maintain TDX (and SNP)
going forward.

Not because I want to take more ownership in KVM (I would generally prefer to do
the opposite), but because I suspect there will be more overlaps similar to this
in the future, e.g. if the guest kernel gets cornered into doing some amount
of SSE/AVX emulation for userspace MMIO.  And because I also suspect that future
additions to TDX and SNP will require modifications and tighter integration in/with
subsystems outside of KVM, while simultaneously moving further away from the areas
that KVM has historically operated in, e.g. emulation, feature enumeration, memory
management, etc.

I don't have any concrete (or even half-baked) thoughts, just flagging that we
might want to have a conversation to hash out what we think would be the best
way to operate, knowing what's on the horizon, versus winging it as we go and
hoping everything works out.
