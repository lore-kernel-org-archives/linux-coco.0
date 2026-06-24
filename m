Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AAA331ECC
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 18:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327488; cv=pass; b=LKdDWQSaf3/x06Wi499wGS5UWFm+/6MMKG5RjsEBkZPv7ToV5hDlVst5jRLbae6Q+UUYKWN8SCstclN7aUoLBo4ddb01K1BtGKx8tF7oc4SkPmgfORG3CL9BMwEhvTKs3dfxRjgySPFf46xFjK4sW4Bl7R4GfCVCrTC0dGzIK18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327488; c=relaxed/simple;
	bh=nxiRjQbOPZYmEdcjYYgjgTTY9n8vy7cCQU+hd4oV7a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtdsNVgWPr+09QSwf/SsRDT5O+X+2unNHxQt1fAyI3hp0zEi6lfCXtLmPMnw7gPxDoXJc3xdWygzJVAPk3e9YNQmyYIh8uM7CfjNXgsbg6lQHe2rwl7XGm65PtrMd+C6oTxt+6DqUMDCLgp5Ev3pGfTAsOCBpS/TLD+sZf2zfPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B+klrfQ/; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B+klrfQ/"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5177d1ff061so49251cf.1
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 11:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782327486; cv=none;
        d=google.com; s=arc-20260327;
        b=q7E5QJ7dwGdqYeZPP2dPB9JGmpIXCJl1j23vnHmcOHzLOt9yLGPyWwR381/MMuNutb
         fTVSW651bPdRioQbPBgvuKY1LeDbQzkngq6cVZ14MYW3zURj7MfdYkwQht7tO2+pfX/h
         hYbyJuYGSNjCTdwTg2quE6xN9ogm0FmtCdfYGKZ9IL68NOoVIMY20oLuLDolmbdD3bcs
         fPr5BIRg5MRjRKRShBw6pNYYcYSNP0ngXMEMrSV38KJN3kcYq8PzmDwuw54EK/zkTfC3
         FNjfD41YpbdOQGEKOuUkJ+lyxw0YCxL2NsQ8LdGvsbA75Pcd//zM/vjpGGkZ2aCj6Fqk
         16PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lYP2MIWClSeA6+M0aw+ZhWTqj4KB8PioFvb0d+sMqRU=;
        fh=FZ+Uh3AHf85fzKJHK867QzzJpkAEv8Ry17AbcZ0y9ZA=;
        b=c30XZvFGOn0U9gmd+Ip5azeCFOcBrUyBUSiUySPjKo0TdlIYr6JNZ9piK27YbASWIL
         jzfr3sGuEHLd8v1pd/TlCQKD9yZWSrDhPeKgXJt7aIQuTC0uptnWgEBnB5qbYPcZ6Juy
         2M8zPoaTZiSFOGUVy42HkXI+XxtGhwtcIoCDRCkXkxQuQLHjfv+NupjiVyuOGgvMsV9/
         Najjp4qa3V0NlUGB0auriY+ri0tc6lQkuqlPWGZxBgsT3gtcjFkzgFyi3mWpTO/e7GbS
         GqoduT+8qLJMjTjWhhwKujcEYmZgH21cJfM7j+iiUyE/4piEJLVYFbZYrWePDIpGXIkk
         VjoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782327486; x=1782932286; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYP2MIWClSeA6+M0aw+ZhWTqj4KB8PioFvb0d+sMqRU=;
        b=B+klrfQ/Py6Z/4VVMqW6qE2YyNPt1U9/3YCWFW1urrtV6tOclVISBZ4yjIl2Sm1bdr
         3EuW8tspzVlJi7hGjrusJ+T4aMRUYg2tp0GYBc/Eurh35dD9GIsOi5wpaqNQ7jX5SG6p
         MXciM8jsMIwFLdsRh6XBoiSr2rEUs0ZeK/e/KYI5alTRuB+DpJaO0oUKCk+TrwkgM4PO
         lBFs63zCX5K2V83KUBz2tnn+M3z0DdBRWkAzl12NNsjm67KcMUuIij4ob+7VTuM2r6DQ
         migC+j6fiAjrpSdWes6l14CnRimt4LrxUQLuImtElakL1iKg0GKdDow3hpMnOMkjVazW
         xzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782327486; x=1782932286;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lYP2MIWClSeA6+M0aw+ZhWTqj4KB8PioFvb0d+sMqRU=;
        b=MvqzqCCrwJzI9k67bTXPduGoRBkLpMM6ztKZZR4YxHBTsOrHgpiQ1vLK2aS05a8Fia
         RKwNO8p0742dX6R+pOb6siks1I1KbULqXl7JwOdVFBm455SBAaceCcdwa052ir3YDzco
         M1t4OUEnwjcpl/8HefG1GTNMqSksszumqouj6kkrF2d4XXbYCZLf0UMfYJgOXV3h5rI/
         izNOKdryqDXtMzcs5CNFf2ORhxfM4p0/UQsqCT7ey20IUs78HmSr2+IBiZJGagTbocyH
         V4rTMbAbeqJyrmrs7B3lP/kCELGW9KAm8kXMsORT94T+DB3OARzi17Dw0peZFgOheZTh
         P+fg==
X-Forwarded-Encrypted: i=1; AFNElJ9YO5CH2ipfGdwZ7EGmnf9dtvrWgt5o/owtPMr66iR2dledtKoF/hHmIPWHzZugLDQU62GSty9iwXsM@lists.linux.dev
X-Gm-Message-State: AOJu0YyO4TCKqSWnOmHGA0eIC0gHtSvHMdRPlJKd4u21qDYbFfukSWBV
	Z86GJ+8PqkeeErSxamClSQ8NZ7bZsUAJtfh+lc3G6wOmHSmlEcEJg0dnigVq5JW4n8ijPNYVlA5
	7eKDO6yRQVLuV6qk1LvgWijTAmJcOkorVkZxK6zE+
X-Gm-Gg: AfdE7cnbgItk/cThAIv5GKlpjxcLTzaC3jRf4xr7yM0xBPLInqRwd+o6dq018+qlLIt
	QBPygIlhuJgj93Gmd5skqSqMak1ZjswaI/yb1i3H8B3FWyJ9U9spx+Ck5jjLEdb9JWB8Y7vWGH0
	p7iB4rILA/9Akf/DzlfH1wMl+SW+aI1Z268AReDFzUXyCwT7vfpJzznivO4sLJQj0rsEYj6HCAe
	Sn7cYjRAE3KnitrTVeNI4WmCedzdCkRyjETHFJfojEPmpEN42VxyEsUov8o75+TE5WH1aDpg/tq
	+qyMKACp
X-Received: by 2002:ac8:7f51:0:b0:517:5ac7:332e with SMTP id
 d75a77b69052e-51a6e99e871mr1220721cf.6.1782327485393; Wed, 24 Jun 2026
 11:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 24 Jun 2026 19:57:28 +0100
X-Gm-Features: AVVi8CeYyqolczp9quGS2mTDT-o2xHvKCexfoBhgu9RXIzSIPhnTHlePhYz9Iw8
Message-ID: <CA+EHjTxUeGt1XR=7MEsGnHC7agndtN2O+N=4+4iQ+a48vPWP8Q@mail.gmail.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Make in-place conversion the default if the arch has private mem.
>
> The default can be overridden at compile type by enabling

compile _time_

> CONFIG_KVM_VM_MEMORY_ATTRIBUTES, or at KVM load time through a module
> parameter.
>
> In-place conversion also implies tracking a guest's private/shared state in
> guest_memfd. To avoid inconsistencies in the way memory attributes are
> tracked between the per-VM or by guest_memfd, make the module_param
> read-only (0444).
>
> Document that using per-VM attributes for tracking private/shared state of
> guest memory is deprecated in favor of tracking in guest_memfd.
>
> Warn if the admin sets gmem_in_place_conversion as false when
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not enabled. Add warning in the code
> path where guest memory is populated for a CoCo VM, since that's the
> earliest point in a CoCo VM's lifecycle where memory attributes are
> queried. Unlike other query sites, this site is exclusively used by CoCo
> VMs.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

> ---
>  arch/x86/kvm/Kconfig   | 7 ++++++-
>  virt/kvm/guest_memfd.c | 5 +++++
>  virt/kvm/kvm_main.c    | 3 ++-
>  3 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index c28393dc664eb..a3c189d765150 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -85,7 +85,12 @@ config KVM_VM_MEMORY_ATTRIBUTES
>         bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
>         help
>           Enable support for tracking PRIVATE vs. SHARED memory using per-VM
> -         memory attributes.
> +         memory attributes.  Using per-VM attributes are deprecated in favor

nit:
are->is

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad





> +         of tracking PRIVATE state in guest_memfd.  Select this if you need
> +         to run CoCo VMs using a VMM that doesn't support guest_memfd memory
> +         attributes.
> +
> +         If unsure, say N.
>
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 86c9f5b0863cb..5cb73543c03c8 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1193,10 +1193,15 @@ static bool kvm_gmem_range_is_private(struct file *file, pgoff_t index,
>  {
>         struct maple_tree *mt = &GMEM_I(file_inode(file))->attributes;
>
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>         if (!gmem_in_place_conversion)
>                 return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>                                                           KVM_MEMORY_ATTRIBUTE_PRIVATE,
>                                                           KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +#else
> +       if (WARN_ON_ONCE(!gmem_in_place_conversion))
> +               return false;
> +#endif
>
>         return kvm_gmem_range_has_attributes(mt, index, nr_pages,
>                                              KVM_MEMORY_ATTRIBUTE_PRIVATE);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index dd1d18a1d2f68..46e92b5dc3804 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -102,7 +102,8 @@ static bool __ro_after_init allow_unsafe_mappings;
>  module_param(allow_unsafe_mappings, bool, 0444);
>
>  #ifdef kvm_arch_has_private_mem
> -bool __ro_after_init gmem_in_place_conversion = false;
> +bool __ro_after_init gmem_in_place_conversion = !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES);
> +module_param(gmem_in_place_conversion, bool, 0444);
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(gmem_in_place_conversion);
>  #endif
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
