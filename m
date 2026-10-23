Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764742;
	b=0iNaK8wlhUGMxAVv/BnH9uf3aN/lR/MelH9wTKmsf7MmXLiIBQsv1iZ46jEOlETH/kvG
	 yl8gBRwHA/cx+zQ7zwvu293KLigxcHz8njVR7y+OhiAtAt4Md0n/T50kdaXdZ7h2UlH53
	 wgOG/zkEhAjeC8VzyDvvMC9yewMjbcdy/i29kSOQXaJHjiqIH5JUTdqja4t1ZGgR4m2yD
	 ETNO45DYgHW6lpEcCAUeN6ulOkSJMp0voWamxfTmPQIjtX/eyiWZQo2pXBW71yw0b46xq
	 ivtWAkIibT/CmW7ADqdJrkBy2FUHGrOYjQBPeHVhhouZBN2nuDiJkdZmN0ymvtb+koA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oJA2TtslEJ+KdyUtrabQXqX04jIwVEOHlYhkzmtq54M=;
	b=M5c3cIwGv3k3R/AhJh5+/+liOtyLYo6oHUqzszbCc6zPdCcRPqQiWA4lhbRZZIbkGyVE
	 kQX+kruv9UjruGVICmk/WS4hqWZq/MUxD6kVYlQIebtaNuwvdI7klADqiCRqz8S0XWC3I
	 EhgcZQYjtlyKxjLwWsS2g+hkYFgb+2LqnqBHnSbHbAueYWj3E+VmEdrQrwdlqK9a6J2Xs
	 qb9slDNV/BAEgYsudP0/89wRpFrDJPdkPzfnMi19E1l09WzwuNagZn+w9f9GIb38B6T8J
	 nG0c2zIXJK+6kn9x0zjezVKOLiUSXuqHcnrCV4sfQDj9tvIGG4TEn27IgdomjqrsngQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ZZojUW7Y;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C4E606A31B
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 14:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ZZojUW7Y
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e63ee7b4cso111525285a.2
        for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792764741; x=1793369541; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJA2TtslEJ+KdyUtrabQXqX04jIwVEOHlYhkzmtq54M=;
        b=ZZojUW7YWJLGG5xa82ElFoNEuqvBNGwpTRVkBWrY/+P+1/aEjkz4x3Ye6PPvEwQb8r
         VBxK1NthCrfhJnSACr/zqijWviOzI04tO41uUF6AWL++0yfYAS5tv/cHKRFTzVFiesxQ
         hB1Bj5Bi/LgwKP0RCg2qXmYU0USw+xT1QrK35sPS39aLtmwjQCE8SmtM1mifYFR3smBJ
         UlLnj0rCThE1GSQ+G7AhhQgfHIFB7A+W4bBfrs3FBHpqy621/suEIaqH4JKw9X1SMEwK
         MZW+KQ2S7oqDJIXSEe5Yeopckou3h22rINaD3PJN8Jc3pRoPVSKT9Y/vq5RUAXDC8oNE
         FVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764741; x=1793369541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJA2TtslEJ+KdyUtrabQXqX04jIwVEOHlYhkzmtq54M=;
        b=gBC9KEr4Zv9AARzGnS4ZLPdtI51XIJFps1CjyAJ60DMTPthKprIGAle71VOPVsFh9A
         gA6bX2fkjvSwPaxhcNQ3MzKo2OP+BpnDpYRR6Hk6yPiRH02JqAFOIgPptn7BIsjZDKEX
         WZx5CBV/joEVeVdB8USuxcUt4BpTj4AGSQDtj3xG3XQe7aHMQvAF6I5Lwn8FsPQqg8yi
         9wSNlnS6vUc/Jvmfnb+o9HGvGE2oJw5n36QARaxrOf51a7W1orfoc7iLvHhNI8Nz6shn
         /Dz3+fRyOOq5zJGm5B7ntbzV2RPfm5IgSZjRPvQDZRG1Yq+xuBHfM8RjArixVoWAwOeY
         yCAw==
X-Forwarded-Encrypted: i=1; AKwUvBwepsPmDCI3tSsl79l965/9xRYQ/UtPftoMbU324X81XnH9co1MqiOfEpo44qI18pRGtNc1QpcWTzgt@lists.linux.dev
X-Gm-Message-State: AFq9FYLCMiSgyys44uuoJtECaeBaLbocqTelCIcqTPkRdFOFgBUlbAkv
	RR384gWEmyME8W0Qy0gwEJHKLq09V+PPWBoi/9y6NqHERP/NE5LhunhoeQ0QZFSaUE0=
X-Gm-Gg: AYBFou0gPaiuoNqtQFc8vCk2LDAxk1peWaQyW4aeIL7uD4g/1TpQMhNPGUpbBo8jPy2
	16B/lLxIfed7UegaWIHluk5tESGdzw0uAKqudhFxsjNTjPZOgwZFDNH+oKN4a8XTs1cdvzVoN3I
	FsP24ea7z99bjGYf3Zeraz79gDt94WKLY02sV7l2fyAzl01tv4dnzLzF5EjFAqZWcSsR1eywlvq
	UWLikv4csIZUGXNPWiMgPJsZID7CoC83d6oGaFwu4OG9nBkLVmLafOsYgOLFgLgy0k1xhTqdOz9
	v0k2ngOV8HSAkUMGbe3qvr3T6FRB0FFbL1fyLnxWNyedhP2sIfjm2Fsi7N0H2EnWAfEKQq0UZZh
	hvWiAersFMZ4Tx9EGsJhZbO3y4W8180twnbxP0rnxqmIT2BDK2JzLiRiMqdmE2JKvJZ/x4tKHYD
	NBS+g4/tkYASvig5X3gx9M4rHjOqijNbGlEVgvKm8PvbEnxfXYaoIS5a1fiEL10tvvCg+pFKT6z
	nwhoSLZxuD3WAa5BIkNs5KBLzBfip9pCRt26dl96NPXqsBkO9fsIguPtgWhSekgr0HzfbmRAOXZ
	39XQ22bIdSduk7cTFaiEutd/6jgo12SbK+nJQg==
X-Received: by 2002:a05:620a:280d:b0:93f:53d1:54c7 with SMTP id af79cd13be357-93f6f8249ddmr448815485a.70.1792764740975;
        Fri, 23 Oct 2026 07:12:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b32ed6sm25764985a.34.2026.10.23.07.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:12:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKG0I-0000000Gigv-2y8C;
	Fri, 23 Oct 2026 11:12:18 -0300
Date: Fri, 23 Oct 2026 11:12:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Jiang, Dave" <dave.jiang@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"pgonda@google.com" <pgonda@google.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ankita@nvidia.com" <ankita@nvidia.com>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"Quigley, David" <david.quigley@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"Fang, Peter" <peter.fang@intel.com>,
	"sameo@meta.com" <sameo@meta.com>, "aik@amd.com" <aik@amd.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"qinkun@google.com" <qinkun@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261023141218.GD3977851@ziepe.ca>
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

On Thu, Oct 22, 2026 at 10:07:28PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-10-15 at 16:50 +0200, Jiri Pirko wrote:
> > Connect the attestation family to the native TDX service. Expose
> > TDREPORT, Quote, MRTD and RTMR operations while preserving the existing
> > native interfaces.
> 
> Along the lines of some of the other commenters I'm not clear on the benefits of
> the unified TD/VM attestation part of this.
> 
> Especially when you talk about a TD report, it is pretty specific to TDX. So
> calling user code is going to need to know about TDX anyway. In fact the report
> won't have all the details of the TD either. Going forward it's main function is
> to serve as a nonce transport blob and it only has TD details because of legacy
> constraints about SGX based attestation. So just a quirky TDX specific part of
> the flow on the way to get a quote.

I think in the way this stuff ended up being used the userspace isn't
actually aware. It just wants the VM's ROT to sign a challenge and
forward the resulting blobs to a remote verifier. The verifier needs
to be aware of the format, but the collection agent should not need
special knowledge.

ie from the perspective of systemd-report it doesn't make alot of
sense to have it know every single special configfs path and protocol
for each CC vendor just to get a 'sign my challenge' operation.

That's the general north star here. We'd like all the vendors to be
able to do collection without having to change systemd for every new
innovation. Again I'm looking at 5-10 ROTs in our platforms, it is not
desirable to go and teach systemd about each of them.

So broadly, this requires a challenge to go in, a signed blob to come
out, possibly some suppelmentary blob[s] (like certificates), and then
labels for what is inside each.

Userspace would collect all the blobs and the labels then ship them to
the verifier which has to understand how the data described by the
label is organized.

I don't know what "nonce transport blob" means in the future, nonce
without signature sounds like a strange thing.

> One idea... Not sure on it. We are currently working on support for DICE based
> attestation for TDX. This is an industry standard and AFAIU other vendors will
> (want to?) support it too. Perhaps if we could have a single way to ask for for
> DICE based quote, it could make a cross vendor interface more useful? Callers
> could just call and get some standard format they can understand. It might take
> some work on the TDX side to ensure the DICE format quote.

Yes other people have asked about DICE interfaces for other ROT
devices. AFAICT DICE is more about having a standard data format, and
you are right about everything..

Like SPDM I imagine a set of interfaces defined by the DICE specs, but
we'd probably still want to have the basic 'sign a nonce' interface
for opaque transport.

So from a TDX perspective, what would you want to have as labeled
blobs for this kind of operation, now and later and maybe someday with
DICE?

Jason
