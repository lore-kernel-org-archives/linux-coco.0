Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23DE36B055
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285263; cv=pass; b=SDzyw2luLpfKp01p/GD10mQdveBO/I1bkO6ChSOC/KytrGnwNr0xTb16xRFgZDGkAr2aX2AH5UslJMEpdxsl0QPxrfleBG3GEMlyKit7RWwBei4eQPUytDc3/Q/qOvWjpSFltZTv017OrC754ctEFGqs/vrMf7P71ix+h/y/7+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285263; c=relaxed/simple;
	bh=S2QQKlnUFtx99q7JAoA0OC+UdWmV5gUiJnNMdrUcP0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVMxB+QL0Pkfy4aD+9v4CEOYv4bCYoWwg9NdE1W7jhRQc0p9e5WflOdt8ZwGewpT/LPteuPxOhY52BHsj3uTK8WiP6a6vQHKpHQKZ59Mj54cY1xuAU2eSjqqu+FKlG8wfDbhWKij0Q3rDmVzq9dls7Wb2BQ2U+kKV9+gBmRo0ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qvAtlDZM; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qvAtlDZM"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50e61648f10so17501cf.1
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 06:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779285261; cv=none;
        d=google.com; s=arc-20240605;
        b=g8QLXIdAVhTWfuYSlztpOEgCcYIjRD61bum3hDFdImPhSkhxY+EZsKnE0sn1TUMvb/
         kmhsUIV/HAgEesL5k1QwY2Tjvd/atUft2MrRctsLDxaJCy5uLcGvr7dB3p6SkEMYTkgf
         CKvdysFefnVxUcOI+TGeKQz16IpZpiiz6wByhn5iAtFALAS94BDv5RxH/Z+PEfRJ+rrs
         VhKePC2chsRsNSw4tqzihyp8CpBKScbfai6tmINEzJMJpyRZ2YaZMWQxCqHWaooTlMf+
         VboygIrnQNdM9exfj0yA+x3Epz5HEK2RrlNDkuQbcCI1e/55unq5jSwf81kToRKtbc9v
         zotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gE3b6wCinhvGTxYfOlCOBpwr8sXmo/MKVQj4OkH8tQg=;
        fh=wk1rASBE4iHVFrPN9fppaXL4zBxCA/vccI6+TbMpeE4=;
        b=h/P/DyR8O8Higpf/yEayn0v3K/YzRoSkpwONDuodeFtEtgKlnz/K6hOs0IWz2iC7lj
         Fw6syMay4D4myfm8JCY7dnUCS5l/hc4sZcHg9RdQPxbPrynrsr0DgjPNXN6Fk9tcCC6A
         +p5Uv2JXLtXgdMNZ+43teTyYdWYUfz1kCy9gCwk7yaNtbggVbBMkPc5ZSsAHVNxniH6v
         chfG4S0NvkOFjpT5GvjU3jzN1rbP35qAepFBmHRGagCdTnL8QoSzfSDSQOPl7FxcWLUd
         QczZHpU2XIHqpIQVhhABcB8Qx6jlxWi9hl4Wj6EQUm1gNFlr6g/AI1DHgnI+HCR8OR0d
         jrGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779285261; x=1779890061; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gE3b6wCinhvGTxYfOlCOBpwr8sXmo/MKVQj4OkH8tQg=;
        b=qvAtlDZMkAZfmZTthI5xqMUcif2g+UaGewcOWJFPubBD5mj9yaYMMRGJ9sKWuQukqD
         BOGR9arFiQCoAxqT9u4sJ/xBlQbToD5SwrMJOpkf1fZi7wa/0+wyyv+1RQp6XOs435F/
         SrFfvuIYXHIxPIn23fvq+op7Yw5VS5ylL1c5fZxulyKdGFbXMg0SbQXFrWNtBuj8CA2+
         FcJ0+Cqd3MxEDapUujRaOlRV0SY3rc2sh+93oaOXvluyWP0mh6gFOaMMBRA73fZvgP6n
         syo/kkdCiASb33P1ZNhNRTcegy/Rp9cQgUustsF/lgOrJ73N2acpH9WKdyCDzKr14LB3
         aP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285261; x=1779890061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE3b6wCinhvGTxYfOlCOBpwr8sXmo/MKVQj4OkH8tQg=;
        b=n6R1D4BaFYpSkXFuvMF5OaytLMPcT8K3ytT8TU5Vk2UKdzH3OmGiQ2Ybw7oRmf0BYn
         iWio5Q7EjWsngXVXlXF1gXMV3yxz+hn7yUt9Wu0R+LV0mguZEQsq9TrzA+/uqlFXvnD3
         rLpe4Fh0p7w0OxjR0IU3IyzjfeGCeMQAe/ytiAc9y7pdCoc8bZJgMn+BQUajJquLBKuX
         +ZQpZmzyV5udcNd1vskgwoMl0UWFW8w+Q8Gm9ylZwj19SSIdV9z4IEND/WehhtAOnp4e
         c9ljkLpLty2rCxkej09kxbNJiQFwrxFOcDR/AsAdfu8fXfGrU6MSoRqXbqpQ6Te8bfKb
         tElw==
X-Forwarded-Encrypted: i=1; AFNElJ/ytUT/I4gMd9A65Ost96jV8a66hcaNCxdWYfBGP/wBkYPU1bymYcXgX+XDfKKyeBxbiQbDOR6g/Zbb@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo4mk3Uma981LIHEOrNt3G5wyX8nuMo1/gePaodbt7m3PhYaf2
	/qzz4KyvDC0oQWANpopzkN1hQHXLyMAiuaJ+z6OnVx253bxnCqsHN8kfFjiduisu44gqynGI4fh
	YID1RyPXXNs5fsXmmTxREbNWEUe1OhVOWHLbLqY8e
X-Gm-Gg: Acq92OEKXooXdlHN7rPEZeoXHWaHvaz4Rtu4kZqTmdn5ZFGrTSaocNglpoCZcofJEU9
	z7+kt15CdmI870OweWgIpT/Sf1HVEifg2igL2a7VxEf4Af9Na3sJ7txVDBp7YUJHDbHDY3cfep2
	X3C/brnPubdUd1oyJKTSuMuYDI6WJ73Nv48IxWIGs3+T8JH6hzc8rgFL8viK10tq0wK4H8ady8D
	KQl6ri94n4DQ4VtOzzDROuOYFClVM/pm259Bprp/1EwnYITP9YpUYCngfIWcdl6lOxbSOfAFzg6
	ZMJxIoQ9KhXgBgB3CUdEN9eVSWbTTQ==
X-Received: by 2002:a05:622a:4248:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-5167b6af157mr20549601cf.15.1779285259966; Wed, 20 May 2026
 06:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-9-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-9-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 14:53:43 +0100
X-Gm-Features: AVHnY4Im-a3duwAXpFrRqgO3e6bv1dT8inf454bQ9t5MibC6MZzfjT5fwn9v5O8
Message-ID: <CA+EHjTzd7HrkXyXdO65VDzUg3mehBoajRCS2XBU4ogK+JCuX_g@mail.gmail.com>
Subject: Re: [PATCH v6 09/43] KVM: Move kvm_supported_mem_attributes() to kvm_host.h
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

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Move kvm_supported_mem_attributes() from kvm_main.c to kvm_host.h and
> make it a static inline function. This allows the helper to be used in
> other parts of the KVM subsystem outside of kvm_main.c. This helper will be
> used later by guest_memfd.
>
> No functional change intended.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  include/linux/kvm_host.h | 10 ++++++++++
>  virt/kvm/kvm_main.c      | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 1deab76dc0a2c..f9ea95e33d050 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2529,6 +2529,16 @@ static inline bool kvm_memslot_is_gmem_only(const struct kvm_memory_slot *slot)
>  }
>
>  #ifdef CONFIG_KVM_MEMORY_ATTRIBUTES
> +static inline u64 kvm_supported_mem_attributes(struct kvm *kvm)
> +{
> +#ifdef kvm_arch_has_private_mem
> +       if (!kvm || kvm_arch_has_private_mem(kvm))
> +               return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +#endif
> +
> +       return 0;
> +}
> +
>  typedef unsigned long (kvm_get_memory_attributes_t)(struct kvm *kvm, gfn_t gfn);
>  DECLARE_STATIC_CALL(__kvm_get_memory_attributes, kvm_get_memory_attributes_t);
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 0a4024948711a..ff20e63143642 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2428,16 +2428,6 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
>
>  #ifdef CONFIG_KVM_MEMORY_ATTRIBUTES
> -static u64 kvm_supported_mem_attributes(struct kvm *kvm)
> -{
> -#ifdef kvm_arch_has_private_mem
> -       if (!kvm || kvm_arch_has_private_mem(kvm))
> -               return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> -#endif
> -
> -       return 0;
> -}
> -
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  static unsigned long kvm_get_vm_memory_attributes(struct kvm *kvm, gfn_t gfn)
>  {
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
