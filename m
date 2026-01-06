Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AEB30AADB
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767691060; cv=none; b=O9B0WaOF5ZHuBbgAfZvRVnTs8tIcvMi/q5UoCJCva9HrgMkcJkbA6EAL9awzm5JtrthNYANP78qzSSpmUz9LxiyeAmWJRdyxwKIKNPlnIRcMMjwoR1OzQIrvt/QautssUlt0aLFFXDsRD1Zb9XL2GGAGlpVV2LXco0l4iNKy9mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767691060; c=relaxed/simple;
	bh=tw2hLstPcGoxyMqlV5vBTgZTYVnWRaiXTe3i7r6TMhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tRbQA3tCRyMcMwSLdzHJYIoypj1NBeTGF54+P+p05Y/q1JsIDDZq2VW3faeYlgM01oUCnAAdSudswMLYLHy+X0Mdf0ZAAAKUEtf3+Z+XvChIpa58Yu/fs5PQGBeDNdOWeTGd33ixiiKnULj9PoMAXTraRlJyOVcWXGjdmLXOX0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fPZpYMzI; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fPZpYMzI"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64fabaf9133so1294004a12.3
        for <linux-coco@lists.linux.dev>; Tue, 06 Jan 2026 01:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767691056; x=1768295856; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s7izs/QBqA/9qzcQySCn57ldKOvgzvpUdSneZzovDgc=;
        b=fPZpYMzIn/7zHm/V2nlqenQa9i/2Ez5hS5H+hKRl7wN6NqL9zUGOMZZxzzPihGWQ8R
         bm5yGWBMKGBDK2rZvH1IYW8KNKl05s4c+Dc/TNaVqMkHMTEjxLJ9lOR6ABKENXedRNz2
         QN5Tn1O4q8oFBViaEbSA5FsEBiqtfFgeAm0bldQbdJrVOfTYIz4buVgbNCquhwcp1YGT
         JVzm2BGx6EcIH8q4Sx1/AgsWYnrON8/tGJkGyVAVVkDdYBUOSca4YqLzYbZbe2uF3EWK
         RrZBdnltt3YXcOoMwcrOfDbWIFmILLy1MTeqe3I0Vf/yCLFnPnbb+VYrvaKbHe9WhrcL
         NgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691056; x=1768295856;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7izs/QBqA/9qzcQySCn57ldKOvgzvpUdSneZzovDgc=;
        b=UNqo4ls/tR9qPpZ6ZiDGrVbVX/ZWDdCQVsgfPJKFgZkQ45dk8ep2Bv14cTtAjOnahn
         33zA0S7VnEk83clfOErQiI30zwW1Q+9Vonf9CLAps5skVjVRFUHnXQD3TQOY/v7CJ7R2
         vAu4H/kr6cSuy1R72NmJQYAF3GX2ozW/6wkhtdwIPWMRXu8ouKkYqhbCVGs1VKi9d6gY
         LY6an3+GAWVWyj1/MAmwW8IlMk7xoDADHlstJnnXb7CSr6eg1aDe8jPMZ+mXHv0ZyZjD
         zqB9T6MVoL0iN9CBu51IGsSKRfYL1duSweHI2RhycU7VtbqUps/DWG86DO+0SWpjn4db
         FOwA==
X-Forwarded-Encrypted: i=1; AJvYcCWUWFPDad8OaWEdDrTsC972oIzHx+Ie5b7HV9dFBrGo5K/oakQkbZ5C6D6Ucs+aboFDDpDY4je0mLS1@lists.linux.dev
X-Gm-Message-State: AOJu0YyLhQqv2zbKbInjzP7c1AozxiGOve98VOnqEYqlnvpn8ze1bEPC
	Sb7kqoRwPfFGxo3SJL1zxS+vzWQqwoPAPlJoC/9ISoQBKHddcyQs7BPF+TmQGkP48EQDfI9EOsC
	07p3O
X-Gm-Gg: AY/fxX5D0Vm0lxOh4ET9R4B9qcxnhyZtFP7oMlYb8dRjwRUNfco2RxCbVW+I8bizd7O
	2dfbqmFdrrGhLUQbXvzMVr3tklRKQlGakTeM55v66MdA4ra9T4Mas7as2moKd5/5uICVXbGk9HS
	lyHOu4ywPSZ2//TxCC39qEIRSSqNVGYr+fXBPePIXrl/R/zgOL2Wxm0/U/1LsJVoJEctls5zfwW
	pQJLtM+KNRwX16LfYWUpph3AAoIC6gzhJy6okV9jvjE+/rVVvRmwvfGg6EkvG3NWAV7rjmQBrzk
	cnqya4m6O7dvZv46E7WEI7gWWHnULA+mI2L5ajT85Mv86vPf5Zs4QNmvZaaRtOXdfE+0fROFx5M
	e99At9kL+dTE5ue7jhjObyAg5PhMZchGuD4Q9tr7+YuLIYj501/xhoKscQYxHrqqbM9JT9Sc+q9
	gIMU//M0SPqKq5O0vf7oHBUcROi4ueDPDch/UW
X-Google-Smtp-Source: AGHT+IF9eBUjz6yWDKn2sktCdtPRUbAo/NlH5vaF3AkhgFLe4K1iKSFYhijP67fnU1wCRBNIzSg91w==
X-Received: by 2002:a05:6402:1a25:b0:640:f2cd:831 with SMTP id 4fb4d7f45d1cf-65079221959mr1539076a12.10.1767691056291;
        Tue, 06 Jan 2026 01:17:36 -0800 (PST)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [85.187.217.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4479sm1623607a12.1.2026.01.06.01.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 01:17:35 -0800 (PST)
Message-ID: <619dc952-fa51-4134-ad48-f26d127e80bf@suse.com>
Date: Tue, 6 Jan 2026 11:17:33 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Expose TDX Module version
To: Chao Gao <chao.gao@intel.com>, Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org, vishal.l.verma@intel.com,
 kai.huang@intel.com, dan.j.williams@intel.com, yilun.xu@linux.intel.com,
 vannapurve@google.com, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20260105074350.98564-1-chao.gao@intel.com>
 <dfb66mcbxqw2a6qjyg74jqp7aucmnkztl224rj3u6znrcr7ukw@yy65kqagdsoh>
 <aVywHbHlcRw2tM/X@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <aVywHbHlcRw2tM/X@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6.01.26 г. 8:47 ч., Chao Gao wrote:
> On Mon, Jan 05, 2026 at 10:38:19AM +0000, Kiryl Shutsemau wrote:
>> On Sun, Jan 04, 2026 at 11:43:43PM -0800, Chao Gao wrote:
>>> Hi reviewers,
>>>
>>> This series is quite straightforward and I believe it's well-polished.
>>> Please consider providing your ack tags. However, since it depends on
>>> two other series (listed below), please review those dependencies first if
>>> you haven't already.
>>>
>>> Changes in v2:
>>>   - Print TDX Module version in demsg (Vishal)
>>>   - Remove all descriptions about autogeneration (Rick)
>>>   - Fix typos (Kai)
>>>   - Stick with TDH.SYS.RD (Dave/Yilun)
>>>   - Rebase onto Sean's VMXON v2 series
>>>
>>> === Problem & Solution ===
>>>
>>> Currently, there is no user interface to get the TDX Module version.
>>> However, in bug reporting or analysis scenarios, the first question
>>> normally asked is which TDX Module version is on your system, to determine
>>> if this is a known issue or a new regression.
>>>
>>> To address this issue, this series exposes the TDX Module version as
>>> sysfs attributes of the tdx_host device [*] and also prints it in dmesg
>>> to keep a record.
>>
>> The version information is also useful for the guest. Maybe we should
>> provide consistent interface for both sides?
> 
> Note that only the Major and Minor versions (like 1.5 or 2.0) are available to
> the guest; the TDX Module doesn't allow guests to read the update version.
> Given this limitation, exposing version information to guests isn't
> particularly useful.
> 
> And in my opinion, exposing version information to guests is also unnecessary
> since the module version can already be read from the host with this series.
> In debugging scenarios, I'm not sure why the TDX module would be so special
> that guests should know its version but not other host information, such as
> host kernel version, microcode version, etc. None of these are exposed to guest
> kernel (not to mention guest userspace).
> 

Just my 2 cents  on the topic:

One thing which comes to mind is that the information to be provided to 
the guest should ideally come from the hypervisor, for debugging 
purposes at least, i.e via some sort of hypercall. The security model of 
TDX is to ascertain information about the host via the attestation 
mechanism, no? So I'd argue that the version information provided to the 
guest is of no importance
