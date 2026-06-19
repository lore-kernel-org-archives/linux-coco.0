Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BFF823DD
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 08:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857027; cv=pass; b=RDvjXvOoEuyW56h0fJ0I2/aGqadNMYERgE5yOQIsAVNJALry8GkUnUOKKl2HEqRcftNrqZNTYFOqGURt66tPMhRytFDVDjm9He3RGdBy/htkEHefSg2eBMyd4dmkIz77+6TijvfVIWJmOeD3qeZpGbBckYq7XIhvTh6/aGQbgMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857027; c=relaxed/simple;
	bh=GdVp3nhFsAiHzr2W7O9A7vMg2rpsv70lslLj5RH2A9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVMABpGbLf3nPP4TuRljNeFx01x7PSp3itzDMR60/61bXlmsr1qSa+sgzAnTivDzpNWZVNfJSk4D9tPvusWeScAWZv2gwDIgmNZC5qcCMN9ce8k3n/uXaLF7DEd/pguVv8/NTnDeb+6Y1CevqmVgqBzifLU2kIyX3S4dgkfRxpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RqlCZxya; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RqlCZxya"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51765531803so196021cf.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 01:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857024; cv=none;
        d=google.com; s=arc-20260327;
        b=PKZLHXJSVvDYAzCa57/jDqbD+spJ1Ht4CMXrakCASzcdXeygKTrlL+a9upCVEsh7WE
         UU3K80vTfhE4eo0DecxjMkWSz+MMZaZCCj8PtJPkYgI2ylpord2ixi9KYIYEjVYJffag
         QzSfKiFAQ/8Nx4RQTdM5RO4gT+i+XYZuLJGvxJJLd94Tif0mbLU5wHEfB01TOwqhjfLq
         K0mAI8gUej6PZngd9jOT4aZuW53R2K5V04D1mFlJPoWW5IAYMU05+A751kU+j2L18QRV
         aZuze8Zsnkjs4WZ05Hp3eHIEU5T4Aknj21YUgu8XKLJpTegwDUKqN5BG9MIpYoRc84mG
         Mkqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Up+XrPQNLPb5sD2pRt6yFkeckwFFZAw2wSW2pQjWH24=;
        fh=KTl/gBS7vSDdN2oHuIhigRvsvUWXsORlDmLebklrWv0=;
        b=Daq+Qq5KanOO3a7MK12j11xLFBg64GFS5/4VVNG3GuyNU9z8t5WQ0xYF4cZ1U4FBlp
         hmCbRqAOMOblHsz0K7Xxpb3YSy6nnEodDSaLCZQz6nXyKnjZzam2YnvKXj503WrgAsbF
         tEClQuauW2AmJ7LnMCIBbNeDykdALINGE3fKbHaTnpAvqYp2FpQVm1yUz+AAQQXfMzoL
         flD/1gfuTtlBDJj1Tp1+Ie/lqynDxjIqljXRZRbzhMQQUtrIFOUxqtjAgKB/tYTDkeJE
         ZQPfSAgDxQisP2XctTp4+h0kOb4RafrSOJDwJ7zK0EpL+8lZLtoW7CQfaUoishGcmKv1
         X2fA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781857024; x=1782461824; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Up+XrPQNLPb5sD2pRt6yFkeckwFFZAw2wSW2pQjWH24=;
        b=RqlCZxyaLG1Tpx8SKClrvtry8DEJ6zVsLgXs+Dvsayqf+KvGoqhbamF1PN5qt9q6Kv
         JBI0SqgA0g7X4a00DGZHHlzz/PLWfBxoTLtuRI07hMHkMRX/s2uMLAJlTEJlI40yVH0d
         Y7oe0TDMtW1TNV1CC16IQSu3pkkxDxPdjQtpAd5VW/vk48+tp5hgGZxChIBp7pgFTtHr
         fxBJPbMwm/cZwnZhVWJ1QRzB3Jv2if66H3TkE1qsSPbVZq0LV/yKIAdNUamItZ2BEEcA
         9u1YWxNYg781+x6YmE+VeNmmTkdy/aMTNzC0p1C5emMXenDxRX37ECOxy8OMZ0QskVlQ
         qLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857024; x=1782461824;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Up+XrPQNLPb5sD2pRt6yFkeckwFFZAw2wSW2pQjWH24=;
        b=DHsTrGzpL2+izqeBYfPzDuxNoRsY63/9eJ1nEJgMfLm+A2JGWmtKQfbTH5dkzGvZdN
         LCbAQCnkq9mvUM+HxNuDaf1Wz4s0zeiV97r4QLNc1l4w9Ptrn9hR+UNEyiamDDyg/adN
         Avt1VFiWMZBsxekXBjuTVlR8mBZaaPJVWAIiDQX3BN8q8tm6b/lu4jURCRrLhbz1tB5d
         8H7NaZcy0Hf3Qh093wB53sst7/b7cPhEojexs9nRiQqAgSrgqR32OvTnCdgOTF7x9BRp
         udkZJ15NhTkK+6aZsBadaJMMl5yRTNFx0zthuzMq/R6ukrcfuFYImAYmHzD3I/19k5AA
         sfiA==
X-Forwarded-Encrypted: i=1; AFNElJ8BYxnnq++iiaZgrC7OPqkNiBNWjS9m/M8xMvzYjsM7SYYuC63hLNFkzsTW7Pwi8TQ0ekyG3NPWOhrD@lists.linux.dev
X-Gm-Message-State: AOJu0YzZrSG4Uo1XOR4uaGACJhDfZuefibIfWo2TR2w7pW3jCVYx4MTi
	kujq6yUlB3urG0JbgydLM496z+14YElNzARFGfTBjsMckB6yYmj7VOuY6CCMB1jciskSmRYJ9sk
	nWwLVBRfia1nESWfKFF3DYNC7TPlnqHoOYjJqIHkq
X-Gm-Gg: AfdE7ck/JTlRb5uPQfHwp65SDX6Tx0LfBtdOIGMCUoPFrlTD0yKoPAsUt+Zo00hF+DF
	pflwPlpNAAB393BMDbxXjcJJp0jCqHAA++br7cYnEcFJfd1zcpQpSj1a1oBpuy6hAh3C1elVEeS
	YwxxDrHIqgr8elAz2+xJ/8kpsdW+W0Th/ZMvfgBdIG/SYZU9Fqq0Jk/CUQN7AEIAQWj4cZSncZh
	zvt+8lY5QuKWdnvbsDBmYCetQoqD+Pl1Ecw7w6J39YE8tEhDJJ2uU/9TyqMzEYoWtgFfn8VZkeU
	P2bej22V
X-Received: by 2002:ac8:5e0d:0:b0:50f:be7b:923a with SMTP id
 d75a77b69052e-519e890f9bfmr4864371cf.9.1781857023534; Fri, 19 Jun 2026
 01:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-7-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-7-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:16:26 +0100
X-Gm-Features: AVVi8CcXSm3jW4-FHN7kYYGC1TN5KZ4bglqmRK39sQa6uZ2xmU2eoLlZ45Vf7AY
Message-ID: <CA+EHjTw0yrHqAPFUc6bK=u3D19mRyh-eeQgDmGioN+LLk2DXDQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/46] KVM: Rename memory attribute APIs to prepare for
 in-place gmem conversion
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
> From: Sean Christopherson <seanjc@google.com>
>
> Rename memory attribute APIs to add a "vm_" in the name in anticipation of
> moving PRIVATE tracking into guest_memfd, to allow in-place conversion
> between SHARED and PRIVATE.  At that point, there will effectively be two
> (potential) sources of memory attributes: the VM and guest_memfd.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Missing SoB (other patches as well, I won't mention it again). But for
this (and other patches I review with a missing SoB fixed):

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  arch/x86/kvm/mmu/mmu.c   |  6 +++---
>  include/linux/kvm_host.h | 15 +++++++++++----
>  virt/kvm/guest_memfd.c   |  6 +++---
>  virt/kvm/kvm_main.c      | 16 ++++++++--------
>  4 files changed, 25 insertions(+), 18 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index e0005a21b6e22..cbc50aef801fb 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -8087,11 +8087,11 @@ static bool hugepage_has_attrs(struct kvm *kvm, struct kvm_memory_slot *slot,
>         const unsigned long end = start + KVM_PAGES_PER_HPAGE(level);
>
>         if (level == PG_LEVEL_2M)
> -               return kvm_range_has_memory_attributes(kvm, start, end, ~0, attrs);
> +               return kvm_range_has_vm_memory_attributes(kvm, start, end, ~0, attrs);
>
>         for (gfn = start; gfn < end; gfn += KVM_PAGES_PER_HPAGE(level - 1)) {
>                 if (hugepage_test_mixed(slot, gfn, level - 1) ||
> -                   attrs != kvm_get_memory_attributes(kvm, gfn))
> +                   attrs != kvm_get_vm_memory_attributes(kvm, gfn))
>                         return false;
>         }
>         return true;
> @@ -8191,7 +8191,7 @@ void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
>                  * be manually checked as the attributes may already be mixed.
>                  */
>                 for (gfn = start; gfn < end; gfn += nr_pages) {
> -                       unsigned long attrs = kvm_get_memory_attributes(kvm, gfn);
> +                       unsigned long attrs = kvm_get_vm_memory_attributes(kvm, gfn);
>
>                         if (hugepage_has_attrs(kvm, slot, gfn, level, attrs))
>                                 hugepage_clear_mixed(slot, gfn, level);
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index d370e834d619e..eb26d4ea8945a 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2534,13 +2534,13 @@ static inline bool kvm_memslot_is_gmem_only(const struct kvm_memory_slot *slot)
>  }
>
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> -static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> +static inline unsigned long kvm_get_vm_memory_attributes(struct kvm *kvm, gfn_t gfn)
>  {
>         return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
>  }
>
> -bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> -                                    unsigned long mask, unsigned long attrs);
> +bool kvm_range_has_vm_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +                                       unsigned long mask, unsigned long attrs);
>  bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>                                         struct kvm_gfn_range *range);
>  bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> @@ -2548,7 +2548,14 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
> -       return kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +       return kvm_get_vm_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +}
> +static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
> +                                           gfn_t end)
> +{
> +       return kvm_range_has_vm_memory_attributes(kvm, start, end,
> +                                                 KVM_MEMORY_ATTRIBUTE_PRIVATE,
> +                                                 KVM_MEMORY_ATTRIBUTE_PRIVATE);
>  }
>  #else
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b4c24fdf159f6..8101f64e0366f 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -915,9 +915,9 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>
>         folio_unlock(folio);
>
> -       if (!kvm_range_has_memory_attributes(kvm, gfn, gfn + 1,
> -                                            KVM_MEMORY_ATTRIBUTE_PRIVATE,
> -                                            KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
> +       if (!kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + 1,
> +                                               KVM_MEMORY_ATTRIBUTE_PRIVATE,
> +                                               KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
>                 ret = -EINVAL;
>                 goto out_put_folio;
>         }
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 7b989b659cf82..6669f1477013c 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2419,7 +2419,7 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
>
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> -static u64 kvm_supported_mem_attributes(struct kvm *kvm)
> +static u64 kvm_supported_vm_mem_attributes(struct kvm *kvm)
>  {
>  #ifdef kvm_arch_has_private_mem
>         if (!kvm || kvm_arch_has_private_mem(kvm))
> @@ -2433,19 +2433,19 @@ static u64 kvm_supported_mem_attributes(struct kvm *kvm)
>   * Returns true if _all_ gfns in the range [@start, @end) have attributes
>   * such that the bits in @mask match @attrs.
>   */
> -bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> -                                    unsigned long mask, unsigned long attrs)
> +bool kvm_range_has_vm_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +                                       unsigned long mask, unsigned long attrs)
>  {
>         XA_STATE(xas, &kvm->mem_attr_array, start);
>         unsigned long index;
>         void *entry;
>
> -       mask &= kvm_supported_mem_attributes(kvm);
> +       mask &= kvm_supported_vm_mem_attributes(kvm);
>         if (attrs & ~mask)
>                 return false;
>
>         if (end == start + 1)
> -               return (kvm_get_memory_attributes(kvm, start) & mask) == attrs;
> +               return (kvm_get_vm_memory_attributes(kvm, start) & mask) == attrs;
>
>         guard(rcu)();
>         if (!attrs)
> @@ -2567,7 +2567,7 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
>         mutex_lock(&kvm->slots_lock);
>
>         /* Nothing to do if the entire range has the desired attributes. */
> -       if (kvm_range_has_memory_attributes(kvm, start, end, ~0, attributes))
> +       if (kvm_range_has_vm_memory_attributes(kvm, start, end, ~0, attributes))
>                 goto out_unlock;
>
>         /*
> @@ -2606,7 +2606,7 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
>         /* flags is currently not used. */
>         if (attrs->flags)
>                 return -EINVAL;
> -       if (attrs->attributes & ~kvm_supported_mem_attributes(kvm))
> +       if (attrs->attributes & ~kvm_supported_vm_mem_attributes(kvm))
>                 return -EINVAL;
>         if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
>                 return -EINVAL;
> @@ -4926,7 +4926,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>                 return 1;
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>         case KVM_CAP_MEMORY_ATTRIBUTES:
> -               return kvm_supported_mem_attributes(kvm);
> +               return kvm_supported_vm_mem_attributes(kvm);
>  #endif
>  #ifdef CONFIG_KVM_GUEST_MEMFD
>         case KVM_CAP_GUEST_MEMFD:
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
