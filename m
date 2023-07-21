Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382501ED24
	for <linux-coco@lists.linux.dev>; Fri, 21 Jul 2023 14:26:00 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-583a4015791so2791147b3.1
        for <linux-coco@lists.linux.dev>; Fri, 21 Jul 2023 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689949560; x=1690554360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qsOblVN0R0vt/pe3dNZWP7QQiaTx7X4bgufFrqaLpho=;
        b=cGBHW/6K1sW6ejc8bX15/z0rQMq0wpeeceuX8mY+GNE8GIy9t1+zTMzpJ9tfj5nofb
         ognBRrmq4MHOycdxBwA5oUh3s92ngcSXiMyYAw8dbCbR4hwgS7SkVmsNmHVnxCii7UtH
         eDlIzCF+QNfGeyJMQ6G5q0Sgf8Cry2iVYlWNs2RXUnOhOkH/QfoeRTTeNciF8K9Ft0x4
         /tcc15TTPjIADvjUoRNLSjgR87jS23/3RFVkZqjPFQ4aurgk+AQnDOJbUlFHSFn+fjqX
         WVGX6Pw6cCmfNNxOLlGW3i/zMiuPKL702bffjmRHgrAL/GaPa/BBVMAtrTIb8Lo3Qfa2
         JCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689949560; x=1690554360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsOblVN0R0vt/pe3dNZWP7QQiaTx7X4bgufFrqaLpho=;
        b=PzdIugPZDq5MJGKGJnWylWiexXh6lDWkw5pPVvH+JO8GcpIsvcGT2+pxYsP1K+MD06
         rTAt0K34Uyn8vXwmQyi56HgvHTIh5IbMIIaDztyr8e0P3SpUjGk7eKg8nTTPsMXp980G
         4ok+sRrVLqmXL/KoD8QtNGsGormBTEqG8qpNdmsFgdcA3yVZuTahdemYAtGxu9WW06F0
         99sh7YaDIKWSHyf3oX93n24+gosdt3QYyOtAKVYpReTtLGPVmLjCXnB4p1j9TrSjQDKG
         jZxG8L8wTjd7NDTWlC/QOxCU/y5fn7ta4f0xZb3lVl/7LKYpcLP9k4+18NA5JAybw3yI
         JbbQ==
X-Gm-Message-State: ABy/qLaWHG69DySydbRQ8xqFJwfxlbOnLl5s3TfUvVSS+Sc+V7ReUGpC
	z0d29cM8BSbtMlAFQXfAxsDa0AEpacI=
X-Google-Smtp-Source: APBJJlG0OZKVwyLHrGl5rZrxsG0XvhQbW+hg4R9n5nWymHNVwtjpYPkxb0V0qrnY8W7UAcFS2k3Opvc6Mwc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:e74f:0:b0:ce8:e6f:440c with SMTP id
 e76-20020a25e74f000000b00ce80e6f440cmr11741ybh.6.1689949559993; Fri, 21 Jul
 2023 07:25:59 -0700 (PDT)
Date: Fri, 21 Jul 2023 07:25:58 -0700
In-Reply-To: <21e488b6ced77c08d9e6718fcf57e100af409c64.1689893403.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1689893403.git.isaku.yamahata@intel.com> <21e488b6ced77c08d9e6718fcf57e100af409c64.1689893403.git.isaku.yamahata@intel.com>
Message-ID: <ZLqVdvsF11Ddo7Dq@google.com>
Subject: Re: [RFC PATCH v4 07/10] KVM: x86: Add gmem hook for initializing
 private memory
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

On Thu, Jul 20, 2023, isaku.yamahata@intel.com wrote:
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index a73ddb43a2cf..35bb14363828 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4352,6 +4352,7 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
>  				   struct kvm_page_fault *fault)
>  {
>  	int max_order, r;
> +	u8 max_level;
>  
>  	if (!kvm_slot_can_be_private(fault->slot))
>  		return kvm_do_memory_fault_exit(vcpu, fault);
> @@ -4361,8 +4362,15 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
>  	if (r)
>  		return r;
>  
> -	fault->max_level = min(kvm_max_level_for_order(max_order),
> -			       fault->max_level);
> +	max_level = kvm_max_level_for_order(max_order);
> +	r = static_call(kvm_x86_gmem_prepare)(vcpu->kvm, fault->slot, fault->pfn,
> +					      fault->gfn, &max_level);

I think KVM should hook gmem itself, i.e. convert pages to private when they're
allocated, and then back to shared when they're freed.  I don't like having
asymmetric APIs (convert on fault instead of allocate, but then convert back on
free instead of on zap), and hooking the page fault path also violates the approach
of tying the RMP/HKID to the physical allocation.

Practically speaking, hooking the fault path will result in undesirable behavior.
Just because KVM *maps* at 4KiB granularity doesn't mean the RMP must be assigned
at 4KiB granularity, e.g. if userspace chooses to *not* PUNCH_HOLE when the guest
shares a single 4KiB page in a 2MiB chunk.   Dirty logging is another case where
the RMP can stay at 2MiB.  Or as a very silly example, imagine userspace pulls a
stupid and covers a single 2MiB chunk of gmem with 512 memslots.

That likely means KVM will need an additional hook to clamp the max_level at the
RMP, but that shouldn't be a big deal, e.g. if we convert on allocation, then KVM
should be able to blindly do the conversion because it would be a kernel bug if
the page is already assigned to an ASID in the RMP, i.e. the additional hook
shouldn't incur an extra RMP lookup.
