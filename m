Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4F91F952
	for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 17:37:26 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1c3a2f46244so251115ad.1
        for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694626645; x=1695231445; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1AecudT7EiX+/N1zd76G2BuWYAX0/KYuLLaU2H3llYQ=;
        b=HQMRxaUjmGSBCztdUuFOecI/HwiBxF/aovUn5vpKW09nvCgiI9jy4kGKF331HAY2rH
         WtUCfuM4qskOs/UNL4bbpdMo9be2R/gkpcaL7tBrEJD/TCRhdy2keW/1zGLRpOkXDeqo
         k4SbFRKuMmpWTslPxenwOS2NwDmhTNCI88DjQCBRc+e6h8D3uJvxngSb8r7fWdKb2QZE
         aGoT1En3tPl7GMokDamZXA+fO9NTpAetKDx3KhJ9vmBXtoMtivKKdGH+6mCuq7WabDCy
         FGnjscSwvdPkeBmaW/NZYUTNiyLiRcieM+MytJifJoN5+ic4qupxlBxb+UjskS9WR8fF
         u5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694626645; x=1695231445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1AecudT7EiX+/N1zd76G2BuWYAX0/KYuLLaU2H3llYQ=;
        b=YGXDC6yYTiC3Yv/3bBFHJqFUg5sGGdv1V0VsgFlzfkWWmjjsbiGW5rTwWhDYgNThij
         PR6PMO+wPKOmADes6H5Qbr5Lz8zWYxjdx2ikYSRRbfkwkw0gwBO/PZj32Rce9KsivLJE
         +b3y3ZOh8+fj6aECJO9swCW5VoIWavAqb6rD+gdRLPc/83DRyYdz3jZuiX+1As9v7Vwv
         EWFhzfJkkAnTXg4+wHT1KkIosTB0Lp/3SOeavdJe4wp36jEFrRSx3RpyHLqwbTsNR/w7
         xVnjs9tdOIFpw5UTW4TB5w24UyjJ3d4fd5XbwEwyPCvTNQI+Zl0vBnUoh6Cn0zEIvIkY
         CESQ==
X-Gm-Message-State: AOJu0Yypqu1Q0B4KN6JDIzLzGtGxcEctQ2KFGXLHOooi5DIIhS5EMOoV
	ziSJinzRMLbtKfS/x6X+ubvbrAEAnO8=
X-Google-Smtp-Source: AGHT+IHiMeIl2kyTkgSOGsBoH7eXEckogjT+Oxb3QtAWLG1MtxlYB2PHOPs6XjcZ/s4JwKMi4FJkjjeo9Jg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c28b:b0:26b:2001:54f5 with SMTP id
 f11-20020a17090ac28b00b0026b200154f5mr76310pjt.8.1694626645628; Wed, 13 Sep
 2023 10:37:25 -0700 (PDT)
Date: Wed, 13 Sep 2023 10:37:24 -0700
In-Reply-To: <36f6fae6cd7aaba3b0fc18f10981bbba2c30b979.1694599703.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1694599703.git.isaku.yamahata@intel.com> <36f6fae6cd7aaba3b0fc18f10981bbba2c30b979.1694599703.git.isaku.yamahata@intel.com>
Message-ID: <ZQHzVOIsesTTysgf@google.com>
Subject: Re: [RFC PATCH 3/6] KVM: guest_memfd, x86: MEMORY_FAULT exit with hw
 poisoned page
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 13, 2023, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> When resolving kvm page fault and hwpoisoned page is given, KVM exit
> with HWPOISONED flag so that user space VMM, e.g. qemu, handle it.
> 
> - Add a new flag POISON to KVM_EXIT_MEMORY_FAULT to indicate the page is
>   poisoned.
> - Make kvm_gmem_get_pfn() return hwpoison state by -EHWPOISON when the
>   folio is hw-poisoned.
> - When page is hw-poisoned on faulting in private gmem, return
>   KVM_EXIT_MEMORY_FAULT with HWPOISONED flag.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---

...

> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index eb900344a054..48329cb44415 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -527,7 +527,8 @@ struct kvm_run {
>  		} notify;
>  		/* KVM_EXIT_MEMORY_FAULT */
>  		struct {
> -#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
> +#define KVM_MEMORY_EXIT_FLAG_PRIVATE	BIT_ULL(3)
> +#define KVM_MEMORY_EXIT_FLAG_HWPOISON	BIT_ULL(4)

Rather than add a flag, I think we should double down on returning -1 + errno
when exiting with vcpu->run->exit_reason == KVM_EXIT_MEMORY_FAULT, as is being
proposed in Anish's series for accelerating UFFD-like behavior in KVM[*].

Then KVM can simply return -EFAULT or -EHWPOISON to communicate why KVM is
existing at a higher level, and let the kvm_run structure provide the finer
details about the access itself.  E.g. kvm_faultin_pfn_private() can simply
propagate the return value from kvm_gmem_get_pfn() without having to identify
*why* kvm_gmem_get_pfn() failed.

static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
				   struct kvm_page_fault *fault)
{
	int max_order, r;

	if (!kvm_slot_can_be_private(fault->slot)) {
		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
		return -EFAULT;
	}

	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
			     &max_order);
	if (r) {
		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
		return r;
	}

	...
}

[*] https://lore.kernel.org/all/20230908222905.1321305-5-amoorthy@google.com
