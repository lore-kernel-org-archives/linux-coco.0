Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F54A0138
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 21:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790285911; cv=none; b=mxlTqR0r29xo9IgqY3Lbvczr+ShhN5kja7g8SERKdPbcnqeL0J0LJ8+q/Oby3yKlen9/vH7Ur/Qpt//cD8EGon3j9MPBNqw/1aCSAtROt2YRYh2j73OJhVSXtwpZj2Ulf336syHRJHapdJyoQIVQylx+1TEgK5PSQ5T9gsPafJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790285911; c=relaxed/simple;
	bh=wWkj0DV/RGxV8HhwtwWyQ7dXRw1tyCgB07k8nLpBO6o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sSccHt6mYnJrb9K7olIxb6tVoYRufyvP/uJxZShR44RGwxsi1W1QONQemvYdi+BnnpRY2GGQ0Mzx5nEavz5LFdVWgjwD74AtJ43X3ujBw9RJ7Q/9lbmBC1sdbqt2lRbAwiX1cb8odV8eHixAt/BIJQ8dlQBtOjc6RsMd72kF73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNrEf8JF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQRxZzjT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNrEf8JF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQRxZzjT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdYts3247767
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 21:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPuI30IW6HSkIQ0WfYplqjAWQJEIGM7YwNUkDQocFtY=; b=PNrEf8JFzkwn7FZr
	UsqWaAdE1hg1luh+Xq1u26Yaac6StZiDKKxCzlUZfFeRBLkft36AJqiJpwQjlmva
	+TxLaCkUKfQFKtIiotRuLu+RuUouNU/0ut2Gd7+TIx0sj++94mT4AKaA+psLINM2
	qYd4wzqywaltdpxqlYX1qGIWOdtz1Yx1WJkgsvvqK2hP/NyeJvOz/QjSwlO03dlA
	Zd5PyoJApHtNT7En2tEmm7sJjLC/zLd1EfyNrtVRZ6pkDLhtPDzQrw25UfFCv4fn
	qoSNt5bAI01OvfB9c6GqAqaZcuS97obyt7VzDZfQmLr3C9XoFekVnXkDcz1zhrpv
	6cwN0A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881rx55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 21:38:28 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1039659c88.0
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 14:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790285907; x=1790890707; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FPuI30IW6HSkIQ0WfYplqjAWQJEIGM7YwNUkDQocFtY=;
        b=fQRxZzjTVF9RJtXn3cUpNe2zl/oPem287uuw+AsZObNdM4jedq8POmRDjAbxFt0j8p
         utIfZqDG05gO+mEwYMYBCaVTvSfBhmU2YuM3OAJbw5/ORSfsDEuGBbBn+7E1WSELe1gX
         NADBe1p89FPDSZ5jb2qpLseyZKYBFqmYBk8eIlN6MyVxKBDfNpPikG+2+43c5cICrv30
         1HJlYGEoA4pEUnmOk4R/Duliy/lVQwBZbmdEJi3Hc+AcqGVAEv/9VQzNf6YW0r3+hDip
         DE4LxxQhYOi5SucNVKXYl5WxheyNttv8/Yl3nQe32i+h+3cqo8eJizUBtmAEo0B93H55
         Knww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790285907; x=1790890707;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPuI30IW6HSkIQ0WfYplqjAWQJEIGM7YwNUkDQocFtY=;
        b=xw+SxM9dBMIkbfEz5Xblv0h49KYO0Yvml31exoHDlB2kvRLPujdg89hyoAkE4aPLjF
         5rdqOWgeGoWsz9Cd5XI6ESazz60/MTNp8fPBM7Mh8jsSUD4ZDp30KURX/y7FXynmp6/c
         NsatR7DJCfnnrVKy42Fvx6F6Y+j692fngu48qBnJdGH0zso/an5rGpf3FqKxK1MWjZEY
         WDanlTerzf8w9Wow1F6rwHLn5kfz3CFQzlVOPrGo4qy5gsYbUtiwQWKiOOEvOEHIW5Dz
         5kwkZHPv3qd0+yrtG/wr6+ldp7kUTXsB7hEzg0pSfxudDmpgyOGIX+2AkxvN/+7fVydk
         I66g==
X-Forwarded-Encrypted: i=1; AKwUvBw6LeU84JnqsIqDomdUwf9jFKqk+g78kVrZv/vjoKhPduXZtDNq7rJ5flimNUkJlLTxrb5Q+7mLPjfE@lists.linux.dev
X-Gm-Message-State: AFuF++mmb5XMN+B5OY0v7FjofUUlAe80OWhLoSW0F/gkow4ZykSbTViv
	fLZQYguR8QyJfd6jEOBii9lCINSTp7ToUM7Ohe+/v7+v+iDj92XOosS3G5dApDWr+LIdDFE1xPo
	CsW2Ju7llwAxASUlh4CIyb7Ta2LlJHfJO7Q7Fz1tluGDLAzZn/U4WsnzzFnEoUGFE
X-Gm-Gg: AYBFou2GtHBpzAT+ajJoYjBSi5dyTCegj43iR3RrwgQpICRvb514WgJ3qmMb82rufRa
	DBqBb9IhqF+7Q/iZPZC7Kd8eQ9x9tuX2ukeK9wkNOdcV7bXJv+5lB9i3iZT1viNhc9ANtri2kbC
	ObG01/WZ0WdzOeEaRdvsF4speWIHNh+aECrnQoQ29XDhtrRI/9eiBxlTFJyP9UzZKHy8HUd5n+d
	5HDIliSPTBkNLbOrXQEguUOVrCrB6ZAHR39tmmwWviSEYAsnr/VzECVctFj35YyJ/AJRumWULUP
	rZpL499C/xsZGxVdVKxgDGQKKm1CaB9mHNQRqoXw+jv7Qp3LfGyl9/I5R2x5Q1X2bHhNoF/lz3c
	9whyWGsooqInKXEIATxEuP/j+4wkBEoyYd7ccxkaed0zj9DmXmm8OIg==
X-Received: by 2002:a05:701b:4306:20b0:144:ed03:7c6a with SMTP id a92af1059eb24-14503fa40c4mr2958597c88.15.1790285907198;
        Thu, 24 Sep 2026 14:38:27 -0700 (PDT)
X-Received: by 2002:a05:701b:4306:20b0:144:ed03:7c6a with SMTP id a92af1059eb24-14503fa40c4mr2958529c88.15.1790285905117;
        Thu, 24 Sep 2026 14:38:25 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm1289075c88.13.2026.09.24.14.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:38:24 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:38:21 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        sudeep.holla@arm.com
Subject: Re: [PATCH v19 6/7] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <20260924143821.00003491@oss.qualcomm.com>
In-Reply-To: <20260924135201.850038-7-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-7-suzuki.poulose@arm.com>
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
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab59854 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=8d2wJ0fT7bLMqeC6Z9UA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4OCBTYWx0ZWRfX31LWO+NeXC/J
 8QKmfTe8SInJZfFI5KPqO+RXn7AcuHRG2CEYj69PD15CrRxIQ2gSXY3dwYdTrmlj+BJX0H+9nsR
 sTOeqJuq8hYPgw7Xd54mxugZPKYTCnR7i/p3u0m7mjbtRJE0EkukTOUxhgFqdcjE2jCEemL87Kw
 GvQ1F62bvnT52kzpyT8vrNgkOPYFTH0xfupYgQhrtH05XJYThl/FBZtvzOIwzN3jbla11D4N7rk
 HY2/RcD85U8/qoM1/pOWpLfGjS+hI4L1Wtw/AvAmsbyBAapjGJcm54lvUtCl1NHvazf0daK3Yho
 GO7xG7iM6jqZN0AKv4tCyEHutl5qDZXgouBJnGd6hq8HVkTd+Z2gMCSMK2Eq/VFMq8MaHhrdwaI
 U19U+mnSNvB/jotdU06tMYwsfPgInEjV+zWa7JvYd7ObrxKe4LECTstILyWuBP5SMnOg7sSzxjP
 3rWK0N0nuZf12LhqtnQ==
X-Proofpoint-ORIG-GUID: YSp7-i7qw1fZmqoNI2X_-k521DDVOZrG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4OCBTYWx0ZWRfX/yJxF07pxPhG
 +hDgrRjOv2aZnhx6/seCWRou36jZgvrnCqaTysS6UpDIS9O06RS07pN5YTGFUzEWAD6vzl31bmq
 1C7z3HxIFxjT9x//JkYW92JWMJKWnYs=
X-Proofpoint-GUID: YSp7-i7qw1fZmqoNI2X_-k521DDVOZrG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240088

On Thu, 24 Sep 2026 14:52:00 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> The RMM maintains the state of all the granules in the system to make
> sure that the host is abiding by the rules. This state can be maintained
> at different granularity, per page (TRACKING_FINE) or per region
> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
> all pages in the region must be of the same state, this implies we need to
> have "fine" tracking for DRAM, so that we can delegate individual pages.
> 
> For now we only support a statically carved out memory for tracking
> granules for the "fine" regions. This can be extended in the future to
> allow modifying the tracking granularity and remove the need for a
> static allocation by the firmware.
> 
> Similarly, the firmware may create L0 GPT entries describing the total
> address space. But if we change the "PAS" (Physical Address Space) of a
> granule, then the firmware may need to create L1 tables to track the PAS
> at a finer granularity. Linux therefore checks if the platform firmware
> manages the PAR region. i.e., the firmware is in charge of managing the
> L1 GPTs (creation and the required memory for the GPT tables - via static
> carveouts) without host intervention. Support for dynamic GPT creation by
> the host will be added later.
> 
> If the firmware requires us to manage the tracking or GPT memory,
> deactivate the RMM and reclaim any memory donated at RMM activation.
> 
> Apply the same checks when hotplugged memory is brought online.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> [ Switch to RMI_GPT_L1_INFO for checking GPTs and deactivate RMM ]
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

A few trivial comments. Either way on those
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_rmm/rmi.c | 218 ++++++++++++++++++++++++++++++++-
>  include/linux/arm-rmi-cmds.h   |   2 +
>  2 files changed, 219 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 0859f256e192b..1a8f3debd844a 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c


> +
> +/*
> + * rmi_gpt_info - Query the GPT info for the given PAR.
> + * @start: Base of the physical address region
> + * @end: Top of the physical address region
> + * @out_top: Top of the physical address region for which
> + *		the GPT @out_gpt_par_state is valid

wrap to 80.

> + * @out_gpt_par_state: State of the GPT covered by [start, out_top)
> + */
> +static long rmi_gpt_info(unsigned long start, unsigned long end,
> +			 unsigned long *out_top,
> +			 unsigned long *out_gpt_par_state)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_GPT_INFO, start, end,
> +	};
> +
> +	rmi_smccc_invoke(&regs);
> +	if (regs.a0 != RMI_SUCCESS)
> +		return regs.a0;
> +
> +	if (out_top)
> +		*out_top = regs.a1;
> +	if (out_gpt_par_state)
> +		*out_gpt_par_state = regs.a2;
> +
> +	return RMI_SUCCESS;
> +}
> +
> +/*
> + * We do not support creating L1 GPTs yet. So, make sure that
> + * all the regions are managed by the firmware.
Wrap to 80 chars.

Not relevant to this patch, but when are you thinking we will support that?

> + */
> +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
> +{
> +	unsigned long l0gpt_sz;
> +	unsigned long next, par_state;
> +
> +	l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
> +					  rmi_feat_reg(1)));
> +	start = ALIGN_DOWN(start, l0gpt_sz);
> +	end = ALIGN(end, l0gpt_sz);
> +
> +	while (start < end) {
> +		long ret = rmi_gpt_info(start, end, &next, &par_state);
> +
> +		if (ret != RMI_SUCCESS)
> +			return -ENOMEM;
> +
> +		if (WARN_ON(next <= start))
> +			return -ENXIO;
> +
> +		if (par_state != RMI_GPT_PAR_PLAT) {
> +			pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
> +				start, next);
> +			return -ENOMEM;
> +		}
> +		start = next;
> +	}
> +
> +	return 0;
> +}

> +
> +static int rmi_init_metadata(void)
> +{
> +	phys_addr_t start, end;
> +	struct memblock_region *r;
> +
> +	for_each_mem_region(r) {
> +		int ret;
> +
> +		/* Firmware-reserved NOMAP regions are not usable system RAM */
> +		if (memblock_is_nomap(r))
> +			continue;
> +
> +		start = PAGE_ALIGN(r->base);
> +		end = PAGE_ALIGN_DOWN(r->base + r->size);

Add a comment on why rounding down.  Doe we expect that to ever be relevant?

> +		/* Too small ? */
> +		if (start >= end)
> +			continue;
> +
> +		ret = rmi_prepare_memory(start, end);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}


> +
>  static int __init arm64_init_rmi(void)
>  {
>  	int ret;
> @@ -843,9 +1049,19 @@ static int __init arm64_init_rmi(void)
>  	if (ret) {
>  		pr_err("RMM activate failed (%d)\n", ret);
>  		ret = ret < 0 ? ret : -ENXIO;
> +		return ret;
>  	}
>  
> -	return ret;
> +	ret = rmi_init_memory();
> +	if (ret) {
> +		/* Deactivate the RMM */
> +		WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE));
> +		return ret;
> +	}
> +
> +	arm64_rmi_is_available = true;
> +	pr_info("RMI configured\n");

Blank line nice for the eye to spot the return.

> +	return 0;
>  }

