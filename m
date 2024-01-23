Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145CE81AAA
	for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 18:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706034283; cv=none; b=TEY+IM/jrTEZgbw/yN68ylLww8gN3nSJgxkcwYd8wNsGDQBUw9VC2zDOK1QlU/TA/LTKycRnc2FoJ4MMt5XLP9UtMcc6bVddg3FwORY4xV7k8l3iuAO7nYe7I8jtqMGV5fhikyLERGTepE63vd8wq1qYG4VgD+zc+5McgZMvrro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706034283; c=relaxed/simple;
	bh=JyTEfXliXz1JU1rgKyqj5o8l2YikviqE8axxWKp5KAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0+lBYcRPxmNZ2gqCcRWBG9LyMuJfTKL+9F63h3YPTlKpnpuhyRsKPTuUXCN/MenIJ+1nm8BjK8VR+x1gs97Tor4x3A4vQpXlFIEXfEB+2xeOetYU0j+uZbXw4cc87u/xmHzjWB9x5VKOZjEYz51BJmTgmlVls8kmsruxTUd3to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UMRVsv7r; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UMRVsv7r"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cf1c8cc6bdso2382001fa.3
        for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706034279; x=1706639079; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LO4ktamApWz7Ik6VhyAZ4LuHOHW6b8Dk0a/AWCbH9y0=;
        b=UMRVsv7rEsqCxbaZY6fZ+4T3h2o+qrMU8+Bp9oaHkmskvcAPEbYXiqhggTtLTjumbW
         LI1wrP4f6JfQvQEW9wyq0a32stIOQHscyZSKXRViNaXnpqom/iax2w7OGp1uVwfmWvkI
         4GRUNBCKpT5mFwzzdmaoDeF018yXPSnJDyTjBTemMMZ2+H0uJYRTvfYXo4boN4su6aNf
         bsnk+T6Ci1h5ij6ZGy71K9II71wvpSrJ9qV2j5Ke0kowHqXJJk1XZbNx+6LF5dT14OTZ
         4bRlOP9EjGnKAX6Y2wH3KV16JES5PyjYZz4zWM5dHqqmSwLRGbOAU6TDOmtn2FaIJpC1
         DqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706034279; x=1706639079;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LO4ktamApWz7Ik6VhyAZ4LuHOHW6b8Dk0a/AWCbH9y0=;
        b=LFLvPwWVXlYCd5pSJ1VYSqFvs9G7wdc9sKtO7mrucvYcknsp4xxgdhACDLCcy7VTHM
         8bI1Mm3UBBGxO4bZcJSPEaCXsisg4ASyZRZaIB1k7OcsgStzUYD/mIXNs3dGIRqa5k6J
         a6MvzM84G6QXf40vjTXCUVZsPmbT5VaXAMdI0EsQoLa5DLIxCdVh5SSLAVXmpLHh6CNl
         L/Dtk7I3b58D9nmdoQXTDPHRZgIAJdS62FJzlb3E+K9pnFesPyIQeJ9NZDJaNFc0DZBX
         ZNAkttiF8mD79ssgKq/ui2vkWd15my2I/v13XTIS1APT7CB6aY4QHTLFbhLAzd2Fx6R/
         Qglw==
X-Gm-Message-State: AOJu0YysLQAjQwZ//qzjYA977zNZvhxDsUT/v8NcPHPLWFWAnE5ugckz
	uXjPCxeVonzGyYRxdomIAsZ4ZVuavOG7dKzck9iGid34HKUrFaoF/tWsk4W3Xt5YOhnU+xJGifF
	2
X-Google-Smtp-Source: AGHT+IFB0swReGWh/oPnB9sDxEeGoBUQgI+tl3+qRrIdvhv47u2AbpvaqSwmRZv/1luAr7W0IGJiHg==
X-Received: by 2002:a2e:b803:0:b0:2cd:39ec:c325 with SMTP id u3-20020a2eb803000000b002cd39ecc325mr104451ljo.73.1706034279051;
        Tue, 23 Jan 2024 10:24:39 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7589:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:7589:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id i1-20020a2e2201000000b002cf1a1e7234sm87735lji.123.2024.01.23.10.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 10:24:38 -0800 (PST)
Message-ID: <ea5dc4b4-6aed-4672-bbe6-e2f477528f36@suse.com>
Date: Tue, 23 Jan 2024 20:24:32 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] virt: tdx-guest: Remove quote generation via ioctl
Content-Language: en-US
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-coco@lists.linux.dev
Cc: dave.hansen@linux.intel.com, x86@kernel.org,
 kirill.shutemov@linux.intel.com
References: <20240123160704.1270147-1-nik.borisov@suse.com>
 <d3230869-e07f-41c8-b613-ccfc2eaa83a2@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <d3230869-e07f-41c8-b613-ccfc2eaa83a2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23.01.24 г. 19:51 ч., Kuppuswamy Sathyanarayanan wrote:
> 
> On 1/23/24 8:07 AM, Nikolay Borisov wrote:
>> When this driver got merged initially there was no widely agreed upon
>> interface how the quote generation interface will work so having an
>> ioctl made sense. However, there's now a vendor-neutral interface via
>> configfs. Just remove the old ioctl interface and leave only the the
>> configfs one.
>>
>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>> ---
> 
> This ABI allows the user to get the raw report which is further used
> for Quote generation via vsock. AFAIK, some vendors (TDX users) and
> DCAP user libraries are still using this ABI to support attestation over
> vsock model.
> 
> Don't you think we should wait till there are no users before considering
> removing it?

Given that hw with TDX was just released I'd be surprised if there are 
any users? But then again, this is an RFC so let's get opinions :)


> 
>>
>> I think it's better to remove the legacy interface now, before there's been a
>> wide adoption of it, cementing it as an ABI of sorts.
>>
>>   drivers/virt/coco/tdx-guest/tdx-guest.c | 75 +------------------------
>>   1 file changed, 2 insertions(+), 73 deletions(-)
>>
>> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
>> index 1253bf76b570..1642a0f70333 100644
>> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
>> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
>> @@ -66,41 +66,6 @@ static DEFINE_MUTEX(quote_lock);
>>    */
>>   static u32 getquote_timeout = 30;
>>
>> -static long tdx_get_report0(struct tdx_report_req __user *req)
>> -{
>> -	u8 *reportdata, *tdreport;
>> -	long ret;
>> -
>> -	reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
>> -	if (!reportdata)
>> -		return -ENOMEM;
>> -
>> -	tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
>> -	if (!tdreport) {
>> -		ret = -ENOMEM;
>> -		goto out;
>> -	}
>> -
>> -	if (copy_from_user(reportdata, req->reportdata, TDX_REPORTDATA_LEN)) {
>> -		ret = -EFAULT;
>> -		goto out;
>> -	}
>> -
>> -	/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
>> -	ret = tdx_mcall_get_report0(reportdata, tdreport);
>> -	if (ret)
>> -		goto out;
>> -
>> -	if (copy_to_user(req->tdreport, tdreport, TDX_REPORT_LEN))
>> -		ret = -EFAULT;
>> -
>> -out:
>> -	kfree(reportdata);
>> -	kfree(tdreport);
>> -
>> -	return ret;
>> -}
>> -
>>   static void free_quote_buf(void *buf)
>>   {
>>   	size_t len = PAGE_ALIGN(GET_QUOTE_BUF_SIZE);
>> @@ -249,29 +214,6 @@ static int tdx_report_new(struct tsm_report *report, void *data)
>>   	return ret;
>>   }
>>
>> -static long tdx_guest_ioctl(struct file *file, unsigned int cmd,
>> -			    unsigned long arg)
>> -{
>> -	switch (cmd) {
>> -	case TDX_CMD_GET_REPORT0:
>> -		return tdx_get_report0((struct tdx_report_req __user *)arg);
>> -	default:
>> -		return -ENOTTY;
>> -	}
>> -}
>> -
>> -static const struct file_operations tdx_guest_fops = {
>> -	.owner = THIS_MODULE,
>> -	.unlocked_ioctl = tdx_guest_ioctl,
>> -	.llseek = no_llseek,
>> -};
>> -
>> -static struct miscdevice tdx_misc_dev = {
>> -	.name = KBUILD_MODNAME,
>> -	.minor = MISC_DYNAMIC_MINOR,
>> -	.fops = &tdx_guest_fops,
>> -};
>> -
>>   static const struct x86_cpu_id tdx_guest_ids[] = {
>>   	X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
>>   	{}
>> @@ -290,27 +232,15 @@ static int __init tdx_guest_init(void)
>>   	if (!x86_match_cpu(tdx_guest_ids))
>>   		return -ENODEV;
>>
>> -	ret = misc_register(&tdx_misc_dev);
>> -	if (ret)
>> -		return ret;
>> -
>>   	quote_data = alloc_quote_buf();
>>   	if (!quote_data) {
>>   		pr_err("Failed to allocate Quote buffer\n");
>> -		ret = -ENOMEM;
>> -		goto free_misc;
>> +		return -ENOMEM;
>>   	}
>>
>>   	ret = tsm_register(&tdx_tsm_ops, NULL, NULL);
>>   	if (ret)
>> -		goto free_quote;
>> -
>> -	return 0;
>> -
>> -free_quote:
>> -	free_quote_buf(quote_data);
>> -free_misc:
>> -	misc_deregister(&tdx_misc_dev);
>> +		free_quote_buf(quote_data);
>>
>>   	return ret;
>>   }
>> @@ -320,7 +250,6 @@ static void __exit tdx_guest_exit(void)
>>   {
>>   	tsm_unregister(&tdx_tsm_ops);
>>   	free_quote_buf(quote_data);
>> -	misc_deregister(&tdx_misc_dev);
>>   }
>>   module_exit(tdx_guest_exit);
>>
>> --
>> 2.34.1
>>
>>
