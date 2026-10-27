Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112921;
	b=Narl8EZxpzrMcYnoSs+5QuDxJWLZTyzFuOcwxe+mi8Xyz6SjT/Pmr2a7NvFPWvpuLEVu
	 Max1UOBq9Y4nObF1N6O/FbQ7u7UVOi+0uwUKUUl8f4BTePM7uK93ssHlmgzVHjH7jRnxE
	 klu7lqoMXmSIYo0750xTihZzMRlg0ad3LLCYKBnrS4YKf364AwXVzqj60Vx3/RVvLJfvb
	 rls/1AfbCV9hq6F5RLeyl1nju/u00jFY9wc1xYEl2Kt3CrthgqZQ94v3qS6jeth/soHk3
	 8TdIywTp9svC9OO4euTSQYMLWjSSYTpIzuv6hYlf9HDyTSMrPmyW4dn/zt/ORHCZfbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1DehjZ5BL8d0YnBEeJuu65Ld1wB1OE7I+m9Hy0VoO3I=;
	b=fQqRHGG3H0AC+JmcSzAMSpOQIatgXQlp32QD2I8IPV0YAbXbE7YVbDjrieyfXUS2g9mb
	 YF2LVTE3GUvzK2p3TKquILs2UsU6FSwGnAf2tBgEbjWiOJz+dpv19WIXumN8uOKQXIwmf
	 6uDsVnw7/CxyfD7dfBHfPaDNcIJ+JfHeiBR5Vmr2/XBC18KCyIdVsohNfBF64ig55XZ/q
	 Qati2sgYYl5YE/TpdLt4za/dW4VKp+trEqAECks/bkzHLpwSXi2y1jIYCJrEEGNdNCGgf
	 6lgu0JhJ0ab3urJJ424p910tLzjzxdqM2/tFD/tV3mILO3ws2E2UxGMdDNxNJwlF7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nZupIfEU;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69DF606A31D
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 14:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B69DF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nZupIfEU
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adbc9a47fbso4169094a91.1
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 07:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793112920; x=1793717720; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DehjZ5BL8d0YnBEeJuu65Ld1wB1OE7I+m9Hy0VoO3I=;
        b=nZupIfEUx9sx42VWb3BAzrEc57RtxPd1utyGKdHghOkVcauTUa+1tu7RBRhEX5/MjG
         +aotVQPKPuG+bA9gsxVodjxR4hDrrcMnHD3LKaAJAeUfxaTdNYsbgMHrJL8+9mkLPR1J
         7h2jx6/LRx1LK1LYtTO0/fnN3z+IhPA7ZlWs0WD4H23hQtritDqEgFfycTft2W6TTXPP
         koyl14UXNfvRG90MdM9ImzuOGK99QPhaCK79QZM62cHrfWhtPzN5ZIgumiVVh7s5yCDw
         CXnZz7o6Mt36aKDumA5HZma+RV/B/5nSYhaga9C3s1LlWXx8+VV3a+xjQ/5d9F+yKZx3
         uGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112920; x=1793717720;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DehjZ5BL8d0YnBEeJuu65Ld1wB1OE7I+m9Hy0VoO3I=;
        b=zItVlgAdx0gnEWyViWqrPYMckVaWRcQ8/kOML54sYZu7mtt5DI9W5Mi2j1kpAmwYH5
         7xmisCg63TyxcYZwC5SwOqolGUszxIZ7TeaOuR79e6ZoYM6InFk2Qo+es2DML6/4U7b9
         yB7Y8//WwIpb3gi0dkSLAEzR9Gbu4yVUm0i/WhM6jdgsStPv9zauP9JTpl46LTT8DOkn
         Bdysa65CYKG6p9Q76212hnXAeFKpiRJCJMAVf/90qz2/QnDiaMBMNeJlnOjr0teIiFQl
         uVK14HRNX4RAxlz/mQQqs4zT9ESa9MUDdD518tNHHz8k3G358i8sKsFmRUz87uNI2v0j
         x/pg==
X-Forwarded-Encrypted: i=1; AKwUvBz4oGZhIgnVBjeLGZ5WECf9J9jhjLyDhILUp4KoleckwXj1hwi4nsOGyDLsup+F3SslrgQ0gqrsdfkl@lists.linux.dev
X-Gm-Message-State: AFq9FYKZX/CgA/Ou+7VgxCHHnlqyfUrv62aTAsIzWWsxA3bnJSWpeXzh
	5vOg9tbW6nURXoa6aukxpy5s0wEiKYIVeqXzg5RB5MHF9krGNXrBvrXKKPRGN/8VefCS3/7nSt5
	vSTziCw==
X-Received: from pjtn20.prod.google.com ([2002:a17:90a:c694:b0:3ae:1810:840c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:590f:b0:39e:4c81:6c5f
 with SMTP id 98e67ed59e1d1-3adeaae86acmr7469745a91.26.1793112919756; Tue, 27
 Oct 2026 07:55:19 -0700 (PDT)
Date: Tue, 27 Oct 2026 07:55:18 -0700
In-Reply-To: <6c156bb3-a04f-4d4e-8611-b1e93359e8ad@intel.com>
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
 <741bfe7c-5d21-4c6b-98c0-95b01a2a21f3@intel.com> <auCvuyY7tTg7ISwR@google.com>
 <6c156bb3-a04f-4d4e-8611-b1e93359e8ad@intel.com>
Message-ID: <auC7VoynSWStxCg3@google.com>
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
> On 10/27/2026 10:05 PM, Sean Christopherson wrote:
> > On Tue, Oct 27, 2026, Xiaoyao Li wrote:
> >> On 10/23/2026 5:01 AM, Sean Christopherson wrote:
> >>> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> >>> index 271c2f94b8dd..37d088f6f7a8 100644
> >>> --- a/arch/x86/kvm/vmx/tdx.c
> >>> +++ b/arch/x86/kvm/vmx/tdx.c
> >>> @@ -2,6 +2,7 @@
> >>>  #include <linux/cleanup.h>
> >>>  #include <linux/cpu.h>
> >>>  #include <asm/cpufeature.h>
> >>> +#include <asm/cpuid/api.h>
> >>>  #include <asm/fpu/xcr.h>
> >>>  #include <linux/misc_cgroup.h>
> >>>  #include <linux/mmu_context.h>
> >>> @@ -163,12 +164,23 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
> >>>  
> >>>  	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
> >>>  	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
> >>> +	entry->flags = 0;
> >>>  	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
> >>>  	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
> >>>  	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
> >>>  	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
> >>>  
> >>> -	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
> >>> +	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
> >>> +		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
> >>
> >> I think the WARN_ON_ONCE() is very likely to be triggered in the future when
> >> people run old kernel with new TDX modules.
> > 
> > Then upstream patches to make that not happen.  Intel insists on treating the TDX
> > Module like hardware.  So, treat new TDX Modules like new hardware.  Upstream
> > support for the new "hardware" before it ships, cc'd to stable@vger.kernel.org
> > if necessary.
> > 
> > Because IMO, the WARN is doing exactly what it's intended to do: alerting the
> > admin that they are running a potentially dangerous setup.
> 
> For this specific case, does it mean every later patch to add a new leaf in
> cpuid_function_is_indexed() needs to be backported to stable?

If you want to ship a new TDX Module that enumerates features in those leaves and
works as-is on older kernels, yes.  Again, this isn't really any different than
enabling new hardware.  E.g. a kernel from 2024 generally doesn't work flawlessly
on a CPU being released in 2026.
