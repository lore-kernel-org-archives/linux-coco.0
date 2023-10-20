Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3343F624
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 00:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YbVIX/Ug"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6be1065cc81so288441b3a.3
        for <linux-coco@lists.linux.dev>; Thu, 19 Oct 2023 17:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697762294; x=1698367094; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H40udxrnn6fdY9pib9PfDMy1TSaBomffUjfkk2BSewI=;
        b=YbVIX/UgFYsjoeS1PdnDNTAscRSK3NWa4dBoD0tk5gdUxFttXcJUUdJiOwQjydD2rz
         TzckTSbykXkI8SmHL5NK/i7I2PpJE/yyPGGExg7XkntappZqsHZotwTGIUjQxFRxQ+cI
         ki9MJR7YgfYyOXfgv83uQ6LvDstB/3yM/ViLnWtlVwXyaWAXzgxoQDUZUXVhfY/tgKki
         f7CTaDyKXVnlRBFLeW020FJZN/Zq5x3Gu6QqpaypFPesXT5eNf8TBLh9Q/zKFcl9mjzT
         Jp9psY4SfzOuQPT/ukkkr9Esnyg9hwhaI3djPKrWUUJr/FcwUOFJQnPmBiazLen2Taih
         gFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697762294; x=1698367094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H40udxrnn6fdY9pib9PfDMy1TSaBomffUjfkk2BSewI=;
        b=BKiVspVYk5WH+U2HyHkw3PwBFtZu8Ofskr7mXOHoWgbeaQjOZ3vMKjl5yoemkn/31O
         x58qxzVCdX99+eKils286p3dMcCOocahnnJJ0EWbmk5fhOUpylYaBuVh1q+vSd+JG148
         HIAOPAPEXcuez2/ejnRp1JePg2NMcw42VuHltZuidcqdfPRKlPLUj1TDQYyWfPMQYYNE
         jZW5WZwDunYTvM6YKkspREIEkQEZdnma1LABXLOeY5l/hN0+FqO/dqrlLli7jWcYrRRo
         P0+z3ZpMe+vAQrqUCxhyzKREz6uoq3f1bChn/JTL2JKdv3MrRTZDjh89LmX+LZEH8fm6
         3x3w==
X-Gm-Message-State: AOJu0YxZye0caxTYDfm0bIaBBcF4f+R5lhMCKqClMOSRRdhP1lGe2nyz
	mzK1lL3fhI4wbHwWduPpsCwBEBwu8hc=
X-Google-Smtp-Source: AGHT+IELL9viuq8UdFZWvwSbupP45GkAT2WZYjJlTmGqxOPsDTd4Blod3iQrgTe1E56Y3r+imx7ll3zjC1c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:bc6:b0:6b5:a01f:f7fb with SMTP id
 x6-20020a056a000bc600b006b5a01ff7fbmr7196pfu.6.1697762294368; Thu, 19 Oct
 2023 17:38:14 -0700 (PDT)
Date: Thu, 19 Oct 2023 17:38:12 -0700
In-Reply-To: <47c8a177d81762e0561fc47cc274076de901edbf.1696926843.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1696926843.git.isaku.yamahata@intel.com> <47c8a177d81762e0561fc47cc274076de901edbf.1696926843.git.isaku.yamahata@intel.com>
Message-ID: <ZTHL9NQ87LNdB8qk@google.com>
Subject: Re: [PATCH 09/12] KVM: X86: Add debugfs to inject machine check on VM exit
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 10, 2023, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> The KVM/x86 handles machine-check in the guest specially.  It sets up the
> guest so that vcpu exits from running guests, checks the exit reason and,
> manually raises the machine check by calling do_machine_check().
> 
> To test the KVM machine check execution path, KVM wants to inject the
> machine check in the context of vcpu instead of the context of the process
> of MCE injection.  Wire up the MCE injection framework for KVM to trigger
> MCE in the vcpu context.  Add a kvm vcpu debugfs entry for an operator to
> tell KVM to inject MCE.

But this isn't "injecting" a #MC, it's just having KVM call do_machine_check()
before enabling IRQs after a VM-Exit.  I don't see how that is interesting enough
to warrant a dedicated knob and code in KVM's run loop.

> @@ -10814,6 +10823,11 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>  		fpu_sync_guest_vmexit_xfd_state();
>  
>  	static_call(kvm_x86_handle_exit_irqoff)(vcpu);
> +	if (unlikely(req_mce_inject)) {
> +		mce_call_atomic_injector_chain(smp_processor_id());
> +		kvm_machine_check();
> +		mce_inject_unlock();
> +	}
>  
>  	if (vcpu->arch.guest_fpu.xfd_err)
>  		wrmsrl(MSR_IA32_XFD_ERR, 0);
> -- 
> 2.25.1
> 
