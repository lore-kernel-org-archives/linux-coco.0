Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE012288CB
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 23:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770765028; cv=none; b=m40AsKNPJeYGGEPwwA8eEVaJ1bSatpV1rwg38GarWrh0G+paoBXCizzsdv0lFcEwraYLfmcfgi3JHcQWJTiTOGceKw5L1UKpCZBcoY1uNqaY40wzieAgM3iVrFi2pnGo+cLENjR59RoYMYI7rNXb+i5uEyfpVlDQUZv2O2k0j8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770765028; c=relaxed/simple;
	bh=4sobIFVCzlAWjuunypO7GnznePi635vRgqgh2zI8NLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjfL1Z7spb3AG49G8/us427wmhWeDEidYn+I2XeMxnvdH8TqY3BGG4DAIkZ37DmC7Pv5k4GKioZ0ue457gEHp1n9Xc8zUSPpNZ/TThwwQrkqq7oY1tmP1DpzcW37tXM9CvqdDDQ7Z8GMUTctV4BWsJAATzvVJe8/4Y0HNyNCgSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZbNg1pB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIe1oAxX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZbNg1pB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIe1oAxX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AEUU2h2169426
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 23:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ZPzz5BSHYfETil2X4klxpr3dDUNgN0B8V4yT78kuwA=; b=CZbNg1pBEa6tQ6uz
	8ShjER4DruWzpafyKC4iou7riNe/+NPhWNW9d0j5rK3evgj5WnQ3nYWFEvlHWhL3
	fOisNJn3by/PNEGve2wiheQbB+WVsSOyVZJ5E7CN3U4JnHS31FDPcEVVAqxkRegQ
	PrOaj7sPattHxdXoW0NSsGrRLaQoBXWbjjma9CpqoV0ZEI6LaBQK06QnhOFjMIA0
	YNBTRuG2ljbBrB0o7lLobsRzenD9lP2fteFyfaQi0q1Vt3CUuyVlc5lqxMT0ZS4v
	+kzAYQshaFngchsJlBoiDMIJe0ES9W2M9kK5DbcKvqFlUQzYC8Ez+DBlF/Fy3lS/
	ak1BIw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80dru1hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 23:10:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so1136416eec.0
        for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 15:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770765026; x=1771369826; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ZPzz5BSHYfETil2X4klxpr3dDUNgN0B8V4yT78kuwA=;
        b=aIe1oAxXo0jbZK/LNYtKyIScupohU155s7sEiI39PzGmmDKoCIgRyCnRpx0naMoFxN
         GVgbsrPd1VEgJevW6WnHu/GhU0J4eDBSZg9eMXnK7HD9DanMPQW26pRQIrgTglIXy81F
         LFzWpoCgqlz4WUDX5GNg8geW9ouzpGhrAbzdbGML26IaN2I6HNqdOmo3I5T4B0zvvKIv
         a+Pm4uWUZwEXCdpDzSM57loqqQDzIYtNnwMVPBNOXUMIKpW+EKjHhNdnN1j7owyU5p/Z
         4Miuml31SO+Do8L1rFY3oPHI/8E+TWc23WV3/gpxgPfnUF4yVaIqFaWL5H953H3PN36i
         0aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770765026; x=1771369826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZPzz5BSHYfETil2X4klxpr3dDUNgN0B8V4yT78kuwA=;
        b=eVzs4YVK15phhqDbuEJhUk+RyHBTZEWCCEUJYytGJ/sTA7IXdpKuf05PZ8NkpXt2nh
         mp5fnAFuazdTlDrt19DFpHQVnrnejdN9+D5d2vIZDPYMYt7HFhJ34jOlsRSe85+mR6Nb
         Zgi+j7Vsl4Um7/u/vadqJupPJJmecQ4y1aUkD7g5P+MFasivnXEu89eu9NBlQomSX60k
         QHSgfdAKanhzxMydHthFTBaPRIM8lJzKQPXT7r0ofuEuHnPy0vwMnutNoraFUsFCiPaT
         63UXixbZE4MIRLNpCkFM0/+NAdYX7hs0hOyJPyesDXE20Jo8/s98LclBTIdJfUmNFkC7
         E34g==
X-Forwarded-Encrypted: i=1; AJvYcCXZCKAL8fiKN0LTcLwAUEO/X+GfKLcHxv6bdKuPvVGTw3G3YupFdiYR3spL8+u3zxp+dRFIJnoJHbyr@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Q0oGAClYKfnqSLsNtfBzTBENuH+y348s/oc3yN3J70JPkU5a
	WFZSC+vnz2B9X6AxP2p+tOgr5PWrKsLJmz0hmtMDNMQNS5p+AYDsDwZu/DAda66Je5LJktkqlTL
	qPsiEVeQzzKbfpPzXNYu4t6YkWDEBdHi7bLkmd+r8sIwFjPNrNLXVBkAnAGnXRXx7
X-Gm-Gg: AZuq6aJRqm4cW3N+A8hYpTzT7tk6R2JXZ6Ld/OZ5yee5Qk7rIj7/60z7dGJG7NlLO5u
	OzmVJwMDFtOjzeGmYKA5JCFLKymMOo6StcYo2x7h6HDxj3I9OhJ3Yt0D+EzclW4V9P2JSW5chEd
	ifNFmGUH40Erv6RSY58QaVyuuc0GV28e1iPyfjmRcMf8TwFLgT4bcOUafvbM6f/ygtwg0ymn1rO
	8be3oHHl+VWsQ1P6+5Q4dfQfen5usQviBFXaDFie+ly2B8Pvu0QPPgtysxyQuMWrxaDSnMBemcM
	ZD8Ft+n14TnfnyukSSbEvswsU3xKf8tbRp1plxW6wbswq+JnYzsbDUxo+qKnLbsQ4GRSs75Oar6
	2kE8jD43gKB4M4im0hVPX744/AjuScgA8gKb93ZkeX36wxAt6WPLaE6c=
X-Received: by 2002:a05:7300:e788:b0:2b8:4a34:6c39 with SMTP id 5a478bee46e88-2b85647ee35mr5986892eec.16.1770765025664;
        Tue, 10 Feb 2026 15:10:25 -0800 (PST)
X-Received: by 2002:a05:7300:e788:b0:2b8:4a34:6c39 with SMTP id 5a478bee46e88-2b85647ee35mr5986878eec.16.1770765025023;
        Tue, 10 Feb 2026 15:10:25 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c3daf7sm10940431eec.20.2026.02.10.15.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 15:10:24 -0800 (PST)
Message-ID: <cb7f90b5-6e13-4659-a448-1f621b89c71a@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 15:10:21 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: smccc: add timeout, touch wdt
To: Vedashree Vidwans <vvidwans@nvidia.com>, salman.nabi@arm.com,
        sudeep.holla@arm.com, andre.przywara@arm.com, lpieralisi@kernel.org,
        mark.rutland@arm.com
Cc: ardb@kernel.org, chao.gao@intel.com, linux-arm-kernel@lists.infradead.org,
        linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
        sdonthineni@nvidia.com, vsethi@nvidia.com, vwadekar@nvidia.com
References: <20260210224023.2341728-1-vvidwans@nvidia.com>
 <20260210224023.2341728-2-vvidwans@nvidia.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260210224023.2341728-2-vvidwans@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE5MiBTYWx0ZWRfX21hy06DSPGin
 fZFsmhHQSoSNTLiddcoYy1CHYWgmg7kINssMuUaAfPP98/2/fKgx6iJRhAeMxtqB48qJi9TYlyM
 1mt2zYcNI8hQtwYdpv1oQZo05IxnaBWv5IealtRtiRrAmj2aGQ2kFTp0tFd04A6fCForPZvdOxm
 NMmZ/JI5CPfK++7UOJ0+R0/9gfCz7M9oVXJ+W5K1WpcrEsQi2cLvgWYka3w1H0W9MThqJ6Ecjoc
 dlwr0JbSgMXMSJ6lfW/g7fF/o2+rJKna4bM4fZ2g9sf2ZI9nCOIvFea6xkJMKPMcXxvES5fiMDM
 WxGSCuYFVBdh7g2xJHAJiEdmxfToF4hSzcZqW8Xu7h9Kl7EsCPr3ZByKEnIn3E/g0ElCszknjfu
 9V2eioGcCST9kNAA6qWg1I9hEp8Pfg1/YvJ5QFUd6m21EhWsWVaVJ7HHTrIcSkIUNmdHZWIMG58
 JE1jZ1+O4KnVrxGMPfA==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698bbae2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Ikd4Dj_1AAAA:8 a=OPovUEjlS86QoOQlm80A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: bfI8oRXzIAeA6pah-4_WLBAf_G6r54ks
X-Proofpoint-GUID: bfI8oRXzIAeA6pah-4_WLBAf_G6r54ks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100192

On 2/10/2026 2:40 PM, Vedashree Vidwans wrote:
> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
> timeout mechanism. This update ensures that any potential hangs are
> detected promptly and that the LFA process is allocated sufficient
> execution time before the watchdog timer expires. These changes improve
> overall system reliability by reducing the risk of undetected process
> stalls and unexpected watchdog resets.
> 
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>  drivers/firmware/smccc/lfa_fw.c | 40 +++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index da6b54fe1685..b0ace6fc8dac 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -17,6 +17,9 @@
>  #include <linux/array_size.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/nmi.h>
> +#include <linux/ktime.h>
> +#include <linux/delay.h>
>  
>  #undef pr_fmt
>  #define pr_fmt(fmt) "Arm LFA: " fmt
> @@ -37,6 +40,14 @@
>  #define LFA_PRIME_CALL_AGAIN		BIT(0)
>  #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
>  
> +/* Prime loop limits, TODO: tune after testing */

Do you want to keep this TODO? Your patches are not marked as RFC. 

> +#define LFA_PRIME_BUDGET_US		30000000	/* 30s cap */
> +#define LFA_PRIME_POLL_DELAY_US		10		/* 10us between polls */

Are these values going to be tunable from the userspace or kernel module parameters? 

> +
> +/* Activation loop limits, TODO: tune after testing */

Ditto.

> +#define LFA_ACTIVATE_BUDGET_US		20000000	/* 20s cap */
> +#define LFA_ACTIVATE_POLL_DELAY_US	10		/* 10us between polls */
...

---Trilok Soni
