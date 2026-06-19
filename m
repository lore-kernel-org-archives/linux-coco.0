Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794562DEA6B
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867008; cv=pass; b=ahqyEYVesCkIyabd08omwRcbkkWbcWUnzSwIR1wJkbFlHUGhk6FiAKNbYL3qLmCwkFhxiTQvmlb8RvqJe+iDroCVWc56a4dSm5gb0ngxTdmLKs4zrcV+YqDPbH+MFtBAnTMkb+wgTsLXU3Kcwdjt9g72qbqor04W/CrZX2RgrdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867008; c=relaxed/simple;
	bh=GsiXIcEdAu1JNPx0o0Rkb8mPpCDUCHPoupmGVgfFazA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYHwLf9lrUu7QRF9yO1HVagkRWtveMS38wcqWS0EXb/Jv0mzYz6tGGEYc+pcucKp5xNZBSrkz2Ot7YmBUH3BH25nlZ/ApyZTGMANr2kNg/icxsgrc14S+SA0eSNFxPREKlYC6PLSGWID2z8sndCuhKkh08xGrNcLz3aBgEUrI+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mqo0AkTk; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mqo0AkTk"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51765331535so158171cf.1
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 04:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781867006; cv=none;
        d=google.com; s=arc-20260327;
        b=AvZiwT4DngKgfBTCMS/wWyR0PBsudWE/411yr8pnNjqqpFk63FzbVcnMLCVSW//wUj
         B3SVDfqTFpuV6ryQqAoA1WdGABXlzi2nGcuGxSGYTaf4I3SPvt1ksRLhhxg4UV8iMvMY
         xRSGDCuUe5dTJTM9/v7DxenUCqwo6NFYmwIKFWxJKppmQGgFvXK2mVjsdirfaLGpLn99
         Wr+I81+1RdT9eV2Bwy1G7judJhjanvWeRVP7QpluvVuxOVk/+8ytrtEKL8Fxx15UnZdb
         r9lf6DB3qxueX3bxVlqHLZcTfnoZ4b18bWXEmc9vTfZ/ZiQTvAMr/nDw93L9cDvEvPgU
         1DSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tjw3cW/Oozrva+KBRQ9a1eMgdLYrVdyOI99ohvpEcUU=;
        fh=PGq9VXpJjWWu7uaDBJAS4qvCrvRkdSzq/GdPf5d+PU4=;
        b=o+a52/tfcy+I6uM/P4a01EvQzflQ1M1KpVLkOHotMLb0uUfLJ8RC+1rdkF9XfDqWQM
         uK0TX7yIk4ZkluvI2btIXrQeMfWldp6hMcGq3IQ0aSlGAANHDz2STk0PuRh6ChHq4DHM
         R8JqDGDSTn6HmbndJwp5OkPCad9r2a4RZsgG+3nU4oyS8wO9tW2bwBUVz07PIwTna4xT
         Q3q/lScg9qAms6dZVfSaIWWiZQWCO386emY7lFdWm7Te4yE6r+ocVjwnMjGAEpJPWun9
         sYFJRhS1RbqSbpgZ9t1R9cN070Hd4xbNJrDlXiThzO9S+KwxRXvG7WKGwhy/JrwRBWbv
         V4nw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781867006; x=1782471806; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjw3cW/Oozrva+KBRQ9a1eMgdLYrVdyOI99ohvpEcUU=;
        b=mqo0AkTkubaGwdg2WaaSOVWVzM8zalVXSwUkl3I3NZgnNOOXImJhgaeDNLbil/9d2n
         kUPkccQiStmxB3v965/eXA8f7LB1kE5uQQ/IoCug5zP4UffQe0sUhhgxUIfjge3C+oMU
         Bse4QtHpUip5jzem6jKTmXVhAf0CBZ49FMXkBmvoLKb1nF0kvv028bOJmhqJN3NEFwbp
         kYB8OHBDgNHwRC/wL+ljq8R/nONrrbC7ZZiPjS7Y3Kd0zSOo6pSjaCHRWyX3wPQDCGIG
         jBHSLCzademKuo6u+nJMMdLtXa6iXQv/6FqxuyEolHebMtTuMOVdHJGJLafILJxoXcOq
         d4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781867006; x=1782471806;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tjw3cW/Oozrva+KBRQ9a1eMgdLYrVdyOI99ohvpEcUU=;
        b=F890bVdTzC+lGYrJh3hNRC1Q+Au9bkornUfrxbfbFYUNYizSBJLY7f7iWAlGSJSriT
         1GnIVVTAmvWGxwYzJAj3UpBsIfRdYWQjSAzlH3M3RrMad0XWAaSHlhsQ8tFofDIQML4A
         r0fu1BQyPAm/q6HnRj0mYQ7IEERu4n+cl9rQLnXD0gRrbZtKa9fZU2NVIU8gvogmkwb7
         naYjA2GUDcsNmoAD8vptmZqD6XyB3xcE/OLoFvuovr0XqdoGhEPFiBfWiAesSHQX2dpR
         Fa7NTehIilLPZrM/GI5BLKUEddTzVp261YrbFouhaWMf3uV2q+xTQ6Jifg+hmgUgnMfS
         wnNA==
X-Forwarded-Encrypted: i=1; AFNElJ/CfqGIQ7J8tfdo7LFubQGFtr7tKfYHy9ch6jjYpY9g0gEHBu187IUPBeooiBO2XIUldlScb8gnOJJo@lists.linux.dev
X-Gm-Message-State: AOJu0YwJSfVQJKHPF3dhsxpajI6d3w85FPnKV4ENyEgHhdFkZUGupYMF
	+4TRk8AP3ZlgAjfzL3NE7C76PgjzSZzL0CsURNkbcq/DLJZfI7l1oen7oG67d7JI8YUpaOuvIeY
	zjManxvRtY8IWfhhTlzzGPGAoMOB+AnmQstLYpDDr
X-Gm-Gg: AfdE7ckRLYJH4yQWXO3XmUFlsy1NUMfwgv8nhVAXZo4QZoGzlPuwdLBjWRNVgaH3X8U
	uRwDpeciH/4XCSzAnacC+aFhq3IjPS65GK9wXIv8AYKAd0HRZpRMktUi1xVnfKKpGtiX0ZEdGn4
	BlOuYJhXeo7qb9HFoaEKx0K9fGWxTRyiNOtKU/TgcNlTOasi6witlzFZAN+vmDu6CPDK4jRm0t9
	8JUonsUWKILeEuw4NhX8I+2RuJn1RpteXHGnFL+lcpS3J2wRN/hrZ8ajwDufkjaIHm1BckQAg==
X-Received: by 2002:a05:622a:5a12:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-519e878bcd3mr6572861cf.1.1781867005698; Fri, 19 Jun 2026
 04:03:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-11-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-11-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 12:02:47 +0100
X-Gm-Features: AVVi8CdeH8_e_cqUhrAt8PYHFeMtnUwZS7qxotCUws3_NP2cjS-AO0E0Squx-po
Message-ID: <CA+EHjTxd4_x-J8DurWuhPostfZqsxMUV87tWN5GzLCknH5wfQw@mail.gmail.com>
Subject: Re: [PATCH v8 11/46] KVM: Consolidate private memory and guest_memfd
 ifdeffery in kvm_host.h
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
> From: Sean Christopherson <seanjc@google.com>
>
> Move the kvm_arch_has_private_mem() stub and a few guest_memfd function
> definitions/declarations "down" in kvm_host.h to utilize existing #ifdefs,
> and so that related code is clustered together.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

SoB fix please. With that...

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  include/linux/kvm_host.h | 37 ++++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 21 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index acb552745b428..9c1cf1a6559e3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -722,27 +722,6 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>  }
>  #endif
>
> -#ifndef kvm_arch_has_private_mem
> -static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> -{
> -       return false;
> -}
> -#endif
> -
> -#ifdef CONFIG_KVM_GUEST_MEMFD
> -bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm);
> -
> -static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
> -{
> -       u64 flags = GUEST_MEMFD_FLAG_MMAP;
> -
> -       if (!kvm || kvm_arch_supports_gmem_init_shared(kvm))
> -               flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> -
> -       return flags;
> -}
> -#endif
> -
>  #ifndef kvm_arch_has_readonly_mem
>  static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
>  {
> @@ -2572,6 +2551,11 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  #else
>  #define gmem_in_place_conversion false
>
> +static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> +{
> +       return false;
> +}
> +
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
>         return false;
> @@ -2580,6 +2564,17 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>
>  #ifdef CONFIG_KVM_GUEST_MEMFD
>  bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn);
> +bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm);
> +
> +static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
> +{
> +       u64 flags = GUEST_MEMFD_FLAG_MMAP;
> +
> +       if (!kvm || kvm_arch_supports_gmem_init_shared(kvm))
> +               flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> +
> +       return flags;
> +}
>
>  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
