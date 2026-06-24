Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E003833439A
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 19:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328090; cv=pass; b=UiId7wnMa8LdnIXEW32hy6oHE1ZnZ7R0LizGmeLSjl1ZhOhWg9bAtP36wDTVkPvhUEQ5wxH+zCUdMq/qSYYo2qTmbLFo5penuxhxiBE8RWq25qv73vq0eEn9AibxmPOx7TyMt6933AA45mCmx5YH1wALIhGh0LXoSPqcaBSaUHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328090; c=relaxed/simple;
	bh=UP+Dr5MrbTzrKOKcZX0iQlCSzBjZ6w5Lp2OCqKc9Uds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpWZ6258hQ77NMOjZj04JZcZ2HFAablPepyRWTzOng1v1JN1NSuq2VWnAoVlPb5deSnxm828cGQlLMOnfhOQE7gl29NdF8MxdgCA1EU0TJ8ttjcAgTKJLmIcYJoxjnJnDDVDYUGY0TDRn2TTejjGTL9v1TuVLBcGkl0w8wp3SsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dg2/TUc8; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dg2/TUc8"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5177d1ff061so53161cf.1
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 12:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782328088; cv=none;
        d=google.com; s=arc-20260327;
        b=pV6siuizld3m+beMgPWAE2rJmoFQ3UqWjW8+e46/qWav66C8hklrToTYB8aEjufeUo
         yEBMNohzKUuUoEYN4vU133mPdS4sqgX2Qvv1pnIsx1xWyMWHWak/spTvVW8P3I0VQ1Xc
         aK8G+cPwuZg1Q2sj7j3DfrZcD2Gstv0QO2mmnVnK1eavR/e6QDVc0XF3N2hy1WMHTms/
         TCB+jzZPM7phE0F17FQg4YaHgHLlYdon2IqXaOhDBrULtiDDVtLoQOvhI3IURZ3PhcoU
         XcfW1saGyFjtpaP3U1JkVfPRcHIHEK/wLlrZ3hsRlsPoNtHOZO/QMsU8EKS9TmFlR+UQ
         4qLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TYok/yKaRGCFgGghY1Qu2/NCTVWG+h4PYN0XraBeOm8=;
        fh=TFzppgEOdqvESeMaacs8DMMzyJFrTZUn2zpKlkqw8lA=;
        b=KB1sPqWljSd/xfJTjYEWh7bKdCu2VDEQSnb+KzekRpCqaGqEU7pB0oaXmI/m9+BQRL
         DwwxrNT/Q7jT00sZvogbMOmI6Vz5aKW/iZv4GBbFJt3q4cQhYahvx7QhYcdhvXFmYVwO
         7XJ9rBhkgF6HxhFwNewv8CrdjMYG4Fhx30fu2AlJt5RvV5tKuv4wVTbi0Hy9uC2CgJ6V
         h0M63qxntUV0kW5jnxchPPfZivaIfKvXsOlviCpnKrGuRAqDB3KPrQ+dD/oV+wNEV4Zc
         CVtZutQV0RAfRf2vkkQyX4E8KdHodppMT0PMnsV9clyFV0Hz+y+1eylhzKodw1wXDn6n
         959Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782328088; x=1782932888; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYok/yKaRGCFgGghY1Qu2/NCTVWG+h4PYN0XraBeOm8=;
        b=Dg2/TUc8F1bRUeEd4J1B3uNMflWzb4LgeYq69/BzirGV8C0xcQjZ9QVilnTotVKd13
         6yqaeUYEDRa5OH0GgddzILzIvpk5du7FyxSo6H+cQU+Ps87115p0zL6MvyHg72iGOYtU
         kDpRuX4lMRCsOowPiWDeHp1Xgs1HBNayBQ7gKIPJcLVikUAhIPKE/QI+cvTQ4LkVL9Dk
         FSAERodB1ZKOKg2QppmNjnL153LKMXseRoc03z/UxGAFI7IQ1Z2ZKVfma0T3XJGXlm5l
         1Zdd6wex7qxDuLwB+QkuwrPk3GPsDYEaDP/NQpJgotlbozJe1uRL8W6mW8BKtLNoSx4o
         7V7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328088; x=1782932888;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TYok/yKaRGCFgGghY1Qu2/NCTVWG+h4PYN0XraBeOm8=;
        b=aK6zZ748sHiWobhz/qEoW4nT6mcSqt0QeD9V8prf45Xr9g6Xgvv+0xhKJiaouNMnL5
         MDZo8mhc06njJlwu025znISHXgGvvFTYUyta+h986frSNcbgM8w4aV8wO3JFSoHcMgXl
         aZ5iABnO/GAOzQCmiXAy8KD21V60Ufrzvzl3sHgdt9pd65u6iKjfRiSqu0kD8vFXB/GC
         Wub+tsuGuzyNAAjq39pTgOj5ttK8gFmp6Rqpj/m4jzsBQnAARKWgFppyU13fJY3zOkbl
         +zUyFMe7BVNPye6HZLDz6//Dpc5TGP9vh5a538gbe9k62Qx0X8a+PzCunn3y/uLd37IQ
         /JCg==
X-Forwarded-Encrypted: i=1; AFNElJ8Ng9R/VFF3/qcTXEock+m0raDD/kcjtQh15eRSQA0GT682Ht6PMemVEErvlO6PW5oRqVk+MGG7D/nA@lists.linux.dev
X-Gm-Message-State: AOJu0YyqBEbVk5UZ6wjwD++VZc5AJbofVZ4j2EOta5Ino0JyIhVQn805
	ivu8ywIFBrxMTXsIy5yrYwESckqZnX9XkktyzquwFC39IuooSvOgejUp7zFViR1vLCQJ6ONp/RI
	gHgQyAiGJJL/bx2E0hDYhjyubSWYopvFb12sbXJXI
X-Gm-Gg: AfdE7ck3NmCA8Y6x70oww7vvqkEPfzXfT5lI7Xte8yt79MOGx6q1zkWL1cQmbXtefLd
	bjRs0xg2CYojUiNJeUI44MWZj248K4EqBMLsp6qmYqBIrOPHkx5a2nfwQvAwdqu7J8Efuj7cTAf
	JD8GngJFDYILvIJVIc4L20VDRZpPsImTltjL0zge3xTqoOSsH3CJOwaF/avz8/Bvki4paIP9RtT
	nPrOdB7zHs4aiFIKJ1R/q3yIt956zDc8Ju5UR6pi3Gb+zLnAxDa2RYEzFoca/AZEzgkl2Qp0w==
X-Received: by 2002:a05:622a:aa89:20b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-51a6ec225f4mr979921cf.7.1782328086856; Wed, 24 Jun 2026
 12:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-28-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-28-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 24 Jun 2026 20:07:29 +0100
X-Gm-Features: AVVi8Cd8t5YxMdE0Ng1SGfAxSm9nIleavoz2HxsrURbnpplSd_eJ9V_CBlxTVmc
Message-ID: <CA+EHjTwoMC3iZ=NVLCX7eypj3gwV4Ja4gLMoWsCwbXTd4980Vw@mail.gmail.com>
Subject: Re: [PATCH v8 28/46] KVM: selftests: Add support for mmap() on
 guest_memfd in core library
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

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Accept gmem_flags in vm_mem_add() to be able to create a guest_memfd within
> vm_mem_add().
>
> When vm_mem_add() is used to set up a guest_memfd for a memslot, set up the
> provided (or created) gmem_fd as the fd for the user memory region. This
> makes it available to be mmap()-ed from just like fds from other memory
> sources. mmap() from guest_memfd using the provided gmem_flags and
> gmem_offset.
>
> Add a kvm_slot_to_fd() helper to provide convenient access to the file
> descriptor of a memslot.
>
> Update existing callers of vm_mem_add() to pass 0 for gmem_flags to
> preserve existing behavior.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [For guest_memfds, mmap() using gmem_offset instead of 0 all the time.]
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h     |  7 +++++-
>  tools/testing/selftests/kvm/lib/kvm_util.c         | 27 ++++++++++++----------
>  .../kvm/x86/private_mem_conversions_test.c         |  2 +-
>  3 files changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index d4c104cb0418f..0cacf3698b259 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -700,7 +700,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>                                  gpa_t gpa, u32 slot, u64 npages, u32 flags);
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 gpa_t gpa, u32 slot, u64 npages, u32 flags,
> -               int gmem_fd, u64 gmem_offset);
> +               int gmem_fd, u64 gmem_offset, u64 gmem_flags);
>
>  #ifndef vm_arch_has_protected_memory
>  static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
> @@ -732,6 +732,11 @@ void *addr_gva2hva(struct kvm_vm *vm, gva_t gva);
>  gpa_t addr_hva2gpa(struct kvm_vm *vm, void *hva);
>  void *addr_gpa2alias(struct kvm_vm *vm, gpa_t gpa);
>
> +static inline int kvm_slot_to_fd(struct kvm_vm *vm, u32 slot)
> +{
> +       return memslot2region(vm, slot)->fd;
> +}
> +
>  #ifndef vcpu_arch_put_guest
>  #define vcpu_arch_put_guest(mem, val) do { (mem) = (val); } while (0)
>  #endif
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 9b482778f7379..d5bbc80b2bf1c 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -978,12 +978,13 @@ void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>  /* FIXME: This thing needs to be ripped apart and rewritten. */
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 gpa_t gpa, u32 slot, u64 npages, u32 flags,
> -               int gmem_fd, u64 gmem_offset)
> +               int gmem_fd, u64 gmem_offset, u64 gmem_flags)
>  {
>         int ret;
>         struct userspace_mem_region *region;
>         size_t backing_src_pagesz = get_backing_src_pagesz(src_type);
>         size_t mem_size = npages * vm->page_size;
> +       off_t mmap_offset = 0;
>         size_t alignment = 1;
>
>         TEST_REQUIRE_SET_USER_MEMORY_REGION2();
> @@ -1055,8 +1056,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>
>         if (flags & KVM_MEM_GUEST_MEMFD) {
>                 if (gmem_fd < 0) {
> -                       u32 gmem_flags = 0;
> -
>                         TEST_ASSERT(!gmem_offset,
>                                     "Offset must be zero when creating new guest_memfd");
>                         gmem_fd = vm_create_guest_memfd(vm, mem_size, gmem_flags);
> @@ -1077,13 +1076,17 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>         }
>
>         region->fd = -1;
> -       if (backing_src_is_shared(src_type))
> +       if (flags & KVM_MEM_GUEST_MEMFD && gmem_flags & GUEST_MEMFD_FLAG_MMAP) {
> +               region->fd = kvm_dup(gmem_fd);
> +               mmap_offset = gmem_offset;
> +       } else if (backing_src_is_shared(src_type)) {
>                 region->fd = kvm_memfd_alloc(region->mmap_size,
>                                              src_type == VM_MEM_SRC_SHARED_HUGETLB);
> +       }
>
> -       region->mmap_start = kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
> -                                     vm_mem_backing_src_alias(src_type)->flag,
> -                                     region->fd);
> +       region->mmap_start = __kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
> +                                       vm_mem_backing_src_alias(src_type)->flag,
> +                                       region->fd, mmap_offset);
>
>         TEST_ASSERT(!is_backing_src_hugetlb(src_type) ||
>                     region->mmap_start == align_ptr_up(region->mmap_start, backing_src_pagesz),
> @@ -1129,10 +1132,10 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>
>         /* If shared memory, create an alias. */
>         if (region->fd >= 0) {
> -               region->mmap_alias = kvm_mmap(region->mmap_size,
> -                                             PROT_READ | PROT_WRITE,
> -                                             vm_mem_backing_src_alias(src_type)->flag,
> -                                             region->fd);
> +               region->mmap_alias = __kvm_mmap(region->mmap_size,
> +                                               PROT_READ | PROT_WRITE,
> +                                               vm_mem_backing_src_alias(src_type)->flag,
> +                                               region->fd, mmap_offset);
>
>                 /* Align host alias address */
>                 region->host_alias = align_ptr_up(region->mmap_alias, alignment);
> @@ -1143,7 +1146,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>                                  enum vm_mem_backing_src_type src_type,
>                                  gpa_t gpa, u32 slot, u64 npages, u32 flags)
>  {
> -       vm_mem_add(vm, src_type, gpa, slot, npages, flags, -1, 0);
> +       vm_mem_add(vm, src_type, gpa, slot, npages, flags, -1, 0, 0);
>  }
>
>  /*
> diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> index 1d2f5d4fd45d7..861baff201e78 100644
> --- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> @@ -399,7 +399,7 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type, u32 nr_v
>         for (i = 0; i < nr_memslots; i++)
>                 vm_mem_add(vm, src_type, BASE_DATA_GPA + slot_size * i,
>                            BASE_DATA_SLOT + i, slot_size / vm->page_size,
> -                          KVM_MEM_GUEST_MEMFD, memfd, slot_size * i);
> +                          KVM_MEM_GUEST_MEMFD, memfd, slot_size * i, 0);
>
>         for (i = 0; i < nr_vcpus; i++) {
>                 gpa_t gpa =  BASE_DATA_GPA + i * per_cpu_size;
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
