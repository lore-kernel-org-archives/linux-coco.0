Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38FD12C499
	for <linux-coco@lists.linux.dev>; Fri, 10 May 2024 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715348861; cv=none; b=e6P9ndNtZEOFFHKGAGWhIElXgdQRruAqT1dqQNTzFGHzU8u5SK4L8tNIU9MfTSmC/GCfciUS+OwJVQl3VodEsbzhK899w2Ooj5H5xj/NowQJe6LOIZJ7CKhBwhR04KRp1JpIW84BIFKowUwIZDI8DSixv/D5ZiJWsW1zJ4cnRx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715348861; c=relaxed/simple;
	bh=VjLQ4LMP6CaVwr23Yos/UzvuYuiA7pp7/SnwDdrkvJw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MZ8UiC7ZeN3I7Y2TL5h90A+0LO1VA/20UlKaikQU3JelUn2Ab+MyiVAiKMTNvKthdw167psZU3LntTOpUgde+dipDLL4ql9ntjywlD1cD7+SBNroUGlXkR+G6CIboE7YTDKD1adBVerZ6ohs3ojrQRf7+vpWf2ZHumdaojLXA18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w94LwNqa; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w94LwNqa"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc743cc50a6so2599374276.2
        for <linux-coco@lists.linux.dev>; Fri, 10 May 2024 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715348859; x=1715953659; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0BQ7TnRKjFMrxEq7NT+cPq9l36GVpbuuSkGmH4Esl8=;
        b=w94LwNqaw98FYrZi48AYNs8qtl2KykW20c5/5CIQz/ZBUQocEylciWqMy4O6OBSjnk
         dI/qei/TEoDv0RNZnWdCQUBCLneaMzsPGs8fCxkahN62NvSGY9v7/3q7FogpkHIwd2Qq
         wjSKqr0MpG2zSYAJMIiuvNKVYUH8tIrRqLeZScx8ZFcAP/puRLMig3kqVTjrygz3nAp2
         aBKr+oPz62GtJj98uo4agkMJQRRezuRsrFYyFSS3EJuYCdo/vRvBqm1IBlWHLwD59AbB
         jbNefUzlQtzRN3J48j6QmMlX3a2wH1SVoCNu4BthU61yuNvs2C2iCNT96PNMD2KuI4em
         KYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715348859; x=1715953659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0BQ7TnRKjFMrxEq7NT+cPq9l36GVpbuuSkGmH4Esl8=;
        b=GIou3maAPCCJGlaZun1GMCkuCiTZ2VSnBP/EOCUlaeZAXU4p0v9J6fXtD14/gwb2KI
         tJ4sf0jVve3DRKS+8Zp4S6sG7MEA30bs+cwxF9yHX6m6gg0TFGTlzp/NDUKyLDBah6gL
         4fdejFSsrwKxsg9yUnyUccqgQwcXGNPLL4Wekh6yvKMxtfbyIXITBW65XUWCcpryhIQ+
         bPJagu6hpwk7CT5W1p9xeurWKRw9uKqgmUoIcR4GL4fmdDDnYNleqhMbI1zQoE+ACv9c
         0fFfu0jUuf6pFI9yadafsIvFNKhy3F0q9IRfEy4FE4DJRqG7RAHIWOtCIOT8/qlx16Py
         Noyg==
X-Forwarded-Encrypted: i=1; AJvYcCVCpUKhIVc/ea4yu+3TlclE9OtcQ7LjRq60UcLG+OYuFc1fI4sbJF51O9t+RycHhBqzHU6fHhrhJjyWlhsZewZ+zXIQM8bpDnvK6w==
X-Gm-Message-State: AOJu0Yx1xBMUvpe0FzWPyBpei/BGiTf3o4PtPyhsgfhz0rjniIwOG5An
	A+DQVEG6v4jkfUZSTpUUawfx1DCBUAQIQGWYOzNTwmHp2WBmxng+RoqlRTkhsVNSUmgys/oLcBX
	Z0g==
X-Google-Smtp-Source: AGHT+IGeFXcvsiksARA9h1b7EfkKsK64PaIzGQcHXGZ3C4+3t16ZKMcUaQTapjqXNiSAJUTt6kTNKMrdw7g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2b85:b0:de5:2ce1:b638 with SMTP id
 3f1490d57ef6-dee4f0719dfmr158392276.0.1715348858717; Fri, 10 May 2024
 06:47:38 -0700 (PDT)
Date: Fri, 10 May 2024 06:47:37 -0700
In-Reply-To: <20240510015822.503071-1-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240501085210.2213060-1-michael.roth@amd.com> <20240510015822.503071-1-michael.roth@amd.com>
Message-ID: <Zj4lebCMsRvGn7ws@google.com>
Subject: Re: [PATCH v15 21/23] KVM: MMU: Disable fast path for private memslots
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, papaluri@amd.com, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, May 09, 2024, Michael Roth wrote:
> ---
>  arch/x86/kvm/mmu/mmu.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 62ad38b2a8c9..cecd8360378f 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3296,7 +3296,7 @@ static int kvm_handle_noslot_fault(struct kvm_vcpu *vcpu,
>  	return RET_PF_CONTINUE;
>  }
>  
> -static bool page_fault_can_be_fast(struct kvm_page_fault *fault)
> +static bool page_fault_can_be_fast(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>  {
>  	/*
>  	 * Page faults with reserved bits set, i.e. faults on MMIO SPTEs, only
> @@ -3307,6 +3307,32 @@ static bool page_fault_can_be_fast(struct kvm_page_fault *fault)
>  	if (fault->rsvd)
>  		return false;
>  
> +	/*
> +	 * For hardware-protected VMs, certain conditions like attempting to
> +	 * perform a write to a page which is not in the state that the guest
> +	 * expects it to be in can result in a nested/extended #PF. In this
> +	 * case, the below code might misconstrue this situation as being the
> +	 * result of a write-protected access, and treat it as a spurious case
> +	 * rather than taking any action to satisfy the real source of the #PF
> +	 * such as generating a KVM_EXIT_MEMORY_FAULT. This can lead to the
> +	 * guest spinning on a #PF indefinitely.
> +	 *
> +	 * For now, just skip the fast path for hardware-protected VMs since
> +	 * they don't currently utilize any of this machinery anyway. In the
> +	 * future, these considerations will need to be taken into account if
> +	 * there's any need/desire to re-enable the fast path for
> +	 * hardware-protected VMs.
> +	 *
> +	 * Since software-protected VMs don't have a notion of a shared vs.
> +	 * private that's separate from what KVM is tracking, the above
> +	 * KVM_EXIT_MEMORY_FAULT condition wouldn't occur, so avoid the
> +	 * special handling for that case for now.

Very technically, it can occur if userspace _just_ modified the attributes.  And
as I've said multiple times, at least for now, I want to avoid special casing
SW-protected VMs unless it is *absolutely* necessary, because their sole purpose
is to allow testing flows that are impossible to excercise without SNP/TDX hardware.

> +	 */
> +	if (kvm_slot_can_be_private(fault->slot) &&
> +	    !(IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) &&
> +	      vcpu->kvm->arch.vm_type == KVM_X86_SW_PROTECTED_VM))

Heh, !(x && y) kills me, I misread this like 4 times.

Anyways, I don't like the heuristic.  It doesn't tie the restriction back to the
cause in any reasonable way.  Can't this simply be?

	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)
		return false;

Which is much, much more self-explanatory.
