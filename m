Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D713EA8A
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 19:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706731018; cv=none; b=WgPCQq3WK9AO8NzffN8YQCImtlGl+U/WLP8Ywv8KekFPjWWhVmCGPLoLW1z3tYendbgXxK5mmrgFupZoHvFDSiFk72CWB8b/9y70otatZOQhnklJr5rNqb57GwAJihq7kBJKZQV4Kz8HLFCnuix/0l8rotwzUkypJgWpRkdl8oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706731018; c=relaxed/simple;
	bh=Zue5foh2DQtfmg6Ee827zfYwtsU1EcvbPxOnsmGW3tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVIBcJNxWpAtEEleORjo4v8cE7OLZ1cJic5we0Y/l108vEU64MYSsVx+ZsX0yTt6YAaeXZGxgPRk+6uvcmvtyC5pItbOszvWuaAA9pX1WI7OYn1FPXePFE6Fch6GF3ZZbc3sQUTqMs1D+fQSO32qj5d43TIOzuDNac5kbnOA8no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=amG6mq6A; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="amG6mq6A"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33b01484cd7so109864f8f.0
        for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 11:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706731014; x=1707335814; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ZC3ezdgi5Qqk2/bLdVRe/apajFDnUTC/ZQsGmXQYDY=;
        b=amG6mq6A1MeNlSqJk6ZnKCg4Xk/468aXb+mPvmxwEmpHA2FRJmSMmxlywW6BXqxdco
         3Ttl75471IFKpHMSQGv1uH5oKFSm2wpulyQKBXPEWnoZ7Av6BCcLj/5SFu0nrDwUPMTr
         F1LpqfQBkOXCpVtWZRg+PqbAPEztL4f6Cbf+IV8eIW6FB2orbxZr2fMReizvpnRYq4Nz
         bHyvg1lEkRiWTYwgV/4Fa+ovOxk4LUEkDvH71XQJbuA7RHq+ciEJxURsOWd0iZ0KiZqB
         0gkTZylItzfbz03hgx+Wo7YHU0HtUifHRHRLWZqvZSGw3YiaqAi9JlU6k022XIBKX667
         RaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706731014; x=1707335814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZC3ezdgi5Qqk2/bLdVRe/apajFDnUTC/ZQsGmXQYDY=;
        b=Zk6qC8BaIP9MhAWXB3qrpUSaH7GJrUzxFRLjYMl1JMgSWNi+QJ/sfOt0RQpGmhqS1G
         ibUuBxWuF77GsRqSzw11f3XEPOXFAOthdAR/uBeKY8666uytrHPd5+Yx39SQgM+FwW57
         GDy8Z8qaaVZzsUe1xaBX6IUTH3mgIKPLN68Q7DO4Pp+rpVP224ETr67cGGBiLT8UvHyZ
         BRN7e3PCfl3p9em9aPScvu7QFGVN/kUU5d2nRsTHdmrbJ7p23C5KkVD+XwbRVJiT3ZWN
         5v1vNlK761xK7q8XnM7KNKrdIVE1Qp+oaPPQJdnbZK+4iZEYDBytBrYsgzyDXNn3JHQV
         UPSQ==
X-Gm-Message-State: AOJu0YxLL9CEG3GfvncFru8drZYhWGlDanAF3gwWSd6QWFAy89cHAuzU
	ptIflQ3No4P/unB+xIaVe2wlXqSfowGxIlM2qsslrwHR6dgl2+ZTYCfL0BCcSUg=
X-Google-Smtp-Source: AGHT+IHUHAffv8RbVVUpVfIRj9LUt9a1eZJtqQEZikB3NGD7zM0Gh3sHfP6BavLxFN5SeghP5heFlw==
X-Received: by 2002:adf:f001:0:b0:33a:eae2:11a4 with SMTP id j1-20020adff001000000b0033aeae211a4mr1833081wro.26.1706731014270;
        Wed, 31 Jan 2024 11:56:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUppdAFpB79D2jlawNUjC0kOmmAEzli/jSznrwmdIFFYr5jOn2bFLcOClMSaLQxDnXe6vNXwE7WESBv9P5VH0ORSL+PqYt/cMQQabnGIShoxUejLae8zg9yV2elQjf6M7fsSN7nciVMUEYhVGf9jRJwSMaXeg/zKcj9F/Ic/9JBUoi3Dws2T+gbC1jKECZDosbaldlMcKOsMGJ47OFVtKrwi3m7v0bCKVxcsqUfwzqRmTi1WdvDZ/x0wH41Y4ZJWMXr3t+G3jJ0RjsA0ALVSeP3DNXvzbK3VWs8ALv1BmFVEwHNlD3xfVKccBpO
Received: from ?IPV6:2a10:bac0:b000:7588:aea0:a2ac:ddc1:371f? ([2a10:bac0:b000:7588:aea0:a2ac:ddc1:371f])
        by smtp.gmail.com with ESMTPSA id q13-20020a05600000cd00b0033b0eb97a61sm689913wrx.57.2024.01.31.11.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 11:56:54 -0800 (PST)
Message-ID: <2ef10623-ff06-429c-ae4d-2cea9c83f140@suse.com>
Date: Wed, 31 Jan 2024 21:56:52 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-coco@lists.linux.dev
Cc: x86@kernel.org, dave.hansen@linux.intel.com, dionnaglaze@google.com,
 dan.middleton@linux.intel.com, jpiotrowski@linux.microsoft.com
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
 <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 31.01.24 г. 21:50 ч., Dan Williams wrote:
> Kuppuswamy Sathyanarayanan wrote:
>> + Dan Middleton
>>
>> Hi Boris,
>>
>> On 1/24/24 1:38 AM, Nikolay Borisov wrote:
>>> IOCTL based interface was the natural choice for interacting with the
>>> quote generation machine at a time when there wasn't anything better.
>>> Fortunately, now we have a vendor-agnostic, configfs-based one which
>>> obviates the need to have the IOCTL-based interface.
>>>
>>> Gate the relevant code behind a Kconfig option, clearly marking it as
>>> deprecated as well as introduce a runtime warning.
>>>
>>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>>> ---
>>
>> In the following thread, Dan Middleton raised a point about this interface
>> being used for local attestation use cases.
>>
>> https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a
>>
>> Currently, the configfs-based ABI does not support the local attestation use cases.
> 
> What are local attestation use cases, and what happens if Linux does not
> provide a local attestation interface and standardizes on remotely
> attestable as the standard?

The local attestation use case must be expanded on by your colleague Dan 
Middleton as he was the one mentioning it:

https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a

Other than this Redhat/Ubuntu said they shipped this ioctl and Google as 
one of the major CSP's said they are using the config-tsm interface. 
Jeremi from Azure said that this particular ioctl interface is not 
accessible to guests - 
https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m46070ba40150234d30dbc7cefc89a2ccb53b59e4 



So it might as well be a dead-end.
