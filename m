Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0584C2E975D
	for <linux-coco@lists.linux.dev>; Thu, 26 Jun 2025 15:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953105; cv=none; b=lxqL90FvSh2PAI5ZI99DWoXnePyHzH4i+MWgASppHvMhqvZ5lceCfC0x6qGijVDnshezUV4DfWJD8p3AgPwVUxCyz0Tpdh+xJX+MuYLtZOZ8T46DzLoiva0C/VoBW2ju6HkXSzBQoXGK/IMFJzZiejOj7jNpjZm1b3tyWi4ONO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953105; c=relaxed/simple;
	bh=qXV8ywuWUNO49dqW9kDZJmUe/jHnv66YbBB23QyjjcQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RSWLFJgAwwdF1Zw9h4vD0du3ZkHKUOvojhqMT0c8PL1vuRJjSiZ7QDmwsKfnW4ydwGXUlwg96t5e3IOH6W/24bRQ4vG4Q20wEsZmpr46fqp5P1DrsmJlxlm0t8TtAck+ZDZF9bCJtAAl8p7tvojdUtz+9bxu9nhVk7xcRUbv6Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e2Z2ULt6; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e2Z2ULt6"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso1153654a91.2
        for <linux-coco@lists.linux.dev>; Thu, 26 Jun 2025 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750953103; x=1751557903; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6XW/EqCp3j1f6URWJ4aPoUkrvR+g0bF0hMVqo50f2oY=;
        b=e2Z2ULt6ImNidklKKFJN5EWWs8PINMZsKniTJae6rcrAore6SpQxzjbpzzQfWRh+oQ
         DeKI9aO7fHalCxTRptdsCMxvnbW5whp6oYfSOchtwYziVA9Yb/TnNDbw2O4BySId8c2j
         nxp/8bP32ktBu50jYpKhQP3ZmUvj6PFpbCAY0hig2FWTtS2+1ztVun9i1of1y2+DL0OB
         ITFeOgX64Ht+d0+pC2ZqyBNbT8qsJX3iNpmH9c2heHNnCnTOgyExfyA6xbpbUVETPPmW
         B44AtUZCQCJYF2mZ92EsHOsJPwK8131/5hE1AqROyxWH14+d1Grl/xpW7KlZopdDHfR5
         cCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750953103; x=1751557903;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XW/EqCp3j1f6URWJ4aPoUkrvR+g0bF0hMVqo50f2oY=;
        b=WgUnvUWV5vs6K6d3+p7F9OS0R/+0rreEooVk7vewEQr70zW8JvaZ0BhjSS5krm10OS
         5cXZ+tD2UCvbZsNr9cvRf7jNfwiEVZtKv0xJm55/7gpl0rqMtRiSZdjNGo7qQG+L0PLE
         KZd3VGePCjLWXfCHwk6OhtogalXtDA3EHKAT+nbZMDi7TtNSSC2WFgAN5pprsYAAWX4D
         Op+6CtX9/58UQSDUKLEC5QjtvuzL/RHMChGXtoJRsQx1IBFEbxHYfYJ/D4aqCsJGgN8K
         HF8IvUjaTPREnJ6SEiRJEFvXwebSSxgFSgViQ3SYhFwRQgxxAY+Xefeep5MFfxGssVNB
         Gckw==
X-Forwarded-Encrypted: i=1; AJvYcCXxjb5pPI/d/dYfR0WpG8lShXi04gvEkTM5nPNo5E7TMdnDlvpNXqvUT998v/YWw3wFhVEvnAuPOjFV@lists.linux.dev
X-Gm-Message-State: AOJu0YxtrTQvcpLFbsrbrz34l0FJB6bgIs8JO9bYW6Lvf/NJbYmqU9ij
	Uc04pDowoUCEW5tytxBm0OEBKJ8ZZI4Rjv0J/3umXboOwHvkLr6pC9Hhgz+DfT4FsRItj7kREwi
	eQNNKKg==
X-Google-Smtp-Source: AGHT+IHC4Drqm7qwalhYbpaZ/EdYOOM+E4RS7ozoWgmrUjHrOdSo3e5wVygc5jxLIu3LTaQIMJLPkowy/94=
X-Received: from pjbso15.prod.google.com ([2002:a17:90b:1f8f:b0:313:274d:3007])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5210:b0:312:e9bd:5d37
 with SMTP id 98e67ed59e1d1-315f2613846mr10091013a91.6.1750953103423; Thu, 26
 Jun 2025 08:51:43 -0700 (PDT)
Date: Thu, 26 Jun 2025 08:51:41 -0700
In-Reply-To: <3e55fd58-1d1c-437a-9e0a-72ac92facbb5@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
 <20250609191340.2051741-2-kirill.shutemov@linux.intel.com>
 <5cfb2e09-7ecb-4144-9122-c11152b18b5e@intel.com> <d897ab70d48be4508a8a9086de1ff3953041e063.camel@intel.com>
 <aFxpuRLYA2L6Qfsi@google.com> <vgk3ql5kcpmpsoxfw25hjcw4knyugszdaeqnzur6xl4qll73xy@xi7ttxlxot2r>
 <3e55fd58-1d1c-437a-9e0a-72ac92facbb5@intel.com>
Message-ID: <aF1sjdV2UDEbAK2h@google.com>
Subject: Re: [PATCHv2 01/12] x86/tdx: Consolidate TDX error handling
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	"bp@alien8.de" <bp@alien8.de>, Kai Huang <kai.huang@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 26, 2025, Dave Hansen wrote:
> On 6/26/25 02:25, kirill.shutemov@linux.intel.com wrote:
> >> Can we turn them into macros that make it super obvious they are checking if the
> >> error code *is* xyz?  E.g.
> >>
> >> #define IS_TDX_ERR_OPERAND_BUSY
> >> #define IS_TDX_ERR_OPERAND_INVALID
> >> #define IS_TDX_ERR_NO_ENTROPY
> >> #define IS_TDX_ERR_SW_ERROR
> >>>> As is, it's not at all clear that things like tdx_success() are
> >> simply checks, as opposed to commands.
> > I remember Dave explicitly asked for inline functions over macros
> > where possible.
> > 
> > Can we keep them as functions, but give the naming scheme you
> > proposing (but lowercase)?

I don't care about function versus macro, but I'd prefer uppercase.  As Linus
pointed out[*], upper vs. lower case is about the usage and semantics as much as
it's about whether or not the thingie is literally a macro vs. function.

[*] https://lore.kernel.org/all/CAHk-=whGWM50Qq3Dgha8ByU7t_dqvrCk3JFBSw2+X0KUAWuT1g@mail.gmail.com

> Macros versus function isn't super important. I think Sean was asking if
> we could do:
> 
> 	if (err == IS_TDX_ERR_OPERAND_BUSY)
> 		...
> 
> instead of:
> 
> 	if (tdx_operand_busy(err))
> 		...

No, I was thinking:

	if (IS_TDX_ERR_OPERAND_BUSY(err))

e.g. to so that it looks like IS_ERR(), which is a familiar pattern.
