Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A1E366051
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865395; cv=pass; b=INl+sFbHrj1uqOB/NriGS4N6GiriPCPH9//vGbDOIVCv5xopWXWamdaxOua2bVey3LOiBfOLLa3h74DhNwvuE+iZTmR/8Ccrd+TYQuE3I9b8fwCgZcHa76bVSnJC/Fh/+c5ez/5qi1m1pLiWtnyyOkMA6TiqyqDLafXP8jSKVHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865395; c=relaxed/simple;
	bh=Kpv/JcmfGFx2o0miFAoqUveVveGjW/t0twGJIKckgXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEoh5twXgF37se8HKkaaXRvqEcTbNOb2pKJ+P8jhtf6MzJD//cmlwOCpE9djc8QvGA+lSAGFPm06m4fqMLNIwPIfLnvdp/UfvSHr4BcBb8W3jeZruWnt5D3o4T/VPoASP5HQrQ1xHPAA4R/JTnrJVsBORWT+0T8nUDfGDZYAkmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pLzX0ORb; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pLzX0ORb"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-519ed52bcc6so131061cf.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 03:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781865392; cv=none;
        d=google.com; s=arc-20260327;
        b=pSc7gTWO4vBAkHl9LSpTjsNawIqd6mbUslc26jecRttzphB8yrTB9n/J1sXdtYAcmk
         OzwXxbaOcMLgkOMe5ReTSCnoZMf3Gk39khSYZa4cU4rqyBGfglWHzjEpsJJJd00Xq41k
         tulrnAZLNDaT2fl1mtP6MKkW5eXqTzk/7pxQG4s8knC2od+SBmbiIEWXaTI1c/FqkuGO
         3br9iV/5mOvPrLR5+v37HvBvIwhORgUmTjc1Qi3y3ppvmlM5SZgRKwnXG8iHpltVAL+9
         Uc9au21nasO+Y0tAQvO1omyUioy1GjJKpraAdQgX/MZOcwGfkTJWhol5xTdva/o5Bk8y
         zcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YuuXVoQ2ecZDLg/Pv4tnmec6MwmZ/WlSis1mzF80Zmw=;
        fh=cZZKUgSIc/0zYV6XjgWbf8O7lmlJPcWovWvq2SBr2vU=;
        b=FZVxZWswHMB9QfgD6TGBUaNQ8lbBh9pQe+BCkJsCJZeC1kv0YZR9Xad0A1JBuSdieZ
         ZJcvm2J1OINdUH6Hs6UH7fJC60xYgKu8wRLtYa+e1+xOlRibj7FSVeu2NzxGDIzl0bzq
         zOTyQojDckNwuoNsC7njWI5RT4Eb+CaStqeUyTqzfrzBzU4BLEdfUft+0mu6fTsZ9m3a
         9DlQ3La7o2b8n1W0TNW+MQDD3vuTJ2yCI5kcbS+eYE/EEADTX76bAcQtqa1cjvbrZKqP
         9hgNIG7MBKrybSMRtv5Q3DGe5rU8u/5IMtgveVQUdq6bx5STck+QyRQ2RTfnzsAhXkc1
         xBag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781865392; x=1782470192; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuuXVoQ2ecZDLg/Pv4tnmec6MwmZ/WlSis1mzF80Zmw=;
        b=pLzX0ORbqPdyhOydp+NIuDtT17GoXv9V4MkNfporbLK5J7+UIzX/3LvZzs/l5A3ErV
         O8K7yvXGp4Pj4WMGueY2hALw/B6d8xPDqpKIvr6HJx7xjHFSZWE7GY0rRHm7xVDmwLsk
         DxKNaGTnYiAMb6dEEeFa1ttfuUN7a57adIXOd3pleci/ZgmB5yGWRACi0hDW/xS+O6zV
         EviPR/LUdTJ41P7HrUaU0gdUIUMsIxeEWJEcsFEl2Z7FESv/k2gU+iphDcQnNXv/yEdV
         H156Zfsfl5ucDL3wKBZEzbKqJX6n8OLJjWR5SPHo4PasTN3GC3O6+Qb1fj82IumyJgH/
         2WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865392; x=1782470192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YuuXVoQ2ecZDLg/Pv4tnmec6MwmZ/WlSis1mzF80Zmw=;
        b=q6h7JD7WuVXDd36L25Y2bUm889zo79SwHzJudUawz6YA3FXojF24tIAMrdPps4EM/4
         yK9nIhNiigAkDR5zqgqpY/HDNfVonMkQx7csoOkgpvCl2yTGyXf3Kd5LPvelVd7cawI5
         uJbJe8OqC1zJ1xAkbHi+ZD2XUtPBxZVz2OfVTbibsgECqG+epYQ8h4YoJeazDzsSR8Dk
         DoH3bbOmk9ZCAaYKI9IEOff2JQqEA08NrHOjFmxatahsx5S/jn1eai6Xk8si8QIn/2uy
         DHcJEILyS4VmJPYJDuv3qRk8aM4R3x0bD9EBQtld2Ei/KD3gJsm8dw46L0JIGrv1PbAR
         4EYA==
X-Forwarded-Encrypted: i=1; AFNElJ+qkfOyYFXSX8M8ZSiJaEudv4ZjzqryjpYoQGGPWOyQK2ZtTGErlmUBcnYDF6q08UhLX038Aoam6NtZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyvoBsfFQxLk6GYlI4f2lDqRDW1/eYvHeELc0//ejSa4laXrly1
	JsVoUiXpkk//KBv5LmlG8XGlOv849vL6Pnt7IsIoY/Fo4TU9BUOFx4CjVoyGco23uq3IuThlGvl
	myBK+ft3JE3xvwJ6Z6W7eJAYstfLYE4XOv1hX3+Ts
X-Gm-Gg: AfdE7cndthzRUD+c3fQ3+ChwAcYeatmLcoNNm3zttdIs2LT+nG/qT/HTk5731XuZOrO
	A+G7YjvkdB37to/nqkI+tweCw17tHW89kTeHBZ2yU0bQrQKJgFIav2/WR8CUqiB8gQZQDf9oky/
	RKeUJYqPaY4gP7Z5gV0lqNZEWI85BIbrWdHPNHf3b3BYusxaDBrMcNglwNDNWs+EYPOrxcIpO3H
	qz/UVBiwbmlZr8tEqM35PSsHYbFhk7MrClcb4hoHziF7JBi2ropBXBa7dujB/1n39Hd61ZLKg==
X-Received: by 2002:a05:622a:82:b0:50f:ce97:3b84 with SMTP id
 d75a77b69052e-519e48867afmr7169791cf.6.1781865391025; Fri, 19 Jun 2026
 03:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-17-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-17-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 11:35:54 +0100
X-Gm-Features: AVVi8CcjKXQn8ypCrAeWLOhyWs6z3Z6iNQ-s7Ah4piPeXrrDDhzORiMG-WJ9jpU
Message-ID: <CA+EHjTzZ0GO9fspPaTzruj8331+ShEZmg2PF2AczcwJ94VvgvQ@mail.gmail.com>
Subject: Re: [PATCH v8 17/46] KVM: guest_memfd: Advertise KVM_SET_MEMORY_ATTRIBUTES2
 ioctl
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
> Introduce KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES to advertise the
> availability of the KVM_SET_MEMORY_ATTRIBUTES2 ioctl.
>
> KVM_SET_MEMORY_ATTRIBUTES2 is a guest_memfd-scoped version of the existing
> KVM_SET_MEMORY_ATTRIBUTES VM ioctl. It allows userspace to manage memory
> attributes, such as KVM_MEMORY_ATTRIBUTE_PRIVATE, directly on a guest_memfd
> file descriptor.
>
> This new version uses struct kvm_memory_attributes2, which adds an
> error_offset field to the output. This allows KVM to return the specific
> offset that triggered an error, which is especially useful for handling
> EAGAIN results caused by transient page reference counts during attribute
> conversions.
>
> Update the KVM API documentation to define the new ioctl and its behavior,
> and add the necessary UAPI definitions and capability checks.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Suggested-by: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  Documentation/virt/kvm/api.rst | 78 +++++++++++++++++++++++++++++++++++++++++-
>  include/uapi/linux/kvm.h       |  2 ++
>  virt/kvm/kvm_main.c            | 23 +++++++++----
>  3 files changed, 95 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index a833d90845b95..73878f34f6d2e 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -117,7 +117,7 @@ description:
>        x86 includes both i386 and x86_64.
>
>    Type:
> -      system, vm, or vcpu.
> +      system, vm, vcpu or guest_memfd.
>
>    Parameters:
>        what parameters are accepted by the ioctl.
> @@ -6373,6 +6373,8 @@ S390:
>  Returns -EINVAL if the VM has the KVM_VM_S390_UCONTROL flag set.
>  Returns -EINVAL if called on a protected VM.
>
> +.. _KVM_SET_MEMORY_ATTRIBUTES:
> +
>  4.141 KVM_SET_MEMORY_ATTRIBUTES
>  -------------------------------
>
> @@ -6566,6 +6568,80 @@ KVM_S390_KEYOP_SSKE
>    Sets the storage key for the guest address ``guest_addr`` to the key
>    specified in ``key``, returning the previous value in ``key``.
>
> +4.145 KVM_SET_MEMORY_ATTRIBUTES2
> +---------------------------------
> +
> +:Capability: KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES
> +:Architectures: all
> +:Type: guest_memfd ioctl
> +:Parameters: struct kvm_memory_attributes2 (in/out)
> +:Returns: 0 on success, <0 on error
> +
> +Errors:
> +
> +  ========== ===============================================================
> +  EINVAL     The specified `offset` or `size` were invalid (e.g. not
> +             page aligned, causes an overflow, or size is zero).
> +  EFAULT     The parameter address was invalid.
> +  EAGAIN     Some page within requested range had unexpected refcounts. The
> +             offset of the page will be returned in `error_offset`.
> +  ENOMEM     Ran out of memory trying to track private/shared state
> +  ========== ===============================================================
> +
> +KVM_SET_MEMORY_ATTRIBUTES2 is an extension to
> +KVM_SET_MEMORY_ATTRIBUTES that supports returning (writing) values to
> +userspace.  The original (pre-extension) fields are shared with
> +KVM_SET_MEMORY_ATTRIBUTES identically.
> +
> +Attribute values are shared with KVM_SET_MEMORY_ATTRIBUTES.
> +
> +::
> +
> +  struct kvm_memory_attributes2 {
> +       /* in */
> +       union {
> +               __u64 address;
> +               __u64 offset;
> +       };
> +       __u64 size;
> +       __u64 attributes;
> +       __u64 flags;
> +       /* out */
> +       __u64 error_offset;
> +       __u64 reserved[11];
> +  };
> +
> +  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> +
> +Set attributes for a range of offsets within a guest_memfd to
> +KVM_MEMORY_ATTRIBUTE_PRIVATE to limit the specified guest_memfd backed
> +memory range for guest_use. Even if KVM_CAP_GUEST_MEMFD_MMAP is
> +supported, after a successful call to set
> +KVM_MEMORY_ATTRIBUTE_PRIVATE, the requested range will not be mappable
> +into host userspace and will only be mappable by the guest.
> +
> +To allow the range to be mappable into host userspace again, call
> +KVM_SET_MEMORY_ATTRIBUTES2 on the guest_memfd again with
> +KVM_MEMORY_ATTRIBUTE_PRIVATE unset.
> +
> +KVM does not directly manipulate the memory contents of pages during
> +attribute updates. However, the process of setting these attributes,
> +which includes operations such as unmapping pages from the host or
> +stage-2 page tables, may result in side effects on memory contents
> +that vary across different trusted firmware implementations.
> +
> +If this ioctl returns -EAGAIN, the offset of the page with unexpected
> +refcounts will be returned in `error_offset`. This can occur if there
> +are transient refcounts on the pages, taken by other parts of the
> +kernel.
> +
> +Userspace is expected to figure out how to remove all known refcounts
> +on the shared pages, such as refcounts taken by get_user_pages(), and
> +try the ioctl again. A possible source of these long term refcounts is
> +if the guest_memfd memory was pinned in IOMMU page tables.
> +
> +See also: :ref: `KVM_SET_MEMORY_ATTRIBUTES`.
> +
>  .. _kvm_run:
>
>  5. The kvm_run structure
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 876c0429f9d4e..129d6f6303251 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -997,6 +997,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_S390_KEYOP 247
>  #define KVM_CAP_S390_VSIE_ESAMODE 248
>  #define KVM_CAP_S390_HPAGE_2G 249
> +#define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 250
>
>  struct kvm_irq_routing_irqchip {
>         __u32 irqchip;
> @@ -1649,6 +1650,7 @@ struct kvm_memory_attributes {
>         __u64 flags;
>  };
>
> +/* Available with KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES */
>  #define KVM_SET_MEMORY_ATTRIBUTES2              _IOWR(KVMIO,  0xd2, struct kvm_memory_attributes2)
>
>  struct kvm_memory_attributes2 {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index a08b518cdb175..044486f128c37 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2434,18 +2434,22 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  }
>  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
>
> +#ifdef kvm_arch_has_private_mem
> +static u64 kvm_supports_private_mem(struct kvm *kvm)
> +{
> +       return !kvm || kvm_arch_has_private_mem(kvm);
> +}
> +#else
> +#define kvm_supports_private_mem(kvm) false
> +#endif
> +
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  static u64 kvm_supported_vm_mem_attributes(struct kvm *kvm)
>  {
> -#ifdef kvm_arch_has_private_mem
> -       if (gmem_in_place_conversion)
> +       if (gmem_in_place_conversion || !kvm_supports_private_mem(kvm))
>                 return 0;
>
> -       if (!kvm || kvm_arch_has_private_mem(kvm))
> -               return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> -#endif
> -
> -       return 0;
> +       return KVM_MEMORY_ATTRIBUTE_PRIVATE;
>  }
>
>  /*
> @@ -4969,6 +4973,11 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>                 return 1;
>         case KVM_CAP_GUEST_MEMFD_FLAGS:
>                 return kvm_gmem_get_supported_flags(kvm);
> +       case KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES:
> +               if (!gmem_in_place_conversion || !kvm_supports_private_mem(kvm))
> +                       return 0;
> +
> +               return KVM_MEMORY_ATTRIBUTE_PRIVATE;
>  #endif
>         default:
>                 break;
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
