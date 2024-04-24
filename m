Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C741156F4E
	for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 21:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713994808; cv=none; b=tV95UXrk754jMv+FpDL+FIbMPQFOuPWnt1EgA6OT/+QpRoHj3NJIjL6tTq5ccqTFTyPjGQcPh03SdT606klQq8LjEI/CVdVrgI1tOXwZLX5fD/NhBVSo/YPUowCKgeINKWn26e1EIG1lcisEtJwKYn4KETHzX2egY3CfckUe5X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713994808; c=relaxed/simple;
	bh=muB/GrtMuyvIZL1gTqcuCa6Ri679P3tYV/yG2XVXejE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bFLtCdiMVJuBShVG66G5HepnBquWC+Eun5g4MqR8pr55gvItlubQS/cGseaZiz/QsJNVmiL6dnAVNE8HrRU7Nq4gLpLvGYtDmYUl0/AJNX5ywEfXs8RBHhUkKGW4gisemrsLUS9Tc4u6lCgtRYPIxcWynzukiUeDqRP7ZHYUARA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h4c8CmAy; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h4c8CmAy"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dbe9e13775aso698855276.1
        for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 14:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713994804; x=1714599604; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I1EKZolXdPYAzbRipKSJPkUCjMZ4Y7QNaYncgFsTwr8=;
        b=h4c8CmAy1LjS2yoWT4J9cB/mUhyRkAgWwcuUTtiExLCJOSELzqd7KZTIokXmK6Sk0x
         0rVWBjcnf54E9x7jyyJKJ1gRhNRG/oVD4nFtoqqgRPQA+OYddLvdXieNv/2+SkY0jddP
         60qDFUb4zccdV4NAjiaFfvxsD9wo4dUOKu1ly+W7A5qz6dwGujhlNITF9FTsLRccrf/T
         OFUd7bodG5fE2ho545t8coHFyzwV9LGlAarHxqkarb0+rPAQAULjrPDJfO4l5kmkdr6p
         qQAPeKQoiJcuDHETSRxWY9fxvWOe4xwgGnza8uGQYM3Wv/i42hT62xecl5teaEgSvuFD
         1cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713994804; x=1714599604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1EKZolXdPYAzbRipKSJPkUCjMZ4Y7QNaYncgFsTwr8=;
        b=I6TvY4VLCcbN5MC2jcEITtkcgp2Es25+Yfbj94jJheFS3gURxG8CrCqrgb6UTw6Swk
         T0VCHmYhycyW4MB/pdTR0OuvLIadSzjk5VA68oaHGrIxrWNMGlu1LtshUqd4L2XcK7P1
         S2HRG6+g3/0k2JMk4HBCjkFNuYJWw+pclx100wV7djorkzetfovQe9G4BwFL6BcmRkXA
         /8h2UOfFIYkXjgzIrqXydr07Ml0a4UIeOucH2E621+RWN0d+VYQ1jubVGZ73Hmm4YngG
         R4j7OPeQ/XmYbB/3eDbudwnX7yxYAeefeN826XbxPfwka2PPgAf0LblQQ53YZvmwqhpH
         l+/A==
X-Forwarded-Encrypted: i=1; AJvYcCX4RFu0hkDM6ObYS/mAvmAI3D3faP9bmKzwbMBtg0D2rXhJjO9SwAKkKpCttH7lRbplIR4mpOVDH0tsUXYt8WEN05Hm2qgphlYQoA==
X-Gm-Message-State: AOJu0YxRJpxmKWD199R/Iy3XmG3tImiUXKkA+pV2oWoPkGzLVG3R9/J1
	MDX9lGdseWil5Epu2xqxF2Fcte9TK+hlitio+vnNh3B1qq0ehgdVPCaq8nDVOlo8ylnk84cmrUs
	fwQ==
X-Google-Smtp-Source: AGHT+IHBpn1SOBbV7drc58TxI6npqIiVI1VLzloAxa/Hpo4e1kwyTXpiUjL14BLYZcy0Z92zCwnow659/2U=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:708:b0:dcb:e4a2:1ab1 with SMTP id
 k8-20020a056902070800b00dcbe4a21ab1mr1134066ybt.11.1713994804317; Wed, 24 Apr
 2024 14:40:04 -0700 (PDT)
Date: Wed, 24 Apr 2024 14:40:02 -0700
In-Reply-To: <20240418194133.1452059-10-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240418194133.1452059-1-michael.roth@amd.com> <20240418194133.1452059-10-michael.roth@amd.com>
Message-ID: <Zil8MnPXkCbqw3Ka@google.com>
Subject: Re: [PATCH v13 09/26] KVM: SEV: Add KVM_SEV_SNP_LAUNCH_START command
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
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 18, 2024, Michael Roth wrote:
> +static inline bool sev_version_greater_or_equal(u8 major, u8 minor)
> +{
> +	if (major < SNP_POLICY_API_MAJOR)
> +		return true;
> +
> +	if (major == SNP_POLICY_API_MAJOR && minor <= SNP_POLICY_API_MINOR)
> +		return true;
> +
> +	return false;
> +}
> +
> +static int snp_launch_start(struct kvm *kvm, struct kvm_sev_cmd *argp)
> +{
> +	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> +	struct sev_data_snp_launch_start start = {0};
> +	struct kvm_sev_snp_launch_start params;
> +	u8 major, minor;
> +	int rc;
> +
> +	if (!sev_snp_guest(kvm))
> +		return -ENOTTY;
> +
> +	if (copy_from_user(&params, u64_to_user_ptr(argp->data), sizeof(params)))
> +		return -EFAULT;
> +
> +	/* Don't allow userspace to allocate memory for more than 1 SNP context. */
> +	if (sev->snp_context) {
> +		pr_debug("SEV-SNP context already exists. Refusing to allocate an additional one.\n");

What's the plan with all these printks?   There are far too many in this series.
Some might be useful, but many of them have no business landing upstream.

> +		return -EINVAL;
> +	}
> +
> +	sev->snp_context = snp_context_create(kvm, argp);
> +	if (!sev->snp_context)
> +		return -ENOTTY;
> +
> +	if (params.policy & ~SNP_POLICY_MASK_VALID) {
> +		pr_debug("SEV-SNP hypervisor does not support requested policy %llx (supported %llx).\n",

What does "SEV-SNP hypervisor" even mean?

> +			 params.policy, SNP_POLICY_MASK_VALID);
> +		return -EINVAL;
> +	}
> +
> +	if (!(params.policy & SNP_POLICY_MASK_RSVD_MBO)) {
> +		pr_debug("SEV-SNP hypervisor does not support requested policy %llx (must be set %llx).\n",
> +			 params.policy, SNP_POLICY_MASK_RSVD_MBO);
> +		return -EINVAL;
> +	}
> +
> +	if (params.policy & SNP_POLICY_MASK_SINGLE_SOCKET) {
> +		pr_debug("SEV-SNP hypervisor does not support limiting guests to a single socket.\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!(params.policy & SNP_POLICY_MASK_SMT)) {
> +		pr_debug("SEV-SNP hypervisor does not support limiting guests to a single SMT thread.\n");
> +		return -EINVAL;
> +	}
> +
> +	major = (params.policy & SNP_POLICY_MASK_API_MAJOR);
> +	minor = (params.policy & SNP_POLICY_MASK_API_MINOR);
> +	if (!sev_version_greater_or_equal(major, minor)) {

Why does this need a someone weirdly named helper?  Isn't this just?

	if (major < SNP_POLICY_API_MAJOR ||
	    (major == SNP_POLICY_API_MAJOR && minor < SNP_POLICY_API_MINOR))

> +		pr_debug("SEV-SNP hypervisor does not support requested version %d.%d (have %d,%d).\n",
> +			 major, minor, SNP_POLICY_API_MAJOR, SNP_POLICY_API_MINOR);
> +		return -EINVAL;
> +	}
> +
> +	start.gctx_paddr = __psp_pa(sev->snp_context);
> +	start.policy = params.policy;
> +	memcpy(start.gosvw, params.gosvw, sizeof(params.gosvw));
> +	rc = __sev_issue_cmd(argp->sev_fd, SEV_CMD_SNP_LAUNCH_START, &start, &argp->error);
> +	if (rc) {
> +		pr_debug("SEV_CMD_SNP_LAUNCH_START firmware command failed, rc %d\n", rc);
> +		goto e_free_context;
> +	}
> +
> +	sev->fd = argp->sev_fd;
> +	rc = snp_bind_asid(kvm, &argp->error);
> +	if (rc) {
> +		pr_debug("Failed to bind ASID to SEV-SNP context, rc %d\n", rc);
> +		goto e_free_context;
> +	}
> +
> +	return 0;
> +
> +e_free_context:
> +	snp_decommission_context(kvm);
> +
> +	return rc;
> +}
> +
>  int sev_mem_enc_ioctl(struct kvm *kvm, void __user *argp)
>  {
>  	struct kvm_sev_cmd sev_cmd;
> @@ -1999,6 +2154,15 @@ int sev_mem_enc_ioctl(struct kvm *kvm, void __user *argp)
>  		goto out;
>  	}
>  
> +	/*
> +	 * Once KVM_SEV_INIT2 initializes a KVM instance as an SNP guest, only
> +	 * allow the use of SNP-specific commands.
> +	 */
> +	if (sev_snp_guest(kvm) && sev_cmd.id < KVM_SEV_SNP_LAUNCH_START) {
> +		r = -EPERM;
> +		goto out;
> +	}
> +
>  	switch (sev_cmd.id) {
>  	case KVM_SEV_ES_INIT:
>  		if (!sev_es_enabled) {
> @@ -2063,6 +2227,9 @@ int sev_mem_enc_ioctl(struct kvm *kvm, void __user *argp)
>  	case KVM_SEV_RECEIVE_FINISH:
>  		r = sev_receive_finish(kvm, &sev_cmd);
>  		break;
> +	case KVM_SEV_SNP_LAUNCH_START:
> +		r = snp_launch_start(kvm, &sev_cmd);
> +		break;
>  	default:
>  		r = -EINVAL;
>  		goto out;
> @@ -2258,6 +2425,33 @@ int sev_vm_copy_enc_context_from(struct kvm *kvm, unsigned int source_fd)
>  	return ret;
>  }
>  
> +static int snp_decommission_context(struct kvm *kvm)
> +{
> +	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> +	struct sev_data_snp_addr data = {};
> +	int ret;
> +
> +	/* If context is not created then do nothing */
> +	if (!sev->snp_context)
> +		return 0;
> +
> +	data.address = __sme_pa(sev->snp_context);
> +	down_write(&sev_deactivate_lock);
> +	ret = sev_do_cmd(SEV_CMD_SNP_DECOMMISSION, &data, NULL);
> +	if (WARN_ONCE(ret, "failed to release guest context")) {

WARN here, or WARN in the caller, not both.  And if you warn here, this can be

	down_write(&sev_deactivate_lock);
	ret = sev_do_cmd(SEV_CMD_SNP_DECOMMISSION, &data, NULL);
	up_write(&sev_deactivate_lock);

	if (WARN_ONCE(ret, "..."))

> +		up_write(&sev_deactivate_lock);
> +		return ret;
> +	}
> +
> +	up_write(&sev_deactivate_lock);
> +
> +	/* free the context page now */

This doesn't seem like a particularly useful comment.  What would be useful is
a comment explaining the "decommission" unbinds the ASID.  

> +	snp_free_firmware_page(sev->snp_context);
> +	sev->snp_context = NULL;
> +
> +	return 0;
> +}
> +
>  void sev_vm_destroy(struct kvm *kvm)
>  {
>  	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> @@ -2299,7 +2493,15 @@ void sev_vm_destroy(struct kvm *kvm)
>  		}
>  	}
>  
> -	sev_unbind_asid(kvm, sev->handle);
> +	if (sev_snp_guest(kvm)) {
> +		if (snp_decommission_context(kvm)) {
> +			WARN_ONCE(1, "Failed to free SNP guest context, leaking asid!\n");

WARN on the actually failure, not '1'.  And a newline isn't needed.

		if (WARN_ONCE(snp_decommission_context(kvm)
			      "Failed to free SNP guest context, leaking asid!"))
			return;

> +			return;
> +		}
> +	} else {
> +		sev_unbind_asid(kvm, sev->handle);
> +	}
> +
>  	sev_asid_free(sev);
>  }
>  
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 7f2e9c7fc4ca..0654fc91d4db 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -92,6 +92,7 @@ struct kvm_sev_info {
>  	struct list_head mirror_entry; /* Use as a list entry of mirrors */
>  	struct misc_cg *misc_cg; /* For misc cgroup accounting */
>  	atomic_t migration_in_progress;
> +	void *snp_context;      /* SNP guest context page */
>  };
>  
>  struct kvm_svm {
> -- 
> 2.25.1
> 
