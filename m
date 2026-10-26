Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792998836;
	b=05fmZks8KUOeBJHKmIOllu5mPVX/v0Z6k6S+8L1Kyoy5tZHRpU8HEhlzOrQoFsR4GJ14
	 Dw8+jOr8Cnj6qFpbNpyQi+4tJyaBqVuGAMJ1MxLVV9I1g2sToL63Ku6qwNOP2t0QkmHNj
	 cyyHME1Cye2vx5QQTl/TaVn840csUr2UNnMjnwV30tpUJNdRHQ3kWZrC63RngONOuJ1b6
	 nk2y189lPkmRqSyHihJS749u64Gyx95H+jlLuMCQ7n6sAJNmWk2/TA1tGsU8C/MdW7tkb
	 l+p28ECyrgbz7oris8O8S5ZJqluE7TrI9wnPTKwLF9aCs+CtUVI7KrOMrx7QDG4QVhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792998836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1b8piUv5ZZ+sF0HHFMkLcrFtrY4rkMXKD2YJaiXD/B8=;
	b=TQzaf94JlHsQifZXLrI0vIUAeqGsmATUIMeGLwFE48rNZH7JViuxTXKikiZD6ZbJ7mge
	 zMreeAX6DztBscsN+SIjpKBYH1nERdOm1AWYR5kyhoNRgIlmI8Fhuavy6pRYFpqJmgX5E
	 T404MDerTId6/SunHqVlqdnSDgmNwynFzE8GWagA0qHSalSdC4uCMm9tA8hd/WqIoUSqu
	 o8EK1FEGPKlOJOut2hd9OsVtFZARF0bdxI6KGda/zwHIHWOGu5ilnTkkWnhKtdSY53ifg
	 QXrAiAv5ehkOoBZW8SSPPLHhIKy+OMdjY2CP4xRMShWHO2aAdH5Z3PjH5wWLGmAZwXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gYVjLKT4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B1606A324
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 07:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B1B1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gYVjLKT4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so9108765e9.2
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 00:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792998835; x=1793603635; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1b8piUv5ZZ+sF0HHFMkLcrFtrY4rkMXKD2YJaiXD/B8=;
        b=gYVjLKT4AamkObXc4bhlLcs0MGM/6lPZ0ftS3EThfbStmWKAVqk3f15XK83YIlnADu
         A88YgmKZORI6dRJfK0ipIk3iBerhv/v1kNF0VAq5PQJbSUi3AuQXsz7MFZV4n08ywh26
         JH55OLaQ4OgFtd70riGTN4HN+XG41Be5cxH2nnHSkRWdEvJDFYQuVHg86AFC8Bmya5Jz
         pdEDYjWEy3nsp5j0V4IaPXol+Tp9nCoylI6Unr9m5SgQMSMDYhsNQu+awH41g5xy99dL
         8Y57Yki9DCUYEmj4Bth+Ry0bvrwkjDYPyFf0oUN7bCVKbsrKLZXBZlanoM1FBmJG/+YO
         yopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792998835; x=1793603635;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1b8piUv5ZZ+sF0HHFMkLcrFtrY4rkMXKD2YJaiXD/B8=;
        b=pBXnMOwNZ38niN08eMt55YZtPGnNmEHtvcpLOjJovNrcgror0YEaNTxKsiJ9z0ccTw
         n5RxuwxSDddFTLugtaJfzNrATGkHs2PczIak9xKE8vlFGCf3XhArph9rQgnwEwYykZ+Y
         pW/UNAc/l5Qkl9R04JB4K7HPNxQaiRPdbHNkPkLfy33Vu4z16eGIuklF52PIV2LD0vnq
         dgIEupt6QhhnlEvbHSTQb1TADEsgOLxrlrIMADzf+tUv/83W7QHC7wdC0qjwmYUaqEd3
         vnpVPWTnJCNpj473GXgpwvwsNO0tCRkslnYDycrec2CfRPUNwdADQfG6QbgX+ik7L0aa
         fPMw==
X-Forwarded-Encrypted: i=1; AKwUvBxnyWLkfMwUj/4AA0azHxz4N1JuBJqsIdf6n2fz+FOCllJZNKgPCQYov7tJoBdvOIJ1jI8k0KyHHSnm@lists.linux.dev
X-Gm-Message-State: AFq9FYKHsNnnRq4yXBPD9+FTqgr1kfJnAaSlK7IBHgFvC1OAUypwowAd
	7pL57NBW08ydyPKJ7dM5XHGWCipY5/fqs9eTiEpvwlla4QVQguig0BPiAfkNPulInso=
X-Gm-Gg: AYBFou30sC5gwhVcl1DV0LyBotrspLLc+AxntgoNsWXZ+DI6WrxAbzrdoGNIuG2/OaG
	m7Wagn/UVPWfok8L5poOqJmZB8U8EEYzHGNXXdRpCK4SDLrIb35vbVGWOnaN4ejSi+nufeTiYhl
	glHRjc6EOOLDjNBM5m821oI4ZXGVp6ginztoKjk5mIxQYeo9lyUeqjYLr2UrwRk5HrTHT4r3oIf
	5PMeRCS3VgyfnrqhOKk4uaN55lMl7VQlb30Yf+12zszJBFMUqpGDhBJ5e7QjtmGpM7ppKU2kkzS
	mgj93If5Vm57jlUmg1MnRss/zcyoBgyp/6Nb2saBW20PMCJh00LRIoQtDfeGPp0mWm53YCe3Fo7
	g1RzBSop8+X+zVoKCa3Xu4ytAeHod7fFVvU+DMM+VUaKFpD6hpm0gROKvTCC3/vzf5iIxn3HS8K
	RBSc3FjCbfMQzGWor9zZDevJJNVf5e0LdUbqTdRM3zwT0j6cvi1c+kIQZlW1KCzYMn62m0rgRCx
	oNW+bAkX7dnV1oMw19esdJMld9hsOtsmhCHHw3l4uoOWZGf36IEIX+3q0jZpvrRIlQGL+f7hBBW
	nb7cqB3xNyM3y4LFrE1o5z8vhSY=
X-Received: by 2002:a05:600c:3d8d:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4a35acc2edbmr87025685e9.33.1792998833162;
        Mon, 26 Oct 2026 00:13:53 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm137080865e9.1.2026.10.26.00.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:13:52 -0700 (PDT)
Message-ID: <c3a973b6-b222-46df-bd79-fb0df6d7b0c8@suse.com>
Date: Mon, 26 Oct 2026 09:13:50 +0200
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
To: Xiaoyao Li <xiaoyao.li@intel.com>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org"
 <x86@kernel.org>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
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
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <d4183670-c640-47b5-a70a-659861b0a21d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26.10.26 г. 3:26 ч., Xiaoyao Li wrote:
> On 10/14/2026 2:11 PM, Duan, Zhenzhong wrote:
>>> This is used to allow TD guest TEE-IO Device Control and Management
>>> (TDCM) module to
>>> manage the device. The TDCM leaf functions are defined in the following
>>> table
>>>
>>> Is TDCM module implemented via the NRX facility ?  The TDX Connect spec
>>> never mentions the TDCM module. A bit more details are required in order
>>> to better understand why you've implemented this the way you have.
>> "TDCM module" is GHCI terminology. In this series, the guest-side
>> implementation is in the TDX TSM driver; it is not an NRX module.
> 
> I think the TDX guest TSM driver is just the implementation of the "TDCM module"
> called in GHCI, right?

I think we are entering a dangerous bikeshedding territory here. But 
IIUC TDCM seems to be something which the TD calls, because it sends the 
TDCM function ids to the host, so the TDCM should really be implemented 
by the host. But I think such construct just adds more confusion, TDCM 
is just a subset of the GHCI, so nothing really more special.
