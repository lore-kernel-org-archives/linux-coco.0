Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA340839EB
	for <linux-coco@lists.linux.dev>; Sat, 29 Jun 2024 16:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719679814; cv=none; b=bqW9UhmIwUhFEOMikeQl+11easI7FlPQPxv4c2mPRjSsFGh1Ogk+A9HcLd3VL/GUc3dSo3qdlFbfi4JmEgl8jej85riikP7rvy9FDR3BtjYKh0dwN8mGsfiwKPBFO3ady+sbgyrSPHUTe1awTvjdS3xLZ+wMypAWs3Cw6r0MBCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719679814; c=relaxed/simple;
	bh=10oL9AMvuLwwVtCMC7BHvX1JE4xKZn3dswe8y+fUP6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JuZxGoJuHG60CZr7C5yVDXwNgcIadmnWuXzjFNi0i0YttE+pgwj72CABCeqrPXLUutcHly763ezyMUuEtEhIjP4R+OMKpakdXjxGJhPMrUaR8PHuPCj+FnkU4GQV8lxpqFrZ6S+RvvwdRxkR35hZn6NtFV7rC8u+DrHzWBNCP80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ACK66vW1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ACK66vW1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a724b4f1218so217506166b.2
        for <linux-coco@lists.linux.dev>; Sat, 29 Jun 2024 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719679810; x=1720284610; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBMDt+8jA08q/p80DdkymHwXPRFldtei4zyGks2eOfY=;
        b=ACK66vW1MRXYntX9YB2gEPOHWWpInygyqiIKOJtGcSL+Up+CM8BYt/YP3XPZVKUc+S
         QKVHsYug7/U78PDVFeJuwy2j/VrxSrAbFjiJsFsh5f6CyHmhbHtEgrI+KhIEyxL4kJ/K
         uZ7xw7xMoHPCud7cJNigheknr0lqBAqQ4sSnUK+fZKH/x/xx0h35n/W5wmnfSOToOZjK
         yeMjOvoYjDLfzhWlLRNopi3eBw5uMpPmk8/n/z7cplVsksGQdP8HC2wu9zzv4sliMpGD
         GLVW5W+DRn4AGWg2Dv4EQ/11QcF7fhnU1pU9T9LM0fF1Oi+5LsrTr+r3BRq4RKDjvFqU
         BtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719679810; x=1720284610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lBMDt+8jA08q/p80DdkymHwXPRFldtei4zyGks2eOfY=;
        b=SzN1hFpEvVCwtBXunxIsXKvRrHTrPIa9hybIQ/7DlIoocmRUxSDQ7Xt/tI4X7xkUOF
         RLzE1WWcNQG5CKjzGpj59bEYrBevUU6v8ISDww8eyiCfKgveHoND3VtPz2zZZjo+W2vy
         TySsEOgPH2NxGPfi9y7CO0DEQ05yhZS/1TkDZYUxT8TF2LbxX6BWZYH1I4f4a6sPigvE
         Wff91z1Sn8ym4EHL114UKEh1rtZi5ClVzR/57rIfuvkT1fmqSDv02Ano2xw8K0zEn5jR
         PdQ4USM/HDOqaZlohWedob0Pf+3LdVM+MErB/Bqlpo/Qw4l6rwjs96fMNV12stuGvlS4
         /UTw==
X-Forwarded-Encrypted: i=1; AJvYcCVADcbI7CGJJsiOGy4h/fSbA48OFR6tuskrxxtw6FWFwsGhkWsWOgz3cMRU9PehO1/sc3blCuGNHWfG8eYB0hqhqBUX5kAc8NVQ1w==
X-Gm-Message-State: AOJu0YwU5VYqari5E4L1KnC4U6NwyVh25MfVI36xYw1lhqwXcOxvlRYh
	G57q7BWNuvhStu1V2UZedO+SZr6tyXOTUiMKNAsvG6J/igGwAqn4+vuPvFEhCck=
X-Google-Smtp-Source: AGHT+IHvwR+S0H8B75vhf9qeQ+kHGKTeTw4A/GkQ/c76b/iFHFfjBt3yzq6qn6cYazPMr6u5gUJHbA==
X-Received: by 2002:a17:906:5619:b0:a6f:4fc8:265f with SMTP id a640c23a62f3a-a751442416cmr83177266b.42.1719679810081;
        Sat, 29 Jun 2024 09:50:10 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2? (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de. [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab065667sm176551266b.114.2024.06.29.09.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 09:50:09 -0700 (PDT)
Message-ID: <5e6f2c81-f33b-4a66-b12e-91c88ae2307d@suse.com>
Date: Sat, 29 Jun 2024 18:50:08 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: fix lookup_address() to handle physical memory
 holes in direct mapping
To: Tom Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <Ashish.Kalra@amd.com>, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de
Cc: x86@kernel.org, hpa@zytor.com, kirill.shutemov@linux.intel.com,
 rick.p.edgecombe@intel.com, mhklinux@outlook.com, peterx@redhat.com,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, jroedel@suse.de
References: <20240628205229.193800-1-Ashish.Kalra@amd.com>
 <2982a4f2-ea8f-4fa4-81ea-d73c00fc2ad0@suse.com>
 <76d96581-202c-80ce-eb26-8f906660c8e0@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <76d96581-202c-80ce-eb26-8f906660c8e0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.06.24 17:16, Tom Lendacky wrote:
> On 6/29/24 05:20, Jürgen Groß wrote:
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
> 
> This brings up a point from my other reply. The comment says that it
> returns "the effective NX and RW bits of all page table levels", but in
> fact NX and RW are not updated for the PTE. Since the comment says all
> page table levels, shouldn't they be updated with the PTE values, too?

Hmm, the comment could need some clarifications.

It returns the effective NX and RW bits of the levels above the PTE. Reason is
that the function is used in case the NX/RW bits of a PTE are updated, so the
PTE settings are not always really important.


Juergen
