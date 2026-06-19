Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608AF3644CF
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781861158; cv=pass; b=RJvONJAHhydZPDn+Dbv8y3BPHlC9GN9vwi0+NAA1x9+Wl5NhH2JC2oB47S2Idc75tvRhTIU9vTNvwud5Tbk39XBX9HT+jzBTH4Afg5NyaJEwpStKVG7p/AWnh49unQFOYQf1P7tD+cmDxBpqhSiT3Wacvu8T67X/HCaAY2+OYG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781861158; c=relaxed/simple;
	bh=y43IQfs1i1le1AIroVpz9/oDYT7obWLVd6/WXo6ERP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhb0wQqUhsxzJ6V06g68XHe5ag/90dMzhsZyb73Kxeso8x9pb9mZNr/kANmAiFvtJW9ID4ua5qQhYujy036OxsHbqJf9+d5yOrnY4SA89vNhNDM8CV1Vz4ijz4AY7a8rMd42B1Re/W/Y7YjPkB4ycV4Wm7NehQEUFRhqnXlMzkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T5x69set; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T5x69set"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51765531803so213551cf.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 02:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781861153; cv=none;
        d=google.com; s=arc-20260327;
        b=R7XZLaARALfgRX/9tQxZSwf5woLaoO4mojceA5KcvBhJbLjNStt9fd82Dkm7mZBaea
         GSa/Nim/7qPBzzqytj6B+4EN1FkkzaXI6lFcD5PMI/LGI3o097EoJVs81QhMK5MaJ7z6
         W6lFc+nD+jcY1h710MzW416KwQk0wuwJTisQFVEGKXet1yqMdlu6neWbGov34icZc0n3
         6r1I3C9WoNQ0H6I/T1aKRHm/9vJBZlB98WnyKzTgr4Kl5e4y5mBE8o7u00vHI+exUP7c
         X2tubpqd+cS6AXXtR7aYbueh7uFVNLZ3oZm4gC11lgm+EH9GpkD/oRCmWjZyFXNcbZyF
         yoJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=urVcLx5BPkCCi6p3vFYGwMdjBtbKpYO1ZXkEN7UqG9M=;
        fh=r6lKLTFD8ak7skypq7iqSzCVf7BTbzIZDBlnLSt3mbU=;
        b=YbLapjkXdfac5IDtcHHVx5oKx0LO1Y4ok27GlPSxxLS75trxhxC+xPaAcYFiI+QCJ7
         Yb3oqea7/FHrfkBQQyGgLRy+Gyl1/HWwggBQMSs6/Bm0hpeQuefcJ96fnlTiSMjhYW1q
         OMaWWPUXFNPi895WwgBNFX/xJdrFhFbePN1Jp298BHk7fKv665qc1/5TuSUhY9Z9QooJ
         C9qZccxhZhIYVK6nJ7kHzUAVa9VCDDU9lyw6zgbCLJV3mDbVxDLzN93zN+Eft9O9Svf3
         cZ7H0D4+AmUn5cWait2GSNt2Ywagxqwc4XWOvOxX0OpZ8ZHfJaXaexDJ0NDWKkXzTB5a
         FqCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781861153; x=1782465953; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urVcLx5BPkCCi6p3vFYGwMdjBtbKpYO1ZXkEN7UqG9M=;
        b=T5x69setoL9WtCi7WRl6PaoBbSexFauL8QkiBh++dyeBHZJWqipVXOG/GUcgRQLmHv
         52NUUYvdoocekXBIBYq6BzqSmFUzOcdxc7/FQ9mJQEet9yZ9jIY6pq+OUYv4fni+2rbq
         o570VeBTrHm7pMvLWOogkfT43oBkrwHSa44F+I3hkZbyk3NeQR/ef8HS+nYagOpDxMeJ
         VQxAUZ5Dd/FYf+u3u438+Y6nbpNeRzpSH+NL8x4qKVppV85qFFimehJKru6vqaaoQXhc
         AuLhzSIj9YtKQ+sxV8GI5PNW18DUnP4UNOTypBuI/1h9FRwVswFTeSn63Nttrmp9f0zm
         Sg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781861153; x=1782465953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=urVcLx5BPkCCi6p3vFYGwMdjBtbKpYO1ZXkEN7UqG9M=;
        b=bT413js9QPFP2e3oNIsHwTmQp8wnwkV30EYat9WsFZBkPlqEVSkgzDfX6R5MuJgi4R
         UXjGzcSLaA9yps9IOupccIM4YaFEAaZFNOg5C1ZKJyUb19vfcZisM1rahDa5DBZqgsue
         Q4DbhCNP9Te/tD0BDCVIkUSrw/5zSm2i94w2rACAlJIdINy8JAkJh6zM5i+GCWSL88OC
         1Aq4oZdw/CJV9YWN/x2zoVNDvzXdp6BIUHV2uMzOM9n8InMSWhUekICCpZV1C0aCa9JL
         jY+HusSFPDiWiyDki9ohZpDa8nqBZWedDCoTTk6QCl7JmLfL1xXEP2eUKYCEJNHfz7zt
         3b+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+msK6i5sr4YTTvtdN6F1mw2KxrQ86GeaE2WlT6ONzngQP/TIDHmWWRSe4U5KspCYzsd26PVGSqryAZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ3yodJ/pbVhAEzU0e0jpXmx8aBbA8jtlDXBmty/RrfMD+7FNT
	0OjRe8CPVjOBcVw65W/pvYuX6m4pWjX0i7QHG5B12jwuF787hQ2Tuad8UIXdF+daESR6/kIqXCD
	DQvD7aLt8S2EYwvo4ExOSagEtiYQLgj7V0R7pWair
X-Gm-Gg: AfdE7cnpr6ornst4SyDtlLW9SoM32AMVEq14zwuA39YX04LQi6CTDXfBlJ/HwIxjpyt
	Ybhr0JPB1bync6vkSP1KUyZJaDxpIll8HbhlBAaXZe6Dk4zTZICaiq4anqrg9cb8N5xvp4GgJq7
	PKGlMScpKgv/T/lDb3bTF3ogyXxgQAhBWnAKHKjW4h21tggaTxSBcAJ7E97btR45BmmC4cXZgw/
	Mf4rSvF6xW3OXWSzwK0UJfHron5aqz6u62J/njocbsx16FBf+lyuwlOjIMhlxE41l579Q/Axw==
X-Received: by 2002:a05:622a:4186:b0:516:4f62:85eb with SMTP id
 d75a77b69052e-519e4a74a8emr7841591cf.22.1781861152102; Fri, 19 Jun 2026
 02:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-13-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-13-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 10:25:15 +0100
X-Gm-Features: AVVi8Cepq97zo_gQa9J80U8EU69NTSVdwN_TrW1pA3rg2sfSJVKhF_cpG6CcVaU
Message-ID: <CA+EHjTx2xKjheiW5VzHw_TdWFUqdJqfgu=dOPa=_yaYBMY8uyw@mail.gmail.com>
Subject: Re: [PATCH v8 13/46] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
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
> Introduce base support for KVM_SET_MEMORY_ATTRIBUTES2 in guest_memfd, which
> just updates attributes tracked by guest_memfd.
>
> Validate input fields in general. Guard usage of KVM_SET_MEMORY_ATTRIBUTES2
> by making sure requested attributes are supported for this instance of kvm.
>
> A new KVM_SET_MEMORY_ATTRIBUTES2 is defined to support writes (unlike
> KVM_SET_MEMORY_ATTRIBUTES) in addition to reads so it can provide error
> details to userspace. This will be used in a later patch.
>
> The two ioctls use their corresponding structs with no overlap, but
> backward compatibility is baked in for future support of
> KVM_SET_MEMORY_ATTRIBUTES2 and struct kvm_memory_attributes2 in the VM
> ioctl.
>
> The process of setting memory attributes is set up such that the later half
> will not fail due to allocation. Any necessary checks are performed before
> the point of no return.
>
> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Sean Christoperson <seanjc@google.com>
> Signed-off-by: Sean Christoperson <seanjc@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Note sure if it's user error on my part, if I'm applying this to the
wrong base, but I found a build break here on patch 13:
kvm_gmem_invalidate_start() doesn't exist in the base tree. The
function is kvm_gmem_invalidate_begin() here. The rename
(190cc5370a8b6) landed via a different merge path and isn't an
ancestor of the stated base.

Patches 19 and 20 have the same mismatch. Fix for all three is
s/kvm_gmem_invalidate_start/kvm_gmem_invalidate_begin/.

Cheers,
/fuad

> ---
>  include/uapi/linux/kvm.h |  13 ++++++
>  virt/kvm/Kconfig         |   1 +
>  virt/kvm/guest_memfd.c   | 116 +++++++++++++++++++++++++++++++++++++++++++++++
>  virt/kvm/kvm_main.c      |  12 +++++
>  4 files changed, 142 insertions(+)
>
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 419011097fa8e..956877a6aab05 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1649,6 +1649,19 @@ struct kvm_memory_attributes {
>         __u64 flags;
>  };
>
> +#define KVM_SET_MEMORY_ATTRIBUTES2              _IOWR(KVMIO,  0xd2, struct kvm_memory_attributes2)
> +
> +struct kvm_memory_attributes2 {
> +       union {
> +               __u64 address;
> +               __u64 offset;
> +       };
> +       __u64 size;
> +       __u64 attributes;
> +       __u64 flags;
> +       __u64 reserved[12];
> +};
> +
>  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
>
>  #define KVM_CREATE_GUEST_MEMFD _IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 297e4399fbd49..cfa2c78ba5fb9 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -102,6 +102,7 @@ config KVM_MMU_LOCKLESS_AGING
>
>  config KVM_GUEST_MEMFD
>         select XARRAY_MULTI
> +       select KVM_MEMORY_ATTRIBUTES
>         bool
>
>  config HAVE_KVM_ARCH_GMEM_PREPARE
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 65ce795c090d9..0d14548c1ed22 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -541,11 +541,127 @@ bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn)
>  }
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_is_private);
>
> +/*
> + * Preallocate memory for attributes to be stored on a maple tree, pointed to
> + * by mas.  Adjacent ranges with attributes identical to the new attributes
> + * will be merged.  Also sets mas's bounds up for storing attributes.
> + *
> + * This maintains the invariant that ranges with the same attributes will
> + * always be merged.
> + */
> +static int kvm_gmem_mas_preallocate(struct ma_state *mas, u64 attributes,
> +                                   pgoff_t start, size_t nr_pages)
> +{
> +       pgoff_t end = start + nr_pages;
> +       pgoff_t last = end - 1;
> +       void *entry;
> +
> +       /* Try extending range. entry is NULL on overflow/wrap-around. */
> +       mas_set(mas, end);
> +       entry = mas_find(mas, end);
> +       if (entry && xa_to_value(entry) == attributes)
> +               last = mas->last;
> +
> +       if (start > 0) {
> +               mas_set(mas, start - 1);
> +               entry = mas_find(mas, start - 1);
> +               if (entry && xa_to_value(entry) == attributes)
> +                       start = mas->index;
> +       }
> +
> +       mas_set_range(mas, start, last);
> +       return mas_preallocate(mas, xa_mk_value(attributes), GFP_KERNEL);
> +}
> +
> +static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
> +                                    size_t nr_pages, uint64_t attrs)
> +{
> +       struct address_space *mapping = inode->i_mapping;
> +       struct gmem_inode *gi = GMEM_I(inode);
> +       pgoff_t end = start + nr_pages;
> +       struct maple_tree *mt;
> +       struct ma_state mas;
> +       int r;
> +
> +       mt = &gi->attributes;
> +
> +       filemap_invalidate_lock(mapping);
> +
> +       mas_init(&mas, mt, start);
> +       r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
> +       if (r)
> +               goto out;
> +
> +       /*
> +        * From this point on guest_memfd has performed necessary
> +        * checks and can proceed to do guest-breaking changes.
> +        */
> +
> +       kvm_gmem_invalidate_start(inode, start, end);
> +       mas_store_prealloc(&mas, xa_mk_value(attrs));
> +       kvm_gmem_invalidate_end(inode, start, end);
> +out:
> +       filemap_invalidate_unlock(mapping);
> +       return r;
> +}
> +
> +static long kvm_gmem_set_attributes(struct file *file, void __user *argp)
> +{
> +       struct gmem_file *f = file->private_data;
> +       struct inode *inode = file_inode(file);
> +       struct kvm_memory_attributes2 attrs;
> +       size_t nr_pages;
> +       pgoff_t index;
> +       int i;
> +
> +       if (copy_from_user(&attrs, argp, sizeof(attrs)))
> +               return -EFAULT;
> +
> +       if (attrs.flags)
> +               return -EINVAL;
> +       for (i = 0; i < ARRAY_SIZE(attrs.reserved); i++) {
> +               if (attrs.reserved[i])
> +                       return -EINVAL;
> +       }
> +       if (!kvm_arch_has_private_mem(f->kvm))
> +               return -EINVAL;
> +       if (attrs.attributes & ~KVM_MEMORY_ATTRIBUTE_PRIVATE)
> +               return -EINVAL;
> +       if (attrs.size == 0 || attrs.offset + attrs.size < attrs.offset)
> +               return -EINVAL;
> +       if (!PAGE_ALIGNED(attrs.offset) || !PAGE_ALIGNED(attrs.size))
> +               return -EINVAL;
> +
> +       if (attrs.offset >= i_size_read(inode) ||
> +           attrs.offset + attrs.size > i_size_read(inode))
> +               return -EINVAL;
> +
> +       nr_pages = attrs.size >> PAGE_SHIFT;
> +       index = attrs.offset >> PAGE_SHIFT;
> +       return __kvm_gmem_set_attributes(inode, index, nr_pages,
> +                                        attrs.attributes);
> +}
> +
> +static long kvm_gmem_ioctl(struct file *file, unsigned int ioctl,
> +                          unsigned long arg)
> +{
> +       switch (ioctl) {
> +       case KVM_SET_MEMORY_ATTRIBUTES2:
> +               if (!gmem_in_place_conversion)
> +                       return -ENOTTY;
> +
> +               return kvm_gmem_set_attributes(file, (void __user *)arg);
> +       default:
> +               return -ENOTTY;
> +       }
> +}
> +
>  static struct file_operations kvm_gmem_fops = {
>         .mmap           = kvm_gmem_mmap,
>         .open           = generic_file_open,
>         .release        = kvm_gmem_release,
>         .fallocate      = kvm_gmem_fallocate,
> +       .unlocked_ioctl = kvm_gmem_ioctl,
>  };
>
>  static int kvm_gmem_migrate_folio(struct address_space *mapping,
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 01761f6e25d25..a08b518cdb175 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -105,6 +105,18 @@ module_param(allow_unsafe_mappings, bool, 0444);
>  bool __ro_after_init gmem_in_place_conversion = false;
>  #endif
>
> +#define MEMORY_ATTRIBUTES_MATCH(one, two)                              \
> +       static_assert(offsetof(struct kvm_memory_attributes, one) ==    \
> +                     offsetof(struct kvm_memory_attributes2, two));    \
> +       static_assert(sizeof_field(struct kvm_memory_attributes, one) ==\
> +                     sizeof_field(struct kvm_memory_attributes2, two))
> +
> +/* Ensure the common parts of the two structs are identical. */
> +MEMORY_ATTRIBUTES_MATCH(address, address);
> +MEMORY_ATTRIBUTES_MATCH(size, size);
> +MEMORY_ATTRIBUTES_MATCH(attributes, attributes);
> +MEMORY_ATTRIBUTES_MATCH(flags, flags);
> +
>  /*
>   * Ordering of locks:
>   *
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
