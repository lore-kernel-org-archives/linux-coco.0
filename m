Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799623CC7EB
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 12:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365550; cv=pass; b=iWtxOn2GVDo9khFCsE8R/o+cRxnV6rewAKXiW8asE6lOg/7rputOnb72BrbVDzTEZ5BDrf5sgpcNKmG9RrkpjZv8cSLgVk9y57aZretIF+qPciWJbBvyFo/3zt9qYBTQomlVpxplHf4pWiM3CaM8a3wzOl3mkqMVfeDm498RODw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365550; c=relaxed/simple;
	bh=mUWTvSyqIoqkETcgZuIds2FYkJwuokmb9q2VYy+exYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzu6NFgBMTMAI6/+POrPOUByNUzEh8+TkeYp4N5/e9RsTHQ7giqLfV+tNJLG9bgIHzR4RD2xvHeRy4UacN8ZdftXI97DdtK31f2HYVEBoh4PDAiCMENCFLVlcmcruPyaVjWD/nTKpTbqRRAEiXfIlwHgeDIZ1uBOtKCRYONW8Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UaK1z2H8; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UaK1z2H8"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-515548f390fso4831cf.0
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 05:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779365547; cv=none;
        d=google.com; s=arc-20240605;
        b=BfN/aBZDs3uFLHe/K2gj6nP9Pq4E53EFgEjjORgLqGDvU1CW1eKd5cgATkYshok/Yw
         Kk+SusVExVizTrWJhsrCRobJ6b+KZtjZjwxD2x+TAbCxoTWxzQXnvni4BunKogDhy59O
         eRFU9RDYwnRHnILhfmRluwpiAc+aUR87oW6u3qdn8KAzXB0pDSda489Hy3dyoPL39i2J
         42Jf5fznZJOYzdTdhaHoVJeLccViTnJb1u72Gsy7ZUMwGoohOZgk0N3zZSJQsW+A5Kfg
         TnXXfsm9ta3mtH3G1vhK+6qWPdDcev+BKVW+tHvgtr+CrPmpo9AfkeyEmBdI9F5Ge9un
         tkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F1wmmG0cNegB4E+dlRzmEOWoIo3QXb0mRCuTWAZdGJs=;
        fh=D3Tjt9XR1I61wHVulgDDraHg6lFnA+7aRRvs5iLpKTU=;
        b=Zjv5YmDvAJ/926/rYgWE/E1hGVEATBK8KTeBG0Rk53XQ6dOhJhDpxuTyR9nXXOnjPk
         TD+QkUYpW6eqS5w/F3lOW/7CrxZ+K1HCKNCMgRtU6VWTbNUDcHJsfhcTXUp++Sk+NvGo
         E3RUJiBJUU/iW8qnF+SMNwW7kQjpKClF18at5Us8vQ87U7eNfrYrOtWtIQd0MECNHwYO
         l+HGqEDc72CDlrIg83Vtd3pOr4SvXktMV91y1zKSeRC0+OhWiNufsh+jqgxgiFfto5as
         AJou9Mhvw0IKlgj6jmNqqWTFlJCgljxhzQjWDoVYefdlczYSOPjAAkDLZ2p09oj4zaZR
         YgHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779365547; x=1779970347; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1wmmG0cNegB4E+dlRzmEOWoIo3QXb0mRCuTWAZdGJs=;
        b=UaK1z2H8BVviQ7nVl/sUOyFOwS3gRK72v2L60b715w5bm7dqFn4aDlgJxxPMvp9OXn
         h7wPJdJqjg6n0VygjDzf79mXq8XHkezuiktnHmrmMoOI77ncSOqnp3pJjZ3NJ9b7fVfA
         v27TY5SpvrzdhSHLUEUYmtQ9hvphpyvpLOWOMI60iofyAAZkMTSIaOlSshN563a3ptLw
         iD5ul3TuiZskARf6ortZS3XmAPNPaKXczbZlteVSbQQ5N0LsAcBMqPcbW0plsjmjrSMB
         6lLuPub8fObtymIZJsuy6zg+kv3lYs0uzH23jWAJXhyAJx3TaSxB8TDyOTOUwkLHfCZE
         55nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365547; x=1779970347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1wmmG0cNegB4E+dlRzmEOWoIo3QXb0mRCuTWAZdGJs=;
        b=nbYuFZiwpmYcda+cnl9R2ouiZEXjUuEzaZHWNvQTxDm74UmKF75qi3T3qdZen6Bf4u
         L14qyb05tkOqhywvwVVRHo8g5UIC7AtkaljF21wjoKcH0rNimLTKP6iR2H3MMCxfNqMj
         YFynvHZ5MnVmepY1BNS8tZ12tiZuVXJS2ouGLNzduYsfOIA3c+nkwvS+gEDvsHnvQCK6
         B4N6YiVYsL7FRocSIbfGBGSalDwab7nD7gQWXhSZUJuK2OJQC6WziN6XLB90Vud4bp3c
         jGF/oD7chzDXA90fO+2UvDHRxwAH2VuihzHKW1l3AoS4Swws9XmrVvOe8QNve5wzJxES
         Kd+g==
X-Forwarded-Encrypted: i=1; AFNElJ92UEvGb/cXnejp3YqF8J0TjwzISPTtizHdIPon13eHGfBHIJiLvJRjguaxVmonxPh3t2jDpFnEDLV2@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6XLtdbW3WEcLxCuiP8i125XMMXpHHp4xgciINgNgbVvsSOVi6
	UIkCr8EGFEZFymQcvXaKiqDiSk8SS0COlufXe/o8Ink9ZHyNeD9U5ppy1F2Os/HEmgGtU+lZRrO
	0W1rLWbqUlncMg24+tSxrkXILSmGOqw37IgGEo7eU
X-Gm-Gg: Acq92OGufEyP+19xIF8dCGmGYWm95jPv9nvtgVuwNd3DXzD2Jomnf6HviSYXbZqp7h0
	NDE+LQBm7EVY6ZQbcMciuuPFCoX0SSZXrwgrkdELDbFdicp2fNJnyHaevWBj3CUD/dhFsoL2E+6
	YgLC/JToShjTljoNgkoAsJm9PN8P8YgpoR88aFqP5OLoHov9YEJmlRw41yfBI/K5cbIOf8750Hk
	rxPC9vHDmhyaYVoRZvkXb760Xgb3OiQ3MjQXzyHHd4nyhZeh0kRbd5YmtzTmoE4bh8VjJT7pozv
	/ziTIKHNx+J/f2qkUBbYYYs/2aDiug==
X-Received: by 2002:a05:622a:995:b0:514:c25e:c164 with SMTP id
 d75a77b69052e-516c545d403mr10074811cf.10.1779365546829; Thu, 21 May 2026
 05:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-23-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-23-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 13:11:49 +0100
X-Gm-Features: AVHnY4I9MwIePcJowBi5yVnmSFDQMJen-Uv4dVyPJ1sLPspDsU0lqTAnhNGKza0
Message-ID: <CA+EHjTyftaGzz5-NgZGHZvgvuKDCBVSuhSsWSQ=niP_giotk7w@mail.gmail.com>
Subject: Re: [PATCH v6 23/43] KVM: selftests: Create gmem fd before "regular"
 fd when adding memslot
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
> When adding a memslot associated a guest_memfd instance, create/dup the
> guest_memfd before creating the "normal" backing file.  This will allow
> dup'ing the gmem fd as the normal fd when guest_memfd supports mmap(),
> i.e. to make guest_memfd the _only_ backing source for the memslot.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 45 +++++++++++++++---------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 2a76eca7029d3..df73b23a4c66a 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1054,6 +1054,29 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>         if (alignment > 1)
>                 region->mmap_size += alignment;
>
> +       if (flags & KVM_MEM_GUEST_MEMFD) {
> +               if (guest_memfd < 0) {
> +                       u32 guest_memfd_flags = 0;
> +
> +                       TEST_ASSERT(!guest_memfd_offset,
> +                                   "Offset must be zero when creating new guest_memfd");
> +                       guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
> +               } else {
> +                       /*
> +                        * Install a unique fd for each memslot so that the fd
> +                        * can be closed when the region is deleted without
> +                        * needing to track if the fd is owned by the framework
> +                        * or by the caller.
> +                        */
> +                       guest_memfd = kvm_dup(guest_memfd);
> +               }
> +
> +               region->region.guest_memfd = guest_memfd;
> +               region->region.guest_memfd_offset = guest_memfd_offset;
> +       } else {
> +               region->region.guest_memfd = -1;
> +       }
> +
>         region->fd = -1;
>         if (backing_src_is_shared(src_type))
>                 region->fd = kvm_memfd_alloc(region->mmap_size,
> @@ -1083,28 +1106,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>
>         region->backing_src_type = src_type;
>
> -       if (flags & KVM_MEM_GUEST_MEMFD) {
> -               if (guest_memfd < 0) {
> -                       u32 guest_memfd_flags = 0;
> -                       TEST_ASSERT(!guest_memfd_offset,
> -                                   "Offset must be zero when creating new guest_memfd");
> -                       guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
> -               } else {
> -                       /*
> -                        * Install a unique fd for each memslot so that the fd
> -                        * can be closed when the region is deleted without
> -                        * needing to track if the fd is owned by the framework
> -                        * or by the caller.
> -                        */
> -                       guest_memfd = kvm_dup(guest_memfd);
> -               }
> -
> -               region->region.guest_memfd = guest_memfd;
> -               region->region.guest_memfd_offset = guest_memfd_offset;
> -       } else {
> -               region->region.guest_memfd = -1;
> -       }
> -
>         region->unused_phy_pages = sparsebit_alloc();
>         if (vm_arch_has_protected_memory(vm))
>                 region->protected_phy_pages = sparsebit_alloc();
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
