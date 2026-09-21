Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866714C9E18
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 22:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029468; cv=none; b=aduqngsg/NSvp5bQORhEbxpK2oN32Et/NHfsQeRhmGhpyCBxlcMWHTTuwVN/wOzYUAXwpCyB+Sv/J1xL+zfPsjpnEchP0M6H+Cdv0KFf0JjplSR00eknzwVu8u6X2GGLbJdy0WTFSUyoqNzE7vYV9rqvGW80dJ6WzcDR90hoFu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029468; c=relaxed/simple;
	bh=cTHWcAl7qmoMh+M8rTW5ybSijmOqpXvsrSf3CLOsj5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=edASJ+CWPQhYlFMrLgkEIBLRBhFCI9okc4dnnzvqeOAvvdLmAYse38FUlm0sQFEOqNnHvtd07xeinI6yM45qFPcq/SJvVN/n6+/ybZm5NJxIbR9puIidG9bgvuBRdRGeK7NRaaJ7LWvRSUrYsVZVXJrFs4lOJwZ22iSQ65pDR+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/xcSmpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4vm1clU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/xcSmpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4vm1clU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKfhWf1751643
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 22:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OEnrmQFNO2k7A12pfE7wpLl5Xljl8coTbLHitjukYz0=; b=K/xcSmpxtl9n8TQh
	Rl2usZ/nN/0vFKrk61FkqDv7ONpqFyqom8ZcGVkPRjrL0OFfL0C3xBzoKNlMeSju
	p2rPHj5hIFHZ0R+/0o/rdT7wJ8GIDprx6he44zqzcbO7MN7BYv6oL5JBiWP71nMU
	vmyW/mc54wDCjf1I6H/dY9KkgfxJhBNFX/ncUkJjYX1V9x0p0U3geOfYM3zQtNZ8
	x7gIubUZDaDDAgIwapP8NCLD7473rhRERVaIOA1+PKEIXzZLNq9ed9ETlqI9C3Oa
	KemlSJoFwzwV0k3vcka/9TMuIiQV0DsA6R02Jahhcc08rTr7YFQRLIoIVmitvQJv
	WUXR8g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xes2ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 22:24:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so6202915a91.0
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 15:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790029466; x=1790634266; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OEnrmQFNO2k7A12pfE7wpLl5Xljl8coTbLHitjukYz0=;
        b=N4vm1clUwKEMJj0iGVgLicCrYMUouktu215rdbBFPKx94/UPBtLoMzDjGv13KIhsL/
         I7LKlz+DKoCWbWqRc1vdmrleR9V4zwNOCGPt9b9EmbW9H4/z2RGdme5Zim0oM6+6ESnR
         2kf/VWuhcreRrjX8x5kmWbJmvldeyAXs2p+QW2FNXhLHU7iSBw06JKkf+h7rl6jDz/Pc
         VUHo9AKi3saNVM6Ta0x9lJwKw4LA5m/+hYj1ijkzG5W69T8BnxDRPCwBKlQRWx2T7AGx
         rLslvr0aI+EkTelcbpOH673H0xTZqa6ULbTuhiTBJJ/fBhHUCbX6mciq/wooN9qICB7y
         FqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029466; x=1790634266;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEnrmQFNO2k7A12pfE7wpLl5Xljl8coTbLHitjukYz0=;
        b=qdvCU7AV5xvEDLI85Ze6VDQ4cqG9/dK/aykYtAkJVUJW0BiSD+4fqTwszakZMtcuel
         Oo/GoLx5IkuLH3Il7ZzZHHA8bWGYmILYKy2JJjHTWesN5TvUua9mSRmgBSHoqAs1HRu2
         HB4EdO4Rz7SVcp5iO1+MRdUDp7XGt1SbAhyoNWzrNNVKJyhNJyuH0wSNo4K0158FJi8O
         Mq4xIljHkcDIu3bjcv26cRdaUggYs5r/TFPF8Q6UGpPp1GqWcOB94m7wq4a1vd0IAHoq
         ri4euZBOf162trWzQIFYDx560zwymkP+fzcys8Vl+9TPT+4Poo43jFzsEb9pvwm0V3gK
         fqww==
X-Gm-Message-State: AFuF++laQ6qwuRryhrJBI3KpQaJN2Fkf7o9L3pc2zVj2Yy1ShUJ7Pqh/
	pE/teGOahoRkXy6GOUc2nuLfOzmCqRLbJkV9go1jIJfUjMLVQAUTCjSJYyka8VccCEv9txggsHJ
	p8s0IetzwyK+pf6dt3DvuF46BvsEvIVsJKJyZp4mUpi2WsNCRaN1AnUwJdA5+l2JQ
X-Gm-Gg: AYBFou1bRGR6PgV4rSLrkT51YQrQFOvcfBGBpkNOLAI0sc8s5aBVRDjeno0HKqmG8KN
	hSXyFhTDZITIbyMX+mH57QpP/7GKCr++vQuNtxJJl2wxCIrHMMsXI4NR6WKNXvj9K3WS+tskler
	hGiX+j9bGcpfeV12jRwpINGOL0nbhUx7qUn3F9MLrvUoLjOylHke34ZkTqf1xxjXkLNx0HvyGnG
	T39eAUjiv/e6bbK49L9uB07+Dvap2KT7Sll7MvwetAYBdASitdvi+qPEWNZPTg/uZ1ge39gAMC3
	tOR4MauZuU5SPLurZIM7ETkI//FO7/a0Pgx3uy9i4+/xBDQ/dJr+KIy/SL5xgiq97X3/SUjbkgT
	dhQF5Ycq7WDCL60XG1YWm2P/X7w==
X-Received: by 2002:a17:90b:4b85:b0:3a0:42a9:9c73 with SMTP id 98e67ed59e1d1-3a042a99fd2mr5462351a91.38.1790029465901;
        Mon, 21 Sep 2026 15:24:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4b85:b0:3a0:42a9:9c73 with SMTP id 98e67ed59e1d1-3a042a99fd2mr5462337a91.38.1790029465452;
        Mon, 21 Sep 2026 15:24:25 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e613014aasm34921eec.22.2026.09.21.15.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:24:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:24:22 -0700
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
        Andre Przywara <andre.przywara@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@ram.com>
Subject: Re: [PATCH v12 4/7] arm64: realm: Move Realm memory encryption ops
 to RSI code
Message-ID: <20260921152422.00006d80@oss.qualcomm.com>
In-Reply-To: <20260921053807.354802-5-aneesh.kumar@kernel.org>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
	<20260921053807.354802-5-aneesh.kumar@kernel.org>
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
X-Proofpoint-ORIG-GUID: xKl_OxJWZUiV_3T41sX72I0PfzeA5ZKt
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab1ae9a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=OqFrNVoMAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=EUspDBNiAAAA:8 a=O44U9CcMlGbnah6vnssA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=H-multw7KC1Cw6hvqdV4:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: xKl_OxJWZUiV_3T41sX72I0PfzeA5ZKt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfXzhx58sVLtBZL
 IMRnMwa8UH7He6qYVzZ9OmA+uas9UwK/98CBOHjjp+QaK10PWeOdepIzliCcd9PkJreLsm2yp+k
 jj4Gl6OOjpDvDhbj3gVloethtCvLKDFCTq0O+Gha1m3aYAiRPQcLp1MyjRXuJxZqgUIN0YHQaRA
 tFWIn2mgX74lwG3qZZJj9YUsaYSxUhliFQzYUriPzN4Ae7KlPz6ozrbpXDtI2ndd1WuZiDsi4bj
 6IPhyzwSIlf02zE5Wb5mib+ivTm79Ezezb1mWFusoE2B7y8A5Rw37B/Iv5JG3mqFL+UOEgveMwg
 yzsigbuKhohrzlDLxKA8u2xF2d2CHzGfvgmYOur3TaEmmgqm3cjK9ZpPCz1c4om3wuK9ibhpACT
 3R/7NUkEuh55XTaqmKIVfp7NkSUw6EIQ5jajJNwIL/MNf7mtKXPIL+twy+ggd1pxnDcV2iB2wZB
 8uC1SPN1Qb3mi3YRnIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfXxb2HohGFM8g5
 0QRQYFihWV9cm7vtOCENJYNaqzeyzXiMFLW9JhU27R/nD7T3u7gTkXFBYOOhr+NUUDIwpBa9zHT
 tLWNi24vQXVwIj0+OmbdDvBbzy7gJ1s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210328

On Mon, 21 Sep 2026 11:08:04 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
> registration with the RSI initialization code instead of pageattr.c, which
> only needs to provide the low-level page-attribute transition helper.
> 
> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
> the Realm-specific encrypt/decrypt callbacks and warning policy.
> 
> No functional changes in this patch.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
Mostly for completeness and so I don't read it in a possible v13.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
