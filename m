Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C618288C0E
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778849726; cv=none; b=hoaHwIEO5+g09lg89sYAeHY/fmb2P/BcCZjem/L14fhCRiOl+13aZ7Pbf/zxi6U1W9wJmXD548l2FnRpjsLlYdH3ibpT19GgxAS4Lj4BR2B1sjKnSoHjjQynbZEC23mvyTP+1RyD790lCnbT/vDKRdbDc5ns9E3a6sQbjZNQKHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778849726; c=relaxed/simple;
	bh=44RP69sPTtq9JEi9bpgbdn/yGIvfT4t9nmIg1PVAgfs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M3kkqzUoUJMmS8kVc0e/hvJNo7VUWTvslp9Gjs5oHUo5Vr1Auwo1TOPI+OlT5obX7RBwhRdMZgTQvCq3DjLM6/QK87aRyFg5BzyINxsIOKXxSvebtI6A7LWiRHUyvysKZDxpr9HNvATcVJMGUasiPTjcUhAODs/Iov5joKp4QY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ptInC1S3; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ptInC1S3"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso6297464b3a.0
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778849725; x=1779454525; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8R1ixx0UWdwtZn2mIf1Xzrj0hOLehMAvsgFWFCX8EE=;
        b=ptInC1S3na1IKnxED8iHhvfJBocByHOUmqgoW8Zn8SSSxj/o+aRyxXtRJW1Br0Jshy
         3ZuaxmbhRsp1/7GV+c2O+viPH9vz/2To8M14RjehgEHZ4vn67yt4enr6cqBQaL0/tOra
         NW8NiMV171YdhUXL35H3zXkAbkgpwc8NQ/0LoMoWWVSam65X4XZF/QbdoP3zpf+L3K0z
         Xaty7OgDnFJ2A4FgJfZ5ExYHqj6LbJan2D7CD5UyFPuuEWwzqlLLu9TttaY2Di0kiFj8
         SOlDE9PpU/yHGxX9HsQpQiq5TikRqtMFa74MVCReVq7tfnwyWoazebFi6+0SNQ/YPkKR
         oDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778849725; x=1779454525;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8R1ixx0UWdwtZn2mIf1Xzrj0hOLehMAvsgFWFCX8EE=;
        b=D5oU1L+rWQdABuhsrlIKvQrUqP8bInTX+KmvhlBxcMGHsczmjEkEe1koBjateL94jI
         ZgoZKeY7w8kNBVL4OvFH5VOvSQOW2deG0XyRX2JdUQuvRxiXUwlutNVgFywGmh1XksHF
         q+Hj4CrFboKEZ1QjjjxskInxAxw3D2kvczWT/S51pzmG0Vxil7EfaABOdILpRuErsH0T
         JGKxuoGvfaDfRqaWjD1rLSV3oB/qQSbnSt2mglmIn4f0RuF4orsq15ENX9v0msTQGju+
         xiaOs9lTc1/cpSU8032H1TRAxSoXgPLM4fsS1E40KxQ5NLbZ4/l0bKn37Ac/YXYUUAgf
         dfPg==
X-Forwarded-Encrypted: i=1; AFNElJ9scDFq1TZoPz5X4TGrtPH3LvfCUVnBQabvOkuJTDXcjzHlLPF74zCBIiCYxtBQ+vxw+dXzpbSiQDQZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzlatH0PiB5xvzM/YD7zoKnmMTGqLMsFbDuYFwBzJEV1ArJzHqL
	AYpZafE9Xf4JX4U44yBQ6XM3GV8ESfQTNpOMiXcXApAQ+S8b07t1q6J78eCk/m+HzpSEhLGdwGI
	54gzBOw==
X-Received: from pfde26.prod.google.com ([2002:aa7:8c5a:0:b0:82f:dd9:c650])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2449:b0:82c:21af:a7bf
 with SMTP id d2e1a72fcca58-83f33c25127mr4255212b3a.13.1778849724212; Fri, 15
 May 2026 05:55:24 -0700 (PDT)
Date: Fri, 15 May 2026 05:55:11 -0700
In-Reply-To: <27ba35fd-5563-4bbd-8f95-2285b50efa7a@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com> <20260514215355.1648463-4-seanjc@google.com>
 <27ba35fd-5563-4bbd-8f95-2285b50efa7a@linux.intel.com>
Message-ID: <agcXr2FP4C3I_jbQ@google.com>
Subject: Re: [PATCH v2 03/15] KVM: x86/xen: Don't truncate RAX when handling
 hypercall from protected guest
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 15, 2026, Binbin Wu wrote:
> 
> 
> On 5/15/2026 5:53 AM, Sean Christopherson wrote:
> > Don't truncate RAX when handling a Xen hypercall for a guest with protected
> > state, as KVM's ABI is to assume the guest is in 64-bit for such cases
> > (the guest leaving garbage in 63:32 after a transition to 32-bit mode is
> > far less likely than 63:32 being necessary to complete the hypercall).
> > 
> > Fixes: b5aead0064f3 ("KVM: x86: Assume a 64-bit hypercall for guests with protected state")
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> The patch looks good to me, but one question below.
> 
> > ---
> >  arch/x86/kvm/xen.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> > index 6d9be74bb673..895095dc684e 100644
> > --- a/arch/x86/kvm/xen.c
> > +++ b/arch/x86/kvm/xen.c
> > @@ -1678,15 +1678,14 @@ int kvm_xen_hypercall(struct kvm_vcpu *vcpu)
> >  	bool handled = false;
> >  	u8 cpl;
> >  
> > -	input = (u64)kvm_register_read(vcpu, VCPU_REGS_RAX);
> > -
> >  	/* Hyper-V hypercalls get bit 31 set in EAX */
> > -	if ((input & 0x80000000) &&
> > +	if ((kvm_rax_read(vcpu) & 0x80000000) &&
> >  	    kvm_hv_hypercall_enabled(vcpu))
> >  		return kvm_hv_hypercall(vcpu);
> >  
> >  	longmode = is_64_bit_hypercall(vcpu);
> 
> Is the variable name misleading?

It most definitely is.  However, @longmode is passed around quite a few locations
in xen.c, and so I don't want to opportunistically fix this one variable.  Though
I'm definitely not opposed to a separate patch to rename them all to is_64bit or
something.

> If the vcpu is in compatible mode (when guest state is not protected),
> it's in long mode, but the code goes to !longmode path.
> 
> >  	if (!longmode) {
> > +		input = (u32)kvm_rax_read(vcpu);
> >  		params[0] = (u32)kvm_rbx_read(vcpu);
> >  		params[1] = (u32)kvm_rcx_read(vcpu);
> >  		params[2] = (u32)kvm_rdx_read(vcpu);
> > @@ -1696,6 +1695,7 @@ int kvm_xen_hypercall(struct kvm_vcpu *vcpu)
> >  	}
> >  	else {
> >  #ifdef CONFIG_X86_64
> > +		input = (u64)kvm_rax_read(vcpu);
> >  		params[0] = (u64)kvm_rdi_read(vcpu);
> >  		params[1] = (u64)kvm_rsi_read(vcpu);
> >  		params[2] = (u64)kvm_rdx_read(vcpu);
> 
