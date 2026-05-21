Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D523A1A2D
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365641; cv=pass; b=LpqPiewqIkqyWWvxkr0j0jmqG4oG+nq52RuQ/vU9auWV2wtwmR/C5e9qwp8pwo6Bd2LwMREetp2g3rAIAFR6tb6+iVDDXwNjI2/MX+ip5VCGV/gObf2xdIPYaCQw9sR+jamY10yZyNjJvme0q81VhyJ++tJhDwUByFuxni/YEOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365641; c=relaxed/simple;
	bh=LYJgALBMb92rrgNb+Wzk0+WAd9qpquSCRXx7gbDTCrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3LC6UBks9cdUsEePLtxEHUR1TuyzsKLya9aAxa0IDVgfDrkV3K98DSI+y1Gd4hG00JqqvkgLQ/69uoF9f5JMLDIjCexQexwZvDLWdpJ/qPTyROeBUZGmHS5CUVUPCa4GMoC8TVVKP/9HxEynLZbz8cKHOIZJPa3241Ye44KhOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J1jkLUe7; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J1jkLUe7"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-515548f390fso5761cf.0
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 05:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779365637; cv=none;
        d=google.com; s=arc-20240605;
        b=B/43/ubnhH0SLTNk2Jkv/TgE8Y3P3sjfupm6lg4P/jimaiAIHxXd+fkp6QSMRkxqiA
         Tw4OWJEqZEFVDeHYkqP2w6kTq+IVXUU/U4H35IiuM0we+arzLMI0dMgY0mO0D7DFq24H
         yT4Gpy/SfnLJGjr8zViGkBge7oA0ulcGJ+9uq9Jv+yuNJ8AP4pC3O6xG8JXl3UvfH62b
         ZIu1HaTynMBKPeIO6qm36AJF1z8Q+M+HmiElVHFfsDfWjdLclGBg54vDV29RqZ8Bmes0
         bseOWc6FbLcbia214ityynmwgGQUxlOkVqFyQKhwK5mTL/HDOO6Mik00nMCJPHLayAsk
         tkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GJBi6kqgS/T+2nzhRr9ooN0dsVaPQuEMdq7fBLHxWNg=;
        fh=gi5oADljjfs8SHWEn8uaF31VupRtk0toF90yzi88EK4=;
        b=MMvVeVpVpb156+Qzc47a2b0459i874zvVBLMKtnXStDm8gTMMEz4296FG3b0mmQXb8
         rtLxhKbiDrmWrRIZbazw8zB0WhDnbV2CJEhzOZL+cCnfiDCaoEEPVv8fBZoNOEw3YAro
         e2vxRCL660+KFqb84L0v8SIcspNQjmuFwl9lpEl76B5hFjLUMYfoRkdDbsI1ElvHDrUN
         uTQbu7tlVMNMjX1jy8yhnge+Ps4KsIuwEAGkIFLfUtpSbFFhBXxJaCbVEbkTMytvcPHR
         1uljE7+aI/KWP4hTPMCUN+L2JENAudy2wCEsINm1M2WM2cgnHDBoJ+jHmG5ZPif2Ydfj
         JqVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779365637; x=1779970437; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJBi6kqgS/T+2nzhRr9ooN0dsVaPQuEMdq7fBLHxWNg=;
        b=J1jkLUe7M9ksKWMb/BBUhONwVvhSjddOCXZR5jedqH94Bs6J+aXZ9LA5gGqr8xA632
         kN2Y2HxtRi1tJ9tsHDMqlKGGFaKrMI1Q2b9K98SuC+R/VjDMVdWdVcKVBApY6Y9eyAEx
         b0ILdpnHUt7xtjX7AnBoPhpGOZb8GehrT6g60aU6ig6gpzCIGnKKcDs8huKNw8P4Ik5A
         89h2OdSZckAyeGhnJMKjS74B9uFJuhS0vt8dc+eU4gXYIQAPgk/ZsmHnRKihDbL0DJO+
         IRpTqgMKlD9yjBfwn9v+pLfpZnP35X17kQc/3bO86FumNBLvGFRQNqFjtNJCyFUFr+dV
         MryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365637; x=1779970437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJBi6kqgS/T+2nzhRr9ooN0dsVaPQuEMdq7fBLHxWNg=;
        b=TvuVu2evxFCPoRpL4+qLrXHDUM54E+wB4aPDcJGP/VsvzxHzQ6//WYFyt1YZ0z8mpr
         H8CitWYbNk+P59r45TydZd2QcqwfKAGlvOzHDmMTMTqTShXuKSooiyaQ3o/MbPzgldOF
         mN51DQvFLANpABB4IY857wub+imOwtPEyywi01Ob84aVMCXlTO4rCNBg/7du9if+0I/2
         qh0Mje5p1KhnmlfO7Id22/CQ0K9uyCvfFEifS3vzqbEYi4DJnfbDLwWr1u00I8JacGwe
         fC3JQuYCF+5kXiuexhpLPsC0IyS8wZfFTPpAwNGgC6q0bF3YMTgR2O3G+46kb3BdN5MK
         +p1g==
X-Forwarded-Encrypted: i=1; AFNElJ+BduxOIpASCXpF035RQPCVwd/6S4vxWKsHYg53hc14lFZ9mSbuncrBQE3a3vCybUpQXwDqP+rBn8gP@lists.linux.dev
X-Gm-Message-State: AOJu0YzhK+4a0W6E1NETCjDTTYy8BX3qSumgB4yIRavZ4X7eDDFIbMcy
	0plOiPOggFzJZWdhbUq/sD5hogahQRaj3026VEujdLKT+MCZZDyE/zsoCsV/0Dl5roIy6px2erY
	Qb0SWZXhjR2nT+palaF1UuA0L0ElxvgoLh1QkFaDP
X-Gm-Gg: Acq92OEXXZG7csW3rBqyHmmcHaE8030GdaiCatoORI13xzkc0maksshq44zfPY9jCpD
	VzDQQs87L8EPvV1NtiD3QZ9hsRpgrcuk6mocF69NGL3L4Col8tXuYPg25B3z1P99C1RakyaY5Cu
	JwIpAysqPlWjZqLSN//IRTQG+O/lQ1K4Kt5SPIutQlZL5eduWwCkNtiMdafNzO3hOhDO2S8bxku
	7Sls8N5f1lTvWraRuH6ErFN2M9de086/2NotdfP/tibF9LzY5EcOFtRsGcqZn9ezPeV2txzLQIe
	IZFhBKcql7ihBMmdmL4=
X-Received: by 2002:a05:622a:a94e:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-516c552fa38mr6885881cf.22.1779365636942; Thu, 21 May 2026
 05:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-24-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-24-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 13:13:19 +0100
X-Gm-Features: AVHnY4KHC9HIiDmjKgEge5iH3VKNmS75Hv9JyZN2WMHPkcnLceuX40X-36gd_Tk
Message-ID: <CA+EHjTzfo0_uxHbrcntLdHLaLGB3uO41+JzcyW+vHr+u=VB5=g@mail.gmail.com>
Subject: Re: [PATCH v6 24/43] KVM: selftests: Rename guest_memfd{,_offset} to gmem_{fd,offset}
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

On Thu, 7 May 2026 at 21:23, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Rename local variables and function parameters for the guest memory file
> descriptor and its offset to use a "gmem_" prefix instead of
> "guest_memfd_".
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h |  6 +++---
>  tools/testing/selftests/kvm/lib/kvm_util.c     | 26 +++++++++++++-------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 2ecaaa0e99654..f19383376ee8e 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -690,17 +690,17 @@ int __vm_set_user_memory_region(struct kvm_vm *vm, u32 slot, u32 flags,
>                                 gpa_t gpa, u64 size, void *hva);
>  void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                 gpa_t gpa, u64 size, void *hva,
> -                               u32 guest_memfd, u64 guest_memfd_offset);
> +                               u32 gmem_fd, u64 gmem_offset);
>  int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                  gpa_t gpa, u64 size, void *hva,
> -                                u32 guest_memfd, u64 guest_memfd_offset);
> +                                u32 gmem_fd, u64 gmem_offset);
>
>  void vm_userspace_mem_region_add(struct kvm_vm *vm,
>                                  enum vm_mem_backing_src_type src_type,
>                                  gpa_t gpa, u32 slot, u64 npages, u32 flags);
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 gpa_t gpa, u32 slot, u64 npages, u32 flags,
> -               int guest_memfd_fd, u64 guest_memfd_offset);
> +               int gmem_fd, u64 gmem_offset);
>
>  #ifndef vm_arch_has_protected_memory
>  static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index df73b23a4c66a..11da9b7546d03 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -947,7 +947,7 @@ void vm_set_user_memory_region(struct kvm_vm *vm, u32 slot, u32 flags,
>
>  int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                  gpa_t gpa, u64 size, void *hva,
> -                                u32 guest_memfd, u64 guest_memfd_offset)
> +                                u32 gmem_fd, u64 gmem_offset)
>  {
>         struct kvm_userspace_memory_region2 region = {
>                 .slot = slot,
> @@ -955,8 +955,8 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                 .guest_phys_addr = gpa,
>                 .memory_size = size,
>                 .userspace_addr = (uintptr_t)hva,
> -               .guest_memfd = guest_memfd,
> -               .guest_memfd_offset = guest_memfd_offset,
> +               .guest_memfd = gmem_fd,
> +               .guest_memfd_offset = gmem_offset,
>         };
>
>         TEST_REQUIRE_SET_USER_MEMORY_REGION2();
> @@ -966,10 +966,10 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>
>  void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                 gpa_t gpa, u64 size, void *hva,
> -                               u32 guest_memfd, u64 guest_memfd_offset)
> +                               u32 gmem_fd, u64 gmem_offset)
>  {
>         int ret = __vm_set_user_memory_region2(vm, slot, flags, gpa, size, hva,
> -                                              guest_memfd, guest_memfd_offset);
> +                                              gmem_fd, gmem_offset);
>
>         TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed, errno = %d (%s)",
>                     errno, strerror(errno));
> @@ -979,7 +979,7 @@ void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>  /* FIXME: This thing needs to be ripped apart and rewritten. */
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 gpa_t gpa, u32 slot, u64 npages, u32 flags,
> -               int guest_memfd, u64 guest_memfd_offset)
> +               int gmem_fd, u64 gmem_offset)
>  {
>         int ret;
>         struct userspace_mem_region *region;
> @@ -1055,12 +1055,12 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 region->mmap_size += alignment;
>
>         if (flags & KVM_MEM_GUEST_MEMFD) {
> -               if (guest_memfd < 0) {
> -                       u32 guest_memfd_flags = 0;
> +               if (gmem_fd < 0) {
> +                       u32 gmem_flags = 0;
>
> -                       TEST_ASSERT(!guest_memfd_offset,
> +                       TEST_ASSERT(!gmem_offset,
>                                     "Offset must be zero when creating new guest_memfd");
> -                       guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
> +                       gmem_fd = vm_create_guest_memfd(vm, mem_size, gmem_flags);
>                 } else {
>                         /*
>                          * Install a unique fd for each memslot so that the fd
> @@ -1068,11 +1068,11 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                          * needing to track if the fd is owned by the framework
>                          * or by the caller.
>                          */
> -                       guest_memfd = kvm_dup(guest_memfd);
> +                       gmem_fd = kvm_dup(gmem_fd);
>                 }
>
> -               region->region.guest_memfd = guest_memfd;
> -               region->region.guest_memfd_offset = guest_memfd_offset;
> +               region->region.guest_memfd = gmem_fd;
> +               region->region.guest_memfd_offset = gmem_offset;
>         } else {
>                 region->region.guest_memfd = -1;
>         }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
