Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2071D513560
	for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680520; cv=none; b=m9qbyHzuCYAAQOGD2onAaID6tdGL7s78FWOEtARGYk1ELOhs99x6pzckFDzH+m2OTDOm5c8gmrhx0KkWXboKq9Afv3paXtIBFFxXm0JvyG7LqENyG5S/9EUTY8d81BpBKA8SjhoTVKD1ZYqiVJyp/5pVF87ghn20gwC5k7GvWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680520; c=relaxed/simple;
	bh=gJ7scYuTltRrzf9d07AbTU8FhCiMBK9YibR1DfyomIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3diJp2bpLZ1U4LQjjPr4OO/BjELBCjpKryi9bL49osxbGwGpftX9azKdFXp3nllMC8zwRXKXh/QZ78+hI8+uHfUZ5dg33jF0Zb5QgwuiZcsfCbSlv4+VlnFAZa/qGiW0v/mZiQmSV6RZ4M3V8DcBHh5ANtTOIq+QOqxxwsYrJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GNI+Qq9n; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GNI+Qq9n"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso2477815e9.0
        for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 04:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790680516; x=1791285316; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QeB6tSGwkKBIbfux5fnEJQm2QCEM2d5opb2ahjDtcUs=;
        b=GNI+Qq9n0MgeG/i8qoplcfBuibHlDspKztRufL1n5fCPauYJ0dryyVz5IlwgIyKwzN
         /m8HplquP/K3sK33fPbHi7TjCSWysqgdWHFjPWOe5nnFzPo4VN9+TjVZmzP+z4hsHiNN
         K1fGYHdt9XkN42sYeswLEJOri+RBfQkDm7ih+nQed/IPfPyFV8CMtx00kScbkgZx06l/
         gyC4jCvwzmXuWuna1HXllhpbfXBC5wOo7peCIy0lr1ZmRvtZRfYCYSS7KHTzTN5nWK8d
         pLdT0DbOTuCQ6JW2kjOp/xXuKf9zhxbeocuq7TJLodxmNBBhCJEh9iyPgKD5XUAEQ8PA
         L5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790680516; x=1791285316;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QeB6tSGwkKBIbfux5fnEJQm2QCEM2d5opb2ahjDtcUs=;
        b=toi4rcfK48OCCzW/LcoAfXkFNVJ2oDXeozZjUFhmyvbjeTDMjJYzA5v/s4OxjXNTii
         tJ/MnrYE3/JPdkWPAMNxasBFRvnpJuVgGRhitXNWtPgrJ1oS9qRnwK8xI8D0QmCnWsR0
         /3xX/0f2w3OLgmaa5KwuRJSYTsAaAqbgh3N/5QscCYSWjoQwj0yRU5sZx0IA62qmP5EB
         MER5YhO6hGJXTcnM8iVxohLvWx8rK1bekshAjjt7iobZ406KIiZdzrLhMclQ/PjQsBLR
         dtzEOByJemEfN6sxXZhQ7VSftjPFKle0hGl8xXnuMIp8FkuKp1/5rA/4GtptxA1BfcGY
         0MYA==
X-Forwarded-Encrypted: i=1; AKwUvBy6YmusBlDRq1TjrEie3uLuUx7IU6hTmg15vVkQCD9IzaqtwPQg6TWglJT9mSYbJQk+bYImr9NQd0wv@lists.linux.dev
X-Gm-Message-State: AFuF++mtcT72tOM41eI+hiSk5X3acIcJWrPkDvC2ietxAxnHOiOHctk/
	YAHY/0xyMQFh8vsSyn/GxwxYhjGQY3+N+hOp2PjYz5bksmZWO3+QISR9OXr/eyVfjq4=
X-Gm-Gg: AYBFou1uCT/LrPss99FAhVErzbPXaeIwO0p6Jeqemb0ZxFX33HMe5Lw3ktNeKjeeM2H
	GmJNQJOIU3d4rFXW3sgfcVwk2cZ7xMaWsOsyzMle5FjhSvXQpz9PhLwc0bTOENh9KOCWPk4qME+
	CEyUxrlIQv1SDmI48wbJ6Yb+f5l1f2ytxlwPaQ43GrsEGQ0HT27pWiwskGho52PZJwJAumMEGZx
	tofAVlAvj7NjP1lV783QYdVxke73ogEvj4rXmMsdobSQTQNBlXMck1K32GhZ7wDdWSYXCOX/he2
	4fZ2MHs5FoHdxj3QkrzeV0jKsfOTqEGnnYG74PQLnU08VCopg4CPZDoHPnd8nOoBSdmqnI2TRIG
	7oel2l2z3ZIpQNqjD6564GxjeCbsWm6cQCwBJJEOvq7ilrHE5ITCQ7uYly4p8t2Z840ql3IaweN
	5uR/l4geEq+Jq9BILanNSRHkWRQUSAjBxgB7xNaKhJjXAQnPNjxPK5VqTiSv88IQ5lDMdG5F4W+
	dSHCd4YnmygdE76a4fim7ZF
X-Received: by 2002:a05:600c:c16a:b0:49f:d69a:1a04 with SMTP id 5b1f17b1804b1-4a00d779048mr29343855e9.16.1790680516122;
        Tue, 29 Sep 2026 04:15:16 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c10c656sm107581545e9.2.2026.09.29.04.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:15:15 -0700 (PDT)
Message-ID: <3e7a8725-9e31-4f88-926d-f7bf9c15b45f@suse.com>
Date: Tue, 29 Sep 2026 14:15:14 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tdx: Remove the early #VE handler
To: Vishal Verma <vishal.l.verma@intel.com>, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Kiryl Shutsemau <kas@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
References: <20260910-b4-tdx_remove_early_ve_handler-v1-1-bf47a4d360c5@intel.com>
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
In-Reply-To: <20260910-b4-tdx_remove_early_ve_handler-v1-1-bf47a4d360c5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10.09.26 г. 21:28 ч., Vishal Verma wrote:
> tdx_early_handle_ve() emulates port I/O for #VEs taken before
> idt_setup_early_traps() installs the real #VE gate. Per commit
> 32e72854fa5f ("x86/tdx: Port I/O: Add early boot support"), it exists to
> support earlyprintk's serial driver.
> 
> "earlyprintk=" and "earlycon=" are both early_param() handlers, so no
> console can be registered before parse_early_param(), which runs from
> setup_arch(), after idt_setup_early_traps() has replaced the early IDT.
> Nothing in the window between idt_setup_early_handler() and
> idt_setup_early_traps() does port I/O, so this emulation doesn't ever
> get called.
> 
> Remove the handler. Any #VE in the early window now falls through to
> early_fixup_exception(), as it previously did for #VEs that were not I/O
> instructions.
> 
> Found with the help of an LLM observing that the real IDT is installed
> before parse_early_param(). LLMs were also used to verify this. On a TDX
> guest booted with earlyprintk, a counter added to tdx_early_handle_ve()
> for testing remained 0 after boot.
> 
> Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
