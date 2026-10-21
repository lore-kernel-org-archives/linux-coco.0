Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587896;
	b=nAr4l5CK5snMT7i21kCZpuEgnojkgI7XZV25lXPKc5tNo0zvmm3N+QSgPaPobXL95NbA
	 LA5LPBQyVYdFNVT+INNcbhqCDTD88mnWG3rQm7vx1I9D2LiK81GPHd9u71io10SiW9BBE
	 oPGvbwK/ZUiX3Xb5iJFbdbRBpJnNo9xZlTo6GjmcBBeD0zTOZJti6HNgJuRVo6+JwWHYe
	 5bi2qkpLlY0+tMsSd1O3Qq2K3zRKulXNabhRkLz8RKxH6XKgyNJDDHdd8dvVfiYbSLpPm
	 pfmlqvt3WRmV2WWfHwowaHdT26GGKJlA9dIlqmdnM/PUPLFD70ab/TcJBHrgal61Qrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XBJOZdPNJaWBnEXbMM9r6oKBxoRWtijN3lb4QnOPdPU=;
	b=HSHPbuxgtR/i8kZpnADDSL5yDZBDaKJvIvjt6gAGH5EWYtoHi3N1ot8tbRkKYAmYZJUY
	 HGC+ECdtzG+w1Wcko0e2myt/nqlaQFzDkaGWP8umoNBWcV5kS0NGhwMAGx/vNtuKCZ+68
	 EZ+HAnYWztcpkez2T40ymdCGf6g3a93hcl12lvxQx8PrDWfSf2JkFYmF3cEbxc075yG6T
	 4Ey37lRu4ZHe+pcmwf6L9MVTZkN0LFDonxpkS0DL+PjRdMH/bPxrKaarhna20FDA2b9aL
	 HTn7g0ZZhqTJ9lEL3qrobEYZb9qhw77Olzs5pvFXduWc/ZhtZjcZtwhqguOgLBqZ9BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=lF7AJXBV;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BABD606A31A
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 13:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BABD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=lF7AJXBV
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so5609855e9.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792587893; x=1793192693; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XBJOZdPNJaWBnEXbMM9r6oKBxoRWtijN3lb4QnOPdPU=;
        b=lF7AJXBVYKv0DM7hLr+lnXrItG62PW23lojZdNbGSn04n6LDnC41NEDHJAF9xTgyGZ
         FI+dwsM96egU6A3npJmh23h6CwiDbRM5bZaV2WxCB7jPi0lZndRgQ0rQTeCY3txxTjGl
         SgxwtXiwSgO4tlssVar9emajbXAceZfDl8EMIuJ19Fus4DfJraR5bdLrxwl7xPUa1kys
         3w/7VgTpvPZkOMbbNIFl0WNQ37RdKYxdlSpcdWCuGcOzZ0UznNIFAQVVap/kWyRIpBqG
         L7WJnI7yFQhB6xZuyOs59KagMLHzI617HGjPpbR2reOz+T8ZerOQwI4ZuWsrbrZH7wMB
         AALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587893; x=1793192693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBJOZdPNJaWBnEXbMM9r6oKBxoRWtijN3lb4QnOPdPU=;
        b=lp330UG1l88+TH6l1+xRCcrkrCNg8HinCvdFPjt2XMWi9RJvRSmRI532IwqhQ1j0i+
         o2AVdn0Lb5wgvL38+86d75qTB8z6OOSJXPr64pH4+twjvJOcnUB1hhxacP/SPlwOa7oG
         agGp6CFV6ftAfYhNa+Gw/+5X60t4EQavdFPEdqmw6AbcBcYcrFxJZDnU7itVbKPhX7zQ
         hZpmi8MAW/AxXV80CMPhvLwgKSD6XDqKiKZqAsAX9wGC+DynwvWYlWpfEKSw7RqzeGmt
         vijBerPjBrNAnESwr18MNwmAd19LRtQ0IVvVI2ZwUqECfvUlaseTceuMvQ2DUqqVPrTc
         8UzA==
X-Gm-Message-State: AFq9FYL7K80eDFzIu6HDnTrLHoRRJeAbXfMA2vvqvN3e9x39lYwIo7mM
	L2zvKmWCU2WzvKAxpaaBaLYMU/ITKYTHYTQoDwiw1+CcQiT8cFPzfUziK5GJu2Gd/WE=
X-Gm-Gg: AYBFou0BNsxHST1oUak9X3iACn6qtS9OanLKfeKOVhYrahDWv/HmOprw1/cchhJueFU
	rtDUogA0nlvUUJwlu8GqBxPCO6QonoPmlLjt/AG1R2NQz5/K+/vXKQva6lrWTPlLBl/yo56kbXT
	css6m+VTkKpFx1w8v+98i6WNWudntlxQWL64SMQokp7GArFRH9ooodqLUBVswGnl8GtjGk08A7r
	IZvgin6BelAHW+QhNfjzKuLrCxktq30mToJy/Yw3DixSUYyHVH4AhT7o0lzo8a0/6TEotBo5OTS
	2mqpLjI9tQAB5bYmroRFHUz/JdJCSDvgfzpdlsluLiP4j3bwmZSdWZsarzBA9SFOoGFjkMtLNRM
	SOaYHH1BgQazIsW96cVWMjjN2N8yIqtgdlYDg7j9oczCVWvszSILpAjWkP7ESYkF/J7ciQrFEV3
	0l/yh2I+rSAEjXyTBA97ZQEr8CEmIMVPrvDZUhxDGKFrmEJwYpvfnQzbIfKQF+cIte9Xop0D1XZ
	m6MMkEkUV9Szl6NYP5AkR3qbLaqX64ysn3aITIlbV4BCUntJoXyAzHrmGQBGdOTosKjtcL7OKbb
	Co3TWdhHp7ZD
X-Received: by 2002:a05:600c:3512:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a1fd8a3fd3mr39461765e9.1.1792587893167;
        Wed, 21 Oct 2026 06:04:53 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835c77sm5101952f8f.36.2026.10.21.06.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:04:52 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:04:49 +0200
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
Subject: Re: [PATCH RFC 15/20] attestation: Prepare provider and instance core
Message-ID: <ati4arl9sf1Rgnob@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-16-jiri@resnulli.us>
 <179245258506.58760.1633805100070716498.b4-review@b4>
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
In-Reply-To: <179245258506.58760.1633805100070716498.b4-review@b4>

Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
>> [ ... 99 lines skipped ... ]
>> +++ b/drivers/attestation/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menuconfig ATTESTATION
>> +	tristate "Attestation"
>> +	depends on CTLV
>
>ld.lld-21: error: undefined symbol: hash_digest_size
>>>> referenced by ctlv.c
>>>>               drivers/attestation/core/ctlv.o:(ctlv_attestation_mr_read_query) in archive vmlinux.a
>>>> referenced by ctlv.c
>
>Needs a:
>
>+       select CRYPTO_HASH_INFO

Ack

>
>-- 
>Jason
