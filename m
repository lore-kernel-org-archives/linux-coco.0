Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635A549EC78
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417978; cv=none; b=oPfyGwSpHedWtqo3Q+gwb1pGXU9BQ0C7VlJ+vHpptaqxaiDNud/fmK6C9z6yAdQIu04jOcQ5yfAXnPtiDelstEMNyNgVOdDtmi51m7J/+TJNJYozN2AOLbRSty5nkPKBml1roMoTcSrByYSyJ5KENuL/fckvcANnk4Ym1tqYcZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417978; c=relaxed/simple;
	bh=8+65nKi9I0MXjIV/W1tBCtNfo2RvTPk2JzGldsDp5Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUXB6vYpp5PeZba72aZZYjsPm89pi3RPECsCspw2bwuwhXMC4kJtyUE4bOc1dUr+/5FPvHIpmtpbN2GDd5HecDLpo83dRgNWwzb3hmlFHnvykQDYSNR40E7EK5vyIxnnQXQVcX07Qx4AogxV1j4oYGRaXg2YYpNqw2tjNBlNPds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iuDe0Imd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ht/VIdGi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iuDe0Imd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ht/VIdGi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYP841702494
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SVZ2YLsBB6VGQtK8NxlN3Z4ynzgoiLnBiZCMpH7eJk=; b=iuDe0ImdpagSJSP8
	pcUICe1qwK2Nh6qBJ/n705GYvPYKqd4woeaWEtiWJh4d+mzUXzHf2ap2wZqe69jg
	NzRkqhu1inSazJPrho8zX2foQZfcpIbbFzC4whh0BYQ+syYQaKpvVNctGXvfQoJZ
	/UsG6WQkn2VWEkdOIlLlINOieiLQqS6Yesu06YYSHOw3XaSz9ALy5stbDFRzelBT
	Xm48hCmKEyY5LbG5z+0aI/2juTAJIu9yb2PlQPRm0rqlJFCANJVdNdsEFq2dbo81
	fGNahXW67MzAmKPcdcEPgNlZStKCvOERD+F7XDFzkh5iaJ4yO1pOjwTAUrADu3Z9
	Zwb2fg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9rr82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 20:32:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so6399258a91.0
        for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789417974; x=1790022774; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2SVZ2YLsBB6VGQtK8NxlN3Z4ynzgoiLnBiZCMpH7eJk=;
        b=Ht/VIdGin84axTkZlVSoWQuS9/T7YA8Jkh6bid+snfXCZk56LQLgAnZQseJCL6527f
         UsE3WX1Uld+Cy37s1LJtp985YmVuoPe85qvg+JoPKOqRG6rhzvXV59Z6p9Bwa8yW7eUP
         2s7fXpP7bVDrXm4jdnP6tR21GUh2KQMA2gJhWAcF6LzCE/MqP+XHfTqovOniGolOd7L7
         L6bSDyhggECCkj/SjcOP796XJSbmvD2AC7XJmGoaU6WtSzVSMWfHdHbl7H25ARt5iueR
         l++HLAGOv7YT7K5iJEfOXggSh8ELuHU72WNREYuGYzCgTIjH7uheziYzFrOAsbhsrXHK
         7YKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417974; x=1790022774;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SVZ2YLsBB6VGQtK8NxlN3Z4ynzgoiLnBiZCMpH7eJk=;
        b=V5cEBENHZYM5x9J9Q7JM1D5aFwNrdc19G9rlv+akqQN9bfRaVx/0Is1GZ3tQ8XqpzO
         b+WtOarkvDtwU2YrbnzrbgY331rjQLcvDgA1ZUiHBnGjsb9fMR7SU4sh6qcakuBbsnFG
         kulMRoeN7y/mBuGuip/voYzhBcekb6FvPcu5NFtnwhUd5YK/eWaHqxNXe2bQ4pmtWElH
         fSnLQXwOAtKD3tNN/f9V7ODdU0YpyYZ/VF1WXJtz/JNTxBz/epn85ddDLUoRgcj7fRi7
         TBHgsBHFo3xfDSkXCxfxSrCTOB6XNVid85QxJy4iS1pzbtOrXJirZyoabw8y5ujVqRXW
         rnqQ==
X-Gm-Message-State: AFuF++mQqIEiJUfBRbCKxBDU7d19nNY8feB2oCwp+JqJdwPhNtvaVx7F
	1j0AT0o/iASWCWKuZmJl+eVxSjQw9EQ7JazUnicKHOhGw/Vu6u3k1Y5Broc3XvjkmvUeS32gEWL
	WkRovLd7XTNj6WOjXiTdBB8ovoSUeLvw3Zbt9fqlFFkqPYdqSD8cRfrBqAJt7NzH/
X-Gm-Gg: AYBFou0E0zigzcjkZsCJd/k6Tyqwy9ArXZ0QWoB5Pvv2S7bJV7d5LgZUdpbsjihJGxZ
	4hmLZc1NbNLcGy1UnMmDgzPXf1oIhSVzKaEimVm9BYqxXsVcd0CCpUvQFeG3nGlXRF/pKlWWRS/
	hrGIlKlJ3B6Wtd4Fdx95kc4pu0/bLMM7+VlO5EpRmU7lLDeVO0qPQsJ2tY816+JzuM7UMVdxIyx
	3M30zbg50cpva+ao5wiegjoLz5kqlXYwqJeSLJ0yJ08UWx2FDj+1CC5TLeYpVGkbzuEagBLiMHi
	b6T4W2zba4xVSk7OUYGMaD55Gtedo8cFp/rJfCaMIttBjt7ZeBM6lTzPFBMulk4rxRSd+SowpqR
	gRgAoR2dnRsKERBieul7zX1kflxo=
X-Received: by 2002:a17:90b:57e7:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39dec05d7femr8511337a91.13.1789417973929;
        Mon, 14 Sep 2026 13:32:53 -0700 (PDT)
X-Received: by 2002:a17:90b:57e7:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39dec05d7femr8511268a91.13.1789417973397;
        Mon, 14 Sep 2026 13:32:53 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bd8ad03ccsm9880610eec.2.2026.09.14.13.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:32:53 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:32:49 -0700
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
        Sudeep
 Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260914133249.00007d35@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-2-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-2-aneesh.kumar@kernel.org>
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
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa859f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=rWZSSP1HmsjXzHu-GLMA:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5MyBTYWx0ZWRfXzbmgym4X5bmP
 vt4RkoEPm6yQaI4Bx8cqJUfW0MsoC8FSPkBct4AR9iF7noaUwX22gaXVO9dDKfnfFYiayC+rFby
 GwUp/TgRg0yRNuPXBXjhndxc3DC+eOM31V2U11y8Ka0qx0ffnz3u97o72ONQF3trRzZkeiInT4H
 ulGs74EkNvHuvon+Kk+Gcis4v7hWA5bffEBAysrBRF+j97AGAP8jo22+BtY7EaE2laBzaDMyIRR
 MRMhIKIiNVL9rzGUKovkhc+wfBFMDfNn/JOGAVIqlVC9E9VBGOhGoXBdLw17Wi5IJ7xhPbiDy3j
 n0wF9ja60kEFR8K/4QlvLXfGVDcgy36Ig8NUdN6Z5Vt/hmczI5sffzZEJhqo5MdLWYibIDqsHZk
 kOuK6ZZ8xwzIMPm6MfZTXm49IgnOIoEuQKNm2AnfIXtx9umorBHr72kqfRWtr1686sLxbu1DkNr
 k8XjQ/xJEpKQLXeL8Kg==
X-Proofpoint-GUID: r-8GHgID-JL8TLqzIW6YvJh062mVhxEK
X-Proofpoint-ORIG-GUID: r-8GHgID-JL8TLqzIW6YvJh062mVhxEK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5MyBTYWx0ZWRfX+ctyEU/70em1
 JqNkFjKi1dSJ07MYN+z2KJI1Q/L2oZT7lQJ/SLT9wsYbI65KSm/e5ZV/U5J9XJgTSLSv0wbI/Dc
 Z6JnNyWAEgHLkcUJDZOXs4c7E7+2fhk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140293

On Mon, 14 Sep 2026 11:35:05 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> SMCCC-discovered firmware services are currently represented by separate
> platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
> represent independent DT/ACPI-described platform resources; they are
> features of the SMCCC firmware interface.
> 
> Add an Arm SMCCC bus for services discovered through the SMCCC firmware
> interface. The bus provides SMCCC device and driver registration helpers,
> name-based matching, modalias generation, and a sysfs modalias attribute so
> SMCCC service drivers can bind to discovered firmware services and autoload
> as modules.
> 
> Follow-up changes can then register SMCCC firmware services as arm-smccc
> devices instead of creating independent per-feature platform devices.
> 
> Based on arm_ffa code

That code has the same issue as below and for bonus points doesn't check
if dev_set_name() succeeds or not.

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

On tiny bit of fragility inline that I'd suggestion avoiding now rather than
later.  Down to dev_set_name() doing allocations in some cases under the hood
that are tricky to tidy up with device_register() being used.

With that tidied up

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/firmware/smccc/bus.c b/drivers/firmware/smccc/bus.c
> new file mode 100644
> index 000000000000..caba1a03c997
> --- /dev/null
> +++ b/drivers/firmware/smccc/bus.c

> +
> +struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id)
> +{
> +	int ret;
> +	struct arm_smccc_device *smccc_dev;
> +
> +	if (!name)
> +		return ERR_PTR(-EINVAL);
> +
> +	smccc_dev = kzalloc_obj(*smccc_dev);
> +	if (!smccc_dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	smccc_dev->func_id = func_id;
> +	smccc_dev->dev.bus = &arm_smccc_bus_type;
> +	smccc_dev->dev.release = arm_smccc_release_device;
> +
> +	ret = dev_set_name(&smccc_dev->dev, "%s", name);

Does protecting the string defeat the nice underlying const handling?
e.g.
	ret = dev_set_name(&smccc_dev->dev, name);
might be better.  Not particular important - I only noticed because
you'd often see this between an device_initialize() and device_add()
and then we'd be relying on the device_put() to clean it up.

So as this stands this is fragile as any error paths that later
get added...


> +	if (ret) {
> +		kfree(smccc_dev);
> +		return ERR_PTR(ret);
> +	}
> +

here can't free the name allocation.

So I'd just switch this to a split device setup - something like...

	smccc_dev = kzalloc_obj(*smccc_dev);
	if (!smccc_dev)
		return ERR_PTR(-ENOMEM);

	smccc_dev->func_id = func_id;
	smccc_dev->dev.bus = &arm_smccc_bus_type;
	smccc_dev->dev.release = arm_smccc_release_device;

	device_initialize(&smccc_dev->dev);
	ret = dev_set_name(&smccc_dev->dev, "%s", name);

//up to you whether you care about const string handling.

	if (ret) {
		put_device(&smcc_dev->dev);
		return ret;
	}

	ret = device_register(&smccc_dev->dev);
	if (ret) {
		put_device(&smccc_dev->dev);
		return ERR_PTR(ret);
	}

	return smccc_dev;

> +	ret = device_register(&smccc_dev->dev);
> +	if (ret) {
> +		put_device(&smccc_dev->dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return smccc_dev;
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_device_register);
> +
> +void arm_smccc_device_unregister(struct arm_smccc_device *smccc_dev)
> +{
> +	if (!smccc_dev)
> +		return;
> +
> +	device_unregister(&smccc_dev->dev);
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_device_unregister);
> +
> +static int __init arm_smccc_bus_init(void)
> +{
> +	return bus_register(&arm_smccc_bus_type);
> +}
> +subsys_initcall(arm_smccc_bus_init);

