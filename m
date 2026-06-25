Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337AC377EBC
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377923; cv=pass; b=hiHMvQtL9ZC+XBow97XzAgwgz8GBAOVG33Lg7DQUNiIe0q+uTkSGzwK1FeLfMt/KUVm+BjOjO5gsAmmFX5gEFvVUKWJ7/LCECCtJwg1b+E7Mp8pTT26J6TglQPJFCLnnjxJrA1ng+Nuw0O+hehxZF4cXLYnfxzbShMHZDpqA1bQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377923; c=relaxed/simple;
	bh=nIj/KPVXWgrY4C2B+8ZBQ4iBoKspX6TI4aa5GobFD10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYk0JjvbbZxlQOqKyj/OQtmrZRXrEeH3J49Fg40vOFQXbM5K11giAUR3QhdaGXy96InIkHHKmGrdjhta4ttdYNwty8tyxLTJb4gXx34e3cZCMAC8u84ADdwB0LByPoMyUTd97e2EaCdwpgDXFsJezwgSCfWj/IYp8mOkN7ycvRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vqN+cE2K; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vqN+cE2K"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51765331535so156801cf.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 01:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782377921; cv=none;
        d=google.com; s=arc-20260327;
        b=ghVNmo1IFjvsGnYY3OkxuTtdW72yb03lsyxoOO9eqWjFcM4v8tDoMfKWRvYNYZSOZ0
         NqnScZTZ2TQSqS+odSn2G/0Gm7qyFCLOnMbnhg919pH+a7Fh9iXtncfNnKOET2eBtfIF
         3zrJxEzlXExLotikInNRLLij07JqU82ouSci1QuJv5mini/2LeMKVjMOhO1v1Zh2jmW3
         O8VExoD+RTSr+tngoU5ih2j+DsNpTI8zkmyo7+Gb5DVy2j046JcFVDOevGgEDnmdLj/4
         fR8aRgUKy8uwdTn2dqVpUPA7qLxJkNDWW7mE+kRYrstY6VvSpJvjLcuYfyOYpEuci3bk
         yGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WlALM42viJ6jSZuQC8WWXMFlP84OGAnUizlvgeGuSiM=;
        fh=q/qDoGb74p3w91afAA+Dwr/vpdJBKYovxfN5NOV8shM=;
        b=hKpf5DxSrek4GIUOHB9j8Xv44eQwIkMcFeC7TZzqh5NqCRbL60KGXOSy3mNqYw/6gM
         cawABi7Y0RlrsXD6v6zUj6w6iXjgX6nmDhoeuMYI3Gyo53eC42OXx2FSB5J7oTnEshWu
         8JhsEmo+Uc9uFGVT+E2apOpSkAPnmezPJBfGt9xfX9qNkrwhGAUZCYk49eNobo1gC1JP
         hrEMRGZVUMVM48FK/Sq/jR4i/tAZXsq+7w+h/WLhpp9avldKjfnf1sXRpXNoPrWmCEE6
         2ehAsGhbwaCEXxlgLRFz49299gI4Pi5UpoPK5xZMpwCAwjM39dTgpdJNhD8u8l9ScuHl
         5AXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782377921; x=1782982721; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlALM42viJ6jSZuQC8WWXMFlP84OGAnUizlvgeGuSiM=;
        b=vqN+cE2KG80S7nvG5qvOFl8YsM68J+ek9OR6s5KRjpUlcvQ7vVzgSNpabXXIBrtzFr
         vrIZSOOEJuLEIDPjqxF73YpUjbsTBDAoAoiFhzKWQ3pLbcAy2NX9Z3P1FONwaZxV9COS
         rmYO4u4RJlE0PvllrWiaV+GaD+9VT6/GnFtWvRgiyVjuPORXxYTO2iscFXxf2U81fJHe
         f0K+P6b4P47L4owJKN93RGIMBoHfgJni4B6mAdz7qSSII3URDWmAYKEpG+UXIC+FeP2N
         RYgC0wazLl1WhVowwXooR1loK5pM8i8kIUpNWe4L3+UiBIlIhvo8UD1cJcW3aKyNXlon
         //bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377921; x=1782982721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WlALM42viJ6jSZuQC8WWXMFlP84OGAnUizlvgeGuSiM=;
        b=HzlCrWHkfJfoKFs4oMWQloadYLJNkLgbWuHzBjBlP+HSRpUwHz33N+hc0eXfs/pslF
         vd3afQpkbCksrQyGB9iOjlWv/MgatNHxmx7dewCsw1SB1TDI+4vX8mNyGv/uvp41CqxU
         5iKYfQ2Xo35qwE5hFUHtfRV4mYOe3LfEOkPA+KZ10cwY5hF4t4jaFXCylF00XlxsXnnn
         XPkSW6RMTiuzQkxZWAGNK3DaeDoId4EZ6rBtchMl7fXUQqzXzfzh+AhkucxV6Lhkn/Jd
         QXNUXutd17R8AF/pQzt9ZyiQ7IuXNqZiDwNxQTcAjo1uNfGeb2sQJHSp7gXpiSC+FKv+
         DUEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MlLIoqOfk5eH5DCySBW1o1RsStXJP1/uJBS5hKD6sSKI/WuzT5vgc5FOtO9yI97yBVEHkYzRTtXMp@lists.linux.dev
X-Gm-Message-State: AOJu0Yy42L9smv7Gbnx8l5qgU2oSGOijm/uLsnfkStKEG/GWEh3tdL32
	aIeG/89BJ+IfBjRzq4hebgcFWIwZuORni3wW3EeGYxN+eZSzCuZDJ8rqe7Z3QhIB957fGwsTkmC
	TyeocQkQI3Yrlq2fgeS6pvqMcmMY/yJDEJSs89N5r
X-Gm-Gg: AfdE7clUvnjuFkWlWj+969gox2af9Bt6j/TDJOK/pF2ahBct9gRckqkweYHrYIr8c+B
	6+1k1J3ytHqCmbb8ZjuV+p774gkVilaNEFf2Vzwn/YOapRdp7IBH+ikTMLeFzIXd+JC2NPrFxsX
	zuAmFOENIIX66wwURQtSsvePsZPGKGpunTN14AOfcxfzNbvvwBdLwyRU7k2CaEqGU7MGyOeu0GQ
	Ad3/dtpWlrvMX9ivMzuC3WP6aJOG7pxQ5jymyqc4oAOoKgxd+INqZ53Atl5OFU5eNJfsayCkg==
X-Received: by 2002:a05:622a:4d99:b0:516:4f62:85ec with SMTP id
 d75a77b69052e-51a7097cdf7mr6284681cf.17.1782377920655; Thu, 25 Jun 2026
 01:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-41-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-41-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 09:58:00 +0100
X-Gm-Features: AVVi8CfUfIb60mScgDza3EFRj37-Gqen4zYG94Wyqg-j1BEdnIuc7f71TPLwtRQ
Message-ID: <CA+EHjTyOX8Ewj1pc0-OJr9So5=wOQPUUvJeQEC1a7=0OODEAHA@mail.gmail.com>
Subject: Re: [PATCH v8 41/46] KVM: selftests: Provide function to look up
 guest_memfd details from gpa
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
> Introduce a new helper, kvm_gpa_to_guest_memfd(), to find the
> guest_memfd-related details of a memory region that contains a given guest
> physical address (GPA).
>
> The function returns the file descriptor for the memfd, the offset into
> the file that corresponds to the GPA, and the number of bytes remaining
> in the region from that GPA.
>
> kvm_gpa_to_guest_memfd() was factored out from vm_guest_mem_fallocate();
> refactor vm_guest_mem_fallocate() to use the new helper.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h |  3 +++
>  tools/testing/selftests/kvm/lib/kvm_util.c     | 37 ++++++++++++++++----------
>  2 files changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 79ab64ac8b869..3a6b1fa7f26ef 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -428,6 +428,9 @@ static inline void vm_enable_cap(struct kvm_vm *vm, u32 cap, u64 arg0)
>         vm_ioctl(vm, KVM_ENABLE_CAP, &enable_cap);
>  }
>
> +int kvm_gpa_to_guest_memfd(struct kvm_vm *vm, gpa_t gpa, off_t *fd_offset,
> +                          size_t *nr_bytes);
> +
>  /*
>   * KVM_SET_MEMORY_ATTRIBUTES{,2} overwrites _all_ attributes.  These
>   * flows need significant enhancements to support multiple attributes.
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 524ef97d634bf..0b2256ea65ff9 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1305,27 +1305,20 @@ void vm_guest_mem_fallocate(struct kvm_vm *vm, u64 base, u64 size,
>                             bool punch_hole)
>  {
>         const int mode = FALLOC_FL_KEEP_SIZE | (punch_hole ? FALLOC_FL_PUNCH_HOLE : 0);
> -       struct userspace_mem_region *region;
>         u64 end = base + size;
> -       gpa_t gpa, len;
>         off_t fd_offset;
> -       int ret;
> +       int fd, ret;
> +       size_t len;
> +       gpa_t gpa;
>
>         for (gpa = base; gpa < end; gpa += len) {
> -               u64 offset;
> -
> -               region = userspace_mem_region_find(vm, gpa, gpa);
> -               TEST_ASSERT(region && region->region.flags & KVM_MEM_GUEST_MEMFD,
> -                           "Private memory region not found for GPA 0x%lx", gpa);
> +               fd = kvm_gpa_to_guest_memfd(vm, gpa, &fd_offset, &len);
> +               len = min(end - gpa, len);
>
> -               offset = gpa - region->region.guest_phys_addr;
> -               fd_offset = region->region.guest_memfd_offset + offset;
> -               len = min_t(u64, end - gpa, region->region.memory_size - offset);
> -
> -               ret = fallocate(region->region.guest_memfd, mode, fd_offset, len);
> +               ret = fallocate(fd, mode, fd_offset, len);
>                 TEST_ASSERT(!ret, "fallocate() failed to %s at %lx (len = %lu), fd = %d, mode = %x, offset = %lx",
>                             punch_hole ? "punch hole" : "allocate", gpa, len,
> -                           region->region.guest_memfd, mode, fd_offset);
> +                           fd, mode, fd_offset);
>         }
>  }
>
> @@ -1662,6 +1655,22 @@ void *addr_gpa2alias(struct kvm_vm *vm, gpa_t gpa)
>         return (void *) ((uintptr_t) region->host_alias + offset);
>  }
>
> +int kvm_gpa_to_guest_memfd(struct kvm_vm *vm, gpa_t gpa, off_t *fd_offset,
> +                          size_t *nr_bytes)
> +{
> +       struct userspace_mem_region *region;
> +       gpa_t gpa_offset;
> +
> +       region = userspace_mem_region_find(vm, gpa, gpa);
> +       TEST_ASSERT(region && region->region.flags & KVM_MEM_GUEST_MEMFD,
> +                   "guest_memfd memory region not found for GPA 0x%lx", gpa);
> +
> +       gpa_offset = gpa - region->region.guest_phys_addr;
> +       *fd_offset = region->region.guest_memfd_offset + gpa_offset;
> +       *nr_bytes = region->region.memory_size - gpa_offset;
> +       return region->region.guest_memfd;
> +}
> +
>  /* Create an interrupt controller chip for the specified VM. */
>  void vm_create_irqchip(struct kvm_vm *vm)
>  {
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
