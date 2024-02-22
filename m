Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB48D13FFA
	for <linux-coco@lists.linux.dev>; Thu, 22 Feb 2024 02:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708567552; cv=none; b=TU5HuUi8BYt0SqYEWr4kgGmNQIM+Q3PIixL/4vIbSJKDl+vMhGuxj5T3l8YM25JURvuBx2TNRQYJDoq6ufERk4+EBti7knXDoKgbNrT9UGnpjSgYVU1fsgG4u1SGBIptD7Q2gnvDj2shDryVa1O4WkYoVYgq1WO1Ktw9anPSRZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708567552; c=relaxed/simple;
	bh=ozCZhRUwbru42YhRIa9D6DyDB6aCfOEQUSg9R1xBB10=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DPLfQMoIsH/F60N+wmDdBnBNkmIh9i+EcPEE4/0JA1zwuwRVHMpPhj9uwUGoSb1MPuNtt4S3mDBe9rnkOWRfyP5/eUO/Ye9rBGMuUyfj2A6yJ5SvK5F2y8BAcuzHE/TmUbA+N8+JLG+CQ357EfEEEYt1kN2vwFY6WzsGII97XhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RUs92IZm; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RUs92IZm"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc746178515so12217292276.2
        for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 18:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708567550; x=1709172350; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wYRM8eOs48YYKU37Y3bVOmsx2y3KEiVB2XVZoknd41E=;
        b=RUs92IZmdlTZR/8P/meshxDOfNh6PVBg+2Tz7NmTPzVukAOaZPXxl7cywbz3/E1cq1
         LUk1EJ7tIlOzMYlzIegrJZvQMxdLgwpWSbECPlpzt8BGifh7ADN+Fv2arXwR2p3jxCXH
         PYjcpiUjUc4FOXrP55ys8H17tlcGkCGuvLHWrA9zVbwMgIpFnHRgmk57UB/E5VX8q+T5
         J1/HR1MNC128jl5kUR8IKoV6aqfQfVYQoH2BOv9LhBuFeW7xQoDZow8UkHdvS3mAZLUt
         6qIFXCJ2SkSgRGwjSEx2Owwa4HZ2i+qEdRTnqAn+dDVQUBhBRM0kh7udd3hhyoTQy1bS
         m+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708567550; x=1709172350;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYRM8eOs48YYKU37Y3bVOmsx2y3KEiVB2XVZoknd41E=;
        b=Qsxy0Pn4Z/jTIOI1eftVQj/Nl2aSDEU2h2wJOcidkcIfKWfoFzmQMIxtIhGInFGns6
         D2BGKkc5bF6t7TLZj7nQrkvzX9baI0ZUWkIz/8A/mYB/YaSLtaipJKuP1dQ0vvZLgIcd
         HJc7IJMurVKTDdBL1462pF1XM2PQ+BrvBFGlXH7YwZA9P7dDG1sQqy6CNd3DoPn75DtQ
         XHW9+nm5Rp/7RgDWUqvAm6A9wYAZDwLUVNceHc2U2J9BjZVWv2O/82d2i0/F0Y5lRYD8
         ZQyAaPjhsL7AHLYsFzQDeoes9YEenmMgEUqyXEgc5GVigrd2vpYHCzTfylAAcXu1umza
         8O0w==
X-Forwarded-Encrypted: i=1; AJvYcCWp1BL9ehzyU/AjKDaZESoPmhUi4rXs/SyYlqf1I/+vQCHtUyXdJb+9Dk+kiaJmXOKGxzNPuX1ymlc+NqZU8ifkoEhuldngSYAoXw==
X-Gm-Message-State: AOJu0YwQ03M7kkopm7dKZSn6SCZMXvkQvG/uNEl5W9sw2KJkjTeRZqZZ
	mccOw/bidWq/5eyjJ+08LjeghteVQR0qnMJx4sfwhFPJLH08Tp7CpofrrIO7vp57C3RxahiFP7X
	DOg==
X-Google-Smtp-Source: AGHT+IGLZRXp0J9qN8JJcoB3W0uf+vPPo31BgwKOSu3YKTJjr76LRxvOfOEDc1mZvTNorZoF2DnNDi6XZz8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:134d:b0:dcb:e4a2:1ab1 with SMTP id
 g13-20020a056902134d00b00dcbe4a21ab1mr276046ybu.11.1708567549779; Wed, 21 Feb
 2024 18:05:49 -0800 (PST)
Date: Wed, 21 Feb 2024 18:05:48 -0800
In-Reply-To: <20230722005227.GK25699@ls.amr.corp.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1689893403.git.isaku.yamahata@intel.com>
 <f474282d701aca7af00e4f7171445abb5e734c6f.1689893403.git.isaku.yamahata@intel.com>
 <ZLqSH/lEbHEnQ9i8@google.com> <20230722005227.GK25699@ls.amr.corp.intel.com>
Message-ID: <Zdar_PrV4rzHpcGc@google.com>
Subject: Re: [RFC PATCH v4 04/10] KVM: x86: Introduce PFERR_GUEST_ENC_MASK to
 indicate fault is private
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 21, 2023, Isaku Yamahata wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> Date: Wed, 14 Jun 2023 12:34:00 -0700
> Subject: [PATCH 4/8] KVM: x86: Use PFERR_GUEST_ENC_MASK to indicate fault is
>  private
> 
> SEV-SNP defines PFERR_GUEST_ENC_MASK (bit 32) in page-fault error bits to
> represent the guest page is encrypted.  Use the bit to designate that the
> page fault is private and that it requires looking up memory attributes.
> The vendor kvm page fault handler should set PFERR_GUEST_ENC_MASK bit based
> on their fault information.  It may or may not use the hardware value
> directly or parse the hardware value to set the bit.
> 
> For KVM_X86_SW_PROTECTED_VM, ask memory attributes for the fault
> privateness.  For async page fault, carry the bit and use it for kvm page
> fault handler.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

...

> @@ -4315,7 +4316,8 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
>  	      work->arch.cr3 != kvm_mmu_get_guest_pgd(vcpu, vcpu->arch.mmu))
>  		return;
>  
> -	kvm_mmu_do_page_fault(vcpu, work->cr2_or_gpa, 0, true, NULL);
> +	kvm_mmu_do_page_fault(vcpu, work->cr2_or_gpa, work->arch.error_code,
> +			      true, NULL);

This is unnecessary, KVM doesn't suppoort async page fault behavior for private
memory (and doesn't need to, because guest_memmfd() doesn't support swap).

> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index 7f9ec1e5b136..3a423403af01 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -295,13 +295,13 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
>  		.user = err & PFERR_USER_MASK,
>  		.prefetch = prefetch,
>  		.is_tdp = likely(vcpu->arch.mmu->page_fault == kvm_tdp_page_fault),
> +		.is_private = err & PFERR_GUEST_ENC_MASK,

This breaks SEV and SEV-ES guests, because AFAICT, the APM is lying by defining
PFERR_GUEST_ENC_MASK in the context of SNP.  The flag isn't just set when running
SEV-SNP guests, it's set for all C-bit=1 effective accesses when running on SNP
capable hardware (at least, that's my observation).

Grumpiness about discovering yet another problem that I would have expected
_someone_ to stumble upon...

FYI, I'm going to post a rambling series to cleanup code in the page fault path
(it started as a cleanup of the "no slot" code and then grew a few more heads).
One of the patches I'm going to include is something that looks like this patch,
but I'm going to use a KVM-defined synthetic bit, because stuffing a bit that KVM
would need _clear_ on _some_ hardware is gross.
