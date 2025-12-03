Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5330D2F0C7D
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 13:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769744; cv=none; b=k4fxJWRgrEpZKTAOEH8t9EiVes9LExj06FZ8UpfVeUgV5s2nfjIuyCeW1F3F3XzjR8IDU3eknbZmxo0Nk7Tnb1zQwHdb6HJh3hQvSgv++/X45yrp1kah4tlgrFWWSqwnUBiHUL/eayiWqE0Jy6FyQmPDeMil98tIFmwx+W6DzlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769744; c=relaxed/simple;
	bh=jmr9CMhPNuIwLusGsK+Icdbl7+fFM9A6NnpePj3yJo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmk57egRWlpsH/dQ4vWcK/ThQ8onZRHxkFqQ40CngbNL0opjMzttg21/btstkl5ePiC/wWAzg7TDxFB1tloyw1hCRxZF+AKv14WTUBbg12ATdAMbxJimbTIXFBD9TOhzVrxXVVHvRctzXKYZQq0G+jiq9tQ4kHqCAgLYbIgrFsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NQsdyNXA; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NQsdyNXA"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso10289308a12.3
        for <linux-coco@lists.linux.dev>; Wed, 03 Dec 2025 05:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764769740; x=1765374540; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OP/1yrwUeq+oZ+kPLHWhUXAOqFCK1RgwC5hRZX13SR8=;
        b=NQsdyNXA09Geb7AC2AnlAtSsHJY5Kgs9uHOBk/Xwttllha6090F23eG6q9ijOjtAdH
         HT+5opwDJJuSTyZ1YdBZWBK3YDq7pl6IIj3Z2+27ueRapaICjUqhBC1T835VJhYolzvC
         N7A0VNThjDOpVAffx1UHjLiO9Ss6ph+L9g2wywNoX+4AcGRICnhVD63BxR1qPQsfPs4L
         dksfLtRHomLBKgiqGif+qUj5CPrwIDqfMv9o0wm+WEU12act6x+1PVd6noBfb2mjTtod
         vPdyZBXSwmbhE0ZiR4xZEXMqK6TjUoc2io0PIDmfrnLK3JjQauxVSXYeJKMaUHbPQqCK
         u0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764769740; x=1765374540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP/1yrwUeq+oZ+kPLHWhUXAOqFCK1RgwC5hRZX13SR8=;
        b=r5ZHEXJd4f9n8OWYgt0gLIugvnnkIqkPofUfBr6CAVUMpnkNn5DBbukXpsNnl1vF97
         idXoR02RWaGdQ/twOwzqK84TZrTEwpZLIEZJ0ZDFhfsd1j+bAUvBjvDsdUWK74a4zjTH
         7xb7cDa/UqbYvC0DAInVVMlt6CaNRbLst86g3GC0NLmB5cAj1pRDyB4Uq/Cqzu0DfZzw
         sBj/yhlDJvi04munJEeTOV+sh6ZK+goFGjhDTkwLTF8v//gshyFu3wOO6c7vTHYNIWcp
         AH5dN2xd+4slGCX8LA0zGFLVNByr4jB7M5E2dB9FkF4Mg5Rk5slGHqfO5Wjy3W/hqme+
         QidQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMN/arH6EJKszYdPbqX/BEZ3uyjGwByPAe6Bxki2d5FmMWM5JuF5W73Cg5u+TG3ssM5piMjJv72PF4@lists.linux.dev
X-Gm-Message-State: AOJu0YwxRPjRzUK00d1z0N0n5qtnPVHf19c3pJPacZhwx9zLT32IwjlM
	h9XhS3l6nHTjul1hFi2dzZ352jOXiBODkz7aiEgic8i0yB5ouw0QDBOrh0eAKPyAH74=
X-Gm-Gg: ASbGnctmXsL6ghwFCp/g4BGn0HPvu03ZNLt926dNgc3Ptkv6TXzQMQKxabZ2MwQmp1k
	LadTuq7CxdKSlSvz9xDckQTr1TpR6M5qGxX8HPoNDm2wLB3DlLwtSPjV+RCUk6E5SnaFHysOb1q
	xan5nusPxt93AR75PjT//AaqDQL7unGeDpjylDyvQYrdPPTOAFmIlJt4AmG3bjtgwnEIS4kOx7I
	ihKa10BLlAeOZWbpYIclUWGfLkIcvY5XKeYxx8md/Naqa0pDgx06VSKZHYk8kEeaXbTAkdq3wkG
	jk3xCdQplV41Nsws9f8EluXHB36Ou5fjzxVQG6hC0+kT2DOB6W08par5qtqZxLUeWbPo4WxI9kf
	RAppvk17mTIzEmkihFQj+lrWizZ75hOcVDnVuFHu4pOYmsJ7MUmf8/pdjIqldY7UcOrsHs9XTd5
	gQOcIjeCr/nnyXJp6FbZ1nRZB3N87ih4LEA2fmKg==
X-Google-Smtp-Source: AGHT+IEG5FQk+PE9WK0CW5uSQerVP7kEeZ4logANfkeZP+oIZv8G0KQKZdHIZ2BXgUv2JPICmb+fnw==
X-Received: by 2002:a05:6402:254b:b0:640:b31a:8439 with SMTP id 4fb4d7f45d1cf-6479c415686mr2167018a12.12.1764769739612;
        Wed, 03 Dec 2025 05:48:59 -0800 (PST)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.139.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510508e1sm18495343a12.27.2025.12.03.05.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 05:48:59 -0800 (PST)
Message-ID: <89d5876f-625b-43a6-bcad-d8caa4cbda2b@suse.com>
Date: Wed, 3 Dec 2025 15:48:57 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/16] x86/virt/tdx: Add tdx_alloc/free_page() helpers
To: Kiryl Shutsemau <kas@kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "Huang, Kai" <kai.huang@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "Hansen, Dave" <dave.hansen@intel.com>, "Zhao, Yan Y"
 <yan.y.zhao@intel.com>, "Wu, Binbin" <binbin.wu@intel.com>,
 "seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
 <mingo@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Annapurve, Vishal" <vannapurve@google.com>, "Gao, Chao"
 <chao.gao@intel.com>, "bp@alien8.de" <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
 <20251121005125.417831-8-rick.p.edgecombe@intel.com>
 <dde56556-7611-4adf-9015-5bdf1a016786@suse.com>
 <730de4be289ed7e3550d40170ea7d67e5d37458f.camel@intel.com>
 <f080efe3-6bf4-4631-9018-2dbf546c25fb@suse.com>
 <0274cee22d90cbfd2b26c52b864cde6dba04fc60.camel@intel.com>
 <7xbqq2uplwkc36q6jyorxe6u3fboka3snwar6parado5ysz25o@qrstyzh3okgh>
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
In-Reply-To: <7xbqq2uplwkc36q6jyorxe6u3fboka3snwar6parado5ysz25o@qrstyzh3okgh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3.12.25 г. 15:46 ч., Kiryl Shutsemau wrote:
> On Tue, Dec 02, 2025 at 08:02:38PM +0000, Edgecombe, Rick P wrote:
>> On Tue, 2025-12-02 at 09:38 +0200, Nikolay Borisov wrote:
>>>> Yea, it could be simpler if it was always guaranteed to be 2 pages. But it
>>>> was
>>>> my understanding that it would not be a fixed size. Can you point to what
>>>> docs
>>>> makes you think that?
>>>
>>> Looking at the PHYMEM.PAMT.ADD ABI spec the pages being added are always
>>> put into pair in rdx/r8. So e.g. looking into tdh_phymem_pamt_add rcx is
>>> set to a 2mb page, and subsequently we have the memcpy which simply sets
>>> the rdx/r8 input argument registers, no ? Or am I misunderstanding the
>>> code?
>>
>> Hmm, you are totally right. The docs specify the size of the 4k entries, but
>> doesn't specify that Dynamic PAMT is supposed to provide larger sizes in the
>> other registers. A reasonable reading could assume 2 pages always, and the usage
>> of the other registers seems like an assumption.
>>
>> Kirill, any history here?
> 
> There was a plan to future prove DPAMT by allowing PAMT descriptor to
> grow in the future. The concrete approach was not settled last time I
> checked. This code was my attempt to accommodate it. I don't know if it
> fits the current plan.
> 

Considering this, I'd opt for the simplest possible approach that works 
_now_. If in the future there are changes to the ABI let's introduce 
them incrementally when their time comes.
