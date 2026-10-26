Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025930;
	b=d+I+ErbsFbGcMozYFWk1M+B3ZSI3M/JfoVgd/NJr0Tn5j7WfCn1AWEPo81wqArTcKrzP
	 zCGe2qF2KLlgh/cTP+XNXIT4ktHXsBDdC5S4VtvrbbiUvIcX93WfqDTo6hasBDuxafKQZ
	 RYzBskxMLLfWMVamqrbC6gbuRr708tOtNw2OukY7OtzfJcNTb70bbAoVaXZudjRu2saf0
	 Jb01hLi+yRerP1oKgqVOtLsy1Xug3s8yoR8cYrrSTeJ07NKCasLe6N2xaFRqmxOJQ199G
	 kAgxMCgGlB9EC3m5ZXQnF8xhdp605ucEgaq8EK6LuwBvSj3k8oOFH80A1JylAbATL2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BTyJwIZ3wmc9oIYfv63SnUqHORvshzUvmQqM3M2r5gM=;
	b=sFnkcURwMKpZp47o5K8o3PGD/7R+5TkbAE8YCSQYE8jYZGbPo/PMEI2dyjrV6qAlJw3e
	 UK4hrKYcrtXNi/kcpWyKgzHLl+Xei9FGBUHTGCMt4zCXLU5qQF5n22Sg+svCAV8SSL8gf
	 ErR1MhQi+EaI7rGnMZwFySSw6t1VBj9ndzECswvTXkUuYgCh8WjAyWUf/vP5r+ytGozLx
	 jy/iPRNKbfCzmeBWQLbIwKFJNyHyjoPqw2qqx2pVHq29H3Qw0Ra3Ia/wqDZM9eEbhkO4T
	 o9W+P281zRAWPYrcQwA0w+9h4tXH3JqgbbGfrIxCg5+GTBYIiBDH3cHR5XlQxobGu1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=sCepHo7W;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAF2606A31D
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 14:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCAF2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=sCepHo7W
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c43373ae89aso462967666b.3
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793025927; x=1793630727; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTyJwIZ3wmc9oIYfv63SnUqHORvshzUvmQqM3M2r5gM=;
        b=sCepHo7W9Q8BxuBS1FAFFMAcmpBAntd7/EH1aIWjntgJIPHH5jSJFV85TxkcWw3xmG
         ZxEJQjYH3+1DqfQxsjlocy54WgWJKU+DjdqGPRBqgOIzb4dP3JE0uKDOPJoJHRk5KqTs
         Etrzxb993UqKCikT4NGfXXE4+jR1ZRvHh1bDlpMk+kmhM4OzT0D0S2HS+dgJRRI+fFgI
         j11fl55iK3adhXYw+k7K5pMc6JSZNCAIXSZDItk0PnHggrw129olC1an0QntEfFRVAev
         147y4w+XU1TjocIi7Nvo6iyk7rBsYcUZCMdvPWpNlFPvqed23Lh8DuXN88aPaq4CcOf7
         sm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025927; x=1793630727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTyJwIZ3wmc9oIYfv63SnUqHORvshzUvmQqM3M2r5gM=;
        b=mdPF2a6DQbEQTVSV04uBd00gXfkGpXwPBh8PLMwCBTI6cyhrg/lJSxuCWJxURaL1DR
         zitxFzFf8L5kXWV6oTJOjch+5fvWFE5FpkjSWYA+rJ9zvQQWxp5CorGGasCx8PVCcC8A
         /QyTMWKCRf0JQvHtcYwgPfPaz93GpBO71SGDkVG9HikWipCHxZ/4kyZjAZwYyjE0AbpC
         GNVWhKHWBCH51nVvjzGEE0evn2qnLDwvB/E2qltaQetTMdLFrTQiNUTLkZKjllBKWOhd
         CfJxMkxYMZEEp8CV1URwyZTV4JkKqwqmal2oHjuMqFFadvXZ9IncvbLwn1N6MsLb9an0
         Jr+Q==
X-Gm-Message-State: AFq9FYISMnEgttuRinnOIaN+p02imXh12k7LxqKfJJ0P4hKSa2ouhQUC
	DhhX9bHBnvfO5uTcy0FlZ3plrsptAzcAEgn2+zK4WYv7h3B0eHcNfBUNhne1yUYY0ks=
X-Gm-Gg: AYBFou3fUn9UbuxM0WetrUHD3a3R630xu90usMU3fVdE3UT6gscrS5elbAEJ1CWrDGO
	P5idxThMWMJjdKNjqv0/mfjK/IAU263AJ2wlJHkCX9dxzJagyKSG7kMyoMwTcd8NZvwozgVSMS9
	Ylw8zYWJp6cOdxr6SOiLuZgl9N+/18SNn7KTow6dOq+iUwS9ekbPZcTI+SJpEKXeIhjEIkFL37p
	vDn+tTkjXrVNpeb2B+pvtpNn3+LDacXzUD4dHF9HOA/tpSsbvCD+cmPaGyxu6wcHIfvcgCgt/I2
	+fo/gT0ab8ZAS8RLMVjysgg71e/tTeKD7Bhx/r9eoxngi6EK7ZKzE99MUVRFw9rhRLhU/clDiRb
	34i4rknpYJRwiTYxhHk2Yt5E0TOkbgvJMyJA3OEMBhaTILX5VL3EUO7KcBczKKUXmbzqukmlOTV
	cALlxih5YdwRnCdBJzUv/InxWEtY1a5vL9Fvk+juwta7qFSARfrrAo8SsI0GdMIHUVNTXGucgMU
	5gKtI7BdPjGggwbntVi6jx7Y9vVHDQv/BRLCYZGZH0hdF/oMqTpshcMFv20DSu8
X-Received: by 2002:a17:906:c111:b0:c29:f5d5:5a97 with SMTP id a640c23a62f3a-c46bde8850amr767885666b.33.1793025926980;
        Mon, 26 Oct 2026 07:45:26 -0700 (PDT)
Received: from localhost ([208.127.45.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7981a7sm325130766b.72.2026.10.26.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:45:26 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:45:22 +0100
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
Subject: Re: [PATCH RFC 10/20] ctlv: Prepare event queue support
Message-ID: <at9ncuDFz_vI-0W1@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-11-jiri@resnulli.us>
 <179302367451.58760.3073439917920385955.b4-review@b4>
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
In-Reply-To: <179302367451.58760.3073439917920385955.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> Add per-open subscriptions, bounded event queues and event creation for
>> CTLV families. Add the generated root family kernel bindings now that their
>> message and event helpers are available.
>> 
>> The event and generated root objects can be compile-checked here.
>> CONFIG_CTLV remains unwired until device dispatch completes the module.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>>  drivers/ctlv/Makefile       |   2 +-
>>  drivers/ctlv/device.h       |  38 ++
>>  drivers/ctlv/event.c        | 713 ++++++++++++++++++++++++++++++++++++
>>  drivers/ctlv/event.h        |  69 ++++
>>  drivers/ctlv/internal.h     |   7 +
>>  include/linux/ctlv.h        |  27 ++
>>  include/linux/ctlv_family.h |  11 +
>>  7 files changed, 866 insertions(+), 1 deletion(-)
>
>If we are deferring the mr log, then events can be defered too? That
>would save another 1kloc to look at right now.

Okay.
