Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088743C10B2
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782381446; cv=pass; b=JWghY2dUVExPFttD0ZLYhE91q0DFoHTBJDDr99eWaOI26N4CokuKjhQYYtOY9AOt+Wyr8K5uJv49bLuq8lOeuKx7562XMsJ31k2t75mbKS3eDbmilKiPkTZnLNq3sDMvu9JA1rFCKdkHEoIE/5J143nyhfkZnaRXkKzhTcQywVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782381446; c=relaxed/simple;
	bh=qvhKJbkEFFfAWC+9rpTE+bYHpR0yaiYW1uDCpafn5Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpDNZc6oqx9mB3fqjqzrCuVd2KfVSKAf87ZAEgCDzNV+nocIMIanMah3J6t7q1WVUX3svC6Vw2IE71sAItuVXVyS/g1z7XF32lCbKa/xP0ExzHMbv5JMt+/Pu2ZhKeGTVAvN2NTPJLDONdxlxsMER6aV9TX2d/ek2pQjc4Pk/fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gBkGtFBu; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gBkGtFBu"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5177d1ff061so182961cf.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 02:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782381444; cv=none;
        d=google.com; s=arc-20260327;
        b=nGQS3HNEnfIiPslGvoMfdAU4NCHI4MhrBWfKkF0qp82xYPxrvAvxbuyYAES8VQjMVr
         QfG+TzT12EygWJOQKVe1L9u7QSA++n+xjG94JsFJqnPEHU9ulGxFITmuRpsMRqbpBJW/
         dkf3zIA4dT2+DyYJ8eTnHgHXcKgGdX2n+mDMJWEbVfUSlqmdsq5a3jpeWGlrHt+qPAJt
         00MGIFkr4ytkCMNagHgpyqSboWMscczKv+ePggGJjsrZmGr0YzfIWmqY9TkMqCS2taKv
         rjbMOp87q8aazxQz7FZEMU2DOI9LabKjLCzgEPr3H1HjQsXwu3KRXz/Sx3pNnpQJRTu9
         p9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u/mrXMGknIREFr9L6V/jI2fkRAbyZYaUWGH07oXz/yk=;
        fh=CGD/0OcuVxUCE8HQY1YrWknmpAcXqQmuibuFzI4GQVk=;
        b=YBoZBqpDC6+cOhhb/rN43XqTlsJj9jc3tfcak9+WacCLl6rcapxIHJP4rd/CPZBhIi
         5+csHlymhNWGEFeqHNJRRp5+Jz7u9sta5kdUySEMT2yLwHphH5ogtCg/UzVAY7PuwYE4
         yPXRmOJtt3f64RoTbUF8xKajqTwH2Ccfy7iEbHQ1xIhkSm42ChG94TeLGsoJ94bz1Ywb
         9HMbKoi+850BDDH/nwltsF1U34zpG/7qhbY9kAHKBJX2IBaDj8Qmfg7B6aDFpZsuCu5M
         7v9XLFCZeh/evKJLKmHRh3l2SRG13UIhv1wJavly3sEk9A1Hcs8S9Zb1RWwwXto7w3Io
         f2kQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782381444; x=1782986244; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/mrXMGknIREFr9L6V/jI2fkRAbyZYaUWGH07oXz/yk=;
        b=gBkGtFButhSGJEjnwXWpykUl/cw5wdZrbR97KFCK/ejBglHtMZfTR7md/hG4eIz/aq
         r+k3xDeuvxxVNDj2NttBPfb666dg0AjXjje1Qg6YGxFNYiGf73FVR7Y6haX5FUi6jDJA
         9iGIpQjPu1rZD8nEoEsj6dm57k6gEtTFvUKVchvsztxP7v1IEu+jvdwRptYC6/V8gyEb
         dqzrWAjsavBTv1FIgjqiwpTf96Dm7d6gqKTW6PGrTsx1zR//siOReqXXQ8iDhvLgZGIa
         3CiyL+OcnKpPBChCXra/zFS7suQDBl/+RIdTA7U91IAQQOYpliYTXUT44m3Gy6YoPHBS
         sGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782381444; x=1782986244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/mrXMGknIREFr9L6V/jI2fkRAbyZYaUWGH07oXz/yk=;
        b=TXct0tE8EPuP7QWYjsC9XctssussAc4i5d9rG+7rdcA4YSUIEqL8LPS9ztsUAXZE8y
         dUb9LiO35YbCGpixbpmg/9gg33fq650kv1H6qd6uoy/ZGdFeYxLs6LSP0BzUJm7BLjyQ
         qIAxKE3HkbHMnWaIje4I78ETD3knHJn6fLOpk8G9pyUuxfghkjxFMCRIXVlKUzelP9wp
         Ff8xnWx627pdiGBe/ql8D/CY9Uwju8yomPZf214QE3eFUIDOM8oYtAQWeCVYb84yBXZ5
         oBbF44YzkdqQm+demLsDPbJJaLQiMh6A2RARBFNPF04xS/HVqytpQfNryRXwRxb8uMTZ
         26JQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1ZVnSkO7rYp+LNt9UaKUMtX02ijBwjWt9uXzUkDcun7Bewf5M3zbzulTlCs+NtINHf9A/r3+BDbRa@lists.linux.dev
X-Gm-Message-State: AOJu0YwI9BcoVmDqVMB8uuXLua1vxgRXeKYZVSFSWKw+0anbCJ0IElHK
	56jw4nT/q9bPvT5diGmupDfD4lW4cW8D8XxVMpWEGrzoGfvB6JJTc9Mv1YquOdaKQ6ctl5MsWzL
	dMDqTOGaun2UPDkar37an7Gl2xyet7bJWDKEI7YF3
X-Gm-Gg: AfdE7cm9L8VjOSDrSKwOALqXCCoKd2u/WNZpDMas5JJNljcZYgHd0HD7qCebMzt1yBk
	aUSdSQVux7C3pwe8kFYlZPn5c24fj0l4q2HI1FvhUacSnd+R4lcgQmsciJtmDKSzDTZ+q+NCWDD
	nkZiooWPowrL/g9msIZB2u+bp6V1ghEK8e3/+8Uzwdkj2zoDmv2/oqHuxsUCCbwAUrSO299VDbF
	xBw2NqHr92FMXSiibXtbbaLG9j5OJJp9sGKY5hulw+DosLnB5c7e+uJR82y3BNkrUvgtxSSNBh/
	T6mQz8kd
X-Received: by 2002:a05:622a:1804:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-51a7097b73dmr6249471cf.15.1782381443129; Thu, 25 Jun 2026
 02:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-46-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-46-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 10:56:00 +0100
X-Gm-Features: AVVi8Cdu5TEy7e9mOJQzpvO2gtGAQsCwELbue-J7rOmw4IFWddPVfZNy_ZtxEUs
Message-ID: <CA+EHjTw3MrKXdOjC10Q6rrxehwYZjFv7J45wK2E2PBWtSBwCRQ@mail.gmail.com>
Subject: Re: [PATCH v8 46/46] KVM: selftests: Update private memory exits test
 to work with per-gmem attributes
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
> Skip setting memory to private in the private memory exits test when using
> per-gmem memory attributes, as memory is initialized to private by default
> for guest_memfd, and using vm_mem_set_private() on a guest_memfd instance
> requires creating guest_memfd with GUEST_MEMFD_FLAG_MMAP (which is totally
> doable, but would need to be conditional and is ultimately unnecessary).
>
> Expect an emulated MMIO instead of a memory fault exit when attributes are
> per-gmem, as deleting the memslot effectively drops the private status,
> i.e. the GPA becomes shared and thus supports emulated MMIO.
>
> Skip the "memslot not private" test entirely, as private vs. shared state
> for x86 software-protected VMs comes from the memory attributes themselves,
> and so when doing in-place conversions there can never be a disconnect
> between the expected and actual states.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../selftests/kvm/x86/private_mem_kvm_exits_test.c | 36 ++++++++++++++++++----
>  1 file changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/x86/private_mem_kvm_exits_test.c b/tools/testing/selftests/kvm/x86/private_mem_kvm_exits_test.c
> index 10db9fe6d9063..70ed16066c63e 100644
> --- a/tools/testing/selftests/kvm/x86/private_mem_kvm_exits_test.c
> +++ b/tools/testing/selftests/kvm/x86/private_mem_kvm_exits_test.c
> @@ -62,8 +62,9 @@ static void test_private_access_memslot_deleted(void)
>
>         virt_map(vm, EXITS_TEST_GVA, EXITS_TEST_GPA, EXITS_TEST_NPAGES);
>
> -       /* Request to access page privately */
> -       vm_mem_set_private(vm, EXITS_TEST_GPA, EXITS_TEST_SIZE);
> +       /* Request to access page privately. */
> +       if (!kvm_has_gmem_attributes)
> +               vm_mem_set_private(vm, EXITS_TEST_GPA, EXITS_TEST_SIZE);
>
>         pthread_create(&vm_thread, NULL,
>                        (void *(*)(void *))run_vcpu_get_exit_reason,
> @@ -74,10 +75,26 @@ static void test_private_access_memslot_deleted(void)
>         pthread_join(vm_thread, &thread_return);
>         exit_reason = (u32)(u64)thread_return;
>
> -       TEST_ASSERT_EQ(exit_reason, KVM_EXIT_MEMORY_FAULT);
> -       TEST_ASSERT_EQ(vcpu->run->memory_fault.flags, KVM_MEMORY_EXIT_FLAG_PRIVATE);
> -       TEST_ASSERT_EQ(vcpu->run->memory_fault.gpa, EXITS_TEST_GPA);
> -       TEST_ASSERT_EQ(vcpu->run->memory_fault.size, EXITS_TEST_SIZE);
> +       /*
> +        * If attributes are tracked per-gmem, deleting the memslot that points
> +        * at the gmem instance effectively makes the memory shared, and so the
> +        * read should trigger emulated MMIO.
> +        *
> +        * If attributes are tracked per-VM, deleting the memslot shouldn't
> +        * affect the private attribute, and so KVM should generate a memory
> +        * fault exit (emulated MMIO on private GPAs is disallowed).
> +        */
> +       if (kvm_has_gmem_attributes) {
> +               TEST_ASSERT_EQ(exit_reason, KVM_EXIT_MMIO);
> +               TEST_ASSERT_EQ(vcpu->run->mmio.phys_addr, EXITS_TEST_GPA);
> +               TEST_ASSERT_EQ(vcpu->run->mmio.len, sizeof(u64));
> +               TEST_ASSERT_EQ(vcpu->run->mmio.is_write, false);
> +       } else {
> +               TEST_ASSERT_EQ(exit_reason, KVM_EXIT_MEMORY_FAULT);
> +               TEST_ASSERT_EQ(vcpu->run->memory_fault.flags, KVM_MEMORY_EXIT_FLAG_PRIVATE);
> +               TEST_ASSERT_EQ(vcpu->run->memory_fault.gpa, EXITS_TEST_GPA);
> +               TEST_ASSERT_EQ(vcpu->run->memory_fault.size, EXITS_TEST_SIZE);
> +       }
>
>         kvm_vm_free(vm);
>  }
> @@ -88,6 +105,13 @@ static void test_private_access_memslot_not_private(void)
>         struct kvm_vcpu *vcpu;
>         u32 exit_reason;
>
> +       /*
> +        * Accessing non-private memory as private with a software-protected VM
> +        * isn't possible when doing in-place conversions.
> +        */
> +       if (kvm_has_gmem_attributes)
> +               return;
> +
>         vm = vm_create_shape_with_one_vcpu(protected_vm_shape, &vcpu,
>                                            guest_repeatedly_read);
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
