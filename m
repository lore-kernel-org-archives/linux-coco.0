Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889BC37AA79
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742247; cv=none; b=tBl9/YUX00O/dlWxV3M6QuxqHk6TWteqEczu5cU7ita22hCdvNUQhS/8xPvmyG0vQNuJ3LPWSCXvFXjuTJEdH91d+Aq+YxRS2dpOK0/ojcCt/q9XPRrKN7ZeGd1/z6buwlsKGy2Ay8y7uqqUSDP9xsFOSDrkYi8NjBDjXDkti0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742247; c=relaxed/simple;
	bh=UQCTdm5xqezdONXtHOI89VgMxCqCt7KEC8aa3RgWTpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrCzXIXTxtOjiuyS9JSxhebPpofp6KKPbxfBTsIxQSEmMmRjicRdrteKxZTlIgEbg/wmXAiVnLWIXY2JMmCsjgJRstev+yR3kdBhWeAjvyPkAIsxubhsS9MhN+B78ewvNzM2oSkCxeHcMJZ5ElstORcvB34khVddh8amt9Mbwd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FKNuB5yO; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FKNuB5yO"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so681249a12.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787742240; x=1788347040; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TFfx1kRfOQ4Nc/ceLnW2laaeOesh6GMVW4RW9KML+2c=;
        b=FKNuB5yOeYAN9EEeU2PUQySDFW9SukXjgfmyD02Rs8Ij00wwFU9B98H1WtMMxx+opE
         Sa1hqidZj4WfCM91ViUUx+vc+l0zY6RRkSMYx9itwH42Lh3pnp31n4/a6W7iBjkjjwa3
         2qqeYFTs3zvMeP6Cww3CRSgjQKb1eE2RAPOWIk7GFjT94TEXsWMK+aPv6/Cq9V0se4+f
         PECAO/UVcZu5C/SVmJSaxiFxbj6FhT8Ei/Dnl5UUlUal3jZHaLVzjITv6mblg+mGUolK
         QU+F9S5TbUQX+Qr6E19OSobaVC3emXLbgazRmZqOLMmoMBNsfEJebqVEImnUQDhNsN++
         2r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742240; x=1788347040;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TFfx1kRfOQ4Nc/ceLnW2laaeOesh6GMVW4RW9KML+2c=;
        b=nn1v8BvmRFD4Zs6mG3UhhEmbLIdxjfyWHCnKzgidJnzuDHT6zO/6XiakmqdAsBlKf+
         U7HlBeOjVinXkYATzLdmgZghcvLeUWsPX2fCWHXgJ5t4mdeE6gq4yg2EOeAMQ2WflPaK
         /b/1Q9C8M7L9R20qSe3W9TUqSi7eqVra+wUVZBbRGPcmGs+OMEmfLADqYgLR5of2OlQF
         adKKhaVBoIufiGyHcZtMnxoCwNhzqtt2HUkFebOsGwidurwNP0agYNcYPVKen4GFz6nV
         hkZDmgEXIliMcB8oZbIA8xY20qWgh0WjgaQj/tCRjTqd/HgbSDZjyvBaMQX021qReXCH
         CBQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDjRWI6PDL3LE4nBSkGnPpC/F5nXoPO+dBN2NJtBvHFSyVVah54AX+uEGO6UMpsuVPFKbIyNM57Rt7@lists.linux.dev
X-Gm-Message-State: AFuF++lQv8PB/8Z/uHZfaiiP4+5QJ61AZmyDham5tV78sSkn3bbVykZq
	dBu3wbZfr2iDmU0OveTWopH1ZGi9rTepJAiGNPDsZUIoSiM96astzV4A/p0L3UBfR5g=
X-Gm-Gg: AR+sD11XdaEycjO1mwbVnYjUwrecI7zyGz7n8rQmsy3w4XLg2JjgGRgxRqflS7DWSaF
	H3ESIy10eLskqwqOfXe1K7Unsk4E4MT7odZ9PQr+OToCiHNx4jkT4zvVlt04acgoOXqtXyaAEAL
	Ym85Tqq5q+jjGw2NrdjDyZz24Yb0mkGQiXq/ZsgdkEZ9FByrSczSagjTeJUUxwgX4Ov26+VcbaM
	utuMsHjnemgqRxopgfFi+IUzGRlGRGdUzEhbqXCXGAQb180JKn1S4itevHNFV2AHCpYZeInsP+Y
	97dy6X0PY9PYRvlAwn+ylk5rhRPm56RbNtOAmzDSR2HXZohs7XQoMTzYaPakO/t+d7j+PH9RgeO
	nJ65mSuMdSsZxKGbW7ADK+m44w4gc/pGV2FgM2OdMtunYxB2Ye2gxrtVeJlMIFWIBP+xoDpq4aD
	l7DP70GNFDbe/EYIOqoZtQxcKOHfmEIH7AVWQmzvYADtuGX4MWl9CSIEeEAiDO0mk=
X-Received: by 2002:a05:6402:2111:b0:6a0:a46b:ad3c with SMTP id 4fb4d7f45d1cf-6a5df11bc67mr6692139a12.1.1787742240194;
        Wed, 26 Aug 2026 04:04:00 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.207.128])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d21f8sm4139483a12.11.2026.08.26.04.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:03:59 -0700 (PDT)
Message-ID: <d9d4264f-eb8f-4407-951b-245d144b3ec8@suse.com>
Date: Wed, 26 Aug 2026 14:03:58 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] KVM: VMX: Consolidate the exit handler for VMX and
 TDX
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
 <20260819094903.3060020-10-xiaoyao.li@intel.com>
 <5426d2f6-3e67-45d3-85d6-d0da67edb486@suse.com>
 <34161383-a382-411b-9278-098dab6587d8@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <34161383-a382-411b-9278-098dab6587d8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/26/26 13:43, Xiaoyao Li wrote:
> On 8/26/2026 6:03 PM, Nikolay Borisov wrote:
>>> @@ -960,7 +978,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
>>>       .vcpu_needs_initialization = 
>>> vt_op_tdx_only(vcpu_needs_initialization),
>>>       .vcpu_run = vt_op(vcpu_run),
>>> -    .handle_exit = vt_op(handle_exit),
>>> +    .handle_exit = vt_handle_exit,
>>
>> nit: Why isn't this vt_op() for the sake of consistency and introduce 
>> needless churn ?
> 
> I didn't see how to make vt_op() still work here while dedupping the 
> code. Do you have a better idea?


Indeed, I saw that vt_op is actually different for the TDX/!TDX case. I 
guess that function is always bound to have some quirk - i.e it has an 
#ifdef guard inside even though is_td_vcpu() is defined for the !TDX 
case but tdx_handle_exit() isn't. It's named VT, even though it's 
defined  in the "vmx section" ...

Oh well... My RB still stands.
