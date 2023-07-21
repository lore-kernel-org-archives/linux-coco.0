Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC951EA66
	for <linux-coco@lists.linux.dev>; Fri, 21 Jul 2023 14:11:45 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5839bad0ba7so4385577b3.0
        for <linux-coco@lists.linux.dev>; Fri, 21 Jul 2023 07:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689948704; x=1690553504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4SdCBonFvWuf+V0yEJ7nT449w336KZFoWRjXJb2o+8=;
        b=n0oKwH0dgFAGMVF27nk3YDk+kFnnpdNBuswzKKsDjUoF2nttUcFPQAkqIQGcn0vrbH
         T/IucMfN+WY88gtSSszC9sE2AOaEvI3LvZ/89ISKL1/4Eui6pr5dnCaRqpMbBbdVWsYv
         NRptPq/VIq8QeXzcY4lctUyDp4uXHQnVipX3esx5J7htoMXXac4+aNvckJCuvtputXFM
         Ey6stLIQHLTh6AWzRANZgxRvllCkH15KVd+nBxOMRRXGWHdlimZlTV+Wew5WEIFL+PBk
         V1aphpXfO/KyTCCCKDLLkTbYJ6wkv8i3EyZqsT8phHQ8tdPzL6w1VMKzFt0jzzKo/WGf
         WWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689948704; x=1690553504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T4SdCBonFvWuf+V0yEJ7nT449w336KZFoWRjXJb2o+8=;
        b=IJ6WArb9LKN2k2uev1X3xV4lAwX8B7s3/9OMlgvbf3qg8OkdHI6YFbPVpfyYhA2+OF
         8Q7/scLIVLEA+PhVp8SokAwGNYp1zi/xDm/FWMnMH22EhtCStPyW/F4FRKC5n7oOoyiH
         JgmiIfiPxLB1AIigKnONAvEI8bxBe2mJQ6uxZGx6Q5eQ/hG/KSY9K4bqnhPb3rxzJd+d
         FxkJtzih0d6zDqNvkGGk6mRjkx8QTsYFqupmvhKA2zqWWOeCdnyWS25K7NfGU/ycH6pZ
         qGUBiH/PmbblzI99snsg0FpsKzLq65vof7tx1uzeYmZfQHavLmQk7jlI67QfPJkY8y+T
         m2Gg==
X-Gm-Message-State: ABy/qLYkUUYq6rNCwQajyBxwxNwZ+2h/pYeRVF3+6cARxdPQSrV1wx7b
	zwTj8sJwagBlKBLSb9GMdVLq0vD4iWI=
X-Google-Smtp-Source: APBJJlGU/N1c7xh9FsCGTTqaD2PqcnAod11BMYxzm1muKo1ARK3G7tqDbEj8dtVJ1jfB1maibUqj4V2HcNs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ba06:0:b0:c61:7151:6727 with SMTP id
 t6-20020a25ba06000000b00c6171516727mr13809ybg.10.1689948704796; Fri, 21 Jul
 2023 07:11:44 -0700 (PDT)
Date: Fri, 21 Jul 2023 07:11:43 -0700
In-Reply-To: <f474282d701aca7af00e4f7171445abb5e734c6f.1689893403.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1689893403.git.isaku.yamahata@intel.com> <f474282d701aca7af00e4f7171445abb5e734c6f.1689893403.git.isaku.yamahata@intel.com>
Message-ID: <ZLqSH/lEbHEnQ9i8@google.com>
Subject: Re: [RFC PATCH v4 04/10] KVM: x86: Introduce PFERR_GUEST_ENC_MASK to
 indicate fault is private
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

s/Introduce/Use

This doesn't "introduce" anything, in the sense that it's an AMD-defined error
code flag.  That matters because KVM *did* introduce/define PFERR_IMPLICIT_ACCESS.

On Thu, Jul 20, 2023, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Add two PFERR codes to designate that the page fault is private and that
> it requires looking up memory attributes.  The vendor kvm page fault
> handler should set PFERR_GUEST_ENC_MASK bit based on their fault
> information.  It may or may not use the hardware value directly or
> parse the hardware value to set the bit.
> 
> For KVM_X86_PROTECTED_VM, ask memory attributes for the fault privateness.

...

> +static inline bool kvm_is_fault_private(struct kvm *kvm, gpa_t gpa, u64 error_code)
> +{
> +	/*
> +	 * This is racy with mmu_seq.  If we hit a race, it would result in a
> +	 * spurious KVM_EXIT_MEMORY_FAULT.
> +	 */
> +	if (kvm->arch.vm_type == KVM_X86_SW_PROTECTED_VM)
> +		return kvm_mem_is_private(kvm, gpa_to_gfn(gpa));

Please synthesize the error code flag for SW-protected VMs, same as TDX, e.g.

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 20e289e872eb..de9e0a9c41e6 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5751,6 +5751,10 @@ int noinline kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 err
        if (WARN_ON(!VALID_PAGE(vcpu->arch.mmu->root.hpa)))
                return RET_PF_RETRY;
 
+       if (vcpu->kvm->arch.vm_type == KVM_X86_SW_PROTECTED_VM &&
+           kvm_mem_is_private(vcpu->kvm, gpa_to_gfn(cr2_or_gpa)))
+               error_code |= PFERR_GUEST_ENC_MASK;
+
        r = RET_PF_INVALID;
        if (unlikely(error_code & PFERR_RSVD_MASK)) {
                r = handle_mmio_page_fault(vcpu, cr2_or_gpa, direct);

Functionally it's the same, but I want all VM types to have the same source of
truth for private versus shared, and I really don't want kvm_is_fault_private()
to exist.
