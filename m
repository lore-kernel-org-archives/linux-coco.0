Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770135;
	b=Vt3mWbfEBxokkcJQQDeuDe55sCD0g6/1Vh9arawl5dz0vJTCPvVag7iTqhx4nzADQg3b
	 5DwkLpOKGq7gw/oagm0oLIDG7g4yj3E4+lrY5jRGQHXYgKmIH7kbHdurkT+mxFuhb3DUf
	 A2qQlTrHSvHYtsAXNWTL2tK8oorSoHlKmYCTizZKA06Yu6iyN69mmIS//25/xOdeJO8MO
	 0b7XW42L9sRA/Bw43nIKKsmR4N6hdz0odY4I1jw52SGzC82T9Ps13HAyPbLpZy2Ckl+uy
	 2jNLbmm48qosuaPhzNtCXq2ZB9+t8udOG8JMqaburSGEi5rxCnGIsJTLPJYLKJiRcxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rug7Neq15IHiij489G0zvk8NhY0SVtgpPgzc6r/gkrk=;
	b=vcCUK5JEm3BlL7WqB2u56feUyB7aKGaHe4V2uEhyjL2SbNyAESIpGq9KznUfFu5lARK6
	 5pPKMO9avZkx9N2aLNcjHZS1GOMVR3JwoQNgkNLkB8QFDazlRu/EGIKWwjatevdT2zLqF
	 I20DVwJlVJkmWvS+HVRganLIRZ+A+3vbGp+a0K9aMbIJh3O6bGKE4S7DfL8+3dQEKNv0S
	 D2DDULjTO4WMk3OctL6MimN5fRtpKrQHYyMXA6+gfWY34HaJE8MjVs8HyncnTK5Czmw2W
	 Bnhn3WQLg7L65D2Nww5ppfuA4T1710ntqhvb8xYfrDzrpEu4Bhsnpvx4wH1W1VSHIxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YjbzO85u;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2477F606A32C
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 15:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2477F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YjbzO85u
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f3c8958d5so100813885a.2
        for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792770134; x=1793374934; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rug7Neq15IHiij489G0zvk8NhY0SVtgpPgzc6r/gkrk=;
        b=YjbzO85uk149GL81dIF8eapBStdpKTurq/j/uwz9X3HySPR9vjXLCUVMjy6T3p3kjw
         ysZh0zezWERFfNDfqTZevNeFBrXATfaJzYbznu6/CbKwzpj38ker6qAlaYB2HXCt6z55
         tQaYpoPHsXi7lb7OjWnBHxB546voS+Pd1u/FgLFGrxGvGNAhYoZ9FU8kFexiwvDav5n+
         s20q09MiXrchWw+vOn5hSkrz0qCRoGrSwgRwalLxsKctIB6P46nAK5scpZnDUWtfdNg2
         5r6rSLzG6Lpw7wtHtXSRltWchzsG+LgHAbs9BbfMfwQbRKrjUz6/R+Khg+Swc2jMO4Ys
         w7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770134; x=1793374934;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rug7Neq15IHiij489G0zvk8NhY0SVtgpPgzc6r/gkrk=;
        b=CguB8HgwTpfgMowTxBz+SXOy4+V/7/IZLhtG4cxQo/6i7dMzisTvmoRQRopnYmOrLT
         oEmWVyQr7saaWLF3ujyVmU6PFsWQ8ipdtaRcaikVWXvRrJTh+KK2FeG1OZc4egIhsQzB
         FgWZ8pghywZ4QIpvYexE7poWEwPKTSlMPnEGu42rhl6wIuWs01DIrV3PsLTnRGZhBygq
         4zZQXqJ/9YNeATAOOfVQctiRSL4nC9+sr9ClIKaHiR89tC9j1CRX0uWbUlnFLgwgdi7e
         LJqyfsgAt7iOpotVQp8YU9AJPb1e4Dm7DLFRLAV3cFSWP+sAGJA2T/PzaTnHikJBVf/G
         xErQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqdix+QXc5bp1lNgxljRR4/fSlWCo8UVIK6ErVGIz6bAFv0Xw0l1dqDJhdb2zGYvnAb6AMckM9GGEA@lists.linux.dev
X-Gm-Message-State: AFq9FYImt4qN9j53HlbfLM1/jfWEaLWmEKi1+cddsMkVjFQ0OEjOqYlS
	wIL6tSkw5AQDCqAHaZnJKTQhfKL1l42LeoVE1I5zg1tNdgltSX6J9dWAaJtNLulG1VY=
X-Gm-Gg: AYBFou2k0k2MtT4DPjcXxoaD3Zg5SG1Z2oL0GbDpYJvW8rsy+13EoJAuADP6lGOiTCm
	90cASmfZMIrEJG7+Qn5HTbETquGMnlbpKGbAIkZPI7uQfgM2j9T4o6KvbY/eqVcgVztlOXgKfK2
	mpjsI5qOBxy2F5UyL1gUMOGkJbrMhw+1+cVVlZBqmaOeFunpHtciBwbMzfU9RtqMmIN4j2AO8C1
	HCaKLRS0ZVvNdnoS3OlLBnRq/VpXFxbAPJRP7FPVqeFxQGRYFBtAdaA74jNxYlO1vQo436ogrcD
	ZoiQHEOHdvOT2y9sE6KbdHkFCpPYBkH2ItdKFDCxrSZ0gBnSP2q4ueWPpT/WasYz7pEhDK7M6Cm
	/2WNNjNBEIrR1zzA+UQnOahw6v9zE3e4x5jHFe8kfGuyNeHswmF95tp9ycRzluWz2A+zD/oSPlo
	SetsKw6qNnm8uXhqObq3O11YHHG6uhdrm3zdVzx7kCL89VsgldUEUqu5SOR8pNMr+p6oz3bJG/y
	D2oj4JvNiFSF/DVr0RPiKvHORMTK1t+urrxgmL/flhlwpgTlFk1S3a3b83UGpxTZ25iWdsgO6v0
	oLO3XHnMRjN0ycCT5aCRwvGhPlaYp6m2bR78+w==
X-Received: by 2002:a05:620a:1a11:b0:93e:5ef8:c794 with SMTP id af79cd13be357-93f6f9648bbmr497429285a.38.1792770134059;
        Fri, 23 Oct 2026 08:42:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b362a5sm45129985a.33.2026.10.23.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:42:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKHPI-0000000Gn79-3Zzp;
	Fri, 23 Oct 2026 12:42:12 -0300
Date: Fri, 23 Oct 2026 12:42:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261023154212.GJ3977851@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <yq5a7bjajaco.fsf@kernel.org>
 <atooh7uO2RauUTfY@FV6GYCPJ69>
 <yq5av76sj10a.fsf@kernel.org>
 <20261023142038.GE3977851@ziepe.ca>
 <yq5ase1wiggs.fsf@kernel.org>
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
In-Reply-To: <yq5ase1wiggs.fsf@kernel.org>

On Fri, Oct 23, 2026 at 08:58:35PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Fri, Oct 23, 2026 at 01:34:53PM +0530, Aneesh Kumar K.V wrote:
> >
> >> CCA currently takes the device identity index during pdev_create. I am
> >> investigating how to retrieve the certificate chains for all slots. For
> >> now, I have implemented the sequence below.
> >
> > Yeah, I think the consensus at LPC was this may be a gap in CCA.
> 
> I checked with Alexey, and if I understand him correctly, TIO also needs
> to establish eight separate connections to retrieve the certificate
> chains.

Lovely!

> For now, I am trying Jiri's suggestion: use Rust SPDM to fetch the
> certificate chain and return it via evidence-get. evidence-accept then
> does pdev-create with the specified slot number and compares the
> evidence data returned by the RMM with the value cached by Rust SPDM. If
> they match, it uses the cached value for set_pub_key. This seems to be
> working. (FVP only supports slot 0, hence only one blob-instance)

That's a pretty good idea, and works for every arch! Maybe that is
the best long term direction.

IDK about all this "Caching" stuff, I'm not sure I love the name
"Cache" to refer to the security important reference certificate
bundles. It should have a stronger name to reflect how critical it is
in the entire security design of SPDM. You select the certificates
once and everything following must match that or something bad has
happened. It is effectively a key part of the channel binding.

But yes, RMM is sort of backwards here, the slot number should come
with information about the certificates, but I think this is fine to
have RMM fetch them again and then we just confirm everything matches
the kernel's target. If we don't do a get prior to connecting then the
kernel would just adopt the RMM's result as the target certificate
chain for the slot?

It certainly seems like it should be all sketched out and the uAPI
confirmed. Given the state of things I don't see an issue with a slot
0 only initial configuration (ie EOPNOTSUPP the certificate gets) so
long as the long term resolution is clear.

Which is an interesting question for Jiri on CTLV, one of the things
we have in RDMA is runtime schema pruning. Based on runtime device
capabilities parts of the schema can be disabled. Can we get there
with CTLV too? Then introspection could return if the underlying
implementation supports some of this stuff..

Jason
