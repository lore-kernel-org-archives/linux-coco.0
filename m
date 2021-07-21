Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0D70
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 00:20:33 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id b12so904906pfv.6
        for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 17:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xsx3HQqSw4EPyNMxM9oP5SdyJb+SogTu3w/uAOd0oLk=;
        b=cEWuOuugvVGVQn+IaenjLryO1wWgCOjt/YM2Kg9/wQVM/wZQZ67OtRnHOVJkUn4p5+
         oXecvk/lXVdHh5LgWt0w/g64Drk8tZZrJGD28T9y5cC0Nxnod7L1qvnYcKAi27ZQ3j8G
         PNlEydF9bXaF2opSpKep2gvoKiZNU1CTeGtx5BFMxWuEJTugu7AhwYkFG+gR2NFCnXEu
         gSUJUqH4RNkeO8OwkSc4fB/7oLySNbXLE6lFafYRtyEGXXCxnBhE4xrtCtHPS0BAGR2J
         N5AyGxEJnyZyZLgTRs/GS6tmRf+pUGoyQaNOObjf1/wqesnkxLshoNKWErNj+qhUi3+E
         imUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xsx3HQqSw4EPyNMxM9oP5SdyJb+SogTu3w/uAOd0oLk=;
        b=l/t9Xp5a0JKdfLdmdHEstNOIAcRtEHioj39zv5m2tBkJncmCZLT8Ty5wqTQiKbZgy/
         kWUl3wQTlj1jsvZP07xMglLFuO4n8X64Qc5hVnI5qEY7fBL+NJ3060VPC7ZEAa5P+tXQ
         sKFop45r1EHW4F3J13biMdMXGcDJLdwg52kCzIhUTLjwgu7XcNDgxuNn5ZtfbGNxOqz/
         DOEJvHngfx6aGu4ngWLn/Gb8uPx5kVlQZE7yhSUGZX2i/xNebO3W1yrIb5orlsn+/pvp
         YO/ZrhnuUqajwmyQROGjHhuJmkduqiQpCtAjrIE7P+huTww9C5n/g/zFj9Z3RkOqCxgI
         QSxQ==
X-Gm-Message-State: AOAM533KPCHlGucMkV91ig5s19++itIJi3xPLakaeytPu5h6X2rXLR6g
	Bfx2VLBa/nRrlMJjGcCxd2Ax8g==
X-Google-Smtp-Source: ABdhPJzO5a2tT2MSUn4GuU8F1gVkASk2rMMQW40YjFMKpseRmAH4meFchXyU//CEhkz6SKp8BznOpQ==
X-Received: by 2002:a63:5c04:: with SMTP id q4mr32924434pgb.127.1626826832684;
        Tue, 20 Jul 2021 17:20:32 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id f11sm28627430pga.61.2021.07.20.17.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 17:20:32 -0700 (PDT)
Date: Wed, 21 Jul 2021 00:20:28 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
	npmccallum@redhat.com, brijesh.ksingh@gmail.com
Subject: Re: [PATCH Part2 RFC v4 39/40] KVM: SVM: Use a VMSA physical address
 variable for populating VMCB
Message-ID: <YPdoTK9V3anPZe7C@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-40-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707183616.5620-40-brijesh.singh@amd.com>

On Wed, Jul 07, 2021, Brijesh Singh wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> In preparation to support SEV-SNP AP Creation, use a variable that holds
> the VMSA physical address rather than converting the virtual address.
> This will allow SEV-SNP AP Creation to set the new physical address that
> will be used should the vCPU reset path be taken.

I'm pretty sure adding vmsa_pa is unnecessary.  The next patch sets svm->vmsa_pa
and vmcb->control.vmsa_pa as a pair.  And for the existing code, my proposed
patch to emulate INIT on shutdown would eliminate the one path that zeros the
VMCB[1].  That series patch also drops the init_vmcb() in svm_create_vcpu()[2].

Assuming there are no VMCB shenanigans I'm missing, sev_es_init_vmcb() can do

	if (!init_event)
		svm->vmcb->control.vmsa_pa = __pa(svm->vmsa);

And while I'm thinking of it, the next patch should ideally free svm->vmsa when
the the guest configures a new VMSA for the vCPU.

[1] https://lkml.kernel.org/r/20210713163324.627647-45-seanjc@google.com
[2] https://lkml.kernel.org/r/20210713163324.627647-10-seanjc@google.com

> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  arch/x86/kvm/svm/sev.c | 5 ++---
>  arch/x86/kvm/svm/svm.c | 9 ++++++++-
>  arch/x86/kvm/svm/svm.h | 1 +
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 4cb4c1d7e444..d8ad6dd58c87 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -3553,10 +3553,9 @@ void sev_es_init_vmcb(struct vcpu_svm *svm)
>  
>  	/*
>  	 * An SEV-ES guest requires a VMSA area that is a separate from the
> -	 * VMCB page. Do not include the encryption mask on the VMSA physical
> -	 * address since hardware will access it using the guest key.
> +	 * VMCB page.
>  	 */
> -	svm->vmcb->control.vmsa_pa = __pa(svm->vmsa);
> +	svm->vmcb->control.vmsa_pa = svm->vmsa_pa;
>  
>  	/* Can't intercept CR register access, HV can't modify CR registers */
>  	svm_clr_intercept(svm, INTERCEPT_CR0_READ);
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 32e35d396508..74bc635c9608 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -1379,9 +1379,16 @@ static int svm_create_vcpu(struct kvm_vcpu *vcpu)
>  	svm->vmcb01.ptr = page_address(vmcb01_page);
>  	svm->vmcb01.pa = __sme_set(page_to_pfn(vmcb01_page) << PAGE_SHIFT);
>  
> -	if (vmsa_page)
> +	if (vmsa_page) {
>  		svm->vmsa = page_address(vmsa_page);
>  
> +		/*
> +		 * Do not include the encryption mask on the VMSA physical
> +		 * address since hardware will access it using the guest key.
> +		 */
> +		svm->vmsa_pa = __pa(svm->vmsa);
> +	}
> +
>  	svm->guest_state_loaded = false;
>  
>  	svm_switch_vmcb(svm, &svm->vmcb01);
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 9fcfc0a51737..285d9b97b4d2 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -177,6 +177,7 @@ struct vcpu_svm {
>  
>  	/* SEV-ES support */
>  	struct sev_es_save_area *vmsa;
> +	hpa_t vmsa_pa;
>  	struct ghcb *ghcb;
>  	struct kvm_host_map ghcb_map;
>  	bool received_first_sipi;
> -- 
> 2.17.1
> 
