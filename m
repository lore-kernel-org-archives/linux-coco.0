Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA8371D13
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779389236; cv=none; b=Qqj+4rPuQMjs8dnC2pYYmSNfsEG+TqoeKYnNVLvtppI/B1uQhqkaGxpHR54AaqInyEMZ9fbfoTd/vuqAsnqXdQ+WFyj6ZucSep1MoiRgShyBPZ517PE8hSibVlwfhQh0Z3A1OHxsaM3hs/LjOT0qiQwxDnkdf4aacQfZtAeD+ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779389236; c=relaxed/simple;
	bh=/DG/MIpaMO6i0+S7NwYK+Xz+X5EesI4A/a+bCuZYdfQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gYlochqtiu2H0Yg/vcX92a7dqAvwSRtdrxOq5I4weaGjdLut2Qs4xdg34OcufWuLQzC08J23nvdE7nRdnwKaXNmB6MnxuaU00yv9E+HcgRsqyB6gMUdpnDOi85zNJNQTNs6JQTFXoxKNBuy8udhkg8kWLBSqD2h5zKaBQ06EFvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XiFCs0bA; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XiFCs0bA"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c827adbf00cso2914251a12.2
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 11:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779389234; x=1779994034; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zotDUcTetMeKkyO7KMKZKkLO0bGRKwkihUsxk7vpQAQ=;
        b=XiFCs0bAznnsIlorKXIDQy87H5T5HKk42hCFUkDy343yDfl51loPy0JdBtw/ZF3hu9
         TTqdjiPS5dGr6icz9TJqfCUSziUuK0nFoWRKEk4eRIFDhyg3VhtRXtGcPmc4OfafDRUS
         VawFNPqTJvNjSEVK1LNtqZGTZq2zNoEBi36lMf6DD9juRNsggshelbVkoWmxMIPzExSL
         fhql8+pvm9Jn/Aj9uVP5H0kesxP1OSaGh322RauU6SkJ13N7IsKcwFGHEdKZJZHOJ0jR
         30/Y3OMMtWe0dv3HWtXS2X8/5D2EcuO4xWLSFHCaY4gE54hxAhi8P4JEL7ZyKsxNHtmu
         N67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779389234; x=1779994034;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zotDUcTetMeKkyO7KMKZKkLO0bGRKwkihUsxk7vpQAQ=;
        b=rmk+QRton75HSvv+Zz6+pYnH373dhiKwFtymesQRBCnfyRPneSEOgOag8CaHicYFSU
         8qZ0LKrza84xnsW4V9C8Kc4eivw+B/V5SLNIz9MAMwQWrxOINkJIgwr8V9ixJyqQujc4
         WNEH2l7dbspSaVypac9m2TdWx/bc+HVkKWozEaJqcol3iQD4wnLO9uIjf+dvHtEnUJZW
         7lTWPqZAbHVfaV2+aiAbKJ7ZgxvERO9qNKmnH/OlEdzhADUYWJ9htM4ZANm+uBM4V1Is
         BrbQmlrbI4c63rCML+81AduVJ3CG23i5Slfhp3hULW9QG9qkmDd5qo1yyhaNFlzmRDLT
         fWNg==
X-Forwarded-Encrypted: i=1; AFNElJ934yN3MTywbbnTxLAD71ugwDrij6kf46lHf6IoyrlCI5pYlaT3UiTksN5JcgCfCysLXxA3jnn4fF6h@lists.linux.dev
X-Gm-Message-State: AOJu0YyY3d2Qh9hUOXN1b+c0TyosCOoD5bjGtAq5H5dsrb5VMZNpZfU4
	8frA7Nr7shCRg3NTCc5CLWqqawHBH4D0+uUuW1Ol6Mw9xt5cCkqSMfi3066VWlNNqhJgNSPWdjl
	zE8C7yQ==
X-Received: from pggg7.prod.google.com ([2002:a63:2007:0:b0:c73:ef4d:6a16])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc2:b0:368:3854:3a2e
 with SMTP id 98e67ed59e1d1-36a676d2e82mr471785a91.26.1779389233672; Thu, 21
 May 2026 11:47:13 -0700 (PDT)
Date: Thu, 21 May 2026 11:47:13 -0700
In-Reply-To: <0ed747418eaef45a8c161ab5a9e28a12c604f9ea.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com> <20260514215355.1648463-16-seanjc@google.com>
 <074e209fe4c78a735868099f13d76b9dde2c88e3.camel@intel.com>
 <agx77QB3UVmJr5xP@google.com> <729c4191d16e4c768c231ffb9bb8420306039210.camel@intel.com>
 <ag0NlJ2FEIL7GJIj@google.com> <4a918cb38dccd4ef7a2d84d16f5044472d069f7c.camel@intel.com>
 <ag35RgwowvR9Q4hA@google.com> <0ed747418eaef45a8c161ab5a9e28a12c604f9ea.camel@intel.com>
Message-ID: <ag9TMaaeX1aU7w0q@google.com>
Subject: Re: [PATCH v2 15/15] KVM: x86: Move the bulk of register specific
 code from x86.c to regs.c
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"paul@xen.org" <paul@xen.org>, "yosry@kernel.org" <yosry@kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 20, 2026, Kai Huang wrote:
> On Wed, 2026-05-20 at 11:11 -0700, Sean Christopherson wrote:
> > On Wed, May 20, 2026, Kai Huang wrote:
> > > But if we want to hide KVM internal structures, I don't see any other options
> > > except virt/kvm/include/ is the place to go?
> > 
> > arch/$(ARCH)/kvm/kvm_arch.h is the obvious approach.  Code in virt/kvm can reach
> > arch/$(ARCH)/kvm, we just need to add it to the include path.  That's why I was
> > working on unifying the include definitions.
> 
> Yeah, for asm/kvm_host.h.
> 
> But if I am still following you we still need a place for linux/kvm_host.h, for
> which I thought virt/kvm/include/ would be the place at first glance.

Oh, yes, the KVM-internal pieces of linuy/kvm_host.h would live in virt/kvm.
