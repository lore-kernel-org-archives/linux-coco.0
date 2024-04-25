Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2B76AC2
	for <linux-coco@lists.linux.dev>; Thu, 25 Apr 2024 00:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003837; cv=none; b=HmQrrDxP1fgkgu4gfW4Sy6I/ukuGtcc7ucq7mcvSe/5EZZvZgqjWtteV+mMUy8/K6+FPWpBIlB0XqBdbqv4ZKhRLYtR+uYVjGGCtW0vEYO2co0aiUdkv8vNW0Dub2RiQhyfUY/RLQLhOT2PsH2RschkQ0OAX/5+My3n2riAfgOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003837; c=relaxed/simple;
	bh=4olyWBhbURGb211ubhYVBSsTHwRpqR+5x91FGXsu6m0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DaEhnrD9B7LYXXREmo2kvvgAV/YMStP8nl/gZQymtsnAvgWnmoLSU/NBP890Q0oqOFqDmirGVXFg0EFCB4K2VaGvFhHkqlAfodUw5RuWK/PK55LPNqVsvzfldMWv29OVnln6qp4eRAhFbGMOUQkRo7t91GH/oVgdDHc6hERfFCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nFO941cX; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nFO941cX"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-60361c6fa70so453626a12.3
        for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 17:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714003834; x=1714608634; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5N7e8KrpK+QWo2qlcDE/Q43TLjk+9JOMfjvUXwfuODw=;
        b=nFO941cX1FGJfAVYG4AQl8hEABs3AP/zY83pjHP5nuG2+f7v3EnSFz+Us3+FdtMfR3
         yN21AD9My8yBnYBj429Opu2z03xKklLFRCnCvtQr1gXGnhPCbpj4+Jxqpa49tRSj028i
         6qMV+OhGqRkdnNojPHZhlriYHzDFYSuD0R4nIcwdq0UFqNO+W/mfZceS5MZmHnH9zyUZ
         W0H/Cev1/0q9tHxlu00a+ojgyq7BkLq8+cBGC6s7ZscZ8/2QNFToQs/p3gP3gNeEgS1A
         rPdzt2QOupF0ndYGiv/zLV8c4NDkhnBjhO5xZHuXxwhehN+Tk9Xl//5XLHE2UTKh1FEO
         R6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714003834; x=1714608634;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5N7e8KrpK+QWo2qlcDE/Q43TLjk+9JOMfjvUXwfuODw=;
        b=BqZwamvEt7F0MBsgmCk0DDQi7jn5i1zWG0Y+RXcS1/yAYKL9eFqfk/A1atPka+UY4k
         AiNckqNugA+/PYSRwtvmsQcz/zJGRKFFr9uoPlFn5gWSob56DI7RVg/bKd1Qq9n9j+18
         tixUoAaU8YbPY/ADNVvVBRIArQ2ssGC+Yjh06MlOYLkTwUNUSfkAvL/iaknlI2AK12gh
         nfhHEmfmx5ay429Aye3Tm4bllxONnYSv+PlsNdch5Vd9if7ZcWB7OdmJXoUeATIdRTfl
         Wua9xjmrcp8/X48/lyLJq8lTihkhhAjM2sHgacyZDjdK/rphK88/jVvNos0JeubRIEor
         FbZg==
X-Forwarded-Encrypted: i=1; AJvYcCVjKA/87EfqVI4r2gTqheT/YudpTyO+KkOkw072C5QI2+08lMT9IAHuP+lqcAs2BBPimSA0umtSyK6zzmrcnzgpNIWf32OV54UyqQ==
X-Gm-Message-State: AOJu0YwVtRL2juebI7CHFVWXdW657uzrV/tUh+sYZseUCmlyMlF3vsqm
	3bUZW7OPc3CeisxNuZVC0VpDloZ+CZ2wvqbr5TdcxUV7AoYuZ3ojqrfrOG1yYybppOret2mldqq
	z6w==
X-Google-Smtp-Source: AGHT+IFH7YJejg8aWF910482kJMDW7kl7X1aXoPxYZwY3TSrYpuIPMQ5VJ886sB92FreyvdaA+vS2YP1euA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:1d2:0:b0:5dc:8f95:3d with SMTP id
 201-20020a6301d2000000b005dc8f95003dmr31874pgb.2.1714003833568; Wed, 24 Apr
 2024 17:10:33 -0700 (PDT)
Date: Wed, 24 Apr 2024 17:10:31 -0700
In-Reply-To: <20240421180122.1650812-23-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240421180122.1650812-1-michael.roth@amd.com> <20240421180122.1650812-23-michael.roth@amd.com>
Message-ID: <Zimfdyhq3U2HVX0N@google.com>
Subject: Re: [PATCH v14 22/22] KVM: SEV: Provide support for
 SNP_EXTENDED_GUEST_REQUEST NAE event
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
	pankaj.gupta@amd.com, liam.merwick@oracle.com
Content-Type: text/plain; charset="us-ascii"

On Sun, Apr 21, 2024, Michael Roth wrote:
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 85099198a10f..6cf186ed8f66 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -7066,6 +7066,7 @@ values in kvm_run even if the corresponding bit in kvm_dirty_regs is not set.
>  		struct kvm_user_vmgexit {
>  		#define KVM_USER_VMGEXIT_PSC_MSR	1
>  		#define KVM_USER_VMGEXIT_PSC		2
> +		#define KVM_USER_VMGEXIT_EXT_GUEST_REQ	3

Assuming we can't get massage this into a vendor agnostic exit, there's gotta be
a better name than EXT_GUEST_REQ, which is completely meaningless to me and probably
most other people that aren't intimately familar with the specs.  Request what?

>  			__u32 type; /* KVM_USER_VMGEXIT_* type */
>  			union {
>  				struct {
> @@ -3812,6 +3813,84 @@ static void snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp
>  	ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, SNP_GUEST_ERR(vmm_ret, fw_err));
>  }
>  
> +static int snp_complete_ext_guest_req(struct kvm_vcpu *vcpu)
> +{
> +	struct vcpu_svm *svm = to_svm(vcpu);
> +	struct vmcb_control_area *control;
> +	struct kvm *kvm = vcpu->kvm;
> +	sev_ret_code fw_err = 0;
> +	int vmm_ret;
> +
> +	vmm_ret = vcpu->run->vmgexit.ext_guest_req.ret;
> +	if (vmm_ret) {
> +		if (vmm_ret == SNP_GUEST_VMM_ERR_INVALID_LEN)
> +			vcpu->arch.regs[VCPU_REGS_RBX] =
> +				vcpu->run->vmgexit.ext_guest_req.data_npages;
> +		goto abort_request;
> +	}
> +
> +	control = &svm->vmcb->control;
> +
> +	/*
> +	 * To avoid the message sequence number getting out of sync between the
> +	 * actual value seen by firmware verses the value expected by the guest,
> +	 * make sure attestations can't get paused on the write-side at this
> +	 * point by holding the lock for the entire duration of the firmware
> +	 * request so that there is no situation where SNP_GUEST_VMM_ERR_BUSY
> +	 * would need to be returned after firmware sees the request.
> +	 */
> +	mutex_lock(&snp_pause_attestation_lock);

Why is this in KVM?  IIUC, KVM only needs to get involved to translate GFNs to
PFNs, the rest can go in the sev-dev driver, no?  The whole split is weird,
seemingly due to KVM "needing" to take this lock.  E.g. why is core kernel code
in arch/x86/virt/svm/sev.c at all dealing with attestation goo, when pretty much
all of the actual usage is (or can be) in sev-dev.c

> +
> +	if (__snp_transaction_is_stale(svm->snp_transaction_id))
> +		vmm_ret = SNP_GUEST_VMM_ERR_BUSY;
> +	else if (!__snp_handle_guest_req(kvm, control->exit_info_1,
> +					 control->exit_info_2, &fw_err))
> +		vmm_ret = SNP_GUEST_VMM_ERR_GENERIC;
> +
> +	mutex_unlock(&snp_pause_attestation_lock);
> +
> +abort_request:
> +	ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, SNP_GUEST_ERR(vmm_ret, fw_err));
> +
> +	return 1; /* resume guest */
> +}
> +
> +static int snp_begin_ext_guest_req(struct kvm_vcpu *vcpu)
> +{
> +	int vmm_ret = SNP_GUEST_VMM_ERR_GENERIC;
> +	struct vcpu_svm *svm = to_svm(vcpu);
> +	unsigned long data_npages;
> +	sev_ret_code fw_err;
> +	gpa_t data_gpa;
> +
> +	if (!sev_snp_guest(vcpu->kvm))
> +		goto abort_request;
> +
> +	data_gpa = vcpu->arch.regs[VCPU_REGS_RAX];
> +	data_npages = vcpu->arch.regs[VCPU_REGS_RBX];
> +
> +	if (!IS_ALIGNED(data_gpa, PAGE_SIZE))
> +		goto abort_request;
> +
> +	svm->snp_transaction_id = snp_transaction_get_id();
> +	if (snp_transaction_is_stale(svm->snp_transaction_id)) {

Why bother?  I assume this is rare, so why not handle it on the backend, i.e.
after userspace does its thing?  Then KVM doesn't even have to care about
checking for stale IDs, I think?

None of this makes much sense to my eyes, e.g. AFAICT, the only thing that can
pause attestation is userspace, yet the kernel is responsible for tracking whether
or not a transaction is fresh?
