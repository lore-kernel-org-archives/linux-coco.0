Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6CE1BDA90
	for <linux-coco@lists.linux.dev>; Tue,  1 Oct 2024 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727769293; cv=none; b=HA0WkHhh04Yn+Z6njwlp0aJo6iA7KtmpDKkRY4FetIj40UG7sLp0WPvRxz1pG+SEyfmgxdVmN+LLQpuKfFqNsYnFyetH9Wc3FAnnOPdt2V1DqBRxSWIKwle4e0GnxM9+uZ0iMaVis2WCTPbfhAfw4KHanvC65RJZ3zzidaXzEUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727769293; c=relaxed/simple;
	bh=2ctkZz3y7GmH9N03cywU3PB46JOxc2RReJmW3pRiA9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZkgiE4gggmORB9fvIm7aB0DyCk6r5mPbXAnVYlRaTLFelT4fC00puLaQh9fYdE4YdNs2xT3IdoJ8n9/uPC0KCiXDFGBsio9FlDM9hdWmsgEuj0R0oUdxJ8eRBCb2dLcCQ0Fj6sYXtst8LfmyE7hxrwEqp6O0oPSNL927kKUyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iBMoY5jb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iBMoY5jb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727769291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZO6QkXYyC82VYzud9nrAxDBpX4Cm8WFePoqgZa4dOOc=;
	b=iBMoY5jbHD3fi7030SPnwtKi2RfWyyl0ddPfkqDJSDgXIhlWhD1IBNg8kas8qBpQvE0n7E
	QmFF4UYaprllddqwPqN7iW3PfRoJVCYGcIWfMFboRUrqf3A7FMRbnT+EX3F9vh7ZrWv0xL
	gGdp0YgoPzMj0cWGqwVUuO94I8RIOA4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-9qzNr8XkOMqrD7SU_MXIFg-1; Tue, 01 Oct 2024 03:54:49 -0400
X-MC-Unique: 9qzNr8XkOMqrD7SU_MXIFg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb89fbb8cso29601775e9.0
        for <linux-coco@lists.linux.dev>; Tue, 01 Oct 2024 00:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727769289; x=1728374089;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZO6QkXYyC82VYzud9nrAxDBpX4Cm8WFePoqgZa4dOOc=;
        b=ZZPE2yraGsedPM6sX9LQDnKl6OpN3kQ4uBFexQwnkeLvJcaz41C2xjsg2FmAY7F8sm
         66CPyeVIYhHfN2PSInIonBn+ZCiodgglm7soO+lNki4nfb7FbgZqd+ih1zGgGdl51plH
         k3c6FJr+iGNVb5vSGyz0s2YZh5xcKwdp/bxUC3pFAhuUzIFi4VVF4DDTE35cfNzbodeB
         TfjnY6o97H9RpMWf8dbG+ODuO98jtg24spOX467COlkgpOOmM37HoDYmESzWLgrE9lhC
         jOxu2Lp3q7Efn7s4ePm0AVYVsZhKqxoGpsn/zqvP+ofitntiEJeO+k5sv5JWo/so36W+
         cOBA==
X-Forwarded-Encrypted: i=1; AJvYcCVA3kGEEdg4/L1fEJWmOxDuZ+RVA7N9wz9mAPjLHzNOt1tZ+8qvI+F+6BnfJuiQu//gj89mgCAW1Coj@lists.linux.dev
X-Gm-Message-State: AOJu0YxaMDQjIueB4w7//QON4BsJUezL4u18IVYYcJVDNvGxhX+KYo10
	oW33ChzoyIAll+nXa8PbD10F7dImFDUFxFJ1SEgUEeEaqbjZc7pXFEofPytAPmd5gkgq1UzmXkh
	nGqXYNmxBbfxAyr1NT3lksZ4Z/JUBip1sw25/m8wo5DJBzwQEMoDIP7qP9bY=
X-Received: by 2002:a05:600c:458b:b0:42f:520b:1591 with SMTP id 5b1f17b1804b1-42f584870b0mr106325565e9.24.1727769288711;
        Tue, 01 Oct 2024 00:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR3ptuIF03QZKWCzgBMu033TB24qXL5bgVyxor4vvRrqvhv947rEVkFXvq82emjXfQlHNu+w==
X-Received: by 2002:a05:600c:458b:b0:42f:520b:1591 with SMTP id 5b1f17b1804b1-42f584870b0mr106325305e9.24.1727769288250;
        Tue, 01 Oct 2024 00:54:48 -0700 (PDT)
Received: from ?IPV6:2003:cb:c733:a800:ea78:e754:1995:5390? (p200300cbc733a800ea78e75419955390.dip0.t-ipconnect.de. [2003:cb:c733:a800:ea78:e754:1995:5390])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57dec110sm126585615e9.25.2024.10.01.00.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 00:54:47 -0700 (PDT)
Message-ID: <96fd7bd9-3525-44e0-b797-55d4e82f9c37@redhat.com>
Date: Tue, 1 Oct 2024 09:54:45 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tdx, memory hotplug: Check whole hot-adding memory range
 for TDX
To: "Huang, Ying" <ying.huang@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, linux-coco@lists.linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Kai Huang <kai.huang@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>
References: <20240930055112.344206-1-ying.huang@intel.com>
 <cf4a3ae4-deae-4224-88e3-308a55492085@redhat.com>
 <8734lgpuoi.fsf@yhuang6-desk2.ccr.corp.intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8734lgpuoi.fsf@yhuang6-desk2.ccr.corp.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Because only TDX compatible memory can be used for TDX guest.  The buddy
> is used to allocate memory for TDX guest.  While devdax will not be used
> for that.
> 
>>> This also makes the original TDX memory hotplug notifier useless, so
>>> delete it.
>>
>> The online-notifier would even be too late when used with the
>> memmap-on-memory feature I assume, as we might be touching that memory
>> even before being able to call memory online notifiers.
> 
> This should be OK.  Because we will not use the memory for TDX guest in
> this way.

Thanks for the reminder, I keep assuming that we are hotplugging memory 
into the guest, not the hypervisor.

Having that as a comment in tdx_check_hotplug_memory_range() would be 
helpful: we don't allow mixture of TDX and !TDX memory in the buddy so 
we won't run into trouble when launching encrypted VMs that really need 
TDX-capable memory.

-- 
Cheers,

David / dhildenb

