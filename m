Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2520E4D8D85
	for <linux-coco@lists.linux.dev>; Fri,  5 Jun 2026 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658431; cv=none; b=nyLsCgDK02AFLRvHMv4acDQubRC5vD9fbIpzPudDv6uDNgHD2kwiYQFd3OUPnw/RaAP7VwYMQeNqgu6ehAMlJuNyLWPCtEQa2SxsFXWV5p1CIDklwf+RwCCYv+nQEHuOTWihVZkjaG5iJpxrKhG18MTsaLEeYG5NtVpqdrsTXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658431; c=relaxed/simple;
	bh=x0UYxgYNv6TD6Wlw2FfxY0+ckKC90VlYJ2Ty2LB51yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9UtCTIMrRgw0bt386Z7TeEPYVFG28ufCQBAu7iZPNMVEp661W/4eIlQbI3BXYMCtsY3uFFoiHmm2gfha3M92LRx4r3kM0t+XA1hP6Pp3MlTOmzQ6gG5QYc4q6O6o8cwM8QZLBb+WE7d2L+7u9Scis6fimWZx18KY3jAZJBD/Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NQst+ned; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQst+ned"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780658428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M+dHNKFMVBkDdICjg2Muej8aIFbwcMiW4DpFYR49CkI=;
	b=NQst+nedkCx5EBACavuTEYwl5fdcsVCvHNGRmBOs2S5+QnDNwUfcjHxgxAV6aLpCTpAkAo
	155lKHETS6LRBxfRI9+0xO9qctfZxPVbGUV9IKmQtI4NRu4IHw/K7NLSJuerZQTt01NtCe
	3JPteZmSK5LlE4UceS6v+KUDh0LQy7s=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-hkEcLVRLN2ancp4aX0NxlQ-1; Fri, 05 Jun 2026 07:20:27 -0400
X-MC-Unique: hkEcLVRLN2ancp4aX0NxlQ-1
X-Mimecast-MFC-AGG-ID: hkEcLVRLN2ancp4aX0NxlQ_1780658426
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842b0dd8107so561253b3a.0
        for <linux-coco@lists.linux.dev>; Fri, 05 Jun 2026 04:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658426; x=1781263226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+dHNKFMVBkDdICjg2Muej8aIFbwcMiW4DpFYR49CkI=;
        b=LeLrQHpnphLP5wnJtnzYDAiUneeJfpguHuxzUcLbdxPzzV+/T4KMJM7579sJhg3nvf
         H6T7s3Q7oSuZCCI6Nij8YaPGHL47zu9+K+rNqsobPGWObneWVzH62BZIaK0VPT5BayBx
         cKfH/3UITbCaUebsQVtLhDCexpr6VIq6P8xwZySXWvuOPLi2yXb612g6g0P95NiwzTru
         PfeeP8rxxQrNESE44PUYQxPbVi1ZU+vBUOB9al6wTnICllJtWtGdydjwRomAKA8cImcM
         I/+zwd2rn8f3mIBTLNCV5F2DendqgNUEQbSCp+EtxWN8NpXZmVQNBmTiVVJkh8TslxuY
         KEpg==
X-Forwarded-Encrypted: i=1; AFNElJ/FxCo5vMgrMpWY5QN/s0b2faFsGYMtX7lIYUxT8Bqrv+wqK8hGNopWG9Or30DshY95QDjgldH9aUCg@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3hnzLR9AsYCPH/Kv78wmdoB66DAwgnS74zypZhSwGJIOBTFfz
	AugiygP4u67c4yVu1D7O01pAAhhVXw29B74I0NCbqm8LgMJLJ02ssMfpLSUT4p3i8OXqDIA+eWq
	ujgXUmPQ08waqEMPC9+OflEDpEzdCCmUgPlCoH6hu1lpncfBlSBD+dCnrbaMW/DM=
X-Gm-Gg: Acq92OGiaW+G5avHNxAjfsatFXvJLTbjo/zwuuiEcJXeENS46q0XAVyCMqml8GLYBNo
	A+RwYVWDEraul2sbB10vPj0FTNy6i4Xk16lIX42RdYUCXMCj8KXM9ZnhLS43psOLtK3Zi0cPR0j
	swEmnvTpMjc3+WuFRnd5XdoshdxEOZiiuVf6iK6htbwcDPWxuEdiNTh68NmnDrote/zIaALiyWX
	mGzIzCooU2O/WJBfloAAy/sS3c4VN7yXi16tZaJsVo24HQplnEzEQNpVwaeIXpdlohdbadTiWA4
	9C9nnhBt8EZpGbxXZqJTGFJAErOlAFLwsgR+Me7aXua95HgqTyA7125j9ULC4BZwAbn/kZASLFm
	7H6t5cfc2YoLkt2sUTKz8X5LvXS5MYEOWvKdj5ZYdYEfevFhhJr3o9SahWMxWICl+c7UOTRqqFl
	0=
X-Received: by 2002:a05:6a00:2351:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-842b0f52eefmr3355873b3a.27.1780658425882;
        Fri, 05 Jun 2026 04:20:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:2351:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-842b0f52eefmr3355817b3a.27.1780658425323;
        Fri, 05 Jun 2026 04:20:25 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282880050sm8756478b3a.29.2026.06.05.04.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 04:20:24 -0700 (PDT)
Message-ID: <d08ca4d6-1e7c-473d-909e-89642bd8c4c2@redhat.com>
Date: Fri, 5 Jun 2026 21:20:14 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 29/44] arm64: RMI: Runtime faulting of memory
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-30-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-30-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bX3-QxS3NsMY0UhdRK7jHDpK33Hfpm2nCuOSIqP526M_1780658426
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Steve,

On 5/13/26 11:17 PM, Steven Price wrote:
> At runtime if the realm guest accesses memory which hasn't yet been
> mapped then KVM needs to either populate the region or fault the guest.
> 
> For memory in the lower (protected) region of IPA a fresh page is
> provided to the RMM which will zero the contents. For memory in the
> upper (shared) region of IPA, the memory from the memslot is mapped
> into the realm VM non secure.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v13:
>   * Numerous changes due to rebasing.
>   * Fix addr_range_desc() to encode the correct block size.
> Changes since v12:
>   * Switch to RMM v2.0 range based APIs.
> Changes since v11:
>   * Adapt to upstream changes.
> Changes since v10:
>   * RME->RMI renaming.
>   * Adapt to upstream gmem changes.
> Changes since v9:
>   * Fix call to kvm_stage2_unmap_range() in kvm_free_stage2_pgd() to set
>     may_block to avoid stall warnings.
>   * Minor coding style fixes.
> Changes since v8:
>   * Propagate the may_block flag.
>   * Minor comments and coding style changes.
> Changes since v7:
>   * Remove redundant WARN_ONs for realm_create_rtt_levels() - it will
>     internally WARN when necessary.
> Changes since v6:
>   * Handle PAGE_SIZE being larger than RMM granule size.
>   * Some minor renaming following review comments.
> Changes since v5:
>   * Reduce use of struct page in preparation for supporting the RMM
>     having a different page size to the host.
>   * Handle a race when delegating a page where another CPU has faulted on
>     a the same page (and already delegated the physical page) but not yet
>     mapped it. In this case simply return to the guest to either use the
>     mapping from the other CPU (or refault if the race is lost).
>   * The changes to populate_par_region() are moved into the previous
>     patch where they belong.
> Changes since v4:
>   * Code cleanup following review feedback.
>   * Drop the PTE_SHARED bit when creating unprotected page table entries.
>     This is now set by the RMM and the host has no control of it and the
>     spec requires the bit to be set to zero.
> Changes since v2:
>   * Avoid leaking memory if failing to map it in the realm.
>   * Correctly mask RTT based on LPA2 flag (see rtt_get_phys()).
>   * Adapt to changes in previous patches.
> ---
>   arch/arm64/include/asm/kvm_emulate.h |   8 ++
>   arch/arm64/include/asm/kvm_rmi.h     |  12 ++
>   arch/arm64/kvm/mmu.c                 | 128 ++++++++++++++++----
>   arch/arm64/kvm/rmi.c                 | 173 +++++++++++++++++++++++++++
>   4 files changed, 301 insertions(+), 20 deletions(-)
> 

[...]

> @@ -1604,27 +1641,52 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>   	bool write_fault, exec_fault;
>   	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>   	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> -	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
> +	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> +	gpa_t gpa = kvm_gpa_from_fault(vcpu->kvm, s2fd->fault_ipa);
>   	unsigned long mmu_seq;
>   	struct page *page;
> -	struct kvm *kvm = s2fd->vcpu->kvm;
> +	struct kvm *kvm = vcpu->kvm;
>   	void *memcache;
>   	kvm_pfn_t pfn;
>   	gfn_t gfn;
>   	int ret;
>   
> -	memcache = get_mmu_memcache(s2fd->vcpu);
> -	ret = topup_mmu_memcache(s2fd->vcpu, memcache);
> +	if (kvm_is_realm(vcpu->kvm)) {
> +		/* check for memory attribute mismatch */
> +		bool is_priv_gfn = kvm_mem_is_private(kvm, gpa >> PAGE_SHIFT);
> +		/*
> +		 * For Realms, the shared address is an alias of the private
> +		 * PA with the top bit set. Thus if the fault address matches
> +		 * the GPA then it is the private alias.
> +		 */
> +		bool is_priv_fault = (gpa == s2fd->fault_ipa);
> +
> +		if (is_priv_gfn != is_priv_fault) {
> +			kvm_prepare_memory_fault_exit(vcpu, gpa, PAGE_SIZE,
> +						      kvm_is_write_fault(vcpu),
> +						      false,
> +						      is_priv_fault);
> +			/*
> +			 * KVM_EXIT_MEMORY_FAULT requires an return code of
> +			 * -EFAULT, see the API documentation
> +			 */
> +			return -EFAULT;
> +		}
> +	}
> +

For a Realm, gmem_abort() is called by kvm_handle_guest_abort() only when
we're faulting in the private (protected) space.

     if (kvm_slot_has_gmem(memslot) && !shared_ipa_fault(vcpu->kvm, fault_ipa))
         ret = gmem_abort(&s2fd);
     else
         ret = user_mem_abort(&s2fd);

With the condition, this block of code can be simplied to handle conversion
(shared -> private) instead of both directions.

     /* Convert the shared address to the private adress for Realm */
     if (kvm_is_realm(vcpu->kvm) &&
         !kvm_mem_is_private(kvm, gpa >> PAGE_SHIFT)) {
         /*
          * KVM_EXIT_MEMORY_FAULT requires an return code of
          * -EFAULT, see the API documentation
          */
         kvm_prepare_memory_fault_exit(vcpu, gpa, PAGE_SIZE,
                                       kvm_is_write_fault(vcpu),
                                       false, true);
         return -EFAULT;
     }


[...]

> @@ -2396,7 +2475,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>   				!write_fault &&
>   				!kvm_vcpu_trap_is_exec_fault(vcpu));
>   
> -		if (kvm_slot_has_gmem(memslot))
> +		if (kvm_slot_has_gmem(memslot) && !shared_ipa_fault(vcpu->kvm, fault_ipa))
>   			ret = gmem_abort(&s2fd);
>   		else
>   			ret = user_mem_abort(&s2fd);
gmem_abort() is only called for faults in the protected (private) space.

Thanks,
Gavin

