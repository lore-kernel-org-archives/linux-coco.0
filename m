Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE8421221
	for <linux-coco@lists.linux.dev>; Thu, 23 Jul 2026 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799327; cv=none; b=m8K8Cbj7DFjhb7cSrgzpZAnRVVhc1FT5wOlWQ9/SnTK3vbmbHhF6XewWNft9hTnyeMB/KGpvoheAO+SHq1XDw1CB3rZxFUJ8x0ohHzrXskT+4vgLtanbOFEP6k7cDJLBAC/sYipviiKEeld1/EuyP8a3wbHC6hks0AjnZDfA/fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799327; c=relaxed/simple;
	bh=aE0YbnClVVZc97ih0C53lPoRzJOydGHrwfr3s19Q9Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6dVIPDdU5N3jdFUlP9pFc06EblmaxEh7lH1B8KGNQRt1qsTj1P1TJ1h4E+gp+dD/dxtAiWgX+gi5FAB5+N5KreHqUUlLcFmKyrZFFh/QE+aXb68XFZ7j1a0uGjnL1Jv4qbwaGgVKO5peMUKX3NJYOjlwbck65NWcmsOf72yGks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cpG0PUD6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cpG0PUD6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso4752175e9.3
        for <linux-coco@lists.linux.dev>; Thu, 23 Jul 2026 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784799322; x=1785404122; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D3ORQ21gQ254UFesCESfZjdehnzjexHL5976IdG1WZ0=;
        b=cpG0PUD6k2X2Cdue9uzOfptm2kzuJeaYKgiFwRYuGTDuDNtIz7/pYWnFLMwTDnA4yM
         pKE9YQUXVM+3QafkMZxtnKx9JM/wgdkSaLtGIEK5PR55prNHgILWZ2JWwM2fa8IEPoSh
         dUwaqCpPSY/cemJ1ZDdT9CxFYabMC+aloCJzJxY36mRilEEgL5trPtDZjDQ2DgwEh+cF
         MqW33yZOSCm2j5V87M+gA7VJey8+u+8bL/o17mues0+RSCkMUcKD/ALE1yw2lovqIeiw
         6Ja67sE43cE0dDMIjMj00p9Y1S9eIU9jpZBI+DIc4wqoy/xOj5nXKITQCm8EyeqQCE/W
         nJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799322; x=1785404122;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D3ORQ21gQ254UFesCESfZjdehnzjexHL5976IdG1WZ0=;
        b=ISm4OxELHL0as0MHGrt2ceISZIGPzP63auXSZoSJtXDGH5vaEaC1eI3eMxH/NHdbYm
         PNJgyKUlHISST1GLCDMuSdQPkHR0e+282JDTaXrPkRHl15RS/Hn/BoBUlk96CjMveqdG
         eJO1YnQKSuWfJgiupgw1wFv6xcOYiWijNDExdbAPP6y0n9lohsxSQCuHYrCOkssxT8OZ
         51NHRn2rEPnpTOs3a2FW3gn25ImQu2mRxTs2iP4U3IKXds83Becx/dTaGusgUMep4mZV
         yBkyu5VfPP042hWgFWHBk4zO5fM95UNBD/vIyxSQ7wv9bWaZ3CtJhNw5ICiJlOH3WOAh
         N2Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rqasxj8PZdBOXwud0OWJSGqjiZfrMJtCeC0Dqm/9s6INMBJQ+dVbUejxygRKmIg6QbnpB2+wQyxZvXO@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6TRN8O4Tbx4t2i/8DJc0AM6uBejReAQ8bfvtt4kNmR8CM2YfZ
	ImljeWLre7fWEeAkbWHPkkGAm+brss7MzHiWSzI0K+u8MIXck0nREFXzOY0x/dF2fvY=
X-Gm-Gg: AR+sD11uFziPsMt92S5OazJATB4iHMaV/YitJguTZK79XEENsFcbGj/U2BxQgSPTU08
	mmMngyQn5mn1w/XLAPJu4Afpx+V3k8fECR5IBSnhTCSAiVxRcYQ0B3LPMCrXS6hUUpCCI3Ql93Y
	j7kDj6sZCT1pNzC0bAF/kSO66Bk5OmEJSd9hWnA8VUOUCCXPLsc5HOTq1hR971muUXW57f6xTV7
	ACkAmzWly4fIXwvBYGMgVg/myZbn3ZCGYh1e9Oy9FZQTMKTDIl5KCu+xZoqWPn9oyZ7YcQkdpYg
	ht0Lty+dfkq0klDRzlujQ3uH916qm07JwLTSwx/Z2T06uOXN+mA3qsJ91JdS/TQtIPWuYyjnHY+
	aZ/BMVhYV0TJZKiXMew0IKqzJHD7YcDVH6Az1EHWRbk1pYlvFYYnRo8nrTvbvUOQlv4bP+igtFo
	swjgf0fXvvDfjRJFA=
X-Received: by 2002:a05:600c:4f82:b0:493:f0f5:f2d7 with SMTP id 5b1f17b1804b1-49573cbe8c8mr23022375e9.7.1784799322543;
        Thu, 23 Jul 2026 02:35:22 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.206.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b043727sm87978315e9.4.2026.07.23.02.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:35:22 -0700 (PDT)
Message-ID: <d21d1be4-1018-4bfa-9568-50f4630f0a2b@suse.com>
Date: Thu, 23 Jul 2026 12:35:20 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
To: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: kas@kernel.org, rick.p.edgecombe@intel.com, dave.hansen@intel.com,
 dave.hansen@linux.intel.com, yilun.xu@intel.com, djbw@kernel.org,
 linux-coco@lists.linux.dev, chao.gao@intel.com, peter.fang@intel.com,
 xiaoyao.li@intel.com
References: <20260722084634.131020-1-yilun.xu@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260722084634.131020-1-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/22/26 11:46, Xu Yilun wrote:
> SEAMCALL invokes TDX module functions using a function number and
> parameters. To extend the functionality of existing SEAMCALLs while
> keeping backward compatibility, TDX adds more numbered SEAMCALLs of the
> same family. This is just like syscalls, except that TDX defines a
> specific function number encoding pattern: a base function number and a
> version together encode the full function number.
> 
> One concern is the compatibility with older TDX modules which don't
> recognize the new SEAMCALLs. The kernel should decide which SEAMCALL
> version to use at runtime, selecting the minimum version number for the
> required functionality. It can't overwrite the function number with a
> new value at compile time.
> 
> Another concern is the obscure usage of the 'fn' parameter for SEAMCALL
> wrappers. An existing caller for TDH.VP.INIT packs the version into the
> 'fn' to match the low-level TDX ABI RAX layout. The RAX layout
> interprets some bits differently, such as INTERRUPT_MODE, SEAMLDR flag,
> which are not a good fit for the function number definition.
> 
> Refactor the SEAMCALL wrappers to allow for version selection. Add a
> version field in struct tdx_module_args [1], so that most existing
> callers get a default "version == 0" behavior without code churn, while
> callers requiring extended functionalities can specify the version
> descriptively. Enforce the 'fn' parameter as the base function number.
> Encode the base function number and tdx_module_args.version in RAX
> before invoking the SEAMCALL instruction in assembly code.
> 
> Link: https://lore.kernel.org/kvm/4f4b0f29-424b-45ed-8cfd-c77da2ea390f@intel.com/ # [1]
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> ---

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
