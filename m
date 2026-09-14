Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838E949F103
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418375; cv=none; b=uQ170gfYm1x7vbb2eUQt7y8EKD5csMEXFtoGwwo9lH43/iKF6DC3LQW+L+uaVjQTRqeEFKWTVQ/E52noE08B3hWuE1XIs2vWtmTimACG9HjDN0FmlHLkd1BBvKzLHoJA/BlX8hDnleoN66tXSPb/2rX/v3bKCQ1zPe6SBmy5oOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418375; c=relaxed/simple;
	bh=89nldO+YQsi2DhvH1cafWv+EXMkOYKi6Wr3uymu5UCA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6zcEmZODq2sbqrS+8WxXav2XtmEPCePOVko2ndrW0/BKacitBf09S4xGdc9okDqfhAj47ZvNFEI50S9Kj8roexfYjk3uPzC106HxD7RZI1nLI8vOfQQOyqjRsuEBDquLv38OYijUY8A75PpuLP8nYRzxLQm8Szm3XSSdjvTsfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVTjlI6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQdwI0LX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVTjlI6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQdwI0LX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYQ7M1485156
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=; b=OVTjlI6+q919IrN8
	HWmJfMuqhD6af9p6Alllzrv71c5BiW0nGOMwOfTAi1ho12BQp5D3kiL4sjk5QK3F
	RuJ1tngn/AD6YVH3E0B3e3TIGa6mpAHMCH7krO5xb6l5AMAWGDE5r6/xjPHT5l9B
	E541GwSoMdoCws20sOm9HvB/IK1qwa+rsI4UpdIFpPIvEELIX9KeGHTygqcPzqZR
	ONtmMXgnSxxaWyDnF7Y9aMARlRI8JDXjdTPFLnjUy1d5vzRv0KiSwxB0NHpCVeX6
	werzNw49eEu42KM7gvTwgisUhDI9r7E8e3OW/8flf+6Lng7l0Db/0YFJGyD0+2zH
	FlNXYQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kt7xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:39:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso1587871a91.2
        for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789418371; x=1790023171; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=;
        b=hQdwI0LX94vfxcc4xFgTCmUYT9ynSmzUm1Z37M6uNpn87BUwRQ/NqpQDpI0BCht0Kw
         ZyHR9PdW+PR3TATv6MNnTo3/lObRxgmZQ0/rh1GCI2WGoPmhlnzWZ614MmHPWE3Sc4ll
         gTPuDckengAyJGZSNVnRLV2y5kjBoa8WJdYUPkkxRdGa7+nFP/9aHX+99Jr5by6dcAyS
         zYR7b/31bxdL25WmKkqFqXnLtPN55CVf/f0OZyUSrzDotb4kD1XBMu7UtaBNH70QbPlJ
         ScDtpJCTUR7SoNghuXvqaiTnDh2pP5yaKl8c0pB72SPCGrUCUay2O5Q1szx/JMKPGVxw
         c1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418371; x=1790023171;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=;
        b=QiQ4LZDDLdu2W13zqYS0zGXryM6YiB/Wqz+hSBuhEvN2vN4WBLwcNGKs+9XJUB9Y9B
         xL3MEYQmblLntT2aGeEH+7piWwLNwiv4CoObv1FmaFmgJSLe05dxRxXXbk8/Qo46m68D
         6r7VsPlElYNXsAJ2Dv+qeVJeYzAUZH9OIY6yFQDXIJxtsnPGjC2HA8SzVYoAn6qcO5k6
         VlIji4fnzOz54BzJFTUed75klymbKEPF509lqh52hBNXsNMSmM9rhR6NKy9k37Z/nIcI
         XxT1NFLHB9i3IUNN+qQY0zwliJIfkz507ft8xsasYQ8jC4zxSPGzRfX7Hnn6IxEfqzWh
         6azg==
X-Gm-Message-State: AFuF++nnoGKpesW4Kkvf3z1Ylk/uhCKM8zA/AhihiY/RNo/ZapTrXMFB
	WoddzZTFVGDxw3nsRYENWjkGVKOtZfMv1a37m/IB8DKZcGvPxk5FI2Q19A6Aal9ytVrm3w7JOCs
	b02olyF4vaXAyooUfBpfygb1Sj2ii+9X4Mk6ZXLrtZiYQDRsla36IfjTlNKwDVKga
X-Gm-Gg: AYBFou304qwHg6GTYQWX29K6bhP62cE+tL9j/5wHWet0sMYKKN0Qp3ziyhky2fNT2rE
	75m5YovY0J5FbKrcLYFvjYEAkaHGTJtKIQazr3yNXIXF4iFrnMoERvY7dgYvMDwIIVuTj0u+SUM
	l9iboZoyI1yvRlL8BXRhvE5KqgCinON95S+jI+Q57TJfNbukX8sG99oFlnky3NtLyBaaIjGN7qt
	+PIUgDf0iKrQXsW6ng+6sa7fxR7Wz3vkk05mWaONQ2e7rLtw8FZH/lXfnSSOXImKNNxUjOhdzov
	KXItGj06WKdRg+X+8QQ1A6aRqkbuF43xpORpOZeuypOmqY5ZlnzwoStRM0rnebdqlNwlGVa5pit
	V9NOCdb2XkVa7A1GFm19r4SpTWHs=
X-Received: by 2002:a17:90b:5806:b0:39d:f024:c7e2 with SMTP id 98e67ed59e1d1-39df024c8d5mr6541282a91.4.1789418370990;
        Mon, 14 Sep 2026 13:39:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5806:b0:39d:f024:c7e2 with SMTP id 98e67ed59e1d1-39df024c8d5mr6541236a91.4.1789418370475;
        Mon, 14 Sep 2026 13:39:30 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b759d0sm28514523c88.7.2026.09.14.13.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:39:30 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:39:27 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
Message-ID: <20260914133927.0000479a@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-3-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-3-aneesh.kumar@kernel.org>
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
X-Proofpoint-ORIG-GUID: VkGJDKRXE1npXAWzBf6jKiFoevPOXV8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5NSBTYWx0ZWRfX+PKtfhuQxYTo
 zKTkmSYnqKAGyb69n8hMm1GGqQwuN+X3zFiMmCaHCdNHRhS6IWo4fX8w8gipW036s68+1rCTUXz
 usLsdrTcIaYXwHJ6oKJqZwe9UGDca0VV+uLnlFPGN5oJibj+72eg3x9bG/gdQ8xSUk1mpCWyJ4O
 0ziHDgHFDD6O1Qme12l+2zVBUOTA3rZ278Zek5z0L3NHfdJa9CWvi8XV9PuO9BM6M2KNc/bAXcH
 ARuU2JXfs03L5aNhlkTTngmVMyo0UpXtq+lMJiMnYt2YMMdRPHgSGW/W9mwteKzPzZdD7/HjgF9
 BfL8IkoNQVNIXuxndB5tSIyy7CuglATfD4nLEaCVUw21z88ySb1WV5Dt8J0awi+raHu2Ta3+2Pf
 K04O/rtBOOrMQyH4APLE7G1jnSKowd0E6roClk/kuff5m0sPbAH/FIsieIrKcnt9BWZ+2Nhg/zj
 K1tEcnok5zDfzrRej7w==
X-Proofpoint-GUID: VkGJDKRXE1npXAWzBf6jKiFoevPOXV8W
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa85b84 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=hwAxrWSPLhvteNngLDwA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5NSBTYWx0ZWRfX0oQD7K67u7C3
 qAtrxOCcoOLuvVRIGS/3+Mlp1EeYBvnLhzc4OEtSVL66a27Xjtq2DzCegVZmK3vEMXQNneDShqG
 5H1zsS5JQcSdeY2vYYC+anW/JbhjC00=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140295

On Mon, 14 Sep 2026 11:35:06 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
> standalone platform device. Now that the SMCCC core has an SMCCC bus,
> create an arm-smccc-trng device for the discovered TRNG service and convert
> the hwrng driver to an SMCCC driver.
> 
> The SMCCC id table preserves module autoloading for systems where the TRNG
> driver is built as a module.
> 
> The sysfs device path changes from the old smccc_trng platform-device path
> to an arm-smccc device path. No known userspace dependency on the old path
> was found; a Debian Code Search lookup for the existing platform-device
> name/path did not find any users.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Trivial stuff inline - nothing that needs changes
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index bdee057db2fd..756c79204e44 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c

> +
> +static const struct smccc_device_info smccc_devices[] __initconst = {

Ah. With __init_const I suspect the string constant stuff I mentioned in
previous patch won't work anyway.

> +	{
> +		.func_id        = ARM_SMCCC_TRNG_VERSION,
> +		.requires_smc   = false,
> +		.device_name    = "arm-smccc-trng",
> +	},
> +};
> +
> +static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> +{
> +	int ret;
> +	struct arm_smccc_res res = {};
> +
> +	if (smccc_conduit == SMCCC_CONDUIT_NONE)
> +		return false;
> +
> +	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> +		return false;
> +
> +	if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
> +		return false;
> +
> +	arm_smccc_1_1_invoke(smccc_dev->func_id,
> +			     0, 0, 0, 0, 0, 0, 0, &res);

Fits on one line. Up to you though as maybe it's cleaner to have all the numbers
start on a new row.

> +	ret = res.a0;
> +
> +	if (ret == SMCCC_RET_NOT_SUPPORTED)
> +		return false;
> +
> +	return true;
> +}
> +
>  static int __init smccc_devices_init(void)
>  {
> -	struct platform_device *pdev;
> -
> -	if (smccc_trng_available) {
> -		pdev = platform_device_register_simple("smccc_trng", -1,
> -						       NULL, 0);
> -		if (IS_ERR(pdev))
> -			pr_err("smccc_trng: could not register device: %ld\n",
> -			       PTR_ERR(pdev));
> +	struct arm_smccc_device *sdev;
> +	const struct smccc_device_info *smccc_dev;
> +
> +	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
> +		smccc_dev = &smccc_devices[i];
> +
> +		if (!smccc_probe_smccc_device(smccc_dev))
> +			continue;
> +
> +		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
> +		if (IS_ERR(sdev))
> +			pr_err("%s: could not register device: %ld\n",
> +			       smccc_dev->device_name, PTR_ERR(sdev));

Could be friendly to anyone reading this and use %pe.  Up to you.

>  	}
>  
>  	return 0;

