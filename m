Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619B83B27F5
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419079; cv=none; b=CwCjsq2GQ7AgbVlc+NCyk+eS/5RR/xLnJ8tNsBjb9h/AFjFwKB0trpV81D42TwHmrgCcl7FeEm1H77uOGOhq/c3GGBn7IgHW3NJ3Ac7UnE0Z0WeAh/JwU17QXKsZXbCRyv0HnLiYJWfRrGd135Of1XW4xgnksSR+id6i3+eVFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419079; c=relaxed/simple;
	bh=QCGrHCrm6z85xo0wCTFxqu/1/t2FJyTJAeiwiDlU8oo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kE7gv+CGtM/tMh72bT+3PBOZ0JgzZLvS0TleLWjFOESF8VsmyXwLpWNjMJmJC9mVJQ9752T0C2uMKh1QHP3dfwF5oK+qH8SaAlz4hwIAiQFj4eJn5iEhpCf/tnGntxojs1OZ6BZt0yCo0colvvPs1xHTswqy5JOugLaCfdAdEys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQK/e0NK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnvlOaSQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQK/e0NK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnvlOaSQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYWQe844262
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	De9btpAcgFzmvF7mI//3qVjoSQFLmkKthDu+Y3II2EI=; b=XQK/e0NKNXsxiviu
	MFJhMw7Dvif4XKGgod9mheacclpN9cy+xFxs2bWKF5XHJNE47uuq1nS/WiXbKOS2
	XJqTDvR+Qtb6RQeeI4zEmar/U3LidHzBz8zpTEjt+Pb8kop3MpH/4b00FHa4B0p9
	whg1M5sfPfqDeAHHn68p2nyAGnuBxltiWm2T47QDDG0IQ0jNUBEaVMGQu3WN5GHn
	4zBQ61S5XS+KFiqV3zf6gKXbh7UiGz7PA6YAGE3BFlG4gmpvaqSAlzdHrnGRtZdW
	Kq7M+i+W6WdRjetOAxgoOrdtQmxt8QtoCbPLIZJf6p3JjohfzbUX1r4AYFYqGoYU
	sz9XfQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f30wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:51:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d54187d8b0so78468945ad.0
        for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789419076; x=1790023876; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=De9btpAcgFzmvF7mI//3qVjoSQFLmkKthDu+Y3II2EI=;
        b=bnvlOaSQVntTGXI/c3ESiCwLpfPqV+s/wA2NMB55e4yQndGpC0cy//CNNQ5/q/6juS
         P3Zpjsm4Ah+5dy4IkYn7UDKbbUKn0hcSSRGbW+A/9vRWuDyx6a8hyYPqVHvsoM/xTiLM
         8oDvPUgbs1j7TXlCi7Qr9vGV+mqsGk82qz43A4eKfIDo8xHuOQrMyuYMZZ+axpMb4JNL
         0BsLnFzSSmBd4kUccg3rx6pCVOg6RvTtKbuvd8WZcjlBbwXhOcsPodXKpdjn5qkXriOA
         zVCyvQUOnqtDOZdZjr8IAqo/B1k4EYFGtv6Akg8bU/KuVZFMqFOCtfYXRJBHOiyW0hBW
         YdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789419076; x=1790023876;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=De9btpAcgFzmvF7mI//3qVjoSQFLmkKthDu+Y3II2EI=;
        b=iSo3aENl/oEjsX9JF/sSPtqzFCYkgV23KNyMU58hQL/kpjCUVOM2/+qKNa87hnW4b9
         eIzvhSarK9GosAxBe6BzgnutPOjM56HD2/hWg7ynV2WWqgXWoHWUbc0OOix3ZajK0N9O
         QtSeo3sKaU/Wvt6eXlU+kYb0crbxIh5rA/SUjzbH3Y6poMdi6H2OhDIvzlS6uwVudm/r
         tt7DNTKCsLAUIiKSq+L/bNqY+d4sfEPQXy5DX1LMPG0CdcP7RtqebrCmB1uYABbepCjp
         wr3NTJKrJsPi1AaC++PCD1k7oym6cxkimwNnOrVyQDU21W+WIeTvMfyLUn649AQFlYgL
         urRw==
X-Gm-Message-State: AFuF++nhHPqkDd8ZxidlcT28KqWrtwpbsnFoTGq0ICpnz0aoXjJOX6YK
	mGRdUyXQPoF70h8qzDOKhqc0gmJQfaLKbeySWu42wv7caySy5IhB0cVP7REc9bLqBu68duM2G5G
	wX2iWuEA03Kb7lpSVujCzTo6HIaI4WIHOvBZW7vui5H3QSu1uFQSkRwAvSKbwbzzm
X-Gm-Gg: AYBFou0AMnNf5KKXOmiiCEQS35r3qZhEMOzQWvct30y0s0fPErS9JCjXSB2NV2AQ1uW
	OBxut2cli4kpSMLordmdVHzGslvU6dOCoXy8ph9bezcnIc4Z7t78J2LHNPT94zxmNZFD41S3wX3
	DUFUVEeBR8kUq5wHP/zxMmFMyN3DHsP9zKTHykBwTJ7c9iKUxqiP1mxU2SLq7FVPqkUByq5JHgu
	wl6XjfrE4lC0Fxl1fIem1fxzYbMWDlQf/coQusDsQ7JkLycqlx90Oo0NcFkHesA9EcqWLrt8W33
	73ao32VnTjsjXfOltvecRuUV6HvBnAnOnB0UFNQTMfA0Eek3VriBLqXm4BPKUWz5i5SsM9Vae0o
	+pKsqPm2Y/W7eMcav4yknYolVqW8=
X-Received: by 2002:a17:903:f8e:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2dd6c5d0a7emr85662445ad.5.1789419076339;
        Mon, 14 Sep 2026 13:51:16 -0700 (PDT)
X-Received: by 2002:a17:903:f8e:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2dd6c5d0a7emr85661915ad.5.1789419075896;
        Mon, 14 Sep 2026 13:51:15 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm27865013eec.11.2026.09.14.13.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:51:15 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:51:12 -0700
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
Subject: Re: [PATCH v11 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260914135112.0000684b@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-7-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-7-aneesh.kumar@kernel.org>
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
X-Proofpoint-ORIG-GUID: eceHhekorqVbAR-PX8MBUc2nf_4QQcvG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5OCBTYWx0ZWRfX3kwRmMmNKuOO
 JJP3E2xTXhB4WjomgQSecuHhwTZ/v9gJAd9IjybCtmfWnE1fp6Q7+jmml3G+RvKI03WoTbQ2RcA
 QufqK82DTmXyDRNPA04iyn9VPbSfrfc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5OCBTYWx0ZWRfX3HZ0G09Livkr
 KyqYMdlgx0/g6z5+9E4fHV/GmIcTSi+IeZZxBzF915PQw1tVvmi9QsJCN8gmP3haRwADPiSZJvy
 /ewgM32hVKBSFzFt9cOOqL9HZOsdVW5FbPaouvSHpubwL6lJatGAhvuuTpRUBLfj7QX23pJPcYl
 QVhYSWt5T+aQbQrzFFF1Eu8YClr/qemyvip0PU0KMa7f4XOzp69DUnGedUvKUu4BFAjXt4Y1PRA
 qfrQJ6gOW8Vjoi4mX/TVLrQf9jfOFCL1YH+CGfK+3yNKFFAKUrugdOuhf8x47wEsbjYnmxw5CfW
 dR9dvw0pryngwl8vcB9OieilH8CQ3uyw8KS1smscoCtmZtTK+XU5jJ627Sh84//SFRbS1+42LAt
 4M5SyxMQhfJ9T/gEISDwqoEfJdw3PFkzjqO28oqF1DblQ3VD5qfY260fqiun97oiEMQiF6BlBDX
 TkeqcMDMbDTZ8bfew1A==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa85e45 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Tpk7IuwJ_fedSR-JTnkA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: eceHhekorqVbAR-PX8MBUc2nf_4QQcvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140298

On Mon, 14 Sep 2026 11:35:10 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> is SMC and if RSI ABI version call is supported, create an arm-rsi-dev
> SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC driver so
> it binds to that discovered RSI service and keeps module autoloading
> through the SMCCC device id table.
> 
> Keep the old arm-cca-dev platform-device registration for now. Userspace
> has used that device as a Realm-guest indicator, so removing it is left to
> a follow-up patch that adds a replacement sysfs ABI.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

One minor thing inline.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/virt/coco/arm-cca-guest/main.c b/drivers/virt/coco/arm-cca-guest/main.c
> index 80659f0885e9..7b1fa008a8f4 100644
> --- a/drivers/virt/coco/arm-cca-guest/main.c
> +++ b/drivers/virt/coco/arm-cca-guest/main.c
d)
> +static int cca_tsm_probe(struct arm_smccc_device *sdev)
>  {
>  	int ret;
>  
> @@ -178,30 +170,32 @@ static int __init arm_cca_guest_init(void)
>  		return -ENODEV;
>  
>  	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
> -	if (ret < 0)
> -		pr_err("Error %d registering with TSM\n", ret);
> +	if (ret < 0) {
> +		dev_err_probe(&sdev->dev, ret, "Error registering with TSM\n");
> +		return ret;

		return dev_err_probe();

Having that on one line is one of the nicest things about dev_err_probe()


> +	}
>  
> -	return ret;
> +	return 0;
>  }
> -module_init(arm_cca_guest_init);


