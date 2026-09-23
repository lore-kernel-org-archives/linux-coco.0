Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BEF39023A
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 16:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182107; cv=none; b=hLY6CCO3T6PlHA7TjUMcAa4xtwqWwzFuLqLMq49m85r9KW3CpE6nWCpZoDWrqILduoLda16+ib82w4vt4ds1kQho6H4o5BmDvpwaRnOWxIP/CF8fCUP+ZfXz0nyA6rrNf6Yz3PP2a9sG7LoAiD5Ka1XOaIQmRPZeWeGBy5rvqq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182107; c=relaxed/simple;
	bh=CGiWjTmGXAl6+wWuNY52mdjGBRHixUk9gnSMpBDzaVU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QO7857FNvm5obyyLq52lmDyUNqrlXg9WN37ZQeiKOGXc6sFnjIjaBeBeiUEqO2pioAx1QWR+7MYlHeUk7L7MEI8yloVbdjYN1F4ra99rAKhUpE0mJJV9ijbM2sTLdLPbGJI+fppsm9FY6Et2R1r4WfzNuJf7mCA58RZ/DO4Xtz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwURI9u8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Za1S2Ick; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwURI9u8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Za1S2Ick"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTkmg3665789
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 16:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GGpD9bCLKwKljw9siihHkGdhbEHAKmKaI5FQZgKfS0=; b=HwURI9u8gOqsxzop
	D+O0P9O7uAoodVx8vvTnFSrFFdCFGgLgCpPcV8vhfjlglXwwOTzGnkKFaxkC/ZBE
	KzXKfya286vL+1P9N8JySDE3wy6BG/elusP9Fgzp2Cw60YVKuxkWrkOedA1JBIiH
	4MnTe3LupfJ5deFFxg2KXb528bKGtmwd3T3Q1YvyHb2T/DQceHMfTevWrE0DhQ+w
	wWdGCRmLV+pIlJ7nEdfZ5XCYUCjXDDzqeBrWD3zhxcQcyRNajCmY3qyEyaEgcAyA
	pyuKK0MX4yCYcvIuF+liPrfF9DrP7C9sn5MGqHusXYj5hCZr4UKG0Cm5Rv6IJhnx
	oo5Wdw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwasx5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 16:48:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so1778258a91.0
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790182103; x=1790786903; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4GGpD9bCLKwKljw9siihHkGdhbEHAKmKaI5FQZgKfS0=;
        b=Za1S2IckVtD0+kCEob3eeZEddVgmEYjyGiNkfLP+Np8jam6MC2XgcMvC2pf3E50tEv
         ovStXm+ujcno/DiGHSjyfrVgmQRCt5oCFMGXKM6mX+/AYq3cEaut7gT8Qdv801jBfLBu
         DJ4J7/0hhf6SYdTZLe98IgvOy4DxF0rRtXzJ9uGxbnhzYMOYpowU9Yv1VeRJZmlWIjyN
         aoJVXBAU9GAzjYSQmIKn3EEgl41k7l2WW0ewKW/z+DY3B7CZ3hz17ii9R+mk0wfKCzXV
         sltRl9ia8U9TF48/e/f9NvlRqzeQ0oREQynpoPeCDnWbvfZdCeQE9Boh5JOrUlod5EU7
         5a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182103; x=1790786903;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GGpD9bCLKwKljw9siihHkGdhbEHAKmKaI5FQZgKfS0=;
        b=IaHsntQ8R+H8Jw0JXyQ74T+lO3Bi8Qu9PHSL5393PwRCAbu8eVl7vwRJRdpwIlA8Ec
         zQMzbq07+GRojzPt1U7sfjUOkqPbdReo3FBBkKEJ0P3scRnehTr2kaETRZlhwhKcQEpH
         COakKgSS4zIsdzf1xE3ziI68e248su6WxQzS/uHN6svmXJgmrp5uxzaV9/9TGh4Em+OS
         C2BTcIpopJK+85Ii4/eu+/mLNdSqJeKufQgWQqVritJOJcrBTKGw2d6p7B71lfk2sTGj
         +dWoYQmhMugW0a7Wo7PE+KYGn5Vpb2jgV5t66F6vh8+Hm+aU8gQjwk2iJ37ZqKjAhqqj
         5Y1g==
X-Forwarded-Encrypted: i=1; AKwUvBw/9uzsTiJ9ml4hAXOtYVrgHifQ9rbgutUO+UnVomiGGc/9qbvZriMfswsucMZIutfke1Rash2JlvEo@lists.linux.dev
X-Gm-Message-State: AFuF++m6/gLbFd5+FPDVCprlbWIbcm9OWpqYXV/sNxtpxdvUDL/dzlYF
	xRAWf8byEVvAYWU6RpXiqo2AQY3Ur+DEzP1TnGJ5ML7I1XpmoZv17IArOTbu4FR+Knr4jwhR9SE
	QZJAoZuTLRIjnmqEcmhnvgmUygEtobI5jCIjAnFAgd1Y0CUjWDJY1djro/cYy2kxU
X-Gm-Gg: AYBFou0H8iwbkc5moVdjynQvXWS2azEfjMOLzOCgLLah6BFnHCXHQBNPuSWJuTw4uhh
	8c5DQWr1TgoZ3twwiU1e7ffp4Dj67+S5tznTidxvboGKXgl5dkdzXtunKxuoVPYXj9ha0WfzAS2
	+kUglXtdvzFy/6oy5U+mcP3Kco9+3mZoyYxm/SIVy5jgUOOTBJp951o4rL+6b1DubOfMb1RwBOm
	W5c5rsyu/coINa5g816Yhz3jUEkVvTW4pO9OEeEfg3GVRnOx9QlFsbXtEMOC73KPAQzDrgx+P+/
	9DIAdqTi6bb9YJb8aiE2eUgY3MFH/sZ0BWCfdfnhMMGDA5yxzTkVGzN426bWAMP/LTKoCU9K4fh
	sHCatlovPTBtKX3S6FvDR0dFR1XKp0ONqpX7hNBdk9n8NkrlfuhKy2Q==
X-Received: by 2002:a17:90b:390d:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-3a07e54a8e2mr3129872a91.19.1790182103009;
        Wed, 23 Sep 2026 09:48:23 -0700 (PDT)
X-Received: by 2002:a17:90b:390d:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-3a07e54a8e2mr3129824a91.19.1790182102520;
        Wed, 23 Sep 2026 09:48:22 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a096b8753csm10943a91.0.2026.09.23.09.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:48:21 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:48:15 -0700
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
Subject: Re: [PATCH v19 01/20] KVM: arm64: protected VM: Handle user writes
 to CNTVCT_EL0/CNTPCT_EL0
Message-ID: <20260923094815.000026eb@oss.qualcomm.com>
In-Reply-To: <528f3c4a-723f-47ad-a387-6e6a4179c96a@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-2-suzuki.poulose@arm.com>
	<20260922122542.00006868@oss.qualcomm.com>
	<528f3c4a-723f-47ad-a387-6e6a4179c96a@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfXxZ5Eic2yFQLs
 EVnneiKV6SHrU/6ZAptaBg/DqSYYqmPKcR6wwg8u29rLF5EWmEPlnZicZSikEEENgfqxHXW0opk
 332yq2apergzrJx7oYYXU5yp7bcS7B/4NSoukkPlfF+mrHh5f94niIXDdSV1S5lsuEMfhVSoI7s
 yETxQqODmElMthXlkp4WdK89J/Jto+d/Wgtv0D65boj+WNPK5+eIiTyfdPqdIPa7UDTDOeih3iN
 4jmLDde6De3izDzLlmLDYqxK4xanHXNLAHgPsR6NimpFWKlBiF38+tWOFh2rWxojFLZX5jaOgB+
 3vT811cJzFhm0479WcIFMgxPMZTLTeR0WFCNbyXV4+yRk1tuVZMEzlWfYQNnmXcAKxmONRPUZqW
 gDzlN0ETnt1812fhtTX5MMVsJuGtvk54ZyIC/R+K0tUATPCbd38J/QCsKBU9VAsuY4Rtsn+jqLR
 E7IuFMMhW7vwi1Ss/xA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab402d8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=iHHI45kYt6FPp7tEAR8A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: -VVjWZv1vesQbuEVJJrlQzp0j82qi3JE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX2b8v5VLobdKE
 moUHBDFm7mr6fvD7MIOV3D7vjVIcwY+dvyKnGRi2s+dQo9aVnghLRmWvclP+RWYnwmGwWMb67NX
 S4ZyRF/U/pjMYbszU1IDiVT0if+vFqo=
X-Proofpoint-ORIG-GUID: -VVjWZv1vesQbuEVJJrlQzp0j82qi3JE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066

On Tue, 22 Sep 2026 22:53:48 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 22/09/2026 20:25, Jonathan Cameron wrote:
> > On Sun, 20 Sep 2026 22:28:26 +0100
> > Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> > 
> > Hi Suzuki,
> >   
> >> Protected VMs doesn't allow setting offsets for virtual and phyiscal  
> > 
> > physical
> >   
> >> counters, as the offset is always fixed to 0. The VM ioclt is filtered  
> > 
> > ioctl
> >   
> >> out based on the cap. However we don't prevent the userspace from trying
> >> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
> >> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
> >>
> >> Fix this by always "fixing" the timer offsets to 0 and marking that the
> >> timer offset is set in the kvm->arch.flags at KVM init time for protected
> >> VMs. A userspace writing to the CNT*CT_EL0 would observe success, without
> >> any real effect. This was chosen over preventing the writes to these
> >> registers and returning -EPERM.  
> > 
> > Why?  I don't mind the decision but telling us what was chosen is something
> > we can see in the code - patch description should give us the stuff we
> > can't see.  
> 
> I have modified the paragraph to :
> 
> "Fix this by always "fixing" the timer offsets to 0 and marking that the
> timer offset is set in the kvm->arch.flags at KVM init time for
> protected VMs. This prevents the access to the VM specific vm_offset at
> low cost. A userspace writing to the CNT*CT_EL0 would observe success,
> without any real effect. This is cleaner over spilling *_is_protected()"
cleaner than spilling.

Snag is over spill is a whole different thing and got me wondering what
was over spilling!  

Otherwise that works nicely. Thanks!


