Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134DC2E7379
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419633; cv=none; b=Jfs+V2RfG1udrsf+0hCW36oqZIvY/B335jYRpuzOS9gAlre7bzQhfQgBXqoLUFv3T9wkf4R7TqqpTz8lyWoJMZoWLwv8sQdo5ebpxuVY1E49fKRGK3Yvs6XIoC/1tSlvFSU46GgqLEz505HIV/iBbmxa2QJCEb84DIcSBc3u44w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419633; c=relaxed/simple;
	bh=CvFmbia3F+M8TdZTi0OKy/W/j30H2oa04JwaJ3sFhDU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGxwqt9TlzFhgC3XnXVgI1MIJdqbIxcqJmONZud3eKoCmH9JT6V0LoWE4zbW4kIq6ixSmLmOt6nkb+4MORGG8IPY9idnPObSfepI3xuEtrU/UXIdzCYll39022J/QMvqBGwuBjYzogxMXJ8wJ8ToI8cwva/G+9mULXDr0O52TCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADqzTKda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCy81wAW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADqzTKda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCy81wAW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYNIJ1702483
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 21:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAYEJxdeFjAwVE5L3W7h6pCWtSz8H6kR2tHLO5oA3V8=; b=ADqzTKdaK1WkT0OO
	CUcqr5Mq88hxvRB1ZxCocDO92SEb/w5sRiOWWdgG/KyIvF+kSvDr0iNN1pe6XL0M
	/61AhcKgIbDw6Hc2H9LSpm8fPQJH4aIS4OycV8d3v+koSlh4f5fJTCsRAGf9kZ7N
	uITo0CHQYtotv8qpKt3CTFafGIPsiCXcodB3lQhsXWJDjhSqqxbnpZ/46tCilJhp
	n5ZoCgX0/kScPmCJZEaTzf6U3kJRYr2yEp4+kPFQZYYKPWH2/o3GwZRTx3r2W62+
	9Zk47d7IV7SF7rnRjC7icOQ0yXZdlLlVAExAFABmr0PkB5kpitVHF0R6ghWUyrMi
	yYHdkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9ruy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 21:00:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3b126c9fso45057185ad.0
        for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 14:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789419630; x=1790024430; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZAYEJxdeFjAwVE5L3W7h6pCWtSz8H6kR2tHLO5oA3V8=;
        b=TCy81wAWF7yr4C4mUihAE2R5GoHth9o0raT1QyKtIFQyXBA5k0SX9h5lC7sADHyoEy
         mEGDm0VvheRT8JBr0fxGJaHKmZkCYHE1ubtWiQkzY0XUxSDkHlwCjuUynWFfTMvWBzC2
         X23+Z5Iq/JUhi037lFwz3sBv+AqJr0m3NXrUMXu551DT7McaOYI2H8bBOKxBWHXUrUhZ
         8D06QGOPZvM+6+fWA3NCc++/2ngA7bWrveh+hPo79FEkF65kdFL42iC3JF3abWLvwJ24
         nInkTKnkddBiMJJVcwKjxUc7tFo3z+M74rGzk1UDdoxaG/iNTveeRHBV3K2LlLYfYGNv
         2JAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789419630; x=1790024430;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAYEJxdeFjAwVE5L3W7h6pCWtSz8H6kR2tHLO5oA3V8=;
        b=A9WeoMHWimBVaytYcQPOsLqUPRcSL6CpkzbKcgC3o4hgF950DEpP+0sRW+RlxBZPuo
         FNL5jNO5+Zc/LTk5VLDcp8kdYb7/NXiGH0BqXaq2v93zNI9PBZFR2jsKSBRM5U+N7398
         BRXbKPL2iDHGav3yQ6Y2BUICPWOYq94PnUTXbNtvQ0QYp+9TbnYdtazKK0mmWbPuhzx+
         WoFOkM3d0RPi6wDYHX3S5tDsNtkekJnn2AewB5N7Fvk8eViEouiSEuxMUvYDgX2zDV/F
         Z7qHV8kxWHyJFkHAJ/cniz05McRx4PYK3nLKHqbkHfBy7UhIkDG4+nnWpEYvmzsBNWGh
         k9Kg==
X-Gm-Message-State: AFuF++mWDNVNMj0L7sdspRK3MrNO684aevlPxnzuF9luD16TM3JOmqLJ
	TOj6ADDf5jEKqjMrXVhknt2H/zYd/lp3HGpEu9DisQ5+dJcwnQmNzdy9LG5z05PbtRkglxEDwQs
	2rGfVI38fSSRDbFX4HQPuoGQUntjjednYQ+a2HSg+tXBWd1j0iFkwFg/vvVC9NKcw
X-Gm-Gg: AYBFou0+mZiuvqThq20D7hhHBZR6cY3HWbTS0sV91vOifMffPmj2rvItX7WQIfgPFS9
	aAtFS5CnZdZwDmbzIvrNSuKf0gSG/MIDfc7Rcxy45z5Z4lJ7Q1eAIJ+yZFWD9x+wSQNn4W2bIX/
	FTeKKTAySqJzMD43hsSHl4MvC0tvOFC8Zs07HVlXHFaqNM5zOYdgMtnnAiCH/EDFaFZxeoVb3oR
	U0UkoDegSBPLu0pACqZot5kRCwxyXBY+jPGkYUm6NoOdaNApqnQ9St1XNhVxuIKddiNfTVmqfAc
	9dJdVbztID6eRJ+1GmzGypKpaTVr75sERf0jyZVpFhjVhgiSfS3D/BFJv9MMcoTW5jo151qKTVO
	6TvpfM3TYPtwJejAJBTawK7EsIv8=
X-Received: by 2002:a17:902:e801:b0:2db:331b:e187 with SMTP id d9443c01a7336-2dd6c5f3c7fmr81467595ad.8.1789419629489;
        Mon, 14 Sep 2026 14:00:29 -0700 (PDT)
X-Received: by 2002:a17:902:e801:b0:2db:331b:e187 with SMTP id d9443c01a7336-2dd6c5f3c7fmr81465905ad.8.1789419628575;
        Mon, 14 Sep 2026 14:00:28 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm30638408eec.3.2026.09.14.14.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:00:28 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:00:24 -0700
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
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <20260914140024.00002024@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-8-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-8-aneesh.kumar@kernel.org>
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
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8606e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=JfrnYn6hAAAA:8 a=RSa_GfCpIaWGdN_FLdYA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDMwMCBTYWx0ZWRfX2RXe2Eq/rYBQ
 ILkTENQpm6Injs+pL7MOeHxVyGqTP7ZQJgnLaGzyZym9kutVvGfyQoE+Iuv3h5HMlCWec8wjsiv
 aDn1S3XBjVZS4QmrgxT9vvtELDDFU2TThwsD7pPcj10FdwelQ96BRzMlUnNQhvkpiCpI+1CGt03
 hhUQt27y67ekus7rtuA9k6vEHSeLw/rafYuFEcoUA8/UrpnpZ+9jnvIknAOaW3Ee/TI8nJdQfoN
 Nn7jxjl+YaI80cIVAUdAW+kDy7MTZSJFDGksQdbMCgP5rRkYD8eapYIMJJ28v9xsH/Q7tT4rWSC
 vndSRuX+n9+UesZQwoRFeyPMGR9X2qjjuQetto8Opo3iOcrk9rn9dDCi5ut8K0OpNrYEWbbj5jY
 dsq5mXuqPbREhNlFVJVMUAzEY9uCtQOkXiT4yw2VtdQka53t3p6Cqk+vaokvdd18fezf4OMrvEm
 zoKx14eg83Nr32oc5IA==
X-Proofpoint-GUID: q_T9n-_vJwxf9Ng1InfXUME46q74u_8q
X-Proofpoint-ORIG-GUID: q_T9n-_vJwxf9Ng1InfXUME46q74u_8q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDMwMCBTYWx0ZWRfX9gtxvqZGj63M
 sGhjbKhbmZlou1FQDucVAqUIosKWrdL7wXNzfXS9EDyUvyxj0Y9xrtBcQ7x095YI9RIRCmtCNKZ
 z/1I7F6jNDm04xsvsJleQcKPIpfRjGc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140300

On Mon, 14 Sep 2026 11:35:11 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The SMCCC firmware driver now creates the arm-smccc platform device and
> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
> The arm64-specific arm-cca-dev platform device stub is therefore no longer
> needed.
> 
> However, userspace has used the arm-cca-dev platform device to detect Arm
> CCA Realm guests [1]. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel device-model
> details.
> 
> Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
> for detecting whether the kernel is running as an Arm CCA Realm guest. The
> file returns 1 in Realm world and 0 otherwise, similar to the existing s390
> /sys/firmware/uv/prot_virt_guest interface for protected virtualization
> guests.
> 
> Remove the dummy arm-cca-dev registration now that userspace has a
> dedicated CCA Realm guest indicator, and document the new ABI in
> Documentation/ABI/testing/sysfs-firmware-cca.

My gut feeling would be to split this in to the new stuff in first patch
and the removal in second. That would make a revert simpler should it
turn out that someone has userspace that will actually notice and can't
be easily updated.  I'm not that bothered though as it will be your problem
not mine (hopefully!) ;)

> 
> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

Could make that a link tag.
 Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com #[1]
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
One trivial thing inline.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  Documentation/ABI/testing/sysfs-firmware-cca | 10 +++++
>  drivers/firmware/arm_rmm/rsi.c               | 42 +++++++++++++++-----
>  2 files changed, 42 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
> 
> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
> new file mode 100644
> index 000000000000..bf177d636b92
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
> @@ -0,0 +1,10 @@
> +What:		/sys/firmware/cca/realm_guest
> +Date:		May 2026
> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> +Description:	Read-only. Indicates whether the kernel is running as an
> +		Arm Confidential Compute Architecture (CCA) Realm guest.
> +
> +		The value is one of:
> +
> +		0: the kernel is not running as a Realm guest
> +		1: the kernel is running as a Realm guest
> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
> index 2dd69febedbd..52f40256bd78 100644
> --- a/drivers/firmware/arm_rmm/rsi.c
> +++ b/drivers/firmware/arm_rmm/rsi.c

> +static const struct attribute *cca_realm_attrs[] = {
> +	&cca_realm_guest.attr,
> +	NULL,

Given we don't want anything added after this, no comma ideally.

>  };

