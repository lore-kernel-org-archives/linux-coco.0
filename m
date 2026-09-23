Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C974F4D05
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181803; cv=none; b=hqvCxHQIC848ioTP3QsRKlSjKMKr03iJvzjRO2hAGRH10Ljl+PEa0oX/kCN3r+SfZ0osDNS3bKxRMuLvgXjcBO5j6eoWkVEprkG8Y7NrIuDAJsBsUAPepolRP+RrqqSJWcoFO2QLw5ZlZGTpdgXJNnliAevCjWUdNXJtmctsmKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181803; c=relaxed/simple;
	bh=D+5gp0eInBkAIcw/P4QhEFD3OcUSw+rc5EmHyXQaC4I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IhuHSHq98OZtEL9f1IcHf8ntJZ9oFsStAPhINF0fUNN/+ipyA541o3SM5Sb/69JL7PR4r15zWYkPE0i9SMts5y45E/A1K5rAyHRAwTUkySYE6lRqElwQQGOAGdAfSLG6QzEqot/5jqhRq2tpttxaBDumJE9d1qzhbjb/f31MD94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hA3I+ydr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqqxbWEw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hA3I+ydr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqqxbWEw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTptg063799
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 16:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QoU2sou/2NEY59DVI3hWXvNKjx2hz4p0U4PpxsOoZ3U=; b=hA3I+ydrYlOFql4X
	JxWFom9ApvGFxIhW4iJAVmHcOlr4cRb3xmzkr+vaEQCjobOzbQgcXZIJw5QXx6mA
	HRgAb8OtcT9QYxPnXB/uSwR5OYu+A90dBDS4mxKJe5utoT0RLlSQK+2zTV2NPzKH
	7yhsmARmBg8enrgp25pv444D9bfSod249/l04RP7LOyFpv5leqIqnDign7vVxOIH
	GBPFdJ4bCbOnKPh9FTNSFNHNUQb6cbePrxD+69dggHrzrKIxMH/5voHOvWOcJlYF
	uO9EbOPPdi8bwl/t/Tqz9m13OePvNio0dtFsXosSlWU/0JfzW8kurZFj+jXCuggC
	ue/a6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbgwan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 16:43:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so969301a91.1
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181795; x=1790786595; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QoU2sou/2NEY59DVI3hWXvNKjx2hz4p0U4PpxsOoZ3U=;
        b=DqqxbWEw2Daw544KFihqQ12h2CXYg03urlLIH8wDrN0E4fkTBDzJCU4redv0rDQhsP
         x8rMrNLdS21GyqiaF1xcvdbbDs3D0OCKfiBRJFLUgjcyTCBks71NBXpVJfHDIOrDq3yH
         dVCJQXmpeZS4nM7OZBbcuIeCITm59RjXzWLHhBuqLuc+h8Uo1jXQnvAOvx5hQtZcdpWf
         Oh3zf5vnyhvumJtqXVmsY8kMijzeN23ByaaRGJzunvSjJnwJ4GZVUl5Y39ck8yxdMr+/
         mIwD+avXdna18GewrfQ/0z2PcRIM/nbhzLD9tD1+lmMnJQdeUGl799Zqfj33tqKOahpV
         8Ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181795; x=1790786595;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoU2sou/2NEY59DVI3hWXvNKjx2hz4p0U4PpxsOoZ3U=;
        b=zW/4Q3tBLou0udvEPakvWcJQBKzfePtP1Q10pNQMCfpQ4Dj9q805C7NZ96sI3kVVL4
         Jb2uLPyaEp4MNL6gXGDdUpE0B7QNn8LP06etBFCjE4aINsOQDY73nY+dw3He5Pf1I9ff
         DhfOB7F9fipBDUQLg0CpSMK1E1QrcVYnrOpqwjCUWKwnUiilxMpcvtLeARJapniuw0EE
         IDf9JMa5ioMyT8vHpbtYONtBWw1OZJmKSqWa/OKoAnm5I4Rup65aa8TuHPh6ityFMKdk
         vP0n9WujuKvRNrqEvj7754yLBUjWZdal9f3lndHmWRgVInvvQ+xnAV1dtIUnDOgUWUqn
         CnIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+L5oyE+i3/VbwrZqDWyzhFnTlTbOjOP8xBrxfO+OOQ5ZP3OL6UHKpWB3f2TnaElj+JbGcgE2MLMfM@lists.linux.dev
X-Gm-Message-State: AFuF++nduB6OtHxf4RvNGDyT8tLg7FjbXncG9UwAWjC0g0pLPdrSw2Rs
	uKMHI7JTnUS0UtIR8wje+oNHTTA35OUAg86dVaGkt9q7QaddSFpdb3rl2Uk7kW12B/iILpYW2k2
	lFp8XFGTx0jagEgKZr6ibCMxl3czjdN540Cz8JtAGrCiY7xF58JKRhmvChH5OuwpPlPicCTsv
X-Gm-Gg: AYBFou27yLHR0gt9JBeW1dcGXlJpp3AqOV1U0eHp2olr59ItBwfYlru5FvpOeKJBDlk
	SHEehXpA6uSV3Il8z8j3FtmiYgMN6sU97aQLvvKuix96L6QkryQArsq3jpFnuujviOeS7Q7IfpX
	pg1/Lb8IHZlJRt6oiREJGuZ6igN5R5aTh1q6lbPQOClM3I9nTk7fs8TbWei3WahIE6cHKDddkEg
	wJdcI46ORx/YIhaWrSR1BAvAI3awpRH/2R5DudSQfimLVxG730s2tzgaU1gMY8iQFlJaX5K2+00
	KvSvdkpUKjwiTpt5qAQZ6yppn+eXYIgHYul4IugA5ZIxB8c+A0gGhdozfXV4DMqmiooZqNdI7Sv
	AyLN4BalT46jrStYK7ymsSg3qk5+y/kVzETbNfKLXuc8UqMLUwy4g7A==
X-Received: by 2002:a17:90b:3c11:b0:3a0:7d5b:8d55 with SMTP id 98e67ed59e1d1-3a07e4e41acmr2957144a91.8.1790181794882;
        Wed, 23 Sep 2026 09:43:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3c11:b0:3a0:7d5b:8d55 with SMTP id 98e67ed59e1d1-3a07e4e41acmr2957115a91.8.1790181794393;
        Wed, 23 Sep 2026 09:43:14 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a082a0edaesm2135555a91.1.2026.09.23.09.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:43:14 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:43:10 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton
 <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo
 Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
        Steven
 Price <steven.price@arm.com>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Sudeep Holla
 <sudeep.holla@kernel.org>
Subject: Re: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260923094310.00001d5a@oss.qualcomm.com>
In-Reply-To: <20260915114601.GQ3968357@nvidia.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-2-aneesh.kumar@kernel.org>
	<20260914133249.00007d35@oss.qualcomm.com>
	<20260914222836.GO3968357@nvidia.com>
	<yq5ao6dy27jt.fsf@kernel.org>
	<20260915114601.GQ3968357@nvidia.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX5QRuloGOJ+p6
 3egLGHDd/7q0Tu2XxTrbeNI4g9zHiYkZlZOWhfoDBioQK0SZnw218aIomNF2ASFJpDcMpvtpW+4
 3Qip/UYpLPebB+GiLUMIn+IQHLneMRo=
X-Proofpoint-GUID: smqrj3X3caKgXyKRawIEjRBNJcEGrtsW
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab401a4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Ikd4Dj_1AAAA:8 a=xhGKRIyCQN_Pw0lyfhkA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX6mQALruUkFo1
 YNPBNc8ddnEDLZYi0jyBWpsWBsOZtz9pKPxGEUrmtsqmUS/qGzdquvGgmC1yiTN9k0NyfjxZ/RK
 sGTu+Xjf/iDKOj2sPpEOjkzDlSvTUxL6XVFDmwl+SgKxBNU2l+XBpUt6C5p+IqQghuSoedj5uqU
 j33yTt4exebo7aPJ6VWMWmCyf4TyiG2XFYmWiriQqD9shuhnA5orfU30Vgki94W4KlTVhjfhY9U
 CFPJZFDUGAsi822b5Zlc8y/4l0rFDv7qlLeB+Xo4t/dzVQcOhuFzr73TBePpE8m4b2oolUMlV6G
 rQRGzY0kGtTfBE5aFXUQKhJPcfPnPaUjZnoGaUD+mUmnQ4QqkoqICVaSPaYD8kArEggVHB67h3E
 k8ytruSxhXQs9TFC+2RUGi/EC47l37jq2ZhO1aqGEkOBHyUBWqtwDesIJejwmERbgVvxvDKCMzt
 lbFGWLSWd0xn/YHBDwg==
X-Proofpoint-ORIG-GUID: smqrj3X3caKgXyKRawIEjRBNJcEGrtsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066

On Tue, 15 Sep 2026 08:46:01 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Sep 15, 2026 at 02:52:14PM +0530, Aneesh Kumar K.V wrote:
> 
> > > Yes, but as written it is OK, and this is a common pattern in the
> > > kernel. I agree it is fragile tricky..
> > >
> > > Still it isn't an urgent reason to change it around, but the best
> > > pattern is to put the allocate, dev.release=, and device_initialize()
> > > in one 'alloc' function. Then the other function calls it and always
> > > unwinds with put_device. Use device_add().
> > >
> > > This avoids mixing the different kfree/put_device error unwind regimes
> > > into the same function..
> > >  
> > 
> > Something like  
> 
> Yeah, this is the safest way I know to use these interfaces
> 
Agreed.

> Jason

