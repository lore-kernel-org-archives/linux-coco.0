Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA94A450F2
	for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742302423; cv=none; b=rPQRk/KEaRmlZisz+VE2zxeHZXpcv9jBFcS2x5jlXe5SX9Dk43QjaXYAhLbd5E+P4znTvApYXfWJye3ispVxHhL/RAnjg05zj+jP6UEAnn4kGeaWPpCMsvfbEOBXzoRK4X7bpDpUvGgfpDREhtcKwTQREnsGITzp1TNC6ev08Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742302423; c=relaxed/simple;
	bh=Lu1DvnGNwVfIe8fl/pwODSF/9bUtOfACnC/DXL4nJmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGA9LtMCwrhHPZjoAWFM8mN+uhMG2lZ9ZYGc5s5d8qj26mqyAgd5+snv2Baw/wKPSDKHnEQQEAmwsS8IROsFERZRXjCKXK8B7x5wdf7tIvpyMubRNRkMDICaNfUjwMpxnEGxwDydpIAllT6WK6fMUBitioDgqEfq9bW3h+n8pmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f/5HYAaD; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f/5HYAaD"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so1102453a12.0
        for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742302416; x=1742907216; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LhzANKisZhHd2hAcWJRLrRLq1GDpqDcD9VnDP57M2gs=;
        b=f/5HYAaDiD+X0UjfCgnh7uYpLs0UhDUgHE4Xd7NFfX0ZXlcjce0XkZSOVBNKuM4mlf
         7skMpMOIVnfrD1zLxkqBeprVVxX7BuQgfYtjFLkHi+vS4VdIjmn44PHsLV1/T5sgmOhS
         92VD4JEgoW5ACcublVzgp2bz8i6jYbdQVnHR4hTviFvnzqGAp/IQWx++cRLYuxQq64kO
         tKcWYsfWF0xWGxvo9V9jBHYNAkeayi48KI+Q5VnewDNPSxc5Xpp7crpO/dkN1JM3ECvK
         fxxDjryA87j/Oq04rgMnvEwZ47qskBDRKPIL9cYYrfRSnO29aKFZWMXFk4HRBgPC3li7
         nNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742302416; x=1742907216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhzANKisZhHd2hAcWJRLrRLq1GDpqDcD9VnDP57M2gs=;
        b=Zz8oa6DpmeTaswY8MYAXFwXCJA4f9VN8G60MqVavkak8CZqbdJ0kecZHS7NtJF4F6a
         Wj5VlMTd00iJh4MsB5T4T4Mi1TMqR655IXzI3DaGHQ/6HTxG+IgZtAiMx/qG/OU7LJhH
         smb5uxl3ozmZrMyOG/hDybeU9hMROQs6hZ2kNF3nu/3NcSEZG5X/iXKiB92NjFOugAUI
         5hokyKGJJgr3LRsk3iPUwt/qII3/APZkilZhpkmjkWMd0myw43y/UTL1EomAcbrEdRcl
         0munswaIihJvtxL22a4cPnXElZDHmgsYHmcYUyblk5XtCJLs5bN5b0q8kdFPAkyhDkwD
         az4g==
X-Forwarded-Encrypted: i=1; AJvYcCXiieC0UxHu6QWy+l6loPjckCeTWoivBdaX7A6YIuQ4fHj3V+p710uzb9p4RUbJIK+p3NyLMAJdxNlA@lists.linux.dev
X-Gm-Message-State: AOJu0YwFtiz2G9nMObXZhDHNS6Oo+JZxg1hgWjeGnTXzqR7rIpEGSQHX
	OZs/TiEVTItmz8E46AnDcIHQqhquOqYfuLvyqcRYCULzjGt8HBrNFtkbll7IqQU=
X-Gm-Gg: ASbGncuCALHlW9vM7//L8NwY+XhQcS2ujX3k3G+HoD/q7/cVNFI3w4rWhzglO1ztNcI
	B1N/2bGEXRLRCPfhdsAni7/irxFIoAeVX7V7PmNXj4lV/yjDc8/x/6p9fyo9XFa+A0w5u0JoxYZ
	yN13GBpMZTK35V2+7KzOJfAuAXDcWpm7sV2juLczo+ZOCCzHERKJcO8K6bDrl4pZxPv5o8RjyqW
	Kn2R++b+S5bRGUWnnvqKLJJk3Gb8uUbJoVL9tg3Jm/qav1ib4FNqGeCTWYqG4y0hD/DrtdWGf0w
	pPSZrmg9zFeln9ZFQ1dkuMUBl5TS0+U9hPuD9F3eswCS/dFecAlXC+8h8Cfj3y+Of/4t4JeieXa
	nKP+V0EM=
X-Google-Smtp-Source: AGHT+IEBCfLCqus3d0tcafDgPUq39lgi2xGioB5A0XeuOXf4DfkKor+o5UGRfhbyhM/0BaCyzhLxUg==
X-Received: by 2002:a05:6402:27cc:b0:5e6:1352:c53d with SMTP id 4fb4d7f45d1cf-5e8a0bf1f19mr17593137a12.28.1742302415819;
        Tue, 18 Mar 2025 05:53:35 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.143.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad38b4sm7932248a12.60.2025.03.18.05.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 05:53:35 -0700 (PDT)
Message-ID: <b6d132a7-b259-46f4-8bde-fc517bd9d294@suse.com>
Date: Tue, 18 Mar 2025 14:53:34 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] /dev/mem: Disable /dev/mem under TDX guest
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, x86@kernel.org,
 linux-kernel@vger.kernel.org, vannapurve@google.com,
 Elena Reshetova <elena.reshetova@intel.com>
References: <20250318113604.297726-1-nik.borisov@suse.com>
 <guatjzjzipzjzvj4oou2gktxmzileawshxmxj22hsa5kmet5g4@2rhf7tzaiytw>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <guatjzjzipzjzvj4oou2gktxmzileawshxmxj22hsa5kmet5g4@2rhf7tzaiytw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18.03.25 г. 14:23 ч., Kirill A. Shutemov wrote:
> On Tue, Mar 18, 2025 at 01:36:04PM +0200, Nikolay Borisov wrote:
>> If a piece of memory is read from /dev/mem that falls outside of the
>> System Ram region i.e bios data region the kernel creates a shared
>> mapping via xlate_dev_mem_ptr() (this behavior was introduced by
>> 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()"). This results
>> in a region having both a shared and a private mapping.
>>
>> Subsequent accesses to this region via the private mapping induce a
>> SEPT violation and a crash of the VMM.
> 
> Crash of VMM or TD termination? If VMM crashes in this case, it has to be
> fixed.

Went back through the bug reports and it seems this causes a SEPT 
violation inside the guest, which crashes, and is then re-created by 
GCP. So it would seem this causes an SEPT violation, rather than a VMM 
crash, my bad for mixing up the symptoms.

> 
>> In this particular case the
>> scenario was a userspace process reading something from the bios data
>> area at address 0x497 which creates a shared mapping, and a followup
>> reboot accessing __va(0x472) which access pfn 0 via the private mapping
>> causing mayhem.
> 
> I think it should lead to unrecoverable EPT-violation, but not VMM crash.

<nod> You are correct.

> 
>> Fix this by simply forbidding access to /dev/mem when running as an TDX
>> guest.
> 
> I think we need to think wider. What about applying a subset of LOCKDOWN_*
> in all coco guests by default. Many of them are relevant for the guest security.

How do you envision this to work, by introducing another 
CONFIG_LOCK_DOWN_KERNEL_FORCE_COCO or some such ? Will it be opt-in or 
mandatory?

Should we decide to follow the lockdown route this means the owner of 
the coco guest will have the ability to disable it and a misbehaving 
userspace process will still be able to induce an EPT violation.


> 



