Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B6330BF69
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730303; cv=none; b=dK0cu+07SC7unumPWC2RYumVgCg1YdJR2Li+KjF2iHP+WxzyUJDqsStBkeVJKXZ81wRkAZWO+fEdPWn340uBjxh08AscZBpU78BCQixs5MeK3ICVmMjcHeFKB0nSqjHu6nQZVCnmc9Nj2GspCDsmEVBJVCVHtNqezMY8ZIoQyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730303; c=relaxed/simple;
	bh=AXA0HNgTMbIlUb23tf+ahP4P6GnlvzCxpMrcpKNGmHA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MEv+D7fssxvoYE16uDzUZtzKTRsNiaw23gk+VeykE2+uymb0D7moOajysoUcYOoUQr7ocumjRQz/kRCgru7JFAEwN1TqETRF9TWGcszhuprw1dB45azbJ5TEzYbgicaeGUC4aPGUbVSfA0z5kFFzOZjPkHiqDmlnFa/4iVq/KeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B614PNaJ; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B614PNaJ"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso9148016b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784730301; x=1785335101; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edl2D2XPYY/pyvIQyZo7/zY3nQepPhnkcqrKbyKWnNs=;
        b=B614PNaJm5HAK4ROF3g5cw/r20BpJwNnBR5TCYclsCEIVrFZoa9NHpyTP6HJxaBFig
         lrnY01osph1WuHxh515bB3jwSM/nFdyT7LETrbJfZ0MppIdgT9OUt1qZOaUxrWQVqwHn
         H1DF0SuGPHciurOPdgU5gDo8ytJNfCnuyDM87J0dxWzPXDiFKhx5W9Vvz4Kuh+TkKS+Z
         Dy/zxnOL1VyNAbSw1OrM/Xy7QGFOPy6Ye8W5IF0AYxnB15kg5l4pjMe/7k/lTPk48qrZ
         jS5ZbkegHrNOs6nYUW62mnVkhTL/H2phYUnkDq33+j1Lhb1f6hQjFVuln61S41sgf8GC
         Wmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730301; x=1785335101;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=edl2D2XPYY/pyvIQyZo7/zY3nQepPhnkcqrKbyKWnNs=;
        b=caPE/gAsWMHdgxRl3czxw7tDIDafU35EbceiA+qTUHuqbGIHve3rHb/Mk5V+6qQC3a
         h9Bk3sSETnbfZhQ++a6MuFj4NuH1/vVmm1VFUOkw8fenIokr94TyqPKvdFXgQ3VZAH/Y
         HJI9O3h/G1jTNxxuouPQeAYf7jwpHrTz+TxSM+hKNGTDIjCb2aSpoA5at6tEj5GZKXhS
         OcXEBmruufxg9iKqTSprmOc8FPcQuZPjcpiOKwfE7RagnoNEXL25RhUA1+DZwyok41Vx
         gpFHOm/K9uMg6gS+2J0i4273EWqaMTKllFVrAjyNFSFifbo32/8cKpTQG173CLNRzQik
         u/pA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0EZMMClTS57B4tl/iI3DRbXYn+wSPrDqr1oaNMgHRV5J9U1uRxN54cmOVcx3oxwlxU79mNQz5y6Gw@lists.linux.dev
X-Gm-Message-State: AOJu0YySwZVGE4fRfIPXG4mldCmaQ+faechOeZADtPa//jMSqnRoHGBS
	JmoooD4wMImy8s6nxXK0UW+X2zwrhKN5QQogrue6+KoKIjjAQI2sHk+n39IC3zU96jUszWau2xx
	ogRKelg==
X-Received: from pfbfm6.prod.google.com ([2002:a05:6a00:2f86:b0:847:a85b:6c23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cc8:b0:848:5f4f:289d
 with SMTP id d2e1a72fcca58-84c2922a36cmr22279903b3a.4.1784730301156; Wed, 22
 Jul 2026 07:25:01 -0700 (PDT)
Date: Wed, 22 Jul 2026 07:25:00 -0700
In-Reply-To: <20260718014500.2231262-9-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com> <20260718014500.2231262-9-rick.p.edgecombe@intel.com>
Message-ID: <amDSvGlgaQRWnWfP@google.com>
Subject: Re: [PATCH v7 08/11] KVM: TDX: Get/put PAMT pages when (un)mapping
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, tglx@kernel.org, vannapurve@google.com, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 17, 2026, Rick Edgecombe wrote:
> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index 83dc5086138b3..588563dfe88d5 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -98,6 +98,7 @@ KVM_X86_OP_OPTIONAL_RET0(tdp_has_smep)
>  KVM_X86_OP(load_mmu_pgd)
>  KVM_X86_OP_OPTIONAL_RET0(set_external_spte)
>  KVM_X86_OP_OPTIONAL(free_external_spt)
> +KVM_X86_OP_OPTIONAL_RET0(topup_external_cache)
>  KVM_X86_OP(has_wbinvd_exit)
>  KVM_X86_OP(get_l2_tsc_offset)
>  KVM_X86_OP(get_l2_tsc_multiplier)
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 5f6c1ce9673b7..1c706e2d773b0 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1922,6 +1922,8 @@ struct kvm_x86_ops {
>  	/* Update external page tables for page table about to be freed. */
>  	void (*free_external_spt)(struct kvm *kvm, struct kvm_mmu_page *sp);
>  
> +	int (*topup_external_cache)(struct kvm_vcpu *vcpu, int min_nr_spts);
> +

Unnecessary newline (not your fault, but it stands out here).

>  	bool (*has_wbinvd_exit)(void);
>  
