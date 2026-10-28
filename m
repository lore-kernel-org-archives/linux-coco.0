Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170308;
	b=sPaB0W9+zuQ3V3IGN3xPzy+BbfspLfhpb1d5+IAOCbvdHKAHgS41Qz6LH8lbkzx9Zyn4
	 Y6dZe+iSdcDYS60NXc0/+ZEDaLBWGI6M/Ny9IhJy+zP+PDY/Tg0rtBlDFpH3AZbBreEfq
	 kXRRVDog/3+YgpoyoeRjCunL+S6X4KtkywY+ArfnYb35Ie7Z6NL48lgjplFTlia+KwDKj
	 x8b8K0tLCEtaYWkHgkXFrRJ46ITtqwGYqUAlRtBS7iV9E5Ru3o2dCfRNVMOHK0jnEvzLz
	 wRGwSI9fqvFr4PvCvUOKnmnWfq54pis75c2EMS7vSwGaCAK0QoLDpwByHLg7thT6kaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OU82mdQwOnTlldCp6fJ9DzcsH1aK1DJuUdJCn0clSqs=;
	b=plG2Bx1h6+ii0GJNIqJdJX0natJA9XCgSVC4rhjss7TJlsOMoLmgRyRJRho1lZr4vNOp
	 m1aOL63dM6srHMrX4LdvEUUWvY47iZW+KZ32FwJG2DDHJDPUVirsIjHWXrXIU6aCzQtLC
	 1lpXtFRz3W73sIQxVLhGUahp4/g1EkFYgruVmM28WFpv+d2ErcO77A2yNrhGzdNKkgEPp
	 pqolqSi6XK8WzxZeYrAygP4Mx/3s8T7YmSRKFQ2PRVD6TexjSpDIMbe/H0l9swtVD+P4Y
	 Ovl/TIKkE0BX7K3L3QihN3nQMOqKOwfW/rzjW4hnsP7BFaxDmT2x0I92gwZj2ttvgWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BRno24pg;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63562606A31A
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 06:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63562606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BRno24pg
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso4930045e9.3
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 23:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793170307; x=1793775107; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OU82mdQwOnTlldCp6fJ9DzcsH1aK1DJuUdJCn0clSqs=;
        b=BRno24pgMKRoI1LDGuI7It4Uj13+dB61tuJMjyBzpSVka3qaWhLUpq51YoMk/LSFwy
         6CoPeA5hKF3cntsxfSBG84Lq4UA8QoGttVyi7stcBA7qI57m1gZgrQLnzf9nKd0VH7Ko
         5zjn2hswZM7y5d2WVd2mpoNBK4U3w+Cd+wYBkormI43GJ/D/gBVBfa+54/TVR9991bYs
         H1N3BJTNzUnrjHCvaZi6/gn0aVGC7HyfZCMFvp5weUDRbKzjgAU7LUzZEmoLYHyjBHVO
         L6x2MDz3KzEHdkWRmLvba+4QhwN568jCICNm2tFolzsdy480x1Mh/m6YLWY/X52vUuai
         XW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793170307; x=1793775107;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OU82mdQwOnTlldCp6fJ9DzcsH1aK1DJuUdJCn0clSqs=;
        b=XtwfNt8xEGDsPyR9uy8ELQLmbWVQpz/NxEKLE5R4NYJkUqLnBHzhBLMMxBWPCdPWsq
         eMZSOUbV7TnL90+YNoTLiW7OPbnCG5v1dwgFpDMXvAJ9hu59tXjFqfv0/3hR6HZcIjnk
         o3M8KYx+4GUlEFALVsgdQT9YRIrfv4xVTWiFiteTFB4D9Z+86Z3ub1ikRWj/Xy+6DRBv
         ulbSTud28TmwlrGfVrj26JOZn+4TYUWEer6DuDnUrdiWBSwVHuPWX//mzzbDvr2zbj7w
         v42F7O+BCkWYmJMWZpq0KlafqphP5/WVhWB6TF73CPyxTVq+AbIs6Xx8Sw9X8PCjpozG
         Llew==
X-Forwarded-Encrypted: i=1; AKwUvBy/sHH9xAUZKbcR1B48p1WDl6Bofyqn2hzP+xHXACJ5gyAKms+vbyJcg2QKxGql9WQUTlI8rPd8qigI@lists.linux.dev
X-Gm-Message-State: AFq9FYKHXTgXVEjBCyDr+pTpVMaejyWTL527mUQ29gHo7KYPGORoyxS+
	wrTWzXlgUrqWpW9Ka40zIQN3kN5B6MNQbB5R0uxyVsJKJrYHj9+attmucNcLjjZTwwc=
X-Gm-Gg: AYBFou2S5wy2j2aXs575U9C8fUvSqy40OC2/ymvLFPfA9xH63taFidg7MSYUp/4goX8
	J4H9fB8wjWv51YRYXzuQ9Q75V6dh/zf+jiRKn7hRYq3E7t4cDAWIAkwh0izOFNqjJVohL1DyJzc
	EUKzkzDgsSa5r5T4FtJaK84JySxSUSVslpbiVdD0VXl3sE9lAKVnmmJVZ6LjHKWRDiMw/tSHIEq
	ZFwrmJH4T+nyjR3jiiifDVcdrxUwmMCDNY55Zntj2sQMJMKP3AtfJP/Jw/OdkE1RzuA9qnxaMKc
	OnXO6j4y52f59jI6u/YRSH9vhZ2+CTixULg42ef1xzOxRxxXhvSFjZn04kds+mr3O1klrU4zYQS
	q/2N8G2Ptg0cJa2lsdCsiqzAM2DrYx4iaj4O2a9+kuROmdJLDvb96LrdSzfa6MjWFMvHmuyDWhZ
	fvtCr5eHEPnxsMVTgnndwhUPBAj5P4su9PcOobdbJOndM6BWk1SM5iiSr0YRHm6OFLNBGXsT8Dn
	epoSMbdi7r7NLq//Dz4FBL9fHVYHxbKFcWvf8xRh5z0fDrk7vBGwMYr7fJSpLN9p8kuHcV8bvrs
	t0ZNGySItfKkjI5qaR9YwJxVX1xAjpzgj9zkxYIsxULC20st8hM62i8=
X-Received: by 2002:a05:600c:a314:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4a96b29d208mr19116475e9.18.1793170305995;
        Tue, 27 Oct 2026 23:51:45 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94fce50a8sm17667475e9.4.2026.10.27.23.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 23:51:45 -0700 (PDT)
Message-ID: <c4c3e6e9-8f4e-494b-b21f-7051ca81fad6@suse.com>
Date: Wed, 28 Oct 2026 08:51:43 +0200
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>,
 "Hansen, Dave" <dave.hansen@intel.com>, "kas@kernel.org" <kas@kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "seanjc@google.com" <seanjc@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
 "Gao, Chao" <chao.gao@intel.com>, "Verma, Vishal L"
 <vishal.l.verma@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "Peng, Chao P" <chao.p.peng@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
 <686a2511-1d4b-47cc-abdb-951693cf1771@suse.com>
 <IA3PR11MB9136E76982E260079081A59F929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <d4183670-c640-47b5-a70a-659861b0a21d@intel.com>
 <c3a973b6-b222-46df-bd79-fb0df6d7b0c8@suse.com>
 <IA3PR11MB9136C5455D0EA04FC3624824926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <IA3PR11MB9136C5455D0EA04FC3624824926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28.10.26 г. 7:42 ч., Duan, Zhenzhong wrote:
> 
> 
>> -----Original Message-----
>> From: Nikolay Borisov <nik.borisov@suse.com>
>> Subject: Re: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
>> support check
>>
>>
>>
>> On 26.10.26 г. 3:26 ч., Xiaoyao Li wrote:
>>> On 10/14/2026 2:11 PM, Duan, Zhenzhong wrote:
>>>>> This is used to allow TD guest TEE-IO Device Control and Management
>>>>> (TDCM) module to
>>>>> manage the device. The TDCM leaf functions are defined in the following
>>>>> table
>>>>>
>>>>> Is TDCM module implemented via the NRX facility ?  The TDX Connect spec
>>>>> never mentions the TDCM module. A bit more details are required in
>> order
>>>>> to better understand why you've implemented this the way you have.
>>>> "TDCM module" is GHCI terminology. In this series, the guest-side
>>>> implementation is in the TDX TSM driver; it is not an NRX module.
>>>
>>> I think the TDX guest TSM driver is just the implementation of the "TDCM
>> module"
>>> called in GHCI, right?
>>
>> I think we are entering a dangerous bikeshedding territory here. But
>> IIUC TDCM seems to be something which the TD calls, because it sends the
>> TDCM function ids to the host, so the TDCM should really be implemented
>> by the host. But I think such construct just adds more confusion, TDCM
>> is just a subset of the GHCI, so nothing really more special.
> 
> GHCI spec says:
> 
> "This is used to allow TD guest TEE-IO Device Control and Management (TDCM) module to
> manage the device."
> 
> So I think "TDCM module" term in GHCI spec is talking about guest side - the TDX TSM driver.
> 
> Since "TDCM module" term is confusing for reader, so I plan to drop it
> in next version, I plan to use "TDCM request" to denote the guest-side
> operations and "TDCM implementation" to denote the host-side logic.
> let me know if this distinction makes sense to you all, or if you have
> any other suggestions.

Yep, makes sense to me.


