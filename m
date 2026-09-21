Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3551A13B
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029556; cv=none; b=hdJtOyU1khsWFu1rCKKXB0MiOjq4h1p8Z6RzayTmnNWInmsD76I+jZx752xeuM5EXawD72IOUsQu+UgOsZEilM9wDUmqpr2w3s8ftJpZ0oVDCeMCY/J3C2SOKIB2S6n68JMqBdezcXxgBfZIgYvu7/TRrg5tYvoifVOu/qus3uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029556; c=relaxed/simple;
	bh=rKLBXjBsKk7shvBcGleGkls+SdQQyrpsidBt8GNTQH0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=spjhSnMCw3qWJbPoWqcTbT5ff3oXoBCWRbWSTpfvJq7ESbBRa1MFV6rxfEWlZl56l/nVfd+lREDM9K8emkKd6RkTB1a77ZtBz5BwBnQ92Qf3xyCdBr1p+yM55ju73i8q4PYPOcJI+Ju7npZ28AwTGy/AIhbxnMTstV40bzlKfqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeLSPndb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egJIxy21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeLSPndb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egJIxy21"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKet621565127
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 22:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFjmIIFGSPlWWqbqQjYy7DWGZwNCN8h6t2jDnL948AY=; b=PeLSPndbJDcQzlQ/
	NhkJBbPaIa8TbAWSTRhImPSlxiRLbkMFjKIdXHx49BcRXl8FAQYp9y7nJip9I1W1
	EI/EcCHxg2PlO+VnWs8yfpabp9ieziEAU3QrP+f+RmZAs912ynTorYlYlJEsT41n
	YT0NKe1fH7V8fXeS5Ofhlre4AiqFODduy5SqTVA4wfmkDhvX0tuAHlas9gdSUemE
	Pm0bZtFONmNMdyQRJ9ZMQyWu3p5MKtjOoQRJdz2MLlaUZ5UvnZOcHFMZSQJTsIEQ
	ZpgNPaUTG9qUpPrPLCVEUJlBAlZlRMdv+x1/cQa+iqW4Jhrva33bJ93wOlKLcy8H
	lmXfQQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gu973-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 22:25:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc52c1b829fso4583820a12.0
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 15:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790029553; x=1790634353; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UFjmIIFGSPlWWqbqQjYy7DWGZwNCN8h6t2jDnL948AY=;
        b=egJIxy212s+vCCjptSaeSzR1IVSYhaFrfG4Ed8xRh+NYuD3s0l5QHxBe/954ZbcIXF
         cBTygsbtCnexJ6Q4bnAxQt5WGBuXTV0p/aYlynWMjkMhVCFkq8Jmf7PJ+PO12V79rBTh
         T+DnWWSzLZLOJ2/DkzjHFgQFcDM207f/w4VNndosyrYNxkcVbCcDuIwKBsb8qEnTFCDO
         bKP2u0I/iNfOWb9B5QvSc9UcPKDG/I3w4Xjcr1oHadBm9SHv+Lh16NyKMNAjqCsfEo+L
         zXcBeiKjs9lFiQTm/hxU/Dd9hmrdHBMfJHCCq30mdPaYIxABfz8IEJHkpWrtkMe2QmCc
         D4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029553; x=1790634353;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFjmIIFGSPlWWqbqQjYy7DWGZwNCN8h6t2jDnL948AY=;
        b=PlwDKA/PLajyXI7Of4fn0cWBrlVK6WJuscaioGTD29IdFG3TkoNs36Mgb4QIC//7P2
         EXTkVs3QHSTsS42YflTQHTtOmkpuVGgApBm0WMimkkvYz9faNAagWCbh5UfhHle7atTI
         OD0eES1JyifDtPlCxOsby48IxrV20HLlEedMR8J88AbNfYZ23CRx2rjQsprtAHZzntUc
         L2NrRKIZ/phxzQk3ThrXWL2a6CHROTZNe1cF2zkI+xif/I/VV5J8k63RXu7dQREfrwub
         2tKMNuHJLtrAQMwh3k5CGuKgDgLOdpEblo24NCJynvInCleDYlNTMqVOJUufFFMJkm/U
         oJBg==
X-Gm-Message-State: AFuF++lgI0x8FPKzC7k0umLrRrkJR6I9hIPvZB4G7sJyvK4Z9uZvL3oj
	CdUjCQ6sRCpLsrSKQe/k/G8/Qdj9kunLGOGrXpWUCc6RKUfHtaAmUx1ak3nVwJRzmF6zcuS39tw
	Q76k9TPnP+HmdHlkTiXycuUOlBoO4vf/Kug2na4Dfd/hBP+c8g8XnxNF1UxUH2Uyz
X-Gm-Gg: AYBFou0QgpdI9i30x901PWXdcuPmJWtY0Aqt43kl7nFYjF+nRDnBjgWJ4leph7zmSna
	XMkoSAFOHUEYS3066cPZN8/RvxhTwNX/jw8TGz8P/lolZilrsTbs8rFXnX1FV4WN0O4h+GUY9zE
	5LDzlLHx+FeWrBg4S6xIiEQYB5L7R/olGr+AumKql5Xv5Lt1PQ+cQOsaSholc6awE5McuZ/StIi
	ATGL0V4zPUQ8VBZkCRTcMNfKWIq7O9p91UCL/DgbIvIxsgf8lHb9Mu5kcCheWnYn3+QI0aVDKj/
	QswBQHphuV7i8fuj9LZY6QDQT2195L1NRRi9GstTffAkKkjEf6UE9DtsLxLuaPhMxawMXfFYkdc
	G9Wi35vh26CW5KkKKqoxd+DYfyQ==
X-Received: by 2002:a05:6a20:9e0f:b0:3dd:a007:cb2e with SMTP id adf61e73a8af0-3dda007d296mr13850215637.42.1790029553520;
        Mon, 21 Sep 2026 15:25:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:9e0f:b0:3dd:a007:cb2e with SMTP id adf61e73a8af0-3dda007d296mr13850188637.42.1790029553086;
        Mon, 21 Sep 2026 15:25:53 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e786dsm118585eec.1.2026.09.21.15.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:25:52 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:25:50 -0700
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
Subject: Re: [PATCH v12 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
Message-ID: <20260921152550.00004373@oss.qualcomm.com>
In-Reply-To: <20260921053807.354802-6-aneesh.kumar@kernel.org>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
	<20260921053807.354802-6-aneesh.kumar@kernel.org>
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
X-Proofpoint-GUID: 1nVqPd0sRbWX36jpBfv1LWp0xP5ZmUDj
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab1aef2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=ijXasmccuCAQJU1yyekA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfX2lg0IAnWOxzF
 LzvlERCmyWctI3WhAVbn4zMyfedFIZp4yoMGCoXNaWjU7TwhC9YyEaQmcPCsmA2e3q55mSulqYu
 LO89g8Hj0y821WXJAe+3kciTVyCdG1TmDjHych4jEzhImlmpBApo4yZdRYgyykNfua6AlNpqhjZ
 PwwnmdGEqJITXoUyK0P1O5dk/i0OrtTGW54J2rhq/LS/eUxfWPKx4MgVGVyTZWG4Dmx9LHAFyz8
 JdH3nAGdyN4Ao6PHKtntVzR+n5YRplXVn4uIeydhoFv7D5Nw7pX1VamcJcbEyQWIaj+GG20HG8x
 wwVyfApmcPohZFcJYjzl3zm9edf7byD0bvOk0XFJvW38xxchPUQGe/+z6T8CZHf/D21Pr8fd5JY
 DJDXr0ZyFCO6ipTecdlz9hhOM7ffiLiw6vDqUUCb7+whWYeASmzNi3kMkEFpmiIXha2JxuyUXb1
 VWnhAKWhivgNs7X7IvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfX5h9YJ97aRLn7
 NKkb5lepQ6I0cJVl+p+Biw0M8rNDzZQME284QtVW5uptFp9FeHaQp/L36Fxeno2yomQRDXJFJrn
 NyAZaZK/ze4bSeB2Mvq+vMagb7Np4Q8=
X-Proofpoint-ORIG-GUID: 1nVqPd0sRbWX36jpBfv1LWp0xP5ZmUDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210328

On Mon, 21 Sep 2026 11:08:05 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to main.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.
> 
> Also rename the arm_cca_tsm_ops instance to arm_cca_tsm_report_ops to
> distinguish the report operations from other TSM functionality that will
> be added.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
