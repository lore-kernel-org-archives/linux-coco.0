Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1418935A397
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269404; cv=none; b=bO4GRL0d69+ZBHJ67YIQfz7KdkFNS2uK2/b3zkXreRQVkXF6qAYxZ469IKDBPjIDgaHEvI9yUllgFukBNbIsKuo7ST84fn87S8U/UQ5vLC+jACXSB8v6vMDfO49j3lGo0/NxUohrt/Sd/joWgQzaxXjdaQzR3qKC0DlzjvO1g5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269404; c=relaxed/simple;
	bh=e77wK3Tjm1qlndE52YnpbAootNZ/t81SF51Mi76xBSs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D1L83uj9+4lcRkEFj8hdv1VC0OM6647ervdR1Sv3LoNJHek1FjTESQBGV6omjI1EOeBqX1Yhwp+lln4qLAODWgGMtDQ6UDSX/x0BRu3hen2MzGqtgvUPpefQzoNcCWDwJZvV9UXNEo6f3qi1bNvE5BuOmTPPLw3dhxVLwjtFMgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+HnZ1pl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eK7/6PTh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+HnZ1pl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eK7/6PTh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFfNmt1279204
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 17:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32xAgp0iORpg4Acec/AzJvfVNP09X3eJZq2Lg8ig1hM=; b=A+HnZ1plxeuKDVQG
	N15/ZpJVehZ4hzwOaRrr9lHfc1q466qhpy3LxhnXgsF+P5nCduqUZ8Nxw9shRQHE
	X26I3PaNjOMXaQoDKLWk1j6mu9REbH9Z+Jna34491FRdhLqYKqFirVfaClrmVox0
	1CkbwVdeju8Mrxiw53vjPejXVebAzxwIf5L9KgoCHAtpb2rH/xVoW8g5IQHiavPA
	ChyTj9GCdYCeu7hHsbl6MZ0ESyqjqmbcVmAiLVCYQXx2tu6/j6FZnsOrCEdj4UKD
	i0edVhJUmMy2xx2amxOLlA2+nhZtPRsUuTGoCRctQqyAh8O/gRZAT95+zpGOvMiK
	qraX/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc9shr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 17:03:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so90431a91.2
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 10:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790269401; x=1790874201; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=32xAgp0iORpg4Acec/AzJvfVNP09X3eJZq2Lg8ig1hM=;
        b=eK7/6PTh0tlAOVN356pDnhNzKzDclvsnnnFxnntZnO44AGeG73SUZxGNLIm1/74EO/
         OVG7aRDO3JvULoZBNfEVunvRCN+RdmrQg25TnArwsSUgmaGGd+LpWBX7/tQp2s1o/R2f
         t2wEOoHQgYdBsYUJxsr4nE4+rTkG7EFasBbx3ZYhEk39NOfhuvCwSZdVDsWpwARjzrBS
         vTJWD6dEegO/NtldRVbPUwktyjLk305jzUfxC2yjsJ46K0ILndavZa5eZdXf+WhBcBjh
         q4SUvOjbRixOL2bYBVj31bSVsjpFUDfkYMjleswLme/Y5Jm+P5AtaMXRIgqtbACtK5eb
         LsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269401; x=1790874201;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32xAgp0iORpg4Acec/AzJvfVNP09X3eJZq2Lg8ig1hM=;
        b=elkJv0YBGM7kx6JM5bmz0OaN+9+EZo3bNYtBKAAiLI+IFpQRJkHIffpQFGDgHMfh3u
         tasGJzb0leAGCqXc96T2sYMQDkeIhDl3ARwAHdg47S+tg48zgittW6ys52ofrVkGuHQr
         hjmcPx9R9aXarETN1bJScPRooQZ2kHDIr9pwbAfQexI1p1t/HuzUMbUAOSujY8umgNh7
         a7mO0+QnXsCH3W7dCu5/IbhLlAGhMlj2M2rlknQglIgDnEtV/f3DppgzuywmQjnrtOgU
         9HUBTYMBgI59D8TI1tIBbtY4WI5kpOVTwybshwvH4rB9v07oe49sqPRphTejmZZ0szuf
         5SJw==
X-Forwarded-Encrypted: i=1; AKwUvBylPSipErm4tA6pfkxEYl4E4esfO/TW+gO4GVUL9bl747vErdg354pCPWiZvuiGvd0Us43DYWtKPvbV@lists.linux.dev
X-Gm-Message-State: AFuF++lfu5ceVAJOcqvmiGt5xQQYq1Far2ibubUY99lSKuso5tG6BUj5
	+fau5frbnnbp5UwUGmNN6UU8OOJ3zh48Xg33Lyl0sr2D4qFsSXMl/iXRx2uWmuekdGMjaerDzKr
	2FezVZlmbDAAq/Gwb6nEo8o/2Cw+kP4b0TkUeYc9H5uhcUMZCUynpLcy9by62TFHh
X-Gm-Gg: AYBFou31vRAmRqabyZzZy6BTH9BA/LNt1V9sHlzQliLlgwIFZMppHwpbhw0wzwCP9IS
	mmFplKkdZw/mrtq9IlUF/oix8p4DiQOjz6Y1NLiJv5tSydkrqyZ6ipdZD87+LDhgCozwTIDuJid
	y/uUSMixkM5ChCST7IgSb2VwAVN5lQYF4h+/PFy9zsGEjP5dl3jju3paTgtELVPnp6NselRcDlP
	dILTEzAwWk/bBQwHepi5yWo8ZQSj33MJAUBLyoz3VoxMGjikrTJ9IuosrOxH05opSUTYgvw8ahn
	qElOQqBmGvNIKMuVQ9OiWyXCTx2U04gf73LXlOYd0i3r3ao1ZDBE0L6DGC63HyO6PI47DdgZYva
	Ny9WESVW+7jsJeiMlf2aR/+yLeSMtFnFpBat2Z0fW05JcVr+ujmuheA==
X-Received: by 2002:a17:90b:2752:b0:39e:6c6a:209f with SMTP id 98e67ed59e1d1-3a098ac28demr2636452a91.64.1790269401169;
        Thu, 24 Sep 2026 10:03:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2752:b0:39e:6c6a:209f with SMTP id 98e67ed59e1d1-3a098ac28demr2636404a91.64.1790269400632;
        Thu, 24 Sep 2026 10:03:20 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa0bsm5582969a91.8.2026.09.24.10.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:03:19 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:03:13 -0700
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
Subject: Re: [PATCH v19 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
Message-ID: <20260924100313.00003be7@oss.qualcomm.com>
In-Reply-To: <20260924135201.850038-4-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-4-suzuki.poulose@arm.com>
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
X-Proofpoint-GUID: oDdDrJ4AKHu3Jm2kfU9gc2Me9cE6wq0N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX0LR/NPdhi7jT
 37CpByCdvw+Ro7EmIAfyiXq5Mnt+2lkZtpAVVEcRrd+Q7/rQM/AggeGp3YaNiU0cPdCupcD6onr
 sUflgMWbJnN/dn5kXjeEGQS3c4+2C6QfmAnabywgl6poFriStqmJ+V5s7b6CNyfm/Cb81/42+Pn
 DLZ/wki1Q9ndYVawIbiaBuHBminmCuEeQga8L1hZ9HZsZjAL3CMnDA+3fhv5LfSSdLRZGhz+7tI
 +LZt+ZvIttwnQSO3DnH/986eNemteDJGG/xWbyK1M1LFu6Eu9VYCMehQ7xdJAI2U8HbgHxZGXUj
 4VgJrJtsLvcPCm78ThC9pYHgwv4IDvxl0/knEBZylOjKRsoRsbjhx7yGzOuIE5ChiLsUMw2IFFE
 bvuyWPxiqJWMjZzVIle/P/bhzazqoErZ6AxUNZMnWgFASMHV6ab/9S0i4BKHVDckrHVejr+xuJh
 1qwxcs13U3y159ytnOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX7Nz4Nz/39aBN
 dSLGqnAFiuuzx9zyHRgPuJ/7CJLtIts2QNXoilGa6cN4OG/ZP18EebCDHKbvQTTRy3T5+OgNxb6
 JaZlW3bvB/Nly1D7Xoz1Ax/qXkAU+JI=
X-Proofpoint-ORIG-GUID: oDdDrJ4AKHu3Jm2kfU9gc2Me9cE6wq0N
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab557da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=t3n5nvtZY-KuBPRqFMwA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240069

On Thu, 24 Sep 2026 14:51:57 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Hi Suzuki,

Some trivial stuff inline.  Assuming that is addressed.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_rmm/rmi.c | 70 ++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 3baba931f92e4..c9ea964fd9081 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c

> +
> +static int rmi_configure(void)
> +{
> +	unsigned long granule_feature;
> +	unsigned long granule_size;
> +	int ret = 0;

Value not used.  Fine if it is future churn reduction, but I didn't spot
where if so. I'm guessing left over from refactoring

> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		granule_size = RMI_GRANULE_SIZE_4KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
> +		break;
> +	case SZ_16K:
> +		granule_size = RMI_GRANULE_SIZE_16KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
> +		break;
> +	case SZ_64K:
> +		granule_size = RMI_GRANULE_SIZE_64KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
> +		break;
> +	default:
> +		BUILD_BUG();
> +	}
> +
> +	if (!(rmi_feat_reg(1) & granule_feature)) {
> +		pr_err("RMM does not support %luKB granules\n",
> +		       PAGE_SIZE >> 10);
> +		return -ENXIO;
> +	}
> +
> +	struct rmm_config *config __free(free_page) =
> +		(struct rmm_config *)get_zeroed_page(GFP_KERNEL);
> +
> +	if (!config) {
> +		pr_err("Unable to allocate memory for RMM config\n");
> +		return -ENOMEM;
> +	}
> +
> +	config->rmi_granule_size = granule_size;
> +
> +	/*
> +	 * For now we set the tracking_region_size to 0 which is the only option
> +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
> +	 * TODO: Support other tracking sizes via Kconfig option for other
> +	 * PAGE_SIZES
> +	 */
> +	config->tracking_region_size = 0;
> +
> +	ret = rmi_rmm_config_set(virt_to_phys(config));
> +	if (ret) {
> +		pr_err("RMM config set failed (%d)\n", ret);
> +		ret = -EINVAL;

		return -EINVAL;

> +	}
> +
> +	return ret;
	return 0;

So obvious this is the good path without anyone having to think about it!

I did quick check on whether this was to reduce churn due to later changes
but couldn't immediately spot anything


> +}

