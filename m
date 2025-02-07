Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AC723FC5E
	for <linux-coco@lists.linux.dev>; Fri,  7 Feb 2025 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941776; cv=none; b=O0cWb8/B17LPEVsjRJa2Ao/5rr8eefvvlvY/8UivG5yPTydaF7g1fFLZoFVj3sgnmRmB3XsqldzxUUldsnAfbHuUBosQrOYpTYBtwDTpmQzP3o/MaNa2jxYE4sJaYjslS1SWPl1+c3tOLZj7vPsjukGPYK9KJctTWlJkFhkpmq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941776; c=relaxed/simple;
	bh=kcqXU0L80fJwg+01toXpktwYGd4IF+d2ulZzU+doSZc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rjamQlCJh33cYUIYPKhHOHHawzA75DSCbmp3r4A/Qd87Ap12Px/lr/1FDr9w0cAm+Zj6zn8AT5A89okc339QoaV3ykroIePidnZQms/0Vgr0P4ytBMByCep7/5VXNlNu6JjcQ9h5TErTMIEtNknp42LTcXUfh8xtfHZtTY/lH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3i+D2XR3; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3i+D2XR3"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f9da17946fso7110433a91.3
        for <linux-coco@lists.linux.dev>; Fri, 07 Feb 2025 07:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738941774; x=1739546574; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kySEHqcfMZJGhyvftSCQ9iS/BRr0aycsLdTwptb27hg=;
        b=3i+D2XR3lB8Dim+615OBtYEdj3iapa74Qj+n4GglcvjIe5hWh+VaBFKPQ6k33rbpNj
         gd9oyx2lR4vfpsQ+0vgBQT0BJfF9CqQdCL7a4mnwoOo/gbH3YKRVPIBlEaC8bUdeUukv
         I7+pd2drCQAotPC/3H87FUmT+IGWQSLR6Uu/GXm4PzAJnz857hcS5v3sosikv2lwJSAY
         sJ+k+RBRxO7VrGlceP/86EJWHeso7oqciPjOnyacFlo2aIkhq2Z1p1Y44KE0zB2ezhrb
         Y9KPd7jAPpuTjFRm4TOmMMOOqzl1LoiPOZzM/M0X1VOwxLbXAUIcgQSixGbD9XGBr56Q
         JkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738941774; x=1739546574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kySEHqcfMZJGhyvftSCQ9iS/BRr0aycsLdTwptb27hg=;
        b=AzHeU+oyOUOShn+0sR9C89rz4iNfkaCCeDO/uXG5OomjNCXZmMNBtynOaoyrYdvbhh
         N7lO31COd4/WWKU8DpBOm3ab/K4Hs6dDdkTuJ8fq88KUxltzFkL19MoLmC1BRVXjwZ+q
         Kz/iP0Wi4vh29YGDskTmn0001KIHMdSAwr18mzT8lW0eBWUlfhng8NvRhqQeeeDy/uSA
         +cJKW+9o5AySF/MxTGzFs7FS8nyIaDnKLdjgUaqOr96kk5gAMQVpB51aEPGBTJtkSdYU
         ijRpM+X8r206Sc2NzB8E2467GuUFiIUVJUx5g1KHZDnwsTgEp2Y7qwNGay5bTpN0/6hp
         RH8g==
X-Forwarded-Encrypted: i=1; AJvYcCVsrWg3CSZ2WJOSA1IJwBHFtorttutnESDHFa3rtm030pe3Pqu4sowRfV0t/WMl4GnCQLWrqSm9VmZC@lists.linux.dev
X-Gm-Message-State: AOJu0YwK87av3rGyneCUC7QKDkkoTpy/Saphj6uGyohld3k4q2qjkYdE
	b6VyBhv10DvtM4il7I6y+XyhGC+08HyI2ij7uBn7MTHUBz4a+2lerL8yY4UmdjC2Blz9gH0EGsQ
	N5g==
X-Google-Smtp-Source: AGHT+IEU6jz6jlB8RaafTWWusxmACRAVwVTNLzOLEl4OKUDHMmuGMK2BqeIFN1+9CKAxpxYyavZXdA2p0Xg=
X-Received: from pjbsc1.prod.google.com ([2002:a17:90b:5101:b0:2f9:d9fe:e723])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:19c3:b0:2ea:5054:6c49
 with SMTP id 98e67ed59e1d1-2fa22b95ba5mr6440969a91.0.1738941774000; Fri, 07
 Feb 2025 07:22:54 -0800 (PST)
Date: Fri, 7 Feb 2025 07:22:52 -0800
In-Reply-To: <20250206222714.1079059-2-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250206222714.1079059-1-vannapurve@google.com> <20250206222714.1079059-2-vannapurve@google.com>
Message-ID: <Z6YlTG3QV_Pv6nRo@google.com>
Subject: Re: [PATCH V3 2/2] x86/tdx: Emit warning if IRQs are enabled during
 HLT #VE handling
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	erdemaktas@google.com, ackerleytng@google.com, jxgao@google.com, 
	sagis@google.com, oupton@google.com, pgonda@google.com, kirill@shutemov.name, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 06, 2025, Vishal Annapurve wrote:
> Direct HLT instruction execution causes #VEs for TDX VMs which is routed
> to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shadow
> so IRQs need to remain disabled until the TDCALL to ensure that pending
> IRQs are correctly treated as wake events.
> 
> Emit warning and fail emulation if IRQs are enabled during HLT #VE handling
> to avoid running into scenarios where IRQ wake events are lost resulting in
> indefinite HLT execution times.
> 
> Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>@linux.intel.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> ---
>  arch/x86/coco/tdx/tdx.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index 5e68758666a4..ed6738ea225c 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -393,6 +393,11 @@ static int handle_halt(struct ve_info *ve)
>  {
>  	const bool irq_disabled = irqs_disabled();
>  
> +	if (!irq_disabled) {

Wrap the check with WARN_ONCE(), doing so adds an unlikely to the <drum roll>
unlikely scenario.

> +		WARN_ONCE(1, "HLT instruction emulation unsafe with irqs enabled\n");

Newline is redundant, the WARN does that for you.  IMO, it's also worth adding
a comment, because this is like the fifth time "safe halt" has come up in the
context of TDX.

E.g.

	/*
	 * HLT with IRQs enabled is unsafe, as an IRQ that is intended to be a
	 * wake event may be consumed before requesting HLT emulation, leaving
	 * the vCPU blocking indefinitely.
	 */
	if (WARN_ONCE(!irq_disabled, "HLT emulation with IRQs enabled"))
		return -EIO;
