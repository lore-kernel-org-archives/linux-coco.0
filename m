Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6438B367B87
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867434; cv=pass; b=X0LMhUJoJHsDj6dTLffOmhR48/DULgD5gA2V3dygSfifh+l/YzGrCaw/MXrt5rYLZ1B9SP+bHMoQx3cVGi5N2DAlZjeaXRR5uU2npodo8XlWjOJ8D/ff05J0Ld1cIwxuXp/Q3mP2sl8iPyFm4S9j33GmgCUzJaLqpsKsoTbWHB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867434; c=relaxed/simple;
	bh=btKm2haKQomkQw+uhQB5pBRiK+95+O2o3qtewMx7Z8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgDlx9m057WfGW5RIKwkVeMBiAys06pwWni7hRWwEPoz8GGX0IRVLbE0MEf7Cj6vlLj3FQDyshzxgzNWPaasMBe0OgLEJ9h2qVplwI1I05bFv/7pGUzl2T03h8wBExynxAMEXuX4PYUEr9QEglzw0MRuKtdzxmWBp9fKpbAll9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tipEAzL0; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tipEAzL0"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5177d1ff061so150361cf.1
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 04:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781867432; cv=none;
        d=google.com; s=arc-20260327;
        b=HfIU3intJjJrhl66TrSThejorVtbJJRyQMx0f/ABzRpOKkpn0bKWAY2MZHb80ofmLr
         sIio6S+3/DwC4EYfNaSOW9cqeqaA65G47EpeuDdsxlPLZRVFlvg5LQqGqOz7VEdiLpMh
         DdaB2fL+Z3AH9LNCZcjEPYT0QBi1a95c787G4v7qumq0UUkto96uYiv5mPTWvZchsWGN
         JQnCsbl2fcOVwhCfRc1c59uSHI5E0xjtEo3JtHZ0kn104M7XBrFdNskOINDvyrmnuarW
         HYFR41cIoxbcv2QF/50oURVrKeUGd0TrCgkn94zh3rtnVC3qm9EMLRELsB2rlwKhvfFG
         vaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WoD6HBjRT9eDykv3AXG3feHx1dss625bK8G+vITqymE=;
        fh=sNYCUFeEV1g2tyxM4BSATWAwrlE48h7rqqjd/4lVLas=;
        b=bEw7UvgUDni0YAeZIVFyEmKAPW2j4Wl3uHos+yvbeehsE4XtmRSjuPlU75VGHH+RVS
         JMvJ5nPMLb7vdyC4mv7D5JK3U2XJXSHevU7T4RJcWVFE5C2nYi0CF5r/fUjw+p+OnW/8
         IVWxPrsbAtGRkSihAWoLGNpMwiSBdCy+DvWncNa5kyYRSEZx1qQF+kLJH0oGXjVNWFxS
         z6hDIUN/6CpzlOeP7ayVaJNSBmLbECeh9AqdE47INg3fPh6HZMaiEE5Nd8I/M/DSka4T
         OKwt2hwIPKDmsiQ04jRZ7RwTh6q4Vb+giywmy2qa1oDMOn7oGs/+ijIU4pHLKvsLa8Vb
         Fu5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781867432; x=1782472232; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoD6HBjRT9eDykv3AXG3feHx1dss625bK8G+vITqymE=;
        b=tipEAzL0cF7hbo6v8qluOPSpupUtRQro6U2xKHCnPgTTxtEukP2bfzq0XmXkg1lFpg
         cyyskPOfnXXa1vkQZ+jLCLkWoIuZSf17KDW7rmYFDWXWu8L0MP0uQ/A1ONPI6VoX/7Uu
         JQFuhwW9k5o43jhCKSqD25saXruQLYKVS1UHGhZoMjIPcqnmFKIOZBAbAQ0Y9ho9Ju7x
         SAkfCwuBGvbyYUOpmoDNpOoHwQMbcjD/hxbXt42GgqEKTFsSnKtmZK32TZK4jBE8pJJu
         U8Wybx0MuUzV8kvvWCVsGig61OmAfpGSbBOU1cHmZGqDmqqz97nQgieOsTt8TxrNj305
         C0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781867432; x=1782472232;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WoD6HBjRT9eDykv3AXG3feHx1dss625bK8G+vITqymE=;
        b=JMe5cuSedG6rBJfY+Yx8LpO3vtFp4YRJ8Y+rJk1xInp6U+vPYMN/MOrI7NPgkL51wL
         zSzHyUvM5Bz51plelG3pxwgeXW6Ce0ht3Ct1/A+TaN77mXtg1qV0nMsvWgxdQjthP94T
         9vckPjUA7/yMWnfLlHvMcZx0TulC1VP/Y3n7LokdF82X/ID5jobD4Vjb8LvCdTKpNJKq
         mgy3j6nH9R+JAr9GUTN/58vtC7NzmYzBMNrkgoSCQYEpMekciVyqrUaNbR+7aFIOPPQe
         DW+LuD0ioRBUa4syul7QxUEBA9A1N2gG/ebydw6WV235/xZmhJS5nlMnbXQnnPAj/mmB
         Cu2A==
X-Forwarded-Encrypted: i=1; AFNElJ8FtgXUf6wyRK7/AAd193/TeS3Zw0cbd/4m8CJaMJ9wYe1yiq3mwx4qVFzPQWCSd7fkiyL2bZAmDumj@lists.linux.dev
X-Gm-Message-State: AOJu0YxPLY7NYE2rd0b5deB5bGB5E11x3FmclhTiAnm0chzdFUEBeB1v
	mh84eroY7BNMI6yO6h87gh82UXUv9DPl46dbYMYmwYEgZAUqZ/sKNSJHj306iKfQMNt1foh5+Dj
	BpgvNxCQfQzwPiQJHW/s5yeErWS4soWxD+gSmpcRf
X-Gm-Gg: AfdE7ckJ/GLxPgO1+tDnHq15HqxiMzOAKwKM58HK1Gz77tDlECA/OXkCxXOno3daqGq
	EOtoW4eLMMNZBx2lNJRZzOrpCo8uVgN5ZG2bHYRStIgkdFGjF9PwMNPkjMV8egc83sS9f9nR2PM
	QU/PImRnCnZwp2+PYQVFfmqlJnHZ5ILahGt3U3QZ7JjbCww/CKqifE9kSE5+gXYAWQNWlP9t4HK
	jYt3/Av5Hss+y3ErCWrYwg2L2imQoIQok3OPoi9titf37UO90fQrVJkBC6bu8BNDUAo6w2oBw==
X-Received: by 2002:a05:622a:2b08:b0:517:99ea:ab7a with SMTP id
 d75a77b69052e-519e4ab67d5mr7722981cf.26.1781867431624; Fri, 19 Jun 2026
 04:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 12:09:54 +0100
X-Gm-Features: AVVi8CeUT44zBCOt4kdWsDDIMV1MwoUKi9VlfHD19GzvGrkCGzRWMwEiO6g5I68
Message-ID: <CA+EHjTyj-JdW8H0ii2j3dayqnT2s3VV+brSG++p335=FGd2GXg@mail.gmail.com>
Subject: Re: [PATCH v8 23/46] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
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
> From: Ackerley Tng <ackerleytng@google.com>
>
> Update tdx_gmem_post_populate() to handle cases where a source page is
> not explicitly provided. Instead of returning -EOPNOTSUPP when src_page
> is NULL, default to using the page associated with the destination PFN.
>
> This change allows for in-place memory conversion where the data is
> already present in the target PFN, ensuring the TDX module has a valid
> source page reference for the TDH.MEM.PAGE.ADD operation.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Sashiko flagged that when src_page = pfn_to_page(pfn),
tdh_mem_page_add gets identical physical addresses for r8
(destination) and r9 (source), reading with host KeyID and writing
with TD KeyID on the same address. I don't know enough about the TDX
module's operand constraints to confirm whether it allows overlapping
source and destination, but the concern looks legitimate.

nit: why does it have Sean's SoB?

Cheers,
/fuad


>  Documentation/virt/kvm/x86/intel-tdx.rst |  4 ++++
>  arch/x86/kvm/vmx/tdx.c                   | 11 ++++++++---
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/virt/kvm/x86/intel-tdx.rst b/Documentation/virt/kvm/x86/intel-tdx.rst
> index 6a222e9d09541..74357fe87f9ec 100644
> --- a/Documentation/virt/kvm/x86/intel-tdx.rst
> +++ b/Documentation/virt/kvm/x86/intel-tdx.rst
> @@ -158,6 +158,10 @@ KVM_TDX_INIT_MEM_REGION
>  Initialize @nr_pages TDX guest private memory starting from @gpa with userspace
>  provided data from @source_addr. @source_addr must be PAGE_SIZE-aligned.
>
> +If guest_memfd in-place conversion is enabled, pass NULL for @source_addr to
> +initialize the memory region using memory contents already populated in
> +guest_memfd memory.
> +
>  Note, before calling this sub command, memory attribute of the range
>  [gpa, gpa + nr_pages] needs to be private.  Userspace can use
>  KVM_SET_MEMORY_ATTRIBUTES to set the attribute.
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index ffe9d0db58c59..56d10333c61a7 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3198,8 +3198,12 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>         if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
>                 return -EIO;
>
> -       if (!src_page)
> -               return -EOPNOTSUPP;
> +       if (!src_page) {
> +               if (!gmem_in_place_conversion)
> +                       return -EOPNOTSUPP;
> +
> +               src_page = pfn_to_page(pfn);
> +       }
>
>         kvm_tdx->page_add_src = src_page;
>         ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
> @@ -3278,7 +3282,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
>                         break;
>                 }
>
> -               region.source_addr += PAGE_SIZE;
> +               if (region.source_addr)
> +                       region.source_addr += PAGE_SIZE;
>                 region.gpa += PAGE_SIZE;
>                 region.nr_pages--;
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
