Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582403;
	b=vX0PO/aPbJz34DhDKf2QBgwKHmaIwV/ceYzf9CsCdPNW3eSFyBXQaAQVpgGYYNHsvMBN
	 6afPSJoeInKfajMH9rznH16KQMpEolkfqQ7s1wGW5tYvbNrXGMerM6w40QBmpsO6o7die
	 9nK/xFA9RhQAne9AdMKlzJaUdvMhJwwSoqaKVe/Kf37sikcbGIdyIRke2MZI++JTWj0Gs
	 OeUJUA6vUqf9mt+S0ItI+jbzZB+1m9/n4ab/ERs7XVo69IQhuEh6HY3mP9KcHpS3Swg6p
	 XZp2kQYNhWV14LJ/FvyTU1Ywypz5LYIFge5WtNHVZ3SHhaBpucpQRmopPE8JSIOSLDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WRbE/ClC4DCa25YOZgoiuOw+fWtwtLO81F/+SZ+7Q48=;
	b=StIIcW7rkRQsWEJ6G9LT4YTfmTET55evUOy2zPaBXU6y7oaFFswaGSV2MxZVM66v6uBe
	 4elYXBUVQPJ0HxT4ACA5C0CivAqq07ZjyKtmT5WBYZukhDWfLM4HVgekl5AIR6U6Jdd30
	 DsaUTmpJDJ1t476S4ZBSwgZfk3YCOjCn19YfHiJ5kMKz8WrqTfWF5HtmtX/UchWH6NU90
	 BJIoZYn/deiShcynCOkyQobfJjpPRbCnZFssKpArb4QBAobMmfk37bK0zEIOjKN+BmjUJ
	 tOWOXnZmaj2joyPIwHaSddGVw4sXgRnQ1w908C+SqX+R6XEi6cARC9dtrfcd7FtWr2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="ITNY/ajh";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE8D606A8A4
	for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 15:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE8D606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ITNY/ajh
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so17540585e9.3
        for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 07:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794582402; x=1795187202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WRbE/ClC4DCa25YOZgoiuOw+fWtwtLO81F/+SZ+7Q48=;
        b=ITNY/ajhLnevgFkXKwKlqrMfrtsPFOYb4qZKRptN5T9/CIoJacxpqbIaG42uzWq2BP
         ttwjrV4AgFM+u7YQvzyE6mBlttiiMbh2SQHxVwwBCFnO+2/pUa5QlrQrKQHdgeRWadHS
         ikSmAMg8CErL5mMdiRqm4tW92vKeLewcFHm2avuOLqgwYPyHvfMG1P3FjLkgBiF0gJDG
         sj0xCblMa3ppe1aX4HHSNZKAhNrdVtumYlIapo/QoO933Z4DDzgdfeCH7G2Tyb1Tb8Iq
         SY2LF8rlLjjSTdF4FdSMhKNmDabUu2mbKHojZPyf6R9NMdmcOD2FIJbY91tksraqqs5c
         nL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582402; x=1795187202;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WRbE/ClC4DCa25YOZgoiuOw+fWtwtLO81F/+SZ+7Q48=;
        b=vZrHNFpyUiy8B6KKYRhcLpdL3BBN3rgaZU25aPXDNv06/yOd1p+dwQfOWCeBDBfoOH
         3yEEy+9VcumyUW7lPHvG98QkA3xznORPdHyXp1JN46+HLno5ydWWPItbXMofDHfMtYMl
         AYDBddvab5gmpgRKbalE9XngzMrdzAIxCqfHdO/rfIhUimOWR18YYzZshZaktjb8yFlC
         NKTx0Gi/8pCmxX4/vWeBkJZm4UosHWDzYltfN+xR4d+5oTrrmU5zQBh555vTP3Sx675J
         fTkTlKatd/S1y361AMpgHz85KxhTHXJJV9pR4ZUJ3PRkzS11T89dYpjYXZSLSSJdhIzd
         Ra8g==
X-Forwarded-Encrypted: i=1; AL+hErGx7x7ffA01ca4cTpkX+HlgF9mvBzcIB9WxKAW9sko/LBAU4Y/byayNX5FCTh0PtSeMrQ2r2OOCM+jO@lists.linux.dev
X-Gm-Message-State: APuU4Z8mSODapmRczMvWt2Ex4cZJCu5ZqaG++tf1PUzUDxTF+BJ1xLnN
	dOhk4Xqe5Vy0h0gPnPLj/lEurzyEr3mLSMN7FEtRyKg/Z08LGKLfEbnc2rtttIQIAGo=
X-Gm-Gg: AYBFou07tMNZKi0PHY0+ZUbBVleS7P8f6HKMHtYovEIg0rKR9npmnHbYIJijYgyvfop
	rXAVCPTMEuGdaL/+Z9yDkegRijMSqxho3nSlDTS9v7BlJhpndcp5j1DUrnq32CdbueCTfiyRgrZ
	YZ1RvAnmBkO1Ne+pNoi5A/EGDawURKEbSTW9NIw92h2Fs+3zsqi6PmzRXViwCiKvwtszWWuw2l6
	APeg/kBuxw9k3r2oPS94TLiZ9GrCqLUgSbaaTxngfRNmdYXsKdWq6Z9ji7/Gju8DTodUQAhYhcj
	UO1bYLsUvkzojmPcMlr+dJYzD0otiQWOOkkUiSQ8gqFLKKurKE4uS8BwELAYUPA+v2lom31NXB7
	3fsgiJ/5BsGwia7KG2VCEAEwQRbdiqzuQEOzz07GdBa2atHNU/6M6YL7Vhherem4/dzYCzMuhS3
	6otgAyF+HifyPqpwWjJiz0wlnthoeXFZk3xvE2dfhCZF48G9XGPH214w7AsEkJRWy21rv6iCk62
	kjQ87kqnQDYWO05k8yDPQYuF81o8EBESOAa9Dp/fIUNOEJULmDAVE8jFITd5WGN3xJBH+uyRMLV
	ttoNU+tatnXBjngoDpSsRGebfW4gr/tg
X-Received: by 2002:a05:600c:4f0e:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb5f43261fmr8025205e9.33.1794582401803;
        Fri, 13 Nov 2026 07:06:41 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f8d054sm40186365e9.3.2026.11.13.07.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:06:41 -0800 (PST)
Message-ID: <eeb076a2-56c9-4864-a8b7-acbfcccb4fb6@suse.com>
Date: Fri, 13 Nov 2026 17:06:39 +0200
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
Subject: Re: [PATCH v5 1/6] x86/virt/tdx: Move TDH.SYS.CONFIG operations into
 a wrapper
To: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dave.hansen@intel.com,
 kvm@vger.kernel.org, yilun.xu@intel.com, xiaoyao.li@intel.com,
 sohil.mehta@intel.com, adrian.hunter@intel.com, kishen.maloor@intel.com,
 tony.lindgren@linux.intel.com, peter.fang@intel.com,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, chao.gao@intel.com,
 artem.bityutskiy@linux.intel.com
References: <20261111-tdx-module-ext-v5-0-c74f764abc3d@linux.intel.com>
 <20261111-tdx-module-ext-v5-1-c74f764abc3d@linux.intel.com>
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
In-Reply-To: <20261111-tdx-module-ext-v5-1-c74f764abc3d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11.11.26 г. 5:48 ч., Xu Yilun wrote:
> TDH.SYS.CONFIG is currently not wrapped in a SEAMCALL wrapper because it
> is not exposed to external callers (such as KVM), also because the
> level of TDX ABI details needed to perform the call is low enough to
> flow well with the calling code.
> 
> But as more configurations are being added to this SEAMCALL leaf, more
> ABI details are leaked into the surrounding caller code, which decreases
> the readability of the caller logic. The first case is that the Dynamic
> PAMT (DPAMT) change [1] tweaks the R8 argument based on whether DPAMT is
> supported by the loaded TDX module.
> 
> A follow-up case comes as the TDX architecture has evolved the ABI to
> introduce new leaf versions. The host must select the version to call
> based on what new features are supported by the loaded TDX module.
> 
> Before the version selection makes the caller logic even messier, move
> the register ABI operations into a wrapper.
> 
> The original changelog was written by hand. AI was used to help correct
> grammatical errors and polish individual sentences for better
> readability.
> 
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Link: https://lore.kernel.org/all/20260904215841.303070-10-rick.p.edgecombe@intel.com/ # [1]

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
