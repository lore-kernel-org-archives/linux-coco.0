Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108295;
	b=hmvuUzJuFPBci8nHYJyvRwwz7re9MK53kQ7tj1bJVHYOLkB0vnY7+cmoXE5PeHAzpsax
	 6s+EbNGrWqlX1b3nZmAIrGHpg7WvGjprV+1z23Esgilp5ETEsQp+/tPOLh2tMU4MvcRNi
	 pIV1mg02/FRDqclBkko1uoti+NHujFMQiK+iR/M5ihGZf3DxY3wNjBPPdDrMB3kU0PJyw
	 olgOOb3hCaTFtua9NKVehotxVN2piXd0sHicnadbsses7yfM3kKij04PzyLz2m+EoHDpr
	 qFrA+iqVjpsVG/zJ4KE+QAVHaMv3r55US9PsNVepsENn/KhhyFE+9a3kta304itgDHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=DwMd1KchjZwzPRTvPjggUQTB5i2EuHCeAYUv5XXUio8=;
	b=pTdY2KqowfPqZLCNCzLO6HVjQAt65nRUYr3kgnPek7EtqWBwf9XC//79tHqvWtzDDV/f
	 C6/FcF+wY03zfKgGidJ27uAlW+KarC9LfyK4CwM3Klnbq5S2d5ueShPMJSwZUOn9L44AJ
	 mF7GUq5tT8VO3/JPtS/tv1dm3+fjxvpQb9hTJvKMrC1u4jRm7v9jtloMEPu4rimfi6C+C
	 Jsb+0A3f3lRKbjszxAfJlekQmLLQUiNogTxHzdUBNGzX/bLgmWDNXXRGkFM/HrGtyq8pW
	 NuCPbuDqG/6q/RzqP5F49Y3n0X4c6XSX6jYH4leE8NkaAO0KeEuk907YkkUUANq3q7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=mC8EahSp;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75208606A31F
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 13:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75208606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=mC8EahSp
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c43373ae89aso632695366b.3
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793108292; x=1793713092; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DwMd1KchjZwzPRTvPjggUQTB5i2EuHCeAYUv5XXUio8=;
        b=mC8EahSp2h6gdMclVCzOQxbDdRGT+cptno/eXSm3OMS6Xu1Jrj+PNpr9GAxuJLe03k
         K5mnQAm3xyGDNx+qTD9vH/DJi4ZscsBx44BD0PxVmeU1q9adeenIpY7gIAnFjC+Neywa
         E9Bc7kyAFslSMqlYVPHaLpMj6BZptBDamGm0Mb5jWGw6zCBYkc1xVr7Oi4neyNBMVO1J
         pUqNbMoPOmvtA59af5vZlk/aLlDDg98fomz+jndhEJjziykJJfWr60WGoLh1Udfyo9ug
         KwcKBhOVFRtGfQLcEwywMXV1MsAPhUb4v87Y7nlf8flmvREzqiBzeJMPphxLUUR0YCss
         SjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108292; x=1793713092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwMd1KchjZwzPRTvPjggUQTB5i2EuHCeAYUv5XXUio8=;
        b=KMPEvEqqtuWcSZTFh03DPIycSzOfuKqbNXQRPeOovthtjX6XEY/+YzDNP06L5VEZ5l
         Paj+Yg2q6ShVctjoWNl1jzLTu0Yy6zZo8c8CrssO2PzfEU2M2128BQSAFCVkiOkaz1/9
         vjmnQsp9msmRb41GzeugkoxSE1fmgejwGGMvymHL2WkGUjSQWs/sr2hJJGYiox0ePo+q
         OOrRKIe4wKWCJskFEw+VAhO3mjyhCyJ38aGwFhHMAAvqcSEpiIb8xrA9/gHfEiqLE0wn
         wO7hEIrHuR7t+pEXDhA/bviV/dIm/g8E5qOjxFPg8z0p36AyvZLgQvGFXeEfL12bgXWu
         WulQ==
X-Gm-Message-State: AFq9FYLkFnmmESgj+h0/EE6gwhcBrUpVG2ylBYnbv1+hsn+UP/qbdrqV
	7v069o04hFHrmRXIKExYYiiqawfhZZgyQFMp5XYOUhbuDPcFfsRMFTy4nhxBZ8Tn4A0=
X-Gm-Gg: AYBFou3suv+v47Ka1YOzvvxLIIBzjXb9fCuXwYskRejf1xcJ5bhsDvMMlD1OvbXOPcp
	zuicnDLDMWQCMcy0jdaAdN7L/3YUNC56I9VBUNoMLkwGXZxLT/BE48E64vVcpE/qvSgi92V10Vc
	T6SpwG8H3OjpuzO3Hki/JRT+tiTUO1uIGcROerjTHBGx++RPlPg9PxOVCpk2SqPoSEymirZg1fn
	S26USx0+ydsPY50fDXMssc6EtSQASNVFssaTo5V6rFcQROQ71Furl59GhNRbSIOagfJZhdv5six
	JBh71iBLd2yvNnexD+XaT6Q27MRhC1b4c4QxsMSrdnRsCyszWUkpRDSaJ1vMguybvqLtsgAfY2V
	RuqQxX1kIukGP+WmLJpoXjwgXH7ZqO5AldaWHItTlMUugC9A9fx3kFFYhekH9YmbzpCZAW2aQhZ
	N92XkB+bqJozp7fYzi6ryTkmSr2cSUzgOpdhH6H/3Z3zQUwuyhq7LVcGGnpGOEy0nJCsrm+KWc+
	lJU44jVo9w2nkhVxFGdOut0APH+5zvUA+k1Ljcb/HylTSJEUY4KrTmBjt3cBKEg0iI5kuo/xvO/
	Hl/nQQAht28lYmvrYvw/vtoSvCXBrTFPNRdjnw==
X-Received: by 2002:a17:906:c14f:b0:c2e:8eb7:53e8 with SMTP id a640c23a62f3a-c46bde6b23cmr1029897066b.30.1793108292179;
        Tue, 27 Oct 2026 06:38:12 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd524271sm468626366b.35.2026.10.27.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:38:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:38:07 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <auCo3jRQ7p6JjIPF@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <179302367452.58760.16195458599265885835.b4-review@b4>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179302367452.58760.16195458599265885835.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 125 lines skipped ... ]
>> +struct ctlv_priv_container {
>> +	struct ctlv_priv_container *parent;
>> +	struct ctlv_priv_container *child;
>> +	u8 priv[] __aligned(CTLV_PRIV_ALIGN);
>> +};
>
>This scheme with priv is very clever, but..
>
>The usage in the tdx driver ends up having both the 
>ctlv_priv_parent() and ctlv_priv_child() calls, but there isn't any
>type safety and it just seems worse off than using the normal
>container_of approach.
>
>I think it is a nice thing to have for someday if we get to a place
>that needs more than two things, but for attestation subsystem I think
>it would be clearer to have the normal container_of relationship and
>some reliable way to get the 'struct attestation'

Yeah, will do.


>
>At the very least the parent/priv functions should take in the family
>ID they are trying to seek too, for an assertin, and many cases are
>probably better off with just a simple:
>   ctlv_priv_get(ctx, family);
>That is slower but always gives the right thing..
>
>-- 
>Jason
