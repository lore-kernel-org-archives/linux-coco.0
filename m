Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8C94FDA4A
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026645; cv=none; b=H0bbW7HVS15WO87ZZhTvyxX+kqEWZDQS7DQm+S9GX1zqGIg7XEKTmyHugDjNDb4wt8WqKBrBeEXnYMtFqllqixSN/c/GGPFtYXAWp+iyZEPDRaVUZiKhUGS5B6ffb5/3zZVcLqStZ7MXvgh56Arad46EQDDb+F2rECfNPiXryGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026645; c=relaxed/simple;
	bh=5Ts24efOpui+13n7/Xsa/KfOpnWj+hW11Ewp1k0kAwI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E41N9QLjr1Xl1JtyxdllSfX3CnXTORf9TUU5AF4uC9gEtz5lK1cevnWwpgAtEdIGZLwdvbvu9QqTkLw9feByhzobwbbiVCOwTDrlnSU+ejgPjJVpC2vEKYZMyn0R7xjtHsTuYdFAkMIcfgDY9hE4FK0LG1ooM8S1NfKAuAZeLUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crwk3eZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVY2aALH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crwk3eZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVY2aALH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKe6HS3423695
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Swt0YNhB50FD81oDu+eeGBpzGMZ5gYqJP471jCzHYIk=; b=crwk3eZFEJnuHuwA
	BxX1kqi8xITwzyLEXrOfDs9Hftiy1udNkfXh1s9EoS9FDMi9SYYra2hr/LwQMuPH
	kMlwgDt70V9cANFNiAuf4sNIShxrP2xTz7dV0eAMRZIBCBHgh5tKnigxbVhBm4iv
	W4t9IZd3gJA551FAz5yi2qOckuGgI9N3N8h5rUFAgWenLb8pVjTLmbX8XBA8qRSS
	xpy2rNyF96OUBBEDD9WZwHg9nbH/k4P0xWLhfXzD/R/hQsoN135rLUS111W5+VpF
	RkOszKlROCP7sxheX72VT4GUcGfsSaHovQBWU5lbEoVK1R1uUT6LNq+Ulg9qLZ73
	sZCHpg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v50xng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:37:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so60503865ad.1
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790026643; x=1790631443; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Swt0YNhB50FD81oDu+eeGBpzGMZ5gYqJP471jCzHYIk=;
        b=ZVY2aALHaUooh8QHIuWmITZzzOabCQ3TuQnI1cGv5axsjkBEhDxEEM7Zvo7dkhknhs
         ypnfgBekmZDMBVtR3RrMd6le1/GW+rYy3tKu+AjNE+VlwSJzyQZFWSvj+lg6aA51gOAC
         35vzHj6BFr90CEGn72RaTAlJuY+bIQOPZVGl47ln9MG4FqwnYvmX+RwOsw0hKYuYwk4Z
         cSQEVNzlZJT/YSW5sY0LUHvZdf82bq7gJi4MA7cybwrAYnaw/k99fuzHTotXHJUMMynz
         cip/yfc+M7kmrIfaNPI+Pi7CvC+6zpU/WBTC7lLUJn6Fig8xP+v463o+2nvLz9zs6tKO
         RsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026643; x=1790631443;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Swt0YNhB50FD81oDu+eeGBpzGMZ5gYqJP471jCzHYIk=;
        b=2A7swScT39PKBoItDaPLd14mNP1r1ysZOFaI9btm3nN88vCuc6qaPtqujHR3ZA5x7n
         99vTbOwc0gWXlgZwmChhncEOmz1G7FZM7K/m7fuWpZJkBqW8Vtr2/9Hvl1LlA6KczBDZ
         lnbqGFNo9QakH9afRRYVQIe+Fzc1Ex8DRaiZGN0W/hrclW0ansdp9aB3Trl81Cat6ik4
         VtSWNDo0LbBbjmKRfSmYjBXYOjKxM/YAdcefVC9nFg7DwPHyqL0ibyt1a9ddwn7ZrjvR
         5N5/PIRAFdRB75XTdsyqolqlpBqFj9E1/lZAdMNjBNowRhHKGkSV6w02i6T+MBFuXXJo
         849Q==
X-Forwarded-Encrypted: i=1; AKwUvBw4JdcS75XTsJkCU7/bjFnGjhmDy83ZhFiWWKAhJJVM9c4qLZYFh9JUVv7mK6JuI7pTgckQ7UH09Z9V@lists.linux.dev
X-Gm-Message-State: AFuF++m763GvQZdF3fOxqgDoGUAe0T0t8vYnkX0zgu8yf7jYdlvGS0F7
	ELRD8S3HKZPRchEXKVYpVRjgplhPBosPzuPxcKRz9Vfz7R2OVfB+UJDwlDNxvTR+WkPxMK8Lj5a
	xB1Q1LngER801KO1i+RZBzc7RL/Q15hjcSmMGeLMyEBDSmuBkkaqQb0IhVmr+P0zX
X-Gm-Gg: AYBFou3Jaos5plPLZldg1G68n2LEhYOl7zU8Gz7szZIcWLhckNty70+SMYLvUaR0BtV
	xeBKLGfsXpIyt5/ro0eJyWu7O/070j5wj2o7Azjxa7y124DHikpt19buE7ptVHt8B07Jm1n7nEA
	FoVZWrsl0Cq54mWpAbEXyc4dyj2rrhWiuT3DiTH8PLDp2q/9WB4spn5aKhXWJAzLSVdFQ2kqZOf
	sHRapq3LALYIXbNTbkYNJ9vAC0olv12vGppXB5bG/Old3GwrPRc9D85LvPO9fMXjhX3X+q1W4Zi
	cW2tY0v/kndIeUIcuIoZL7TsfBAwexHipWV0aSdLB9kvvwZqdSKp63o9oDXpLtQJU1KYCHC6muZ
	rnrrDLKfgOeKLMVPBNP5nj+IzDA==
X-Received: by 2002:a17:902:ebc6:b0:2dd:c053:9c6e with SMTP id d9443c01a7336-2ddc0539da7mr117471775ad.36.1790026643039;
        Mon, 21 Sep 2026 14:37:23 -0700 (PDT)
X-Received: by 2002:a17:902:ebc6:b0:2dd:c053:9c6e with SMTP id d9443c01a7336-2ddc0539da7mr117471595ad.36.1790026642576;
        Mon, 21 Sep 2026 14:37:22 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec0d55esm650212eec.20.2026.09.21.14.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:37:22 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:37:18 -0700
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
Subject: Re: [PATCH v18 2/7] firmware: arm_rmm: Check for RMI support at
 init
Message-ID: <20260921143718.00001e55@oss.qualcomm.com>
In-Reply-To: <f0a4672d-c7f2-42d4-9fc7-b5a1d0ad3b83@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-3-suzuki.poulose@arm.com>
	<178978126541.2352296.3637463397103730192.b4-review@b4>
	<f0a4672d-c7f2-42d4-9fc7-b5a1d0ad3b83@arm.com>
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
X-Proofpoint-GUID: zn584rcnhT8D-8MvW5Cnbwca4UaYpBKU
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab1a393 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=dENJxcbTWoohif9XLWkA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxNSBTYWx0ZWRfX9tnAW0uVdu4B
 mOvDOtnhkq+TYbCDEf8y/soipNzt3RhGKf5sxHkD68Zp/byEMaV6HekeP9yRRWX+zIZFhtntZfc
 69/cbjNrxJpKw6uoOACDiFVDlElbJAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxNSBTYWx0ZWRfX3f6aT0JXxg+P
 lnSsCTNSErmRTKqKKrYkHcguaoG2rx0k2bQ8tXOX8LiJzlYPyvWA3YWuUljOKbQf2kwkS0JCQu5
 8jqnhyjwrga8DfGlPBR7NtNJLA2m0z5iAtw1UT4y4jBFFEOb2UOkOHH5GiGJfFxtVO8ylEpJr2Q
 W698fy+Y4eHAaiDimTDztLTatvz+pHwaReHUM8jmL8M+IvChFfwvu2vNI16jsOBXHen1PPaqLJW
 2lImy1W2QyTYPuFak2EcHpUHtSRVy5nBgMPdXTMzEdsAGNA6XaON+U/h+BzRaAHOKRPXNdNmdY5
 hHHVV20F8SPlbbo64oWzQjjm7dkhjC30aQKCRGY+2RcWUzjMQsFD9YlJrDkRsEQ/O6nliuAyhDP
 OXQC4Al7uueRmfGY2BtuDmbXbZMcEreeveuzSrTrMJ/VPAdXIJYNPyAk6S0lduXroS28x7vqxfI
 TZEQMj3diL/d1vYFr6g==
X-Proofpoint-ORIG-GUID: zn584rcnhT8D-8MvW5Cnbwca4UaYpBKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210315

On Mon, 21 Sep 2026 10:00:20 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 19/09/2026 02:27, Jonathan Cameron wrote:
> >> Query the RMI version number and check if it is a compatible version.
> >> The first two feature registers are read and exposed for future code to
> >> use.
> >>
> >> We only support this for Little Endian kernels, the Big Endian kernel
> >> support is anyway marked BROKEN and is being removed.  
> > 
> > Can we have a small comment here on why the default is y
> > 
> > It's a big thing to opt into by default.  Feels like defconfig
> > material maybe but not in the Kconfig defaults unless I'm missing
> > something.  
> 
> We need this for KVM arm64. I could drop the default here and
> KVM selects this anyways. But, how far do we go on this ?
> Do we need to be able to disable this completely even for KVM ?

Not sure. Question for the KVM folk to decide.  Lot of pre CCA systems
out there and domains in which CCA may not be useful,
so definitely makes sense that people will build kernels
without it.  

I think dropping this default though makes sense if KVM
can select it. 

Jonathan

> 
> As such it is a relatively smaller blob:
> 
> $ size drivers/firmware/arm_rmm/rmi.o
>     text    data     bss     dec     hex filename
>     7477     572       1    8050    1f72 drivers/firmware/arm_rmm/rmi.o
> 
> Cheers
> Suzuki
> 
