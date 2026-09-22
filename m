Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B35531B0B
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116730; cv=none; b=qqxc9JQRt+rbh4rwBmaercc0eVoyvv+LAb6mSq+Fpc01rAn7x7/Aa4v2skA+MQH5ZGRAoZ1wYvQaiLxW6DcXJEpMXsYOHYl271yzc43uLurSyP1+Ds6LaQiWiQFkcugKUOrTXjF/YVgYWvb9f1AYC7WpWMogh5cPnPpx3bHc8A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116730; c=relaxed/simple;
	bh=3/dkNKPPZhwKNFM+qynUyX6vwgw0I5X2dRSwnLFGk2s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dnZn1c1Y7PD3koZqLw0IpIVVTFBBqQ4a23X6JBzdL/koeH6VG0zdygCiA6njc2TnA11vvYyyXvZyMpeRFkvSmpDSvmV6cmEzfRD5UyM9nazG21BzccjmE0BJh2hHBepxhUl+5SSei0y7/gh0/Gok0en5OFzO6yNh+yOtxD7LdTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l2rd/8n+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1Lhk+0O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l2rd/8n+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1Lhk+0O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI72X81153699
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJNsu2FLCP1qcNEgoJs+KWNxYkGyFkvDNQdnRnSNx7A=; b=l2rd/8n+B47hSsLp
	dm9rKeJBloJJpWBYD9tTfVg5N4yZY3zxA2FdiNYnkn2Pdi87lB1r2vkiI6CIntcY
	biQPC3m8sZaHuOy7q40XCHL9Eu3dJhllRZVG1gkzMxduv4bmkRXqNqxjwd7NKhys
	3Rpp23gtahCeBn43yLdo/u9zoSqDZqDiOS5Ik187wrsvc9W47NQCEh0qUiMsp55k
	3Yx+arcyLIFHBbKIOoTtiZNno87NlNTaIbJU/9rLur+mUeXT+yxNW+sZA2VdfgCH
	aXxsrFn+XMTr0DD5H6dnQsmljDDhoIQnpYM1cJfupuhReouDDrKxqnQc7Xcl3ppU
	nmvQog==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7hxue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:38:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-334f782d1abso676247eec.0
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 15:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790116711; x=1790721511; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tJNsu2FLCP1qcNEgoJs+KWNxYkGyFkvDNQdnRnSNx7A=;
        b=G1Lhk+0OrBtVug0DIuvDgAkX/CgIqQdCRtBsNXR1wcVwctz6RU4atg842GYscaSUbR
         UTPaNUH/d363mDpdsOmqvt3M/Jhy8TlH2zNjFW2jh9F1CcTCytUPASu+vemNmXyikD/p
         Rt5kF4hP3UwaIhD5YvEdMCwRmNbLdEPUBp5dIux1rAmOhWp7jNIofH4n8cTPWix6CJDp
         eKuWOXh4sfB+OpJq6dHag8ztvinO/U43sFTQ57PwTH8Jq+VAJAJpLnvwHw4Ge/cht95t
         lNk4lEcxjVR20nFmqKx6EBFQiv+ep72No+9nsLgC8O2nhfhlzk8Lf901bl24Da3pKZ3o
         p73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116711; x=1790721511;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJNsu2FLCP1qcNEgoJs+KWNxYkGyFkvDNQdnRnSNx7A=;
        b=g7YpQEwlLCK9gJn/+61Lti0w+XSuKspQLnZJS24ETuYijN8cpcAvKl36EFYml1W77Z
         dwh6k3n9geWQi/oh9kEO+9osPsCd/3NicD60xTgDkhHYOGyXqyzYDi8Fpk9t9vfXmeLh
         0g57LbeyJNrno+kIuvIheDTf/WS2rAZpfPay2k0sxU+VCvKA34RaUxgJIhB/5tY2iIY5
         Xa0tAbTsZBDcTxU/jVaVasBaHD4FxWOQFsq2MZDonIU9y5L6GklWDzZNAZAOD83t6GjR
         5fSI4qW1hahzYJNT1pGHnlgUYdKFXOkDRbOc5cFRAnJs1EKqLkbWzFH6zDgt+HUKTvY4
         IyCw==
X-Forwarded-Encrypted: i=1; AKwUvBx5rkatc9UvfM/rhdEcWsdvqKgbWDRPtcdD1C9S0Qw/pIjWamvdNpMH9vxZVic19f3djK9KqZT3XaYj@lists.linux.dev
X-Gm-Message-State: AFuF++myWDk4D2MpBGWZg7TA4XMRpxpW0wKA4FBtNVut56BggchTg/b0
	1FSWxcAqOcA5W02BwfbKYd66QXFkzx3dprQOU7Ri+pYohKkqKa4TkJNG86QudlJd2smUOpNDSVw
	X4VCVCGUPUGhLe4PaNJvjkOjZnvpqQl++OBItsJoanIPj0wU6OKCBv1ptLSryh7IX
X-Gm-Gg: AYBFou0n8VYLOPssIoQ1zYBMGgt13mFm0Io0ky1NE4DsvkLQfsMwBXwrCsS7jpqS6FJ
	wcXszoiHzOqmWqvXtuaimCAsUWXJVPfGGaiAZ6ClnoZ8tg0tADUlnducnqw+Q3PaQdPtX7WS1pv
	PlpjZewxpuE4bG7ULSfGQHqdvMI3QmrauoT64LbF5K0M4GzzlDiBotd2cJSQhVtTwZaCHF420oH
	i7MfwRPVaAqwJyS8QHcNSg3DPdDgIvOaBDL1iN7up35deDdj6r6aJZi5mbkfbGsBgi+kSj9JjTR
	EPqZ07tKh2t5A1yK5kUR4a1xr0cYUW0oPtcX4py3Ak/agSgn7qALeB54SaA82vn+i5u6ugiFsCp
	64WQT/jrUlhkECWZB6/rvv7c2mt5BdxLNuBnIENnc7uNy75MoHTkf+w==
X-Received: by 2002:a05:693c:4187:10b0:338:5bf5:d005 with SMTP id 5a478bee46e88-33e8ddc7604mr710474eec.28.1790116711133;
        Tue, 22 Sep 2026 15:38:31 -0700 (PDT)
X-Received: by 2002:a05:693c:4187:10b0:338:5bf5:d005 with SMTP id 5a478bee46e88-33e8ddc7604mr710439eec.28.1790116710604;
        Tue, 22 Sep 2026 15:38:30 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm1162630eec.25.2026.09.22.15.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:38:30 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:38:26 -0700
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
Subject: Re: [PATCH v19 10/20] KVM: arm64: Abstract out memory abort
 handling
Message-ID: <20260922153826.000044fb@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-11-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-11-suzuki.poulose@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX1HFjMPJfFFtq
 SRV9qzOkD3rVfj6tqJQLsXDhl4y+HDM+ASwm3cUJrlFlPY86WYsIfZjUdD6KfGUAMyqTamJhqfG
 +GA2PS42GIIpTnNzI9XF2Eif40SiEk8=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab30368 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=rbqOqaJmvRITx-_xyQwA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Fh_kg6-7W7INbxvzN8cBnT3jkMg-DmlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX14dLgMKAsQrY
 +AG1LoS43mIazyek9yeEb11ZhLMqXgCMHwZaeJbUd214sSx6S5I2I0syMclC0ndY7BewUbwK9NZ
 MVuFF4hDLyOMft/qjrff/QP5ufrN4rNtbXDNCkmNdw0uQMwhqPNeSahWZ0GcRyaQ/H34V5I04m3
 cOw4jNqsgwxuvXvw1w7Rzw8YyBONStZPaEN6s51aTDQLJhPMfyvdDvPKHYsxf6RD/aRZxUSfTii
 ObUh/kf/UdkqoE4Yvk0OizZTr9pVkRCYIlJ/u3vr/3jU1xw6PBH7j6uPLDuCbqW2MHBbJd1JYFP
 Vst5HGOtnZP0EiGOLm6/v/lAqW1uCo7Lb0KarB7CjdfxrifJ8q4RfObZOAQZh7/WdpcAGbSPTBI
 qwbJ01Lx1MruyZeGkTeKgx1x2uj6ZZIGiNZ0a88gUw/b7+M/GI/AMFlh2cmvs1MsRVpgNpoKod9
 dPKRrZWp6ZBTWYWO5Mw==
X-Proofpoint-GUID: Fh_kg6-7W7INbxvzN8cBnT3jkMg-DmlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303

On Sun, 20 Sep 2026 22:28:35 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Move the memory abort handling under VM specific s2 operation.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Trivial comment + request to follow through on adding the local
variable for kvm. I think the other places that can be used
survive the other changes in this patch set.

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d97a4a1bca23f..cf293d09e940a 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c


> +static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +{
> +	int ret;
> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
> +
> +	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> +			!kvm_is_write_fault(vcpu) &&
> +			!kvm_vcpu_trap_is_exec_fault(vcpu));
> +
> +	if (kvm_slot_has_gmem(s2fd->memslot))
> +		ret = gmem_abort(s2fd);
> +	else
> +		ret = user_mem_abort(s2fd);
> +	return ret;

Personal preference but I'd just do
		return gmem_abort(s2fd);
	else
		return user_mem_abort(s2fd);

and save a couple of lines. I'd keep the else to make it clear it is
an either / or choice rather than an if something true one.

> +}
> +
>  /* Resolve the access fault by making the page young again. */
>  static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>  {
> @@ -2287,6 +2303,7 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>  int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_s2_trans nested_trans, *nested = NULL;
> +	struct kvm *kvm = vcpu->kvm;

If introducing this, also use it for the other places vcpu->kvm is used
in this function.  Separate patch though to keep down noise.
Looks like that's mostly to shorten the chain of dereferences in the
locks.


>  	unsigned long esr;
>  	phys_addr_t fault_ipa; /* The address we faulted on */
>  	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
> @@ -2448,19 +2465,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  		.hva		= hva,
>  	};
>  
> -	if (kvm_vm_is_protected(vcpu->kvm)) {
> -		ret = pkvm_mem_abort(&s2fd);
> -	} else {
> -		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> -				!write_fault &&
> -				!kvm_vcpu_trap_is_exec_fault(vcpu));
> -
> -		if (kvm_slot_has_gmem(memslot))
> -			ret = gmem_abort(&s2fd);
> -		else
> -			ret = user_mem_abort(&s2fd);
> -	}
> -
> +	ret = kvm->arch.vm_s2_ops->vm_mem_abort(&s2fd);
>  	if (ret == 0)
>  		ret = 1;
>  out:


