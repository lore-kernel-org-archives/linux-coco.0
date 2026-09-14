Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8F416865
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380005; cv=none; b=n+dWHNBKpn+OgYuKDlQX5MbENX3nqiXjBVrvyygp5jsVpVpPoHWWIyvERAXDT9xHrp+jxrCQiTe92aSWMzeQ/zXU6mPAAwYO3vS+imWmScHC3bdM4vwBeYPnA/mChIoIY25cK0xU+bzDeog/utAHXdSuF909eZfO1Bl4Zb8/YS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380005; c=relaxed/simple;
	bh=b4naa9WlCWXdDgBBJw3o2FWfn8Zxu+C00MCs2fJh1Ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSN/Kf1egXmWqOPwkkJnlUasjseYMDkoQILhS7ltAnN5y85To2AmiLwtfdp+Uuu0NaVPGeMev+FPTOfTsv+T/ldKku07zgz9Zij9LkrKFQvF1+OMlzpmZ+1BRlwPgR+KHiYB1L/PK6bO1jqimaDCzyx0kxvWL4D5kYr+l/ZPBT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bbghDKFx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bbghDKFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789380003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypy8vva409xUcIhg7UrFn+M558mkrKtyBpJ0I/QZb8I=;
	b=bbghDKFxXTO9icGnG8Bs2gPRHJMUXlzrpzk3zmMGgheHK4Ild4tp6BHRC6EWLCVLPIbGQx
	zgDErQWGy/HrLLmXX6I/e/5QI7RzH6GuuHhr0le977WPAj4gMzHtEEwHzzKrOz0LtCp7E8
	0JBWeWLPLGaJZs+rmvr0abBFUd+q+w4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-SaXvISEKMK-J27hRV3ow5g-1; Mon, 14 Sep 2026 05:59:59 -0400
X-MC-Unique: SaXvISEKMK-J27hRV3ow5g-1
X-Mimecast-MFC-AGG-ID: SaXvISEKMK-J27hRV3ow5g_1789379998
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so5509837a91.3
        for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 02:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379998; x=1789984798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypy8vva409xUcIhg7UrFn+M558mkrKtyBpJ0I/QZb8I=;
        b=qbg0qNv2zGJU9dlLAI1wk6UPO1KnLwCAbEkGUMF/Qy/5QwhnWuXGXuYdLg7eG0CGpg
         qpRFoCkreftqnSEN0WFy7hCCwTh7XmyrlGMS5vl6U7W9dAKlXMNnuaP2hVqOSP5cA0jo
         qlvBC/RsDw4Yer/kw4m42iVHYqiycYPFoXoTMqjughZ//x7Di3MnDgM26TnU8lXJxFmQ
         7x2xfNHx5BYv7hFLFrAHi7ixon0US8eocDeL3nJszSCpW/aC5M873Gcn6oOwGzY8hgR1
         e3vVrSmO62jtchf9V/BvWSVG52HfLC9tnpaI5//Hzfy/p+fU45ZrDv7RU4ojQijazv11
         R8AA==
X-Forwarded-Encrypted: i=1; AKwUvBz3JulHmDnpUaLJSjZUq6XBuX72UuzofnShEilJPNHRH+tk/O1S3YR87x1sxSEdRyoFpDg+YcM+GdeJ@lists.linux.dev
X-Gm-Message-State: AFuF++lAclZ8sJunRiE5eh9hD52V+0kFUt/Gd+uhB4XLI1QEub+gucsE
	OHEjUI8CfG1aMenreq4tyHC1wxAtNDdLe99F0Z76IAB0btMUR5xsay9BEFOakX6AIE1bPzisQDk
	/Mqy0R1MCAtsaMxMsn5Bl/WEwxATIBtV/vlX+f3or/VpS5sVtIx3RjZruawBFG14=
X-Gm-Gg: AYBFou2h94QvNi0waQRJwY4s+vV5NRVdGo2HWTP3CWhxaA8INsuoYdIUILdpGy3xyd2
	dXLV+sucA9V/U4KQmf0N9gd+BaKFZHnoos0QXTdwDDV4iY6tg8kcpgHcut9cRodXTfE44AOvKEQ
	+j4FimZapRMPQq7jN+Quc0HTp7fAfGX8hH15vQjzAaFvpIzbCF6KNmKjAXWPi+9S+w9NDvjFtYO
	e3lZ5gM8Iq8cdKo4Bvuz/Dvx4PDoT/wZjGpu/bnF1qZUj3mHyl8AK/MC5SRCIQjvu9RaH49CaaM
	aWzDHarjE1shHs8JgI0e4Pf/JstpyEPYMfZ2OLmqWAPgYaMOjejioP3MaoNOClo3cA3F4gFghyy
	dRpRsmCfYxbn0e35axBbnP3VFpY9mGNPltOHHkWXEqg==
X-Received: by 2002:a17:90b:4a47:b0:39d:eda4:43f2 with SMTP id 98e67ed59e1d1-39deda4487amr3464033a91.7.1789379998040;
        Mon, 14 Sep 2026 02:59:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:39d:eda4:43f2 with SMTP id 98e67ed59e1d1-39deda4487amr3463941a91.7.1789379997512;
        Mon, 14 Sep 2026 02:59:57 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm27206495eec.29.2026.09.14.02.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:59:56 -0700 (PDT)
Message-ID: <ca30e5e2-2bb5-40ec-8357-d5c3eab8a6f3@redhat.com>
Date: Mon, 14 Sep 2026 19:59:46 +1000
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
 <1fca136f-5802-449a-81f1-3a76c31a2f74@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <1fca136f-5802-449a-81f1-3a76c31a2f74@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q6AYolf2jXY1f1tglj8Fio9pH8erR--WRNzIcdd-ud4_1789379998
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/14/26 6:19 PM, Suzuki K Poulose wrote:
> On 14/09/2026 07:22, Suzuki K Poulose wrote:
>> On 14/09/2026 06:04, Gavin Shan wrote:
>>> On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
>>>> RMM v2.0 introduces the concept of "Stateful RMI Operations" (SRO). This
>>>> means that an SMC can return with an operation still in progress. The
>>>> host is expected to continue the operation until it reaches a conclusion
>>>> (either success or failure). During this process the RMM can request
>>>> additional memory ('donate') or hand memory back to the host
>>>> ('reclaim'). The host can request an in progress operation is cancelled,
>>>> but still continue the operation until it has completed (otherwise the
>>>> incomplete operation may cause future RMM operations to fail).
>>>>
>>>> The SRO is tracked using a struct rmi_sro_state object which keeps track
>>>> of any memory which has been allocated but not yet consumed by the RMM
>>>> or reclaimed from the RMM. This allows the memory to be reused in a
>>>> future request within the same operation. It will also permit an
>>>> operation to be done in a context where memory allocation may be
>>>> difficult (e.g. atomic context) with the option to abort the operation
>>>> and retry the memory allocation outside of the atomic context. The
>>>> memory stored in the struct rmi_sro_state object can then be reused on
>>>> the subsequent attempt.
>>>>
>>>> Wrappers for SRO RMI commands are also provided here because they depend
>>>> on the rmi_sro_execute() implementation added by this patch.
>>>> Delegate/undelegate handles are also added here because they now use the
>>>> SRO/stateful command infrastructure and are also used for the memory
>>>> DONATE/RECLAIM flows.
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>>
>>
>>>> ---
>>>>   drivers/firmware/arm_rmm/rmi.c | 586 +++++++++++++++++++++++++++++++++
>>>>   include/linux/arm-rmi-cmds.h   |  41 +++
>>>>   2 files changed, 627 insertions(+)
>>>>
>>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ arm_rmm/rmi.c
>>>> index 5b0e342ce3d58..4f9898ece7547 100644
>>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>
>>>
>>> I would drop rmi_granule_range_{delegate, undelegate}() by combining their logics to
>>> their only callers rmi_{delegate, undelegate}_range(). More details are provided for
>>> rmi_{delegate, undelegate}_range() in the below.
>>
>> Ack
> 
> I have moved them closer, but kept the logic separate, since this is not
> a simple RMI call.
> 

Yeah, it's fine by moving rmi_granule_range_{delegate, undelegate}() to their only
callers. However, the unnecessary if statements can be avoided in their only callers
rmi_{delegate, undelegate)_range(). Besides, rmi_delegate_range() would come before
rmi_undelegate_range().

	while (...) {
		ret = rmi_granule_range_undelegate(phys, top, &next);
		if (ret != RMI_SUCCESS)
			break;

		/* Buggy RMM ? Let the caller leak the pages */
		if (next <= phys) {
			ret = -ENXIO;
			break;
		}

		phys = next;
	}

The variable 'out_top' in rmi_{delegate, undelegate)_range() may be renamed to 'next',
indicating it's the next (starting) granule for the RMI calls.

Thanks,
Gavin

