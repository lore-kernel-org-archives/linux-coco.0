Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF2C2E175F
	for <linux-coco@lists.linux.dev>; Thu,  2 Jul 2026 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005993; cv=none; b=WW1tMDWs716HtXwJdldm+H+ivQaB+cmF4Dom7ZGF8qxCVmLvqbAUb2smJXdJ2XrR4fuxSGgVnh6S7dV8L/tgfRv8zUw7Ct7DOWtJTnGOnQOm8Vs3byjaz9XwzXWi0CYaJZwqavMaRW8WrGTSIYW7M1SNaldi05c3EueFYdPGs9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005993; c=relaxed/simple;
	bh=tWHidKVtsdwKRB5jdKGXevt8I4wrmUq/pKRcb+d/2LM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+4Gb2mx7HpJLGuD7bxEvGpAQFY6UDPHC4OEoud8kFeQcynDbcXt/FYFM5+dlAI9WbibqCgChp1nXJS6C7JuO1hYaeqmQ6lz3+yoBRfB/rC1kczt5Dgtezp3lX7MnW2E+7H52EeCHXguukjFckjZGR6apUS47/votuTbzovqkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=apEg+cwJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="apEg+cwJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b691cb44so14112155e9.0
        for <linux-coco@lists.linux.dev>; Thu, 02 Jul 2026 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783005990; x=1783610790; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GUA8gzuE5tCdaOiMzaRo5jxXpGPGq0X6g3CKwAZM4NQ=;
        b=apEg+cwJIXlSWfFdUWNTXT7a9YmqEgxpNtj+Y2vwup/bovBDZrW4FNeV4C0LZi9aJr
         WtncmLcbDVg/IRZpGba9S+5WxJ+BmMudllwZb0wfRD6dIUZr1hO1hf0Zo8yv/9FbFozC
         abeUsEFb8HSUjCoB33XZbUpdCZILey8xfiDQXz2L7i+4Xbi1Mik5EuR3Y6sxdQbsyxWS
         I7Vy9pGWPVGeh5Aq66OUS+0U99VvW8SfKfmLGaX4UQX2hbYsNuuCYmtvaccLvcYZ5YgC
         29+t7L/pdvAjvyEVJDb3pkM0Tsg4yOqpMTT2TjIGT/APpwlsHsVcmWVDaC2QAWzLkhNa
         hBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005990; x=1783610790;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUA8gzuE5tCdaOiMzaRo5jxXpGPGq0X6g3CKwAZM4NQ=;
        b=iJU8Lku+/Y691+Y4jv6BsuJi5lbAJbx+GLfxLMMaf3Z3CuP7ypBWGGvcr/qbUf5F0q
         B3FCzf5Cko3DDwi2V+RJYsKL7ddSmMfSFSefGbbDLJSUsPTEVz0saVi1UeKsemT23YVJ
         SyYWrsWBUB8lMzVpp1yrrBD7/Fg3OEC74o4ybCP/rspPK4edpI4mpkgr9hwnmEEzN76F
         xZpFRWKH24Fo/Tkaeeme8yy2Y8vE1u+FpXEyvXxe9r8DNphdTfRQVfiOpuvcy0Lzh7lg
         TFpG2nUVdXpFuGG9+oLaJDDeIm9neiAtSBJ3IsAegk1m4evWLYQw8djloxLksLi/3XH1
         VPLg==
X-Gm-Message-State: AOJu0YzlWNXYXpDalToUnah6Q31uj+pSNGu6LSm9CN+GvfCeUuaZ1Bbk
	OeuyVOv88lYoT8wRPr5VA+WG75DYO4gZUwCEV/uNw7mdIklj4UN/vFv5mYxDfffQmys=
X-Gm-Gg: AfdE7cnQfbeI3Nl8LDQYEOVRaBPuJQCnnBDJMPEGP3LDcNqszfF+TLQXthn8CeInAOt
	xkzdvzLFb3lDRJpVBPOabn2n6vNmiqtY9Ywg9/Q4M6AAeqULFFCWcJcLSYOD1brMJMi2ROm7cTM
	m3OTWlWlL9KsqdPDIWLC+WI9RTe0J759cMvva1kEQZXfprh0sOukgCsgh2Foek2OjVQHGAP8Jzl
	Lsgt6GruHIiTOfiAZ2ds1UNFVuGQObuHuudSXyKxZ+KpSxaNYlMiRJE9Th82MYPuXZxMrAmjFoF
	rDIPf39kfPgecOXUwaM8GqJfJXLDXi9lO7BdMOyN/lc5fgjI/DBFJpDohD6gMWqVC+mnpDfxUON
	flFKZXDRVTGyTzhcdUJuPSzXc0ldO6DNlY5C8YII2Nw/gTIWRT37H6h9ext0s2OkWsFcM7BPuMj
	9kbmES/lb0u5mZtMA=
X-Received: by 2002:a05:600c:6a98:b0:493:b307:6777 with SMTP id 5b1f17b1804b1-493c2b85665mr69863775e9.22.1783005990368;
        Thu, 02 Jul 2026 08:26:30 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.207.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6354926sm67312345e9.1.2026.07.02.08.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 08:26:29 -0700 (PDT)
Message-ID: <b5d0a554-4d2e-4338-918e-1251e697a309@suse.com>
Date: Thu, 2 Jul 2026 18:26:27 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/15] KVM: TDX: Add in-kernel Quote generation
To: Xu Yilun <yilun.xu@linux.intel.com>, kas@kernel.org, djbw@kernel.org,
 rick.p.edgecombe@intel.com, x86@kernel.org, peter.fang@intel.com
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, sohil.mehta@intel.com, yilun.xu@intel.com,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, xiaoyao.li@intel.com
References: <20260522034128.3144354-1-yilun.xu@linux.intel.com>
 <20260522034128.3144354-13-yilun.xu@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
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
In-Reply-To: <20260522034128.3144354-13-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/22/26 06:41, Xu Yilun wrote:
> From: Peter Fang <peter.fang@intel.com>
> 
> Provide an in-kernel path for TDX Quote generation when handling
> TDG.VP.VMCALL<GetQuote>, without requiring an exit to userspace.
> 
> Use the core TDX API when the TDX Quoting extension is available. For
> simplicity, each KVM guest checks for availability only once during
> initialization. KVM does not handle Quoting service disruptions.

I think calling this in-kernel quote generation vs user-spcae quote 
generation is misleading. Rather the distinction is : quote via the vmm 
or a quote generated by the tdx module/tdx extension. I think this 
should be the level at which the distinction is made.


i.e tdx_get_quote_vmm vs tdx_get_quote_ext or some along those lines.


<snip>
