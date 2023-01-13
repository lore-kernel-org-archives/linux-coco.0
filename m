Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82F2115
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 19:11:22 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7BF711EC0518;
	Fri, 13 Jan 2023 20:11:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1673637080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=uSenXaLo6u2BuPearjH6XYMPmRVbj/fPB2X9geCCSBQ=;
	b=N4v11qcO3FHjovvV1c6EaFU2xeyguJlnWDJSyC8w+rf7M4BzksU9+WdDquv+1mHSgLIrOU
	NqaFofzSkjTrLynioeH/8a5rGjWs2RFNEZSKoOHUAp0OTc4JkKP5IlN7DeXV3OGoQIjbsZ
	duvJXqWfKJ71FJkX8JawNxzGZ60iono=
Date: Fri, 13 Jan 2023 20:11:14 +0100
From: Borislav Petkov <bp@alien8.de>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com,
	pgonda@google.com, peterz@infradead.org,
	srinivas.pandruvada@linux.intel.com, rientjes@google.com,
	dovmurik@linux.ibm.com, tobin@ibm.com, vbabka@suse.cz,
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org,
	ashish.kalra@amd.com, harald@profian.com,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH RFC v7 10/64] KVM: SEV: Populate private memory fd during
 LAUNCH_UPDATE_DATA
Message-ID: <Y8Gs0l1k4L96dP5V@zn.tnic>
References: <20221214194056.161492-1-michael.roth@amd.com>
 <20221214194056.161492-11-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221214194056.161492-11-michael.roth@amd.com>

On Wed, Dec 14, 2022 at 01:40:02PM -0600, Michael Roth wrote:
> From: Vishal Annapurve <vannapurve@google.com>
> 
> This change adds handling of HVA ranges to copy contents

s/This change adds handling of/Handle/

> +static int sev_launch_update_priv_gfn_handler(struct kvm *kvm,
> +					      struct kvm_gfn_range *range,
> +					      struct kvm_sev_cmd *argp)
> +{
> +	struct sev_data_launch_update_data data;
> +	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> +	gfn_t gfn;
> +	kvm_pfn_t pfn;
> +	struct kvm_memory_slot *memslot = range->slot;
> +	int ret = 0;
> +
> +	data.reserved = 0;
> +	data.handle = sev->handle;
> +
> +	for (gfn = range->start; gfn < range->end; gfn++) {
> +		int order;
> +		void *kvaddr;
> +
> +		ret = kvm_restricted_mem_get_pfn(memslot, gfn, &pfn, &order);
> +		if (ret)
> +			return ret;
> +
> +		kvaddr = pfn_to_kaddr(pfn);
> +		if (!virt_addr_valid(kvaddr)) {
> +			pr_err("Invalid kvaddr 0x%llx\n", (uint64_t)kvaddr);

Is that some debugging help leftover or what is that printk issued for?

> +			ret = -EINVAL;
> +			goto e_ret;
> +		}
> +
> +		ret = kvm_read_guest_page(kvm, gfn, kvaddr, 0, PAGE_SIZE);
> +		if (ret) {
> +			pr_err("guest read failed 0x%x\n", ret);
> +			goto e_ret;
> +		}
> +
> +		if (!this_cpu_has(X86_FEATURE_SME_COHERENT))

check_for_deprecated_apis: WARNING: arch/x86/kvm/svm/sev.c:602: Do not use this_cpu_has() - use cpu_feature_enabled() instead.

> +			clflush_cache_range(kvaddr, PAGE_SIZE);
> +
> +		data.len = PAGE_SIZE;
> +		data.address = __sme_set(pfn << PAGE_SHIFT);
> +		ret = sev_issue_cmd(kvm, SEV_CMD_LAUNCH_UPDATE_DATA, &data, &argp->error);
> +		if (ret)
> +			goto e_ret;
> +		kvm_release_pfn_clean(pfn);
> +	}
> +	kvm_vm_set_region_attr(kvm, range->start, range->end,
> +		true /* priv_attr */);

No need to break that line.

> +
> +e_ret:
> +	return ret;
> +}
> +
> +static int sev_launch_update_gfn_handler(struct kvm *kvm, struct kvm_gfn_range *range,
> +					 void *data)
> +{
> +	struct kvm_sev_cmd *argp = (struct kvm_sev_cmd *)data;
> +
> +	if (kvm_slot_can_be_private(range->slot))
> +		return sev_launch_update_priv_gfn_handler(kvm, range, argp);
> +
> +	return sev_launch_update_shared_gfn_handler(kvm, range, argp);
> +}
> +
> +static int sev_launch_update_data(struct kvm *kvm,
> +		struct kvm_sev_cmd *argp)
> +{
> +	struct kvm_sev_launch_update_data params;
> +
> +	if (!sev_guest(kvm))
> +		return -ENOTTY;
> +
> +	if (copy_from_user(&params, (void __user *)(uintptr_t)argp->data, sizeof(params)))
> +		return -EFAULT;

Not gonna check those user-supplied values for sanity?

Or is this check

        if (WARN_ON_ONCE(hva_end <= hva_start))
                return -EINVAL;

in kvm_vm_do_hva_range_op() enough?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
