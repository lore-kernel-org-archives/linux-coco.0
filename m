Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887380;
	b=kuY+CNmuU5KtQ0oGliSInJm8r7LQB+e0XOsMrj+1Bq9BdwSL5vBVztNDU/r+6ctSrUfd
	 dmJ9SRCysfO8Y5zgjgRYXugBurkomtP90kER7/2InkhDehD+7hTRemSMrhH5KF24DeyH0
	 QgTlcp5rDy37DHLIPeLrPz/ilkE+qEBfRTESCqE6YbcanC3ItXf+lDXjo6a7flf6stU6A
	 RliKo2VIfF5fIcyKTxOVJ2nbppxdtDs+eGY4hlmG0ycBzkxX/vAU115y0StAb7UypyfyI
	 R3gHQnlXqPAeJwsYH4woo+HZL5EeR6iwYFi3njBSs30C5VPNDIOf5KkY8RonLOTtGrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7rw+Vw2Z3L2B8lNDfsIFSmx/pfSm9WeDfRFG4S2Q0cI=;
	b=fSOuSYl+8rDHKAgvf1wpe6ntwJOFQzJCU4imj+CjWM4kYjSM0dDHhYxvzxVJvG1XFabr
	 F0Xq5sdiGmDb4Qzn3439AtscZ2dlvxcUqTXgbUKqOYSGApnIUSA7/qXHIvEYWwanxTlwb
	 a+zX6ssfdvrdjik9tX305PKjkAlxnuAIKPPELVENkXzlCdwagIL9/Y4uI0RLutJT2Mo67
	 doIfxHgjiQjVo1vc1PpyfWmlm2M+fotOuTOyWMwZCRFWOY3OhjDo7epOLGJYVOsSjM086
	 8HNhhtajcKINOmhSMiNqjE82h5fvwklx5gCrPaYop3Ex83tjZMLUlv4Yg5GgFmJl7eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3025606D80A
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 14:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3025606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso244208f8f.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 06:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793887377; x=1794492177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7rw+Vw2Z3L2B8lNDfsIFSmx/pfSm9WeDfRFG4S2Q0cI=;
        b=Eudi1wpVJzDTGP61iqqj5/1G3gdaYgvewNYl4hnQDWGXobREX1AGczC1cfZibJL/kb
         62i4qWaqbLdYzPdfXhj6b3G0QDSpi4qwnAD1O/cV+H0WdoZv0ngBhDikKHLd9vKZg72F
         eqzscLwQqSwFBaAad5cQCqlNSp9jaJlFlqkqf3KI4t785Wm9vP6T1Ueb84CPtc9pXH0g
         1yeKOQq8sIe6p09P2Tqq8XyIwY3vu0TEKNLkAbSJ7EaLv5KMaQv7O0WlswuduV7V9ska
         yPaWTrn6hzH/34Y6djvskMchdoXmLxr3yOgCP7oJYRmZ67HnuN34nr2e7CV+LHyk2k70
         2LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887377; x=1794492177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rw+Vw2Z3L2B8lNDfsIFSmx/pfSm9WeDfRFG4S2Q0cI=;
        b=pTFZN8lhzt73fGfQhMbQ5edDp8DpwJvFVrA1j3yCfHB9HGA+WUaFd9cLPRxbPZgck8
         y6NiiKsjW1iQq6G+T8ltgScjJSdX0pqeTH3luxLFwTx2BkjOD4QaGHVYHBMmLIaVOUpB
         Yy2lxQ7xQJ88luWZlA9jbR1p1eJqVC1d1QgU85I3GNKSbrinN62rfvvsZgXcvjwl7yx/
         FvpilxduBuYc0r9o/mEmBR9MdCrhDHZqEWAJZ4zb3BG2PDBS/4cArr4yU2QcUtcf2IKY
         S8OvAjpMXV654zdnVkpeYZBalKEKy7c4wATPH1U5rycI7y1nD/xuF3dpT+wMjrb+WPn2
         B+Bg==
X-Gm-Message-State: APuU4Z/GxvxhL6EeRgMyGniG9liGOSJs91+0thWqbkpJxzu9Envbroey
	UKBlGmGyQLHdW3GLr0faPQsaFlFhQpNPnM4nEvlG4Q+c5DHBhMnk1dgOukMSPgWDJCs=
X-Gm-Gg: AYBFou0M7vjBvOAfNqiGPmHjeppuKmpktgnyznOCKAPgu/4uZxOULElSgigmHBniDPt
	v9iqkLTToGRMsWfuPL5SzM55EgEYF9cV19t5rvD2ZcOUB+TxsUysHZ/X0OhrKOEguPRn9QfSovN
	iujmi3buaGZ13/ThGJsOQtnzZGjjCmLAVpjId7SYgvHBS49seEFmpm7Rv4KOqmpFagJ2NH+dfUW
	JCC6wkR+g/17AktTTHTN17lyYBJJ3noOA+mzYnnOJO+oaONcOulCXkLGyqElFB9jeIgnNKBhoF6
	qlx3LUlMMx+VI3kTJM8nTh9Bdx9sBIDuPM5Ge3PfQjQPHYL+SyYBiK/Td30+SIq/XftP00ftx0Y
	239e2lpRJdgT2dAUFQR7Mow/iYVREr++6w207M6Ri55I8YqNmoFjvboQ1M0XV94XD/MMuH8Fagd
	TDqWmBwE3/KPA+RoRA9D5knyq21a7cr0zDJZEW0WiQSzsZP4BU1sYbnSvCoMyvq0XRhZuJNe8Og
	fcglus/23tak9YuWg4bsL++wRHAEhJX3D5G8KrpcLQgMzOd6LsLVOgEtFKvrou6kW3UgACHJG2E
	Dohbcjf9dp1IJcXwnjTUaiFUMYFEFM1Rie+qEjM=
X-Received: by 2002:a05:6000:310f:b0:48d:f95e:6e8 with SMTP id ffacd0b85a97d-48e6e2c3586mr39104058f8f.1.1793887376849;
        Thu, 05 Nov 2026 06:02:56 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm10937240f8f.19.2026.11.05.06.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:02:56 -0800 (PST)
Date: Thu, 5 Nov 2026 15:02:52 +0100
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
Message-ID: <auyKhc02JmfXNiMe@FV6GYCPJ69>
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
>evidence-get:
>  request:
>    challenge: binary
>
>Binary, blob, raw? Lots of words for the same idea here..

binary is inline field, blob is va/memfd/dmabuf using field. I want to
keep these to "types" of TLV separate.


>
>    objects[]:
>      blob-class: evidence-blob-class
>      format: string
>      representation: evidence-representation
>      data: output-blob
>  reply:
>    object-lengths[]: uint
>    mr-generation?: uint
>
>=======
>
>mr-get:
>  request:
>    id: uint
>  reply:
>    name: string
>    supported-hash-algorithms[]: uint
>
>No definition what these numbers are. They should be TCG2 defined hash
>algorithm constants I guess. Why not have an enum here for them?

it's enum hash_algo - I will make it more explicit including existing
c enums into yaml.


>
>    caps: mr-caps
>    register-index?: uint
>
>So we get a string and a small integer for every MR? Like PCR10 and 10
>for TPM?

Yes. The name is the platform's and the index is the hardware's number,
where it has one. TDX has mrtd without an index and rtmr0-rtmr3 with
0-3. A TPM would have pcr10 and 10.


[..]


>
>=======
>
>mr-extend:
>  request:
>    id: uint
>    values[]:
>      hash-algo: uint
>      data: binary
>  reply:
>    generation: uint
>
>Is this extend 'you give me an exactly sized data that is a hash' or
>'you give me data and I hash it' ?
>
>TPM/etc do both, there are good reasons to have both, and the latter
>is more flexible in supporting crypto agility..

The former. I have a patch in a queue that adds the latter: mr-extend
takes either a digest per bank or the data, as an input blob, which the
kernel hashes with the algorithm of each bank, and the reply returns
the digests the banks were extended by.

