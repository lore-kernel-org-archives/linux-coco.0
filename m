Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794252991;
	b=cW5dRcG/kHBuKF/7pta62Lsk2UmtpHISM/U+JG0DNg2VRa9obZvSus28cQU7vdmdcT4m
	 Ynmj8KY9Xh6Bm1AfY24w0vBgiIU3L6crshtVus/PE3FVU6G9aoCqam6RlkhS8ZFM6k3IA
	 oxTPH4aq5LZETv8QjNSxviaspE5cfYVmjamZarD21xkE1ZJuvZvLZrs2/AZ8odZxk+Jkd
	 xJL3FNsYXzve+3Wjp/zYUmcNxD7FDzeU3+lc5hI8fZek+UWMfgKd6MstjuP3FOMUVD5nS
	 9gvfEmfni6BM79yWy+7B4lWMmcWU/9HY71hweGwiQeg8UCU6lxc1C0dEyNfCOj4wlJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FNS0rvY8L2G1kXx/9AEiQVl5+WbZi21fC5nZTW3I69E=;
	b=aZT2xYuW3hgh5PgW3l9Syo/bvbLVDBWossaAmVct+ZCYqQS3vPydj8osnFTMg1nvfE7o
	 yvOSmzJN5QL7rYOfnns0zuC7/aY2wJDlubABuISTWtwkdB7FEWWZ2R8dlgATXIlf1+WTD
	 SG7Cz4l+6uZGJheY46O1iTNKnF5P8UkI2UpWLk0EgHPiSDmPBv29tm0JbFZk6DpfPg95x
	 OlqJ+EDmoHO8lzJAq5xpwWWFqXvUKbQn5q7NdYxkLSSbUH7AEk8aK7Hl0wyp2zgyBMYH/
	 bdK9Q7V82IuhfAC3+VjJCpmnTVMUwmzIkubgXtDEDLUMFK55uy70+Am0DoHkpZPeAag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gITAKGlJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DEF606A321
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 19:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84DEF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gITAKGlJ
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso12926856d6.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 11:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794252989; cv=none;
        d=google.com; s=arc-20260327;
        b=pNxWH0IK9qI8xUOrQ6qkhe1MWETyZbiRTUHZfBoQSbFkYzpGXIK5tgoRU5LQof9YpR
         r+BzgVaBdOMcGHpyLp0Sn05RYJXshhM78ImnRmLfwbgSOtjs4F4SfrfEyBBJKfxxtrDS
         j+Lfqd48WEtZEAbKlG13/riLg9jIrR1drxO27JZo+KDeIvbUlQczOYos6aLjxCqvC/D5
         ylxuVDdXC731cnT3NZiwtIOEz1uDwhiANn43Ka2X5F/CUbCeWs/yxY/KY0QYONpYuBMw
         zRMgpM1I3zQF6ucnRIrJ2agRh81Ox0hcGn5KF+5fYIJKq6dtzrCQghEFYuttD9vkKEmY
         o0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FNS0rvY8L2G1kXx/9AEiQVl5+WbZi21fC5nZTW3I69E=;
        fh=PsT/G1/9Sv+NZSPHuz5T7O8GHfAl3VyCpZq4UIknM9U=;
        b=jFPTE2Ty07oxonRRVG+iRdflkQuk51z0SvEK1uTAhO5rgp6rOsfNWEiIEJA+HXn5MQ
         AfBGvjlfFaY5rF9bmPt+V0F3+b381CYNQRtxAkYUtQP8rXLmRhTWlWIlzmE3Fe/XEBMi
         2QmRq5p4rU4fAF78WpgZ7kSEQkHOg3YGWaXGin3Hr5ojBz5zBsmw421XzGVqOS5K3WnC
         2yFT196+3DJP10vlLrA4xE/3/1Ovcp4rLQ8HdfjUEuqm31zP/th/YFmDx2H1UgpPoMzH
         rN10AA3ZabXYFLwV/Gqe1gMpAXgIDxLekjjCjH6gEnBBhTjLQV4JQ623BRsYyexO9Fp7
         Rp0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794252989; x=1794857789; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNS0rvY8L2G1kXx/9AEiQVl5+WbZi21fC5nZTW3I69E=;
        b=gITAKGlJAvqxSazHbxADsFNKRWFbEGWJzXzSfJNTUKzX7qz4mr8rAV1wCzKBgdNK8W
         ysTVhx7qBl+x5hPKBOTLa0rGQwXrGXD9E5RxR+GvdzgDncuUXrEDdXEsKfGYk4H3Fibv
         MnBiDeE3lPWrDdrbyi2gT40h3kFtXVAA4III8x1d4tu7lBD0M58VLJqNyn/XIGAevhXm
         qkC5ZE2CBiTNNReiOT10qpYVoIA0+Y1aDwNvPK5V++ZnXuLOLWp8eEBtypQo72EP7Zdz
         EbLwYlWuuykVTGorDtQ/9yegTJfZY8FMn1Srvsb5dauqYovexZtXktMe3dHvkn+3kXNm
         rlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794252989; x=1794857789;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNS0rvY8L2G1kXx/9AEiQVl5+WbZi21fC5nZTW3I69E=;
        b=VYxCBbkfk9gcQOZBx9m16JKAha798VLCMX2j+mVQ9G0pnybSBCxOUj6vZAMYOs/C0m
         qR9wisL1m/sBhEo/7DLxRPMZ/vZgnOi5H8SquWtdLg3qB6rNXiM/G6LB4VeSoZQ7nKTk
         3wjDmJ10/SUZ6/nDk6ElefOxOEldW1xpv16Blfboh1LelJm0PWD7WcXOymTvuF0e45ZE
         tV6lu46IKR1JcBisoBpcY3IeITAfVf2mqwyaSI4AN296qZcY0wtQwuXlgh9w+pkOE/QE
         Ed+zAq1ui6zkiELNxgIABSIC4Y68cpPQaOaLleWdH33OKTHYvfN/bkHt13jBfaAFCy4T
         6UIQ==
X-Forwarded-Encrypted: i=1; AL+hErFARQW8dctw28W2dxWUW/54QkY8ugPMjJpam9ntjZkconktxvUwv8XZy4cIkOhCNg72G5vcoTwduSid@lists.linux.dev
X-Gm-Message-State: APuU4Z9ki9IN9ngNvsBEpcfFeJ7betlteLpnHAdNXdwc8bd7a9TV6F+I
	eNwqRBs+nKq08rrpFcmVle8eMLnGKDnR6wKWDLp8VpairYM93czhpAl0skS9MIohD23pEPNaEs2
	maCw+4/FKbSz+VWrmIWccm9FIc966uYs83AzeMVYE
X-Gm-Gg: AYBFou0r8ie7Xz4SXN3yTAESgFxQI2TTfG9EaQYhUkp5fVORqE3y8VhH51s6HZ82Aoh
	FujivvEwjY6FPoEFKhbuurAFTwqiwssISsrAQ9wwidvgNH47Aol/u7Zpl8UYOIK4UMDHNd3naPL
	NyLlQpfNBxkEp8x4XLy4dyI7vJvpu1IXVLJVA9okQwHEYn7LNKpKxNyEyHhQXCjINpwJsTesLy1
	VNZpqNVj23tpL1rdp48jP6Lk2dyiAInW9rqlDviMNOveYBWQjgAeRXGiQe8VCpbmk3oUHJbVNTk
	rcTcAX2u7Wv6RmJWCbe+03H83re+SS/YttUA2iyaU7Sy8P4EdPRltOyKuqgMfDk2UAXLACDXZ12
	rovqvpxVrBTFpVge1FJgARWDPZkwmVo2JtIjw/9CH1jEYyRh2pYGs13zl3c7pI5hDvkiEG5er1Y
	L6gwiz83p7BiLjKZzaRkqw2IA=
X-Received: by 2002:a05:6214:5bc5:b0:91e:8cb1:b84e with SMTP id
 6a1803df08f44-91eef92240emr10728756d6.24.1794252988739; Mon, 09 Nov 2026
 11:36:28 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:36:27 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:36:27 -0800
X-Gm-Features: AclHuK-BA2NXsbSfd5J99KlC06brlgAuU8dZlouTP4cLRD_A5AkBQuIm7WWoo_s
Message-ID: <CAEvNRgHKQVLVza1dw9-OrDAt4-b6zbhx4T64D421sqb2MPWs0w@mail.gmail.com>
Subject: Re: [PATCH v16 03/20] KVM: selftests: Initialize the TDX VM
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

>
> [...snip...]
>
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> new file mode 100644
> index 000000000000..564144c40f0a
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include "processor.h"
> +#include "tdx/tdx_util.h"
> +
> +static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
> +{
> +	static struct kvm_tdx_capabilities *tdx_cap;
> +	int nr_cpuid_configs = 4;
> +	int rc = -1;
> +	int i;
> +
> +	if (tdx_cap)
> +		return tdx_cap;
> +
> +	do {
> +		nr_cpuid_configs *= 2;
> +
> +		tdx_cap = realloc(tdx_cap, sizeof(*tdx_cap) +
> +					   (sizeof(struct kvm_cpuid_entry2) * nr_cpuid_configs));

Would be nice if struct_size() could be used here instead of manual
calculation of the size. Same below.

> +		TEST_ASSERT(tdx_cap,
> +			    "Could not allocate memory for tdx capability nr_cpuid_configs %d",
> +			    nr_cpuid_configs);
> +
> +		tdx_cap->cpuid.nent = nr_cpuid_configs;
> +		rc = __tdx_vm_ioctl(vm, KVM_TDX_CAPABILITIES, 0, tdx_cap, NULL);
> +	} while (rc < 0 && errno == E2BIG);
> +
> +	TEST_ASSERT(rc == 0, "KVM_TDX_CAPABILITIES failed: %d %d",
> +		    rc, errno);
> +
> +	pr_debug("tdx_cap: supported_attrs: 0x%016llx\n"
> +		 "tdx_cap: supported_xfam 0x%016llx\n",
> +		 tdx_cap->supported_attrs, tdx_cap->supported_xfam);
> +
> +	for (i = 0; i < tdx_cap->cpuid.nent; i++) {
> +		const struct kvm_cpuid_entry2 *config = &tdx_cap->cpuid.entries[i];
> +
> +		pr_debug("cpuid config[%d]: leaf 0x%x sub_leaf 0x%x eax 0x%08x ebx 0x%08x ecx 0x%08x edx 0x%08x\n",
> +			 i, config->function, config->index,
> +			 config->eax, config->ebx, config->ecx, config->edx);
> +	}
> +
> +	return tdx_cap;
> +}
> +
> +/*
> + * For each CPUID leaf in @cpuid_data, filter out unsupported bits based on the
> + * capabilities reported by KVM.
> + */
> +static void tdx_filter_cpuid(struct kvm_vm *vm,
> +			     struct kvm_cpuid2 *cpuid_data)
> +{
> +	const struct kvm_tdx_capabilities *tdx_cap;
> +	const struct kvm_cpuid_entry2 *config;
> +	struct kvm_cpuid_entry2 *e;
> +	int i;
> +
> +	tdx_cap = tdx_read_capabilities(vm);
> +
> +	i = 0;
> +	while (i < cpuid_data->nent) {
> +		e = cpuid_data->entries + i;
> +		config = __get_cpuid_entry(&tdx_cap->cpuid, e->function, e->index);
> +
> +		if (!config) {
> +			int left = cpuid_data->nent - i - 1;
> +
> +			if (left > 0)
> +				memmove(cpuid_data->entries + i,
> +					cpuid_data->entries + i + 1,
> +					sizeof(*cpuid_data->entries) * left);
> +			cpuid_data->nent--;
> +			continue;
> +		}
> +
> +		e->eax &= config->eax;
> +		e->ebx &= config->ebx;
> +		e->ecx &= config->ecx;
> +		e->edx &= config->edx;
> +
> +		i++;
> +	}
> +}
> +
> +void tdx_init_vm(struct kvm_vm *vm)
> +{
> +	struct kvm_tdx_init_vm *init_vm;
> +	const struct kvm_cpuid2 *tmp;
> +
> +	tmp = kvm_get_supported_cpuid();
> +
> +	init_vm = calloc(1, sizeof(*init_vm) +
> +			 sizeof(init_vm->cpuid.entries[0]) * tmp->nent);

Would it be possible to use struct_size() here?
Or perhaps kvm_cpuid2_size(tmp->nent)?

> +	TEST_ASSERT(init_vm, "init_vm allocation failed");
> +
> +	memcpy(&init_vm->cpuid, tmp, kvm_cpuid2_size(tmp->nent));
> +	init_vm->cpuid.padding = 0;
> +	tdx_filter_cpuid(vm, &init_vm->cpuid);

How about something like this?

1. Query TDX capabilities first to get tdx_cap->cpuid.nent (let's say N).
2. Allocate init_vm sized for at most N entries, since the filtered
   result can never exceed TDX's supported CPUID set.
3. Iterate over the TDX CPUID capabilities, look each one up in
   kvm_get_supported_cpuid(), and append matching, masked entries
   directly into init_vm->cpuid.entries.

This would avoid the memcpy and all the memmoves, though this works
as-is. Just an optimization/different perspective.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> +
> +	/*
> +	 * Set attributes and xfam to 0 to use KVM's baseline config, as KVM
> +	 * automatically ORs in the mandatory fixed-1 bits during
> +	 * KVM_TDX_INIT_VM.  Note, TDX_TD_ATTR_SEPT_VE_DISABLE is not required
> +	 * because all initial private memory is pre-mapped before running the
> +	 * TD.
> +	 */
> +	init_vm->attributes = 0;
> +	init_vm->xfam = 0;
> +
> +	tdx_vm_ioctl(vm, KVM_TDX_INIT_VM, 0, init_vm);
> +
> +	free(init_vm);
> +}
>
> --
> 2.56.0.455.g6c5a503b38-goog
