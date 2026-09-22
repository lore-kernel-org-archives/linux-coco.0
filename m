Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0198A531B0B
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117689; cv=none; b=c2v3bPrdmPnsOXNgnnQlC7sTYA4krt3EclZKMJnzuu3qjTqVvKxgQX12s8RRksjKzuZahoma2EXyRA0p0thzzGuc2Pq90omT2pn4qPHqShy/TGU9vpzGQu+lKg5McMZnFfqrKKK5szfxFEhjZq5Hw+tiZMyaYLNywLxOFu2kZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117689; c=relaxed/simple;
	bh=ySnK+hmdvoPJVkgFkjfrLJlNaWN5LOaQraKbC5hMV2M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E/wT60x5JYUbF2piab6YzfMZG3dllF1KMuB3fkep3bCSgnNhVGBDFvsu8hVXiDAVDp5ZROJF6mC1VoWV9Y1wzUKQuIHgolaUG9DdSfEc1GzOSZ75hgMO6GP8mNiZsuhYBC8vOZOGfR9fb+mSctMJ8QsoYyurpiwL+2ps39NYh7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgC+Jg22; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+QzJyKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgC+Jg22";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+QzJyKZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBeJJ3897562
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYxvfTdm3oz7TymPids4imwzrOSBJe+ux30GQWYD/WQ=; b=TgC+Jg227JT54tl4
	P5oAiVK2B3oGJAAJMrXG0Kz8oLZBB5wfKqJ/JTsnu6gDea3KvxyAXIqy06rrQHxJ
	BPTXp5Bw1Cy9Fx8d/V8xAxo+P/+OiHNzL9zUc6Wsok79fsbGQhIzId94CBYHb4bp
	skBUEfTUJYU+vlOqfF0o1arAozn4tgbQaZTjqQGXJKuL6nusRUJBJ3LRUKtFj13l
	aXK52LiNDgboYOpBgBX3YDbe7Ba/CY6ZfpjL8mVgbTDTaYgR0eW/eX3v1VCLU+/R
	aJ4fgVdyZjItZV3h+Jut4PysymBjF7GY/dpYwi6CNF1CHWgEUmcVoZBrwjvk4SCb
	hqqqFA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma0xn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:54:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33bee712354so354770eec.1
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 15:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117684; x=1790722484; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYxvfTdm3oz7TymPids4imwzrOSBJe+ux30GQWYD/WQ=;
        b=P+QzJyKZ7i3nq5JolGkI8EADR3/EndzfOiXwIExcPygyWYEvxesu2+oSmlEca0eUol
         sqUoJ186QLtMbCJ7NU6IoenFh3HyBWz8N8u4GOr42EqgPUQQXHjrS1zHuPYh6esqiN4s
         cXG7ub9fNkgrv5npLwOYwlcjAWku5LGVXU0FEraTkYwPpsRJXclPLZO3X8ndvvHvSoLu
         USM84xcW+qxDY4Tat9R4PHP1Ham59aSUKpkQKwklloKRmUp0ugnTnOEWan6i486a4R2A
         AL0sjXddKFxqqY+ZuoJjqF9qWXhwt5p4wF5spibeUf5gt/KeKjfhGhlXYB/pr+rtTqdA
         nBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117684; x=1790722484;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYxvfTdm3oz7TymPids4imwzrOSBJe+ux30GQWYD/WQ=;
        b=cQrhDxxL0y/yYwUXCy/JnPAkTNVM0F/ZfLAD7e6xMkR6+KjCJizwrcRY50MibDc+9p
         IdOLItnmvBfXtTdpQ8Gv0h+8/tv6hPSDAG6x80uQdiJkoSzyxqbA3rwVkp3M8rpmdDBr
         K9+XT8iza0JMC69EXCK+kIc4d6FSLSEAn+aWS4160MOdvNwg/UYKU5G9gHls40nrKEbI
         MQ6NAaa8fWd+5fBOnH4JzCbLMNRzAmzTmIitY8CgRGJ+F5WQVrIirTVWNaQaDVRKHHCj
         W9S6yGMzCCuFNoqXvqpiDmF2VE54LG8uRCRmhl4bTaj0tY+Aa5JKlK96MUL1gIdEX78Y
         FheA==
X-Forwarded-Encrypted: i=1; AKwUvBzHUK4E68f+6AF8BsP6M/axQ4ODI9R5LufCynUSwSdMzlVvD/yPaZeh6i0TPefn2ZeOplTiuUUdsWtS@lists.linux.dev
X-Gm-Message-State: AFuF++nGz1KvIjBJpWGr13BdYn1sArsG+htRMAaxgdJlNCAECp7jUGjI
	tnR9EwMQkrN5Y/fvJh1F6DXyuf0MgLWYDA9yTScThF/8WRFJVKKnPD7tsPjhnkixbt3h4KdG5fW
	QaYyUsPXFwnk0XL0x6DoqYDofJM+FfyJdgMp8Wc+ckUEhZ+DWCr7FiYtp2QZfl5Mi
X-Gm-Gg: AYBFou178jWvOcdKALA++GohnIzat1DXz+/Bd34WPfEOO8PH+ikbL5F+Ves5jeMsC8P
	iKLzf+OOseUFpgyt92RybWXJEFXS7G/5PvqC48aErc94QxUq2AwarF51PfGOT7FPNbQpDSc0J9H
	FLuE9KGFwfXFRCDGUXaF4WXuGZwdB83T1jH055AEvHFb9YWxoQSIWJXP3OhRFmjV8UnHcR12mXo
	7xkNFHgBiqorL9il/CR1TW5bV2KbdDvccwmhoWe9MEIL1Nb3fuCHl/0uBdRUv+qOKXFn7l4ikfp
	Q2LDCYOlnmXcSY3v3YsplD3zfvja9hRhLVBUWUTou5px16U9rN1BXBhhlunERWu0ggQezHtP5El
	+iE47otsaY0dvz/0KMTIXgW4cCQnpCxkAZYTVVoyPae1SfXvNx3Ddeg==
X-Received: by 2002:a05:693c:638c:10b0:33e:6a54:b3ef with SMTP id 5a478bee46e88-33e8c05f69amr760382eec.18.1790117684075;
        Tue, 22 Sep 2026 15:54:44 -0700 (PDT)
X-Received: by 2002:a05:693c:638c:10b0:33e:6a54:b3ef with SMTP id 5a478bee46e88-33e8c05f69amr760352eec.18.1790117683534;
        Tue, 22 Sep 2026 15:54:43 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm1320134eec.26.2026.09.22.15.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:54:43 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:54:38 -0700
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
Subject: Re: [PATCH v19 17/20] KVM: arm64: CCA: WARN on injected undef
 exceptions
Message-ID: <20260922155438.00000f3d@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-18-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-18-suzuki.poulose@arm.com>
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
X-Proofpoint-ORIG-GUID: sCXXdOBQ_gKusqGNSLF7YGCg4247ykNy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX6iO+ICT7OrJ2
 eXBsrlb7HHmp8RWdRtKMKlEz72GnErsjJLc3++lj9Hwi91BszNHX8vgI5W0BsP5sI0SHuKA5DLe
 ZXH9QyknBBRUvgLOZAK4F6mx3JnB9OY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX0NhTTDX8hCEC
 XqDk0drXLNwDhEa7OaQXr3rnFQrXH3XajayzNGLMzqI7fIGcz04q4bG73a414ecWuD7jYBGF807
 4aJxsyftE5P4Z6p0kKDjp7Sb/oGheIvNHFQHCtC9PWD46qhLfWJ5OS1VarN7A8em2vIpsAnvxG7
 tjEBAOslrXCFk8YNyUhnu/t8rAAR7SwmFRZkuK8ANYfEyas6KrtilsCm1DgO0R5tpeBtBb7JI5H
 R+wzRCxtjKfrwDMWNys2XaI4Igy5GfFNHpeNh7OUjB9fGqNumdlt6YpABeVGTD0BEiBrRKTpLhA
 sgzETVkPjJucsE7govGEbqbvd/2yKffG0SCd9lphLn89xfP8wjV5Nc6IrOf7JnjAwIGnK9A+iUE
 HzqVgIPaMYc/u9h4LY6NLGj1l+H3UMEhSm6sAA4SJz6gGdJfrUiXa657AjF7NdQ2fuJUe4ZFL76
 mMfDEfd1ZWsRZbAMVcw==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab30734 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=DI-nzRUvp28q1R9r8mgA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: sCXXdOBQ_gKusqGNSLF7YGCg4247ykNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304

On Sun, 20 Sep 2026 22:28:42 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
