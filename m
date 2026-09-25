Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0CB41F35A
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350249; cv=none; b=AHcFYh3ulp0tOStLANCoZ6Qml9VJC5Bj5nHT0CqbMOfT1hRYaLO2lHAfonNNLHzbiGdFgxFJB3K/7oezL/N10avc4BeDXa1BCOz5Bmg4AjTYJuxJcy8A1/2Na67n3b0za3CMsshZIc6XjFn1pmVI6ATQRcoG4BT0tFHXBgDYJBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350249; c=relaxed/simple;
	bh=xv4odhemuBPAS8kcpf9YEYjSYrExVy3jQi5ATSg6zYY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=St+JSpPDHUa6Ex+tE3H40z2F68MuL1PEL+F8ECgcbt5lxfN8/VodFDfgjSkYvhRUET3AfJqc9zxOZhzNG48RGLXVi7JpGA3EDYGCTLZoV9oZw519qJ3EfMCPXS/tHexkLhwX8DEStOue7iQQ+njdVZt+H/37GoP1yxaTUsEV7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYH6Ycmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xpg/8ewH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYH6Ycmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xpg/8ewH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PE0OmX3628311
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 15:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eaED8Dj0FArN5pZ3q8CQ/4V/GaAP65mI/2pqKsEpiWc=; b=cYH6YcmxSpRbVDv4
	ASqOTKC8Ww3v7g4z40EX0CE80WVfVuMpO91dMVOjuCuMlVx9uakw8rjWxzSslUDi
	BxN/hQ3cPv4pIgMMtjhGcO6i2V7fvzPCApLgzZ7CMvCmcjQdclp4ppbCI1HBqaZs
	FIJ8kJaIBmcqRNS/2XqCkmNCgNbY3uTJzlwIgP+GIzIwjeW+iA3w0cZiuYp8dRP5
	n/ZbiKIwYy4uIhZihgp/w33uHKm1IbjrBHKIA6o0TWOiWmKhd5xUqak/wbExlYaT
	LlkBLdBX7UFnVJeJ0kFaerkJcMU592JHFDqolqv1SlyNUkql+l0Rp+usn5MJ4aWn
	eUf5Lg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq39yvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 15:30:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so266858685a.2
        for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350247; x=1790955047; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eaED8Dj0FArN5pZ3q8CQ/4V/GaAP65mI/2pqKsEpiWc=;
        b=Xpg/8ewH0sMc3MjHioZ/hpi0edu0otzepSQ8xaqWaTgFljWBrYz+50UdDVvH1p1h2X
         4l/+kokrfDJX5kTgihOtNN99PMlzxRy0JdcJmX00L12QAeuZSa/dIOL1ECs8H0Gfz+eT
         vAabyqWO9muwPTdlwIzyzNwLJLiuw3bqOvd0gv9UWLzpJ0KR38joHigIML41XsYvpMi/
         HlH9t7m7JqlkkGgLW4Zqf5ZAQGCl1cPIEa33+emeXRQeWZsNrSSTiFNxz7O0Sybkat9H
         OAgt0TMPatgLh2A/fTEC79k7VJEOXi3qkAnMlrTSGn7ufrEWVBwSSRGceUzsrTl0kDaL
         SSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350247; x=1790955047;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eaED8Dj0FArN5pZ3q8CQ/4V/GaAP65mI/2pqKsEpiWc=;
        b=o5oE62qwd0cRoNuZJ6gXoCaERbuCBxeVgokku4GIlrzDl97e8p/8SCDvYz02wVdbA4
         paUpxiwbokZeksnfrJfcDcQ4SEoKJ4CLvH45F3B9Khfx1CdG25/M6hEJqyDq/fdIWhM1
         K9VoX0Eo5eBlw2ig495mBEiY+L4Bs/S+xGZcU1lBHaT4fJb2Ytg9OtOmFE59FYKDdypR
         9bVJm1VFYAyy0I314U3G4m3qglRIv5Q4UteOLUUugO3AFlTbllwXC+21CJAN46IK6YBp
         +xi6DTi1XuVQOnWjg5JrGmKeyJ2ubpIPZuqYx1WOwZ+GcwkeVsRKDxQ3W6DFcyn+vqfc
         66rg==
X-Forwarded-Encrypted: i=1; AKwUvBwT19odDQM5LVrxJpXuDSy3/NL3n8ib/6J9D6UgllkWjRGVlySNqbIrw+HRu/blGgqVh8F5qFP8pHwY@lists.linux.dev
X-Gm-Message-State: AFuF++kzTgkdpXpbtnc7GPNkKWsAV/c6Pjw+TntM+d4Yk72C6M9UuWYc
	mtogPWNGn/fiYOvamIJ6aO8hOx9RfLTf5EnlKpuOqwjOYWiJ/m6ibgyLCh2p2p3nS+8ZbnJyu6W
	Mplbq1IdhQOQi+6db8XMbIhvqa9p0Z6kjfHQh/8uHDWu99GvGI2lsuexiZ+7DpM0V
X-Gm-Gg: AYBFou1MtIzybEXbXMl5TaCWPIAf9G6J8LCTDM0lnrZleoHiHloVJPwo++YlmiHoANw
	PPmxbdAOmiQg8ule4DpvUziPoUip0p19hfMIEKlaKE49La1bXDDidt0d4ikJzLXEdyLmZIRjPXl
	2NvRNdfyOFmwpY2FH8zAIL7+r/mBEiP8EOtDuMqZ3nJ2k7UNXgbPnzISAs0NkjEkflfrCb+jPu4
	a3zzsZ0oCQZjituivo1bKa1efXlD/Zoy8wWIHAY4+7wWTSiEQjAo9ZZOPMUhKfekc2otdndqwe1
	9ITB0WnTApTM6LCrmJGRdBI+tH6VxYI4dLTkeipts0twRu8O92CdHJ0zrjbaguyrftP0Fmr8Qqe
	dzCM+LaEY8UC3k+FuP7KsFCAMrHvTPyh/wIaB1qZW6BzTvIXqfuMe0Q==
X-Received: by 2002:a05:620a:2915:b0:939:d5f4:ab5d with SMTP id af79cd13be357-93c47498881mr439177585a.33.1790350246440;
        Fri, 25 Sep 2026 08:30:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:939:d5f4:ab5d with SMTP id af79cd13be357-93c47498881mr439169785a.33.1790350245846;
        Fri, 25 Sep 2026 08:30:45 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c44972febsm205040785a.39.2026.09.25.08.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:30:45 -0700 (PDT)
Date: Fri, 25 Sep 2026 08:30:38 -0700
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
Message-ID: <20260925083038.000022df@oss.qualcomm.com>
In-Reply-To: <14c6a10d-2891-42ce-8dd8-9745be2f7347@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-7-suzuki.poulose@arm.com>
	<20260924143821.00003491@oss.qualcomm.com>
	<14c6a10d-2891-42ce-8dd8-9745be2f7347@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX3PVgWEF8WIxi
 KxHKg8qCNJNj04T49GmY2En6/ktN09ozkCEqWd7jSZFNLcvVgdwaEGBKone4UWJH4w/OxJLOmy/
 hjGDFRmtXy7R9OXZjB1z2AzcGa5L8bQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX3F1ZoMtt8ebw
 U7FTwViwHcyAN17ex5mZJEc6l0S82e9IPTE+1clGAlYAHKBQSiPzku6TI7UFLf6JrbZz0KCWJVS
 9Xmjs5QfxOrwoCNVFok04q8PfS+ilC5yZk9Ul8gTAwEhPzs8cM00ivbeQZrXc2xjePzpZzn9Ecs
 GfvP+64ki/1HENlP966narrfSQLMkafB2tWFBN/tihKXu0NliN5PqnN16aF0BhlhDh5RK2iitC2
 008BaCPAgY1lqIO1fvvUvxW+2Sc28rvfJ72hA1Gxfy6s0hOlTh8S6VdpHwMK/lf+OLkCgXs6CA1
 qhcQB7zYPbFrYPPan5+EbpDmPkmO527VaYw39qsKBaLE0lYdAeyUdcNWsZgyveuXhgDAQa+Fb/E
 XPY91a7Blu0ruDR4DWEUWEFQ7n3IlDU4G9M44vwHOP9L0R/7VcTftNJfxfZe+tF/7zfAsxdQl0o
 JPtkWDCHbykk6OOVmqw==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab693a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=CGxCOrlZwYKUQMMqFN0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1pc0gyLzni0eaSnLGI0JR3YfvAOfBtx1
X-Proofpoint-ORIG-GUID: 1pc0gyLzni0eaSnLGI0JR3YfvAOfBtx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250061

> 
> >> +
> >> +static int rmi_init_metadata(void)
> >> +{
> >> +	phys_addr_t start, end;
> >> +	struct memblock_region *r;
> >> +
> >> +	for_each_mem_region(r) {
> >> +		int ret;
> >> +
> >> +		/* Firmware-reserved NOMAP regions are not usable system RAM */
> >> +		if (memblock_is_nomap(r))
> >> +			continue;
> >> +
> >> +		start = PAGE_ALIGN(r->base);
> >> +		end = PAGE_ALIGN_DOWN(r->base + r->size);  
> > 
> > Add a comment on why rounding down.  Doe we expect that to ever be relevant?  
> 
> Do we really need a comment here ? We always deal with PAGE_SIZE and if
> in the odd case this region boundary is not PAGE aligned we stick to the
> page that we can use from the region. I can stick in a comment if you
> really think so.
> 

Ok.  I was mostly thinking that it was an odd thing to happen.



