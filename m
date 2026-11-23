Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447746;
	b=do+qbZW+iwV9V75tCm/qLmLnSAedGZaaiZP1giZ1mNEZEq5JpBWjswryPkOYS3AKWaRL
	 K/GedqUl4K2e3AXDGj+EqwpoIVny9AQC+l/YpOgsoEu7yx15YQ/I1pFLuxLnaTHpI2Ed6
	 3ss5MX1QRRNACDWCktgwEy9UMmNsbtqBv+blJdk3RI4QLre5LVBEJq4+OUOv1BSkXUHi9
	 KsrundDKYSSyQjkTrpwkPu8JO4C2PLEJbhYP1p4A2QurGxH5psZLN2/TDO9z8RCkYNteb
	 sQCCWS/SRSqhP0008oCdnAFJBlP4pe3pmZf65qPbw0zIcKy7PjL/E3HM3gFxRfGRVsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kjgFR4G5OQ9juZKj9Y5T78qgRaR4MXSjWG7XFR0Z19k=;
	b=ZTDnKKYQBSKifEZ9EzXS6ZQXeK7JQQBcv5eHwvjmyGl208AHu4zPuZBEz7UcgYgVJvTS
	 Eo2oRJ7cnwPkUIyqWN+hPGDZ1q+pPVRWJxygsTpXPH/vwezdyz5IwDwajvAFUDdjac8Sh
	 KGvCLai9+f6sKjNUgUfR/G8XsHWcS4dchyHF5kgmxwGoXmX9toeMV2ui8ESLxCquVUSwc
	 cWKpKTwAUgGdMGQ/NM8uekZZZ09BKwV/9k4LtcNpw9SYhbLNcS58wJ6P9SD++Wz4dhixh
	 VwpVd7dU3aqFE1yqB2AXOOIIpF28vNfoHF0N7fqk6+4fbxLvcB2GRYvMZBa+jpXfKJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=gZEn9koT;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCDB606A32C
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 15:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBCDB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=gZEn9koT
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55c35262674so26612131cf.0
        for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 07:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795447745; x=1796052545; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kjgFR4G5OQ9juZKj9Y5T78qgRaR4MXSjWG7XFR0Z19k=;
        b=gZEn9koTSc5kKwZ6QFAq2k7itG25aeQ1P/1B1oy6qdQ/YJfIe/YYqIN/LRz4A7j9a4
         udXAgl2Qqa8gtqlVseX61zmZp27lUQT5lFHKSCJh/llBWbjh+E3ZZ2Omi66Z7KouC05s
         WIChZGodznrqv4pvVFh7KN6lBQAzBKonkxCclQUidDSi+UpEfhb4ksS491sAxeoOdpbH
         hqlf1wnjsZEMhbG5NKTTnunD9tG80CNfVD+XZcccV4tf/57+Zy+VB7TRPls7pqFb1Vke
         LSNEZZa8f7IG+bwMPOdjEITLCY71V9FfDUKzPD982BXUTvmY4CFbGwyvlzJWrpOOr1ig
         f0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447745; x=1796052545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjgFR4G5OQ9juZKj9Y5T78qgRaR4MXSjWG7XFR0Z19k=;
        b=UtZ6033QSZrQoK7YiBZOdCs6dsBEbJQ8Nz0pN3niLtVqDHhfh5f/hdnicOrr+ZtYZj
         PpTjtGxWn9DRvxvethN61rwxBCgpvqYkEPvcnioMfE6VFIKQ12OEOCt+hn/l0LWMEEJe
         wH2p6Shcm5ib87n1Ac4tCiitgU6yEjA63Ku2re1aDr3CrU87B3at1dySAbuIHuRQ/tTn
         2GfFPAoPtuLOaYeALiDed86cGJtTMhF6Q/mmjJMJUwC0s5pWsxoeFh9G3gesrezFFSS+
         RbnaSv8a0FI8Uz3LXcmwovKEuSjAJ30rXOs/EnxTL7Q/rxcpdJ1OxERKTbY9+TE1Lkn1
         tcNQ==
X-Gm-Message-State: APuU4Z8hOiwoxGX4YalUhflqIsi1tFc1c+vJt9B7bunRBCyh8aXQzRK+
	f63JhSH9UAZ3uJXRSD8Nape1Ea4IIJPaxJa7/S7VJ0n76MsoJ7xj9KJgfZNhvLjabdY=
X-Gm-Gg: AZFdTZfhlyyn7761L5gNayJw2n1v9TCxu19IXyFaNMZ8Q5bDeh8XjKgKQp802BeGsx8
	dNSwEl4i4M2HfdJcBi9rPCgXxgCtEZkdRut3DR3DoKXCGcKKr/FcLKzEmhVIqEfIPHrK+tKthHi
	4/UBjpoT8ojf/B9rreBB7RLNc2YnEmpe72Pibs4nj83fhotxT8cAzhZYmiI6YpWqM+erZBLd4Bn
	+qELNH9RcvxZl1vln32IMNLVBzGTeAnmm/+Ws73JQx/v3afk4vYEA/zhr2oMS3TMPMFZbscFpgL
	zt4Gf2dsaNu3dFpHgdR3nMMv/I6fzASfyKgW43ZYR/x+5cu4+TKvrI7sBK5aTsVVZzI6qzwNfTS
	3r+ws1UYVaI0o28aHfcR82wZxz6RurgBgY/UlCP8oCwab4gmrx19Xc3ixNohWf3Aq4vRGaIzZUm
	ZxpQVjGUjsmz363k97Bh1bNoVb5xVizXFU1Z6MR3Yh+w7Ayz9Zg2q56y3+DqxlOCsrXJ45KDHVD
	2jkXLqU0JDsLyuN1JMPfdi2AgHmmuyoksnn96gLZiBvvRczjKcHeouTyZ5admmNwH01E5W15iPd
	qMLIAIToTzO+h3ty+3l32Y8/n2VDkMU1uRovFP5nxd32FDIEiw3eCa8zAUuEnwXi9B2YQc+Dwvk
	rSyg=
X-Received: by 2002:a05:622a:248c:b0:55d:3350:d270 with SMTP id d75a77b69052e-55d769f5705mr226617451cf.35.1795447744614;
        Mon, 23 Nov 2026 07:29:04 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d784517casm101253631cf.3.2026.11.23.07.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:29:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVVyZ-00000000sUM-05ni;
	Mon, 23 Nov 2026 11:29:03 -0400
Date: Mon, 23 Nov 2026 11:29:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 02/10] coco: tsm: Register the TSM class before device
 drivers
Message-ID: <20261123152903.GG179082@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-3-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261123083337.2731019-3-aneesh.kumar@kernel.org>

On Mon, Nov 23, 2026 at 02:03:29PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Register the built-in TSM class with subsys_initcall() so it exists
> before a platform TSM driver probes, independently of object link order.
> CONFIG_TSM is boolean; remove the unused module exit path.

Why isn't it modular? This is going to force alot of stuff to be
non-modular.

Jason
