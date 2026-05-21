Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911423A545D
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353045; cv=pass; b=eBepqSzVifGaktdWHs6hhudKhKi8gr86HJefrrWvvofvrARtxXNc8YjuIxsBaVzGU2vVHo70ENob0OVHBVo4R/MUQsI0vEdC+lRTmfk4LAh1XwwUaQ+OVn88mW8y15AqInImrp0CaPkjPtTHQC4yjyfBDDBF4HqWIGbMYmIe3QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353045; c=relaxed/simple;
	bh=CmmmdhhayV/b7ulbjd3OCXcgROAzS38gRgBEkt+q41o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeEFG3SnRRixjwfJzGPhWZoPu+VAAVjk0PVKb2wMIsl5C55ywEZN3EVTftmx+EFVv2v98xkfmGEdyi9xAiX2PxWQHqDQdBdiWZlkHYreQSNd5IbXszzEZ+tlAluPjEKeSPanGVT/gQi/9V8n2cyaQqB1mimcNIIP76VZoDwYxAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cbHSia8f; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cbHSia8f"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50e61648f10so4061cf.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 01:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779353042; cv=none;
        d=google.com; s=arc-20240605;
        b=SK49l6zm9aPuomb9FE1aUAHmus4MC2fhyfHKvGJwDt3YXaE6jQ3M88bN5RojTH9srb
         ArJSw7EzzM4dygWYzhnh3J+IAOjdd/aSdzbOAgbkyxt6GS+3eDIcbCOTl8XVIIGAwe/Z
         gZhBXZ7SrZV3VGvxstHWMav8VHQww2zj3pJcSWGO4WX9GcksCf712ItPAUiWObmuw3qH
         WA9rAVYkizdBlvzw1fmDcZAF0YccySMN2to7pF42xWwsI32r8k8AaGYiTa+uNGq9O6yS
         0OtOtS1nXHUDehV6GHBFaAReVK0+RU/Swl+UDTpEXyqffq8UYcmiYAixDsdGy9pceAeu
         7R+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1kiAAPdqT4PYHNduYcz+D7nl/8os61F/7CmhrRm2X2M=;
        fh=sf04m27v3P2+Z/D6kC6G96z1X+rDgIuGTz+yW/HCIRc=;
        b=LNSavvYCdOazZn3WcphmP+W0ZiC+rLm22Z+K0lTSIcCFyOa0lg5jANWZoQLvbh05xa
         whzoYnzMOFLLP/kXiaqRS/GnrDkNCpffoxmUIx8bRvgcXroHRrkRCuNHqYec8ixezgtO
         Li2Cg7qbUhvMK2ZJOcYRNQEVVKyjLf3yQ1BJ470LW2yhmLa3HVMTA8Ax3p1jOL3XY7VE
         JkEovb0axZeJa+M2Zt5W/MRXGG76ksNAqwOFSmLubKC4y19mmVniLoc/WZS+HOsEi/eE
         k64eR69gib2CLY1G5dR4oOkI3y6s0ygF8rhxjH4RnyytkOBQl2Z5R0Y2m9aNnjfygCyI
         kWCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779353042; x=1779957842; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1kiAAPdqT4PYHNduYcz+D7nl/8os61F/7CmhrRm2X2M=;
        b=cbHSia8fNe69BNmjSkUTymbKhjfKAqIvcn2xEYo3yQZZn4OyuCGH3V2qYZ7fCOy37I
         yZohurMIEzqg1y2BXOC8yjBguvnt0rfwePjxppe96keaBXcLFkzWTNlnzphqAADw1+NQ
         HrKls82Q2fM8m7KtlD8I7YV0UzSKGcfjvPU51vuboWDqGlFjhGM2wCsEI5M3qB/UyP9N
         o/P0JvNGgwCorXpKELRdP4yAspLgqMu0SrtCryxQX6+MjrOdLS++V8m+ccDj/W8LPOJo
         lk61uadeuHwlk6VvzjQ9Tgut0X2X4cxSUDHwr4f5VlpochZpBDAkzfS9y5bJN5vnZgbm
         e/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353042; x=1779957842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kiAAPdqT4PYHNduYcz+D7nl/8os61F/7CmhrRm2X2M=;
        b=GIXBSR843tXQkwkBorHBkgVhzac37fjDHdAVyWj9Vn1/zOCmxzsNAPfCYeTjJBhTCd
         123kjzpNk5O/+acOgBXKPPR6EcXm7oUZY8SdlX/499F2RSTfn4MihbqQoZw8xVEaSLJj
         sGgP7bb5ocFTlgSpySeif7gHn3JeqF6fWKYV8YqUkepzpqxGS93X4bny6ohzlu3/5h4s
         vDHBqRV5Ox9AYGC0uqvcd4XsS/7B+BC9WU4K1AOjizfJbZJTzXOflWThORZcQCcqzcyZ
         Tn4FVgn8tFaPc5W9Zm5Uy6eIagQi67Gws2TXnoQtGPbaVqHCQHRilbAMb/m7ocdLeO50
         mQpw==
X-Forwarded-Encrypted: i=1; AFNElJ8FRa6SiSDM0/KEwszvuduM2d/0UIoq68aJJ4ygATfVzaprYzXcFAOI4aaHO7bx7avxMuniayK0hzg7@lists.linux.dev
X-Gm-Message-State: AOJu0YxnrV7NCzuN/uB6ZZJte82rF9GKUFrTVHc0TqxmeOtPK1TG3+hR
	arjCKVRAHJTm3LRHZ33SOfF/SUKw6l+eKWYPqEyqgt97p2Ze6+qUibDqiBWVwphPnzaLObypvXH
	6pVsjTZrlcOXoNSkw9pin9gV+UlmK4e3NQvvyjzxC
X-Gm-Gg: Acq92OGayqMpw9SPFTCv+ndb1bY+tjfMwQIlk1v504efin/i2upW+/ITiTGpZVw/nqM
	4Rb7HbNxyo0euK45Z12acPJ6hCz+TCj7uDZ+kFYCAqf1Z4FHqsejOV5SSoYoE+F/G63W89XoRWz
	ZRiobf+Y4HMqnYvwbh+dbHFhkjrSQhSDm9/DIXakwPh6nvJ9mdQlYvOeGMetZUM61GsmHRDLtL6
	CI1r9mQRwDyWq/WO8nCPDL+eRpJDSD5ORi2FSdgGvlHkqD079ZxV+4Z8KSMRZ/yZexg0A9BxZRH
	yJQLWO31sVTiJNtm3B8=
X-Received: by 2002:a05:622a:4cc5:b0:516:4f62:85e8 with SMTP id
 d75a77b69052e-516c552713emr7157791cf.19.1779353041810; Thu, 21 May 2026
 01:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-19-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-19-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 09:44:00 +0100
X-Gm-Features: AVHnY4IQ5gCtMUjytcQydV2ClyWPBKSROIDG9-iOU8lHVPfTjxaIUJeWGPDUkE8
Message-ID: <CA+EHjTzu=28Sr3=9A9LmJEGz0tBEDbU9taznVV5kdL7s8Nw=Jg@mail.gmail.com>
Subject: Re: [PATCH v6 19/43] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
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

Hi Ackerley,

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Make vm_memory_attributes a module parameter so that userspace can disable
> the use of memory attributes on the VM level.
>
> To avoid inconsistencies in the way memory attributes are tracked in KVM
> and guest_memfd, the vm_memory_attributes module_param is made
> read-only (0444).
>
> Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable, only for (CoCo) VM types
> that might use vm_memory_attributes.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Config files always confuse me, but Sashiko might be onto something:

https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=19

I think this partially goes back to commit 6, the one I flagged
yesterday. But also adding "default y" to KVM_VM_MEMORY_ATTRIBUTES?
The default value should at least fix this issue, but I'm not sure if
it would cause other problems...

Cheers,
/fuad


> ---
>  arch/x86/kvm/Kconfig | 13 +++++++++----
>  virt/kvm/kvm_main.c  |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index b6d65ee664d0f..8b97d341bd33f 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -82,13 +82,20 @@ config KVM_WERROR
>
>  config KVM_VM_MEMORY_ATTRIBUTES
>         select KVM_MEMORY_ATTRIBUTES
> -       bool
> +       depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
> +       bool "Enable per-VM memory attributes (for CoCo VMs)"
> +       help
> +         Enable support for per-VM memory attributes, which are deprecated in
> +         favor of tracking memory attributes in guest_memfd.  Select this if
> +         you need to run CoCo VMs using a VMM that doesn't support guest_memfd
> +         memory attributes.
> +
> +         If unsure, say N.
>
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
>         depends on KVM_X86 && X86_64
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         help
>           Enable support for KVM software-protected VMs.  Currently, software-
>           protected VMs are purely a development and testing vehicle for
> @@ -139,7 +146,6 @@ config KVM_INTEL_TDX
>         bool "Intel Trust Domain Extensions (TDX) support"
>         default y
>         depends on INTEL_TDX_HOST
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_POPULATE
>         help
>           Provides support for launching Intel Trust Domain Extensions (TDX)
> @@ -163,7 +169,6 @@ config KVM_AMD_SEV
>         depends on KVM_AMD && X86_64
>         depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
>         select ARCH_HAS_CC_PLATFORM
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_PREPARE
>         select HAVE_KVM_ARCH_GMEM_INVALIDATE
>         select HAVE_KVM_ARCH_GMEM_POPULATE
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cec02d68d7039..ba195bb239aaa 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -104,6 +104,7 @@ module_param(allow_unsafe_mappings, bool, 0444);
>  #ifdef CONFIG_KVM_MEMORY_ATTRIBUTES
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  bool vm_memory_attributes = true;
> +module_param(vm_memory_attributes, bool, 0444);
>  #endif
>  DEFINE_STATIC_CALL_RET0(__kvm_get_memory_attributes, kvm_get_memory_attributes_t);
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(STATIC_CALL_KEY(__kvm_get_memory_attributes));
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
