Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1E685C69
	for <linux-coco@lists.linux.dev>; Wed, 15 May 2024 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715778865; cv=none; b=aYn6VnUGMY+doHE02kuer36PspOosvQsfOaXdIeq9kpBcjrWQ4nSETbydVf0s550GZYTFp1iAFiZfe/8Mxzb//eBQtNoEGKc2VlELzJS2mj+SxYJx7yPOaclAyuMUbgZO2dRrymnkwNH83al/9A5+IP8ESjoAC01ioaYRui5kOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715778865; c=relaxed/simple;
	bh=s2MsQsbOcEJaFuD6Ni7/NYOLXbHjY6U5QgaDyMhbiHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyL5Xi9jk6sYrNCOT9tmY85rguDABy/o0OCvyN+H7dz7NTBBr35Mcxx1ZqNoJ3UG9jX0gRvAB2rrW2XUVhyYN3Kvljx9V7/Z62R3nfwtMhd7Ly+RSX9mzrqmLCKJGI12YTQk2iermDlLgetmCq0CmJmItmfh0bWZZ+MLg9aUJZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=fail smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aMl/Facf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aMl/Facf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-351ae94323aso3368736f8f.0
        for <linux-coco@lists.linux.dev>; Wed, 15 May 2024 06:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715778860; x=1716383660; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZQczyYTUAQqghnJxDKHUmq7P5Cpxuc3TDeJECCySJQ=;
        b=aMl/FacfeYHgNVUP661++9dPh4fJro1cLwpvgllQRsLyQ5bOvQTMcPFuuYjo5pqbm+
         UR2UJMGdir/V27uHINOdmZZtIRCZ7wGzON32zSma10aQPjVE2cyEtMq86VfEkewtcv8E
         VOAGSF9EQmseVFoMSvyC4KwnuTO18c8omsyGiIvNJElqpY+/EV6BSZ8f/Ie4VWcSylnT
         GGLQL5p9DKMXHPIdDRnnyjCQg1ltw3hShylJ6iZLhlEeF625PYieVdNNO/pI5FKUqK2r
         ae5LMP6I6PtfRqyzoEQezeDz3T/dv1XUAH8TUe6hfCmdUf0MszqTBRwLYnSvB9mSGVLr
         pJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715778860; x=1716383660;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZQczyYTUAQqghnJxDKHUmq7P5Cpxuc3TDeJECCySJQ=;
        b=GyJ0lfcPs2EB/8UR2L2bGfVkxVv03UND5P9SMlPjZQurmgwGPvFRTXqriHAgJI6B44
         FXJ+cnyc93Bt9Sit5V+Zdzkb5B4PddX+qzwdjOdD48D3x3kZtCVis+DhwEptdeLThLhN
         JsqR/IAO79KbyIDFVShiD2a4qmlgDro9ik/PtWNvO8bxMWOc0q4VhsMydZIImLBbfvbX
         rdj8QLns4F47Fbv15neziIbOPEF5whawn1LUHoiI96T/U9M1z6nIbwo/LQwh2b8JI6A9
         FDXe7YdiKCVKu/71DQEwmZfxib9+/+PfX97CgzNyzFNCU5HDiVfeRd5vH1o8uYRzi1uK
         JtFw==
X-Forwarded-Encrypted: i=1; AJvYcCUaFKfmMCA5px6yf0+PBiR3Tl5c+3vnr9Je/jowFcjMxbPPM6R4Mlp7bwvNfVyuuonbF5Qv9rmcquwznxhmdzPRboN5248rbQQfYg==
X-Gm-Message-State: AOJu0YzsTJzwXCTACpkGwoJOrqEPBWHgPjbs+Z3BNuCnUEbWYX3+Amtx
	JYaCAJ1fewvDHEuYoZ/GkTXbsYLd4fXP3qVVtG4iugqSuK1dVgIonMf7fQ3cHzU=
X-Google-Smtp-Source: AGHT+IGQNbYnf8Vfg9Xp8aIPaXFstDshmOgeyDh575lue3C4UTfVAvFlCh57u4sj5r7QTOh4I+0gHQ==
X-Received: by 2002:a5d:4f04:0:b0:34e:89cf:4576 with SMTP id ffacd0b85a97d-3504a9689b3mr11621359f8f.51.1715778860187;
        Wed, 15 May 2024 06:14:20 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:7315:bd27:5d9d:ab1e:9b6f? ([2a10:bac0:b000:7315:bd27:5d9d:ab1e:9b6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc5654sm16576757f8f.115.2024.05.15.06.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 06:14:19 -0700 (PDT)
Message-ID: <8a5fa107-a055-4c05-bcb1-dc4044be841d@suse.com>
Date: Wed, 15 May 2024 16:14:18 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 3/4] x86/tdx: Dynamically disable SEPT violations from
 causing #VEs
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240512122154.2655269-1-kirill.shutemov@linux.intel.com>
 <20240512122154.2655269-4-kirill.shutemov@linux.intel.com>
 <4019eff6-18a9-49b2-9567-096cdb498fb0@suse.com>
 <hlif565xmuj4oqdpap3boizepwg5ch3dssb67zzvy7i7smzp3n@x6hzdyc2qk4y>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <hlif565xmuj4oqdpap3boizepwg5ch3dssb67zzvy7i7smzp3n@x6hzdyc2qk4y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15.05.24 г. 12:30 ч., Kirill A. Shutemov wrote:
> On Tue, May 14, 2024 at 05:56:21PM +0300, Nikolay Borisov wrote:
>>> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
>>> index 1ff571cb9177..ba37f4306f4e 100644
>>> --- a/arch/x86/coco/tdx/tdx.c
>>> +++ b/arch/x86/coco/tdx/tdx.c
>>> @@ -77,6 +77,20 @@ static inline void tdcall(u64 fn, struct tdx_module_args *args)
>>>    		panic("TDCALL %lld failed (Buggy TDX module!)\n", fn);
>>>    }
>>> +/* Read TD-scoped metadata */
>>> +static inline u64 tdg_vm_rd(u64 field, u64 *value)
>>> +{
>>> +	struct tdx_module_args args = {
>>> +		.rdx = field,
>>> +	};
>>> +	u64 ret;
>>> +
>>> +	ret = __tdcall_ret(TDG_VM_RD, &args);
>>> +	*value = args.r8;
>>> +
>>> +	return ret;
>>> +}
>>
>> nit: Perhaps this function can be put in the first patch and the description
>> there be made more generic, something along the lines of "introduce
>> functions for tdg_rd/tdg_wr" ?
> 
> A static function without an user will generate a build warning. I don't
> think it is good idea.
> 

But are those 2 wrappers really static-worthy? Those two interfaces seem 
to be rather generic and could be used by more things in the future? 
OTOH when the time comes they can be exposed as needed.

Anyway that could be considered a minor thing.
