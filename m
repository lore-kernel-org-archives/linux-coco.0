Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687379;
	b=Wt1NPs61BPMI+gdPGFraKuB6qryQ2w7cmjgcwiFMPFmBqXgRROBzE4PGEMyeInPvCdRH
	 WAPb48qUiXY6RVjaKv6iotgjEv8CStXXFw6d3dzgFimRj2ec2TeT3VmSgzfYISjiv8Z4+
	 soPt2J4NSW/WY/dHBMM3UJajbntc3MV4ZVX2QHspt94Q8jY8cHHIVMUXAYbKp/2Q5sXNw
	 BrtS1NcnAmgey+AXTkrpwgMjDLbJ4WfkNHhcIkKnC3h0kfEhg9vZCMhpBsbfGE5ockh2y
	 uMsEf/WS5IOj6fhzbRnH/pGgvRcP2Af6KNbQIzy22HTZZ9fqx/oKw9B8KjkGvaQBBxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bb9yPFVCzZYVNrPWeZ2XIQWqfvcxCLSzUADzdeC7Nqs=;
	b=OffD2vgSXkUat0QGMPb2ru/HIefZyflsELBl7tJaTrylCMut1mseB8ywixDuF+FV6SuQ
	 QU+sA8calrF2nYd3N62TmQICZW+UbJqj28mqEMnebwBjADfKlMeDFAD5LBBo3Iiv1RCQZ
	 Cou0tpUKenUfjSMlXmjVmBiMBYUuLMhelBJZUoVMrNxWMbbkcwUtTAkv7ycbiPWxaoORI
	 jWJG6X9TNmPnNhMn1faF65MdR9LsIZPlSaEzvWcLRRvHMLLiUIEHetTPeBYybuB2srKKM
	 r2gKvb+0rxFXTl3N/pUnm4wpZtvaBW5ltWEyEpBq9IIyxT4gB7j3xSsZBeyHxadcSQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kXZ7fYh0;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A21B606A319
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 16:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A21B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kXZ7fYh0
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91ba702cceaso954046d6.0
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792687378; x=1793292178; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bb9yPFVCzZYVNrPWeZ2XIQWqfvcxCLSzUADzdeC7Nqs=;
        b=kXZ7fYh0oDjbY92e/7z9Ap7YR0Qw+gB7YiGInGuvMNUttBPEZWxZ/g+KCz0Hi/u8Dr
         gC9OI8V6MMMfElWHn4cFx+/2l0yxJfrbRjRpnMZtLG07tOq5RbtoK3W3b+Qg/+HZOiEf
         4++05ecqUH2UNPNLM/a48x/4lBcATy9DDKjSpSsKodout12NdS8Ax4bjuL0gBtaaA2Ne
         PnLUv7vtRivdo0yiMQaAMdYsV//Y+KFKA9zFtZJU1PTXa/zDvGllvISaORo8zBHTYXzW
         6bnSIWnnh3WRFKpxio+oq8nw6xWCRzDKAkTpDkEb/9p/KYmSetetrgxa2nI87W5IoRSz
         Tlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687378; x=1793292178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bb9yPFVCzZYVNrPWeZ2XIQWqfvcxCLSzUADzdeC7Nqs=;
        b=BBZYcMBIxv2ZaHyaNSPw4vKtgH+KVYcI0c+IqLxR6QnzmA+vrJEoYlVMe+2NPPlFC6
         tg3hv7qjtNiONviFjBRx4FoxQ1KnTV7bM75hG9YjODClBAafdVLjT1kkn2+QZloPJ04w
         tWcZmc9JiHi85m+CfUNmmlu2K3Upt3c3LzJK4OQUhc1xQpoGSgqdtqrxUISoIuM+8tXh
         /gBRuwJ0MANqH3kbYNR+TIf1poEPwCdzbch5FHxxiT15oorL2Wv3XAn55zB8kGEQ6PXI
         wlEgosPohdOibnb46ZT8RIa266tXAf8PvA+1d+9x/cuDUUCfEt9FNsb56NC/sUVy4xg7
         bkLA==
X-Forwarded-Encrypted: i=1; AKwUvBwEfhTVOD+RtD6fYSk7yCkTSn4zJ6f4r/1/hMGDeVsTRGAdAVvaLi3NUQ1uWymeMSj7x2gtuGwog6WH@lists.linux.dev
X-Gm-Message-State: AFq9FYKsrQXj/srb34ATapFqNDXt+YTR24HTCf4I/m+whtjvdRHTrDnI
	Es00tkIgMUqGPv563LLrNleh5HRnX5tnu7WwPIFkcPMRPXSTv2vd0fQN8pgvhnXqwBQ=
X-Gm-Gg: AYBFou0rsFNg8C2/gnkIIqglha7dwNrnT4D5KYNxZTOur8/YVmvJNH+LSl3sTGuWCGH
	w7lgn8zWBOmpUpeVk90EA7rGr/TYT972/LHvEd8PLZCdIXinCB4NiT01OVd4CTWamwmF4pug/4h
	wWL02ISBHQ4WQUlEOHMZaqKIJruvdoqQ8H+qW1IycHOdiqvmmHZMWiI/LyzehO/0ExvZxqP5uDF
	bM4lcRZj+qdAjRpQJYn9xihA7HTrm+AIXNQ8FCCT/Mu/TRHMjdaHHz6o6ZBELVUl/YA4b4pqm+1
	w92TNEjtL82k0QTeUim1d3NGPIdqEK+6ID0ImALTS8YbiwhMlxfjS3W3XaUPAvGBAcT71jYJaUb
	GZkqALI5jwRG0Qk1SvzuVUgU0JgVc8JDhOtVVQeer5Rvk+A6KFBBaZGjbWvNkICfxr9qQzyhpVT
	26j9NX798WzOvaZcajsl53WuiIW5K8x/6awHChqxt6GRGoY1qVHMwZ0gipI/QXdNKpHv5HVvRcu
	Go1+D/GwKWBim1mX3FGrvOV2vSWYVgBHS/b/oDHolTAWuIflv22BRVSYhLkWXLTeWryh3drOyPd
	IhVtHFSOhJaQL2wVwfe4+mRDxJeb1J1RFXl6hg==
X-Received: by 2002:a05:6214:6017:b0:91c:3632:fdc3 with SMTP id 6a1803df08f44-91c3632fe59mr9119646d6.3.1792687377918;
        Thu, 22 Oct 2026 09:42:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c37060bb5sm1460126d6.24.2026.10.22.09.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:42:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJvsW-0000000FUPr-2EHZ;
	Thu, 22 Oct 2026 13:42:56 -0300
Date: Thu, 22 Oct 2026 13:42:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261022164256.GB3381610@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <yq5a7bjajaco.fsf@kernel.org>
 <atooh7uO2RauUTfY@FV6GYCPJ69>
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
In-Reply-To: <atooh7uO2RauUTfY@FV6GYCPJ69>

On Thu, Oct 22, 2026 at 05:38:22PM +0200, Jiri Pirko wrote:
> >I am using this to understand what the IDE setup flow would look like,
> >but it is unclear whether the connect flow belongs in an attestation
> >framework. I understand the desire to pass the certificate slot number
> >as part of connect, and sysfs is probably not a suitable interface for
> >that. However, is CTLV the interface we want to use for connect?
> 
> I was thinking about this and "connect" really does not belong in the
> attestation CTLV (same applies to "lock"). I was thinking about some
> parallel PCITSM CTLV instance, but that does not really click as well.
> 
> Currently I'm thinking we can maintain existing "connect" in sysfs and
> extend it with "lock" sysfs knob for Realm side. Both would create
> ctlv-attestation-spdm instance. The same spdm instance may be created
> for other non-PCI-backed device.
> 
> The proposed host flow is:
> 
>     sysfs connect: select tsmN and prepare the connection
>         -> negotiate SPDM and discover certificates
>         -> register ctlv-attestation-spdm instance in DISCOVERED state
>
>     SPDM_GET
>         -> populated certificate slots and digests
> 
>     EVIDENCE_GET(CERT_CHAIN, blob-instance=slot) /*optional*/
>         -> retrieve candidate certificate chain for appraisal
> 
>     SPDM_AUTHENTICATE(device-generation, spdm-slot=selected_slot)
>         -> authenticate the selected chain
>         -> complete backend-required session and IDE setup
> 
>     sysfs disconnect
>         -> remove the attestation instance
>         -> destroy the native connection

This made sense to me, I haven't reached all the details of SPDM, but
this is like what we discussed at LPC.

I don't know how much SPDM stuff is done at 'sysfs connect' time vs
how much is done at the first request. None of that leaks to UAPI so
it doesn't matter.

This changes things so IDE does not setup until SPDM_AUTHENTICATE,
which seems reasonable to me given all the constraints.

> The slot is therefore selected after discovery, rather than supplied to
> connect. The attestation instance represents the prepared connection; it
> does not exist beforehand as a controller for a disconnected PCI function.
> 
> This requires a staged native backend. It is not how existing automatic
> sysfs connect behaves today, and those backends would retain their
> existing behavior.

I don't know what we do with the half completed sev stuff. I would
prefer everything align to the same flow, obviously.

> ># ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 connect pci.generation=0 pci.tsm-id=0

It is pretty cool you could just make some edits to the schema and
then use them through this general tool, kinda like sysfs, but not
like sysfs.

Jason
