Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB38F420463
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630257; cv=none; b=DGuW7A9xjkTrbAiJSHPHEjpIwTDdO8PSzh45IKry3+ug8mVXtUZfyYtzDZmbGGmviiw4HEY2zhuV8Kcgy7Vxbn2Z5jYuCxSbDAUuKbNiO7LjJixFZ2UhJPsmFXzglgxtyXZ8eQXeI/u3d/DRVo73h9jN2PHPVEjVaSEAArzs7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630257; c=relaxed/simple;
	bh=XPPQhlrE0bO8IfDnjPs/cSwx0flsvJaogoL5jJ9Sa9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snxRaBE77IorGA/xC4tusxD21dQiILZTsYUkLWA1I/8qVrDBpOCcUL9xsdxGpQ36EnkI+cTsoajO3Kgtt4k90Ro7NZV0CjSgahTNkDhF0Ugcca2aOIlBmxFJFA1DRc04Od31xq7QvZ/yG40djmwXZS/s/rhVtPLnvh87FKUKb+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1pcNEgO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdyzJu+A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1pcNEgO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdyzJu+A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCKFhT1955905
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 14:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nnrhxChuvUvmnhUjftdL+cEY
	05K58EtTFKjpp0G3HSU=; b=F1pcNEgOoZ3yp0g3uucPc/lGIbIftg4yj93eVVG9
	G8Cygm5t09wMBysVSE1jAhc9qeIaD341KZ6skiYE1bu6JsYTZo51omzlUHy95+uq
	MoMH9vnOU3lwMQBNxRVVcs9Iuo3mpk+lRg4N9Q87INoIKyQfR9LVJpSoDYUyfF6Z
	CjrBiDuwKyLlSulMnczEQPzBn+aWtW6Tarv3FmBnNUwXEwpVA4g1zeIsZ2ltk9lh
	4tOcckJwORwstjwVy5QeYF5AWgQDjlGLYowb1HPMFOpCmRTbZHbUHui0y4hGqi5L
	9kQ9eHIEUZctP86420PdCrEbooubRFj8vhiS7WYeUxLgjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14syjrbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 14:10:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so20370925ad.1
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 07:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786630254; x=1787235054; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nnrhxChuvUvmnhUjftdL+cEY05K58EtTFKjpp0G3HSU=;
        b=AdyzJu+Aalj2qyzATz1g7gPszCjy6tdsk9fI2O7saTL1dedW2baLFTqI5u/NoCapwy
         zmg3MZewqobFGO8QZmbzecnYJ56ceMqB+YXWh8NPwJfGxlVUDuAq5yQLDKvl9KKnonr2
         7+PrIua7Olip7dxGMGVYJbSv0qFK1jWdD5K2Oab5JdkTYFouCBNSmVlsow8ilW+kOK/h
         di2LE2GRlVNAYgbw0opvzNqLtZSIsgFx9EnF9A4oSZp1KlU+KtAmoyNEKNDW/+vICHDK
         oI4nKUAfyYted6afa78n7LweWGwNjjVSQXtGGUQgpjePfB7tC7jrCS3Wgc7VAIXpRin5
         VrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786630254; x=1787235054;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnrhxChuvUvmnhUjftdL+cEY05K58EtTFKjpp0G3HSU=;
        b=sW7D1eaZXz7g5vJ4l6LTK39BWYxWEkimPMo+PyADPQCxEsSjHCPb5IUwhoO7mcBbDf
         hNUfe/nDGj5WnlepV67rqgyun4Vc2HUDiFgszZ4Csp8cfZsBMhR1U9/FzK78oleU6zzo
         uf2HlT29E+ZVxLKhQkwlEGYmmO/MqSV+Nvuzedy2OxTfyyoCR6UYu5KZO+Hzoh0OaBPq
         i+U/++uZ/dbIUO/xsP3CbE1UrS5Bai8QHUwEFCSM01jAZvpwFQLBVzVJMLaKGaGPbFXA
         78M2sMqfcGdQ/Hr4+wtsp31l4SPXAbX1ObQ/BwOPYX7gxiULgNTWc/ECKNN1Mqmg1zGl
         5AFg==
X-Forwarded-Encrypted: i=1; AHgh+RrQ6mrUF22gxEb7OZ8BlZfck2/jd2ddGwRNGVbSFwb+lGMDt1DQpS2W0wrYRc8rPB2f/CYjfKtXL4H8@lists.linux.dev
X-Gm-Message-State: AOJu0YwgFPbcvDSQKCpL+dYgs1MgpZtQrE1NJ0tJBVFzbdoA17S1c8Ao
	KavckQuXzGl8ERTTBmwHzU7AS4OQiECVQQ4QSbJI+TKKcbltOjGU/jimvIVZiPs3vXznCQL6IYF
	HqaBtmWirf+9TxzO++gLnC/wzNZ+kyZGoqjxPd7YpUuNuOvE01opa7mvoobyEs4sY
X-Gm-Gg: AR+sD1348ZHE+hPWXktotwIzcbUPPJJhu/V2uq+0Yn2duKAr7BBKQzrOnUCWQ8L0pG5
	DlyEqg0kFf01kRsrY3upiCIxSQvUHOGcPRihIJtsqyHAE1car18HBWSlsfdm171RTfKrmHHU40b
	KWTC3aK0eaReIDrwqODjFDn170v8Lhq1HmLCP5DOuZYvJ8eIYrKvNGcg1QTtsjk48f5H3EW3U/L
	3czOtdJTWafmVPBlfbeubkU7LAENmucRpk3Vi/tHCM06g5w+zMXDQERHBt3G6WcY9lUNrzkn04k
	M8F56X8y2VktQdlnvJm0aRaALVOJTPtiVUPdKxbgEOzGXKa/ZZgJoYjGsvTgpPrW8iri1n56eV4
	aM5SiNENXxR4xDkCnJ9DDQaaerVQWB7S6lQ==
X-Received: by 2002:a17:90b:4fc4:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-3931e304a76mr7286844a91.21.1786630252109;
        Thu, 13 Aug 2026 07:10:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc4:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-3931e304a76mr7286722a91.21.1786630251469;
        Thu, 13 Aug 2026 07:10:51 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec082633fsm8518276eec.28.2026.08.13.07.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:10:51 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:40:41 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Zenghui Yu <yuzenghui@huawei.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Joey Gouly <joey.gouly@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
        Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
        Gavin Shan <gshan@redhat.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Alper Gun <alpergun@google.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Emi Kisanuki <fj0570is@fujitsu.com>,
        Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 07/45] arm64: mm: Handle Granule Protection Faults
 (GPFs)
Message-ID: <8db602b8-7fd3-4c11-8fbd-3b8251648eb8@quicinc.com>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-8-steven.price@arm.com>
 <ans1ZSwMEKeT9Gfz@arm.com>
 <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
 <7d4e5920-aa20-40cd-954e-037631bd0d6c@quicinc.com>
 <anx6YbPMVz3OlpA5@arm.com>
 <an2YN7kxB7bjCd2s@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an2YN7kxB7bjCd2s@willie-the-truck>
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7dd06e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=vggBfdFIAAAA:8 a=dIWtD5pVMjQwIhOhhukA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEwMSBTYWx0ZWRfXwkLndCd5/UNG
 2Ng2e30/FpRVYLeq2o2NSRHJozGOgi12hiGSM2lUjUlEZ7tWqE1pl0Sf46zsSoiFUN4qhI4nt/Q
 6cq+MDIdOn6mMgdnOaCaHFrKkUqD1ftMhnHNr5kDVVllS5NWo6nfB3Jzi/57/7ALquTd4dntcQr
 RmEwkfasazBM3f29FO6V2qxbt9EfXirD10mnap2/QHIwYHOey/YFaZZOwd4QcNwsaoeOiXZmDso
 JO6aFtUfUC4ZWe3iH9G01OfNy7FY+cbdY+hijAlgz/OYx3oRQeSKcw36wQzqByE2yw/uBhyCVxo
 S4x6n2q/mSF0KLiFX/5fm/gqhGh2xAXdUwy6ZMN1M1ea7KaKtr8B8HwGM6m3QQAP3MzjQty4lN9
 TMmgcUrwLOeN+3l4fpV0X9w4v3pbMh8AY/fxCl9GgrJqUviwQs3B/Jz8hSXiKgA3kXr1szKxTwQ
 SLjlXkQL1kiFFmmmI2g==
X-Proofpoint-ORIG-GUID: fgUgeNwR3rfnw4RbzaRLz46FvjKGvwT1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEwMSBTYWx0ZWRfX90cXD059Yg8m
 UHikd2siOCal+4PbRx75kcMrR3NAUHFv5XTDA1JbgpXQNymz0MBU1MZXOWOhP0RVt13PP2AHPDB
 FGeMRf125oqqZ+4XF4YItTrh+V0rx/Q=
X-Proofpoint-GUID: fgUgeNwR3rfnw4RbzaRLz46FvjKGvwT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130101

On Thu, Aug 13, 2026 at 11:11:03AM +0100, Will Deacon wrote:
> On Wed, Aug 12, 2026 at 02:51:29PM +0100, Catalin Marinas wrote:
> > On Wed, Aug 12, 2026 at 06:12:09PM +0530, Pavan Kondeti wrote:
> > > There is a valid case for fixup_exception() to be needed here in GPF
> > > handling.
> > > 
> > > -000 |load_unaligned_zeropad(inline)
> > > -000 |hash_name(inline)
> > > -000 |link_path_walk()
> > > -001 |path_lookupat()
> > > -002 |filename_lookup()
> > > -003 |vfs_statx()
> > > -004 |vfs_fstatat()
> > > 
> > > We observed this in Android running Gunyah when the page is mapped in
> > > EL1 but unmapped at EL2. path_lookupat() can actually handle this
> > > via fixup_exeption() when a word load crosses the page boundary.
> > > However, Gunyah injects a Synchronous External Abort and we have
> > > a downstream patch [1] that adds fixup_exception() in do_sea(). pKVM
> > > injects [2] such faults back to EL1 and fixup_exception() is taken care.
> > 
> > Ah, good point, completely forgot about load_unaligned_zeropad(). Since
> > we don't unmap the linear map for delegated pages, we'll need the
> > fixup_exception(). And I guess warning in this case is not desirable
> > either. We could limit it to EX_TYPE_KACCESS_ERR_ZERO and
> > EX_TYPE_LOAD_UNALIGNED_ZEROPAD, though not sure it's worth it.
> 
> Alternatively, I think the series to unmap guest memory from the linear
> map would solve that for gmem:
> 
> https://lore.kernel.org/all/20260410151746.61150-1-kalyazin@amazon.com/
> 

Thanks Will for sharing this information.

There are use cases outside gmem like FF-A lend to Secure Partition.
we may not be enforcing all such memory to be unmapped at EL1, correct?

Thanks,
Pavan
