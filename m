Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F934466B4C
	for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635637; cv=none; b=b0VgzKjtig4mLcE4u3N7Li52ruPc2fvCr91QQHumzqGUjgrvrC20MwXpr8VEGcZGs9VRF0fCrUyGapYQ61LFvoDVZeOeZVgA0xdZPslFe5aZ7+gHr6hRFxubJm40SmRuaF6qKYgYIkSWJBQHb0+EXPpnM7TvYxa03PtwUJInbnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635637; c=relaxed/simple;
	bh=buTnY0ETqHFz9mHm8vPYqufrzuCw85DNR5Yn8mLP9Ew=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fvg1U1ZGnrf25frtLMipj5gnvaBPUgWe/mz52GQeHq/uWchiZTHFE38aMX7hx6Mbcp01zURAKFRRanxWkRqj34/KRrFZ9+YIgk5SZaQ0BHt0Ueb848WotOtagU39jtljUtRClj3YE9gvNm/KrVSkswZPZ+j4WtKyQ5FXSZNTHpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LZjDGJqL; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LZjDGJqL"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-842211d6e48so5803109b3a.0
        for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781635635; x=1782240435; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vkLeRGdGFIEMQT4xMcSv70D3LKPlWrgZN2ISeIkos5o=;
        b=LZjDGJqLydcA7WvqC233y4LVZ9JkWIagm7kw21mqR4/WBpQq3bHdkKTz3Q+ulQMFfC
         jiNXv+gtYtT6fzBSGkBQDK9rxrbIqYsrLWpP0F9rnyF4Zm51xkw+Ti9RKfALhKCUM2lp
         Jf3oFp1eOoKmfXpgpgyFRObrpIu6UvtvvaJq2ZvrHKYOPWUaixQu2nTtCF4DCiwI4VtC
         VvLOwsB7jJZ6u0ftU9sF78cLe67LUaIf8kvVDaMroojV6/Qjdh5kJAbVcHOpeyReMPeo
         tOX0eAsWuWB9nE8txNl4uCzPzxr8ZKtQ7OUEHKZQs8+qW5i72UPRoGIHNGtkJQ4AMPTg
         TGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781635635; x=1782240435;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkLeRGdGFIEMQT4xMcSv70D3LKPlWrgZN2ISeIkos5o=;
        b=E9RG7KuJXUZEftM/ygpmHxdKtFEHd8pS2TNprWTaVhQaNPF72Gtv0YfiYZnh326QiO
         fLxv2PgqzlFB09MwFZgmrcnUjtzCDkszZswes5Aw1X+qN6+VGRh7bWLpQr7a9fljCi95
         XvrBCQjjmw12whgKRsUF+vGeIr6Ug0mikvQBHzbK1w+rYPCWPNJuZO8zN1vXbTWJ68Qn
         7moCUOGfDRfMi6p82akCPv5Fq4XBE48Vn1NXPui59qxeeaTUtI2nZ3w0r4fE9Wlk0CeW
         ZXEh8lGIWOe0enBW5Qq5X7dCCAeu5mc3XCer8X6I3fREOtVh8b3ZbKTIb9Hm7Z8ogTmG
         3AZg==
X-Forwarded-Encrypted: i=1; AFNElJ9qD/UO83Zi4ibEHTJ6apuqlsriwRamoNcSKKuPAzlL9soASDxJXWA3snjh6otrXUbkJbi/OC0sW3c7@lists.linux.dev
X-Gm-Message-State: AOJu0YxsuvjSxvAy5j7NfTjRLoHZEJXZGjTME4n4SCGeDUDGVkcWyuYd
	7SK3L/hzYI3YalvFrEtru//3HXCfcQalWst+TaImGjHDnBB7YQmOn7/PbT83vQDr8vNqJ/S02zD
	AVaFAqA==
X-Received: from pfjc12.prod.google.com ([2002:a05:6a00:8c:b0:82f:6a26:5f78])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cd2:b0:842:6849:2192
 with SMTP id d2e1a72fcca58-8452459cb0fmr338659b3a.42.1781635634170; Tue, 16
 Jun 2026 11:47:14 -0700 (PDT)
Date: Tue, 16 Jun 2026 11:47:13 -0700
In-Reply-To: <20260521-tdx-selftests-v13-v13-21-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com> <20260521-tdx-selftests-v13-v13-21-6983ae4c3a4d@google.com>
Message-ID: <ajGaMb6Lrk3OS8B4@google.com>
Subject: Re: [PATCH  v13 21/22] KVM: selftests: Add ucall support for TDX
From: Sean Christopherson <seanjc@google.com>
To: Lisa Wang <wyihan@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, May 21, 2026, Lisa Wang wrote:
> diff --git a/tools/testing/selftests/kvm/lib/x86/ucall.c b/tools/testing/selftests/kvm/lib/x86/ucall.c
> index e7dd5791959b..c8e3418d53af 100644
> --- a/tools/testing/selftests/kvm/lib/x86/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/x86/ucall.c
> @@ -5,11 +5,34 @@
>   * Copyright (C) 2018, Red Hat, Inc.
>   */
>  #include "kvm_util.h"
> +#include "tdx/tdx.h"
> +#include "tdx/tdx_util.h"
>  
>  #define UCALL_PIO_PORT ((u16)0x1000)
>  
> +static u8 vm_type;
> +static gpa_t host_ucall_mmio_gpa;
> +static gpa_t ucall_mmio_gpa;
> +
> +void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)

I think we should use an x86-specific GPA, not the first address past memslot0.
Unlike other architectures, x86 has a nice swath of addresses that are pretty
much guaranteed to be unused, thanks to selftests creating a local APIC by default.
On the other hand, the chances of a collision with a memslot just after memslot0
are decidedly non-zero.

Note, because CoCo VMS don't support read-only memslots, the TODO in __vm_create()
can't be resolved for TDX using the suggested shenanigans.

I vote for either the I/O APIC (0xfec00000) or HPET(0xfed00000).  We *know* TDX
doesn't support an in-kernel I/O APIC, and the odds of KVM selftests ever
implementing an I/O APIC are basically nil.  Ditto for the HPET.

> +{
> +	vm_type = vm->type;
> +	sync_global_to_guest(vm, vm_type);
> +
> +	if (is_tdx_vm(vm)) {
> +		host_ucall_mmio_gpa = ucall_mmio_gpa = mmio_gpa;

Drop host_ucall_mmio_gpa entirely.  "host GPA" is rather nonsensical, and KVM is
responsible for stripping the shared bit.  You can actually drop ucall_mmio_gpa
as well if we go with a hardcoded magic address.

> +		ucall_mmio_gpa |= vm->arch.s_bit;
> +		sync_global_to_guest(vm, ucall_mmio_gpa);
> +	}
> +}
> +
>  void ucall_arch_do_ucall(gva_t uc)
>  {
> +	if (vm_type == KVM_X86_TDX_VM) {
> +		tdx_mmio_write(ucall_mmio_gpa, MMIO_SIZE_8B, uc);

s/MMIO_SIZE_8B/sizeof(hva_t), because what you're writing is the address of a
pointer in the host virtual address space.

> +		return;
> +	}
> +
>  	/*
>  	 * FIXME: Revert this hack (the entire commit that added it) once nVMX
>  	 * preserves L2 GPRs across a nested VM-Exit.  If a ucall from L2, e.g.
> @@ -46,6 +69,13 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_run *run = vcpu->run;
>  
> +	if (vm_type == KVM_X86_TDX_VM) {
> +		if (run->exit_reason == KVM_EXIT_MMIO &&
> +		    run->mmio.phys_addr == host_ucall_mmio_gpa &&
> +		    run->mmio.len == MMIO_SIZE_8B && run->mmio.is_write)
> +			return (void *)(*((u64 *)run->mmio.data));

This needs to return NULL.  Either that or make this an if-elif.  Falling
through to the normal KVM_EXIT_IO check is not what we want.
