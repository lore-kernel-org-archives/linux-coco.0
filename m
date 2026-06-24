Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21E1331EDF
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 19:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329226; cv=pass; b=LPy567I0cz2J5/doTw9M8Joi2f8xSwbg0mT9vto187/oqAxanO2Dy509wYzGXkJdXpIQFNifjTnNMsMpyV9LSMge494NR9N2HW3eoGLosA6vMVKOhQUJC/Bntj05f7qvWbw5LhgW1APbAqqu7ekbGMrNWJWDw6fwlxeaFHDsLZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329226; c=relaxed/simple;
	bh=ElsN0o6O4qn1GAusSskW5oVYn1nRJxsJndIkIHl3pxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWCA26pcUt+nx4OycdDPEOKMDLPgoD3HSWCnSasMiNU7TjViletMkArM8NzFHtoyjXhJa2gzGoi88KMaBjF5ncn9gWkXAkmXD4ZXrkIXWCH5iwe6WPIuCrtjMjR3IIcpndEi7/pkQZxSdEHhBT/bvHl1J43V+jC4cOetboVqPg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DN+u8BQy; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DN+u8BQy"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-519ed52bcc6so51741cf.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 12:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782329224; cv=none;
        d=google.com; s=arc-20260327;
        b=ZVPi3ngWQMBiehCk8/vm3CrpNF0LyVTGwChbWvHiZkayPqf43asp3JRjhvobomPrw5
         b2SXNGp05QtWZX4TqWpnmC9nzVOQbwOsv8FbBZMG+EOsB/1IjTJn0o6ESxMyvoAUk8vQ
         xoWksyqOTDJltmOV4UTJaZNl6P7i47JpwhTLfacqmNPanvFfCvhqjC5UijEvqkbyFE48
         haBPusxpnP6XIbU8Z+PeHCFiWWmWODSxUgIWivZnnSTY+9sH8RU2ShJOQdJT1dE5EKmq
         as7RDRPM8Yuv7E+0XM4Hsl6UWfmRvktM1rK0va+9f39+srz6w/ZTtfzicEX1dHqH0BI0
         yACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iIfO0sWE9plcUue5+b+JHfK+yQSCgxqkYKTUdxso5zE=;
        fh=DSi6tJeWDAtbDAiD1SliMx/aNwWRyEFliJMu0yeqRKo=;
        b=qbJQR+jT2HGGxOpQHeFxI9UwNQlxVnMU4dgrfCDZrD0zdPzPpQPC4GIZQzkUuMp0Qx
         UpODCwrePMk3jJJ9IMFI6NcFdPtpTpzYQsyapOBpZe5Q0IDGL+ebcBgZuv201UeKuMBa
         CAAos5EKwKodY8189GW3xo2V7Bg/twnFlxETswR9JqfN0OkDQMcwG7MN7+d++nqWM9SO
         bs5hNr6RubkWwqbmpDo5cuOkOCZFV5tFYs3fuGeraP4z6KeL1krodPc1TZy+r94/UGBz
         Vnh5aKMeUjGXlLZ9KPP8sR8bc+3XCWy/JbIL+DGTGmfOcZdsmzVebA9i+Ia6AQPeDpfY
         TeTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782329224; x=1782934024; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIfO0sWE9plcUue5+b+JHfK+yQSCgxqkYKTUdxso5zE=;
        b=DN+u8BQynDD+D/PEIu1SfSnyt8r4rt24e4FgB5c/SYlupcxBZyB0ZkBPwTq3698hpZ
         qEbMxDlhbPUsM3oETDZTKUdN0ChPFnZ846LfEbrcIy0EbMspThxLyQ++UaSDK4hJ6LMY
         2g7wjNz5Xwz4bplKQMVsCDFCkTMvlWfvY4/8/wxZkLCIE2UsPmj+qJH9yuR5rWA/fORl
         UkBG5NZyuCEi3iAD62Fmn6GajeD57/RCpivnsj5A66iTEkL3veQlhzWuO5zdevlr2MeN
         P2XvAL0xbZPNXDBoABCHcW4Tl5vwLrNJWwMU6Nuf/as/5sVJb0mRNa+FqXisNxIbFeHV
         tuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782329224; x=1782934024;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iIfO0sWE9plcUue5+b+JHfK+yQSCgxqkYKTUdxso5zE=;
        b=lZly9Cl0fRerU4pu0vrXU0NSES35Xx9FwwWfc71cKlOCQuyR7dW4T+11ZW7ef/ROBF
         wfpqto7KPSHJtNSNsjmJcSl+A7hy51M82KpmQiSjreDcl06GtOe+8ZwB28yU3B18mZo0
         dSMrvoHJI0kiCIRgJZsfCJNxQE8mt6gPjt7w5ShVpgIsRTAvDaAGoKebHjAQ1PEK/tyA
         P5ItjRjK+NI1wHRAwSLr0Sq6XhlN7RGY3T0prVGKruD8yFrqrA9kqSkJMuvaL5dy0JHu
         rvJhZteMpyd2aDBPng8vtD6EggfsXIFOnLRWIf2rgVnUMHqNMbu20bay+dDh2NsVEdKr
         XV0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8+Lrwg6Z5FNe0H/csKxHu4nA0krwN6Fmoi5Pt0PW23wBzSVy8Db4KwgFCKVHx/88he5UCqhcE7CE5+@lists.linux.dev
X-Gm-Message-State: AOJu0YxhIzFSSWwtgXj5YqQh3q1IBqrBD5nVjGYYaeNJIp+p4kZfvcbK
	ew2/hEQ4w48ZXD9dFM4XUJ3aaw9Ajy4IGVvtSM3YEu1xcD3ncbEJ7mzHKWu5zcsYVbF9jvnFnw7
	i7T6mAMtXMEyGtIp6iZfIpTpfbjfViI9HUgDH904f
X-Gm-Gg: AfdE7clzgH0NyHxseNMZR2LRJ2fuSMJSNhgGmmIGsOQAX1udJG7Sr6JCuCPJiF9wbOB
	YXt4FStb0WFfOOXIn9qbe1fi3F0WSZ9UJa7yZD8VC+tTabrkDhZCRYlDYqWiuJ4U0ZiqubcVLkP
	4HKMeSM3aRhJB5RdtGGYIxFpMhHjECET124+i9vdV8AdVfMDZQIynYeBCJq1SXMCKuCp5BM2Pfx
	+3ENna65JTR0DpYIAu6f8O4fCQsEXzhdfTs0ntiQjAoaYfRBm8nFlfTbWEdtxlxYST0SZ5gUQ==
X-Received: by 2002:a05:622a:250c:b0:516:d25f:f038 with SMTP id
 d75a77b69052e-51a6e9b48c8mr1807551cf.10.1782329222912; Wed, 24 Jun 2026
 12:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-30-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-30-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 24 Jun 2026 20:26:26 +0100
X-Gm-Features: AVVi8Cek2cuMarnZ-Pi4P7GaLyk3HJGX0nYgRKl7Bk0MKMGsDMyF-sq_kvfaaNA
Message-ID: <CA+EHjTxXghbEtiUUKtGVbywgpPz4wQ4SQH_J1RDT0=KZ9pMSXQ@mail.gmail.com>
Subject: Re: [PATCH v8 30/46] KVM: selftests: Add helpers for calling ioctls
 on guest_memfd
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
> Add helper functions to kvm_util.h to support calling ioctls, specifically
> KVM_SET_MEMORY_ATTRIBUTES2, on a guest_memfd file descriptor.
>
> Introduce gmem_ioctl() and __gmem_ioctl() macros, modeled after the
> existing vm_ioctl() helpers, to provide a standard way to call ioctls
> on a guest_memfd.
>
> Add gmem_set_memory_attributes() and its derivatives (gmem_set_private(),
> gmem_set_shared()) to set memory attributes on a guest_memfd region.
> Also provide "__" variants that return the ioctl error code instead of
> aborting the test. These helpers will be used by upcoming guest_memfd
> tests.
>
> To avoid code duplication, factor out the check for supported memory
> attributes into a new macro, TEST_ASSERT_SUPPORTED_ATTRIBUTES, and use
> it in both the existing vm_set_memory_attributes() and the new
> gmem_set_memory_attributes() helpers.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h | 94 +++++++++++++++++++++++---
>  1 file changed, 86 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 0cacf3698b259..323d06b5699ec 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -392,6 +392,16 @@ static __always_inline void static_assert_is_vcpu(struct kvm_vcpu *vcpu) { }
>         __TEST_ASSERT_VM_VCPU_IOCTL(!ret, #cmd, ret, (vcpu)->vm);       \
>  })
>
> +#define __gmem_ioctl(gmem_fd, cmd, arg)                                \
> +       kvm_do_ioctl(gmem_fd, cmd, arg)
> +
> +#define gmem_ioctl(gmem_fd, cmd, arg)                          \
> +({                                                             \
> +       int ret = __gmem_ioctl(gmem_fd, cmd, arg);              \
> +                                                               \
> +       TEST_ASSERT(!ret, __KVM_IOCTL_ERROR(#cmd, ret));        \
> +})
> +
>  /*
>   * Looks up and returns the value corresponding to the capability
>   * (KVM_CAP_*) given by cap.
> @@ -418,8 +428,16 @@ static inline void vm_enable_cap(struct kvm_vm *vm, u32 cap, u64 arg0)
>         vm_ioctl(vm, KVM_ENABLE_CAP, &enable_cap);
>  }
>
> +/*
> + * KVM_SET_MEMORY_ATTRIBUTES{,2} overwrites _all_ attributes.  These
> + * flows need significant enhancements to support multiple attributes.
> + */
> +#define TEST_ASSERT_SUPPORTED_ATTRIBUTES(attributes)                           \
> +       TEST_ASSERT(!(attributes) || (attributes) == KVM_MEMORY_ATTRIBUTE_PRIVATE,      \
> +                   "Update me to support multiple attributes!")
> +
>  static inline void vm_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
> -                                           u64 size, u64 attributes)
> +                                           size_t size, u64 attributes)
>  {
>         struct kvm_memory_attributes attr = {
>                 .attributes = attributes,
> @@ -428,17 +446,11 @@ static inline void vm_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
>                 .flags = 0,
>         };
>
> -       /*
> -        * KVM_SET_MEMORY_ATTRIBUTES overwrites _all_ attributes.  These flows
> -        * need significant enhancements to support multiple attributes.
> -        */
> -       TEST_ASSERT(!attributes || attributes == KVM_MEMORY_ATTRIBUTE_PRIVATE,
> -                   "Update me to support multiple attributes!");
> +       TEST_ASSERT_SUPPORTED_ATTRIBUTES(attributes);
>
>         vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
>  }
>
> -
>  static inline void vm_mem_set_private(struct kvm_vm *vm, gpa_t gpa,
>                                       u64 size)
>  {
> @@ -451,6 +463,72 @@ static inline void vm_mem_set_shared(struct kvm_vm *vm, gpa_t gpa,
>         vm_set_memory_attributes(vm, gpa, size, 0);
>  }
>
> +static inline int __gmem_set_memory_attributes(int fd, u64 offset,
> +                                              size_t size, u64 attributes,
> +                                              u64 *error_offset)
> +{
> +       struct kvm_memory_attributes2 attr = {
> +               .attributes = attributes,
> +               .offset = offset,
> +               .size = size,
> +               .flags = 0,
> +               .error_offset = 0,
> +       };
> +       int r;
> +
> +       r = __gmem_ioctl(fd, KVM_SET_MEMORY_ATTRIBUTES2, &attr);
> +
> +       /* Copy error_offset regardless of r so caller can check. */
> +       if (error_offset)
> +               *error_offset = attr.error_offset;
> +
> +       return r;
> +}
> +
> +static inline int __gmem_set_private(int fd, u64 offset, size_t size,
> +                                    u64 *error_offset)
> +{
> +       return __gmem_set_memory_attributes(fd, offset, size,
> +                                           KVM_MEMORY_ATTRIBUTE_PRIVATE,
> +                                           error_offset);
> +}
> +
> +static inline int __gmem_set_shared(int fd, u64 offset, size_t size,
> +                                   u64 *error_offset)
> +{
> +       return __gmem_set_memory_attributes(fd, offset, size, 0,
> +                                           error_offset);
> +}
> +
> +static inline void gmem_set_memory_attributes(int fd, u64 offset,
> +                                             size_t size, u64 attributes)
> +{
> +       struct kvm_memory_attributes2 attr = {
> +               .attributes = attributes,
> +               .offset = offset,
> +               .size = size,
> +               .flags = 0,
> +       };
> +
> +       TEST_ASSERT_SUPPORTED_ATTRIBUTES(attributes);
> +
> +       __TEST_REQUIRE(kvm_check_cap(KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES) > 0,
> +                      "No valid attributes for guest_memfd ioctl!");
> +
> +       gmem_ioctl(fd, KVM_SET_MEMORY_ATTRIBUTES2, &attr);
> +}
> +
> +static inline void gmem_set_private(int fd, u64 offset, size_t size)
> +{
> +       gmem_set_memory_attributes(fd, offset, size,
> +                                  KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +}
> +
> +static inline void gmem_set_shared(int fd, u64 offset, size_t size)
> +{
> +       gmem_set_memory_attributes(fd, offset, size, 0);
> +}
> +
>  void vm_guest_mem_fallocate(struct kvm_vm *vm, gpa_t gpa, u64 size,
>                             bool punch_hole);
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
