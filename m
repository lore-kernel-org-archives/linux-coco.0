Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488390;
	b=16A2m/7FPNin5Hdc+CBjLsGHsZhc12S4zePLljSwDEnRgKlsyP5DV9btddU87x/Gh0Y4
	 NgQZ/QB9oeYLDLd+igohfebsw987REgSR6dNcbxxA5zQhbuhH2S2GAl/hLoTuHc0VpMVv
	 YTNt7GtZmkd24cro9tD1SCcQO31VXMfqq+6Se9/7KWIg3j6uArNf7du7vGBQ0G0aMJ2G4
	 k61JfuT4WKQmd63JrPJyMffImD2stk+mwbntBH+Rn9PdBRbcDAmeJMDpcL1dqx1CAUSSU
	 1up0IyR1ZvJ4LzTnL3iWitjCsq4w4qp2fk/NVQBaBPePEdA1sw4LNVwvyi6nH36wW5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=V62r2oyMwKweJj3yBSLKefUPJg8WZq8H2U6uQoCWZWk=;
	b=oaKHqewevUnYP2Ee2PBIy/GNY54Vno7G6HjQ75XK7eoJFgdOQZL/0VMAKgLlp4nObLqx
	 QqoeUSJC2J6Iqz1sOA2ixPgJcYCHtiiZmxSVIr/T/0nugXP5TSlcn/R25gFgW1IXwIgz0
	 4Tfyx+u6zfCRiyK96xcSaltrTRqZDRLsHcSDpkuHXXnIJox5Jd6C+D/Lw4pQTmWp0chIi
	 FRcs3SstKtAZnb/s9m2gydwFG1cIf73wZ1W6npQYC23jnYgdaImPOTK8j0qAHELHRD3OV
	 UMSCeJAtkEKnklcP7zIXdAB3gsq30XbtKEXc0ppYIOUGn4TZ60VxOopzG4vDAOfX2tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C02C606A31C
	for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 09:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C02C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2460718f8f.3
        for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792488382; x=1793093182; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V62r2oyMwKweJj3yBSLKefUPJg8WZq8H2U6uQoCWZWk=;
        b=ltMs+P1vn7/SEPQMVc6n5pKO+ZcCbfrM4f60JTqRY/nsZn9NtTxYP/XVygXso8fD5j
         dRbJPJ+E6DwX8Oel8CEOWIPK8Sov8ZVTrHe3+gnjE9hjJS21Ku0r+uyeYuX7vvTjVP+G
         ONi/iQkM0+GNei3VS6kSDRgkXnCRjd5ETktrrwbFtdRcXC7PyPQ68fWOxE+OdkO3pPSm
         sntlxH+1dEzLBdON28ZfeDaLircBySSfVuP7WJLwxv6VMg0vPTWw/r5F0eudoRqMFFk0
         6Fbs4/y5kZcSanl8Qz1q+mcRwOLNW2LsDmvIik4Sv8/7J1+4YHIEvu3hVQzd6Sn9YdZo
         kQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488382; x=1793093182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V62r2oyMwKweJj3yBSLKefUPJg8WZq8H2U6uQoCWZWk=;
        b=N2gFr+C9n89ssToHMXR8Y7aYieyTjBXqyhTRYFDcP6C6F+dFJGLzMrIx/rBIZc7Jn2
         +QpxQz8T8EsRvg8gOvYbz+1N3hXYC5Nkv4KJyDpgSdt2gpXIaQEZyOX7P+TSqhIw88b+
         iZrLINib9h7pkryCfgGITCMLHrHzV7+K9+ASzkgx0C9w+1Gp0x/xd8hQH9JraNohNN/v
         Xcao8K1euXPQ/f5KWp3MdZ/1lEMkM5VSjsHg973TyWW+rgE8DfLZm6e9Qyt8X43u+Kxz
         MQH9Htw84THFLM63eqNZ4t8t7o6E9QVLT4QJqxI7J38IgSAHVAcylREDXraFigBrwIrf
         AsNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTN2AOEGQCTY9stalLb3YZ4vD/l/SA4bE3pW1oPATWjvysOhgxOjlLzqD9aje7m4Ljy4WB134S6u1b@lists.linux.dev
X-Gm-Message-State: AFq9FYKZ9bWfN9NBJMpbAMTm2iKvgBToIufoPrsMn/VbKcY26Mqwanig
	SOCW8YZBKSYwzMGwi34yb4rFrBeraLNA8ZAhN+CCXSbd+dDmvrjbG6YucZsG0bbEQf4=
X-Gm-Gg: AYBFou3dEn1QOxaV18GRt1BrRdi4P+SO7xkTHcqmnKeK+Cq8vY4081ru71iGi9KmxaN
	yb9Kko5eXGHmuHkOL1H3l6NKkzbLon3JRyuOOSUEtyPMZwRoVPFUT8vBb6MthkbQJ3QwgP/MXNN
	2GrUZj4QAcxvg+oSG1c3JFA+9md+/ys86GW13jn4RZeaRMqwJVgeuwjTHNW4zxvHOKlO93UVVYW
	5TzDiNeCwQgfN/Wxd8LYO4/p+D88nQdsaN5QtvL47QD/82hwoAl52Y29wD0zMVWcIm4jHLDBbjH
	JIj3sr0T2jdyQT66QvcxeeGBkYf2nm4X1Ha1mNAyB4bX8US3tg0L8t9sFYuNe4FEHeoKl8/UsUj
	an7wMB0SbchftZ4NRDnUgrPZ3gVB11VF2cWoT9s4w661dxsyIsDusrgvzJIFyR6uDqxAQpPIQnp
	bgbV1u+u4MTya4yROdMgjAulXOlTqkEd6Jt1a9SyyKsVGhMtEcDaqZffNJ3YpHAYQ3oXERPIrng
	jrzxQ==
X-Received: by 2002:a5d:5e87:0:b0:48e:1fb5:eac2 with SMTP id ffacd0b85a97d-48e1fb5eae1mr2877151f8f.12.1792488382209;
        Tue, 20 Oct 2026 02:26:22 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm4750276f8f.31.2026.10.20.02.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:26:21 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:26:17 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Dionna Glaze <drdeeglaze@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, roberto.sassu@huawei.com, 
	zohar@linux.ibm.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <atcypJ7oQ37oY8c2@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com>
 <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com>
 <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
 <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>

Mon, Oct 19, 2026 at 06:10:31PM +0200, drdeeglaze@gmail.com wrote:
>On Mon, Oct 19, 2026 at 5:08 AM Jiri Pirko <jiri@resnulli.us> wrote:
>>
>> Yeah, I was thinking about this and went back and forth. In the end, the
>> only reason for leaving it unbounded is to allow multiple independent
>> users of the same register. For example, IMA and systemd could share a
>> TDX RTMR. The systemd side would read the journal through the
>> attestation device and the IMA side through securityfs, but both are
>> views of the same journal. If one side truncated it, the other could no
>> longer replay the RTMR. Isn't this the valid usecase? Do you see how to
>> resolve this?
>>
>
>Bright minds have spent a significant amount of time working on this.
>
>+Roberto Sassu, +Mimi Zohar
>IMA logs and systemd logs are both system level concerns that are
>relevant to the OS construction, not individual users,
>so I would just say to reroute IMA to use ctlv using a kernel config
>setting, then make systemd the new system manager of the holistic log.

Yeah, isn't there a valid usecase for 2 separete userspace consumers
though? It could be a limitation, perhaps configurable :S


>The securityfs log contents can simply say, "log managed by ctlv" in
>this setting, in the form of the template identifier.

Yeah, I just wanted the existing userspace IMA ecosystem *just work*
without any distruption.


>For policy violations, only the 0... extend needs to go to ctlv.
>IMA can still keep its violation log as a ring buffer when it's not a
>1-to-1 violation to extension
>https://www.youtube.com/watch?v=gyYUYbdiN_4
