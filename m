Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230B355D898
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116184; cv=none; b=tUh7mukhKtA58P4lzHeqnWhBjUojXkGUaIyxNbWUR+aXmxPjAcG/nCD0z/MS2BYrOkxOPy3fO0Tok7zwmG+f5qtgBc96Nb3045mzKfUfLbuYC7In1dqg/VqWSGkNdJEy/bQMapzgUvIDTvNR9l6kymmkJECsMTtKT10Pj63qHsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116184; c=relaxed/simple;
	bh=RHQNmebjm5fLr1dV9L/YoNA7XquXexIl0yHVtAtTAXk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7TYFOD3orNWq9csJ0f4UIDpIAqjJU5CqxGLvINGTatdU10joChIa00cjHoghWF7U4nu/RwBIlNPYeoj7Pp0CYmhOrlAEe9nGkMU+G/gg2jGPxfq2sk6iwYDMar0UCygzLR5r/unJy5JFoOQ/lvCgb7bLGdK7BmCJtlThtkYUrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6FIxJDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5sdxJcR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6FIxJDz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5sdxJcR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6wKM1348781
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+w2R4Sw24z92+mWmBOXbaEBwTszL/ulokoyz0K44OU=; b=c6FIxJDzSdijI5PS
	sUyB8CJsU1gphs2rxSzit1qmionaLaYBBY1nMGxjoHQcTlAhStLkZQUwtO020Ybq
	krf3S02fGvuP56aEH8e2XoMnvafNwqF6Dq9Gd00NmkqJcTjYqTE6eh4qF1FrUj/3
	/u9IGtBP+VWMu5TyYAVp29uPG6suUK6CagJxGf/B0Xys4MowqJH7RVOL+BB7KvS+
	kVGpTxswAY5KUnV/vzi0hasGUtWm7cJipO4L75Ri1/wGSiuzMu8oCfWOXhqcX0xp
	f5rLquRaImhc3JAXWWxi1i9cFiX1IgSX0SIDOiJP+hN4GL2uT+kfU/tr6diVMFVp
	GZ2Zkg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux861c98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:29:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32ab0911226so297626eec.0
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790116165; x=1790720965; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p+w2R4Sw24z92+mWmBOXbaEBwTszL/ulokoyz0K44OU=;
        b=Y5sdxJcRKz2LLQzTCLilkvrjvXLcR3r1eWEY4nvVPyJHNZjqndXoHMlNUFYnzIPd3i
         hdsp0xXHKQcLOSWpOcMFFAKlvtbckneBRyjapHT0Hfs4Rh4Eo62dHKakRTXvTUCzXjR3
         PgqaStIiKHeXWIhGuCMdMS3BddDBiPBHXjL0yC03U21Vtzl0heiz+lb5VFdSALvD71Tq
         ZlKAvjEEmUHC1rXXomxwYxDKh12UtQIZ5OmRw2IWBmCk5s4ARe00sq9eCF2kOIpHZmW9
         FYe1rW7YS6Zpg05ZsVhZHl7ExUWpiKRqk2dO5FU03wZq7e5L4qdsqa1J/0zOxPTxch2R
         NYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116165; x=1790720965;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+w2R4Sw24z92+mWmBOXbaEBwTszL/ulokoyz0K44OU=;
        b=D9TIlOdG+UdJxhUpdjQGpO8cUYQDaGOBBEbj7Tf3pQPo8urnc/dvYRriuN5gFX1XFF
         rSjNOPlXuHj5WPAOgnG8dK3kxzShZgMUujFYU9QZceCz0Xu8l+WrHh3zCar4Ucug1dW6
         dX7FZ589Xcmd8+0Scrdeo70BJ4X9uGXFCuvjc2W3xTTvSxcYWNqfHuk2XVN6oJlT7bc1
         aTsqVrboLD+sAUBAEsKdFVmKO1Dr1sBuh61sKFOJ8OTOH2c+Tg5PqmUjLFQk5MySx2OX
         dcCNwH7tL0P5ngRf8herYpGZdpXgYrQvQyXVxY5Ta2JUVpca9TnpPsydIatqSsJEMDxu
         hEiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5HJhZ8wH6xS2HxPiY04ZtG7QLbpGbBuj164EgJMeTOxNUlRHlYRYaL+txcqUEPmI+tOc5dz3cm9yB@lists.linux.dev
X-Gm-Message-State: AFuF++lhNueuYrqU59mBYR0qR8y+pEHLGieJK2lRPyeDKoTu8Bx1ND1p
	YeKLcCSkkZfjI8NG1LmRoASt+6z+FE6fpFlu2H0pmJgOy4ZsNvB13EPHl17tJ7wN5fQQmaDERVt
	hRmhYPIIv+/w2cePIkp6YWzkJScLPW1WyZ0kIz5HAKM5g79kvyZ8E+Z2tsTiOvI4D
X-Gm-Gg: AYBFou3nbf+rSCkJI6NMV/mSsrg6jArLLPtdySdj3uZBE1Z71sdVYHbmRdUkPNSz4OF
	6FSNEdCR2RVxw+dszbbmcElPPcBLsHQjNH8u8cn+j4jIU0XAhW3F0zbe2vsdbhCll5Vsgm8zptH
	geOWu3dWljehEVTjbNsFc5Zj62hAOuQh3FIZpVlCbDeaFybWdQTi+aGl/bK/HKhZeJNIZRMXI32
	QJwNQjw7GP/tYEnkNmg3Bjtfv2pY9Y7IQRXNRthoNMLXy7NdDD0NF9Nc6u87NofERZuV7LlO14E
	GE4WqcdH/Qg/Bi5c2mbVHLnmvzMn/Y7qxMKAmpUYtZITuFeK15j8wirUItbap54WJTelFxQrnQQ
	D26ByD2anSP9Yx2fiAz73yWWBe8II4SRFsFxmIvQ9k2FAPCBOXvGhGg==
X-Received: by 2002:a05:701b:4248:20b0:144:e259:b1f with SMTP id a92af1059eb24-144f8de7fafmr949957c88.13.1790116164986;
        Tue, 22 Sep 2026 15:29:24 -0700 (PDT)
X-Received: by 2002:a05:701b:4248:20b0:144:e259:b1f with SMTP id a92af1059eb24-144f8de7fafmr949922c88.13.1790116164404;
        Tue, 22 Sep 2026 15:29:24 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98542c8sm1351499c88.8.2026.09.22.15.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:29:24 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:29:14 -0700
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
Subject: Re: [PATCH v19 09/20] KVM: arm64: Add VM specific callback for S2
 MMU operations
Message-ID: <20260922152914.00001221@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-10-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-10-suzuki.poulose@arm.com>
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
X-Proofpoint-GUID: WkrLdB1ufDwjSshHyQhHxGgKvQNXYB0C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMiBTYWx0ZWRfX4n1SJY4sVYJU
 TrP6cPMxq8luwHqfuA1TZgTzZU9r+dcWRh6DWTXHPCGMPYmhyN1ssJ+c5TWJkmPVl24rzEKK8Tu
 7hpWy0JKSApEB8XLDxwJ5+rKII09lIs=
X-Proofpoint-ORIG-GUID: WkrLdB1ufDwjSshHyQhHxGgKvQNXYB0C
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab30146 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=-iJiB5zC6xgh5EJSZLsA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMiBTYWx0ZWRfX9Nad8DFqAywx
 SSa0ubhJB30tile+HwsPlnr0w+FupVqRu40yXFKvqoFojd8jvYMtpuXEdNYlQeuJCZMtx1N/dC/
 PE32LqVYi+VXWOttRrWkRLfKYYwQXArvHqSYpg08IF3LEqWOjjj1TeG9qrGvbv8t583JvFUsJiG
 9FvD7G1sDp5l6MbQoDSklUw8MJecZOeJ9TNZ/x5h9oWggHT/Oi0HIo7uzzdoLAHMA76plyS8XOC
 g551QN4lMtyyw+X1QiWJVRSJmhUvTSGLsOy6aDMhISONBq8gFziDPUQes/p6LZ6zMzM0KrO4xty
 s9OrNP7jgul09GP5eTU/abMklwAzMtqjbQEIu7ib1y5dB75lHU5SrJqFWcb4tMDU4hU9ZADb1zw
 Bal/jFa9f7iK5MTY3Wr29MKufCiW7yd3B6k5Sk/PknglIDz6qOYcac6MwAWccyLXrMTgln1sd5R
 XBVsODkFLDXgL/cBTAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220302

On Sun, 20 Sep 2026 22:28:34 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

A small suggestion inline that makes it explicit when there isn't
range operation and a full flush of tlb is needed.

I don't mind either way, but thought I'd mention it anyway in case
you hadn't already dismissed it.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 03f2017a7404a..d97a4a1bca23f 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -37,6 +37,8 @@ static unsigned long __ro_after_init io_map_base;
>  
>  #define KVM_PGT_FN(fn)		(!is_protected_kvm_enabled() ? fn : p ## fn)
>  

>  /**
>   * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
>   * @kvm:	pointer to kvm structure.
> @@ -174,26 +188,36 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
>   */
>  int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>  {
> -	if (is_protected_kvm_enabled())
> -		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
> -	else
> -		kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> -	return 0;
> +	if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
> +		return 1;

For consistency with other cases and because it looks nicer
blank line here.

> +	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs(kvm);
>  }
>  
> -int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> -				      gfn_t gfn, u64 nr_pages)
> +static int pkvm_flush_remote_tlbs_range(struct kvm *kvm,
> +					gfn_t gfn, u64 nr_pages)
> +{
> +	return pkvm_flush_remote_tlbs(kvm);

For the cases where there isn't a range call, perhaps you should just
not provide the op and have the wrapper fall back to
calling the 'flush all' variant if there is no range one available?

> +}


