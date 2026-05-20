Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92D83DC4D7
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278941; cv=pass; b=Sub0/hhhA4sy1/TzOLR1QI+gr8gODkLMJnMOwVePl3Wj2+bQpUaDsh26LjcLDA4bew58s46ju38VVBrAD2WrpbmnSoBmcb0lt8YDLAaEH8k4TqzsAQW6nZ1iqmJ+pioCPQUNwHhvStC8Vq3il3mwm8Xrsy0wZTT9tj2VXCGu7U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278941; c=relaxed/simple;
	bh=UL5TH54YsejC0jorgc7QDDO4B8HZpwF6Hf/qda5tNFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiUuF9VrPSbByAB9HOkeLwHbSP/4scy/3A7IpSfENWUygnAh7o4/ivduL0wDiOPwtVPCWCChu4U9fxxbSy8nUcTpqzy7qO/hqbOk9JXxI2HOVWYaM2IjcP3PMtK6vCDnbs8NI0tKCJs1UZFVYPvA4qwKow3ltxUBvXW8MAsvnt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PVfpnF9n; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PVfpnF9n"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50e61648f10so551cf.1
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 05:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779278939; cv=none;
        d=google.com; s=arc-20240605;
        b=VKDiRMujxjdKnuyd7LujQhKzwVFmRq1xEBsOKcN/rw+hrIcIjTxbSmCOgIusZ1Iqgl
         z8//p5jvcuexaG+QvZtoPhmAtCpTunZMdprttYVhfTntiN7f9kjeRMS99/CQlJDF5Mgc
         ZjrNFkhVtHyUJj53V5NwcP1l0HettTYVxjVcMrje5sAUn565Se1k4akCMmSigGqng++/
         ec0MEOIjCyfHLv6xGNUerKEk53TFZEySDHy+OHixG9JIUtUCKZ0Yt9zb5AhQ5ypHMkqR
         4YumZHh18hNDCFu+NosdtQDjW/wLzKjUsoQ7usD2plbLFlaHmx53+aM6pHAWKxD6iuLO
         rMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Px9FMSWQfRWBgPBzexC/j5D1iZQd5J23JXma/NqqOY=;
        fh=LFDCLG8EdEPGg8b0bKkEcY8z/wvnOFjYQm6dtHfAxqU=;
        b=by7yUScxYHB+z0fVoIp5e9gXQ9ZVazPZqx+n0tlLVNvvnh7urehGWaUCW6CtdTqrHp
         n8km22jPtAoR+N3qgbePQWBBWcPlgyDqjFmAwlSHQaefyKUAkxS6Ig7fOtAgDuep/Oy2
         TQFQ6eSDni0EVrrCjN7MXTZFnXVaBS4Up+clDVZQ3IlRyGsuYr/B+cYg+vtSyzwE7yAa
         peCudVL+BkgvAN7J2y3nVkNhKPfo93G8/6PHIX7iR4l6IsLlC7c3PPwcKfNXKaADlan7
         J5P9FzBMRzLMJDef7iULUCbncd/YhtP/ujd4p4Sww9ZUAtERaWpzURtchCR5g7/Nbldc
         GS0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779278939; x=1779883739; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Px9FMSWQfRWBgPBzexC/j5D1iZQd5J23JXma/NqqOY=;
        b=PVfpnF9njiGpM0TlZQAoiU9uNt1mIUl1YJAmIqTo3eIbiLSXyXFVj8XXVaMnzaVGci
         gGbJKUloR6hcMFra1KRmXilkjmtNzk3Rgza0r0rEgKmnNArbltk+OrONNQ2YWboWjOVd
         JtRigHx0YVRav3552xrxmesBtqWNy+Wn6DXr5ziw17jQmb/lYDAg/CmpDidrN9pdURJc
         /vmfouD7IUCm2hdGyZYL60ar4K/ecL8j7ltcIrjSJFxY0B7IgD4eFQ/c90ECVBVmt14m
         uKHT5nY2e4MNluxdBCBAo0AeQ0hEmAFSuqaKNcBLNCYd7O3Y2opZCQmZ8qnLNGXPyhc+
         9hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278939; x=1779883739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Px9FMSWQfRWBgPBzexC/j5D1iZQd5J23JXma/NqqOY=;
        b=k1hccqMZi4zj23Y4gpLHb7dPhfvXJ8HjHzmBXvgYryJrV5z4HmXCHhq55vRwayrpZ9
         LZNK98+mX5jifz4CztwHa3M4+DtSnVTI1z1Kf1249ddxlkLXTzoNYhz6S7h6s6kCoSaF
         s+hY8B/PZPxundMX044jW6enngF6Tv46t345Jx6dt5mjRzFzXrTyZ+B9XZRkjNbHSz4e
         ybs3AIcHqAZZm+1jLoZ79z6Z+suNULz8I72XAmeEKnQK5L1N1ETBRLxv+jfwaIWo8BCn
         M4da6Yd9i8DV6DTXIHedr+1pDvzK11+PhC0KatZcKfAV1fXVWdkeZuW23CGHWTBDWvAq
         Xl7w==
X-Forwarded-Encrypted: i=1; AFNElJ8d9HJCczxKGaV57hISGjxUnlkNcJAi8AlE18r8T50TVSI1llkWBjqYzxu4zFioTdg0Hr3sTHctzTrk@lists.linux.dev
X-Gm-Message-State: AOJu0YwejiN6enuN6dux9WTXP7/GpK89zotRhHNnfYQEBIqC/8pqRrVg
	EoB9BOVjA1Zx4RW+1J2Sc0OPEEMxvWQ4RWqdkTCizWLQaVvJkeu9+3DrVKK8SCnhAz+MpLAJp7B
	ZWlC3FLBNKn3vx534+SKbep+qabGevCPctRnChvH6
X-Gm-Gg: Acq92OE3u4F7jxM7mBXpf2tZ2HSTehD0lOX+GETvWHgNHpM61v75GPm3ATZm8txz99x
	/xqHTq5YNjcejfRw3Os78sR7iiMmw3bTUFymHvEMoCLhsxWr5kxzG4ZnGxVuWpQC60UqEPPTzae
	ybPbk6aqsF7YYT2OTwBM4r6nkwM2yWVBaGlT1CFchxnnd4kh92NzGGKF+hYizkkbiM5Zd49A6PW
	96LN3g2EtzWpAxQsz/vIoIp4RqC56iusun+fxph6VKPFimBo+lnJT340iUJrD0CkOvIMrzkQqCh
	I4Ay6JWtqL+p1P4/+/o=
X-Received: by 2002:ac8:7d11:0:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-5167b58811dmr18170691cf.3.1779278937787; Wed, 20 May 2026
 05:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-3-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-3-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 13:08:19 +0100
X-Gm-Features: AVHnY4LfQbiWdiGwXSEhGQDtGx7oiVEOShaBU1_EGdecpQaasdwwwCwSujlZjbQ
Message-ID: <CA+EHjTzvkF93kznZ6e5SBu-w9Gc_Z4ryDwg7qnjzWSPt4KfNCQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/43] KVM: Enumerate support for PRIVATE memory iff
 kvm_arch_has_private_mem is defined
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
> From: Sean Christopherson <seanjc@google.com>
>
> Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE based
> on kvm_arch_has_private_mem being #defined in anticipation of decoupling
> kvm_supported_mem_attributes() from CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
> guest_memfd support for memory attributes will be unconditional to avoid
> yet more macros (all architectures that support guest_memfd are expected to
> use per-gmem attributes at some point), at which point enumerating support
> KVM_MEMORY_ATTRIBUTE_PRIVATE based solely on memory attributes being
> supported _somewhere_ would result in KVM over-reporting support on arm64.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  include/linux/kvm_host.h | 2 +-
>  virt/kvm/kvm_main.c      | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 7b9faa3545300..7d079f9701346 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>  }
>  #endif
>
> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> +#ifndef kvm_arch_has_private_mem
>  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>  {
>         return false;
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 306153abbafa5..abb9cfa3eb04d 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2421,8 +2421,10 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  static u64 kvm_supported_mem_attributes(struct kvm *kvm)
>  {
> +#ifdef kvm_arch_has_private_mem
>         if (!kvm || kvm_arch_has_private_mem(kvm))
>                 return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +#endif
>
>         return 0;
>  }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
