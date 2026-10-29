Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268307;
	b=ZnB2ml6JTwc7yOHtFUczInB9mt1G6VXWL6BB4gv5tkKyHNT36cpIdM1FACE0zwlLXUa/
	 vSuusy5bUAc4sxHK1Wk59yo7dh50MQxRjqlxtlLDgxR4WZDeE4l5kyAg+dErmu/Feon+o
	 /61e/6OczgpSic/BdAJR12Sh3D5EV/Aa9Me+aqOeOFrLvuz9gf2IEc2GUmyqcZKz2/zvn
	 RsruOONHnrdIqzDtOGb4dwwomJ1C50qlwHtZUU7sAe3tDLrRHf89FXGJ7H0Wk8hfefbIA
	 ddv5w9JGOCwFqkUcYXSdhuglm8HdT/TyEzh+mGCyp1RMTLDOI+GxM/+stMRRN5t8zaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HZ9giMsL3tTbnyDf/k62OFthNCmQXGHyiD+KvibTtRA=;
	b=EhaAVwJEjQKRXzikIzYM4NldWjtz0AfmfcEK8n4jN8wu+fdibDMb4owFs44l8XzyxTDl
	 gNDwbGSwHlo8YDeRPI2KosLeq4swt0P+H8Q0i3TOboxeoMq6PmOlM1aV+ODa/Cr8kexoR
	 xP/VV0Xq0dw9NYwa8uHcmAEuWF8eVWhKpPkO4gtSoRNO/LYe7l1ZnVoNYfy6z0ykRKSBY
	 s6ZIGDueGvaK7hN4qOigJaJS32ScDRUmBDXqajNKWD+eXv4Jf//xms2BjEZSGywLVHGI9
	 wQYYyrvR4wa89fTfyEKosy/0O88884Y4ZS8xfkC2kDMgNKj02OIN8oz4ax+2mxomV6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDA8606A31C
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 10:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so84678266b.1
        for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793268304; x=1793873104; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZ9giMsL3tTbnyDf/k62OFthNCmQXGHyiD+KvibTtRA=;
        b=lq8W+cS17tDHpt0tbOot6GGbbRax9GS9mFdROMSRS4xNqUqyQUTjc8gR36oDdhrqlp
         f2ZTcjmpbEpPLEUc9OGOJvVCo40IvkO0lstr3YVV4H9j1YiEnFAcNuDLM9GNca3wNl/L
         NDSQAccmCHZNagbIw1LJdmLru3Mj2pq1GdRWc1OX1rU5UMzE5a30posmmkH/thGRPn+o
         QPdaLJPjrdyd9W7FAaJkm7Yad1K8YOc4/Hh2Pd60eIqycYi8NXu/Wyj9Q4jLKKiACNsa
         z6DSnyslQeyw+XKRTKFirDmhF53mZrcC/aSplZ7XiKXxrVCzv82jh9AhZ4vliczVusae
         o7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268304; x=1793873104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZ9giMsL3tTbnyDf/k62OFthNCmQXGHyiD+KvibTtRA=;
        b=kdCupfusmBWqj3Q88zuWCm5j694NHsZ6fsnnN9EaXQJf0zxEMmgKEUdNYAGrtMyB7a
         6IEw5iWesF+/5rMdsCrMP4q9XwDvrxBUeIR5nfDdu1huOG4BfXXw1MxApKKPnzOLHRtN
         DmewWgtLLOZvqNK1p6GDUjRVj0uN2822xbgA3WHGVCSwiNiXRmmEqBvApvQZiSUqTyKh
         49co4FlSR0La5ZQfrXZccGTrIcdesVAUG9566fBjq8St2sPqqeLvcY532QBMrmaJ0TKB
         37OaZ/KWlPTAl2JHm5ih/PTlKZVWYAZbROPFjx29Re/ehSH787WTwKGXVjove/4+rvFd
         ZxHQ==
X-Gm-Message-State: AFq9FYLxFWtjRyMHJwsloW66yV/YHzR00kPJ7OXRf17JHru9sIwvIxvU
	+pvei9LyL5kqy3ajY5CoCa6YgpffUnEI1KTlegdPzkpsrBjXCeOS61pwx1XCIxhzR9Y=
X-Gm-Gg: AYBFou0S+SRr8x1ec2ZTOCe0V2ykqL1hxj6u5O0LINWXEdo8fQkm0VRJtl6cnmXcEh4
	4rKO7IlwSHYJYHcyd5LLVEqOD4fIei3AT2Fl5IHu3T6vtQNGTg4DdmulayFL20QpG7xZ6hrrBmM
	Yxz0MqIfT648qxWRf/wICF2TL2S6VcBS3Ap6Jkl9T9FX69uAcSomLcxIruuLPaB+Alt9txT3zwv
	2YWA8gpgOJaNsuDGkR1aBT3epeTk9SiyDJMgt7gNukCPWAVQPGH3372m2KpBw+aHtbrwlZMnaLw
	9WL8zJi2vm1DNpAinuQPfY4uYS12FJSEjqWZVBN7uLfkv6i/rw56BxUDRJDQtsLA0qBX9lOOvuj
	1hcT+mDrhNBf8AFQzL15ePFr0D2R93w/FPiEb7OLcWCwCHgaCFi1aizp8WL2YcwguqsAYrexujS
	2pRYsH7/fCF4UARag0uLMuBBCuYYci55M3UQQY/a/URJcs8ZJqB1p5TuOSgazh9WKkbQo/+WBKR
	5J69FzQS97TXGSiAF4BsOLWiofkRyRJ+r1OkFtf2dL/MrL5ERLKYKsD84es1D1uj51Z9BeZUOx0
	6udfPtgXdjLbtkHBbxrzBtg9s+458NZ1ZFqfBw==
X-Received: by 2002:a17:906:ee82:b0:c25:4d9e:bb28 with SMTP id a640c23a62f3a-c49d10fc56bmr194240166b.3.1793268303706;
        Thu, 29 Oct 2026 03:05:03 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm705408566b.81.2026.10.29.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:05:03 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:04:58 +0100
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
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auMX4kbsflE9kK3Q@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>
>=======
>
>device-get:
>  request: {}
>  reply:
>    caps:
>      evidence?:
>        min-challenge-length: uint
>        max-challenge-length: uint
>
>Did anyone implement a variable length challenge? That seems a bit
>strange. There is also a very important crypto warning here that the

Yes. TPM2_Quote accepts variable-length qualifyingData, represented by
TPM2B_DATA with an explicit length. This varies per request on the same
TPM:

[1] TPM Library Part 2, section 10.3.3, page 136: TPM2B_DATA.
https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_2_Structures_Version_185_pub_c0a962a931.pdf#page=136

[2] Part 3, section 18.4.2, page 158: TPM2_Quote qualifyingData.
https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_3_Commands_Version_185_pub_87a5c10230.pdf#page=158

The PSA Attestation API, section 4.4, also requires one implementation to
support 32-, 48-, and 64-byte challenges:
https://arm-software.github.io/psa-api/attestation/1.0/api/api.html

FIRME DEN0149 1.0 ALP2, section 8.12, Table 8.23, page 100, likewise
defines an explicit Platform challenge size parameter in x4[31:0].
FIRME itself does not mandate the specific 32/48/64-byte set:
https://documentation-service.arm.com/static/699c3b70b60ef220b14ec14d?token=#page=100


>userspace use of the challenge must not create a "signing oracle". Ie
>do not pass naked network data into the challenge..

Agreed that we should document safe challenge construction.


[..]


