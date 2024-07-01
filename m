Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC116F82F
	for <linux-coco@lists.linux.dev>; Mon,  1 Jul 2024 18:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859125; cv=none; b=bLSJM0ZjJ0WUR9MHj3Z+jm49l5gTXrPFpU+0lbw84RriRazrpPehdzfYolm96JSNRKXZoXy2wp17lBYcRdT5Y8tKPM4Kh0BcjNVZTBnrhfgaxFnYMQ0eLChGIgEB1sgf2UAOs1V5gK2Gztwsh04quNjJCUsTQMWswlBuhQu1XOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859125; c=relaxed/simple;
	bh=TIx8Vrcv5uaERxLQCcU10wGrDGplCnFi3dtk4xmsgjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXW5vjgMqiXdmv6x/B5EekyPgBdbBrCzCBIoNPtlVu6kdDD0wp3gxvH87735bVmlG4x9JmeseNkm6DvB6nrtEa/1GgvPJ6zQmtdHFNTBz5Fc9BFsD4AZxplAfjwtR7y0zjATlbC4IUmGo+0z9p7njB4zAXRX8xxT7/jZlo6U6c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RxIytbGc; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RxIytbGc"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57cb9a370ddso935613a12.1
        for <linux-coco@lists.linux.dev>; Mon, 01 Jul 2024 11:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719859122; x=1720463922; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VciN14dSlEU1KWYpVlUY3kk033YMuIPu3d9SY2YBTa0=;
        b=RxIytbGcnZMcFxvhJ76dkLaMQAtzb4vq5PC+iYUuStp91Oa8YK04w/2BAKc1Jj3eUD
         cV0zgFW0TcKZpKN3H65hooDjn+XR0THo4flxF1JN12RqmgSm2FCIObzcLau7zoW2TCJH
         kgPr81bPs8oy2m67BRk8b7TYHrScGVvu8G6fKRwWZOpUk90/prArNF0/NKmLZAep49Pi
         uSViBTiidzz+bFlMigEtbUd3ntQ0Kdd32CcTA1HO1JzeZ2mankPNKoITOb+rzibbiC6n
         6AfpRnxLH/0YRyVPsn/axGt52LntYC3uQqxXBCHGlSl/HGqqvgSRezr53KxXTai/Px6Y
         b6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859122; x=1720463922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VciN14dSlEU1KWYpVlUY3kk033YMuIPu3d9SY2YBTa0=;
        b=e0g1+ExxK5DUQIwEK6zS0tESmztpz7X6/ROZfJWn7UyA4GZoPOSG3r7kMgML8yIDxL
         yrreUjxtC6I38UZ3kkFuQDJ4JLwQa6hEUSJPUDHkKXpric4VXtO5YJNM23V15DxXCcQP
         DLVIC2NiDCyoRsA/2YCcis7NTBvmWqcGAP/CdTvN5/qsavU+BNuthRsIhtmDOUdzDYMz
         yvn51RlPvsgP1KPankzYQz3VZMOkJXJdXgZz5gyzHPcaWlOvRt1AXLuvGUCN1Oh0BPho
         74VyRoFoIg/eGhGaAHquMF1Ro9zxZ7Fr6OqX8oSo7vw3Wc46eaaImkWwFWQZbz7ef7yg
         woaA==
X-Forwarded-Encrypted: i=1; AJvYcCX1vi3XAZ0X0iYUim6ql3p4yzLOnmFY7jnJS2xSQmMCIleIGPSMvsbe6mMTEvo0ntcWN2Nn0ivGBEPFgRJLL4Lom2a9cSzw5SK+WQ==
X-Gm-Message-State: AOJu0YykPO/AQrWuzVjPHz2NiLuHCb9R7kHviizISnmV9NoTOKBaLT4b
	TXdUCx1IzZex3GgQKxTaQdDXYe1mt1unhQF1rcqus7A1BiAW4t5iiOiOv2tgyh0=
X-Google-Smtp-Source: AGHT+IGCx7lspkjErQyPSXtnNw1M/21IBgZVw4CIsJDJ6X6PfBfg5PSaHYL+u9R++oBY6XYh0LlDGQ==
X-Received: by 2002:a05:6402:5203:b0:57c:7486:3f7d with SMTP id 4fb4d7f45d1cf-5879f59c5eamr5207180a12.19.1719859121642;
        Mon, 01 Jul 2024 11:38:41 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2? (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de. [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-586138164d8sm4693510a12.49.2024.07.01.11.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 11:38:41 -0700 (PDT)
Message-ID: <8d970528-0e57-457f-ae00-862b4d320a2a@suse.com>
Date: Mon, 1 Jul 2024 20:38:40 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: fix lookup_address() to handle physical memory
 holes in direct mapping
To: "Kalra, Ashish" <ashish.kalra@amd.com>, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de
Cc: x86@kernel.org, hpa@zytor.com, kirill.shutemov@linux.intel.com,
 rick.p.edgecombe@intel.com, mhklinux@outlook.com, peterx@redhat.com,
 linux-kernel@vger.kernel.org, thomas.lendacky@amd.com,
 linux-coco@lists.linux.dev, jroedel@suse.de
References: <20240628205229.193800-1-Ashish.Kalra@amd.com>
 <2982a4f2-ea8f-4fa4-81ea-d73c00fc2ad0@suse.com>
 <5cf60d52-1682-4244-b892-688b22eaf4a1@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <5cf60d52-1682-4244-b892-688b22eaf4a1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01.07.24 19:57, Kalra, Ashish wrote:
> 
> On 6/29/2024 5:20 AM, Jürgen Groß wrote:
>> On 28.06.24 22:52, Ashish Kalra wrote:
>>> From: Ashish Kalra <ashish.kalra@amd.com>
>>>
>>> lookup_address_in_pgd_attr() at pte level it is simply returning
>>> pte_offset_kernel() and there does not seem to be a check for
>>> returning NULL if pte_none().
>>>
>>> Fix lookup_address_in_pgd_attr() to add check for pte_none()
>>> after pte_offset_kernel() and return NULL if it is true.
>>
>> Please have a look at the comment above lookup_address(). You should not
>> break the documented behavior without verifying that no caller is relying
>> on the current behavior. If this is fine, please update the comment.
>>
>>
> I don't get that, in this case the PTE does not exist, so as per the comments here lookup_address() should have returned NULL.

There is a PTE, but it is all 0.

There is no _valid_ PTE. No PTE would mean that the related PMD entry (or any
other higher level entry) is invalid.

Remember that the W^X checking needs to be performed _before_ a new PTE is
written.


Juergen
