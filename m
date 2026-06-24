Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3512437B018
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329202; cv=pass; b=FcIjMeiq2EdKP5PVfLiNIHdduDn+Z8zuWw6+0uD3vrouNl8LKJwqWWXcvHcwhmrVaWrAzVyV9tlmGRFwXXYzcHz4eX/zPDbYnI7VuWL5zbsUzrj8cjDWbJWXDamvRdzMh5vTX8v/CzNa42khW9VDYgkC8NUnpEp8S5+SsjdZ9f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329202; c=relaxed/simple;
	bh=twcHfAFi0y+ft7B9oCr1+JB4Kl9qeBvn6Oj93bDxxCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mN8QZ7yj8zldXGs3iqG2o1GLYnXqApqBUpYeKBktG4YWmBDO6Wtz9hfEzUhjUBh8+cSOuuTZnkjxxjjO6aQiTq9s+VssaWzSoDnDNqJiaXAKsWI4Rin/Sm189uSPK2hhUJPiBAGa7jRPXr1OoO5eCPkBTVeGCtvB/quBp1tY2rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V5BB/Dju; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V5BB/Dju"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5177d1ff061so58581cf.1
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 12:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782329200; cv=none;
        d=google.com; s=arc-20260327;
        b=KOEDCnitkebMZ5OXFQUIyYB/J7L9oFU31YwPAOGwyiLGu4PPBM3bM481+PRkeOlk1p
         9bDCCPvbqRvn3qM1eLNdmXseE2KdiobifGrSmcJAXee0UGh3DoJbY/X+FNg1dBdt8kBS
         p9xthkqwz3drHYrMySGICdCpxAt1DQ9s0rnuJk3QKubixAYm87fHc1r8O7hl7yiyLthh
         l/WE4gB3h6RnD6JJkk/EIy9KCxrdG7rDrsAFM6QfF7TKDemUjp+OE+JI8qrtXTiZBZI8
         lKtUojwwidGqafCKdbpvbejYGfqEsueKetmAikWEm+oTLJuGv0gEAyrhlToAY5zGexL4
         FFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YjWrR34fw6nkV452WVsUflbv5W3gEPx2vCWL5i8qEHs=;
        fh=G3p0QlwrNEv1ZEisKekUqbfx7AgvdrS0NwHyRTuDiUg=;
        b=AGO46qz/DWDSuWcguxYaFXYYLrdjmuO29Sc2/dzURI6pgGTIdnNhx5Bwqro52AdiSw
         oM03Yf7AGX4zY3uW8SoIt2MlYFCcC9qEr0XlsQLXKsa8DWVMdgir+0V8PBVgfJAFEzs6
         mQECDCMeezHeFa8rOKk/k+4y9R8v8b1qgzNsIteUoIDxF1vO7ShrkeaY5Mivoxqd6313
         FJIed6F64zJxXcsyTJTGspJdblbyHjNDnsLywpFaGeWM1grq4fOSIhlLBEC4JgfmpeqJ
         rbz23lBGIV8QSrnTEEG2GPTW4O3cXiJdx5sNPlsMTA0j6FTz/hqf7lC+IuJu3VOOUj2x
         14pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782329200; x=1782934000; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjWrR34fw6nkV452WVsUflbv5W3gEPx2vCWL5i8qEHs=;
        b=V5BB/DjuTeW//VG7JTp9M3EZvP8/pvu2LWs+EMcXphy09Z413qqcxd+IT1tQBpE+LN
         tGZ54c7NujCy9iQA1X+zWyrTCfXW3/UIfNKTNrthdQcVbxBIlEiEu/lnN603xF2jgwn8
         5zamYCwKAbt+fdTlGFneAAfXnu0RuGvxotaLik0Wiu7OoscfyXbKUqZs+s6SewUbxdqz
         3wPNkdMpqBEFKFMjNFp4iqk1TNI0EtYyPSOuIMj2+s64TLZ8Nk4sVSIuSFlNuXxtz6rh
         8Bs9AvjByINlGCpbaQ1/oDg7TI6I9BzI0fNeGvV1nrN/y3pOn4rEeutYbtGtUP7795Vf
         2Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782329200; x=1782934000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YjWrR34fw6nkV452WVsUflbv5W3gEPx2vCWL5i8qEHs=;
        b=LwlzAHjsXnL/1BrBIhCNpuNZSe64vdrNZnxIKuFdYNdWEUOsWgDrf/gX2/zSGqf0Tz
         ZwSkH+0gay7LZC3icoN3G43buNYSMoKj9ZAfQM78vkLYcEDnh5tgvPkA/fSe5oq0tbKL
         9bdsMaQsIt2N8IHAHvLVfDhaNb3P4dmjdgErUAkKl1NR8ESl/z6LKw6wG0S2JCStGWfx
         Q6YCqVSPF6Qxj/HuSrcMyKyejqyIVp1ar+lh5Mj+sGpIa/8I4EV5rlFNEEJUGeQtmMPM
         KsRmALMz5U0jW8+mmjbHizS7mkqwPT5DZcfXF5yOqUaiKPFqDPA6OIaunW76yh4k1dX3
         lI1g==
X-Forwarded-Encrypted: i=1; AFNElJ+RaV+c7LMzEhSsdEzz/CKB9CbjwfNOaS9JvDh/IgYHio6A+eIoKFQTkrtlocHUWFMKqmOmULhfEBjY@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqt/yEC2noRd8cqPoLznIgvAE0TOf8w0PzK4Cfci3H7GRYn7ml
	Zt1m5ShII1aahMIhgjtsj/paozbY9pflFhjjh5eSCmmYElG6B1OWJiXltRomGOR16+5O9kg+os6
	nnkWxTqmB3HAl6KaCklx/nQPtsBXKyWw5a08qsGCc
X-Gm-Gg: AfdE7cmgGTDtOsKNM7wSwy5Z+dTOJkieF2pNCATrYXAJTiJ1vzpitYh9QODfSARqPR9
	I/eQSTeLlz+ORJxDDgxReEYP+59sSU/xC3wx4Aq1QKIzTHBExJQFTEsg4panW0enqxrjQxJUkxW
	76IdZd72PnX1HBw1gg4ZZZWN2oiy/Wcxw+jKjjDzFAFQcBgvR72JI47NB4nF7xnOfoPpVZlWpKv
	4sBzDU5d6fp/Ely0PTAwArLPOu480vP2f8r5mQKprEgLPVnzrXGLZDvjGjNn8aBdD4Df0BN4rmC
	4/WMH6u4
X-Received: by 2002:a05:622a:a0b:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-51a6ec5b17emr1608501cf.15.1782329199083; Wed, 24 Jun 2026
 12:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-29-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-29-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 24 Jun 2026 20:26:02 +0100
X-Gm-Features: AVVi8CcGG2L_WGfgpW6JtuTQk7CHKKes1x1HHlBx2_zfm1i0mgNuuyxx0bG7ikM
Message-ID: <CA+EHjTw5dJ4HRoN5OxeKaFTgQrstUTVcb6-x3xgWEa-BBk3ZQw@mail.gmail.com>
Subject: Re: [PATCH v8 29/46] KVM: selftests: Add selftests global for guest
 memory attributes capability
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
> Add a global variable, kvm_has_gmem_attributes, to make the result of
> checking for KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES available to all tests.
>
> kvm_has_gmem_attributes is true if guest_memfd tracks memory attributes, as
> opposed to VM-level tracking.
>
> This global variable is synced to the guest for testing convenience, to
> avoid introducing subtle bugs when host/guest state is desynced.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/test_util.h | 2 ++
>  tools/testing/selftests/kvm/lib/kvm_util.c      | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
> index a56271c237ae9..51287fac8138a 100644
> --- a/tools/testing/selftests/kvm/include/test_util.h
> +++ b/tools/testing/selftests/kvm/include/test_util.h
> @@ -115,6 +115,8 @@ struct guest_random_state {
>  extern u32 guest_random_seed;
>  extern struct guest_random_state guest_rng;
>
> +extern bool kvm_has_gmem_attributes;
> +
>  struct guest_random_state new_guest_random_state(u32 seed);
>  u32 guest_random_u32(struct guest_random_state *state);
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index d5bbc80b2bf1c..b73817f7bc803 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -24,6 +24,8 @@ u32 guest_random_seed;
>  struct guest_random_state guest_rng;
>  static u32 last_guest_seed;
>
> +bool kvm_has_gmem_attributes;
> +
>  static size_t vcpu_mmap_sz(void);
>
>  int __open_path_or_exit(const char *path, int flags, const char *enoent_help)
> @@ -521,6 +523,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
>         }
>         guest_rng = new_guest_random_state(guest_random_seed);
>         sync_global_to_guest(vm, guest_rng);
> +       sync_global_to_guest(vm, kvm_has_gmem_attributes);
>
>         kvm_arch_vm_post_create(vm, nr_runnable_vcpus);
>
> @@ -2286,6 +2289,8 @@ void __attribute((constructor)) kvm_selftest_init(void)
>         guest_random_seed = last_guest_seed = random();
>         pr_info("Random seed: 0x%x\n", guest_random_seed);
>
> +       kvm_has_gmem_attributes = kvm_has_cap(KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES);
> +
>         kvm_selftest_arch_init();
>  }
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
