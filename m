Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5430840EB9C
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418768; cv=none; b=F4zIRy6kC88uJz3CxgVdcOH1/WSkApbfDLIYLtogqaDL5Fuq8hBqU2MSnrewBsAJtM+BKWgRlFqoKd8NQ1mHBsQaL40VqF13j/0oORmxKLPFtgriFK46oUnmOTKdPMdudo7iQCgLJQx2QzRZUw0m8qZ41i1v0mcw10s6cLY31Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418768; c=relaxed/simple;
	bh=QECm1NS8puAPZpapUfzYvzMKxDEAwLFS265PKNnFXJk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7p3bIzELP/6/8yMqzRLhBqYve7zSjxpyFJDO1o19x7+NsGRAn5otrt0AsJ8UFirrcmpyEFl0q+hVKcDC0DBC1xALxvfjP3W3biVbiIuUV+EpyH7jS5M+/ggLt+3nZC07ZsRYce56nlpfMeaBt5GDu2GjiRUa3kJJ/x3PH7kqiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gg7Epvv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0b3wkhO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gg7Epvv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0b3wkhO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYS8d771791
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d07dQSvM81f3H+Zq9X/anTSWjzVG0HIsUPbekIsWJg=; b=Gg7Epvv5pxHZJIiM
	M8UM37gNuXcKbamAH2uo+QM5HBc0C1Jq/D4b8FygPYVffjNDMV9epVMbrLpgCzWr
	XRgvt8jWZNpHLkPLn53nHOdi7aXRdFbUIunfY3BARDD6wa7V8tTmYkNsFa1JTwuE
	GDey/fcoOKRLUQ+nH5jscwSH1pT8+AserRwsc/xoiYEWkiMhEMVYa2vbMsJWlOOR
	ja/eY5O5vrdaMzFZAAHL5pL4xtx1lALNufpgLZmKuCS/OizjmDaQ+kFTxj8wkhhO
	l7fvYttXqnQfqQdeEgAVGs1jNL2OknIKci5onCrL8DKK3JQoJ/lMGGyI2AFz+qgg
	0CCgyA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg31yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:46:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d932ef41c4so3945755ad.0
        for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789418763; x=1790023563; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2d07dQSvM81f3H+Zq9X/anTSWjzVG0HIsUPbekIsWJg=;
        b=c0b3wkhOtv86mggMfKcJ47SDqckbCDJ1K2QQHIZKE2wnAIeFtC/Adf+Au7EfftcOnq
         iIN+BXjF+mFkprgqvEn02OXko+8FDBfzEi7wHWbK6om+a9k8va+WWU5rUQ+ezCWZvyKH
         AFX1HtcQJBTUEQgGQShZ0sqgyFeYP22loZXvcyjE4DbkzDofr9N/SZCkk6X0deZPZIZM
         pmNQsWY5wID6FH7CNYDC68F+eYiIQ01+uB8Z0/0ptIayJ62ut5spk41wKuDDJ01ajhEz
         4H5QygYrydYa2li7CW4UV5Z6KFZUKLTcfx/BJ0JwJ/0OwxwdhPFHPdeinnD7zo8ScYa/
         S0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418763; x=1790023563;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d07dQSvM81f3H+Zq9X/anTSWjzVG0HIsUPbekIsWJg=;
        b=TgkftVfzCJ+SX8RYbJhHcaYq2FPwFKyTM8NFP4MM/gRLefcY3yvyzoLnNdRKUTdu4f
         umH0AIgeitpyLAP16teEde9iZpBKlCR04hK6OrHP+h3JlhroMRq+o6nKXWzwXmL+BSly
         ZiHghm0uxaS3FFrPh+x5746bRoi009z7qAmk6RDNp2WbUiC7luEJBJXCNtvfFxBnY+AT
         Q4XWxqqTh14LMbqmrKgP7raruxbCr2katl5UsVNvQmAPvRj19pCMQvCRjSjeU1ySxChG
         ZEfkzEtCBX/6FiJgcdn56O1AbWiG7IdVyjYkt6jBq3ITobzrBaemgH52CM5hnmalts0S
         xtMA==
X-Gm-Message-State: AFuF++mCEvtiPYHIEEC8Yfkcf+U9PEhEvj8fRAIjKFyYCRZdubhY6hKc
	BTu2cyexm6Mmas90IRIWwFfV2a6vl+WP1Aa2jQ7qiCy4BqRFjymDiGkSZ5fxipJp3pSOCVY3ojk
	fwdme2+Qk2u1NWLHqMhVLzaJPT0bgYDWuboiWnomr3J9Xf+PEBsHU80UxZeMIL3N8
X-Gm-Gg: AYBFou1ZZM85dqC/Hc61bBn/edlFFa8rD/KfwOGkZldOns49yogpniKMRIAQpn9ZKEx
	sFytMkKqQZ5eRY1DBvRldq3pC/jwjPquMWbYtAUE5rtKpYqarGgn2JAcyFjne85IzpTvJgvi+ei
	UoRA1MirLk0LqF/+hlrIukqopusvGZLB0IEXwXkpvIIpGKcz3wLMH4pDOD8oh7+TOdUVIPLZC9N
	4D4HF7JvRtdb3u+sjGqzrMDtjT/WrDIAu/RfcqivoHbdSp0VDCZDX532SQSzVGfvbxRZOlJw8Yd
	xUq6z0MrgSP7+jh+7uHSrajTh8KKd68nm6V2yVFbV/Nbuvfo1JM21vn5K62Uvxv41kJAGXh16OZ
	rCnh4ols17Aj8LRJ8fomjoqR0iUw=
X-Received: by 2002:a17:903:120a:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd7655bb26mr12603235ad.21.1789418763414;
        Mon, 14 Sep 2026 13:46:03 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd7655bb26mr12602725ad.21.1789418762993;
        Mon, 14 Sep 2026 13:46:02 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bdd76abcbsm4592622eec.22.2026.09.14.13.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:46:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:45:59 -0700
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
Subject: Re: [PATCH v11 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
Message-ID: <20260914134559.00004e1b@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-4-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-4-aneesh.kumar@kernel.org>
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
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa85d0c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=6n8XPUQpuYwtPrU-WrUA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: cPiSp3pzCKYTN8mCNlJCDrkF0cBJevgS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfXx+NKnL0jmeou
 6xLVx5kI8GY0QGYkHC9pc+436imrp6iqYWlJtR26inZElgTcWwBA9/XTJ489SbG+USSbRoEg1bP
 2B5Fcl2HzWRvQZ/XNIqjEzOs6x+L09A=
X-Proofpoint-GUID: cPiSp3pzCKYTN8mCNlJCDrkF0cBJevgS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfXzKZHw/ed5QGm
 z6bSsyjhGNuf9jXC44qN+68d6vmj4mGIaMumIMXsUDBPJF2xgr3zBsrsHaP8fL1PC0T45UqedUr
 HKzxlDslJktw3asUWRZndbGxfVgEkJy41+jY40xVLbiW3uDz/SQRKe8Muw4sAngnI6D12zFod9k
 Kfii3XTXcZ8mgvD7fx7BaZF3Ssk2UUiEaToLkftoM8HVF1DPGtnQSM/uoJvKTUjBZZUhjPvoZnE
 ex7DVwEms/rGZGoH5L/iD/vvy6Vdv/JSrhf2p4mHljQiLLdoH44+pq+IWeyv6DI5OLcv2xpc4SS
 Amf8FLvYTTMXcnm04Pm5kOQFlo3za1j+KL4ikisMUd9xl5iFVewBBo/MxHkqlzoV8NBPuqsGVGw
 EcrK5gTrv5aEZDcALcEd+NvMYGbmgnt85l1VvZJY6wcYma2SUjTIf5+SbRaEEXL79v3kezdnlbq
 hGbDolS9j4WKnTn5SQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140296

On Mon, 14 Sep 2026 11:35:07 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
> architecture specific definitions. Follow-up changes need to use them from
> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
> driver.
> 
> Move the complete Realm Service Interface (RSI) implementation from
> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
> command helpers are also moved to include/linux so they can be shared by
> architecture code and firmware or driver code. This also keeps the
> firmware interface outside architecture code, as requested [1].
> 
> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Moving the code makes sense and indeed that is what the patch does so
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Trivial gripe about the original code inline.

> diff --git a/arch/arm64/include/asm/rsi_cmds.h b/include/linux/arm-rsi-cmds.h
> similarity index 69%
> rename from arch/arm64/include/asm/rsi_cmds.h
> rename to include/linux/arm-rsi-cmds.h
> index c1fab41f671e..9e8a8c189ca1 100644
> --- a/arch/arm64/include/asm/rsi_cmds.h
> +++ b/include/linux/arm-rsi-cmds.h

>  
> +static inline int rsi_set_memory_range(phys_addr_t start, phys_addr_t end,
> +				       enum ripas state, unsigned long flags)
> +{
> +	unsigned long ret;
> +	phys_addr_t top;
> +
> +	while (start != end) {
> +		ret = rsi_set_addr_range_state(start, end, state, flags, &top);
> +		if (ret || top < start || top > end)

Obviously this is just code movement, but why eat the error value that
rsi_set_addr_range_state() returns? 

> +			return -EINVAL;
> +		start = top;
> +	}
> +
> +	return 0;
> +}



