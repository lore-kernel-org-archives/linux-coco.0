Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0026A1BB
	for <linux-coco@lists.linux.dev>; Mon, 20 Oct 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973931; cv=none; b=oLZcShvaSHUb364q6tKwAoz5zT/mPwoPrWCWaEQYpXxBrueNeSXu3jSeLjB8nQOOx/6Op8u+8zKjxQbZONKtSprr6zz/mmIj1fMXgS93lIJ8PN1+ZU/eLQ8j489RhwT5NI92s/LbjR1reUModspCFzF7kpZ+xLLX2te+ADOZGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973931; c=relaxed/simple;
	bh=X2cNT2jodYHE9VXEpV2Jc+n9s/IGEDlBeAa8Q4UPTyw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JcEwQxQ8TasTDhHAQFZkyzZMrzxMxuWa3l7GJEs14+TrenBpNQh11zCs0MMl/qegyjFh2Mm5V1ELO/Zc7Di1Q8dD1GM1SIiysO4CvSUjQCjGZuY2njT1z1k0ZuFKa6Hv6NaVYoFIBo/jlDuzNab7wxSHgtnZoj+nXrMqUjqk890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EZpTc3O6; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EZpTc3O6"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33da1f30fdfso3494939a91.3
        for <linux-coco@lists.linux.dev>; Mon, 20 Oct 2025 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760973929; x=1761578729; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8duMiPUW3Ov9cGPKQdSL4cotcPZI8856r/Bae2VnHbg=;
        b=EZpTc3O6/OEUeS1S97rSE7NpqricspXnyY9+rW/afuDVT5pLkpv8kJjNM505jyKCuZ
         1VPOIeZRGAas07tFEWxHxPFX1BbA22NUY2lyFf3Uc69VQ7uTI7eGThHCV4w0PRdItMNQ
         RreXb9+w88Cfvk8aK1uqI2S60BPdB7Rh+PyUKJ52Vf6mUAZFafIX2kGlnA3dtFQTWnZ7
         O+yfmEoWKOajsnEIO3cU/a3NyXE1KJUj2S7NomfUz0IcZ+kgmZzjkGix2vZ/AX8GzqZJ
         PzS2Dqkuw4SsbCDdKgF1tYHPHagURG/5IsbDLYsRbOVQuEE3aiop1LTQgNF2f1CYtzdO
         Dkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973929; x=1761578729;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8duMiPUW3Ov9cGPKQdSL4cotcPZI8856r/Bae2VnHbg=;
        b=bi2zE+EyXF4goMtq4HNVzM2srOxONuw33GJtKNyBu/dWA9mRCg56/iLAh88pVT1CBT
         gTTatIFobU3Hw//wCyBgvHbO6SYy/dwUUAUyWKH/Qm2/c0skOM+4PCMX/wCViB2xENMC
         kb72Crs+ym0vbGLnDFQjGgZ+NxgNd+7yc5EgyPQimyirivfP8r4RRDPuD1LW0bnn5pny
         e216B8hkrMpSRoK0X7NBNN4rghe4nU5N2/xAsRMdvZ7AJsqa5Y1dq/7MxWBq3loQP43N
         ZUbCVDJ8nQSSPsaE87RzZVoQD7OhP6Mnyj3KZGxJkZHq6KyUHU8n8PPwe74zIvWdaDgC
         QU2g==
X-Forwarded-Encrypted: i=1; AJvYcCWyULm3sxq6ijgDJWAZf+Qt4nMqueCLrNRDLa6sTegqi0zLV0fBuD2srnXDiybsLSeiNZDD7fGlpRBc@lists.linux.dev
X-Gm-Message-State: AOJu0YyOzvJlf6F4LRY5dACu9JvoIsYxLhkmfTeLibOubHbvTAR2JGhK
	taM7lBR0Ehg+eGGF61eOQfMvVwL1V1dd9IHqzvlAcNRPpoIhTriCHYdvGaS4Xjt7+RYfOd3rLtu
	dKBKQuw==
X-Google-Smtp-Source: AGHT+IFqW3qIYEVTbpVnhf/SO53CXDCgtTQdekIynQUGkmgpYGTVsnP6gv23UN57ly+8fm7EenYdxfMTkTw=
X-Received: from pjsc19.prod.google.com ([2002:a17:90a:bf13:b0:33b:ab21:aff7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c0e:b0:330:a228:d32
 with SMTP id 98e67ed59e1d1-33bcf86b401mr19164126a91.10.1760973929211; Mon, 20
 Oct 2025 08:25:29 -0700 (PDT)
Date: Mon, 20 Oct 2025 08:25:23 -0700
In-Reply-To: <033f56f9-fb66-4bf5-b25a-f2f8b964cd4e@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250910144453.1389652-1-dave.hansen@linux.intel.com>
 <aPY_yC45suT8sn8F@google.com> <872c17f3-9ded-46b2-a036-65fc2abaf2e6@intel.com>
 <aPZKVaUT9GZbPHBI@google.com> <033f56f9-fb66-4bf5-b25a-f2f8b964cd4e@intel.com>
Message-ID: <aPZUY90M0B3Tu3no@google.com>
Subject: Re: [PATCH] x86/virt/tdx: Use precalculated TDVPR page physical address
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Thomas Huth <thuth@redhat.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Farrah Chen <farrah.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 20, 2025, Dave Hansen wrote:
> On 10/20/25 07:42, Sean Christopherson wrote:
> >> In a perfect world, we'd have sparse annotations for the vaddr, paddr,
> >> pfn, dma_addr_t and all the other address spaces. Until then, I like
> >> passing struct page around.
> > But that clearly doesn't work since now the raw paddr is being passed in many
> > places, and we end up with goofy code like this where one param takes a raw paddr,
> > and another uses page_to_phys().
> > 
> > @@ -1583,7 +1578,7 @@ u64 tdh_vp_addcx(struct tdx_vp *vp, struct page *tdcx_page)
> >  {
> >         struct tdx_module_args args = {
> >                 .rcx = page_to_phys(tdcx_page),
> > -               .rdx = tdx_tdvpr_pa(vp),
> > +               .rdx = vp->tdvpr_pa,
> >         };
> 
> I'm kinda dense normally and my coffee hasn't kicked in yet. What
> clearly does not work there?

Relying on struct page to provide type safety.

> Yeah, vp->tdvpr_pa is storing a physical address as a raw u64 and not a
> 'struct page'. That's not ideal. But it's also for a pretty good reason.

Right, but my point is that regradless of the justification, every exception to
passing a struct page diminishes the benefits of using struct page in the first
place.

> The "use 'struct page *' instead of u64 for physical addresses" thingy
> is a good pattern, not an absolute rule. Use it when you can, but
> abandon it for the greater good when necessary.
> 
> I don't hate the idea of a tdx_page_t. I'm just not sure it's worth the
> trouble. I'd certainly take a good look at the patches if someone hacked
> it together.
