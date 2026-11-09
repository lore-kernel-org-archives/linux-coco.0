Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254141;
	b=r9nnAp+xJLAfgM1XBkStUJVy5eNbJdZhtoOZ1vIdVYMo0NnaAAIhQ7Q6KulDCNPrkqWh
	 fmpwRvlgciY4uHTTKV9oYRJoGbGh/FPkvHFBOP0KGjIfj1v/73Tkou7ATurptww+1uoqX
	 /Ers2eaiH7EEBpjZwCBR+Bl0MJLOtrRESfwWFqyI1/aIVzv3jas4MpiLbTLA1lFfoUgFz
	 gTtziIXoD9BmwYk1qUlRG0YHJ8vy/gEEwM5QyWLym+d0/Oj5RYtWBDEHo19iRokz0OAQS
	 czjT6KJ6i80LOhX5rdML1LQCTbzYFzugOSRVvJOXEtH5EFszrcMIkHY1AT4rg+SMN8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
	b=e++yLd8aRSXH0SRlvxgx8yqZzTzyV8pRPNvKY41EIV5PTrAFUO6+GqyRFOVQQQ+3h2fC
	 J1XoWRX/bM/k4awlUGYJPeDOiANvc+J6xKz9leRgXEdn3+XJRIvkvF+4Q3shgFJpOWlfx
	 t2EPM0XIK08JwWvglB2JPOG3517kqGjfYq1I1Sp8O+MOUmBRFE3sF5cUCTcwQVYZEydf4
	 OSx/H/jh/8WETwe1o6zMTacwXeu1AkFF2UYtLBJdQ6Jtx5hBhPrOr75vjy55LEWoF2i8i
	 Hq0Zs+xzhnBcqXsDa3CAQ3RKVea2gXhh8vCSPFHBGGckf79JU/7Klm1odNCo6otn02A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dmvIRt9J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2BF606A33D
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 19:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C2BF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dmvIRt9J
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f269e335eso142375585a.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 11:55:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254140; cv=none;
        d=google.com; s=arc-20260327;
        b=oz15hysj1EeqhXrJlVV6NK5jK+bWzV79OUM+WP2VWSGxHy6TsSkuKNlU2gu+LDLUB2
         mB6rtBVRlOkPjOqCMvwG6P08XkzOIB52Yv+AW9Ak8iC6mQ/MYIHDl4oia5Fj13qEfGBB
         Cv5jMvKPPkLUlrWpW9CxPhIwX9mD1yBmnwX5jzUXpkuRIUQPJEPLt9G0TB8zjPeCYof9
         btFni3xWU9/f87ZzxuLGX843VXapaXEGCwGYTsRjexMIT6q+iXnASc/ZykeAKRkrQjS7
         XQixIWvmWQ1lHs9TChG2yA7YKF+gpswL91lfu0j3xa5YaDs63UWDTYmbvhtd6KmEiOVz
         CJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
        fh=0lwN9bb8UrhmFY24F/8tVk5fPLXb9eh1OlZqgWPQF2Q=;
        b=PLtSOY4Nur3a5cOkPt7OP6xcVD5ksm6HWH2kmvqQmnkobW8E8KTm/YcmTSc8Z/n/S4
         lF+dRSpH5qy+ZPPfaSZJ1glIxil1A2GJBbGsOzpPer/UX+EefxzIrhPrGauXdH4c2B90
         Koi0/kGgtt/meH0/FyPTCMkDE5+2lHXeLpViiyjpfn48SClYn4ysQzYnKwccJK4x0nK1
         ZqylS7ygSamVkf8fhPv8QTz5KZUuukucC0UgQKUzAFWMjjqvgGFvb4ptTEdYKFk5CLqx
         IZvOnk/AOo5dQ1835TwsDmmwcveJ32Ah1+bXwpAWjDX6NsbhrX1UVTPUCaD+Uet7Rmqi
         RSuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254140; x=1794858940; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
        b=dmvIRt9JqQNJmcCVdE0REQCQ9PffwTWKIb+u1GV7ZPZTW0YwTC3p4u8QMtA6QrCM/C
         3+oUAuw2i0vPH7M/36iI3o23r2gw6Xtipw+sbYJg/fxTVXlnYrBE1S2FUM5VcjN8P2M4
         Uyk1D7ur4cua/FH/psxL715rGcLsjlCLe31xyAIMY2ENXkZkzHRxBfVlThLWoHR5zI4h
         R/KT7P/Y+xtBFEkbaFbjIWAzkY6jBPQO+acSEW14CD3LWclzoGQjms87UXdxzfwuicDA
         wqgFmBRDCI6qF2DWcpTldN1fT3QFj45d/OH/YNLSxwo2ZrW6A8OmUhk9deM1aUhZLPdj
         SgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254140; x=1794858940;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
        b=JPOzwVAoTLwKALj2zA3IPp8lYZ/UhNHLZTu7pOK2yn3z3E2+dneXlb2NG6luRfH0Wi
         1ykMcy6Y4v4daG/b2PA+XY/xmqKYwzKWhX8HLHXCUE20nsnFgi2EzzreG+byAFH94/RI
         ntKxvPdlxmCyB+gEzfoIu1pLdElxdnUGEoaa7JHetVTqkS0yCSaU/4T93VmiKF4Hwwf4
         /HijxfT21ZqRw2Ylpk8wr7XEhCGwj9rtV2svBO27acLoJNrAkAQ4Bla0i8d4bOwjJqwB
         x85IuN2xL6lPjtOWN3yxRLX3PlupQvBjEO3f/USBBufiTehfWXA8XmKolhx1F/YV9XOe
         naiA==
X-Forwarded-Encrypted: i=1; AL+hErGWwQzxhjqNeDSmc+/mNCVF2kdKnubRXaqOW03F6+krwnrXd8bKW7l7pxZeoglt85dyMdXhhPQjTvIc@lists.linux.dev
X-Gm-Message-State: APuU4Z8dvHeztVyrg3N8mWSFCWe5Cxqg7WuqG4ZqqKlwFhfGoQ/cmB4e
	rz9MtLLg8T7EQ1aO41TnwjF7v8vtQQFFUKyWpnEjA+zejjmZqIR9Ju62Yk6dXiFpa353fwZbokh
	wjU/KHRPJvcmy5OyQ3qMNjYgTBVtkUjDDu1PJ8d/1
X-Gm-Gg: AYBFou1Oq6KkK/9Ury7lQBe3BihCdVClqizg6lvFDNQNaW73VPHWjokQNcyW+D/SJOB
	Lxc867pqs/rI2hwimNiHQqeuaJ4nCD1ViWn7yXLTxG6xUpwWQU/bK0Oy4+Je1UMSQe0t/Bilvtt
	o+tBb8BkSx3lYcE18l5PzRWbBbex+tr7cyrrd5NKkYvq2k8HWceNooPnm01lqFj+s/9xxhVIzKn
	xnZp9K3uddt7lhe59JqDRl+kMsQOGwiPE9ocGGj+4l0SoeFdpHHGY4VcvGJ2At77+/Cn2HBq4ag
	xhqH/GpJCBzJw+Sb1g4oo9oAGdHy/RgT2zxzqFLruzkxQ2pEvOZpTQmf+oy8CVhG05A8vRBzcT0
	eM/jaQU/FTZRuh86hYx3lI+B7VlM9MxLe91WKW0Ard5s8jogs9I/Hlvux6mCUjDQbws9VRciam4
	MVawo+xj4WQFZYyrXeGXnGYKM=
X-Received: by 2002:a05:620a:710b:b0:93e:49eb:a274 with SMTP id
 af79cd13be357-9479f2fa7d5mr94788085a.23.1794254138721; Mon, 09 Nov 2026
 11:55:38 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:55:37 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-9-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-9-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:55:37 -0800
X-Gm-Features: AclHuK-fw27NEX4WLMeH0MQEMu23wQjUHEw6LG3xIqCQa_4vVj4k3LjJhmBS0EU
Message-ID: <CAEvNRgFvkWCM_JDxiamzQW=stgOnY0Xum5aphVv-Zo941zx2sg@mail.gmail.com>
Subject: Re: [PATCH v16 09/20] KVM: selftests: Set up TDX boot code region
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
>  /* Leave marker so size of td_boot code can be computed. */
>  .globl td_boot_code_end
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> index 564144c40f0a..b4a7089b3636 100644
> --- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> @@ -1,8 +1,46 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>
> +#include <linux/sizes.h>
> +
>  #include "processor.h"
> +#include "tdx/td_boot.h"
>  #include "tdx/tdx_util.h"
>
> +/* Arbitrarily selected to avoid overlaps with anything else */
> +#define TD_BOOT_CODE_SLOT	20
> +
> +#define X86_RESET_VECTOR	0xfffffff0ul
> +
> +void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
> +{
> +	const size_t total_size = TD_BOOT_CODE_SIZE;

This caught my attention because it wasn't quite reverse-fir-tree
ordering.

Naming is confusing here since there's both TD_BOOT_CODE_SIZE and
boot_code_size, so which is the boot code and what is the right size?

If the only use of TD_BOOT_CODE_SIZE is here then maybe we could just
directly memcpy (td_boot_code_end - td_boot) and not have the macro.

> +	const size_t boot_code_size = td_boot_reset_vector_trampoline - td_boot;
> +	const gpa_t boot_code_gpa = X86_RESET_VECTOR - boot_code_size;
> +	gpa_t alloc_gpa = round_down(boot_code_gpa, PAGE_SIZE);
> +	size_t nr_pages = (SZ_4G - alloc_gpa) / PAGE_SIZE;
> +	u64 gmem_flags = 0;
> +	gpa_t gpa;
> +	u8 *hva;
> +
> +	if (kvm_has_gmem_attributes)
> +		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
> +	vm_mem_add(vm, VM_MEM_SRC_SHMEM, alloc_gpa, TD_BOOT_CODE_SLOT,
> +		   nr_pages, KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
> +
> +	gpa = ____vm_phy_pages_alloc(vm, nr_pages, alloc_gpa,
> +				     TD_BOOT_CODE_SLOT, true, false);
> +	TEST_ASSERT(gpa == alloc_gpa, "Failed vm_phy_pages_alloc");
> +
> +	virt_map(vm, alloc_gpa, alloc_gpa, nr_pages);
> +	hva = addr_gpa2hva(vm, boot_code_gpa);
> +	memcpy(hva, td_boot, total_size);
> +
> +	hva += boot_code_size;
> +	TEST_ASSERT(hva == addr_gpa2hva(vm, X86_RESET_VECTOR),
> +		    "Expected RESET vector at hva 0x%lx, got %lx",
> +		    (unsigned long)addr_gpa2hva(vm, X86_RESET_VECTOR), (unsigned long)hva);

TEST_ASSERT_EQ would work here, same for the == assertion above.

Not a huge issue,

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> +}
> +
>  static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>  {
>  	static struct kvm_tdx_capabilities *tdx_cap;
>
> --
> 2.56.0.455.g6c5a503b38-goog
