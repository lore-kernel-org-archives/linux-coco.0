Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEDB364047
	for <linux-coco@lists.linux.dev>; Fri, 22 May 2026 23:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779491139; cv=none; b=dTObq4V5oeTjU4eF4IjJKa9rUPwEXMKeK2FV6IG1YzfZkpIlm4v4aaxzmdqNM+GPmEzKDWr8TGGGh78yl4AW7Fxs5Pi8d+Q+gKNHHyTEwK04HDVhvhAYN56U61o3ifgXNffAZZWPAuyOOEMWRDRqzYlz72nBlvaoCZiBFbC9GoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779491139; c=relaxed/simple;
	bh=8vLtsz7ZKDtp2UNuNvqYFVPILl8UflYPbV55sojcBjs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r95NVp245aajIlOJ1CRow/qZzmi0nXL7+EWTyIcnZfPmaaAq3GXkuaiA0qOKVNvr4OIa2AghPUSuiIrCrTu8ND1OGMo6gCbCZeKybIroPxHUym2luTo2O+WcFSqKg7LWaB8wcAj68okrPo2d+9rFTi619FJdnswXYJAUVY6A9vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HFaqVN6o; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HFaqVN6o"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b9b8137828so79311525ad.0
        for <linux-coco@lists.linux.dev>; Fri, 22 May 2026 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779491137; x=1780095937; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L9YbEtCfOkOpVPBvBwRE/wDUhUbdeL8GFXWIWh+htCc=;
        b=HFaqVN6oFUU2m6rDacdORa+NBwirT2rsleaNIy4mPMI+o3pvSZj0MuivMowWJvAPk/
         7OuwcJNtDWXOpJ+cJnRnlIca7rKUS+QuAaBex9yUhoc23lYNW7gGCVb8rFoVA4EG9NxK
         lqLHLJztWVuCtnMauxW08fU9Tn+mpTJ3/cw64M1Rf7ma5JxYa63avJLvo0WscZz0Ahy5
         9TGUnFxbhGFxap/CvoVVeg8s+M1AHIZtqDvfsDFs/P5Ca3Q3GkKSqlMNfMaTZFLWnKtB
         2zBAXoTN4h4qhPa8GdoGKGGthaf2bFD9mpnoVtknU496uOYc837LCS5gKPlhceXo0bI8
         rnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779491137; x=1780095937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9YbEtCfOkOpVPBvBwRE/wDUhUbdeL8GFXWIWh+htCc=;
        b=fCo0xiIfRngpEuj/tQI0zdpWEIqaT9i88S+DI0N8SffceftTnaL+zce+E8yTXcEjaV
         M22Tlb/NciBupvkJqMP7uT1H9KkIYwhxxkKQDD+V6BSndaymfQwn+esJM/9GxLe/+dBc
         znIl5qe15frV24XYghIYKZ+jjvl9VMjhOFZ13RqbyLMWlOvgcx+w+rCD644fosFTxqrZ
         LnCFE6jFRutjf4fRuF/oH5mq0WeBytMU6gw2/SlJ8J8WlWVmtrW7tapRYagYniFLZX0E
         rZulzY7eWCCLRKMKZjZEXZ+E93ERe2hn+ElzBU27I/RcFw2iU/pzkIYg0v1pgMTOiRmP
         tabg==
X-Forwarded-Encrypted: i=1; AFNElJ8pGOziVVhbW+lE6wwk74eBL4ujxaQhFc6pk0NQaBigMnuOmOj0jds0/+Voh5bR2e4H8RZ6y1Lc87Wn@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5qtF1+tjmg3BSGdbyp+p6sbNY2K+BkyRsAib8IMLV6PFSl5Dp
	yKyRHEqBu0Y2Th8qs2hcz77KnQom8ZjJBh+N9IoRS67akFpQTVjkxOqRFHTrDZJYPJzwHA8kORk
	zX+dh0Q==
X-Received: from plbjh21.prod.google.com ([2002:a17:903:3295:b0:2be:1727:6821])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88e:b0:2bd:9803:9308
 with SMTP id d9443c01a7336-2beb070261bmr61986275ad.36.1779491137176; Fri, 22
 May 2026 16:05:37 -0700 (PDT)
Date: Fri, 22 May 2026 16:05:36 -0700
In-Reply-To: <CAO9r8zMY6i+TWoZPWzj8zB+Xw3rONbK-Nee1kSFwDkT3hy66zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-7-6983ae4c3a4d@google.com> <CAO9r8zMY6i+TWoZPWzj8zB+Xw3rONbK-Nee1kSFwDkT3hy66zg@mail.gmail.com>
Message-ID: <ahDhQJI7xBOQpnjg@google.com>
Subject: Re: [PATCH v13 07/22] KVM: selftests: Introduce structures for TDX
 guest boot parameters
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 22, 2026, Yosry Ahmed wrote:
> > +static void __attribute__((used)) common(void)
> > +{
> > +       OFFSET(TD_BOOT_PARAMETERS_CR0, td_boot_parameters, cr0);
> > +       OFFSET(TD_BOOT_PARAMETERS_CR3, td_boot_parameters, cr3);
> > +       OFFSET(TD_BOOT_PARAMETERS_CR4, td_boot_parameters, cr4);
> > +       OFFSET(TD_BOOT_PARAMETERS_GDT, td_boot_parameters, gdtr);
> > +       OFFSET(TD_BOOT_PARAMETERS_IDT, td_boot_parameters, idtr);
> > +       OFFSET(TD_BOOT_PARAMETERS_PER_VCPU, td_boot_parameters, per_vcpu);
> > +       OFFSET(TD_PER_VCPU_PARAMETERS_ESP_GVA, td_per_vcpu_parameters, esp_gva);
> > +       OFFSET(TD_PER_VCPU_PARAMETERS_GUEST_CODE, td_per_vcpu_parameters,
> > +              guest_code);
> > +       DEFINE(SIZEOF_TD_PER_VCPU_PARAMETERS,
> > +              sizeof(struct td_per_vcpu_parameters));
> > +}
> 
> This is neat.
> 
> Sean, is this the preferred way to expose offsets to asm files (or asm
> code blocks) -- as opposed to say using .equ [*]?

For actual .S assembly, yes.  For inline asm, maybe?  If it looks prettier, go
for it.  

> If yes, I can rework my nVMX GPR fixes to use the same approach for
> register offsets. I wonder if the non-TDX part of this patch (i.e.
> Makefile stuff) can be split, then patch 6 and the Makefile stuff can
> land independently and allow development on top.
> 
> I can also split them out and include them in the next version of my
> series, then whichever series lands first will land the offsets
> support.
> 
> WDYT?

Hmm, I'd say keep your series as-is for now.  The OFFSET() infrastructure really
shines for proper assembly.  For what you're doing, AFAICT it's only marginally
better.  So I don't think it's worth juggling dependencies to use it right away,
we can always convert if/when the TDX series lands the fancy stuff.
