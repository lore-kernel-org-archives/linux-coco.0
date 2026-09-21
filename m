Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB6D51476A
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026152; cv=none; b=lKDKhmnwNAGbvHBVv6APGo98wOjuv5u/WGlj0nMOI1JZOs5ynHmPArKoF45FCN6SxQI8vWWxTu7ATCUwn7yUJiaCWmpQrLM9B/5eZ69TvHh+Th8/HGId0N7p5C5R9e89sPZR84eFlyIMmNQe8qDCYBp/eCc0BMH/XzSMxJ0tGJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026152; c=relaxed/simple;
	bh=gLY6HUm8Fgpr8Ezq0Rtau7ndFBb0bwJOlxu/UESTFNM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAl8ONtVZCgdi0wQ9/VyKitOsUkS3GoS4GaQh1aS6wQkxxbFT9JV8P85stQQQiofxCvvhdyV8snEwH7c2earqgXQkgXHOeeMgEsLeY9T2g2e0PIFiPV3QVfvW/i9BOd5ke7YtaTOcut6vb7qcY5grmtzzDC7Dut6BoMrWjBvggg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTU4lB+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxEhr1Hd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTU4lB+B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxEhr1Hd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKexnj2892058
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfLBfPT4P8YTcQ8clLoZdz2Hz7ChZoOgs/WWhX6OuK8=; b=GTU4lB+BBWko+ahD
	WLILQlwA00dwI4xT3PrluEnAwoU5OMSwBVsgqduNQS8GI01xMCib9CJP2bobH+Oj
	mP84brkPaguPWG49c+1pPUh3ZQSCIdoutRYl+F8niVxgRgADPGHPmt5VNZQr/hEy
	igi/fx/Z/D8GV4qjysVMVj51djoxhHz59ku1okilekdfELtwWt7HLZ22TilBTAql
	xgMq9PlxwPCDJUHXuR1xPe94ZSlF1M0lHk73H2s1PneEI/YH8rgvc11LQ4fr4rN5
	DdOMqE1F5tes5sfkYOtHrV18t0XHWZjP43oExADCb8gkTHqzjQi1rZ5oNLUIWaF7
	bgm4SA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw3euq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:29:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d02df2bf09so33514265ad.0
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790026147; x=1790630947; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SfLBfPT4P8YTcQ8clLoZdz2Hz7ChZoOgs/WWhX6OuK8=;
        b=NxEhr1Hdzk8LrI8mHC3OUfUPsBJ2fBxY6XDu6kg3PHoiONqu2uCqXKdllE5SLPXujL
         KG/+NO3NiLmBb3SWovLKw3VLRkE4ksLx0G3F6j03lUZbKTIFkNRAvC0LvCuI+5p7SZWs
         D9RJNczScMddYTM+SvqYk/aUSMmTALts9EcwemnBcOhmOcaxXfnpjpymxNtYJDIvQV8Z
         EY5OC21BPoSRbxC0/lGCQEsPtCq9d/OTdcuWAP/lLhb4PZKW4VlnmytP0TnOSAxbluoH
         q+bxZmGxN4SXXY6B+TD0KMLkAKGR7f3IVbtCdKuM40Aa4yY9lj0ZceQJuT3qpGgSkTna
         w+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026147; x=1790630947;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfLBfPT4P8YTcQ8clLoZdz2Hz7ChZoOgs/WWhX6OuK8=;
        b=RxQrhXjzStn7lDXWg+5Lt6EiALeAUqNKK1hwaqoU4MSLGjUSUs/3uE4hWSwiLSUllL
         8wed2uauHdN8GreIBvOV16KOnLe/LmAF6qSRoZ9UldqGkisogsXwxvWe1skfXATO+aES
         zmXIK/TVC3iEHtlzU6yoB6mbT7o/pCMSW9fJKsGPq3GMWqNdBS6tamwPT962T1Hg/5/r
         tgCgjsHzKMOvJTHgd6wi1uqSVGnnLR7T+BOy8R5/EzUfm2gZOvNoS4eBDXJfyiO4hm83
         rzV9nJYHwcnrL8aHx8cTQiYH6KmXDhvfBKLieLzK3TaBvQIXRPBZBOanB1Hhn/1c8w+g
         otkw==
X-Forwarded-Encrypted: i=1; AKwUvBzTTmJIvcMgMTc21J2ZBC44sMjoxOaKXT3rT5MnzbBJLgwzjvxwUfNkYjI2VIORN0bGK7K8s0g0PAB4@lists.linux.dev
X-Gm-Message-State: AFuF++nmLuZk4p4Jk3spywNNZjPiqRJY9CZAauKd0VwxV00vKnao6L9l
	A1mAo5D60vyvyKirSRpnc01TLQEKcq3Huv2QXiM20SrsFOFKU/FSzb+upV9wS3kumxQG06tkj7n
	zVFxXg6+9u6pz+GkOEEjciZbcyoR/OZ9i9zNNjcOrWPILOQX2TKr+oCx7/JTxJeoR
X-Gm-Gg: AYBFou2bzWcRhb8luYnRfNtdhyTyO8KiresTkqxAUkXU29Q+ERWx+1yh3kYE/DIsglG
	Aqm1N5jG5pqSSPpv5jLrGWKw0pQ3GQiY+hAZqhstGMkNOawIlRuO+xvjovJ4PxDmvgajq2Q2anj
	Cd4VtS2r4alfp/2QuiRQW9/tgaBj/eZfSSwotPcuRfG3WIvdPodppZRe5AyV7GCQAAb6fTBROLi
	joPWLwk0hOUBpEBY4xe0pP8EgzJYF9i0X9ZnxHXpGceXo7Mtyb5YlXDKx0YGbN2Ox5l/cvl2SM0
	W9G/i7laHIQ1M5RmdnvFc2+fu8h4Vla7v2yOzxVHoLdxPxaLl55MB3lSvuN9BAxyIZ231aWsNFg
	pr4JrEx4tBtxnkDUZQbNRuFgOiw==
X-Received: by 2002:a17:902:e745:b0:2dd:ad73:c98d with SMTP id d9443c01a7336-2ddb1bdefcdmr158852195ad.37.1790026147206;
        Mon, 21 Sep 2026 14:29:07 -0700 (PDT)
X-Received: by 2002:a17:902:e745:b0:2dd:ad73:c98d with SMTP id d9443c01a7336-2ddb1bdefcdmr158851845ad.37.1790026146755;
        Mon, 21 Sep 2026 14:29:06 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5eabe1b9sm780432eec.2.2026.09.21.14.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:29:06 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:29:03 -0700
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
Subject: Re: [PATCH v18 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
Message-ID: <20260921142903.000071d7@oss.qualcomm.com>
In-Reply-To: <eb4a30a0-abd2-4334-b5f3-62621ec5a19e@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-2-suzuki.poulose@arm.com>
	<178978126540.2352296.16845657485139032765.b4-review@b4>
	<d7ccaf22-5bde-4344-8bf0-a5a17dcac0f3@arm.com>
	<eb4a30a0-abd2-4334-b5f3-62621ec5a19e@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxNCBTYWx0ZWRfX/KLCYdYr2Ly6
 +quXN3q/BIQEu13hdI2Q6LzhdqnwlQBEOMmGBHROlM6DSwi/oCY7H8yUFU/7axjAXwJdX7AdAJR
 Osoo/ksnagOY88UB8O5bhTeoShdPzXYWw6NngF7c7bvMsS07vqbdU73w6fSD+d5/4wMdEodcooL
 9SMZ7dInPbOhKjav1spCsANmGl7Sz1cYcsIFjRKc5WrIVhrQoYM7CeIDFNiqza7MG0+PDDOHPOt
 NhnIX5+67T9hgg0iJuxmaXWUInn6Vbq/5NJk0Gk3/LL1Tq267gGr/XNzsZ+DYWk5/V4Xi4Cq8Yl
 m2NsEFLudAZGg8VfckmX4i8G86znubkjNZMb9MMJhtrp0Fk39RB95oBTclGHCs0fJMQ3I5hd7je
 adOcVpOIbA++RIoq3mnxaQ8aLKRO0MlObd3x7Hn7EDkqlYGKLBYrvMBFJeYDhrUsGazO1ugeH4D
 LUEkEK0FgZebKZGZLtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxNCBTYWx0ZWRfX/e+C2nbMSkhl
 6nZt19P1ThAttCRK28gFGmce8+ZF3nHPOYBEkp+OKX6CumJLvBu+oDGCw5NziLFq4gqWw54U6Y2
 gZEEz+fPO2vbbnCzabzNNV+h2GAgucM=
X-Proofpoint-ORIG-GUID: ZLQSyA06o1v1TjoCjT0QTEpe7BR9QfHT
X-Proofpoint-GUID: ZLQSyA06o1v1TjoCjT0QTEpe7BR9QfHT
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab1a1a4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=ZpRu-6ZVBUCh-PS3OmgA:9 a=wPNLvfGTeEIA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210314

On Mon, 21 Sep 2026 11:14:22 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 21/09/2026 10:27, Suzuki K Poulose wrote:
> > On 19/09/2026 02:27, Jonathan Cameron wrote: =20
> >>> The RMM (Realm Management Monitor) provides functionality that can be
> >>> accessed by SMC calls from the host.
> >>>
> >>> The SMC definitions are based on DEN0137[1] version 2.0-bet3
> >>>
> >>> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
> >>>
> >>> Signed-off-by: Steven Price <steven.price@arm.com>
> >>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com> =20
> >>
> >> With Gavin's nitpicks and the GENMASK_ULL() from sashiko, just a few
> >> comments inline.=A0 Mostly on subtle inconsistencies that really don't
> >> matter that much.
> >> =20
> >>> =A0 include/linux/arm-smccc-rmi.h | 497 +++++++++++++++++++++++++++++=
+++++
> >>> =A0 1 file changed, 497 insertions(+)
> >>> =A0 create mode 100644 include/linux/arm-smccc-rmi.h
> >>>
> >>> diff --git a/include/linux/arm-smccc-rmi.h b/include/linux/arm-smccc-=
=20
> >>> rmi.h
> >>> new file mode 100644
> >>> index 000000000000..214d6228dfc2
> >>> --- /dev/null
> >>> +++ b/include/linux/arm-smccc-rmi.h =20
>=20
> ..
>=20
> >>> +
> >>> +struct rec_exit {
> >>> +=A0=A0=A0 union { /* 0x000 */
> >>> +=A0=A0=A0=A0=A0=A0=A0 u8 exit_reason;
> >>> +=A0=A0=A0=A0=A0=A0=A0 u8 padding0[0x100]; =20
>=20
> ...
>=20
> >> =20
> >>> +=A0=A0=A0 };
> >>> +=A0=A0=A0 union { /* 0x400 */
> >>> +=A0=A0=A0=A0=A0=A0=A0 struct {
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 cntp_ctl;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 cntp_cval;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 cntv_ctl;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 cntv_cval;
> >>> +=A0=A0=A0=A0=A0=A0=A0 };
> >>> +=A0=A0=A0=A0=A0=A0=A0 u8 padding4[0x100];
> >>> +=A0=A0=A0 };
> >>> +=A0=A0=A0 union { /* 0x500 */
> >>> +=A0=A0=A0=A0=A0=A0=A0 struct {
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 ripas_base;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 ripas_top;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u8 ripas_value;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u8 padding5[0xf]; =20
> >>
> >> In various other places you just use a u64 for a u8
> >> + padding. Why is this one special? And for that matter
> >> various other fields later in this particular structure? =20
> >=20
> > Please feel free to point out, if you spot any. I am happy
> > to fix them. =20
>=20
> I took a look and the padding is for extra "u64" bits in there.
> e.g, ripas_value offset =3D 0x510 and the s2ap_base is really at 0x520
> not 0x518. Same applies for the pmu_ovf_status and vsmmu.
>=20
> So, I would leave them as they are. The rest are consistent.
> e.g, num_bps and num_wps. in realm_parameter
Ok. That's logical enough for me.  When no padding happens to follow
that goes beyond the u64 then use that for simplicity and if there
is padding anyway use a u8[] that include the rest of the u64 and
the next bit

Thanks for talking me through it!

Jonathan
>=20
> Cheers
> Suzuki
>=20
>=20
> > =20

