Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109949;
	b=K91p1Znmqh28FWzIrbKHl+NZ1pJwi8nIc0iL4E+ZajiFx0kxHnAlNieJeqr6RoJ8FbMX
	 3Hr3c2us4SAuqx3LmBy2v5GAN4H14zggewjaHDm2mc6z7vn7SepPa1MdgJk/FysqWimOi
	 ZmkowGMfCoW9aptzLgTYhfNUIKhIvm1ba8Mfkz6cVjRKqFe17AvXJeQSA7ePHHyrH05m6
	 ktEP+SuIgftFxwoz03JMi1M+9ahBvXoPKdQ+cRt+iQsTpkqk5/ZXei1u5URrf6tcJ9mkJ
	 k4SmSkkmPFJi3lwCrooWle0Beom51zpAGl1PUDGaf/MtBnqRHKlr5bR1zuPwOz9Llpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ScKNcqWNcrrNfUJK36ONgLidCscYb0P1HQayNuGC1DQ=;
	b=jBtaPyFLzM6ZElgwGIVzJ96jLVxJcgu42UFrVE9sfAXds3PczwX8PNDQqyANBXm9ZOod
	 31QCXgmyb6CwY191ZXhtmJWEYxSqTo4uahX0eWG0LbzdbYoIZQOuunIlplkzjfV8VwWOo
	 DIwbtX6iHb3sjw4yurA3WchcUKxHu25o9rL8Fl6c2f7oxFFFp3Kkq3lHQjYvxBtOqpkJ0
	 sywLX9DTIoopC7pxJm9ZZ/Tr86n6p9+a8E0AnUzIJR3FuekmC7JmDRne2AnLvqelHxFon
	 pwKoAuRizDA9CHS2W2Bmnom9MxUMjf26JjVJmC4mdbIwvr8fCzqLjvszn4O/1pXC8Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=HxurlbMN;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEFE606A31A
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 14:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBEFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=HxurlbMN
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso7053917a91.1
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793109948; x=1793714748; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScKNcqWNcrrNfUJK36ONgLidCscYb0P1HQayNuGC1DQ=;
        b=HxurlbMNRvTjTn6mulpUEjGonhRQbd9InZzaM6Rd4fqQgZRgq5saC5HAsJdw8U0IB/
         l0zP5ky74fPGMdLhV6pbU6mK5B0439v+WDZjZddByWYwCy/P2pnpEqCNctnEIOgzM5al
         KyfBBuErjIXyqvLLh0kEgznlFx7bAmvPyiT4sEzsgEuzYptZTDl4Qre5IIqExvxdgoFD
         J3etxSSwZJFsO1U1XvKvCiOnMFyqG8KdL5y257pltEtboZawV/kbzgC0N1GaF4qahJqa
         nGpaXAxVYCRGeKJkwo7fp8eX5bncMm4anv+x1fuTDjUrMjuRdnsKei9hv3/zpirFkoD9
         U64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109948; x=1793714748;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScKNcqWNcrrNfUJK36ONgLidCscYb0P1HQayNuGC1DQ=;
        b=fNHi7UwK+WeFSHB7n9cnnFiWaPArjBZ5NlaAahljRoZUqA+VrjTBbaxKTlUf1ISbyK
         admfJrJRllJH1Qybyle9obswa9fI3D3CX9g0exUxi5h0OfmRfzJ84+B5fg/oEKQ7WsuZ
         CfHdVfxjNPUhbgy+qSHdFOOnZ3GU8Hvo48tZwIKS1TtPBvIUf70tik3WNdYUW81KQDZ3
         LnD+rgOYzQb4MwhHWOmz6v4EO1FBeIIFA7OwtoK2F9w8KtSi5slx9ZCqzE/YAeAY9Vve
         Yq6dqd35rTwkuf8yY1nLTpa+UJ7uW0DITxysIk7zpPtMoI/Mv/Tvfh0iiqyspzLF611l
         k8/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwC4muy5TKl1vhny0mNFMw9D3V/DbjFnmlJLYU+QLHoNcyd+VTEFUKNaamx2AkVEaGWQJBN+g2WI7hx@lists.linux.dev
X-Gm-Message-State: AFq9FYIr+9Q078kGkgd2cXJoEBKxeicFDVWh7zVLWWkm/rdzOyqnQLxK
	H5aWbz1ONC1j/Jn1nOnsoHDLvGT7/48/URvn5kgvS9Ov7s1mvBGAsgULIJf7QRZDbX7wNdFTO/K
	eBarSuw==
X-Received: from pjbsb7.prod.google.com ([2002:a17:90b:50c7:b0:3ac:6795:2cbd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1cc4:b0:3ab:c80:9370
 with SMTP id 98e67ed59e1d1-3adead57e85mr7634057a91.20.1793109947891; Tue, 27
 Oct 2026 07:05:47 -0700 (PDT)
Date: Tue, 27 Oct 2026 07:05:47 -0700
In-Reply-To: <741bfe7c-5d21-4c6b-98c0-95b01a2a21f3@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261022210134.612848-1-seanjc@google.com> <20261022210134.612848-3-seanjc@google.com>
 <741bfe7c-5d21-4c6b-98c0-95b01a2a21f3@intel.com>
Message-ID: <auCvuyY7tTg7ISwR@google.com>
Subject: Re: [PATCH v2 2/3] KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate
 when filling CPUID entries
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 27, 2026, Xiaoyao Li wrote:
> On 10/23/2026 5:01 AM, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index 271c2f94b8dd..37d088f6f7a8 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -2,6 +2,7 @@
> >  #include <linux/cleanup.h>
> >  #include <linux/cpu.h>
> >  #include <asm/cpufeature.h>
> > +#include <asm/cpuid/api.h>
> >  #include <asm/fpu/xcr.h>
> >  #include <linux/misc_cgroup.h>
> >  #include <linux/mmu_context.h>
> > @@ -163,12 +164,23 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
> >  
> >  	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
> >  	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
> > +	entry->flags = 0;
> >  	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
> >  	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
> >  	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
> >  	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
> >  
> > -	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
> > +	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
> > +		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
> 
> I think the WARN_ON_ONCE() is very likely to be triggered in the future when
> people run old kernel with new TDX modules.

Then upstream patches to make that not happen.  Intel insists on treating the TDX
Module like hardware.  So, treat new TDX Modules like new hardware.  Upstream
support for the new "hardware" before it ships, cc'd to stable@vger.kernel.org
if necessary.

Because IMO, the WARN is doing exactly what it's intended to do: alerting the
admin that they are running a potentially dangerous setup.

> > +	/*
> > +	 * Explicitly zero the index when it's not significant, even though it
> > +	 * _should_ be meaningless.  Userspace relies on the index being zero
> > +	 * (the ABI was inherited from KVM_GET_SUPPORTED_CPUID).
> > +	 */
> > +	if (cpuid_function_is_indexed(entry->function))
> > +		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> > +	else
> >  		entry->index = 0;
> >  
> >  	/*
> 
> 
