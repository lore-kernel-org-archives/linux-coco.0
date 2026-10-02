Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3A730DEBA
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944326; cv=none; b=mibY7yffCMDBsycre/5tJv2wGMeOfe41oTVd25TbNq/zWDcNtG1icr6g7CVWgaURr6Q1C/GgktowelCfz/6LkmpQFuStu1LW4palAPzhZ9xj2U4CRfBut+/70Jto2LaJdXot6xHwE1AJzVtcFuSkm9VnpU2o/O6pi+YC7WsjHYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944326; c=relaxed/simple;
	bh=K2WLOvCouWwizZY/0nd5slNgHbO26Xtg/oTPG00nO+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iC08uaMmQIXGWoxLDP/ZkxEuuHNPb3QV/KMCxTgHzGT8o7p4scwRlCA0fvotkgcvPm7CtQYqDN99gIYaC7louaghkpK738uuowfMhb9u9fZx8UfEtr0FkFA1ZQR5LuLo5t/TJwy2p4EPC08t4bxsqEbl4UD32/0gku7rAvI2p44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CEqVB+m6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CEqVB+m6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so6686126f8f.2
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790944322; x=1791549122; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/phs7jHum1HKMD5+n/ngyLXVbU8kytKeDWtVqYb5TKY=;
        b=CEqVB+m6Fy1xsh0Wh3eJtxTFN0PmjdiqZ4U6EX4NAFfINffRORcJHtKwYxyQaxZyOQ
         8VL3MamfrXaRkvOPJnO7LiyU8qRQw691YYoEQ0r6YqYzatO7Y4w79A0aNfinJtx2g2UR
         v6CO91YLh92N37xMuEkNsNBw6IUPKZ9/LIj1vMtsn2Jjyf3WeUHvpEuPzhrkVhHThZk+
         9OK8I7wzwzhfM4EUbaT+29iWbl/queafmiLQOO4qUsIOaIO81/XCpqNjpwJO2WhezF7e
         gViBibGT1SsmeuDgHz8rJPXFCZ4HUCwMapXwjrjCRK8u9AkDCCbGtSLk1jd+tzmxJSU2
         5V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944322; x=1791549122;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/phs7jHum1HKMD5+n/ngyLXVbU8kytKeDWtVqYb5TKY=;
        b=F6xzFn/XnVfW3D8RU9eFXitw9dhohOyAYXkweXr0IqSWpjuniONLzcnAF0js9gHMb4
         sZcO4USNH9vLC8j41l8J+x4cqOJMJc+L3ch4goZP+xHaNYOIbx4cI02+uWQO5LQgn9IU
         8mMdPoLP9gkAazV5yQ7huWKSV9H4gfV+Qi1up0YyrQFP8HrBPvQwh1QtXR34PXPNd/ry
         tls7eO9f2ohXfgBkHp+D2GkU3X+QVl6DfUDRg6dy/wqQ2JWTda8vzEAzdlrxhOBujRgX
         DdCueq/Aa+kZy+v4LtZyeDfZwIc0IwMa6XU+aifi80HFx8AvWgIrmsFiFSMq9nbBNsy/
         hBpw==
X-Forwarded-Encrypted: i=1; AKwUvBwXCVXSuzgrvCIEIcpBqSgRSQbMrWCS2SpdGQKFGej4Sfbx6wW/WhSsTS/mKj7t5GSGP7kIdo+z4HW+@lists.linux.dev
X-Gm-Message-State: AFq9FYI0FOKC7Y2mSp9x3sbwfVyCE5kDbvtIkVaZ7pUvRXQnDdT2DxWR
	x69Ps9+t+PH7qtQjBmfobtBa7+D/J5ZgBbdMqyBgeysxmCbG3ffvnrdOHW1XEUsamzQ=
X-Gm-Gg: AYBFou1vSBhr29bZwM/OCRNkm8l2qhcwJ5jC8HN4hetZ2IzyjN5iPV1dwWJZAyL8Chz
	B9mhxfSrar4MRTLGPTYveXfUY12c1TWDEsYvCSXeK/QTNiG71eog7lrmKq3FLO3bkeyb3FOVOUI
	w52KDa7bgxO+2P+OEb7a3mlmuPXBymzWcMF42jUGEiw6freGgGXQ3MqDukQav263bH0liG45Iv1
	WbrmafBx13Y3mx/mQjGafL60g3ct2Kal/rSw23nmk0DMd9UTMCnSQmDvWXY1YRmqtmsSIL1Nk5B
	n2ihVk6zzh38TnfyaT2YVOQrOohOYY2apMMDBzA2MsHGvu6LvKXSVMHiI62TIYxferdsZ0XfDkv
	U6ol5UInvfXqVuLZCGJZG8UNMC7J3BdoFqNMCkGhWbPG5WwW7UlvcI6NJFMc/S+QLj8McjpyhuU
	CC6pOsK/qieYdiTPEj/V0YtOyWQhUYc5lMjcSzjbvv0ueRx50HxV4MC+BcHYP01/u9//9dTffJp
	+wHIMyCEWxlAxcDYVWqkXQ=
X-Received: by 2002:a05:6000:654:b0:488:8da2:4b16 with SMTP id ffacd0b85a97d-48b126f60ffmr4313323f8f.8.1790944322362;
        Fri, 02 Oct 2026 05:32:02 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fad53sm6093994f8f.19.2026.10.02.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 05:32:02 -0700 (PDT)
Message-ID: <3fffdf68-f2b0-42e2-a3a9-024cfa483760@suse.com>
Date: Fri, 2 Oct 2026 15:32:00 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] x86/virt/tdx: Convert the td_conf metadata
 reader
To: Chao Gao <chao.gao@intel.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bp@alien8.de" <bp@alien8.de>, "kas@kernel.org" <kas@kernel.org>,
 "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
References: <20260930053901.22528-1-chao.gao@intel.com>
 <20260930053901.22528-8-chao.gao@intel.com>
 <763dcf982570e0ffcc69a6e1922fd2cc266539aa.camel@intel.com>
 <ca464aaf-1935-42ed-b486-4f4cb84ecd2a@suse.com>
 <48ed6f1bd588c6ccab398c5310fb1fc073c1e53d.camel@intel.com>
 <ar-jZEtCnt1Xwi-G@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <ar-jZEtCnt1Xwi-G@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2.10.26 г. 15:28 ч., Chao Gao wrote:
> On Fri, Oct 02, 2026 at 04:28:54AM +0800, Edgecombe, Rick P wrote:
>> On Thu, 2026-10-01 at 19:34 +0300, Nikolay Borisov wrote:
>>>> The comments are not strictly required, but probably fit into turning this
>>>> thing
>>>> into "hand coding". I think it's a nice addition. I wonder if we should make
>>>> the
>>>> "i * 2 + j" a bit clearer though?
>>>>
>>>> I'm not against leaving it as is for now. It helps that it doesn't morph too
>>>> much from the code getting moved. But I think the above falls a bit short of
>>>> hand coded quality.
>>>
>>> Perhaps this code warrants open coding? The code will end up looking
>>> like config_values[i][0] ... config_values[i][1] ....
>>
>> Yea that would be a good way to improve it.
> 
> Yes. With one less level of indentation, all three reads get the same
> shape. I ended up with:
> 
> 	/*
> 	 * cpuid_config_leaves[i] holds a CPUID leaf and sub-leaf number,
> 	 * and the two u64s of cpuid_config_values[i] mark which bits of
> 	 * that leaf's EAX/EBX/ECX/EDX the host can set to 0 or 1 for a TD.
> 	 *
> 	 * TDX_FIELD_CPUID_CONFIG_LEAVES and TDX_FIELD_CPUID_CONFIG_VALUES
> 	 * give the field ID of each array's first element, and the rest
> 	 * follow in order.
> 	 */
> 	for (i = 0; i < td_conf->num_cpuid_config; i++) {
> 		ret = read_sys_metadata_field(TDX_FIELD_CPUID_CONFIG_LEAVES + i,
> 					      &td_conf->cpuid_config_leaves[i]);
> 		if (ret)
> 			return ret;
> 
> 		ret = read_sys_metadata_field(TDX_FIELD_CPUID_CONFIG_VALUES + i * 2,
> 					      &td_conf->cpuid_config_values[i][0]);
> 		if (ret)
> 			return ret;

nit: Is this more readable:

	int cpuid_config_val = TDX_FIELD_CPUID_CONFIG_VALUES + i * 2;
	read_sys_metadata_field(cpuid_config_val...)
	read_sys_metadata_field(cpuid_config_val+1...)

> 
> 		ret = read_sys_metadata_field(TDX_FIELD_CPUID_CONFIG_VALUES + i * 2 + 1,
> 					      &td_conf->cpuid_config_values[i][1]);
> 		if (ret)
> 			return ret;
> 	}

