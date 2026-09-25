Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B8E3B52F8
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345578; cv=none; b=ETSwhz6IpGHSqThbSFqkEgOyE3Z23RKyFCwPkfV1EcsGZVgsUF6KWaTBqsBX0n9y1rvKw9CmSlwplKm5PyHqW4FdRphN0xjKqM0zV/oIaQU7gEwoBdbFotBmxD6w/lPzBnutkLkLPo72/dxhM51fpzyHpaMYVnXeGysdwPtn/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345578; c=relaxed/simple;
	bh=/MGhRXXTFshB26dKobSTU+rDExOvlc2JZ8aJb3VEbyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNFLARSeDE4VUCH6bCRXY2ADuJhpmU+b7AfDusnNPduMo5pkgumIHm2VR7REyaI1szEudx/jLx8sNrqye1eNWLCHtpNp2ww8AW8j9XUx5Z3l7WyGYpCGpuV7UF2hX5NeyaQVxoA/ZzXc6ZNtAs3zvEBiqIiDV/3bRywiz3g8BuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GuAJbfyO; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GuAJbfyO"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so558802f8f.3
        for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790345574; x=1790950374; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AkecftIWxcu7UUmU6dDFxqik/csT/7Zco/v8or1wVWw=;
        b=GuAJbfyOhnBnFvIqyZuaOMUOMaLfI18t18ZFaN4t7yPAu8wX6pdwsCIi+EjoJxhI5y
         t/eLRC56tzaPivDYlC2zSDj1dxNfWe8WqumHYY39jYd0L0vABHxPCGMjiaMX8+JRPvvQ
         XfMJhPcV6xBoF9wa2dGp2xHSbB4HSeYgmk1Ucn4jvbWIf3XkiciDIXspHyvtoTts89Xt
         VHD6QTdADxrtqukEMBwa4RNs9tQt3GNM0Olx8LSTE2BK9HsDeT47Khj/DFsnstOnmSqC
         xZ+uo/4dLXTcL5ZXOddMuE/4Ko9Go7xdLYGwG2x+8dRgoZTeFm0I23kZlmHuvT4jFbMV
         pKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345574; x=1790950374;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AkecftIWxcu7UUmU6dDFxqik/csT/7Zco/v8or1wVWw=;
        b=ho5e12obMIlv/T3hSUJWoz9XF+EFfEHppFzEveqYypMeNqkSclCSwZE0UoYk+vB2IM
         tWtvBe1qc+/VZkZe9XfnGiBHDPhipVdoMfjTOMccxALDzKlRjvlCxUh5uJQoQUhS7der
         1vtfTX77mzaB9ALis8XoKMsOP3+j4qvG5dmvlJJO+POqJr3PIs1lZRJxhp5JMcHP9aPB
         tKYcusqqUPTBTiMF1DQBYRdTEuTYWVQvDZTmiWA7COqF8384McU6SVUu1y/bf67CoZZ4
         j8DggYipFCDoVde3iTIZI0ZEQJnzGdSosvkThCgR+g8YTLN3+9sFm++0HumrOy3Lwutt
         7Pww==
X-Forwarded-Encrypted: i=1; AKwUvByoEKVsMqisym4oGnJZwPNI9ge6iTwnz9Y3NHlGPIRz2Q3pR6hkgp11dB1zyR4ny8WK/P7HdVAAHBhI@lists.linux.dev
X-Gm-Message-State: AFuF++n0UM+/9ZtcgPF5MsrolilyduhYjnxsZBAFTq8HEGzyaFsz/Vut
	EZyj/B4PN6g4Y5/y6yExRkvADsuyRRTx52ES+SBhM6xpWXqrfGCM1cCs5XMhxs6gZaE=
X-Gm-Gg: AYBFou29uqW3WMn1JJRu9vb/eSTvv1R7EgpweWgPNabdGnPonD194N9AE/KfRZOcNDc
	LQvE2LxAGWvBdDlHk72EZaUulu89kf4q6yjSnVbCzRHwEM6vYrkByZZMtQfeXODlOR+dDBbKcF5
	JtkvtWTIe7/IPMx8gFmEXfhHYKvMrG+Zk4munfEpBbf98pcYxOCoi/QQjBoRBNe495gaS6s3r3Q
	Gof0QeKiuXKEMBE8WLau2UFjgOdlE8/SIJbSBIGnAtP0CYgsZ6Un2iUitIFN//tXZ0rupAQFGmI
	0716uS5h/VgqGA5QrguMS4OyqwPcdJAUHiO+V+qsWQh0LDaiIgiiSwAcrZVOMBlKvilrEMS89+2
	D8LOsKlbXeIZA4B20+n9wny4W+S13+aPzmZFFGnnr/uIDA3CvcXqNbWjfmO8KGttiTeOKBNN891
	fcbcGdYwBMcfZwtaW+KolllPSOmzKSGurNzAGehbU0u4kb3FhgjBBgN0jd+odB6/PKG5Pit869c
	Ud0V9UqiyNCVX/GXieMnkA=
X-Received: by 2002:a05:6000:41f7:b0:487:27f6:a4d6 with SMTP id ffacd0b85a97d-488716b00eemr11164595f8f.38.1790345574584;
        Fri, 25 Sep 2026 07:12:54 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm6779397f8f.5.2026.09.25.07.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 07:12:54 -0700 (PDT)
Message-ID: <64bfe205-19b7-453b-85f1-0306fbd193d8@suse.com>
Date: Fri, 25 Sep 2026 17:12:52 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/virt/tdx: Configure add-on features on TDX
 module init
To: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: kas@kernel.org, rick.p.edgecombe@intel.com, yilun.xu@intel.com,
 xiaoyao.li@intel.com, sohil.mehta@intel.com, adrian.hunter@intel.com,
 kishen.maloor@intel.com, tony.lindgren@linux.intel.com,
 peter.fang@intel.com, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 chao.gao@intel.com, artem.bityutskiy@linux.intel.com, kvm@vger.kernel.org
References: <20260915102658.713079-1-yilun.xu@linux.intel.com>
 <20260915102658.713079-3-yilun.xu@linux.intel.com>
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
In-Reply-To: <20260915102658.713079-3-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15.09.26 г. 13:26 ч., Xu Yilun wrote:
> The TDX architecture identifies some features that are off by default
> but can be enabled by the host during TDX module initialization. They
> are classified as add-on features because enabling them affects existing
> TDX systems: they may change existing feature behavior, or reserve more
> memory.
> 
> The TDX module extends TDH.SYS.CONFIG with a new register argument to
> specify which add-on features to enable. This new argument is a bitmap
> that uses the same feature bits as TDX_FEATURES0. Note that Dynamic PAMT
> is an exception: although it is an add-on feature, it is controlled via
> a legacy, dedicated register argument [1].
> 
> The kernel needs to enable these add-on features when it supports them.
> Add a get_tdx_addon_features0() helper to return the bitmap of the add-on
> features that the module & kernel both support. Initially, this helper
> returns 0. It will be updated to return specific feature bits as full
> kernel support lands. Pass this extra bitmap to TDH.SYS.CONFIG wrapper.
> 
> The TDX module requires SEAMCALL leaf version 1 for TDH.SYS.CONFIG when
> passing the new bitmap argument. A previous change [2] supports the
> versioned SEAMCALL leafs by adding a "version" field in
> struct tdx_module_args. Set the version field to 1 if the new bitmap
> argument is used to enable any add-on feature, otherwise keep the
> version as 0. This retains backward compatibility with older modules
> that don't recognize version 1.
> 
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Link: https://lore.kernel.org/all/20260904215841.303070-10-rick.p.edgecombe@intel.com/ # [1]
> Link: https://lore.kernel.org/all/20260722084634.131020-1-yilun.xu@linux.intel.com/ # [2]

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
