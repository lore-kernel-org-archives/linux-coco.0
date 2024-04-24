Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C016F293
	for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 23:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003097; cv=none; b=JpyMTjvNOGfWEL639pob82x+rBOThLVzuFZb+sNGTCrg7UYzBnb/36NcY3LGOYBboacTb7jUEUxcDBrIt3PKTU0WRbKaeFM35q5o4SUGxHWDHu1orVSFD2DeffiS50qI9ezasNFpOVC63LLPqJ6SbmkzPayAoL5x6L2Aw7fHVro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003097; c=relaxed/simple;
	bh=R0/fOiO9g/dpuvcPamlgbFNlgNdbcJZfjQmEh/9deBI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GmJe1wtj+URZsybADlLJZtvq60GYuk/ItK+mOl37im+dqGcNZN567McIWyFLJ5fobZCqK3b+KpnZkK9Pv0+dThiucXFBtZ1HBeemWWUmueUuPx9mgyDWb97YGuzoX0J4WH4YpeQPSzPntlQWbeQM4JaRbsJDq2cM4ju7nDcsics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Cm7XA2B; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Cm7XA2B"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61b13ce3daaso9079537b3.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 16:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714003095; x=1714607895; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hq8SdlFPWpEwMALVKp560wfcsx2v4HYt4jxDkJ/UaCQ=;
        b=0Cm7XA2BZprjloPC1LR9IiCWzCcxDSDzEmKnt4RQPw7jRPafrtZ6EUqW3TGOPLPGUz
         88+Hpc5m5YoKWwVOZgGlOgAWGXG/j4oWD0FUpr6UXPnuZgoxvFJx1y0vozqX/WS7jNAY
         7/kiqL4YC0v5Gv/TL19objTiAzUVKnvepumBMyTXcgMF0a3FhFMYpCSssJ+tP+SIy5iG
         8LFWi8XfokVErdX/IQPPsnlYbLp+3bbAH1uj9ZF/n5cslilpO8xFwEaHhN3Glo0CYZjh
         J6YLk7iU9OMxN7Kjn+988lmwJqYFzsDoq0nuLfYgRDdNIBQ0nautYg+uUqGWWP5Yo78f
         P1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714003095; x=1714607895;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hq8SdlFPWpEwMALVKp560wfcsx2v4HYt4jxDkJ/UaCQ=;
        b=AJShCv/Pii1dTg06pdfePJVElPCQ85mA+DlAev+TytQ+m2F1FDF8LvuZyIkg+K+6uV
         RYyw1aRwEhGvtrEoe+8DBgMQLQiwOXpIb9MniBaEflAfqFeRSAyktJQg7Dg3ecvSFLA3
         MC64XG998QiRnd0oMuTL2WhFvDCTUT8vCec/WAAloZ/mjMWvsx87GD+0epHCNBNiBszh
         eFOp7SY2NaEi3IaH7YQ2QefUJhD5P3Gga4DMmX84lGkb5YGbajSz5+JI475W2yC1fh8F
         2qKmhrQGNcafaDLNa9LQDNu8cx4c/jnoMA1haL0NDG/lUswMCbyld6tyEQUNgc3Pys/Y
         IANA==
X-Forwarded-Encrypted: i=1; AJvYcCWkGQbZFMvbyyhn7EkP1DP4i6DIyyG2OUy910tHGSS6DYTd1faP7fEbvAyepB/Bj/Af4Dp4XED1YFXgWOHuR9fbW5tEjYCRIoDSng==
X-Gm-Message-State: AOJu0YyfazdegcIjF0leSHuIuiOAOT6uY/DaY5pYWUewCmiW87IhsRkx
	j6MrvscrJP8PY39vDVMN0rFEbRzZq0DNUEo4BVTtDrdCJPUOLFMvsQBASu6WMsAxUW87cP7QvLC
	fnA==
X-Google-Smtp-Source: AGHT+IE5uZLfnqhh3kfhpm2ae2TWAGQslbCCze7Kvv2Uh3gwjGn/xEM7H5pIz2AWmMMjWE7Ke1FVDrC9NQI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b408:0:b0:61a:e8df:4ae7 with SMTP id
 h8-20020a81b408000000b0061ae8df4ae7mr925447ywi.8.1714003095004; Wed, 24 Apr
 2024 16:58:15 -0700 (PDT)
Date: Wed, 24 Apr 2024 16:58:13 -0700
In-Reply-To: <20240421180122.1650812-7-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240421180122.1650812-1-michael.roth@amd.com> <20240421180122.1650812-7-michael.roth@amd.com>
Message-ID: <ZimclfBdk1Y9iKVY@google.com>
Subject: Re: [PATCH v14 06/22] KVM: SEV: Add KVM_SEV_SNP_LAUNCH_UPDATE command
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

On Sun, Apr 21, 2024, Michael Roth wrote:
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 9d08d1202544..d3ae4ded91df 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -258,6 +258,35 @@ static void sev_decommission(unsigned int handle)
>  	sev_guest_decommission(&decommission, NULL);
>  }
>  
> +static int snp_page_reclaim(u64 pfn)
> +{
> +	struct sev_data_snp_page_reclaim data = {0};
> +	int err, rc;
> +
> +	data.paddr = __sme_set(pfn << PAGE_SHIFT);
> +	rc = sev_do_cmd(SEV_CMD_SNP_PAGE_RECLAIM, &data, &err);
> +	if (WARN_ON_ONCE(rc)) {

This now WARNs here *and* in the caller, which is overkill.  Pick one.

> +		/*
> +		 * This shouldn't happen under normal circumstances, but if the
> +		 * reclaim failed, then the page is no longer safe to use.

Explain _why_ it's unsafe.  The code makes it quite clear that reclaim shouldn't
fail.  E.g. I assume it's bound to the ASID still?  Something else?

This is all messy, too.  snp_launch_update_vmsa() does RECLAIM but doesn't
convert the page back to shared, which seems wrong.  sev_gmem_post_populate()
open codes the calls separately, and then snp_cleanup_guest_buf() bundles them
together.

Yeesh, and the return types are all mixed.  snp_cleanup_guest_buf() returns a
bool on success, but the helpers it uses return 0/-errno.  Please convert
everything to return 0/-errno, boolean "error codes" are hard to follow and make
the code unnecessarily brittle.

> +	if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src)) {
> +		ret = -EINVAL;

Just return -EINVAL, no?

> +		goto out;
> +	}
> +
> +	for (gfn = gfn_start, i = 0; gfn < gfn_start + npages; gfn++, i++) {
> +		struct sev_data_snp_launch_update fw_args = {0};
> +		bool assigned;
> +		void *vaddr;
> +		int level;
> +
> +		if (!kvm_mem_is_private(kvm, gfn)) {
> +			pr_debug("%s: Failed to ensure GFN 0x%llx has private memory attribute set\n",
> +				 __func__, gfn);
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		ret = snp_lookup_rmpentry((u64)pfn + i, &assigned, &level);
> +		if (ret || assigned) {
> +			pr_debug("%s: Failed to ensure GFN 0x%llx RMP entry is initial shared state, ret: %d assigned: %d\n",
> +				 __func__, gfn, ret, assigned);
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		if (src) {
> +			vaddr = kmap_local_pfn(pfn + i);
> +			ret = copy_from_user(vaddr, src + i * PAGE_SIZE, PAGE_SIZE);
> +			if (ret) {
> +				pr_debug("Failed to copy source page into GFN 0x%llx\n", gfn);
> +				goto out_unmap;
> +			}
> +		}
> +
> +		ret = rmp_make_private(pfn + i, gfn << PAGE_SHIFT, PG_LEVEL_4K,
> +				       sev_get_asid(kvm), true);
> +		if (ret) {
> +			pr_debug("%s: Failed to mark RMP entry for GFN 0x%llx as private, ret: %d\n",
> +				 __func__, gfn, ret);
> +			goto out_unmap;
> +		}
> +
> +		n_private++;
> +
> +		fw_args.gctx_paddr = __psp_pa(sev->snp_context);
> +		fw_args.address = __sme_set(pfn_to_hpa(pfn + i));
> +		fw_args.page_size = PG_LEVEL_TO_RMP(PG_LEVEL_4K);
> +		fw_args.page_type = sev_populate_args->type;
> +		ret = __sev_issue_cmd(sev_populate_args->sev_fd, SEV_CMD_SNP_LAUNCH_UPDATE,
> +				      &fw_args, &sev_populate_args->fw_error);
> +		if (ret) {
> +			pr_debug("%s: SEV-SNP launch update failed, ret: 0x%x, fw_error: 0x%x\n",
> +				 __func__, ret, sev_populate_args->fw_error);
> +
> +			if (WARN_ON_ONCE(snp_page_reclaim(pfn + i)))
> +				goto out_unmap;
> +
> +			/*
> +			 * When invalid CPUID function entries are detected,
> +			 * firmware writes the expected values into the page and
> +			 * leaves it unencrypted so it can be used for debugging
> +			 * and error-reporting.
> +			 *
> +			 * Copy this page back into the source buffer so
> +			 * userspace can use this information to provide
> +			 * information on which CPUID leaves/fields failed CPUID
> +			 * validation.
> +			 */
> +			if (sev_populate_args->type == KVM_SEV_SNP_PAGE_TYPE_CPUID &&
> +			    sev_populate_args->fw_error == SEV_RET_INVALID_PARAM) {
> +				if (WARN_ON_ONCE(host_rmp_make_shared(pfn + i, PG_LEVEL_4K)))
> +					goto out_unmap;
> +
> +				if (copy_to_user(src + i * PAGE_SIZE, vaddr,
> +						 PAGE_SIZE))
> +					pr_debug("Failed to write CPUID page back to userspace\n");
> +
> +				/* PFN is hypervisor-owned at this point, skip cleanup for it. */
> +				n_private--;

If reclaim or make_shared fails, KVM will attempt make_shared again.  And I am
not a fan of keeping vaddr mapped after making the pfn private.  Functionally
it probably changes nothing, but conceptually it's odd.  And "mapping" is free
(AFAIK).  Oh, and vaddr is subtly guaranteed to be valid based on the type, which
is fun.

So why not unmap immediately after the first copy_from_user(), and then this
can be:


		if (ret)
			goto err;

	}

	return 0;

err:
	if (!<reclaim and make shared>() &&
	    sev_populate_args->type == KVM_SEV_SNP_PAGE_TYPE_CPUID &&
	    sev_populate_args->fw_error == SEV_RET_INVALID_PARAM) {
		vaddr = kmap_local(...);
		copy_to_user(...);
		kunmap_local(vaddr);
	}
	for (i = 0; i < n_private - 1; i++)
		<reclaim? and make shared()>

	return ret;
	
> +                         sev_populate_args->fw_error == SEV_RET_INVALID_PARAM)
> +			}
> +		}
> +
> +out_unmap:
> +		kunmap_local(vaddr);
> +		if (ret)
> +			break;
> +	}
> +
> +out:
> +	if (ret) {
> +		pr_debug("%s: exiting with error ret %d, restoring %d gmem PFNs to shared.\n",
> +			 __func__, ret, n_private);
> +		for (i = 0; i < n_private; i++)
> +			WARN_ON_ONCE(host_rmp_make_shared(pfn + i, PG_LEVEL_4K));
> +	}
> +
> +	return ret;
> +}

...

> +	src = params.type == KVM_SEV_SNP_PAGE_TYPE_ZERO ? NULL : u64_to_user_ptr(params.uaddr);
> +
> +	count = kvm_gmem_populate(kvm, params.gfn_start, src, npages,
> +				  sev_gmem_post_populate, &sev_populate_args);
> +	if (count < 0) {
> +		argp->error = sev_populate_args.fw_error;
> +		pr_debug("%s: kvm_gmem_populate failed, ret %ld (fw_error %d)\n",
> +			 __func__, count, argp->error);
> +		ret = -EIO;
> +	} else if (count <= npages) {

This seems like excessive paranoia.

> +		params.gfn_start += count;
> +		params.len -= count * PAGE_SIZE;
> +		if (params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO)
> +			params.uaddr += count * PAGE_SIZE;
> +
> +		ret = copy_to_user(u64_to_user_ptr(argp->data), &params, sizeof(params))
> +		      ? -EIO : 0;

copy_to_user() failures typically return -EFAULT.  The style is not the most
readable.  Maybe this?

		ret = 0;
		if (copy_to_user(...))
			ret = -EFAULT;

> +	} else {
> +		WARN_ONCE(1, "Completed page count %ld exceeds requested amount %ld",
> +			  count, npages);
> +		ret = -EINVAL;
> +	}
> +
> +out:
> +	mutex_unlock(&kvm->slots_lock);
> +
> +	return ret;
> +}
> +
>  int sev_mem_enc_ioctl(struct kvm *kvm, void __user *argp)
>  {
>  	struct kvm_sev_cmd sev_cmd;
> @@ -2217,6 +2451,9 @@ int sev_mem_enc_ioctl(struct kvm *kvm, void __user *argp)
>  	case KVM_SEV_SNP_LAUNCH_START:
>  		r = snp_launch_start(kvm, &sev_cmd);
>  		break;
> +	case KVM_SEV_SNP_LAUNCH_UPDATE:
> +		r = snp_launch_update(kvm, &sev_cmd);
> +		break;
>  	default:
>  		r = -EINVAL;
>  		goto out;
> -- 
> 2.25.1
> 
