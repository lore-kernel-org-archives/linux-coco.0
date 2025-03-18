Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17EB207E12
	for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742299019; cv=none; b=ko4BrBfNd4HNBHeJeqm3umOXI89VZvyS33af6ufy6ubnSJTOsbLu6IhTkgWaPs1As4UgDneWYd02gkTSYS3Pit11LepCoz92wFiOJgEmkZWUtYBbJMKwTKIXTEJaIsmcZ/KjeFtJXZf/7Uxeht68bpfKnGJUOkGNDly68i5Apso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742299019; c=relaxed/simple;
	bh=v0I0B7d/T1f4zASXzgrDH9mKNo1JnOE8sg0orZVnj4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHc1s+1ELJ4ARIhfF/oBNTNaRn4G/hkWcxl86i7G70xorJ97r8Vto18qv38H60GknnB5lawSag3FnhaoDEkaKJWWGM2/FONr2DFCYxxBI0rPTbgolxNLcI+EtOA85KOp3VI0ve0nHfGSgnJyUztQtT5aj1HUxur3Ng8d52Opoyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TYvFaPXp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TYvFaPXp"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaeec07b705so868386366b.2
        for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 04:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742299016; x=1742903816; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6/x9gkT6sgVM/ewcYURbIyaLiojuCegPHSKxVXvwbE=;
        b=TYvFaPXpUvMeFq/q5rXxb5qidMclaivGsN+MG6zjFOXiWPepoOldoePhgI5wPV6Erv
         HX/vbQ1g69PIqhI15HVlSGkWF6Sdek56GwEwwlInxr8WVhOQvbV/jv5M0TFCZLC+F0qC
         EDxgop/oRDp9duOqMtOaoqZYxmcpD4CJLdsxcvDeq3OGsfJXERsti3AFypIJ/fIepK8/
         mMW+XGYuUy00QMQUtUDOq5iU1aw1ezGtbx7UxwY3Scvhch+bN0g0Lzu49fYpLLkq7bRx
         mrj70RTmvamcrGxjeJceqE014NOqhyxk8z7hc4FRXgSkZOsC0MzD8M3WwRFtozeuMDWW
         ApJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742299016; x=1742903816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6/x9gkT6sgVM/ewcYURbIyaLiojuCegPHSKxVXvwbE=;
        b=xHcbTKKHcq0RI2l1pIS18E4PZzV/ow2ROoFkqpwm9qdQpdrc7g1UpcAK89SdOCzGY1
         mRSImuR5rLLzrRtoAIwScepVuNCRi2dZVEKW8V5ZLjw75DZbeC403+CJVSYbnJf1+6UW
         VUCRN5RfG/e68E7IoOOwiavp4Qmf9hrRVY9JqpBdE+ePqP0ieGE2MSMMC2zFe/DWDsZ4
         S3Uh6N24S/PAfO/xzvviS4QZWA1UEr+jr2OgEavcvndUcIkzPs1/p8QKQWbv7IV3gdoD
         Ze2pyuVx/V1XjLHz5akuDeoneXfdd/5/S78Aqa3X7pyhl5/1MPZhPj86ynPULz7oNIs5
         k0UA==
X-Forwarded-Encrypted: i=1; AJvYcCVqGwmE7HDWfft+r7LQMzrqNU1wUB3Z35js7bW99utxa/KaYoE+2LZj+nUattVw6BqTgv7qCSyb7adJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwsEqYqSd+mtSJhMe4THDomCtZ1c7D3KkjBkjDtGaqcV08mfUTX
	vQt7HBzVkNYF2GmlrjhiKvkRklpQrQvk9chGV/HOTXq5aFi/1yByR2vJDGBnXMM=
X-Gm-Gg: ASbGncujaIlh+jm/maKrx3Xh5EgAHZPKg5xB78PFk3zeQ0hif+vGwx6X4VKWfWU2LPS
	UZmw2pBgCakNakJG5XAAUfS+85NZdgAnrVsUoObvRTITDEcR13xOyCcf5Y5tPk10mdsr9GbVSg2
	EGM9r9eY2oaH0DNal4toQTAPqEfLYMGpbGCfAZsulpyk6JySlYVocAbwpAGReLjXtLTbcfbDI/3
	1y+fiokiMFwsCIGum+Yzn1/0xoijohtCd46anYkonsavbk973UgqJfCe477w0/2EVGQtEoBaYWn
	tifMkqL5xvl3WkAzohaT/gTfGZtvf9ttjPF5WWzteFc5PH8vQZmVEvU4yAetAQ1Ez9NG8Tmt/4N
	iUf1sWYE=
X-Google-Smtp-Source: AGHT+IFAZyvgcXWZ/+SVidWj+0roliQMal0vwYcucW/pBQISCZLZ0OR4AwYuQzHLIm/kOpugXfd3dQ==
X-Received: by 2002:a17:907:a4e:b0:ac2:344:a15e with SMTP id a640c23a62f3a-ac38d410d00mr337157266b.22.1742299015703;
        Tue, 18 Mar 2025 04:56:55 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.143.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3863146bbsm197809266b.146.2025.03.18.04.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 04:56:55 -0700 (PDT)
Message-ID: <0e6691bd-b390-48fe-a132-21db4ac5ff27@suse.com>
Date: Tue, 18 Mar 2025 13:56:54 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] /dev/mem: Disable /dev/mem under TDX guest
To: Juergen Gross <jgross@suse.com>, dave.hansen@linux.intel.com
Cc: kirill.shutemov@linux.intel.com, linux-coco@lists.linux.dev,
 x86@kernel.org, linux-kernel@vger.kernel.org, vannapurve@google.com
References: <20250318113604.297726-1-nik.borisov@suse.com>
 <24826c2b-f1d2-408a-b8d1-63e1882b0fd0@suse.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <24826c2b-f1d2-408a-b8d1-63e1882b0fd0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18.03.25 г. 13:53 ч., Juergen Gross wrote:
> On 18.03.25 12:36, Nikolay Borisov wrote:
>> If a piece of memory is read from /dev/mem that falls outside of the
>> System Ram region i.e bios data region the kernel creates a shared
>> mapping via xlate_dev_mem_ptr() (this behavior was introduced by
>> 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()"). This results
>> in a region having both a shared and a private mapping.
>>
>> Subsequent accesses to this region via the private mapping induce a
>> SEPT violation and a crash of the VMM. In this particular case the
>> scenario was a userspace process reading something from the bios data
>> area at address 0x497 which creates a shared mapping, and a followup
>> reboot accessing __va(0x472) which access pfn 0 via the private mapping
>> causing mayhem.
>>
>> Fix this by simply forbidding access to /dev/mem when running as an TDX
>> guest.
>>
>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>> ---
>>
>> Sending this now to hopefully spur up discussion as to how to handle 
>> the described
>> scenario. This was hit on the GCP cloud and was causing their 
>> hypervisor to crash.
>>
>> I guess the most pressing question is what will be the most sensible 
>> approach to
>> eliminate such situations happening in the future:
>>
>> 1. Should we forbid getting a descriptor to /dev/mem (this patch)
>> 2. Skip creating /dev/mem altogether3
>> 3. Possibly tinker with internals of ioremap to ensure that no memory 
>> which is
>> backed by kvm memslots is remapped as shared.
>> 4. Eliminate the access to 0x472 from the x86 reboot path, after all 
>> we don't
>> really have a proper bios at that address.
>> 5. Something else ?
> 
> I think a crash of the VMM must be avoided, otherwise we have a security
> issue due to one TDX guest being able to DoS the complete host.

I agree with this, however this particular crash I haven't been able to 
reproduce locally but was something that came up in the GCP environment. 
So I'd like for someone from google to chime in.

> 
> I'd rather crash the guest for which the SEPT violation was detected (is
> this possible? If not, don't allow it to run any longer maybe?)
 > >
> Juergen

