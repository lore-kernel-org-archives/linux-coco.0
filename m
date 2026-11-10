Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337040;
	b=eJQQk0wJZFBbZw8qDw6udcLQlJ0HqbI0YAP5DkZxlGax+rKB/VdUntTy/tCPU71/XKG7
	 Oi/I+0Mmy15lP9Hjmhe3L1LS44xFlvA6Gs7WK9xJbjN3EFHBmURSoafx2EwIROkxu8/SJ
	 AK7ArGernHnpoxPwxREDipVdQ/ewDVVzqTH1kfi9rnytT0cY12mpf/Je7bqg7yIV1Cee+
	 tvsQUiwqtQEccyDCBdrgvo3MaRvaAtCpS/9hmp30ZL2CBEga5Mf1aNeWMEvDxGQRKl4aA
	 lotrLtImgS9iRTxRLnhbSjp23ky54EK9gyJJKIZofu7CQftfaBNUUFodmcWlngmRnrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=AQuihqHEux/S4RsBANsKy60bFVxIx3B8NgZdRBTW2qo=;
	b=BvzRgH6ng1qS1ZpUwCvJ4Fk1P0pmSOyDZN6P73Ur81IZ5DBmOUYF4Hs6zsb8yPrpMQcY
	 mW2LIe2W4quUfOeeVouGF9JGpYgdoHCgPNJ+t1Xi8o0vdySDy5YbUlBUW81gRVUmvAzHo
	 TL/6XoaXbOuuWe5Db6EAanpG2n2LItsQGG/mY2VEDG1eJnZ3jbzxqDmELIOQkrrYwuICF
	 I7Z+Jon655s/uLZII16j09q4wG3QFwWVRhl9zutWdeNgHwURpUumS+v5zoh3GtNtGSQ73
	 7arqiAPUWgzK3CRhPds4AJBaBpkWZhd7NF7rs2DerP5fByvW8F6YXXKsyuTEk2cZUNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HwipguUw;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE5C60A2610
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 18:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE5C60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HwipguUw
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so3308421a91.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 10:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794337039; x=1794941839; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQuihqHEux/S4RsBANsKy60bFVxIx3B8NgZdRBTW2qo=;
        b=HwipguUwLyaZzT54Dmt0K3mhnA517W7KgIh86y7F/p5A60NrfQQaee9HVL3Y8vh1ld
         Xk/zlqGWZoxy60WljZNG96C+yR7o2N4S2nNFqPsalJohs4hGhJ92P8ENLDL7K8XMHjrU
         8w5TfC+W1PqJ8abuhTdRoaFAdkz1uvRAJZnvMv3/ixm/+0d5zTWX1QQyD6IwcO9QuUld
         +K/pRjzdnHP3SDcL1W/Lud0VEfG04k04GCsyUj6HosHKh1h20m7QkgpNRs5FU2nVdULi
         SIms4WHlOocC5+14G1GkSdUEwcAvwMlzcrW5diW+r/XdjQghARsUhtRCgHyUaLGBab5Y
         SlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337039; x=1794941839;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AQuihqHEux/S4RsBANsKy60bFVxIx3B8NgZdRBTW2qo=;
        b=0xH4GdF4Lg6s781KfEKUADQRStOs0jCHGa/Tm9+WEagvaoipPlPMs8pf9lZF3+S3a9
         sqyI33fMJc355kEhJ4t4X0XlZb8PTp+m1rVwbCC4fBINk8NPVWwEjY4t/87FnkkrQKBG
         DoG5LYpqAGtH5dq0TKTPcqX0/sUpukJEeYg9vUdxPIcJTExABndKtXfpfWa3cm2TcoVh
         wfd4LgCAMVuLKHE0y68QoEwRgMQZrWDHAchgGeinZXb+zgBCO4TYR25Nxa6Q9R+pzMb3
         4jzjqDT1PzLtvbLvLoUHghdmIzP1dIXb/Q8K8VCml4Wmn76+127nAzRRBXBIQv6ct9Ic
         4y1Q==
X-Forwarded-Encrypted: i=1; AL+hErEVf/u/ya5lQTXJU+IiPo6LI5Q2cakPasdw3cujRBhWnwTbqpw8oGjrTj9RUxWGtSwzBlaEQKgAXC3E@lists.linux.dev
X-Gm-Message-State: APuU4Z+RFY9fNcEraT/AgRqYIhgWTDx02ysk8nU8MpzxjsN0603rg1Mg
	WvfSHPlyMLcBlSkEW131RCO6yrUYfo18NKdwe7IAGGRJ7m9n/cwhDHL0rySQ+M7NHzl3uhKMhm/
	3kLduIw==
X-Received: from pjdq9.prod.google.com ([2002:a17:90a:2e09:b0:3ad:32d0:ca0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c88:b0:3a0:ca1d:b40d
 with SMTP id 98e67ed59e1d1-3b166ce0e87mr3977029a91.55.1794337038803; Tue, 10
 Nov 2026 10:57:18 -0800 (PST)
Date: Tue, 10 Nov 2026 10:57:18 -0800
In-Reply-To: <CAEvNRgHKQVLVza1dw9-OrDAt4-b6zbhx4T64D421sqb2MPWs0w@mail.gmail.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com> <CAEvNRgHKQVLVza1dw9-OrDAt4-b6zbhx4T64D421sqb2MPWs0w@mail.gmail.com>
Message-ID: <avNpDjWxrgThIUXE@seanjc-mac.roam.internal>
Subject: Re: [PATCH v16 03/20] KVM: selftests: Initialize the TDX VM
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 09, 2026, Ackerley Tng wrote:
> Lisa Wang <wyihan@google.com> writes:
> > +static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
> > +{
> > +	static struct kvm_tdx_capabilities *tdx_cap;
> > +	int nr_cpuid_configs = 4;
> > +	int rc = -1;
> > +	int i;
> > +
> > +	if (tdx_cap)
> > +		return tdx_cap;
> > +
> > +	do {
> > +		nr_cpuid_configs *= 2;
> > +
> > +		tdx_cap = realloc(tdx_cap, sizeof(*tdx_cap) +
> > +					   (sizeof(struct kvm_cpuid_entry2) * nr_cpuid_configs));
> 
> Would be nice if struct_size() could be used here instead of manual
> calculation of the size. Same below.

...

> > +void tdx_init_vm(struct kvm_vm *vm)
> > +{
> > +	struct kvm_tdx_init_vm *init_vm;
> > +	const struct kvm_cpuid2 *tmp;
> > +
> > +	tmp = kvm_get_supported_cpuid();
> > +
> > +	init_vm = calloc(1, sizeof(*init_vm) +
> > +			 sizeof(init_vm->cpuid.entries[0]) * tmp->nent);
> 
> Would it be possible to use struct_size() here?
> Or perhaps kvm_cpuid2_size(tmp->nent)?
> 
> > +	TEST_ASSERT(init_vm, "init_vm allocation failed");
> > +
> > +	memcpy(&init_vm->cpuid, tmp, kvm_cpuid2_size(tmp->nent));
> > +	init_vm->cpuid.padding = 0;
> > +	tdx_filter_cpuid(vm, &init_vm->cpuid);
> 
> How about something like this?
> 
> 1. Query TDX capabilities first to get tdx_cap->cpuid.nent (let's say N).
> 2. Allocate init_vm sized for at most N entries, since the filtered
>    result can never exceed TDX's supported CPUID set.
> 3. Iterate over the TDX CPUID capabilities, look each one up in
>    kvm_get_supported_cpuid(), and append matching, masked entries
>    directly into init_vm->cpuid.entries.
> 
> This would avoid the memcpy and all the memmoves, though this works
> as-is. Just an optimization/different perspective.

At this point, I'll do minimial fixup when applying, e.g. if switching to
struct_size() Just Works.  But I don't want to do anything more invasive at this
point so that we can get TDX selftests landed asap.  To be clear, I'm not opposed
to more cleanups, I just want to do them on top.
