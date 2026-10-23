Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779327;
	b=adW9ZlEF+gHl+zp66BESqTf6nbkH83dvEFl/0JzG92pr4X+GQKLWveqF7yqmXj+Tdjn2
	 e4Oh5oIzc95EEVxb4qOkfcL/ynT2SKZLOQvefAcye4+/hNFVcI/2DUqtbO+g3nAK2m/Ev
	 HUVjVqJj5KBMu5wcbEh1cPCSjtKFMp5F307OpBLTz4nnL4EYHLFsSLvh5NwCYqQqBWHNc
	 e3wA9dvpuqCGT0c/PCGeP3mk2XxLd6zqgvh8A56K0u/raTU20ktJDNfH+RZN99KWw0iTn
	 dgWXzUCy1mP3OLXVCadSrQLyN674SVby9e3Il9yXPJxv8gyPoQaPymnJkGNhCrK6Oiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qt+ZKJaVNRWLSfsLrt7/fp04EXHG7/fEzwXs7hhdXAs=;
	b=iYOjrxOD2N35EcGvDMSkNKB/DLLeRKn4mk7pr2/48goxjUcPpWRhj2HLHqxAdAk54DsC
	 5+bAZYscF1k9J24Y4LhENwBQRuMuDk2AiVFlKDWVKk1R+RX/iPw9l+a4udE9/1sqhr7mI
	 m6NkVuBZ7qNQfQEnBF36te1w/F2iPqAjptDKbJvxTIF/gc89bU4gNsjVIP8Y7h8aSSWV2
	 mbl/VDp1XU+j6GImFHbIsbr18sTMq+Rl0coJbR7hyqNaTfLDCBnpSYbnZToZUroKA3Z2a
	 d8dbvxwqzbnb6paXyHXS0wsC3jfyB8z4yTtihfaE0vRigJ8Oj9sW6NOMI0g/JPYqEpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=JQnv6rFi;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069CD606A324
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 18:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 069CD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=JQnv6rFi
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3fd91337baso162378266b.3
        for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792779324; x=1793384124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qt+ZKJaVNRWLSfsLrt7/fp04EXHG7/fEzwXs7hhdXAs=;
        b=JQnv6rFiuR3VnlmiCot24y1SNXoP6jq1/jVCYPlLDg4Y5bc2A0Moao9VhPSjEYKYqk
         1byoyb5nRhtSRv72rX5hpCEKzTi+nbntL0+cmoLbOXlpYc9AZY6ArRDsg5EgY+0yaC+4
         yhDEbKfuArnvwEej305OkuPD5OKmKVQW3eAGFuQQctRebciaMPkbhxzYDsIOhlBOLbaQ
         iFQ3ux0roShWwGHaQS17koa2Lwxj/thqIcP/S4XRJyvk/3SOAQeWqRL4t7SwFVDKi/46
         QNTJ+wlQMuQfe9HuXe/SpszGp9bBcn1rEwgwKRZF6OOO2yobzlEyhsPbzhDxRZ1EVRaS
         3rOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779324; x=1793384124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qt+ZKJaVNRWLSfsLrt7/fp04EXHG7/fEzwXs7hhdXAs=;
        b=cuvU0Q3+chUtSGf+uvsZmzQNZOc4Rph8VxxVkNWFxkIL/Iw+M+Z3+0F4jOMyAnySyb
         s/b4Lqzijt6/raPXEZ8uv0XOBGda7iebRbwWC+Ekqp/o+EBbC3jIgJXKLMzGo1JZBn8O
         BCRTSh77xJF471y8HdWbbhJrkiZerRXofqrrbzO67qVSbYQxUO/gdGXcjJ/b4+nLSS2Z
         ZK4S0CrBat0e5GGYJekuVDcXE2413Upq7qi5nklV6O1Zbwda3lHPLPQ8YKDlNjv564h0
         L00pjWQ07tciJS3Gu1ovXlk4/04e9EXLXB5BejjIDI0c5kmedgVgFLh5ZJnyiFFM5oxZ
         C1eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTXpiRovdDXjvFSz2DFwfljMGCT03HVVpLc4RkwlCNJvINUDxBWGc5GWW7GiCcSXtO+t2+4aNhz/BM@lists.linux.dev
X-Gm-Message-State: AFq9FYJn+EMtIDyF001/10/0vvvsVBNPBJCdsQGANJ90bYxfqkjgRV7o
	YbYdCpomCB0Fl2Kmujtn7oyXwYIux2lNaCnzbJN+/nSggiCYAT4ZzVv7JfegrFuwufM=
X-Gm-Gg: AYBFou0Gf3E7SKGJtaFajZiyIjvdeU+SGKfK38ioU95TzVUzw1O2liKnyTIEPMgsZ1K
	0j/zAYnHPoxDMcOisxIfUM8vrQHg67B27ttfkWYxNDf1ZpknXx9PH4gP8MvO8OY9UGEO2czCtpm
	WSO2wntf3HAMSXi/3RtF08FxOMwUsxCKpWyAHv950z5+Ct7z3aBhferWPL0ux1A83L2e9wIaX8Y
	3en3BejyttK58wADr/oGO7Nh4yfbJ4//hvhPHGh+kS3f2FUV0tlc998HLM1WfJZgBn2sbtKOKPh
	0Hp+8obGCU/FC6R2WlW/CcfFsAh3e55zT9JtlrG/OxFHoJjTuw6dYLai/orV74AyJyzGtQ/iVRR
	z3hjib3IXR1LkOXacjMV17OIV+FCUFtOUAOVo7JWgLK+VL/whTaWrCK9BT03PI0Md3f8Qhg6F4I
	KwW/Hyeq1nfuBP+M4TgwRTbAcOrspTXyaCJ+4lsoAjx4XaTALM7GfStKD6fuJogedFm93Rs/EP4
	93zxDCUbzDDdhN9zg8QOHZSkJkvQQsl00ioydZeelFxtZk0YK9n56Ue/3NFzkibDzE=
X-Received: by 2002:a17:907:7256:b0:c2e:3f49:df04 with SMTP id a640c23a62f3a-c46a8eefbdamr488289866b.1.1792779324041;
        Fri, 23 Oct 2026 11:15:24 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8bc2851sm27128666b.31.2026.10.23.11.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:15:23 -0700 (PDT)
Date: Fri, 23 Oct 2026 20:15:19 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Jiang, Dave" <dave.jiang@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pgonda@google.com" <pgonda@google.com>, "jic23@kernel.org" <jic23@kernel.org>, 
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>, 
	"James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
	"Xing, Cedric" <cedric.xing@intel.com>, "alistair.francis@wdc.com" <alistair.francis@wdc.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "Reshetova, Elena" <elena.reshetova@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ankita@nvidia.com" <ankita@nvidia.com>, 
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>, "kas@kernel.org" <kas@kernel.org>, 
	"Quigley, David" <david.quigley@intel.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
	"lukas@wunner.de" <lukas@wunner.de>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>, "Fang, Peter" <peter.fang@intel.com>, 
	"sameo@meta.com" <sameo@meta.com>, "aik@amd.com" <aik@amd.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"x86@kernel.org" <x86@kernel.org>, "qinkun@google.com" <qinkun@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <atui5si5xs5px_Or@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-21-jiri@resnulli.us>
 <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>
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
In-Reply-To: <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>

Fri, Oct 23, 2026 at 12:07:28AM +0200, rick.p.edgecombe@intel.com wrote:
>On Thu, 2026-10-15 at 16:50 +0200, Jiri Pirko wrote:
>> Connect the attestation family to the native TDX service. Expose
>> TDREPORT, Quote, MRTD and RTMR operations while preserving the existing
>> native interfaces.
>
>Along the lines of some of the other commenters I'm not clear on the benefits of
>the unified TD/VM attestation part of this.
>
>Especially when you talk about a TD report, it is pretty specific to TDX. So
>calling user code is going to need to know about TDX anyway. In fact the report

True. For this case, attestation subsystem creates just unified
transport: EVIDENCE_GET. Nice thing is that the same op can be used for
other evidence providing instances as well, like SPDM, armcca, tpm, etc.


>won't have all the details of the TD either. Going forward it's main function is
>to serve as a nonce transport blob and it only has TD details because of legacy
>constraints about SGX based attestation. So just a quirky TDX specific part of
>the flow on the way to get a quote.
>
>Can you help me connect the dots of why the unification for the TD/VM
>attestation helps us get to a wider attestation vision?
>
>
>One idea... Not sure on it. We are currently working on support for DICE based
>attestation for TDX. This is an industry standard and AFAIU other vendors will
>(want to?) support it too. Perhaps if we could have a single way to ask for for
>DICE based quote, it could make a cross vendor interface more useful? Callers
>could just call and get some standard format they can understand. It might take
>some work on the TDX side to ensure the DICE format quote.

Yes, that sounds useful and fits the proposed interface.

DEVICE_GET advertises the supported evidence formats, and callers select
one through EVIDENCE_GET. Providers implementing the same standardized
DICE evidence profile could advertise the same format identifier,
regardless of whether the underlying platform is TDX or something else:

EVIDENCE_GET(challenge=nonce,
             object[]={PRIMARY(<agreed-DICE-profile>)})

We would not need a separate DICE operation or provider family. TDX could
advertise this alongside its existing evidence formats.

Makes sense?

>
>Regarding the device attestation part of this, DaveJ (CCed) is exploring this
>currently and can share some findings in a bit.
