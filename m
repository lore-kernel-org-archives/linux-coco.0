Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4715138DD2
	for <linux-coco@lists.linux.dev>; Mon, 12 Feb 2024 10:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733903; cv=none; b=JHVR4yQ0HEc54fRbaKCg26u+qK7yoOVX4ydUwYDVd8cMaaxYDxGa128N3e7EtTQMtFxqDQ1VRNVRIcCnxWYCzGf5qbKPGNg5Ji5gD/M3CeLAMM0wLmQ7jsGdHcpkgOZT4OthtOLOndSdfd2fYA3s+IyoV/sixfftqg8Ea/b0FC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733903; c=relaxed/simple;
	bh=czUfwp9Vd0O43dhgHlhoxm7n6b/o2RFsBWH5mKBRF/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VHgxQcLFpLB7rycIGyeYjdbVxjUR1DUp2/AMlpe7U3Ec0l2lm7dIy68wR9nkI96kapfZxy2IgwGc0FoUt22i9BWEqKbuVFTSGQnLVp4ZbvsjRA/mJNp0cAIqc4/7hVmnleNXDkwkfDZQ58d0ikZ6L5dQQBWdWFFuDsbo4piv4Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T1e6zcaX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T1e6zcaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707733901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1t318SRTxLpDaLWn2G/SymzKj/FNZHT6EAXxG8/aWeU=;
	b=T1e6zcaXAgJNSliltBE0yKqcVvrVpOxCET1og34UAjjYlj6AKG+LG/7XbFuRK3mQIJoT8K
	oogOyw6dn1idq+JZTX8q2ShiKLXjlRyObW1DlMevnjZQ7xzmffRhMB33PH2l5tQ5ztkcSG
	TdQ411BRSIoNpQvJSdi8kfc40Pi+Rlk=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-P5O4ZEeOOmirTCjVTQj_5A-1; Mon, 12 Feb 2024 05:31:38 -0500
X-MC-Unique: P5O4ZEeOOmirTCjVTQj_5A-1
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-7d5bddc5a8bso1402929241.1
        for <linux-coco@lists.linux.dev>; Mon, 12 Feb 2024 02:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707733898; x=1708338698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1t318SRTxLpDaLWn2G/SymzKj/FNZHT6EAXxG8/aWeU=;
        b=JqkZ5qPgyWfvkXgGezfyOTRuE3bPbjwgUoybEQTIIwYtbSpPY1PxGmTc5DYsqA3Y/5
         QLnZmZbaPyiqJGP5bP8O5cKfQGA1Nsbs61H72wAu9uR9HWOD1M0Oow7Cfrq5A8ObHoEg
         YTEVUHgHwzzB5M5W9U8tZLyyQg9KDnrAvErMtYRMgdG6IAORcYbonx8kDPrZLgKAN96D
         0sI8QavXI6dua5GpfXDISflYSdgNUJuaHiJr/QpYIeIcJiQzF+IM8NPII/bwIyzaVarl
         VgK+mckP7K2slyOVrfPePTjNZuf5xiqXfMLsRnmPaVshuGOxKT7Ho/YzvzbiVusI0Tdx
         HfSg==
X-Forwarded-Encrypted: i=1; AJvYcCWQXNolVl1jzxt8beM+XcxVqGjNnfHD/JERY4eEQsljP03/vB1YrI+KX98u23DMXFU69zhwEjP0YNllPVcDNfJ0ghu+ZtWMC0POEg==
X-Gm-Message-State: AOJu0YwC2QVxZIb6dhQDbsqZ6YYShxQueADnYRpeOnro5lLynPRi3sMM
	cAz6JuepCOMwqRCoPI5Rdt5e8sH7Nk7DUGG/2IrmGh61qqwn1AUCvVfFA9jdIlRtM3Hsbm2bvtA
	8tekg177bX9qgmpjB6rfElBH+TD+Jn3xek73DGtTQrjREbGK+yHE9jlqr4nUmCbuMnaQk09rOE1
	6+ZqHNvao4C9JgOOuJrgvvF6NK74CQKVg93g==
X-Received: by 2002:a05:6102:3161:b0:46d:240d:438c with SMTP id l1-20020a056102316100b0046d240d438cmr4076017vsm.27.1707733898455;
        Mon, 12 Feb 2024 02:31:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAYvRS4noCaEKl+zyb53gqyWRKi4M0jr6v0+jz+XbYaddB3PAXdhrXxq0wDIZfyRz3n9CnF4Xr88Nf35iyEnE=
X-Received: by 2002:a05:6102:3161:b0:46d:240d:438c with SMTP id
 l1-20020a056102316100b0046d240d438cmr4076001vsm.27.1707733898047; Mon, 12 Feb
 2024 02:31:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231230172351.574091-1-michael.roth@amd.com> <20231230172351.574091-10-michael.roth@amd.com>
In-Reply-To: <20231230172351.574091-10-michael.roth@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Feb 2024 11:31:26 +0100
Message-ID: <CABgObfanrHTL429Cr8tcMGqs-Ov+6LWeQbzghvjQiGu9tz0EUA@mail.gmail.com>
Subject: Re: [PATCH v11 09/35] KVM: x86: Determine shared/private faults based
 on vm_type
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, seanjc@google.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, zhi.a.wang@intel.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 30, 2023 at 6:24=E2=80=AFPM Michael Roth <michael.roth@amd.com>=
 wrote:
>
> For KVM_X86_SNP_VM, only the PFERR_GUEST_ENC_MASK flag is needed to
> determine with an #NPF is due to a private/shared access by the guest.
> Implement that handling here. Also add handling needed to deal with
> SNP guests which in some cases will make MMIO accesses with the
> encryption bit.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  arch/x86/kvm/mmu/mmu.c          | 12 ++++++++++--
>  arch/x86/kvm/mmu/mmu_internal.h | 20 +++++++++++++++++++-
>  2 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index d3fbfe0686a0..61213f6648a1 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4331,6 +4331,7 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu =
*vcpu,
>  static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_faul=
t *fault)
>  {
>         struct kvm_memory_slot *slot =3D fault->slot;
> +       bool private_fault =3D fault->is_private;

I think it's nicer to just make the fault !is_private in
kvm_mmu_do_page_fault().

> +static bool kvm_mmu_fault_is_private(struct kvm *kvm, gpa_t gpa, u64 err=
)
> +{
> +       bool private_fault =3D false;
> +
> +       if (kvm_is_vm_type(kvm, KVM_X86_SNP_VM)) {
> +               private_fault =3D !!(err & PFERR_GUEST_ENC_MASK);
> +       } else if (kvm_is_vm_type(kvm, KVM_X86_SW_PROTECTED_VM)) {
> +               /*
> +                * This handling is for gmem self-tests and guests that t=
reat
> +                * userspace as the authority on whether a fault should b=
e
> +                * private or not.
> +                */
> +               private_fault =3D kvm_mem_is_private(kvm, gpa >> PAGE_SHI=
FT);
> +       }

Any reason to remove the is_private page fault that was there in
previous versions of the patch?  I don't really like having both TDX
and SVM-specific code in this function.

Paolo

> +       return private_fault;
> +}
> +
>  /*
>   * Return values of handle_mmio_page_fault(), mmu.page_fault(), fast_pag=
e_fault(),
>   * and of course kvm_mmu_do_page_fault().
> @@ -298,7 +316,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vc=
pu *vcpu, gpa_t cr2_or_gpa,
>                 .max_level =3D KVM_MAX_HUGEPAGE_LEVEL,
>                 .req_level =3D PG_LEVEL_4K,
>                 .goal_level =3D PG_LEVEL_4K,
> -               .is_private =3D kvm_mem_is_private(vcpu->kvm, cr2_or_gpa =
>> PAGE_SHIFT),
> +               .is_private =3D kvm_mmu_fault_is_private(vcpu->kvm, cr2_o=
r_gpa, err),
>         };
>         int r;
>
> --
> 2.25.1
>

