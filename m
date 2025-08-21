Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA723B61E
	for <linux-coco@lists.linux.dev>; Thu, 21 Aug 2025 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804122; cv=none; b=BJc2grVWOlI521pvgqoECXlIgenzCQ6gJoK9+AD/d325VQe6BhQLR8cZPOWaHyfHqrTbWcTMyuZ+wD0hd822CHyXvxu4zSGB7jJqeSOEss85fY8pNXCvs/2n7zTmIZYh4tg8NgzSJxIGvAkNte3uVWKZAz5R/IyNVV4gNzXzeq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804122; c=relaxed/simple;
	bh=hKjV3Bdfa+3lPnicmtByd+iT0qEQfKA6FCL7/PvnH14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJUFdgPyTE6dXGL5GzJDqTgkSreLcCamd/RtEnkI5P7iyDUfteDI6ZRntqBIBwjwmFEDvS1pOcyoyByAYe5uwbGNr2x9Hkw3lYz6ZGvWXLX5WFf+Gq+Zy9XeUKQv+XzmijKu2gselR4qG2rK8M/ERMhDLKpNDVKBem35W5CkGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4VczW9Jl; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4VczW9Jl"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b0bd88ab8fso72261cf.0
        for <linux-coco@lists.linux.dev>; Thu, 21 Aug 2025 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755804120; x=1756408920; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ilc50mPVGrwfo+k7PZHzZeT1zp8dvAwV807vh9LnQD8=;
        b=4VczW9Jl+1eMweXXrnmXZJqPVERn5tfpIVGxOYXFGb4XkdP7M/wfqSMGvVmM+XUO47
         ImAc6pad2Q3v9qILDG5mLjP+VCkkuwGO+Xh15gGv2mYqDkHrTdW2DGcYDjVoRlYpytb6
         6Z0L7AGGOwO6MiwsgLXDd89VeD+HgfPKs/GWEEODRrNllhbcPpNZltpIU9oY4AYN7GpQ
         fHjRqeNBCtm47jQbL3rnyG1dXiqb/XbtloXuvhvKMlWsfPcdB/I5g47Mxg/nLCoGY3Ig
         ISiuhjqC+wSQ12MXGXI34WZeWrrT1hsYxcIpEduWBtxlE8sZtF52ZTXUd6y/DmfUZvAT
         AChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755804120; x=1756408920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ilc50mPVGrwfo+k7PZHzZeT1zp8dvAwV807vh9LnQD8=;
        b=XY7yXMCSpb8gDdmQbFR21ophIkJI6zHqMg1iYKId9XHi4M8O5MoSBDrUf8ta7pySDS
         poVCZQGfJSmwGqq28ZSZ3wXRjbDX2yfRclmtY5sD1W13I+DsISglX3BGZJrcFIBzWMOT
         2TpnMZ8MqJ6YD7y5Qu5xvtiagNmoAml4PNXdCPuanhW7rt09grgjCaMPnXE2JqRLg6LD
         +brM9RpC8nO1j/iLJWH2ewuc7LGBh+HemkHf6YFaYsAhD4gv48knP1546XyECt+oui+H
         UcfiIkLy9tHzuLdFYaJrpOMuEXT4RdWlpkiqijoItjGRacHtWnU2T/TfmwYfzll19N1Z
         RN1A==
X-Forwarded-Encrypted: i=1; AJvYcCVeKYEpYBqBklQOZ7HsBzM6Tt2Yk6xwnubUXrQfDRTxWZxWtRnXSm+jNQ81IN9ERKqYD4PRzOevxsIE@lists.linux.dev
X-Gm-Message-State: AOJu0YzDrec02jHagX5ddbn8K7XOe9Jl+nQkAq5yOz58ZXeMz3Go7u0s
	xwlabClSvDdGpxwVLc1qAIAANuKfDBtbkZ1FUc+jI4aXJIhnWdzyX8J9k3jW7id2orOntdoWtXG
	JfqSMlE4CzudwU2fIz9I2dun89UpochD4MeMs/hCa
X-Gm-Gg: ASbGncsNpPit5Ou37bIerkXTvYduEpihoSxHPfrO9tikS57OncbCGA4LffvivyZcpZX
	8hgf2WhD8Mlp2KZLxmkjc3qes7vRLTQ47BGYwYCetmunWwmEWbG3ey9Z1SQUV0XQRhGkB3ID56e
	ftH4l+b4kpFDiS4t+8xNseOcZSgFDuRBJEDPH5Ffh2YQpQdK3yN+TQccCNHjcbwvLke00GUxZfg
	0u2PcF9P6eGbeEWFLIk0LK/cBuYrb5JRweqA2oyJYPEJdds6lBhFKwaEw==
X-Google-Smtp-Source: AGHT+IEfSQSRZKTmvco6JeYeQU6/BI51GtHOl5P8UiOFcRQ1UL7CTs/n9GMqAQJ/KofHvStmBAuUDbtTK0h93IsHqY4=
X-Received: by 2002:a05:622a:860c:b0:4ab:3a34:317a with SMTP id
 d75a77b69052e-4b2aaff5aecmr374371cf.17.1755804119341; Thu, 21 Aug 2025
 12:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com> <20250609191340.2051741-9-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250609191340.2051741-9-kirill.shutemov@linux.intel.com>
From: Sagi Shahar <sagis@google.com>
Date: Thu, 21 Aug 2025 14:21:47 -0500
X-Gm-Features: Ac12FXyTJoAPd-OPdCjI8iU_xiRJBgChDEsznpBOvEolzcRHN3gqj2WyAmgSbJ4
Message-ID: <CAAhR5DGGWss4jovHETYmBeK1gze04LR9c8Dcd2oMpCC3SnMDgQ@mail.gmail.com>
Subject: Re: [PATCHv2 08/12] KVM: TDX: Handle PAMT allocation in fault path
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, dave.hansen@linux.intel.com, 
	rick.p.edgecombe@intel.com, isaku.yamahata@intel.com, kai.huang@intel.com, 
	yan.y.zhao@intel.com, chao.gao@intel.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 2:16=E2=80=AFPM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> There are two distinct cases when the kernel needs to allocate PAMT
> memory in the fault path: for SEPT page tables in tdx_sept_link_private_s=
pt()
> and for leaf pages in tdx_sept_set_private_spte().
>
> These code paths run in atomic context. Use a pre-allocated per-VCPU
> pool for memory allocations.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  arch/x86/include/asm/tdx.h  |  4 ++++
>  arch/x86/kvm/vmx/tdx.c      | 40 ++++++++++++++++++++++++++++++++-----
>  arch/x86/virt/vmx/tdx/tdx.c | 21 +++++++++++++------
>  virt/kvm/kvm_main.c         |  1 +
>  4 files changed, 55 insertions(+), 11 deletions(-)
>
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index 47092eb13eb3..39f8dd7e0f06 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -116,6 +116,10 @@ u32 tdx_get_nr_guest_keyids(void);
>  void tdx_guest_keyid_free(unsigned int keyid);
>
>  int tdx_nr_pamt_pages(void);
> +int tdx_pamt_get(struct page *page, enum pg_level level,
> +                struct page *(alloc)(void *data), void *data);
> +void tdx_pamt_put(struct page *page, enum pg_level level);
> +
>  struct page *tdx_alloc_page(void);
>  void tdx_free_page(struct page *page);
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 36c3c9f8a62c..bc9bc393f866 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1537,11 +1537,26 @@ static int tdx_mem_page_record_premap_cnt(struct =
kvm *kvm, gfn_t gfn,
>         return 0;
>  }
>
> +static struct page *tdx_alloc_pamt_page_atomic(void *data)
> +{
> +       struct kvm_vcpu *vcpu =3D data;
> +       void *p;
> +
> +       p =3D kvm_mmu_memory_cache_alloc(&vcpu->arch.pamt_page_cache);
> +       return virt_to_page(p);
> +}
> +
>  int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
>                               enum pg_level level, kvm_pfn_t pfn)
>  {
> +       struct kvm_vcpu *vcpu =3D kvm_get_running_vcpu();
>         struct kvm_tdx *kvm_tdx =3D to_kvm_tdx(kvm);
>         struct page *page =3D pfn_to_page(pfn);
> +       int ret;
> +
> +       ret =3D tdx_pamt_get(page, level, tdx_alloc_pamt_page_atomic, vcp=
u);
> +       if (ret)
> +               return ret;

tdx_pamt_get() can return non-zero value in case of success e.g.
returning 1 in case tdx_pamt_add() lost the race. Shouldn't we check
for (ret < 0) here and below cases?

>
>         /* TODO: handle large pages. */
>         if (KVM_BUG_ON(level !=3D PG_LEVEL_4K, kvm))
> @@ -1562,10 +1577,16 @@ int tdx_sept_set_private_spte(struct kvm *kvm, gf=
n_t gfn,
>          * barrier in tdx_td_finalize().
>          */
>         smp_rmb();
> -       if (likely(kvm_tdx->state =3D=3D TD_STATE_RUNNABLE))
> -               return tdx_mem_page_aug(kvm, gfn, level, page);
>
> -       return tdx_mem_page_record_premap_cnt(kvm, gfn, level, pfn);
> +       if (likely(kvm_tdx->state =3D=3D TD_STATE_RUNNABLE))
> +               ret =3D tdx_mem_page_aug(kvm, gfn, level, page);
> +       else
> +               ret =3D tdx_mem_page_record_premap_cnt(kvm, gfn, level, p=
fn);
> +
> +       if (ret)
> +               tdx_pamt_put(page, level);
> +
> +       return ret;
>  }
>
>  static int tdx_sept_drop_private_spte(struct kvm *kvm, gfn_t gfn,
> @@ -1622,17 +1643,26 @@ int tdx_sept_link_private_spt(struct kvm *kvm, gf=
n_t gfn,
>                               enum pg_level level, void *private_spt)
>  {
>         int tdx_level =3D pg_level_to_tdx_sept_level(level);
> -       gpa_t gpa =3D gfn_to_gpa(gfn);
> +       struct kvm_vcpu *vcpu =3D kvm_get_running_vcpu();
>         struct page *page =3D virt_to_page(private_spt);
> +       gpa_t gpa =3D gfn_to_gpa(gfn);
>         u64 err, entry, level_state;
> +       int ret;
> +
> +       ret =3D tdx_pamt_get(page, PG_LEVEL_4K, tdx_alloc_pamt_page_atomi=
c, vcpu);
> +       if (ret)
> +               return ret;
>
>         err =3D tdh_mem_sept_add(&to_kvm_tdx(kvm)->td, gpa, tdx_level, pa=
ge, &entry,
>                                &level_state);
> -       if (unlikely(tdx_operand_busy(err)))
> +       if (unlikely(tdx_operand_busy(err))) {
> +               tdx_pamt_put(page, PG_LEVEL_4K);
>                 return -EBUSY;
> +       }
>
>         if (KVM_BUG_ON(err, kvm)) {
>                 pr_tdx_error_2(TDH_MEM_SEPT_ADD, err, entry, level_state)=
;
> +               tdx_pamt_put(page, PG_LEVEL_4K);
>                 return -EIO;
>         }
>
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 4f9eaba4af4a..d4b50b6428fa 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -2067,10 +2067,16 @@ static void tdx_free_pamt_pages(struct list_head =
*pamt_pages)
>         }
>  }
>
> -static int tdx_alloc_pamt_pages(struct list_head *pamt_pages)
> +static int tdx_alloc_pamt_pages(struct list_head *pamt_pages,
> +                                struct page *(alloc)(void *data), void *=
data)
>  {
>         for (int i =3D 0; i < tdx_nr_pamt_pages(); i++) {
> -               struct page *page =3D alloc_page(GFP_KERNEL);
> +               struct page *page;
> +
> +               if (alloc)
> +                       page =3D alloc(data);
> +               else
> +                       page =3D alloc_page(GFP_KERNEL);
>                 if (!page)
>                         goto fail;
>                 list_add(&page->lru, pamt_pages);
> @@ -2115,7 +2121,8 @@ static int tdx_pamt_add(atomic_t *pamt_refcount, un=
signed long hpa,
>         return 0;
>  }
>
> -static int tdx_pamt_get(struct page *page, enum pg_level level)
> +int tdx_pamt_get(struct page *page, enum pg_level level,
> +                struct page *(alloc)(void *data), void *data)
>  {
>         unsigned long hpa =3D page_to_phys(page);
>         atomic_t *pamt_refcount;
> @@ -2134,7 +2141,7 @@ static int tdx_pamt_get(struct page *page, enum pg_=
level level)
>         if (atomic_inc_not_zero(pamt_refcount))
>                 return 0;
>
> -       if (tdx_alloc_pamt_pages(&pamt_pages))
> +       if (tdx_alloc_pamt_pages(&pamt_pages, alloc, data))
>                 return -ENOMEM;
>
>         ret =3D tdx_pamt_add(pamt_refcount, hpa, &pamt_pages);
> @@ -2143,8 +2150,9 @@ static int tdx_pamt_get(struct page *page, enum pg_=
level level)
>
>         return ret >=3D 0 ? 0 : ret;
>  }
> +EXPORT_SYMBOL_GPL(tdx_pamt_get);
>
> -static void tdx_pamt_put(struct page *page, enum pg_level level)
> +void tdx_pamt_put(struct page *page, enum pg_level level)
>  {
>         unsigned long hpa =3D page_to_phys(page);
>         atomic_t *pamt_refcount;
> @@ -2179,6 +2187,7 @@ static void tdx_pamt_put(struct page *page, enum pg=
_level level)
>
>         tdx_free_pamt_pages(&pamt_pages);
>  }
> +EXPORT_SYMBOL_GPL(tdx_pamt_put);
>
>  struct page *tdx_alloc_page(void)
>  {
> @@ -2188,7 +2197,7 @@ struct page *tdx_alloc_page(void)
>         if (!page)
>                 return NULL;
>
> -       if (tdx_pamt_get(page, PG_LEVEL_4K)) {
> +       if (tdx_pamt_get(page, PG_LEVEL_4K, NULL, NULL)) {
>                 __free_page(page);
>                 return NULL;
>         }
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index eec82775c5bf..6add012532a0 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -436,6 +436,7 @@ void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memor=
y_cache *mc)
>         BUG_ON(!p);
>         return p;
>  }
> +EXPORT_SYMBOL_GPL(kvm_mmu_memory_cache_alloc);
>  #endif
>
>  static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsign=
ed id)
> --
> 2.47.2
>
>
