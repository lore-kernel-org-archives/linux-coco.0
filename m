Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78E552FE58
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116950; cv=none; b=JYVgfbcXMg3zQ4hxgHlhZjsRrC+uAY15eDmk8NZ7hCKEezLYplmmSuFVmbBCfSHVHOdQwavJS2PkHn68Uoi5cuT8Ft4rCsFNTTYv9s5hK52C1YKcPtdhmF/3I5LoGo5GV+0ZvM6BUyE0Ej8tFjY/GzJMO2h+WdCOgaJdXhT6NfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116950; c=relaxed/simple;
	bh=TuulLzPlORgXvFolK/4BKymKSY5UdUG0I9DOV79/2LA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NbFuAi+rA93hVXtwiRzXwCVnNB5Gzl8td0CGa+Cz9Au0K1e16a342yKC2ES8ALh8U7VrIgNEdrI2YoEBeDTWV9fTnlbC27RpQWBkZoTyUW3MfwFafNAUlWIPlsf49YpoQSu3nbPvVgaurlauP11HQOtBgANyH97Kmdu/ILg1Sf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=my4HTeXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+yrLcva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="my4HTeXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+yrLcva"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI736U1153712
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xvk7yaRvmx3POKolJ3kCG15kscgZd6Hbrm/vBfl0Qo=; b=my4HTeXumBECvXzV
	j4c3b7Ko5e6iN9r2j3NaIr1WpIryDMswNKztKULaiH8U/S7ed7WOZ7+wYlE1HGpZ
	Hjt7hlE+tqLbaKwoCMBzhnekwiW98RiuAjhMEWROURtje/dnsQNi5K9t8cLsfksg
	OK5dM07a0eZwN2xql6E+x7ZfZEREKFLZPhzP9ZLMIgCam6nPMdqMyypmmVAAAYrv
	cun2124+4GbE74oUkP+6ObMz39ad7IIGsV7TCdtRhCrD78bkU6Z2gexaPF3J59kR
	LDm5IvrdJQsW9cIS9LhubQ23adBqpJUs9wuxdR6EaJcni9Eeo5LQzoGg++obw/VM
	PV28Qg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7hy81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:42:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-331b2ec616fso1091632eec.1
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 15:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790116944; x=1790721744; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2xvk7yaRvmx3POKolJ3kCG15kscgZd6Hbrm/vBfl0Qo=;
        b=L+yrLcva8iaJxuqoAl3zFS48+D88fHuYMCzefS03PU+7MnMB6dgkmAWORDP327hAnp
         WCSeEDPFwjLrt5yv0EcHl5g3mWmt5JwwlFsSnM2h4bUjvauHxstDejtW7Xcp3tw610lN
         dQQ7WPvjqG47Ox4G9bbkZSBO75CI/S7HoksKnuD3+vd8yglOuZs8yvk9B79aqVBkf+sk
         KSh1WPKAO62QnxGvpVFRuUZnpKjTGNM9QwbESFL7QO9CvLj0ThgL8KRiHSeskbdFev+z
         OO95ldZTk/5X0pUQ6U7pGGUBxn8NZ6xl9TIjeiQQRqYVGV1g4uRfzYhIR40M4bp2tcj0
         DIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116944; x=1790721744;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xvk7yaRvmx3POKolJ3kCG15kscgZd6Hbrm/vBfl0Qo=;
        b=0KjKkSvDpLdrNESrc6pPA0ayJlf4yuaC7/sB+dqlYbfylMB1jotIAvoGeV4fdGMN5q
         8+EnAhenCINjK3l2q0Acj6JeV7an5dW7YkrCA7jsGQOOndYslQqRj2tRc0H2Ng8zC9H0
         6rCSvb0xCfOHn1ff1iBLPgGOZXYN8b7gCNhu27LdoV2XDjCEFtXOMwx/lsnCqLGdMYPD
         1+6Or1iyh0d3Ya+cFAxXCZOhbcXL9hNLJXOFzXF6gATMTsFLAM33RA1nonuYtmz+u8Kv
         ebSlaplCqrvFKMi2GH+28CgGB02AdVt/Lt+nReB7n7nspGxzffGm++RyxdGub75cOEtp
         Jb/A==
X-Forwarded-Encrypted: i=1; AKwUvBxYaTNHRamQ9nb6FHXRaENyE3cEvzVvUZuao4nI8nUHwwXKT/v/Iqdvj4epUzhJK/9jF0gj2LTxj1Sx@lists.linux.dev
X-Gm-Message-State: AFuF++nyNMxMFCUM9wv2VPHQfqpHX/w6kffqAXHrdE4ABcXWTLeWS3XW
	zULe8ADrshvhg8UNXy0MfqNKmCeuZ9JRg07vocNU38IffcwSUVDkg36X+DOEvTCQ0B+FF2sGMrA
	CbNiPVSEWXhGO5pY8UJYFl0/oGttffQs5gqs9QiOcAZb48WG+eF0lZz+iy1MNKYUk
X-Gm-Gg: AYBFou3MT8HicKVVfz0ndelUWxuA+6/uUZLIV6/A9IhgW++eQ+/Cuf4fTXwoM44s2zg
	Qp6ZKOJAmhq5meV8ye0RGOLZkALP0xmSLfRUsvgZStvvdEPPPK3dI9n0JM7xvZa4y9QZlyMZuSl
	fJtadyk4WpQ/xl5LZWmcn8fS26tvoA1rZcnIO8cGT+FLhmhqK45X69WQTcz7+hjSP/MsiJkBHhb
	8g+ugavkzyEVcp3d90eIVtRwdi3kVUJHAZsxnZEXJcfGrN37RigW4zQ7nbygoqb45F7CxbEkNBp
	BF812ULOW5vPpzMGDL6L5q3ThzQHRR8Z1Ihc2OEZfmOHHD0qA66NC3lplkbgDL1/4ln5r3fYq/S
	zR3oYEWW3lo7syK+HYHzCoIcKhcH3qdLIPT8ak6Q0qPOziJsBd3l8Qc4=
X-Received: by 2002:a05:693c:6211:b0:33b:de13:9574 with SMTP id 5a478bee46e88-33e8dbc4479mr744001eec.19.1790116943637;
        Tue, 22 Sep 2026 15:42:23 -0700 (PDT)
X-Received: by 2002:a05:693c:6211:b0:33b:de13:9574 with SMTP id 5a478bee46e88-33e8dbc4479mr743958eec.19.1790116942985;
        Tue, 22 Sep 2026 15:42:22 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm1266199eec.26.2026.09.22.15.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:42:22 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:42:19 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 11/20] KVM: arm64: Mandate VGIC v3 for for VMs
 running on hyp that don't trust the host
Message-ID: <20260922154219.00000999@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-12-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-12-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX9ouMwvOs1aA7
 fMPtQH9ZwuilSe0GiCjmLWkcZayp/TNjTbfQOO8UxjQN4t8ilXGN0c1PuQ2krGIvwTWH1dM+Pzc
 mAglolh7mYUCHLs/c49vF48m3k5QLrc=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab30451 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=7nvTRwv7b12_b2Z3:21 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=99P15FIpgWgLHUSX_UoA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: D8BRU3y57A5piPgsGC6_Ltncn_ik9yEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX9FcU+3xZp3PM
 AvaGPLQTA5uj0lOnokCeTAY9OGcj4TnTYo5iCaUXiwOsqGLWDc4qzhIDgJ3v9QRaSo7ORfNFkmj
 SQjoj18flqDfF+G2ggzR8LyWWh/bxWDrgW5LO8GVkMMbihaDgv+3RHEVZobnnD7rQkylMKNkLem
 9MUmI4bQIZMdC1463FxzyMttP1bFlFw7KvIQpNV2SYitag8WKhqj5v6vIn1fhYprzYA3SSkon5x
 UyNyUIV7VUnlFYrhs/o+RDvFWZ+fhy/D9ArAndORNCBqRkjg2Va/QdBRoQwczMtmp+QtlIhfjyk
 BhkfLs7InZA2uFiHYV1UulUug6jforNc8utjXKGi+eU2zTLiNZUdgrCG+mcU+j/pMLBGwW1MT/E
 byCBHd5f4yVTjVMaS1Acl0NN/MHtSgcRgLfXAamIHB8VTdcGwo6N110JucDZCsJM/WyA4HnucSM
 pApXtJmxumXQHC2JHOw==
X-Proofpoint-GUID: D8BRU3y57A5piPgsGC6_Ltncn_ik9yEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303

On Sun, 20 Sep 2026 22:28:36 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> pKVM and RMM, both do not trust the host. Add a helper to detect the VMs

Maybe don't mention RMM yet, or make it clear that isn't here in this
patch.

> that have "distrusting" hyp. Use this for blocking ioremap of vgic-v2 into
> stage2 and prevent creation of VGIC other than v3.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Other than minor comments, it feels to me like these first 11
patches are good cleanup even without the RMM stuff that follows.
Perhaps can get these upstream faster than the rest?

Jonathan

> ---
> Changes since v18:
>  - Cover pKVM guests for VGIC v3 mandate.
>  - Merge the VGIC mandate check in here.
> ---
>  arch/arm64/include/asm/kvm_host.h | 3 +++
>  arch/arm64/kvm/mmu.c              | 2 +-
>  arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3211543a85b38..bb156a633ab75 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -328,6 +328,8 @@ enum fgt_group_id {
>  enum kvm_arm_vm_flavor {
>  	VM_NVHE,
>  	VM_VHE,
> +	/* VMs running on a hyp that doesn't trust */
> +	MARKER(__VM_DISTRUSTING_HYP),
>  	VM_PKVM,		/* Normal guests on pKVM */
>  	MARKER(__VM_PROTECTED),
>  	VM_PROTECTED_PKVM,	/* Protected VM */
> @@ -1546,6 +1548,7 @@ struct kvm *kvm_arch_alloc_vm(void);
>  #define kvm_vm_is_unprotected_pkvm(kvm)		\
>  	(is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PKVM))
>  
> +#define kvm_vm_hyp_is_distrusting(kvm)	((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
>  
>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>  bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index cf293d09e940a..413c4b114d75d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1251,7 +1251,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>  				     KVM_PGTABLE_PROT_R |
>  				     (writable ? KVM_PGTABLE_PROT_W : 0);
>  
> -	if (is_protected_kvm_enabled())
> +	if (kvm_vm_hyp_is_distrusting(kvm))
>  		return -EPERM;
>  
>  	size += offset_in_page(guest_ipa);
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 4012df6002ea6..874025513afcc 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -84,6 +84,8 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>  		!kvm_vgic_global_state.can_emulate_gicv2)
>  		return -ENODEV;
>  
> +	if (kvm_vm_hyp_is_distrusting(kvm) && type != KVM_DEV_TYPE_ARM_VGIC_V3)
> +		return -ENODEV;
>  	/*
>  	 * Ensure mutual exclusion with vCPU creation and any vCPU ioctls by:
>  	 *

