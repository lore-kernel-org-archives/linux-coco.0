Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20838389DE0
	for <linux-coco@lists.linux.dev>; Thu,  2 Apr 2026 23:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775171282; cv=none; b=IJuURYZPpFunCVB7/TazJUuKJSbRL1tgvdFksE8rTXeXiT/Yf82yDJrn3jZJ/SWl29dUV2vSt2GnJgqUUFM3fDEuGmUipUor+tBozHr3OB0W6lqD3V8HeeHPgo6BLRSO64yaKcwWi+qB39s/uHtIbLMOAuq+ylF3EV5G18Dbl0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775171282; c=relaxed/simple;
	bh=2PTm1I4LtYj1YB+Qns32E4oWyIFCWmAEJE74xx20oLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oWXYY90Ao9p7GZ0DU//mbfufjCNBcDHnP+9BTEH+KSz5flBiE0cCQhWK76WiEYAlI7XQ69ZAEcSkzcgbSQdDUEdgzIBK7LJJnkxR7Rljr+zCwJPfDbut1GZXVQnd5+43k19H0Jn3Sm25cQdbz6FoPgcsGRE33CxSC+oWQ9CmdAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LRb1caBb; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LRb1caBb"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35da86144daso1184236a91.3
        for <linux-coco@lists.linux.dev>; Thu, 02 Apr 2026 16:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775171280; x=1775776080; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLa0GVMX6VX9ga114RP9fzeLfvZH9WQjqCx0+9dg7Ds=;
        b=LRb1caBbI/YwHi1cDiRDI49fjmZ7+z+GOYutZECn8uW7fwUA+3Y5RW8kUGEmNVYoqC
         DjQbDxiKYYM9YJc/NZKm7tIBRDCqV7TOIsVcf92oLuEC1Qg99GoAXKzCdTQ6cTNE/vNG
         HIe5bmi4EuX/ZYRrVW55zRHVpjDk8BWwUvQ60id5w0PnRBQrVXvaUSNVm2wp/TT7Dlqj
         rrExKbwefaHeCWjTiuZlXEZk7Uj2g4IwWu5UD78XrLuj4LoRzoRLjZ7za7DeOKsIBPcG
         fk22UncG9kOYuQdBYdafgRjlU4FMkPqI378n7MsP8H5zrE/Ow4JTxBgWNU2ekzuF/4PY
         POGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775171280; x=1775776080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLa0GVMX6VX9ga114RP9fzeLfvZH9WQjqCx0+9dg7Ds=;
        b=KLGrsCNvhreSSUbLrGggz6BxWFo0g4yhB4fu/5K8npg63JeXX9Y6FkEzDElTpYRG7l
         FmPrpirglhoBk2pGXe708UoKQbcv5zoFWLkqnJpyZaZBm6R2VpirVr0PSycSic2kKWYK
         ow8uFJFO8wO0aoGLryZ/64KxqrEJ7WzK072Mkvs0SlOPGUzLnqHN2HYYIz6QMOS7Hq4E
         BKP0Alo7rJKyDDE01FVF4JeebH18casbfCpo6CIwUB97xwhXIi8od81RDsrBJHzKhqm6
         +V0XLEMNZ5vkOQyoLAvcfK0CWQwJJL1WsQ9aT+e+R4QLUuxCyU35Dr6acNHc1UkcmBaZ
         0eUg==
X-Forwarded-Encrypted: i=1; AJvYcCVtY1dvu0toyjWFGRegh0OUEVvpUufbqWa+H6r36Fzk3rgynTzSAP9btBMG+BJqAcJC4baOUV9rrgS7@lists.linux.dev
X-Gm-Message-State: AOJu0YzXRuIj7A0VYBGwSTguST+qHDhz5UrpmfAdxySNTqyfGbyilmib
	u662l9I5M2fQ+95PkTB3CIpMVOXNQ9rHs7t2IoQQ7toVBQhf5Y1erSvSAI8EJlcXd8IJNSTzag2
	rmdrKjA==
X-Received: from pjuw16.prod.google.com ([2002:a17:90a:d610:b0:35d:a8d7:ccda])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e70f:b0:35b:e52a:6fe5
 with SMTP id 98e67ed59e1d1-35de683b19amr592058a91.5.1775171280336; Thu, 02
 Apr 2026 16:08:00 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:07:59 -0700
In-Reply-To: <3051c067-048e-4388-8c22-1e275d8d3b5a@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com> <7ec084f8-812e-42f2-8470-e416fa7ee848@redhat.com>
 <8853f8d5-57e6-4ea4-b9b5-8a0182d0d012@intel.com> <abL8SW5JS1aV5goa@google.com>
 <3051c067-048e-4388-8c22-1e275d8d3b5a@intel.com>
Message-ID: <ac72z1cfXnpUmkWv@google.com>
Subject: Re: [PATCH 0/7] KVM: x86: APX reg prep work
From: Sean Christopherson <seanjc@google.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, kvm@vger.kernel.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Mar 25, 2026, Chang S. Bae wrote:
> On 3/12/2026 10:47 AM, Sean Christopherson wrote:
> > On Thu, Mar 12, 2026, Chang S. Bae wrote:
> > > 
> > > However, that is sort of what-if scenarios at best. The host kernel still
> > > manages EGPR context switching through XSAVE. Saving EGPRs into regs[] would
> > > introduce an oddity to synchronize between two buffers: regs[] and
> > > gfpu->fpstate, which looks like unnecessary complexity.
> 
> No, this looks ugly. 

Sorry, you lost me.  What looks ugly?

> If guest EGPR state is saved in vcpu->arch.regs[], the APX area there isn't
> necessary:
> 
> When the KVM API exposes state in XSAVE format, the frontend can handle this
> separately. Alongside uABI <-> guest fpstate copy functions, new copy
> functions may deal with the state between uABI <-> VCPU cache.
> 
> Further, one could think of exclusion as such:
> 
> diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
> index 76153dfb58c9..5404f9399eea 100644
> --- a/arch/x86/kernel/fpu/xstate.c
> +++ b/arch/x86/kernel/fpu/xstate.c
> @@ -794,9 +794,10 @@ static u64 __init guest_default_mask(void)
> {
> 	/*
> 	 * Exclude dynamic features, which require userspace opt-in even
> -	 * for KVM guests.
> +	 * for KVM guests, and APX as extended general-purpose register
> +	 * states are saved in the KVM cache separately.
> 	 */
> -	return ~(u64)XFEATURE_MASK_USER_DYNAMIC;
> +	return ~((u64)XFEATURE_MASK_USER_DYNAMIC | XFEATURE_MASK_APX);
> }
> 
> But this default bitmask feeds into the permission bits:
> 
> 	fpu->guest_perm.__state_perm    = guest_default_cfg.features;
> 	fpu->guest_perm.__state_size    = guest_default_cfg.size;
> 
> This policy looks clear and sensible: permission is granted only if space is
> reserved to save the state. If there is a strong desire to save memory, I
> think it should go through a more thorough review to revisit this policy.

And I'm lost again.
