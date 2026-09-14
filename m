Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EF41F379
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379432; cv=none; b=qGziwXZ2FkfWjrz0vkH0DDkO1s5/bFt2/KXOCoyarZdT3fRtngpQcupbSIHxLEQFBBEFB919zghRA72ka5agwajXfgJBypOwXktw63A1ieQ4bxFoOFkSFfazOXmAZDGSDbze31fPjlecHPAzjiG7bUjsba955f3oHVutFoudVac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379432; c=relaxed/simple;
	bh=kylQFAzh35/Kr/cF4hIu5aA/58qReMn3tf26L0Lxe+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBs1xxCvr9x7m4kRgtdJJ3EQY0HFQ+WKPBQ+2r+BuBcLm8+GoUN/Xbr+3+oEG9JH9Ks08fcTm7c2y7sGANxfxUQ0/AahzdP9QL8xl3HfQH4SQsXYAcQwUlJ+ayn29OCUY+KHZFRxAT9MRrv81Q4MK9y2h44QbCnWT0c3tCRnmLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZzoBmxSj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZzoBmxSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789379429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GS5txPMa8dcMMZaluUjmTNiCxS+esxKMHPUrHUieImQ=;
	b=ZzoBmxSjXrpVBmu3C0XGF9IT7Mir2bzO8YkePvKm/yJJWbQ4DFABVKBXKuBRjn7ypWzyUP
	yJRcTFlCrsqb6O6s7LFDYXpTKuxavuXJGK7keFkZ27c4gi+TSzjckNZFzk/MK38MyFVsXT
	MofjNpm/XKvm2PLo//SRuc8cRBZdEk0=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-GZOWuVOtOyC228en6T1pdg-1; Mon, 14 Sep 2026 05:50:25 -0400
X-MC-Unique: GZOWuVOtOyC228en6T1pdg-1
X-Mimecast-MFC-AGG-ID: GZOWuVOtOyC228en6T1pdg_1789379424
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4095051a12.1
        for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 02:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379424; x=1789984224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS5txPMa8dcMMZaluUjmTNiCxS+esxKMHPUrHUieImQ=;
        b=X2ZDvujtdc/+dhii10QPxM6fv5gnszENLcrUF2FWwT+RINVZUs3aSnod0ajFYi4uNj
         TcmsoxusXuEv19v2LUXM3dCAP9Gv7KyewB0Ts48VK2Nui6aEZeBasqiYtaLdpHtE9KJ9
         M354U/ZArYQK1LUMJqGpv51wwjONr0sDqkUdAUeaueBsR862iX91fZVNbu2N9y5VUK/5
         pi78und4aNPKx4et+oAS3mULyX8ZtgPBlV6micArAq1gh4Y8OFcdEa7/EQ9gA9F2Z5tg
         abHxAm4daLTlCazhLZF5LVtl51FS0sUh/D8JTwHZdTZO5mCubLf09GyMmcOH6C1I4rSN
         S/3w==
X-Forwarded-Encrypted: i=1; AKwUvBx70JpHKwCV41+T95mmIXbwtXuI/FDyvvw79c21Yj7X6gtdbF/DjJqFrfw2r/pWurpywMllKTQxPGw4@lists.linux.dev
X-Gm-Message-State: AFuF++lR/RfT7Ah1csQUhYmru1ZHSkRHArKNF3MRXxxh5ow0+RgebbXJ
	y/D/+QeSGXRASDQGBmWfWCmBhWEVCIVCgFNlqL7YjIim0L943FdaZ4+0F2Fr/DxBXeQyA9gTM86
	tht7YhwtV9iy5ma1KpbHgxEhPZR82rIaHFkH2ISunJg0oQSLxHWyoxcmlp2+g5TM=
X-Gm-Gg: AYBFou1p3GriyR20wPuBd0brlBjB7qp0/ZYXoRgU+AVCaoe5t64/ZoPlCCY3+B2HwXb
	ZccgrhojJHa4NJSsSRyoBfhcaxaVP13GLL8qthZLjGXtsjhmEnAnCpk+mjxf/mvzLsWtSP/pRA9
	E4gNUeVjsMBnlpbMPdT7sVdvxfSG9UecDYc1/wFKA/d6qc2mrebvMSQAqj2mjqJH79HcLmI80Zz
	pPGK0N4cUqnorrPZTbIdnPNzsOz5jxOEkRNvYvNgXeP7aBHqo+X2ZkUx5V4Gw3OnNfO2TxnW15R
	pSOLuv96zJyZJUiex0GS/sywtIbZcHSdOdRboJK0qilYvVRvW5H3DisG4SUOF3Pf8YZ/Sbp3HDf
	S/dbyBwQ7c+hajVSFt2YVScNk2MpLFHQIzDs7DCIShQ==
X-Received: by 2002:a05:6a20:7f9c:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3db4052063emr3632232637.13.1789379424397;
        Mon, 14 Sep 2026 02:50:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f9c:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3db4052063emr3632178637.13.1789379423970;
        Mon, 14 Sep 2026 02:50:23 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4efc398sm30439434eec.19.2026.09.14.02.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:50:23 -0700 (PDT)
Message-ID: <25706923-8e9c-4785-a80d-b138478ad374@redhat.com>
Date: Mon, 14 Sep 2026 19:50:12 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 4/7] firmware: arm_rmm: Add support for SRO
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-5-suzuki.poulose@arm.com>
 <f00d01d1-8df0-4865-8e52-c85171cf4ca5@redhat.com>
 <4f18aa66-2296-4b63-87f5-6ab493faecbc@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <4f18aa66-2296-4b63-87f5-6ab493faecbc@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dll2a0nEiCFwi61B98sImcUJdgWFhh3bc4rGXFbOvzM_1789379424
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Suzuki,

On 9/14/26 4:22 PM, Suzuki K Poulose wrote: 
> On 14/09/2026 06:04, Gavin Shan wrote:
>> On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
>>> RMM v2.0 introduces the concept of "Stateful RMI Operations" (SRO). This
>>> means that an SMC can return with an operation still in progress. The
>>> host is expected to continue the operation until it reaches a conclusion
>>> (either success or failure). During this process the RMM can request
>>> additional memory ('donate') or hand memory back to the host
>>> ('reclaim'). The host can request an in progress operation is cancelled,
>>> but still continue the operation until it has completed (otherwise the
>>> incomplete operation may cause future RMM operations to fail).
>>>
>>> The SRO is tracked using a struct rmi_sro_state object which keeps track
>>> of any memory which has been allocated but not yet consumed by the RMM
>>> or reclaimed from the RMM. This allows the memory to be reused in a
>>> future request within the same operation. It will also permit an
>>> operation to be done in a context where memory allocation may be
>>> difficult (e.g. atomic context) with the option to abort the operation
>>> and retry the memory allocation outside of the atomic context. The
>>> memory stored in the struct rmi_sro_state object can then be reused on
>>> the subsequent attempt.
>>>
>>> Wrappers for SRO RMI commands are also provided here because they depend
>>> on the rmi_sro_execute() implementation added by this patch.
>>> Delegate/undelegate handles are also added here because they now use the
>>> SRO/stateful command infrastructure and are also used for the memory
>>> DONATE/RECLAIM flows.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

scripts/checkpatch.pl recommends s/Co-Developed-by/Co-developed-by, the same
format issue exists in other patches and please double check.

>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> 
> 
>>> ---
>>>   drivers/firmware/arm_rmm/rmi.c | 586 +++++++++++++++++++++++++++++++++
>>>   include/linux/arm-rmi-cmds.h   |  41 +++
>>>   2 files changed, 627 insertions(+)
>>>
>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ arm_rmm/rmi.c
>>> index 5b0e342ce3d58..4f9898ece7547 100644
>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>> +++ b/drivers/firmware/arm_rmm/rmi.c

[...]

>>> +
>>> +static void rmi_op_continue(unsigned long sro_handle, unsigned long flags,
>>> +                struct arm_smccc_1_2_regs *out_regs)
>>> +{
>>> +    *out_regs = (struct arm_smccc_1_2_regs) {
>>> +        SMC_RMI_OP_CONTINUE, sro_handle, flags
>>> +    };
>>> +
>>> +    rmi_smccc_invoke(out_regs);
>>> +}
>>> +
>>
>> The pattern 'regs' is used in some of the 'struct arm_smccc_1_2_regs' arguments
>> or variables in this series, which is incosistent to the existing patterns which
>> is either 'args' or 'res' by searching the source files using 'git grep arm_smccc_1_2_regs'.
>> So I would suggest we have the fixed the pattern 'args' :-)
> 
> 
> I would prefer to keep it "regs" as, unlike the smccc_1_1 calls, we
> pass "arm_smccc_1_2_regs" for both arguments and results. In this case
> we are using a single structure, so, to avoid the confusion, I
> intentionally used regs
> 

It's fine to keep "regs" pattern, then the only place using "args" is
rmi_smccc_invoke(). I think the variable or argument names in rmi_smccc_invoke()
can be improved there to use "regs" pattern. With this, we have the unified
pattern "regs".

static inline void rmi_smccc_invoke(struct arm_smccc_1_2_regs *pregs)
{
         struct arm_smccc_1_2_regs regs = *pregs;
		:
}

Thanks,
Gavin

