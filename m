Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC17A3876A7
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418922; cv=none; b=EnffLP0JrIkn0QK1lFZBa0z73ucHXVNCS/47OAAjfsSnW8GXsJelFv7BtiYjEGtt9oV2CpODqDNqYAB2W5cwxhuCOyVzLRwUbQKogYoV7R/GeO5j76I/65p4KoJ5NhSxYPyLnDpHtNHIw0q2DtLSP+Z+nQI8TMlEuBBQT+loUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418922; c=relaxed/simple;
	bh=fqJvoQBoKqoOv6P+b9IQ9mjZppt5o7nFP7HzcFKNFRw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iMYfhyz+viy9iSkC8j/HqV1+rH+3fdBHDo7eQ4/k27kzXhSv7jfPx+vxHlq+DQ6MZVUkv43YdYGk3ys+HqRGABFR+clotjsp0zxgQxkV78ArpR20QNYmpIbkAn4W1vhof4mI7MyRcLOmv8i+40X7R72+Gwu91EdBrsUYOYfalS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfjqILKR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXdVtpy6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfjqILKR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXdVtpy6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYwR01554381
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNbtU+fYM6Bse6/ahm7UnypPYDX2ByCgnI422mmbSzw=; b=YfjqILKR54Hcu7Ag
	fnSJtdYq4XcDNViCQaRA9/je893O6NtKOZOlV5Hc10pnpWZvK8b5DldupNePKVhR
	6D/YwP0eIaaWOTL4X8R1jlV1aLRiwePlvvuLoHjbxjkqbvtv2GmAQxizwPCuS8RA
	JQ5SrvTdezavOG9dOYfGQ2HxX65GcMH2mbe9yGk1NpyZXDT3V/LlRySk0JJtgnT3
	+2l6YogzrnmqJ1RMaWrkI0irds/sZegCTxg0Y35a6OmO2jFiASRY3bjPawZnL/An
	bicjOpWu7lBhZkFxAZF9tH0dRLQNfhmUoIqKRJidebYXpxmobzm5YBwW4jfTh1+O
	aH0XXw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet0my3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:48:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso5958230a12.0
        for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789418919; x=1790023719; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oNbtU+fYM6Bse6/ahm7UnypPYDX2ByCgnI422mmbSzw=;
        b=gXdVtpy6jubHvu/va/WUI0bY9fBbKreymdIiuvUBjPY9QJPECUgAxmUbQbYcV1Z+96
         9hjE42XIxa2+c2EeCBShu8FqJWEb31jzNlDPqFb0cIfNDAtU1c7vyBYyu1CJ8ZLBwPMt
         qSQT9FWIiQNku7BF15w/c6ZJZKhytMlnaBbbpgVAUBREVy3RJ8542FZaoyVVLGGPc5HW
         V3KbbVe8MDOUtuzwQH9yyZvJtL932zYW4hJV8EuGY1pF02TBaT0hbbMSXrcOKS87ENOr
         +QYYa+3ulO7DCYp22tiFWnTZb/Tt16RoWNnaXmrZiQtx9cgzNYTMqNfLywUsKdARbcGM
         z78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418919; x=1790023719;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNbtU+fYM6Bse6/ahm7UnypPYDX2ByCgnI422mmbSzw=;
        b=YLzUQx/4mRrq5+dbAQ8fmbcoBHkvwGR0d//1IuA9wxJS+yxH8RQL5L+gU9MuwVmkJh
         6J0LvliWHc+Xc9PDNEHzrj4BoqjYPE5BLqFA5kmSdqWA8jGRtAQGZ3WCHU+UqzentJ3V
         2KarB11Yl+zT9zR1bvXvhAVhuN+chRK2DXMCD6oqu+Y7HsKXbbYDbCY5llySX8oyQdH0
         7RHNTkPAGTUWp3Dh03R9QFa5o/hjDqqXtq7Sek/bvvOciSueOkpk6vDLkxSNRHu9WLZA
         xuXMOdXJ94111OP/4K60S+GX/hZHJ7z5WbORE2ihLsynY/OWOltRPOKg675WSSk1Od5U
         7ZxA==
X-Gm-Message-State: AFuF++kyQVdUbMeyl2QDGpi9IJo0ZaWtsDotdUuLCHlup2Lj9M41W8dy
	A3NvILpzFtiqCc3VbWxNoO75YkMAPNXbUjuAjASklJZ83T5jwXCadaUcDXYWXVKkjdZByCLGL99
	OHylC7JG9ycqYAvbLO2VtTySyaBsgbSBMGh4gPRiDzkoT1KFFAuoQKzOQjveoJWHk
X-Gm-Gg: AYBFou2HD1IjU3MmSyd/j3jFqcsbQH2nZIgtw5qbQIh8NUC0IkKgFI/EAzvPxjnx7ko
	T/8MTrgOER8Kht/SJjGBbtNs/ebOSqWtSANzo+pXqnqTwSRuWXsSnxhjXQWgVZAQp4jG+e3CavB
	SFhA0hBonQrEnNqxnJqB4KrW6Pfl9eex9eiROmNtvE2b9gU7iBN1FR+JH1pVzcAHVril5RzdrHW
	uVaeiFFDv0jiL9A7/pAUgJbipi2ZtEbjVTWnKVowFSWEDY3YcRzA7XGxbWFRbUvWET6En7SG6M9
	NWZwkCrRC0hkgl2tkdfuSrKh7kxbi9NNNkiLoei5flG4tcusbvyUhnpX1TZT5oDilKZG8TiRXcI
	msD+mnU99jAGQvICK0O1LcqUWm0Y=
X-Received: by 2002:a05:6300:6708:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3db405679demr8759762637.19.1789418919015;
        Mon, 14 Sep 2026 13:48:39 -0700 (PDT)
X-Received: by 2002:a05:6300:6708:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3db405679demr8759688637.19.1789418918602;
        Mon, 14 Sep 2026 13:48:38 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm18430177eec.9.2026.09.14.13.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:48:38 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:48:35 -0700
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
Subject: Re: [PATCH v11 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
Message-ID: <20260914134835.00001fb3@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-6-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-6-aneesh.kumar@kernel.org>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfXwKU9WkbtjsMW
 FtG2SCsmnwDmC+B8KjtqX8B/Z9jDHyj2oBsUu5lq+wSdfux/1jNlMg2hTOatf1gQpv3+XMJnAtu
 DgI+0cPuBKYx1HAtWdmiYOXKzW5iKIY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfX1pnfvCw7Jq3T
 lLtVJUunsh4AbeONEBR0xD/bBj9/bKBHuYJHqUciSc8yk+zLzm+MGOiYBetc+94DHmHAVNh0WRg
 J6x/wl6RSRQ56VQMT8uftcAQguQeFoNZvIV2AKRwzkK+flWNGhkL8p/dfs461Evh2N0+9YJZ2Fo
 p+Rf+oF7/0IkVB4GxClf57fcviJ78z3FRYzLCTGCfFMn+50l4LtPR3uvsEJBwHE83NgyiALIHAH
 gj0/cXpC6HYDkSjV/QEHLidBoewg8Z/XDf+IEOiK0NlYbkJRFm44GGOCWAXnChURwhP0gc8wrq/
 C4O3TLVGbFiuqAxJhA3nSJ09W8jmlxPpj35vYTjjwI0mi0AlGOGVE11t8g+xMmIvK+CtJzGEV0v
 HsRoWBgKfOrt+22L3XWSXKniv9f4eTD7CdIOobhwxDbvxrPVi9if96O2zn1nCJtFVfNuJcXuCJM
 hAeNnXMuOSX6YLUum1g==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa85da7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=WpFFXPemFeC_EDwlIHcA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: H-HHHPNVDiBDKKQDhpJZ7GQdBZEB9wDC
X-Proofpoint-ORIG-GUID: H-HHHPNVDiBDKKQDhpJZ7GQdBZEB9wDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140296

On Mon, 14 Sep 2026 11:35:09 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to main.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.

Should probably mention the structure renames that you have in here.
I wasn't expecting to see anything other than build system changes and
a file rename.

Jonathan

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/virt/coco/arm-cca-guest/Makefile                    | 2 ++
>  drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
>  rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} (97%)
> 
> diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
> index 69eeba08e98a..7564f4fcc4a4 100644
> --- a/drivers/virt/coco/arm-cca-guest/Makefile
> +++ b/drivers/virt/coco/arm-cca-guest/Makefile
> @@ -1,2 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
> +
> +arm-cca-guest-y += main.o
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/main.c
> similarity index 97%
> rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> rename to drivers/virt/coco/arm-cca-guest/main.c
> index b741643d1364..80659f0885e9 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/main.c
> @@ -156,7 +156,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>  	return ret;
>  }
>  
> -static const struct tsm_report_ops arm_cca_tsm_ops = {
> +static const struct tsm_report_ops arm_cca_tsm_report_ops = {
>  	.name = KBUILD_MODNAME,
>  	.report_new = arm_cca_report_new,
>  };
> @@ -177,7 +177,7 @@ static int __init arm_cca_guest_init(void)
>  	if (!is_realm_world())
>  		return -ENODEV;
>  
> -	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
> +	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
>  	if (ret < 0)
>  		pr_err("Error %d registering with TSM\n", ret);
>  
> @@ -191,7 +191,7 @@ module_init(arm_cca_guest_init);
>   */
>  static void __exit arm_cca_guest_exit(void)
>  {
> -	tsm_report_unregister(&arm_cca_tsm_ops);
> +	tsm_report_unregister(&arm_cca_tsm_report_ops);
>  }
>  module_exit(arm_cca_guest_exit);
>  

