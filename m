Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34345255F28
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 03:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258944; cv=none; b=LHbEVSeEVJbc4tgwF4gkEGtHIMBwh4+7YsarX6wSZYXkXTSSGkV57mBGsHXl2hLEFbniAvYzal7khEwaldGzsg/pUk3B2iXB4qvHVjFtUnIAhqJtMHSHSvBTh17bgFxF+D7O2MZ+TfSwelefPI+28cpJNouEKo0y5qkwWElgddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258944; c=relaxed/simple;
	bh=MxwPZN7n5B2DE8usWq5PQK1nguduFWWGN/sO04w0Ge0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPkpugDYfCMFdxkL7yfZ57FNJIUWku7EG6td7Ij/tOKi8bJYuNrBMTEitXs3+Kcajrpd16sEhegiMDdbmdXB76NQ9QpGwo1pxKDeos0X9P0Y/D8nN02bDSd91OEcPNVcRiTXflgPjiT4Ke/Td6UHgwikJWi5LK60auiHMjhMSok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ItpGY1Vz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ItpGY1Vz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791258942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYC8oY+LrXwAaiDtJ55Vw+0AspCCI39rFIw270qLm/8=;
	b=ItpGY1Vzh3m+9D2TsrsAQklOt4olWR921sfqkz2Uds4Jp8VW7oJdMzSCEtTDGTSb8Bs1t6
	Rs8wTvPZwxyRkUs8f2j84KgZOLE4hx1XtMPaQvPjvK7YmRd9oaMX3rcxRAcYRwWWHNE7BS
	ynr459bGXaoXLNNaiB1QEyIC+6+XawE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-YbrqVgfWMoC4_7WzX21Kqw-1; Mon, 05 Oct 2026 23:55:41 -0400
X-MC-Unique: YbrqVgfWMoC4_7WzX21Kqw-1
X-Mimecast-MFC-AGG-ID: YbrqVgfWMoC4_7WzX21Kqw_1791258940
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so680099a91.0
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 20:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791258940; x=1791863740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYC8oY+LrXwAaiDtJ55Vw+0AspCCI39rFIw270qLm/8=;
        b=q1pbi6AXPk/TG9S0h6GTAkEvmiFEzy+q1rba1z4NlUOV4BsNX4XZe5KSc/wM+LBUdy
         RqB/Tzd+2lYk8n8uVpWwutxMWDR33SX0YbUkbPbyMM4J7zZEqeBzt7JrADY1Up4BvP3B
         oJvr78l+Nlel1IJ6djF+yDKo8daCFUJQNnYCeDnDraGiFOfme3588nWpw5mwRiyBB2K9
         juqg1oaBjanpfHf8hkPaUtnpaqQpNkSHq8EymuVE2ScPtKIviTluhX5FcRee58fZvU+y
         h0+uEN+OS6sCTeKqfZmns8vVkWX1bLq2k4gXwIW+jmnN3qxgcZEcA/6M6izupceezxVS
         hsBA==
X-Forwarded-Encrypted: i=1; AKwUvBwUr7MRd04L7bKa/zxWrsBhVJndf9ej4tC7KR96wFsv67GQwjxORc4uIwb8LF/W7TbUKsFvf6b6nt3Q@lists.linux.dev
X-Gm-Message-State: AFq9FYJ+/AOexN+XHSyLfBp6XMH93slw5IhJ3ecCAcaKcIDjqagkx5go
	q1cMmnnoSG/OXyaOsKOx/In3oZ0t76GWv6KZpggve8e7f2wamtAcw4AYIBEQNoI1xTD2szoMWFe
	VmcHBa5XU4qQOSVjpgvvXcjVvIibdc2OTmI5+teqymDqf2ke7nl3+ENwh2HBbreE=
X-Gm-Gg: AYBFou2Tyi6GGc8C0V7jSyjYOSg4zF7sKz/IfSpsCNHQwBGsyt9nYLeZcjdyqxTKz5b
	T+LeKZxGB09o3KxQxQuPZUEPBs/PixXZJoQ1B5TnP0L8tL7ApKUvUO57U/aie3vzXD0xmxDY9mB
	+vPNHY3DhSOdeyn18joB4RPPjth+GQH2u8C6U9+jwkozQoyAGj3QTKfoozVv8clR92H+qh5QMNV
	VZQlqnpJNs8k/jWwYJKIPtUspEEMoK8GgmGbD1Zc4bw1kYBChJje52cmUDVrLPea3382PW9+HyD
	nNQ9dGidivxo5CVaXMhUbNZLYR2iEFsMgbb+BbkPP6vgOXPQz9wuGJCGkUoFapJJNTiZdWrNpqW
	deOLoekKcJDMqWMLdJN5vio0hn3TUYx/hh/nqF77KYQ==
X-Received: by 2002:a17:90b:4d84:b0:3a7:ef4:74ba with SMTP id 98e67ed59e1d1-3a8546a64dfmr1230254a91.55.1791258939698;
        Mon, 05 Oct 2026 20:55:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4d84:b0:3a7:ef4:74ba with SMTP id 98e67ed59e1d1-3a8546a64dfmr1230238a91.55.1791258939230;
        Mon, 05 Oct 2026 20:55:39 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e2b012esm1790452a12.29.2026.10.05.20.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:55:38 -0700 (PDT)
Message-ID: <e7b6a49c-f9ba-410d-b7b6-55c01d1c5015@redhat.com>
Date: Tue, 6 Oct 2026 13:55:28 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-6-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-6-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WwYg1MMstybHIENIW4zGB_P9aB5qW69i5_Xnzw-qGyU_1791258940
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> KVM arm64 has different types of VMs with all the different modes in which
> the hypervisor code can be run. e.g., VHE, nVHE, pKVM etc. Then there is
> protected VM and normal VMs with pKVM. We might soon add other types,
> e.g., Arm CCA Realm. So in an effort to make the handling of these
> different types of VMs a bit more friendly to the eyes, add a VM flavor to
> the kvm_arch and we could then add handlers for different operations based
> on the VM type.
> 
> Keep the flavor initialisation at the beginning to allow for the detection
> early enough and fail out on any unsupported requests.
> 
> With that, add wrappers for checking the "type" of a VM and replace the
> existing users with the new wrappers.
> 
> Given we already have the construct of "kvm_vm_is_protected" in the core
> KVM code, use that for all confidential compute guests including Realms
> that we are about to add. Adds __VM_PROTECTED marker vm flavor to draw the
> boundary for "protected VMs". In later patches, we would add Realm VMs,
>   which would also be classified as protected.
> 
> Add a explicit helper to detect if a given VM is a "protected" VM under pKVM.
> Change the existing users that precisely want to check the VM type. These
> include :
>    - kvm_arch_prepare_memory_region - For preventing memslot changes after
>      pVM creation.
> 
> All the others are retained as a wider check for confidential guest VMs.
> These are:
>   - kvm_vm_ioctl_set_counter_offset - For disallowing timer offset
>     configuration
>   - io_mem_abort for dabt handling without valid syndrome information
> 
> Both of which are true for Realms too.
> 
> Realms support is restricted to VHE host and thus "kvm_vm_is_protected()"
> checks in the pkvm hyp specific code doesn't need to change, as the only
> protected guests it deals with is "protected pKVM" guests. To tighten this
> init_pkvm_hyp_vm() restricts the hyp copy of the vm_flavor to the ones it
> supports.
> 
> vcpu_is_protected() usage from nVHE hyp code is tricky, as we need to
> convert the vcpu->kvm to the HYP VA before checking the flavor. This
> involves kern_hyp_va() usage in asm/kvm_host.h. To avoid build breaks,
> include asm/kvm_mmu.h to arm64/kvm/mmio.c.
> 
> While at it move the psci_version around to keep the structure packed.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Drop kern_hyp_va() and restrict nvhe code to always use vcpu_is_protected_pkvm()
>   - Drop kvm_vm_is_unprotected_pkvm() and open code the check
>   - Move psci_version field in kvm_arch around to keep the structure packed
> ---
>   arch/arm64/include/asm/kvm_host.h      | 42 +++++++++++++++++++++++---
>   arch/arm64/include/asm/kvm_pkvm.h      |  4 +--
>   arch/arm64/kvm/arm.c                   | 33 ++++++++++++++++----
>   arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 +-
>   arch/arm64/kvm/hyp/nvhe/pkvm.c         |  6 +++-
>   arch/arm64/kvm/hyp/nvhe/switch.c       |  4 +--
>   arch/arm64/kvm/hyp/nvhe/timer-sr.c     |  2 +-
>   arch/arm64/kvm/mmio.c                  |  1 +
>   arch/arm64/kvm/mmu.c                   |  2 +-
>   arch/arm64/kvm/pkvm.c                  |  6 ++--
>   10 files changed, 79 insertions(+), 23 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

