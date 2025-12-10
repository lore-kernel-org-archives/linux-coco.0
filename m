Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D24E19F12A
	for <linux-coco@lists.linux.dev>; Wed, 10 Dec 2025 14:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765376421; cv=none; b=q+9UW0hmxZDZiv7tOPg0RMvq/XjjSpKxwlsijMjcUts8ph+xy+Y2C7rYypwmR7zGPcF7LwFrXljW/hPooCAuMhxpGjAYfqsMuXXG1d+JPQNeiPPgCcdz7mdGbXIih/awSDlGS8hgpuq6FDBx47mLaF3AnWT1gZbd+Bi53s/4kT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765376421; c=relaxed/simple;
	bh=73ZN5gVruYdPb08Z7qWkjqs7M3VqgYcIbZtj6Xjrz9c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qC4RAp2VWNeLirTnGBYJNaXI+VShulsw0asjungXN/bxb9lnW5YLXMzRtrWekIlQtg/930SlGTz9vjc7BPKX3yKux/I1GZHTQeQggz8whdvZjB+OLnPXzbXask5cTVa75YPqjMYFptknmreL3Gf1l+BZQyHEtaosAY6jIS9TdhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PNVCihDA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PNVCihDA"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34188ba5990so15868223a91.0
        for <linux-coco@lists.linux.dev>; Wed, 10 Dec 2025 06:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765376419; x=1765981219; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bR+OZ7ucbAcjgpsdh1BcVHBHgTugKNJ+Rip2j8+KG6Q=;
        b=PNVCihDAWKRZelBSLTeVF2KGMjbNMoXfRtmyTDRRAVp96s7cgojCkF3qWGGnRY3f/O
         rd9wF0Bxo7xmsG7k2BWdKUlPNinAncYrDJ9gdVDB8x0jSkJWRk0sAtGbJJdCZrWV5WXs
         BCC+0EVSI7T0xUK2tn2lzOoY8I1ApPbee5WvpzoBp+kAFUKFn7hOst5S8/QGDFoY3CIg
         e6HWDDM1q5PxDkLMQDXjpjvLFh0A/q1dHVSz0pOGJ6UscmtdXVLf3nQkYwoKyzNsKnf3
         BjFwLxMMpvW6+G5i+d02Jrv+qNzDSuG8nompsQQc5BeP1JlsRa5Mfjv34Aq5aLkcyGTm
         ipzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376419; x=1765981219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bR+OZ7ucbAcjgpsdh1BcVHBHgTugKNJ+Rip2j8+KG6Q=;
        b=PkRxiJkaAFe8Z/Kisx/fY1dtn710BvWaqxU7PokHeSWLGubRW9r05Wl8SjD0iL5ngz
         A+FDyqorqTUdLQkeq2CpelW6fGXxpRjNO4J95b74vZqO+CnZyfToINbfLnCNpjHIY75i
         1FABkOOjWF1QCWc5G6ZHY3id0J4kj/lVj8W0s0hii14V9sAM5q6E3DdzMaO5S2tuTbfc
         JsOsZlwzYXWVI3i1hLU9oneODEZXwXl8H99IORFMURx3IY6En0SWFgJsjo88FIIA5uYi
         GSMAvlqJFgymXyt6GssbBeyhtR4F4loqXStGd1lKo8O9kLrjFIYvSJgCEtpc9VtB0T9C
         ww4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOQfYpZcumZY0EjpezKZDtifaQHEblRDZvbBedqMwgHdVgOZVA71VOquS72iEUGitzBAh4rI422O3+@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3MGJYfu33CrlKb747j2elvW1fdxRGcluZySveI9XfqvXazZzO
	TFe7w2Ltfmp9T1461xU8cMWZmn8jcO+P5cycxzESuz1bTHb6GQmDDhBoa+alhb4TGdZZaG5PeA3
	M1WP+8Q==
X-Google-Smtp-Source: AGHT+IFgCI8qg86hbIJn6V9eCwSFHSrGKpYXFjELjD+yHzAQieQGee8BswD5GlPKq6wLYBeFr1bky6qissw=
X-Received: from pjbqc8.prod.google.com ([2002:a17:90b:2888:b0:342:8ef1:9719])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38c1:b0:32d:a0f7:fa19
 with SMTP id 98e67ed59e1d1-34a7285c31fmr2992980a91.17.1765376418861; Wed, 10
 Dec 2025 06:20:18 -0800 (PST)
Date: Wed, 10 Dec 2025 06:20:17 -0800
In-Reply-To: <6939242dcfff1_20cb5100c3@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com> <20251206011054.494190-3-seanjc@google.com>
 <69352b2239a33_1b2e100d2@dwillia2-mobl4.notmuch> <aTiAKG4TlKcZnJnn@google.com>
 <6939242dcfff1_20cb5100c3@dwillia2-mobl4.notmuch>
Message-ID: <aTmBobJJo_sFbre9@google.com>
Subject: Re: [PATCH v2 2/7] KVM: x86: Extract VMXON and EFER.SVME enablement
 to kernel
From: Sean Christopherson <seanjc@google.com>
To: dan.j.williams@intel.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Dec 10, 2025, dan.j.williams@intel.com wrote:
> Sean Christopherson wrote:
> > On Sat, Dec 06, 2025, dan.j.williams@intel.com wrote:
> > I don't think we need anything at this time.  INTEL_TDX_HOST depends on KVM_INTEL,
> > and so without a user that needs VMXON without KVM_INTEL, I think we're good as-is.
> > 
> >  config INTEL_TDX_HOST
> > 	bool "Intel Trust Domain Extensions (TDX) host support"
> > 	depends on CPU_SUP_INTEL
> > 	depends on X86_64
> > 	depends on KVM_INTEL
> 
> ...but INTEL_TDX_HOST, it turns out, does not have any functional
> dependencies on KVM_INTEL. At least, not since I last checked. Yes, it
> would be silly and result in dead code today to do a build with:
> 
> CONFIG_INTEL_TDX_HOST=y
> CONFIG_KVM_INTEL=n
> 
> However, when the TDX Connect support arrives you could have:
> 
> CONFIG_INTEL_TDX_HOST=y
> CONFIG_KVM_INTEL=n
> CONFIG_TDX_HOST_SERVICES=y
> 
> Where "TDX Host Services" is a driver for PCIe Link Encryption and TDX
> Module update. Whether such configuration freedom has any practical
> value is a separate question.
> 
> I am ok if the answer is, "wait until someone shows up who really wants
> PCIe Link Encryption without KVM".

Ya, that's my answer.  At the very least, wait until TDX_HOST_SERVICES comes
along.
