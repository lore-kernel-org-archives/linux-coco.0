Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616400;
	b=WNvtLVV0afZDZrAlTv8IL+xv60TLSB9RKr7jOZuIMA+LBar1bnXzKZgg1l7lTOaqjEoV
	 n52nBsF1O1jd8OmnrNesOjj8MCAD0jiJtZiWzyWwBAp0zA/F5WufpH8L6KExdzN3nPBDk
	 0hUridTee9I8t8lG5LBAh2a3h2Z6ZIqTkIzOmQGJg756gbcVlImo/L5s35LE9MyFtsWhI
	 aIunkXbfsu9/1IFn0QRGl/IVERI+CHF8VMZiYyGWdQ6CSAdI5rPb7zVufw5M/cCH33aUa
	 BP5lSThFZchy2gYt/XzDRgqFQd3sCLyriLOrCgjfkekOnn2rCR/JBIwYVsXeWlB6q5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/sE+cARi5XYpGFmCaYKKwUnoyCBvBLnkQPGNB1SpCIw=;
	b=FUtZGXrc8xyANDLfFABTYOxdyChOeGC5sD/0eSTxUXj8F54yBKaljqNivG/GxAhlJDif
	 Fk+8NBFDuR01/bjezyoINtGCUBlDSQev0Ot0DZiNRXCozBQ7t1GjGrgE6MHC9WETzNI8D
	 5yhUisqZuG4fi9dWTbYrsTOyb/llu3clL2BQ/ODxkkFcyuMkXn0Ghf7AlIpMpYe8rkx5o
	 yqwX9Zs2jtapuAtREIH6CBq0YqbUg6lFFdTADMNQ/eG5rnvw85A0NlLMBF99nL7UPE4Ri
	 +2ow8bfLnBxR3TXNZl6a2Q6wCR1+sD4n0HvuyNqPBE5zTJtxoSWwzduqIaskX09Og4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FbLVGroZ;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A879B606A321
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 14:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A879B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FbLVGroZ
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99e1408dc59so2525618241.0
        for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795616399; x=1796221199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sE+cARi5XYpGFmCaYKKwUnoyCBvBLnkQPGNB1SpCIw=;
        b=FbLVGroZe/25+QYBXbt348nP/KMTo/0wN/vlMMzGlQe6KL0KHn2XV1S3kTi9qR843Y
         tKhDG6uWIfQDmLePpWq7uop6ZP3gsN//8fMRAjchZ/q9bA1eQhyto0IeHY7QA+KCyR8X
         4SnbGvTh2DPPuAbEOpORquswXXRhJsNU9BqzKcdKQXsxRGFP77e741urVMDlaYHtDOkq
         Q9BC7kxys2KmOnahfGU/KWNx87k8EplF3RZfMXiFs5d5PpD9iod/aJQsb/9lAfbKlDhJ
         iEiJr8wM3qzKK+X8fJEFwHT1UNZCbtWy8jvPhL8PrR+thOvEst1U4XIHx5jL+UNXnUVH
         NasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616399; x=1796221199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sE+cARi5XYpGFmCaYKKwUnoyCBvBLnkQPGNB1SpCIw=;
        b=R55a8Pm7+gW3O0OVkTIWHDAoPz2tzEbe7/w6fFafIUf2wZZuoFrC2n495FQbUqq9LJ
         6nPQIKVtlXfKgA94aSABDkJe9J4d8bFoDFYz4kph3JDg067+N/GJU1aCjs7ESJs2rUJ7
         GNdg7/JzlGvj3Gtv1xgFUCjwdTCqaDC315DB9kdgIteeQYSkDJO68lzassylJ9kLRsHd
         bhURrjkpP4JigY9EFMXzF5SVxuCnmCljFJh1Bm3cBZU4waXdHFVjRI3t6cKA4NW3PvCh
         qxM9Dpxe1aXzF/QdU/Jfe5D+yfmt5zvq4N7vbcNxHe6JjvCd7qjzdKzFyQ48IkLCRBgM
         U/Cg==
X-Forwarded-Encrypted: i=1; AL+hErEB+eNgNeNArThVLgvZyUokK0EV/ss0wAzISFHMrRynUxUXngzvudoBVdBdjfl8lmGGAuAjuc1yHVT4@lists.linux.dev
X-Gm-Message-State: APuU4Z97GJ2//OO/s7ooa/sDr6rJr9KaUww+Bauof7ovaIwp65OyHPn/
	EdRkZj49Rj+tKdgyUi6OJLAs8GetxdJMFk5PzFVOfNG/tBPiq1iwtMYxoApkMnBvfauxV1rbL+u
	Yc0Gs
X-Gm-Gg: AZFdTZfHHoMLlobfGAbslQOJz/ZCoJuwkxzNCWL2AutS3Xbvg1d0ApS95huavDmAMc+
	9SIKegcnnALApXK9nNTswKDjzBQNLqhCWo+ZdOqOkl7iRd2eNF58OZKxlpOwvVIzwMM/ZUdAxa3
	FAwuuLhaXNhfFu/W609exl4gWMPquAoYmDXWyB51UeRzEAps78OhwOKIQgJ530KNIXyX2wsuHwP
	2z3D2WtoKbD9yPVUfbJ1MqWXrgMRwLe+Q9JQ6IFUj/MvisVXDJPFAtcgZvefGTOlFx8g1omVDR1
	VTfiT8p9oUmaPYjPXCJSvRkXjTVvXL6x0EZ+PH0tJcMQN/7Osq7o2WiQ0UAef/a48E79+tMeiVY
	ygWszaLABjoFyAJnaD95ffFNHaqeYGWdAjinMZh9t5WtSDyJjLa2rSiQuV3uoEgcgAAowZRRjTB
	i9MaGwicAUizuIqmFmYHpzegVoUg76yZ4pZvHlnqTN3rvyZyZr9N1+DMCKKGm+LuXnuxVoaGIWK
	VsDuYEzUOrB8YURk7hrLZ89FimeYAcxFFzGIlg3ACOnt3kSuk39+XVCmfZlvAsn9D4dUxZK9n7i
	hE5VRw==
X-Received: by 2002:a05:622a:258b:b0:55d:3789:8c8e with SMTP id d75a77b69052e-55d769e11bamr337179531cf.15.1795616388597;
        Wed, 25 Nov 2026 06:19:48 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm153708121cf.27.2026.11.25.06.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:19:48 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWDqd-00000001jay-2IOg;
	Wed, 25 Nov 2026 10:19:47 -0400
Date: Wed, 25 Nov 2026 10:19:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	Dan Williams <djbw@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 04/10] PCI/TSM: Defer TSM vDEVICE allocation until
 device setup completes
Message-ID: <20261125141947.GD246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-5-aneesh.kumar@kernel.org>
 <5e04323f-dfdc-4956-acee-bcc09926726d@amd.com>
 <yq5aqzg99uio.fsf@kernel.org>
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
In-Reply-To: <yq5aqzg99uio.fsf@kernel.org>

On Wed, Nov 25, 2026 at 02:07:19PM +0530, Aneesh Kumar K.V wrote:

> That is what this patch does. If IDE setup is not complete but the
> device already has tsm0 attached and connected, pci_tsm_context_get()
> returns an error from cca_vdevice_init(), preventing the device from
> being assigned to the VM.

If the device has not been fully accepted on the SPDM side then you
should not be able to create an iommufd vdevice for it, nothing else.

Jason
