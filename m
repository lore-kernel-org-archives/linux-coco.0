Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E14A49F132
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 19:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107051; cv=none; b=ngQhRJ7Zv9IxvimhaXXTIveuQFG0J2ikIKRctYFqj2nQbhGv+Jf/J1uA/up0ds1AWAtkiTsRZZj9JcRV6piVFlpCpES1sI7PRPRk/+6nGyEPb5PAwQd3y2reABowBslsDTAH/wN4TfIdOEdzE1vg0TP5FNDqGR2actf0AfZptBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107051; c=relaxed/simple;
	bh=9JvbDLSyQrfrPc2pw153E2x+FuYYskw3Od9BLkW7on4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZhnUj7qsGrDSbleVR/IU6tKzRGWaWz64MCMaNHOCBMbuJObDBy9RnCSJWur45FeuG8g0q6Qrj11K2pZ0tvA5BeKIyvFZW4vDX9QKyh5JGsKbwmU1v9tGAzHQUuDBzDQBj767y3+U906gQT7KYjg93434Eig2ArsS7+2r1OfmE30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0uPXZoH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpJucbbK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0uPXZoH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpJucbbK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI73001348892
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 19:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kCerQCZAd/icfcStrsOSRarPahcPdmJx1Sv0aBlf8A=; b=d0uPXZoHzbyscvk9
	Fui+SId+pi+/38DYBmJ4SUmJj3TBIOl02UaIYHzThs7bokVlSzJZkfGbSRFsL68/
	cZ/uP/7WOGeXAlcTU4vmV+HflDvNyN5Z0fnAcM7nU/XcvaTETkXOUSJ2f1ZojAc4
	0zLDZ8ltivPnVLqpPWKKeqfPg3JacgZQKAOB6RcwGV524NRBSIUWLShhBgtt/L5r
	7FvnTgzpCnyqgX+bp9PyoWBEh/mB7BrjGXjBo4j1BWeuUZUdClE0HfyiaD9y3FRZ
	4UMgUMuzREVwjn8607kyf0+UyBgezQRsBNMpLq9Jd/sUhd3kjkArdqLJu7ivd9Kp
	BNfMeA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux860pgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 19:57:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438719cc1eso239324c88.0
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 12:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790107047; x=1790711847; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+kCerQCZAd/icfcStrsOSRarPahcPdmJx1Sv0aBlf8A=;
        b=RpJucbbKQrL4mBW7azN0aVWWLOpQi6T2wH0odqsedYkYTytINfWCCapLx5AcNRLNxT
         sOW26axBRhOuA3ZPxVDB3f8WVDbDyai7VlLT9JKGJDxMZ5WRB0fsuCo4ILH/XhkKJ0m8
         +WVwGxxzGteHRC2SkWIi4BqCiTN6xJrnGCckLivX9vMqcy5rdk+sSKRc4yyX3+jVNVPc
         3xFQ+fYOFFWxQ+cYF9zO0kjRryXhC+M6fVlmvDh6m24el++JibdNBJCboR1W/uQ5g6/h
         eXEm7rd+onbrd9+W7jZrXRnm8A8S8/c6JOqFiBVIGafZWv3WUXSV6GUgUyMr6NZYwsip
         ZxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107047; x=1790711847;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kCerQCZAd/icfcStrsOSRarPahcPdmJx1Sv0aBlf8A=;
        b=DqTXmrhOWmIbL+2d6eWb8PAP+dkkh3kA0sgYIeK6UQpQfwukMrtbH0bg5wvnZEVyYw
         WqeI/qbbB3MUQSaaUimwIUuJ+13uXxc52HIfpPG1eABAsLsbYpfhezpZQ/blWD7kEyps
         Xjzzzz904BioVokM7BbAzPGas//qeE4mcLCKeh9SojxvWIJTapx78UhHPQ0OYWSiKtyL
         k6I2lNoaLUXBCvYPG7lDQ5B/B7789fLBIcjfcxDqONpNlSWuOI76uqfTT1uUQfXdgxMs
         AIcN5Dg5sxh0k/OQwAv7ajrtxPHil68kGpZ491XMGfFK2+AZ54ZrXqo2vC2EneiQIXTG
         SieQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP3iw1r3jJhkKkaaGO1J6ezevyOgW0hylN2LRiddCCO76VydH3ZtPxpeC+AYf5W7eVwe/6hKv9Vd7y@lists.linux.dev
X-Gm-Message-State: AFuF++mJ8qAyfJ6XLLgl0huSPlPw1ZJQw6Z6s1zH1AggPdniCoARtHv8
	ApgCi9lpAVpvdYZafsNvyeAXCiVbsHJErJ+SK2WmkVSLZ7FQMM49kHo3x1XOt5W/N/haOsMpXfr
	dtcReCoSeCj8HNI67PUS3telEyd1McsADbKKXF8eTo2quk6GOfRBZPxsvRzIg45MV
X-Gm-Gg: AYBFou268n6h76TkuJeTehbmcfDylHgZ3kwrRnFMvYvgrZJBzPi0GNEDNEFHCjmvDqL
	UqKPRaUsjZZxGEgZK7/Ysn3swGe7AZgd/l9JZ2Lwyn/VTQTVFJOzPmEMaV3NryhqHmWyiuutEZY
	F6xcuv6CKIydg9o8tZ7yyilcqZdIXHMBYuOe17eD/z8zrEFmdxvknQgiLUsklF7e3mTvWYucAUZ
	o+8CprZ5TcHJTQJHzhFyWBxeY4mdVCFu0873YkgN4AIAIYCT/5jceHcwPXZfBDdsm6gcDQT3dlz
	SjLbHNKsyPxCg9YBBBFbekD8nU35LnWIicd57oLlja4RVxi75qb9gy1Ho+qjoD5uJKFv12K55sd
	FXfWkjwiB407j1cdHr2gNj47kyrA3URNuLD/X3QhNFEYGCyqXCOCFCQ==
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr551667c88.10.1790107046968;
        Tue, 22 Sep 2026 12:57:26 -0700 (PDT)
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr551637c88.10.1790107046436;
        Tue, 22 Sep 2026 12:57:26 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258204sm448771eec.11.2026.09.22.12.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:57:26 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:57:22 -0700
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
Subject: Re: [PATCH v19 06/20] KVM: arm64: Refactor the vcpu_load to allow
 for VM specific callbacks
Message-ID: <20260922125722.00006b2e@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-7-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-7-suzuki.poulose@arm.com>
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
X-Proofpoint-GUID: 2GfEHQBGIcYPxacCtbNMhGuTtHiAEHIr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5MSBTYWx0ZWRfX9CeZvn3S5y90
 QABhvwyUVmtQ4KY0+qbUBdryQyn6/tlOc82xNvyAHvu73pNMOl5/aJalhFByT9Y57SholVFPv6G
 hzke1FeDAPkXYS/4riw8+1NZNkXIMVQ=
X-Proofpoint-ORIG-GUID: 2GfEHQBGIcYPxacCtbNMhGuTtHiAEHIr
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab2dda8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=X9DOVUd_aP98ggfEJksA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5MSBTYWx0ZWRfX4IIcnvZiiV2u
 hAV4tb55Np3+4eUhT+MuWj3KQIDJd4S+9C2QijFIFoFDDQo5eeiedEbKTsIRtermYI75KT9lN7i
 ob3oPCqw9+6rnVfiU2XfGznbIrEzYP59rMvYgi8/+twxrhyh6U2V2W5HltS9fvQWRDrzBZdj/bW
 sDlyiik11OnZ0LgrwzpDaQDIo3I6+06NDyu+HoPwCabDyQ2QfrSW+KsjUgaiZ+ahH4vVR6x9oBZ
 gtH2QcgjAnJwvraL6gw45q6iZvSV3gYmdK1Vr2AzkJtRbzQ8DQPwo8nsHx3KzHlQTSH1Ty+9Jgd
 OrKm2shoOIMSSat75tIhilxuyOs59A7OWx23y9ajky/lh7t76etMsyAoYOVmnF9eBm9dI6Xxrqd
 ZJNdSI31JG6+4kWnYHnizlunebMwDlMCZbHJD+zFZwhSe6FL67JYv724EaOzGQs5X4bE3dAWZIQ
 sS1lL4h+yiqHs2p9qoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220291

On Sun, 20 Sep 2026 22:28:31 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> To keep the VCPU load/put handling cleaner with the different kinds of VM
> types, we are about to introduce VM specific callbacks to do just the right
> thing. In preparation for that, make some refactoring to add the change
> easier.
> 
> No functional changes intended. Based on a work by Marc Zyngier.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Trivial stuff inline + maybe one blob that should be in previous patch?


> ---
>  arch/arm64/kvm/arm.c | 48 ++++++++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8c784b266a8e8..c74706ed9a531 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c

> +
> +static void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_vcpu_should_clear_twe(vcpu))
> +		vcpu->arch.hcr_el2 &= ~HCR_TWE;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TWE;
> +
> +	if (kvm_vcpu_should_clear_twi(vcpu))
> +		vcpu->arch.hcr_el2 &= ~HCR_TWI;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TWI;

You could use FIELD_MODIFY() for these but maybe not worth it.

> +}
> +
> +static void vcpu_load_pvtime(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
> +		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
> +}
> 
> @@ -772,7 +782,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
>  
>  		/* __pkvm_vcpu_put implies a sync of the state */
> -		if (!kvm_vm_is_protected(vcpu->kvm))
> +		if (kvm_vm_is_unprotected_pkvm(vcpu->kvm))
>  			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);

Why in this patch?

>  	}
>  

