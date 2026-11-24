Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526205;
	b=p1BEKlXyLIc/AJ6reBfVrTgWJOxudR43W+D7yh+MZkV7Fox2SE7JiWnlxSms8FSswTSD
	 2trG2/MbNRA7C8OgQVKdiDxAlNZxd/Jcm4aBDDfThuSfSRAhde74b12BTUwmii+GohvNG
	 /FJjFSg/t8TrQJhWclD6hsT12+2HGQZP33omBCo3cGc2biWcFXgNHLyShSwpdF1jWd72D
	 YthWmFgZ9Y0B1IyOvwrxpupTKE5IC2H31hwBs4aATqLtz7tAy73Q/T0s8cMvQLjVHzA1R
	 m9feQC7sTIAdTToiifEWfh1uSpXPybgK/zkRQtFmTma/lnpFLlfoPungolM0ZmycxGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0prXWPyKnaONv+XVyeK4p1EFWEfFGuwvhH1CWWabhJE=;
	b=tGn4c+LzdO6xbF3aA0hvYqEFf/PGqNndNiwNg9DyZLEwJymQ/A9TkjrppyLDui1chGLI
	 uRtorJOEaT7UMElAVhXpGuqWTfEMncXA75h5A2rwk/EXBIUe9OOM7hdEQVrYxds98XiCr
	 9Exy5gQKsgJgtSPeqECMB4LJAoc9zCLaqrzBL30ATGC3O6ieYTQPVxwKYpQuX+8UuLqBr
	 qnKubqtHJgbXIbeMQkz6ELoG+eYsA6gag7b72hxVyrAFvRv1oJYc3S9a1+Ft5UfMjdc5W
	 AtyQC+wzLH0i5a+0rMV4+5yWcbpI0pOPdTnp700mFxqRYIbY8uwJSLt8bSkN/0vhluQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=J4uJFFk0;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392D6606A327
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 13:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392D6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=J4uJFFk0
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67db1f6f50eso4581133d50.0
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795526203; x=1796131003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0prXWPyKnaONv+XVyeK4p1EFWEfFGuwvhH1CWWabhJE=;
        b=J4uJFFk0mntqXD0jfAznYbPniXa8DWEftiyUdzaBg0Qcljpc4/bQBLckmTm/jWh+RS
         W6rBbFYOuw12GhmMihNykU/Bn0iCP0bUf9qTJ6jTjiGfpHITrGR9BdA4zESfMp1lpdmM
         wIsa/Pg1EMjeOydb/vXNTnud6urcnZpQOsRaAmQTXFTSZ/EjWJDIUyI5cafz9HAgj4h6
         9XEdZ87gLYsQTdHeMiBDtIV/LX59mzcoAMEGVGy5ihAlq4dkXF49imXFVOj6+HDk5Vv8
         HAMVhl9PZoYyKRtObPqht0mtagh6/dtcbL6HQ1szljyOcarCixfNW8hL30S7GmaKiWKX
         NZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526203; x=1796131003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0prXWPyKnaONv+XVyeK4p1EFWEfFGuwvhH1CWWabhJE=;
        b=c5yPWY4m9/Jebi45piMuu339MXIbEkmHXtRexU3RRe9a4eFDOHPHbTvKd3VGtPNi9N
         8/fI9USbTjyihBmZuLW4mmDJRAnrOCojysfK29nKP3RI9QZTCIUemCZiTgyGQioNKhUl
         M4EgA9KRidNb7rkZ6hMDsVrquXlj+E1njNTcmx33JBZgwmGe92DbsZTyvPsikXM5xIJ2
         u6n8EECLM5rVoh3NqwNvX0pgx375TxJle99VW4UV97+gENEzZj1QlSezXTWsAd8I5Peg
         zSV1bgiCWwa5mbOgm54iqv/vx8ldX/zuAu6gdhUbEjQv8hdLIOpTk46seA9Thh7rLIPs
         iAig==
X-Forwarded-Encrypted: i=1; AL+hErHAoimCKj+YmrwBVMyjBZEaLthE4MmGQrKJzErvRQwmTo3ViboHBYg8mgak6kJGY0x7ET+41i/A0Eo3@lists.linux.dev
X-Gm-Message-State: APuU4Z9Qgcs9aiLcTxGtMgbu6T5UWfre2dYeQWyW2RnTfG9Xa6RVFAJr
	+eQJCdGRh6c5Edcqug6rOInymDU64075J1HXzV2By//RuVksArVuRmVraJJsAlHAXHM=
X-Gm-Gg: AZFdTZd++rqsnl5/PN3xeZFVEV4F+KZFIEqqLyaIZKJgSR2G3U9nD3Xbg/fm+7vMJ91
	bBJZU1UOJrcYqgwSCAXgyPDx9bKv79zqV7kBK9Bwvqf01yzWsob2qAVvpjIVGkYXqnL9isDW5Ji
	LQQwS8HHKmPJmXCtu4YAf3GY8p/lq+rFgWDIDluC/bp58jgCRsKW8owH89O2ZPaK149MSQOu+WD
	cWjXZ1wpW/kqCOlHFJK7PveMgJcpPm8SUSAIG1mSGxfLXH1utdAfgYm6PpqM0N4J7A19epG0LQL
	u1Ko6ndqevUZKC0n/sX7tjHV4Y5NbAQQtVjqG+ctIuSDlRiq8jYP3DMsdQoPBFo++qkYKOG7Y2h
	Id5I7ZH8cc10d91vM75GgESDglWdEIE0Pa5D9BkOum9AuZ2gs/RpW2VwZBJFZNLsj8bF1DThyw/
	n13L/X9yPuEvNtn2KQP5x+5hj74OS3g6JS7dE4ayvac8NN866QKAAVCDYgHLsOT1VL3i3mw3iuX
	IgabOI0tNk1z8677Xm0gpEqIrKEmhNTB0ksdImfm5uLD2rhMfgs1RMXaX8JFgSF9j9mBPECsK9i
	8ADyBg==
X-Received: by 2002:a05:690e:813:10b0:67c:11c9:2d10 with SMTP id 956f58d0204a3-67df449142amr3986970d50.89.1795526203028;
        Tue, 24 Nov 2026 05:16:43 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1037775085a.17.2026.11.24.05.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:16:42 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqO1-00000000P3N-3lUT;
	Tue, 24 Nov 2026 09:16:41 -0400
Date: Tue, 24 Nov 2026 09:16:41 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	Dan Williams <djbw@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 00/10] PCI/TSM: Support guest TSM drivers
Message-ID: <20261124131641.GE9566@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <2026112325-emit-squeezing-5d96@gregkh>
 <20261123090623.GK14811@unreal>
 <yq5a7bi3riha.fsf@kernel.org>
 <20261123115803.GN14811@unreal>
 <yq5awlq3pto0.fsf@kernel.org>
 <20261123135638.GO14811@unreal>
 <20261123152533.GE179082@ziepe.ca>
 <yq5aik1n4iz3.fsf@kernel.org>
 <2026112429-expansion-wilder-a0c2@gregkh>
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
In-Reply-To: <2026112429-expansion-wilder-a0c2@gregkh>

On Tue, Nov 24, 2026 at 07:44:03AM +0100, Greg Kroah-Hartman wrote:
> > @@ -617,6 +619,7 @@ enum struct_device_flags {
> >  	DEV_FLAG_OF_NODE_REUSED = 7,
> >  	DEV_FLAG_OFFLINE_DISABLED = 8,
> >  	DEV_FLAG_OFFLINE = 9,
> > +	DEV_FLAG_DMA_CC_PRIVATE = 10,
> 
> Again, NO!  No "cc" nonsense for device states please.  That's an insane
> policy decision that will be driven by userspace crazyness, NOT
> in-kernel stuff.  The kernel will give userspace the tools to enforce
> this type of policy if someone so desires.

This may be the wrong place to put it, but this is not a *policy*.

This is a "DMA property" like dma_mask, coherent_dma_mask,
bus_dma_limit, dma_range_map, dma_params and so on.

The name mirrors the DMA API name for a related idea:
DMA_ATTR_CC_SHARED

Unlike the other DMA properties this one is changable dynamically
depending on how the HW is configured. The TSM is in control of this
HW block.

The userspace policy input is how to configure the HW, but once
changed the DMA API switches to following the new HW parameters.

Nicolin, can you put this in its own patch with a good commit message
so we can have a discussion where it should live?

Jason
