Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BCF3FCD
	for <linux-coco@lists.linux.dev>; Wed,  1 Sep 2021 21:31:56 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id fs6so520743pjb.4
        for <linux-coco@lists.linux.dev>; Wed, 01 Sep 2021 14:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aaYeejJ6cOvT3NBo0uptkAHk+aIFXmuGOzaZeZUh/h0=;
        b=QdJF/B3nnfskavWSI2ucIsQN8uE7AnobJT0PDR6nt9Au507gR+neX4sZYP5I7j7j55
         dFxjEZjNRMDIalfc4ir4dnEx33E2zxU2rxwtng0b+8G3Tye40u8CeC5QPbd5cUwahwGd
         rf1/T15e9Q51v3V5NuYyy3jMXsibgicAfvRHuzOVD0XoSXTbR6thDGg68rHD48BvU80g
         Rp3N/eGLBcVFdm9iV79ribD2VdViPXkzdbxdOOdJGcpOTkwLEGwFWbJOzySuNwLop/Af
         o5Uzmw97mXib9yezGGbs7qC/WtjuWguRrQMO5F0lZIz5jPPJ5A/NYiF+eNNYEImx1F19
         1O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aaYeejJ6cOvT3NBo0uptkAHk+aIFXmuGOzaZeZUh/h0=;
        b=fJ9wfblltE+QMxs9aJ78O7bSrCTr9i3xtIZvkQvCaPTU8eCBz1sCCduklXrvq/6igv
         UXVFaAnc81nFHEVStxuxLmRt+GMp+mcw0/+Sp72nuVteYImiZLks1FFmGwjWzejL0QJG
         Lv2J9sBexIDi/054ZL2EtPz7lzZtoK6gnc5Z1Qvc9RshwNyMhJDMRgxJ+sQ/ErQ9B5ak
         xA9jAPnp1n/6fXYH2Mz/v3lo8g+U65Ey6MC6j+26ymuT9AlsMTzdEMqjVJ9g4CfmUZGY
         tDMhoAGtgJhjLqah0NhjlQPAriuq+4EFT47bR99ZUECkb9kP4BKSwN2iU5sP9fqT/xHL
         F2Hw==
X-Gm-Message-State: AOAM533scmVI+/ED4X8ClP2ULvgNpv9yQYIsNb1L6+RRxb1y5eXBJ3JZ
	4v7p1pdkVckZL4h/+W2YpSEXUA==
X-Google-Smtp-Source: ABdhPJwDukIRczVM4dnJcRc34WtWg8nUxyyJwAQ2lRZFN3Q2WzrKL1oCMCTwZJf87EdKtbvXRgjibA==
X-Received: by 2002:a17:902:ce84:b0:138:9422:512e with SMTP id f4-20020a170902ce8400b001389422512emr1333007plg.12.1630531916126;
        Wed, 01 Sep 2021 14:31:56 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id e16sm380850pfl.58.2021.09.01.14.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 14:31:55 -0700 (PDT)
Date: Wed, 1 Sep 2021 21:31:52 +0000
From: Sean Christopherson <seanjc@google.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v2 1/4] KVM: SVM: Get rid of *ghcb_msr_bits() functions
Message-ID: <YS/xSIvhS5GySXlQ@google.com>
References: <20210722115245.16084-1-joro@8bytes.org>
 <20210722115245.16084-2-joro@8bytes.org>
 <YS/sqmgbS6ACRfSD@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS/sqmgbS6ACRfSD@google.com>

On Wed, Sep 01, 2021, Sean Christopherson wrote:
> > -static u64 get_ghcb_msr_bits(struct vcpu_svm *svm, u64 mask, unsigned int pos)
> > -{
> > -	return (svm->vmcb->control.ghcb_gpa >> pos) & mask;
> > +	msr  = GHCB_MSR_CPUID_RESP;
> > +	msr |= (reg & GHCB_MSR_CPUID_REG_MASK) << GHCB_MSR_CPUID_REG_POS;
> > +	msr |= (value & GHCB_MSR_CPUID_VALUE_MASK) << GHCB_MSR_CPUID_VALUE_POS;
> > +
> > +	svm->vmcb->control.ghcb_gpa = msr;
> 
> I would rather have the get/set pairs be roughly symmetric, i.e. both functions
> or both macros, and both work on svm->vmcb->control.ghcb_gpa or both be purely
> functional (that may not be the correct word).
> 
> I don't have a strong preference on function vs. macro.  But for the second one,
> my preference would be to have the helper generate the value as opposed to taken
> and filling a pointer, e.g. to yield something like:
> 
> 		cpuid_reg = GHCB_MSR_CPUID_REG(control->ghcb_gpa);
> 
> 		if (cpuid_reg == 0)
> 			cpuid_value = vcpu->arch.regs[VCPU_REGS_RAX];
> 		else if (cpuid_reg == 1)
> 			cpuid_value = vcpu->arch.regs[VCPU_REGS_RBX];
> 		else if (cpuid_reg == 2)
> 			cpuid_value = vcpu->arch.regs[VCPU_REGS_RCX];
> 		else
> 			cpuid_value = vcpu->arch.regs[VCPU_REGS_RDX];
> 
> 		control->ghcb_gpa = MAKE_GHCB_MSR_RESP(cpuid_reg, cpuid_value);
> 
> 
> The advantage is that it's obvious from the code that control->ghcb_gpa is being
> read _and_ written.

Ah, but in the next path I see there's the existing ghcb_set_sw_exit_info_2().
Hrm.  I think I still prefer open coding "control->ghcb_gpa = ..." with the right
hand side being a macro.  That would gel with the INFO_REQ, e.g.

	case GHCB_MSR_SEV_INFO_REQ:
		control->ghcb_gpa = GHCB_MSR_SEV_INFO(GHCB_VERSION_MAX,
						      GHCB_VERSION_MIN,
						      sev_enc_bit));
		break;

and drop set_ghcb_msr() altogether.

Side topic, what about renaming control->ghcb_gpa => control->ghcb_msr so that
the code for the MSR protocol is a bit more self-documenting?  The APM defines
the field as "Guest physical address of GHCB", so it's not exactly prescribing a
specific name.
