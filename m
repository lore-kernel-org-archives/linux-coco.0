Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296B4378D68
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380612; cv=pass; b=ifVxP7liJGZuk3SEuCWaOlZeWww0XQKtYh+O5VZ71It/7Tn0TD+7yBau7ed4oji1i2eCHuPTHhOhZpoz8htgnP4cj6+N2nlnK1dIAdPVZuxAd/TtuFmiZn4UsfRpiX2HC+9Yd+KJAQ/KLjbDI6TEk7odK5AV8o6tH2T15JtOXfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380612; c=relaxed/simple;
	bh=b8wBEbsUQs0VJH8qRWq+x+Mcifx/55FV07RbPrweSd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYJSd5QMJbbiMNI4MefAYosgPQakcWV3rPSNtxf8SRmIE9VZt3RNaSStU847z4Whm6dU3S4HwKQ97JgrhqnyQ7HcJMN68AvfZvwkV3Zp6umQQOU3V4NNwRonujuE3v5t4NGrzwa/VOlcvOfQAHy4Q9CYZ94v2EMjRFjB+jElMBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FCKA1VQT; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FCKA1VQT"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-519ed52bcc6so223601cf.0
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 02:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782380610; cv=none;
        d=google.com; s=arc-20260327;
        b=q5u67QPlZVayoD9A1bSZ00QJX7qTXLK0um+Unrc4vHeKmw2xUDJ3/tptxjWjbm7pS0
         5PiBrhp/eb7ILzi1ZHQLEB/mzCx/AzHSwtrKHfWra+YeRHbatRNt5Bw3S/mVJ6tt7neu
         CW2OwvFN0b/txVSQjqf76IeJtgfrIPQs1ntDlWAKhXqQSSY53LBnUs/Jv5AkMhXFB7GY
         f8DJMZ3gS+EtO+ejf+Ku+GD0oSHwxmpBy+YGwPZJdP+VHB+FuvmCwq//5p/f5bXBDgfl
         PN3dgLV823dJtJ+7/Rgp/zfD0zo3Fj3j9r0zGcLglv4CSBkLfIXq06wG9pptbsaBJ9hk
         /e5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gcCzDur02+kpX92XVlxTT3/2MUJYhXNphEvl6EVFGyM=;
        fh=2iT4HHk4PRjrDRMA8EGJhknMO0229peIt8V0yECx+IA=;
        b=ENmD7syg4x5WsyHoBhMptTLqpgTZGQU/5Z0StUb4ipom75RtQBb6KFNeQ/eDK2xMS+
         s9dfc2To/P216VEQG5lk+oQoqcLbkbmMaXO8S1Y4pF8OERoITDkJwvk8WW921QaP0F0w
         erSjA68zYgPYfNv9SbyYMJ7YI1WjcpW+L+Vx5Cz/39UEFx8PtpmhpY2wqAMlBrP2WeWS
         twcvSRF3TJY9shOf+u0tm3kPPfgB4EM4sWD6EqIQsbV0rxKWAD3vnx8OrmOUr4eP7K9W
         ssEX1qo7MDgROB8x+aLZWPwi1DdhXLwmEyR1aOqBZSLZ7O5kxunVlFvj1bEfbrUsAqKd
         JPfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782380610; x=1782985410; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcCzDur02+kpX92XVlxTT3/2MUJYhXNphEvl6EVFGyM=;
        b=FCKA1VQT5eNQc4anBnFDJ0hLQb7qZMg16XJHWdk3nx2Qe+m5GNq1hADavcAgxsnbrh
         nFBiX+hx8Q/NjB+P2Ddp4wYNcFis0jbnTbI3Ga5P4PsqGcmdn8XCBFYrx5sm/vX0FAwd
         S8coAwQ7PMK+71ZgLO/1nwWNR0o+vf0Sbqr9s2Fl+ppUEdVRMWUbyZ1evQQX6c28uhsB
         joYZaf8yg+bPJUv5Fnr5/vAaYP04qZwTQj9JFVSRCnQUbJBsE8RYHIaW7Q/YFCNcDE55
         Of813Y8U7yeC0T4K8uleEiA3MWvT+zcdvRQoZ8Kyjo1hI0AhHfDYB47vdCrtRWW3AdHn
         JFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380610; x=1782985410;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gcCzDur02+kpX92XVlxTT3/2MUJYhXNphEvl6EVFGyM=;
        b=o24QteA+vDEVg7RZwNMNN9NRBianvcRgKdnFHbQ2IPWlA0BUYhp0uVC+hY8tamORjO
         E/4jFTLRSWPulgUJC5oNqhXy0C8HLx0zfXTsNt096jRNZZBjaUvFRTV+Xtz9PhbKj5lO
         2/sYv9odZdgB6oaTzVIPPUPw9upmrSNiWKM8HgIPeaIax/DS/OhXvwFc2RdICFWxuryQ
         pTI8zFD9ILnGdLsboA++z0HArV2lE9egEii6gxaOZzsqPybjEGWbDeT2ARi47x5c/7SG
         3BUyexuzFQnVuQvJfUDMiG4Szh2ysV1Y+bA/sOABcDnKc/yAyxD87idibBKRCLGWQXJ7
         l/1w==
X-Forwarded-Encrypted: i=1; AFNElJ+spKDW2gGoe4JdvijdGnnHNzLocNhuqXp4e4bezOSnKTAEAj3Ca+YP7XR96c7T+hwRhPGJW0XzRIon@lists.linux.dev
X-Gm-Message-State: AOJu0YzM93hsKs9beN6sICtJBc3c999YR29m32J2NIeFyGOPMiCm4m/Y
	nXLUBGSfT8Wa574QrhWkOWSG6U1MTkn6p5o1w2M5zAYAug4+Rary4eBPBujuUUSPiK6NuG06nN6
	Lq8JXyw8ZivrDdrBpzxd9nYU/Vn+0o0vClHWPBHJj
X-Gm-Gg: AfdE7clOp4zNfB7jRgpJmKB9O5pTYcH4W3Ccjv+THcwwT44lxRg2WLIpApdO+2vSbj5
	0NtG6kxDwxu0B4xsFGokccdC86kpwwnTxHgWCk2hL/jVwBICcqIev8yeVHfgJ8t2BvfGQ3xPmhR
	/JhiySaa+Zxl+G9uOmvm+X3+tFwGHIyu/jvHoIuaY/EuptWnKXigJmHf0k42u1NI2I6L+w9NTMX
	EUpNOkbV6899v+OP+5gd9+NKqenjKPiP0oQEZCsV4hj+sBA/TEXivTZjOJDY+g74dyiw0JMEVpi
	cK+uw4CS
X-Received: by 2002:a05:622a:1f96:b0:516:cc18:4760 with SMTP id
 d75a77b69052e-51a709958aamr6605881cf.21.1782380606888; Thu, 25 Jun 2026
 02:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-45-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-45-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 10:43:00 +0100
X-Gm-Features: AVVi8CeAgnQFawLrHeIHW8UXEeBJMVi8lMuxnjDgguWeUrHnouPWU4zA8KvTsuw
Message-ID: <CA+EHjTyddaEbaa8ohd-2uLbT=dpxPn92s0UULbckHyoCXtZMgA@mail.gmail.com>
Subject: Re: [PATCH v8 45/46] KVM: selftests: Update private_mem_conversions_test
 to mmap() guest_memfd
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
> From: Ackerley Tng <ackerleytng@google.com>
>
> Update the private memory conversions selftest to also test conversions
> that are done "in-place" via per-guest_memfd memory attributes. In-place
> conversions require the host to be able to mmap() the guest_memfd so that
> the host and guest can share the same backing physical memory.
>
> This includes several updates, that are conditioned on the system
> supporting per-guest_memfd attributes (kvm_has_gmem_attributes):
>
> 1. Set up guest_memfd requesting MMAP and INIT_SHARED.
>
> 2. With in-place conversions, the host's mapping points directly to the
>    guest's memory. When the guest converts a region to private, host access
>    to that region is blocked. Update the test to expect a SIGBUS when
>    attempting to access the host virtual address (HVA) of private memory.
>
> 3. Use vm_mem_set_memory_attributes(), which chooses how to set memory
>    attributes based on whether kvm_has_gmem_attributes.
>
> Restrict the test to using VM_MEM_SRC_SHMEM because guest_memfd's required
> mmap() flags and page sizes happens to align with those of
> VM_MEM_SRC_SHMEM. As long as VM_MEM_SRC_SHMEM is used for src_type,
> vm_mem_add() works as intended.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../kvm/x86/private_mem_conversions_test.c         | 44 ++++++++++++++++++----
>  1 file changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> index 289ad10063fca..4308c67952310 100644
> --- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> @@ -306,9 +306,12 @@ static void handle_exit_hypercall(struct kvm_vcpu *vcpu)
>         if (do_fallocate)
>                 vm_guest_mem_fallocate(vm, gpa, size, map_shared);
>
> -       if (set_attributes)
> -               vm_set_memory_attributes(vm, gpa, size,
> -                                        map_shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +       if (set_attributes) {
> +               u64 attrs = map_shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +
> +               vm_mem_set_memory_attributes(vm, gpa, size, attrs);
> +       }
> +
>         run->hypercall.ret = 0;
>  }
>
> @@ -352,8 +355,20 @@ static void *__test_mem_conversions(void *__vcpu)
>                                 size_t nr_bytes = min_t(size_t, vm->page_size, size - i);
>                                 u8 *hva = addr_gpa2hva(vm, gpa + i);
>
> -                               /* In all cases, the host should observe the shared data. */
> -                               memcmp_h(hva, gpa + i, uc.args[3], nr_bytes);
> +                               /*
> +                                * When using per-guest_memfd memory attributes,
> +                                * i.e. in-place conversion, host accesses will
> +                                * point at guest memory and should SIGBUS when
> +                                * guest memory is private.  When using per-VM
> +                                * attributes, i.e. separate backing for shared
> +                                * vs. private, the host should always observe
> +                                * the shared data.
> +                                */
> +                               if (kvm_has_gmem_attributes &&
> +                                   uc.args[0] == SYNC_PRIVATE)
> +                                       TEST_EXPECT_SIGBUS(READ_ONCE(*hva));
> +                               else
> +                                       memcmp_h(hva, gpa + i, uc.args[3], nr_bytes);
>
>                                 /* For shared, write the new pattern to guest memory. */
>                                 if (uc.args[0] == SYNC_SHARED)
> @@ -382,6 +397,7 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type, u32 nr_v
>         const size_t slot_size = memfd_size / nr_memslots;
>         struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
>         pthread_t threads[KVM_MAX_VCPUS];
> +       u64 gmem_flags;
>         struct kvm_vm *vm;
>         int memfd, i;
>
> @@ -397,12 +413,17 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type, u32 nr_v
>
>         vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 << KVM_HC_MAP_GPA_RANGE));
>
> -       memfd = vm_create_guest_memfd(vm, memfd_size, 0);
> +       if (kvm_has_gmem_attributes)
> +               gmem_flags = GUEST_MEMFD_FLAG_MMAP | GUEST_MEMFD_FLAG_INIT_SHARED;
> +       else
> +               gmem_flags = 0;
> +
> +       memfd = vm_create_guest_memfd(vm, memfd_size, gmem_flags);
>
>         for (i = 0; i < nr_memslots; i++)
>                 vm_mem_add(vm, src_type, BASE_DATA_GPA + slot_size * i,
>                            BASE_DATA_SLOT + i, slot_size / vm->page_size,
> -                          KVM_MEM_GUEST_MEMFD, memfd, slot_size * i, 0);
> +                          KVM_MEM_GUEST_MEMFD, memfd, slot_size * i, gmem_flags);
>
>         for (i = 0; i < nr_vcpus; i++) {
>                 gpa_t gpa =  BASE_DATA_GPA + i * per_cpu_size;
> @@ -452,17 +473,24 @@ static void usage(const char *cmd)
>
>  int main(int argc, char *argv[])
>  {
> -       enum vm_mem_backing_src_type src_type = DEFAULT_VM_MEM_SRC;
> +       enum vm_mem_backing_src_type src_type;
>         u32 nr_memslots = 1;
>         u32 nr_vcpus = 1;
>         int opt;
>
>         TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
>
> +       src_type = kvm_has_gmem_attributes ? VM_MEM_SRC_SHMEM :
> +                                            DEFAULT_VM_MEM_SRC;
> +
>         while ((opt = getopt(argc, argv, "hm:s:n:")) != -1) {
>                 switch (opt) {
>                 case 's':
>                         src_type = parse_backing_src_type(optarg);
> +                       TEST_ASSERT(!kvm_has_gmem_attributes ||
> +                                   src_type == VM_MEM_SRC_SHMEM,
> +                                   "Testing in-place conversions, only %s mem_type supported\n",
> +                                   vm_mem_backing_src_alias(VM_MEM_SRC_SHMEM)->name);
>                         break;
>                 case 'n':
>                         nr_vcpus = atoi_positive("nr_vcpus", optarg);
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
