Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19F23815FB
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373290; cv=pass; b=ewRNXp2t+3a5qgSD7igYY8z1YzkZxDzn+oaBrTcK4euk6EFu+ESIfEphwzkQ/GQCp6oYrewN+LMpZ/4Tn/lPWJ4fgsPSZif2pSdn3QdSC9o7qU7Zq2QqVONON4kE9vL1lDgt4A4g4Gs3+yJugq5EsDasIiiGU0Ls999GBy3f6OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373290; c=relaxed/simple;
	bh=Qvcbq0DaasBf8gUW2nSthq4nzSVZglaEH511+tU5N4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLTC4GHaYlsC98gs/Ux8ofXRYuOQnB+9+9lNqr381Y+NtKs1RA1yupkOIVhDC0vCYpDeK52OssNQ4TQLWGSRkJZsePq4N0L1N2M7hccp4rd8QjGCEuiIUzLy2YCkyPCrfGjrXhcheQ05EwsIBXfqT97JLUKxncHW5KzUTM9d6I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ObZh2gC0; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ObZh2gC0"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5177d1ff061so143931cf.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 00:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782373288; cv=none;
        d=google.com; s=arc-20260327;
        b=ksAc9Eb7SNmp+i1T+BmHkaWDc43dqGeQlSH398T49XK15zS4ioACZirWFPzBDUkEx/
         6K+2R5xUl5C8fbJ2S3C+yaK+kd5tHm1Z28iY9UUI51VaObbpBRmXIV3NO0Zq3B+hCrE0
         /Ge+6X553zy/LsQUn1H8g944HFhY0Wv2ur/eW/zz5EonNbRuXqLRjfR+CA+eNzkynsK7
         pvqv/eDroYIF0Jh7UM1QFVqPtgr3GgM3MuZMTJbgMBs1W8kDiQJET8o59aOZehWI9rg1
         tX3nF9l5zrKNHip3N7/slU8O1N2IwPeh2CTouTwkLwIiKMMwugr3VfaP6Q2TsvLrX0pb
         95pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IKDmrHuQqoBYlM3iNILSe07cr8MVKcj1ghLIbtUqfRQ=;
        fh=XSvfk8MDkeh8ugY9hYIPjPOqP53jHVbeiYx0mcOWwr4=;
        b=poxlsK6LAxlK4cQWYG1CB5mNSPfDlKm+82jVCLFMgDl6gSgdBo8LQjc3S43pDjGfD7
         +f5YAFqUkEfTAIvhBdjBtJY2RixwSnTURc8x3v09ZyqtQDBC7otZ8h+ZM9jANA/Ji6n8
         Eyhvd/eMG3FMmC8HsITCBoR4OpXhYXvnpQQurSfa8pdlcwOs1WkNNoBeoESzrPTlg8ii
         4ygszJnlOtTdoq6s25TYaiY9TIZ2VR+agpQHJ5nuNPzrdVZf9ux39ePiJcOa2E3QFRmA
         WmnK3mi4/yIe+1wWlsvI1bPJyq+XRlJsLgbjxkxTtHNx4qolS3WD/7O3C2uBHQL3dZ+a
         0hmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782373288; x=1782978088; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IKDmrHuQqoBYlM3iNILSe07cr8MVKcj1ghLIbtUqfRQ=;
        b=ObZh2gC0Y8Y1w/QozA0UW2twLId4YxBiIHjp/dvxUoJ5VAzzfgp5Re1iRjBkDZ/lBf
         HNxcHlCtZ/7iBES+BY7brQyTAMlWIrLF0hiJKbSyui/rSLq+SgsREaS2xdHy0XLCSt4r
         fOiH/duuT7e2f4nVA73Mgo0SE8g0XykY8HSFlQOICiyoq3hQnQFGVX/emUBb1JjYII2H
         FUucxa6NL1QBs4ucB7/sfGGBnb/cjV321L2cgr+in69J4bkjkGg9WkWNgw2fisPRiFr7
         smcmR468CmAiO5yomXiD/o6gfsizXwzj0ejYEArffCK3mF04iyHKH634ES0GFeiS+oiy
         NF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373288; x=1782978088;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IKDmrHuQqoBYlM3iNILSe07cr8MVKcj1ghLIbtUqfRQ=;
        b=Qt//+jBot2HdRVwQepLCuz17N5ogJrri4aRKSW/d+kO6ilF/5WdKWvgCuwJVeic7iU
         Mtz1uGWPkTNgTLrmnbnHYX0diemwLbIB8OOOyEm0lydHVQxwM0OWM0JenEnsDPYi1Ctr
         Sn0r36uk9IzTstb7tdV/PDH03QUNowBRevS+VK/T1z9D35DtQ6Ij6y9skJwjURDZLETJ
         Rmafaln11Ocw16tpexYaXkt38tcfbHBftFDK35VssA00Vn7nMn0TnvkeCfszL/fuYqYP
         keBHRlN4vjTpkjfLS8tr5euapOtYXkOKVbxJZIGAHps0dMLe5nAmA508r2aH/BUICa2f
         L8Fg==
X-Forwarded-Encrypted: i=1; AFNElJ82mLK0yzPvy4eMEOUovSLrq2d5mn0MRlvY/ldV3p+4GT/0Ox1629JBnLpSL6jtqsEJWEphl64oNqa9@lists.linux.dev
X-Gm-Message-State: AOJu0YyNeQzwgF/LVjhxfAjyv+PUfqzAFqnZgo5c3KZvdkBt63SNI7vZ
	SIYJAU8CCHXUnLRy0oPfxnyZ+XLmoSgNZJyeeakPikcqrcjvaFIw1P/ZZSP8zhBYpUYIIy592q0
	TLzzwQurjt/EyKayAln8b4CNZI5VtMhPkg1Te+mrJ
X-Gm-Gg: AfdE7cn/ATeIw4V8y//w3mhZRV1N2wpoKVBbqUWGSHqxCu79VIXKns3Carca1zZoop2
	J9KJRimr0JgcHyMB3j/NE+U7kacZqeo1eXBegylS5Q+lOnfwxqFDqCatsZ3yx/Rf88zChcRhyTq
	Lmslxx5XSYrcjmDD0Ov1A5ZPsZ5AN29KwsyO770Ljuo3ZG6P2GJD/IBcw9R38C7iVak32+GkNGJ
	Y/1g/MBsQ1ABGhxuE2u4eoHAL/XGiOQhtSJMdvYsQHQqC1SHzBfN3GQQeYB/S7g83MFmtkNxw==
X-Received: by 2002:a05:622a:120e:b0:519:56a8:2693 with SMTP id
 d75a77b69052e-51a6ebae001mr6553451cf.24.1782373286970; Thu, 25 Jun 2026
 00:41:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-38-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-38-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 08:40:00 +0100
X-Gm-Features: AVVi8CdNvXe7DIQJSIUqqBW3OCX6JP2NJsxm61_dCUo-WV2w6fSxq-mU03dKtt8
Message-ID: <CA+EHjTzEGxZQXPPsY5nynYf6ts+Jt3TBevgLpPVyHDqf4i7RGw@mail.gmail.com>
Subject: Re: [PATCH v8 38/46] KVM: selftests: Add helpers to pin pages with CONFIG_GUP_TEST
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
> Add helper functions to allow KVM selftests to pin memory using
> CONFIG_GUP_TEST. This is useful for testing scenarios where some page has
> an increased refcount. such as in guest_memfd in-place conversion tests.
>
> The helpers open /sys/kernel/debug/gup_test and invoke the
> PIN_LONGTERM_TEST_START and PIN_LONGTERM_TEST_STOP ioctls. Since this
> functionality depends on the kernel being built with CONFIG_GUP_TEST,
> provide stub implementations that trigger a test failure if the
> configuration is missing.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

nit below, otherwise:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h |  3 +++
>  tools/testing/selftests/kvm/lib/kvm_util.c     | 23 +++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 323d06b5699ec..79ab64ac8b869 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -1195,6 +1195,9 @@ static inline int pin_self_to_any_cpu(void)
>         return pin_task_to_any_cpu(pthread_self());
>  }
>
> +void pin_pages(void *vaddr, uint64_t size);
> +void unpin_pages(void);
> +
>  void kvm_print_vcpu_pinning_help(void);
>  void kvm_parse_vcpu_pinning(const char *pcpus_string, u32 vcpu_to_pcpu[],
>                             int nr_vcpus);
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index b73817f7bc803..524ef97d634bf 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -18,6 +18,8 @@
>  #include <unistd.h>
>  #include <linux/kernel.h>
>
> +#include "../../../../mm/gup_test.h"
> +
>  #define KVM_UTIL_MIN_PFN       2
>
>  u32 guest_random_seed;
> @@ -639,6 +641,27 @@ int __pin_task_to_cpu(pthread_t task, int cpu)
>         return pthread_setaffinity_np(task, sizeof(cpuset), &cpuset);
>  }
>
> +static int gup_test_fd = -1;
> +
> +void pin_pages(void *vaddr, uint64_t size)
> +{
> +       const struct pin_longterm_test args = {
> +               .addr = (uint64_t)vaddr,
> +               .size = size,
> +               .flags = PIN_LONGTERM_TEST_FLAG_USE_WRITE,
> +       };
> +
> +       gup_test_fd = __open_path_or_exit("/sys/kernel/debug/gup_test", O_RDWR,
> +                                         "Is CONFIG_GUP_TEST enabled?");

nit: should you close this/reset it to -1 after the tests?

> +
> +       TEST_ASSERT_EQ(ioctl(gup_test_fd, PIN_LONGTERM_TEST_START, &args), 0);
> +}
> +
> +void unpin_pages(void)
> +{
> +       TEST_ASSERT_EQ(ioctl(gup_test_fd, PIN_LONGTERM_TEST_STOP), 0);
> +}
> +
>  static u32 parse_pcpu(const char *cpu_str, const cpu_set_t *allowed_mask)
>  {
>         u32 pcpu = atoi_non_negative("CPU number", cpu_str);
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
