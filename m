Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50B34D3A9
	for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136382; cv=none; b=HQYEGvmsfDcWhBEx/0qss6r4NcuCNfkRYt85EQGsepb0wYI7T1MPoDNOieJCgyBiEIdgPWzlCAgGEBQ27p1m0vCGQaUf8TDOEnsTYnLZ+LeekLUnEkX8PUMVHWkRsOnPwsyviwQllktzu5tABPUAk3c/yOQ5e00oFTt3FCybz1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136382; c=relaxed/simple;
	bh=RdbirBWYX7sNyIj8WSzd11HMEpVwU2+BkQJY4Q0YWtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oU5jtlfKneHsdnXSyKg4+L1ZlbE8Mu6i0zsvmcBtn7gxhjEkHa17PSNPgGdZ7YS8MtwzmJOoYJjwAarSqREikyPtrwE6gSbsqf7Ca7VdQlPxTdk2V+juv5U6N7pSR8BZO9/7zOmbRkp5ipElxDgAUO3q421NoBW/vb2mcKlJDYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RYmCtNCS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RYmCtNCS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-485850cbac3so515112f8f.3
        for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789136378; x=1789741178; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6hnv8O1xw7ekzGvC2FPdD9AdkT/ogM2zSs20k4lb0U=;
        b=RYmCtNCS7YfwYo9Hum8uJ87R2q3lcaap5pNQFd5xpMiB+3bI3eKd/yx4u4NG/Nb4ti
         zapbpaiS77QKSx2sE8OT34zUqVY2+uZC6i72vjSXh5ZKu+N0Jl27rcPCkS9SV8bOcpL/
         nBHjkEnnbVEv+j92NXJ83Ic/hcAEMMdnj/o69KsdT3jpay7fEuIPtzRllUi7YxYOkQyO
         76HnXhvBiHo2t9crnkVu86578Rlxe5Jj9U1umGEMkSr30PxebWxAFDMeaxwD6vciOqlY
         ynZJ6dIg7GtUV1KLYwfxkGF8puaqxPLfCALKG+9VfsqDy9wW30buEDln9JCbCRTtvGkE
         7oPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136378; x=1789741178;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6hnv8O1xw7ekzGvC2FPdD9AdkT/ogM2zSs20k4lb0U=;
        b=MkPnlCpNTNatJI/OibpJ2af3b9HOi7htBPhyV0ff9aHcRPTpwPmmQXto59Zt7+6qjH
         O24xVx/wdkrtlUlHSbN3WGHL9qTJQYxH0LPJl0XEcJfHO4pAaq/HEBcHBm3Qcv32ON4V
         w80gEfaWvztFYvexH3S5qRIGvDMaKTkECG1/nkPQj/8VJgYfP9v/AN+3vtzxV4FRCu1E
         Swzv32Nj3MlIcm+KxHUIS7h/wlUIiKH9AbHY/rpLvTFhRNvl5eaVR3/IZ5Vgh57a8V9l
         s4KGaaeE4/tVlCzhPTIDf8GRamAE3+2a9sGqjAvhSL0L9ES9iTqscUEE3dgYDfNbPPjh
         M6lw==
X-Forwarded-Encrypted: i=1; AKwUvBy/V+Xb5OF1btOiOisYPBkDtoONXJl8+QmJ8QOBTNnpedbHQ35JzdhOmjyqFsb9kzkM/bG590mVEVM0@lists.linux.dev
X-Gm-Message-State: AFuF++lw3B++ux6LIffL/fmT2uAUE90F1xXj0J7GimId622vx/TvJ2xz
	xuL/9+b7Lhg6rnSHbrwqqYeWMs1oXY9eS2DKhzfEBr+7yByiFbwHObn+yHWwCwAFSAcyLDGmANE
	M6inHYTI=
X-Gm-Gg: AYBFou0IR7cAuTpBtEBteOr01qNXLJcGutGMH9mJTf1hsglq5hkqOkSvIAEULOxe14O
	4Hx1/R3XasslM78+bdh8pHvXjUBTkJsZVFWL5M91lYJX6WRDQSire6/QQp6w1E7JHZaKyIUmrJg
	cYUQp48KWr3R6Xu6wovXQOXWaOLOvic74FTt3umFDVbSYEyn7786rat9bNgYr3V2rdcmOd5YCFI
	J7oSJmo3nOzTR7pPifP8fFp1U2PDyyxuz63NOWKwMoseAPOoq431RivoPuCCYjIXSBb1Om+ZI25
	+vNUOcN2tWiULG7KAgd7lfsI4CS3dM6275aRCHr4Qeyf+fP8OCTdVxKnQeg7VCd2619fHOyParQ
	MrYoGQ4q8yA/l2hCkxbsm8ptyz1/E5DwnJBk5PkCmkyIFCzwzvqaqBfoVRdXghjboez0dXosMy7
	z1686fRPyoWAFZZjBw0da/KiOi2pswuVL6ap6zoUjdkBF334PVYrveJX6OHCf3htWfiRYHqT6/M
	cfJO0iSeQbEWnUXaRlZLVIhseKIzmAv08U=
X-Received: by 2002:a05:600d:864d:10b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49e61983764mr38948985e9.2.1789136378142;
        Fri, 11 Sep 2026 07:19:38 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a32803sm62285545e9.0.2026.09.11.07.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:19:37 -0700 (PDT)
Message-ID: <ac14f791-93aa-4390-a0ed-d27687141b04@suse.com>
Date: Fri, 11 Sep 2026 17:19:36 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tdx: Harden exports
To: Xiaoyao Li <xiaoyao.li@intel.com>, dave.hansen@linux.intel.com
Cc: x86@kernel.org, rick.p.edgecombe@intel.com, seanjc@google.com,
 linux-coco@lists.linux.dev, binbin.wu@linux.intel.com,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 "Fang, Peter" <peter.fang@intel.com>
References: <20260911113150.1022344-2-nik.borisov@suse.com>
 <bd287f7d-bd80-43d1-8a52-343242233b2a@intel.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
Autocrypt: addr=nik.borisov@suse.com; keydata=
 xsFNBGcrpvIBEAD5cAR5+qu30GnmPrK9veWX5RVzzbgtkk9C/EESHy9Yz0+HWgCVRoNyRQsZ
 7DW7vE1KhioDLXjDmeu8/0A8u5nFMqv6d1Gt1lb7XzSAYw7uSWXLPEjFBtz9+fBJJLgbYU7G
 OpTKy6gRr6GaItZze+r04PGWjeyVUuHZuncTO7B2huxcwIk9tFtRX21gVSOOC96HcxSVVA7X
 N/LLM2EOL7kg4/yDWEhAdLQDChswhmdpHkp5g6ytj9TM8bNlq9I41hl/3cBEeAkxtb/eS5YR
 88LBb/2FkcGnhxkGJPNB+4Siku7K8Mk2Y6elnkOctJcDvk29DajYbQnnW4nhfelZuLNupb1O
 M0912EvzOVI0dIVgR+xtosp66bYTOpX4Xb0fylED9kYGiuEAeoQZaDQ2eICDcHPiaLzh+6cc
 pkVTB0sXkWHUsPamtPum6/PgWLE9vGI5s+FaqBaqBYDKyvtJfLK4BdZng0Uc3ijycPs3bpbQ
 bOnK9LD8TYmYaeTenoNILQ7Ut54CCEXkP446skUMKrEo/HabvkykyWqWiIE/UlAYAx9+Ckho
 TT1d2QsmsAiYYWwjU8igXBecIbC0uRtF/cTfelNGrQwbICUT6kJjcOTpQDaVyIgRSlUMrlNZ
 XPVEQ6Zq3/aENA8ObhFxE5PLJPizJH6SC89BMKF3zg6SKx0qzQARAQABzSZOaWtvbGF5IEJv
 cmlzb3YgPG5pay5ib3Jpc292QHN1c2UuY29tPsLBkQQTAQoAOxYhBDuWB8EJLBUZCPjT3SRn
 XZEnyhfsBQJnK6byAhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJECRnXZEnyhfs
 XbIQAJxuUnelGdXbSbtovBNm+HF3LtT0XnZ0+DoR0DemUGuA1bZAlaOXGr5mvVbTgaoGUQIJ
 3Ejx3UBEG7ZSJcfJobB34w1qHEDO0pN9orGIFT9Bic3lqhawD2r85QMcWwjsZH5FhyRx7P2o
 DTuUClLMO95GuHYQngBF2rHHl8QMJPVKsR18w4IWAhALpEApxa3luyV7pAAqKllfCNt7tmed
 uKmclf/Sz6qoP75CvEtRbfAOqYgG1Uk9A62C51iAPe35neMre3WGLsdgyMj4/15jPYi+tOUX
 Tc7AAWgc95LXyPJo8069MOU73htZmgH4OYy+S7f+ArXD7h8lTLT1niff2bCPi6eiAQq6b5CJ
 Ka4/27IiZo8tm1XjLYmoBmaCovqx5y5Xt2koibIWG3ZGD2I+qRwZ0UohKRH6kKVHGcrmCv0J
 YO8yIprxgoYmA7gq21BpTqw3D4+8xujn/6LgndLKmGESM1FuY3ymXgj5983eqaxicKpT9iq8
 /a1j31tms4azR7+6Dt8H4SagfN6VbJ0luPzobrrNFxUgpjR4ZyQQ++G7oSRdwjfIh1wuCF6/
 mDUNcb6/kA0JS9otiC3omfht47yQnvod+MxFk1lTNUu3hePJUwg1vT1te3vO5oln8lkUo9BU
 knlYpQ7QA2rDEKs+YWqUstr4pDtHzwQ6mo0rqP+zzsFNBGcrpvIBEADGYTFkNVttZkt6e7yA
 LNkv3Q39zQCt8qe7qkPdlj3CqygVXfw+h7GlcT9fuc4kd7YxFys4/Wd9icj9ZatGMwffONmi
 LnUotIq2N7+xvc4Xu76wv+QJpiuGEfCDB+VdZOmOzUPlmMkcJc/EDSH4qGogIYRu72uweKEq
 VfBI43PZIGpGJ7TjS3THX5WVI2YNSmuwqxnQF/iVqDtD2N72ObkBwIf9GnrOgxEyJ/SQq2R0
 g7hd6IYk7SOKt1a8ZGCN6hXXKzmM6gHRC8fyWeTqJcK4BKSdX8PzEuYmAJjSfx4w6DoxdK5/
 9sVrNzaVgDHS0ThH/5kNkZ65KNR7K2nk45LT5Crjbg7w5/kKDY6/XiXDx7v/BOR/a+Ryo+lM
 MffN3XSnAex8cmIhNINl5Z8CAvDLUtItLcbDOv7hdXt6DSyb65CdyY8JwOt6CWno1tdjyDEG
 5ANwVPYY878IFkOJLRTJuUd5ltybaSWjKIwjYJfIXuoyzE7OL63856MC/Os8PcLfY7vYY2LB
 cvKH1qOcs+an86DWX17+dkcKD/YLrpzwvRMur5+kTgVfXcC0TAl39N4YtaCKM/3ugAaVS1Mw
 MrbyGnGqVMqlCpjnpYREzapSk8XxbO2kYRsZQd8J9ei98OSqgPf8xM7NCULd/xaZLJUydql1
 JdSREId2C15jut21aQARAQABwsF2BBgBCgAgFiEEO5YHwQksFRkI+NPdJGddkSfKF+wFAmcr
 pvICGwwACgkQJGddkSfKF+xuuxAA4F9iQc61wvAOAidktv4Rztn4QKy8TAyGN3M8zYf/A5Zx
 VcGgX4J4MhRUoPQNrzmVlrrtE2KILHxQZx5eQyPgixPXri42oG5ePEXZoLU5GFRYSPjjTYmP
 ypyTPN7uoWLfw4TxJqWCGRLsjnkwvyN3R4161Dty4Uhzqp1IkNhl3ifTDYEvbnmHaNvlvvna
 7+9jjEBDEFYDMuO/CA8UtoVQXjy5gtOhZZkEsptfwQYc+E9U99yxGofDul7xH41VdXGpIhUj
 4wjd3IbgaCiHxxj/M9eM99ybu5asvHyMo3EFPkyWxZsBlUN/riFXGspG4sT0cwOUhG2ZnExv
 XXhOGKs/y3VGhjZeCDWZ+0ZQHPCL3HUebLxW49wwLxvXU6sLNfYnTJxdqn58Aq4sBXW5Un0Q
 vfbd9VFV/bKFfvUscYk2UKPi9vgn1hY38IfmsnoS8b0uwDq75IBvup9pYFyNyPf5SutxhFfP
 JDjakbdjBoYDWVoaPbp5KAQ2VQRiR54lir/inyqGX+dwzPX/F4OHfB5RTiAFLJliCxniKFsM
 d8eHe88jWjm6/ilx4IlLl9/MdVUGjLpBi18X7ejLz3U2quYD8DBAGzCjy49wJ4Di4qQjblb2
 pTXoEyM2L6E604NbDu0VDvHg7EXh1WwmijEu28c/hEB6DwtzslLpBSsJV0s1/jE=
In-Reply-To: <bd287f7d-bd80-43d1-8a52-343242233b2a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11.09.26 г. 16:01 ч., Xiaoyao Li wrote:
> + Peter,
> 
> On 9/11/2026 7:31 PM, Nikolay Borisov wrote:
>> tdx_* function aren't supposed to be used by the kernel at large, rather
>> they are mostly used by KVM and a very small number of them are exposed
>> via the tdx-guest/tdx-host drivers. Reflect this fact in their
>> EXPORT_SYMBOL* declarations.
> 
> we found this and discussed it in [1]. It was left to Peter's todo list.
> Glad to see you do it earlier.
> 
> [1] https://lore.kernel.org/all/cdb43316-6535-4f11-9fb0-abdf2adf4568@intel.com/
> 
>> Reported-by: Michal Koutný <mkoutny@suse.com>
>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>> ---
>>   arch/x86/coco/tdx/tdx.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
>> index f904a636d449..3055a76c0dfd 100644
>> --- a/arch/x86/coco/tdx/tdx.c
>> +++ b/arch/x86/coco/tdx/tdx.c
>> @@ -64,7 +64,7 @@ long tdx_kvm_hypercall(unsigned int nr, unsigned long p1, unsigned long p2,
>>   
>>   	return __tdx_hypercall(&args);
>>   }
>> -EXPORT_SYMBOL_GPL(tdx_kvm_hypercall);
>> +EXPORT_SYMBOL_FOR_KVM(tdx_kvm_hypercall);
> 
> tdx_kvm_hypecall() is used by kvm_hypercall{0,1,2,3,4}, which are not used by
> KVM modules, but used by guest kernel code when running as a KVM guest.
> 
> It seems the reason we need to export is kvm_arch_ptp_init() calls
> kvm_hypercall2() and kvm_arch_ptp_init() can be called by guest-side PTP module.


So what do you suggest the correct export is?

> 
>>   #endif
>>   
>>   /*
>> @@ -139,7 +139,7 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
>>   
>>   	return 0;
>>   }
>> -EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
>> +EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_get_report0, "tdx-guest");
>>   
>>   /**
>>    * tdx_mcall_extend_rtmr() - Wrapper to extend RTMR registers using
>> @@ -175,7 +175,7 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data)
>>   
>>   	return 0;
>>   }
>> -EXPORT_SYMBOL_GPL(tdx_mcall_extend_rtmr);
>> +EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_extend_rtmr, "tdx-guest");
>>   
>>   /**
>>    * tdx_hcall_get_quote() - Wrapper to request TD Quote using GetQuote
>> @@ -196,7 +196,7 @@ u64 tdx_hcall_get_quote(u8 *buf, size_t size)
>>   	/* Since buf is a shared memory, set the shared (decrypted) bits */
>>   	return _tdx_hypercall(TDVMCALL_GET_QUOTE, cc_mkdec(virt_to_phys(buf)), size, 0, 0);
>>   }
>> -EXPORT_SYMBOL_GPL(tdx_hcall_get_quote);
>> +EXPORT_SYMBOL_FOR_MODULES(tdx_hcall_get_quote, "tdx-guest");
>>   
>>   static void __noreturn tdx_panic(const char *msg)
>>   {
> 

