Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8D62D97BB
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284902; cv=pass; b=Dm/p6BA4eCar59ajRSyWaDgZHH0XNIc8lQoPiBwwaUIRKIh0e4EoKA6LFJ6rhnq2kVLWcXTFU8TcpnvZApic9CmoIqJ6WHMBeXO+m9SF1YMiln/y1/lDwfcAjR1E0K6p8Y7+NpUges1vJIZm7LuADIKKbc6tHrekT4wzKA7Hv40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284902; c=relaxed/simple;
	bh=qiAgR915c2CmHYVIagAz0GZLLG4P/KRD0iJeIn6q8LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HR7VYhluTbTfbzc3AOtLopcOEgSS9T6jOERhf/LRnk1ybp5rF0DeMXNGHfExPBQKo5Slb2UO4d4LUvCSZPgo0IX1COEXd5fiNPoZHSuSdNNFCxts1PB80OG28asapeVBFt8P7Yef7GZTjBrE5VXtiV8NPwchyXFeZsCd1CQowzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iMVNaBPT; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iMVNaBPT"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50e61648f10so7251cf.1
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 06:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779284899; cv=none;
        d=google.com; s=arc-20240605;
        b=c/J0E7z9HgnYpKKadTjvCz/swQWPJfY7dwUAStlUhv0Iw+ocLiaUs/QpRC7zdhILyE
         Rdb0JdFaQ2G0jUu2PZ5lufh79Uz+dSCbhoGONogepeGag6mN+XNbuJGu42jOi+VmFWwZ
         /LfonWOQ4FeOlJ99ijM2Tz8XV+PnpNOYgWaobzSGIm9K/vNLRz+d/BvBgXtfiPDgpa+Q
         khg1gtwlJQhbQ8kvZi2JBC84tVRLL3iotPrz8oAdpZ31fQ0wO4lLvb1dmwXSauyZs2Fz
         T/ML/6SpIA0k7r3bpM3AKco6+oL2EC6oTSRUfmzmv4xA8ys7odvb/mcTpwajQZxxSk2y
         NjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ztFmjo5Zo5EuBU+qrePea2SHE7ZHtOIa9devh9QKOJ0=;
        fh=RFrrq6JAgJnsv3vbiX2YsdRJYfk8XubfoJWACd265Ng=;
        b=Ls8P4h3RS9J3id3Du+bN/NlXQMnFgzc86tFhzIuEnbSb0mfVKnYwaI4zi2aJvNxFTv
         cDRyKpsAS4pSqfwrQ5XrUekk1c6TEuKmgFV+mKmEPZeoFyMnGqm2EXbbezK9IjpgW7Sq
         iArbYVCxyDvp50j3dLv3ziS0kdU27sgrS4QvGZMcoT0ExZz4SM0dOy9qGzjTb1MuFWUs
         OMV4nNrLdmDUroruQgJUcpGKCMTWYdUPqENKt4ktCYwUJBKHSY7/9q1Fe15FSwFmY7pH
         hPT+Zd7WZJiEPrs2pvQmjPI1J9Hl+skCmXCJ9O7cT9W+cHyXxbKFUy4amP5cLa9QlIdu
         bneQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779284899; x=1779889699; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ztFmjo5Zo5EuBU+qrePea2SHE7ZHtOIa9devh9QKOJ0=;
        b=iMVNaBPTX20GwsYHyiWfV0a/9Hbnbu4hlHTuN29LDb/pUOYpwb4gKvJntDovJRRpBK
         BshiG3qkI0fAa46OC2ogt8iaO8rn1u9N/XoaVzLkFf3ffAkcgdbY+ynVcC5xpkNuyia3
         E519XlfaxEZz3wOx3GkomA0S546nGQz3sLF+uJxg8egUkMMX1bY75Ae78V7H23ln2KsT
         GrRBc+orSRgAj0KTkrfPYJp9Lr9vb26BneTaA6/P6LmNMvt6Zhc3H02NwLL/acsKEbWp
         M20OEMsQ7GvxpphlXoQ9gidEWQciV4mBJaZiIFsB6Kc9MMe9j+wCGnQjiGTcxodif4qZ
         pt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284899; x=1779889699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztFmjo5Zo5EuBU+qrePea2SHE7ZHtOIa9devh9QKOJ0=;
        b=APuR/IZwjmtWV4D4L46CzoHY0bI9dOcw8s5NQMyn+UUQM9Cg8IVMg/ldPiVa4GMoJo
         qukDfnBWxCwrc3EevsQWeS6rSXXtnDvIQcWMPMWNfN3QjCp+VDXkfev17H/Ut1pB6Lag
         vywrfhTXofpjFhu/yCN3n9yzRbCP2qEzth6VIFL9qsOGg4HHxIInB7kh5t9psMRzZtDJ
         Xgm8lje7gI/776RFPUIih+S/eNfoJSMzgEEcOP9O+Otb8T0FcrBkIdh6o4LAWdD0t7ZT
         L96lnhlupnH66zynyLLRe6i2MQRfkzhNpbC2jES8pgPfnuPgSChMNMZAKX45GyH6Pagq
         WMHQ==
X-Forwarded-Encrypted: i=1; AFNElJ91A+AF8RLeu6UhxO/a90OKZoaTGYyUEfghEaC54s/wEuJDIrqT9bjBdExlxtzfgaCW4Dn7osGR/cTg@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0qiXPxGxUAl7oqQDaK4d7JJijflhk+W96J0HTHBmz7rPu5pkS
	35D+8tobtDXXgtx5vmqD5W9y+gfPwEEdNgdU0VDNaq/dzeif9oXp/xxrF51WrK5fOOg73GTqtGE
	tvzU8Zd6H9kmsIVkfjswrm9IHT/goGJUtWGLc86AZ
X-Gm-Gg: Acq92OFBRvuEZRfqZSIHoWDwEkqr2Lo32wuKz0lpdnWU9twZaHOQkl2kKagqCw+T+A6
	rdpub79b2C89InSez0KbjDTsNVuFvG6vk/V4UllYeMmLjuu8V0sN/G8Yn2VBHLh9/QFRPBIXS0D
	5mfbc+Z0S8byNE4Jq42cPzIP1jP+6hvcJsDQv9KR9exIwxMOsoswjuoxkSIb6kJPnYQW5sasL9Y
	5K3zHDL2iFhCxyVWv7bxleJW5I4O6KycIyO+2vs3+w/fE3dpc5S9qbPaunSKYYXG+G2okxlo2bY
	5YT/StgQd1gCIYeHxjpDaGhZZ4ARSg==
X-Received: by 2002:ac8:7fc7:0:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-5167b683f38mr8972121cf.5.1779284898204; Wed, 20 May 2026
 06:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-7-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-7-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 14:47:41 +0100
X-Gm-Features: AVHnY4Lt4aJCZG7zHyyVEbse7TC1B-amOpcSsUxTZmECQsMY0Fon9T-IHHMiF9s
Message-ID: <CA+EHjTxg6f0v40EBDE3APXrF_qt=8GTx0dGKrKDLqiNwdU_dQA@mail.gmail.com>
Subject: Re: [PATCH v6 07/43] KVM: guest_memfd: Update kvm_gmem_populate() to
 use gmem attributes
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

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Update the guest_memfd populate() flow to pull memory attributes from the
> gmem instance instead of the VM when KVM is not configured to track
> shared/private status in the VM.
>
> Rename the per-VM API to make it clear that it retrieves per-VM
> attributes, i.e. is not suitable for use outside of flows that are
> specific to generic per-VM attributes.
>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>
/fuad


> ---
>  arch/x86/kvm/mmu/mmu.c   |  2 +-
>  include/linux/kvm_host.h | 14 +++++++++++++-
>  virt/kvm/guest_memfd.c   | 24 +++++++++++++++++++++---
>  virt/kvm/kvm_main.c      |  8 +++-----
>  4 files changed, 38 insertions(+), 10 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 153bcc5369985..bfcf9be25598e 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -7997,7 +7997,7 @@ static bool hugepage_has_attrs(struct kvm *kvm, struct kvm_memory_slot *slot,
>         const unsigned long end = start + KVM_PAGES_PER_HPAGE(level);
>
>         if (level == PG_LEVEL_2M)
> -               return kvm_range_has_memory_attributes(kvm, start, end, ~0, attrs);
> +               return kvm_range_has_vm_memory_attributes(kvm, start, end, ~0, attrs);
>
>         for (gfn = start; gfn < end; gfn += KVM_PAGES_PER_HPAGE(level - 1)) {
>                 if (hugepage_test_mixed(slot, gfn, level - 1) ||
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 28a54298d27db..1deab76dc0a2c 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2549,12 +2549,24 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  #endif
>
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> -bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +extern bool vm_memory_attributes;
> +bool kvm_range_has_vm_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
>                                      unsigned long mask, unsigned long attrs);
>  bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>                                         struct kvm_gfn_range *range);
>  bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>                                          struct kvm_gfn_range *range);
> +#else
> +#define vm_memory_attributes false
> +static inline bool kvm_range_has_vm_memory_attributes(struct kvm *kvm,
> +                                                     gfn_t start, gfn_t end,
> +                                                     unsigned long mask,
> +                                                     unsigned long attrs)
> +{
> +       WARN_ONCE(1, "Unexpected call to kvm_range_has_vm_memory_attributes()");
> +
> +       return false;
> +}
>  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
>  unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn);
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index f055e058a3f28..9d025f518c025 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -924,12 +924,31 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
> +static bool kvm_gmem_range_is_private(struct gmem_inode *gi, pgoff_t index,
> +                                     size_t nr_pages, struct kvm *kvm, gfn_t gfn)
> +{
> +       pgoff_t end = index + nr_pages - 1;
> +       void *entry;
> +
> +       if (vm_memory_attributes)
> +               return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
> +                                                      KVM_MEMORY_ATTRIBUTE_PRIVATE,
> +                                                      KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +
> +       mt_for_each(&gi->attributes, entry, index, end) {
> +               if (xa_to_value(entry) != KVM_MEMORY_ATTRIBUTE_PRIVATE)
> +                       return false;
> +       }
> +
> +       return true;
> +}
>
>  static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>                                 struct file *file, gfn_t gfn, struct page *src_page,
>                                 kvm_gmem_populate_cb post_populate, void *opaque)
>  {
>         pgoff_t index = kvm_gmem_get_index(slot, gfn);
> +       struct gmem_inode *gi;
>         struct folio *folio;
>         kvm_pfn_t pfn;
>         int ret;
> @@ -944,9 +963,8 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>
>         folio_unlock(folio);
>
> -       if (!kvm_range_has_memory_attributes(kvm, gfn, gfn + 1,
> -                                            KVM_MEMORY_ATTRIBUTE_PRIVATE,
> -                                            KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
> +       gi = GMEM_I(file_inode(file));
> +       if (!kvm_gmem_range_is_private(gi, index, 1, kvm, gfn)) {
>                 ret = -EINVAL;
>                 goto out_put_folio;
>         }
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 4139e903f756a..0a4024948711a 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -103,9 +103,7 @@ module_param(allow_unsafe_mappings, bool, 0444);
>
>  #ifdef CONFIG_KVM_MEMORY_ATTRIBUTES
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> -static bool vm_memory_attributes = true;
> -#else
> -#define vm_memory_attributes false
> +bool vm_memory_attributes = true;
>  #endif
>  DEFINE_STATIC_CALL_RET0(__kvm_get_memory_attributes, kvm_get_memory_attributes_t);
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(STATIC_CALL_KEY(__kvm_get_memory_attributes));
> @@ -2450,7 +2448,7 @@ static unsigned long kvm_get_vm_memory_attributes(struct kvm *kvm, gfn_t gfn)
>   * Returns true if _all_ gfns in the range [@start, @end) have attributes
>   * such that the bits in @mask match @attrs.
>   */
> -bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +bool kvm_range_has_vm_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
>                                      unsigned long mask, unsigned long attrs)
>  {
>         XA_STATE(xas, &kvm->mem_attr_array, start);
> @@ -2584,7 +2582,7 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
>         mutex_lock(&kvm->slots_lock);
>
>         /* Nothing to do if the entire range has the desired attributes. */
> -       if (kvm_range_has_memory_attributes(kvm, start, end, ~0, attributes))
> +       if (kvm_range_has_vm_memory_attributes(kvm, start, end, ~0, attributes))
>                 goto out_unlock;
>
>         /*
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
