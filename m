Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6702337F8DF
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357341; cv=pass; b=aPEYQIVIbDduV5O8cFRrwyPVmpjpmDloBzs1JB+5JGy8iNUSuE1OJl1DdKHkH6qTawl1WMXUNGEE5rBsdiVNI5uamz2n2dex01iypm4enF83SoIIfxx7kd3y8SgL2LdCi9P+znCFdiB8nf2t9VJslOEEOSF59I8NnbRfq5AFn0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357341; c=relaxed/simple;
	bh=ZRcTPC6pJlAhg9tsnjjkWvgzcx3R4j8Gvtkq+DUOp/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hztqtHF/P863Ss1xEUoathzr7XEzoVScSlhf6OX2YSa18zaEVDKenLBTXIEjfwUYiS684uslKR53459isBElfnk3V0Lw3z4j46VhCPXizHlyltzrcxijLnd7gPFRrDk1R1r0tyiL/9z/UDgiPA+JZvnjZquBdWWP23iU9TeYZCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PVnGALA7; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PVnGALA7"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50d6b393d60so6431cf.0
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 02:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779357338; cv=none;
        d=google.com; s=arc-20240605;
        b=CDELhw1X8lVofgj3d7DvnJ6oSOPbwe9FeRQUIgtm6vve5lqAxOu3GHzDENn4F3sKdc
         +FXVSNdSrhw6iB1SYqjgMkHr6zGKb8svZBfvgLqvehp+/flb0K0FG3nSkjk7EocU7eCx
         7fSXh8RrzQjfY/FkGBIjIH4J7IOsYhp+yrwFNgV8SZ3rbj97eSteYZ9fwstFknCV/hF7
         ecmraqFzrZ+1K786yd2MDLbDhilJXq77cXDOGe1TvPejMkw9ZGFY+h4YyOgP3qMRj5pI
         R66LCCKWXU8C8vzz3LhDDSb47ejbWTZXKt+I54DEv0rZAauSd9cgoAWGXmvk6oWmgsrB
         bIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e7M9NhGknWQDqckmSxYqMS5E/3kqK8iG7U98plSW4NU=;
        fh=fmKh58awwYmTddps0532kq57n+4WxlY4rP26134xiDM=;
        b=TQ+Bn4sbvp5A/c4XqEFRT8+L0xlqA8YLs+atmWmHRoTiCFytq4DhHnmGtLqjxKGgg+
         WOkLq7DVvR64EJL9iWhjGXHeh7thOstcZgz7mo9ilDI0jcMR/Xo/IfJ7K6DcOcb33u8a
         TMvHeOV8v8yV/tM0IhaDN4nqBmAVYF0h1EBvfx0VBJOWqDvsbyVq3LtNQd3UoGfd+Xc8
         B9QQ0A3a31+v98eQYfVJhY5GfS1IlQyEA2SJC3AEtOqi3bEyaGq3gp0HUvmBVZD80Rzd
         DNsXxUoK6EeRD046blnEkRS30ccpoqhViui/8YDk2+DIDxQHRSVieDSDJj0oUNuu7I9c
         c8/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779357338; x=1779962138; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e7M9NhGknWQDqckmSxYqMS5E/3kqK8iG7U98plSW4NU=;
        b=PVnGALA7bhQs7ufZKCacLOK6DbOc5F9nGrBx6OQISSboSb4nzkz8+IWAQNLR0LrOMd
         pWoj3AuDYsQjA044tAx7dmHkq7vZV0kWLQb567+klnfsxDVbo/8RhdlHryS7h+tYC9E5
         nm3IsiM2V/BarGkABKd7JLiUsoUSe6TSkNyXaMzP75M6gwD3ghoVqnAoBPR32PWXyeUa
         lEexW/bRyIUNAlg29XK7Xze9FuD85o4fvmSvu0/JBsbTlmi2AnfAv684tpjhOh3HxegM
         mzwHuxGAIF2oIP394m+s3vrKFHoZI9d3oj8LI2IQzEiH17jaT0oPvSkFBizIdbp96oQS
         fB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357338; x=1779962138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7M9NhGknWQDqckmSxYqMS5E/3kqK8iG7U98plSW4NU=;
        b=p3xCsqTJziL1wc+UUq6R7aBfW4AphFvczNay+IT00vNrgR/RgRMMFVaX/7b8aXYisr
         Y3sO7bpqZUGRJvy254Yeqqsbupsu0KoIffeyzIsNQrqoWToRi7xNbqKdCHrkqSSf89vH
         Lu5lybCqXn8pkSemtzi4rHIkOS7+UAUTEYd37M3UDMWkO9QRI7R/yn7atMZoCstewqmH
         NiPbN9hV1/b6qiFpRar33DfXDqTrna8/3c3A7fT7WcCC//INKd794HuDiscVg4aKO/gv
         Tt/4H34yyKedmbvEw0KfzWx9kbJkEVDfe564SDvvTnxQby+pwyGd+ru2JS+XCGXAXa8a
         gupw==
X-Forwarded-Encrypted: i=1; AFNElJ+666hpHyK9q/QMWiLRDLaClFlTQw02KHKvbEUgIXjnH5uHEt+Ijq5AY2s/p87e1j7rpo/G+xisUZIg@lists.linux.dev
X-Gm-Message-State: AOJu0YyKYDyXFneFbR/+aY+7YWz40v8igWPSBwlownL3SciG2kSUEByX
	DrZyWFRwQqsfdMcOvK0Lfv6i/l4xunkM5y/0JDRSrNHxttJy4cT08zPtCYZrUWqfLmFkZylG7G3
	cMr6MQbXYMg2JeHxzm9td1xWpK9wVbw86fjkIdwyJ
X-Gm-Gg: Acq92OHPlYqXhqzFpyI1O0cHI0X6sdxza2oKk61jLIovkWbApceFXOmpXoDn8AYj9q1
	YNPA2AjbU5JLWf+OjZGEb4ZWW6Bsk82iBL1wPjIj5LTzcvIIP/YeMFRN9kuQaYQLNEbSiG9ZN7G
	IWJdI2tbtCuufJqfjNmQMy5hngWlgEfJDDHjtzbaxVqJBo2RAuhXyUgizbBY9gW3U7ER/n8ghhR
	DV2N2JiabITdB+SpflCxG1wUVJUeEWoXLpgYHaTavXQyjR6sz/FU5KNoF2R0tb0YLVUewMfyvqS
	11KkB3i+3KFNw54pADk=
X-Received: by 2002:a05:622a:8c09:b0:50e:41f3:6467 with SMTP id
 d75a77b69052e-516c545d431mr6709461cf.12.1779357337839; Thu, 21 May 2026
 02:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-21-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-21-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 10:55:00 +0100
X-Gm-Features: AVHnY4LC3YVKsMDpMvqn3oyglyq0u9QSInerrEQ0lx4kHSFYhrJCi8Ex_c6F6eo
Message-ID: <CA+EHjTwrygfMrZZSw4y7-ry8fidW2x0C7iuF2Q=dnPNHUmNtUg@mail.gmail.com>
Subject: Re: [PATCH v6 21/43] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Michael Roth <michael.roth@amd.com>
>
> For vm_memory_attributes=1, in-place conversion/population is not
> supported, so the initial contents necessarily must need to come
> from a separate src address, which is enforced by the current
> implementation. However, for vm_memory_attributes=0, it is possible for
> guest memory to be initialized directly from userspace by mmap()'ing the
> guest_memfd and writing to it while the corresponding GPA ranges are in
> a 'shared' state before converting them to the 'private' state expected
> by KVM_SEV_SNP_LAUNCH_UPDATE.
>
> Update the handling/documentation for KVM_SEV_SNP_LAUNCH_UPDATE to allow
> for 'uaddr' to be set to NULL when vm_memory_attributes=0, which
> SNP_LAUNCH_UPDATE will then use to determine when it should/shouldn't
> copy in data from a separate memory location. Continue to enforce
> non-NULL for the original vm_memory_attributes=1 case.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> [Added src_page check in error handling path when the firmware command fails]
> [Dropped ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES]
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

I'm not very familiar with the SEV-SNP populate flows, but it looks
like Sashiko is on to something:
https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=21

- a potential read-only page overwrite, because src_page is acquired
via get_user_pages_fast() without the FOLL_WRITE flag, but is then
overwritten via memcpy
- an ordering violation with the kunmap_local() calls

These predate this patch series and are just being touched by the
'src_page' addition, but if Sashiko's right, these should probably be
fixed sooner rather than later.

Cheers,
/fuad



> ---
>  Documentation/virt/kvm/x86/amd-memory-encryption.rst | 15 +++++++++++----
>  arch/x86/kvm/svm/sev.c                               | 18 +++++++++++++-----
>  virt/kvm/kvm_main.c                                  |  1 +
>  3 files changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> index b2395dd4769de..43085f65b2d85 100644
> --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> @@ -503,7 +503,8 @@ secrets.
>
>  It is required that the GPA ranges initialized by this command have had the
>  KVM_MEMORY_ATTRIBUTE_PRIVATE attribute set in advance. See the documentation
> -for KVM_SET_MEMORY_ATTRIBUTES for more details on this aspect.
> +for KVM_SET_MEMORY_ATTRIBUTES/KVM_SET_MEMORY_ATTRIBUTES2 for more details on
> +this aspect.
>
>  Upon success, this command is not guaranteed to have processed the entire
>  range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
> @@ -511,9 +512,15 @@ range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>  remaining range that has yet to be processed. The caller should continue
>  calling this command until those fields indicate the entire range has been
>  processed, e.g. ``len`` is 0, ``gfn_start`` is equal to the last GFN in the
> -range plus 1, and ``uaddr`` is the last byte of the userspace-provided source
> -buffer address plus 1. In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO,
> -``uaddr`` will be ignored completely.
> +range plus 1, and ``uaddr`` (if specified) is the last byte of the
> +userspace-provided source buffer address plus 1.
> +
> +In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO, ``uaddr`` will be
> +ignored completely. Otherwise, ``uaddr`` is required if
> +kvm.vm_memory_attributes=1 and optional if kvm.vm_memory_attributes=0, since
> +in the latter case guest memory can be initialized directly from userspace
> +prior to converting it to private and passing the GPA range on to this
> +interface.
>
>  Parameters (in): struct  kvm_sev_snp_launch_update
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index c2126b3c30724..bf10d24907a00 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2343,7 +2343,15 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>         int level;
>         int ret;
>
> -       if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page))
> +       /*
> +        * For vm_memory_attributes=1, in-place conversion/population is not
> +        * supported, so the initial contents necessarily need to come from a
> +        * separate src address. For vm_memory_attributes=0, this isn't
> +        * necessarily the case, since the pages may have been populated
> +        * directly from userspace before calling KVM_SEV_SNP_LAUNCH_UPDATE.
> +        */
> +       if (vm_memory_attributes &&
> +           sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page)
>                 return -EINVAL;
>
>         ret = snp_lookup_rmpentry((u64)pfn, &assigned, &level);
> @@ -2390,7 +2398,7 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>          */
>         if (ret && !snp_page_reclaim(kvm, pfn) &&
>             sev_populate_args->type == KVM_SEV_SNP_PAGE_TYPE_CPUID &&
> -           sev_populate_args->fw_error == SEV_RET_INVALID_PARAM) {
> +           sev_populate_args->fw_error == SEV_RET_INVALID_PARAM && src_page) {
>                 void *src_vaddr = kmap_local_page(src_page);
>                 void *dst_vaddr = kmap_local_pfn(pfn);
>
> @@ -2422,8 +2430,8 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
>         if (copy_from_user(&params, u64_to_user_ptr(argp->data), sizeof(params)))
>                 return -EFAULT;
>
> -       pr_debug("%s: GFN start 0x%llx length 0x%llx type %d flags %d\n", __func__,
> -                params.gfn_start, params.len, params.type, params.flags);
> +       pr_debug("%s: GFN start 0x%llx length 0x%llx type %d flags %d src %llx\n", __func__,
> +                params.gfn_start, params.len, params.type, params.flags, params.uaddr);
>
>         if (!params.len || !PAGE_ALIGNED(params.len) || params.flags ||
>             (params.type != KVM_SEV_SNP_PAGE_TYPE_NORMAL &&
> @@ -2479,7 +2487,7 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
>
>         params.gfn_start += count;
>         params.len -= count * PAGE_SIZE;
> -       if (params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO)
> +       if (src && params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO)
>                 params.uaddr += count * PAGE_SIZE;
>
>         if (copy_to_user(u64_to_user_ptr(argp->data), &params, sizeof(params)))
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index ba195bb239aaa..3bf212fd99193 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -105,6 +105,7 @@ module_param(allow_unsafe_mappings, bool, 0444);
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  bool vm_memory_attributes = true;
>  module_param(vm_memory_attributes, bool, 0444);
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(vm_memory_attributes);
>  #endif
>  DEFINE_STATIC_CALL_RET0(__kvm_get_memory_attributes, kvm_get_memory_attributes_t);
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(STATIC_CALL_KEY(__kvm_get_memory_attributes));
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
