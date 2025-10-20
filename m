Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F169A212F98
	for <linux-coco@lists.linux.dev>; Mon, 20 Oct 2025 14:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760971353; cv=none; b=Q9w6XH9spoRbRfDFsJOWa/+4/5WmuVq/zrJl1RE8azg3JC+4Sf3XtTLjo8oFtnlohfFskuO/cyD8enY6Yjh5e9c/0/7zriLFE51hahZUwiXD031eb2SEZHq/kIqltRV+TNdoIQ0B4ZEd3NLDwbPRKxuxwIPonn+2Bs2efaHOuqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760971353; c=relaxed/simple;
	bh=AUm+U1cdUJCUKS7ZA7tvxHQEACWT09VkO+uyfX+/uWw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uAPj+UhffNqlVe80k8D6/MBtGoLeY2Yq6SgiMZa9BhN8Rv9FL83hjbAon9O6fJLoAQylqIBWROdUPX7qmMEbhlc2i/2kjhVT59KqYF+79sFx8YrnJJyp7NNJHbM66eRtLNgTaWVwdp1iV5u7GV/x8QGL2kx6f43SXHKAOSNswH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z3KA80G7; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z3KA80G7"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-28eb14e3cafso89692255ad.1
        for <linux-coco@lists.linux.dev>; Mon, 20 Oct 2025 07:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760971351; x=1761576151; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r/WpZ95ObL14bxrV4qoPKrRDt1vTTzIm3G3nDoruhqI=;
        b=Z3KA80G7uH77uLBj5iBm1/BNOPqqbmyIIxc/MzLvYZ4J38RWAf+XBwMUCogzK8A/L3
         kpGp0i585apszrfFfA/oHwZ3lGA0EN9Odhob1EhGMCTD9hsRuP0FGpULTjcubrTe1a45
         62njadGTW+i+jaItVMU0vR0IAny/hP48Ei+ZHWIkiPExxclzSxc7kEiEPeBDldHmZLUr
         sJu2UPVmEfqDmQpiO4phJ1KGvgib4QY9SedZ2eXOSA3NZKl8ApYWHLbzu2V5raGLk2o9
         otGB6TRWkao/Mr3U1/9rXBYR4yZPG6xm5NkqbOjZd0c25jyM/WsGu1gi0ALBnM2t/+w2
         HRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760971351; x=1761576151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/WpZ95ObL14bxrV4qoPKrRDt1vTTzIm3G3nDoruhqI=;
        b=eRtw0gNgrRvXcV81NUdi+XaJ7iREjMpOayTor3f4aJga7FAzmWKcQ3iJfdrIY5Qz47
         ChEZRA4r/S+k0BQqHCZM3vKd2AXkJB/Hu7b9SpWQ+6pzs0+eNi8D6r4cVDfhhVxMzr3+
         Q5c1cSHsVfsk2xFP1TITaoLHJ7U+8LVyaeHfNLWSaFyl6o2PQDt68QGo7hPflAYENJYY
         65xd9rB0benRxB3dPUbb3DqFPKJADo8yJN787Im7VowWhUttS/zRS/NR9aHYXiUPULEO
         s+jcJJJkuuH+Gc9EUi8vLaeqSGPveSOStnJEw1x44wsc/W1XsPxKY6n6WDVO26umUT1u
         FsuA==
X-Forwarded-Encrypted: i=1; AJvYcCXM8IM1VUIo2+oda2R4s0lGTXgYfK8OG0h6xTFrlIcpVjYZ/kDBz4S8M9OhI0nlZDzOWRSbppLOJp9f@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+61ZgV1uANAWolqyunR0lWcRc859TPN5Wn5g7Wbc7fiXLGQot
	6wyxcJClFOX3+dZDU+l0TKr2mCNktxcki/mnrTXzUWgUkP+vh7UTY1UKxiQJUWCxa1OIaiRtgDY
	KRNcCzg==
X-Google-Smtp-Source: AGHT+IG5bkRz1Grck5fnmgvosqDspDZYYbROSXUDaOdreC4Lek0m1RZScrTovv3SkUBdnFvn817DXQ6Q8sI=
X-Received: from pjro20.prod.google.com ([2002:a17:90a:b894:b0:33b:dd01:d6fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d508:b0:28a:2e51:9272
 with SMTP id d9443c01a7336-290cbc3f200mr190082845ad.48.1760971351111; Mon, 20
 Oct 2025 07:42:31 -0700 (PDT)
Date: Mon, 20 Oct 2025 07:42:29 -0700
In-Reply-To: <872c17f3-9ded-46b2-a036-65fc2abaf2e6@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250910144453.1389652-1-dave.hansen@linux.intel.com>
 <aPY_yC45suT8sn8F@google.com> <872c17f3-9ded-46b2-a036-65fc2abaf2e6@intel.com>
Message-ID: <aPZKVaUT9GZbPHBI@google.com>
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
> On 10/20/25 06:57, Sean Christopherson wrote:
> > Why do these structures track struct page everywhere?
> 
> I asked for it at some point. It allows an unambiguous reference to
> normal, (mostly) allocated physical memory. It means that you (mostly)
> can't accidentally swap in a virtual address, pfn, or something else
> that's not a physical address into the variable.
> 
> The TDX ABI is just littered with u64's. There's almost no type safety
> anywhere. This is one place to bring a wee little bit of order to the chaos.
> 
> In a perfect world, we'd have sparse annotations for the vaddr, paddr,
> pfn, dma_addr_t and all the other address spaces. Until then, I like
> passing struct page around.

But that clearly doesn't work since now the raw paddr is being passed in many
places, and we end up with goofy code like this where one param takes a raw paddr,
and another uses page_to_phys().

@@ -1583,7 +1578,7 @@ u64 tdh_vp_addcx(struct tdx_vp *vp, struct page *tdcx_page)
 {
        struct tdx_module_args args = {
                .rcx = page_to_phys(tdcx_page),
-               .rdx = tdx_tdvpr_pa(vp),
+               .rdx = vp->tdvpr_pa,
        };


If some form of type safety is the goal, why not do something like this?

  typedef void __private *tdx_page_t;

Or maybe even define a new address space.

  # define __tdx __attribute__((noderef, address_space(__tdx)))

The effective type safety is limited to sparse, but if you keep the tdx code free
of warnings, then any and all warnings from build bots can be treated as "fatal"
errors from a maintenance perspective.
