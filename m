Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922723F6C28
	for <linux-coco@lists.linux.dev>; Wed,  5 Aug 2026 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921028; cv=none; b=e402ecipOPiAHXTG4Bq8oMMkMEiLx6oyXHnIfE86gVQTfwFGZwCIk9AZ3f2wVIPvTt3rdfCJVDddMZ3koiMvWUyKgnFFx66kWgQOPE4FjzBzrwAnmO9JNjUdkV/QbVqT53Ih63iV4YMn+Eo4TQPR+besbcoiNGJKNR+i0dKzI64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921028; c=relaxed/simple;
	bh=gINDk3IoAOl14/uSe78s8gXta9IkyDgK1jiiLUqSSAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9/re5pN9qy2s1jTZ0a5d673wwdK1/Wjia4fm+dZT2uaRnMN61OOsPn0zvnXwJjSrOiZ/Pzp55WZ/9nBxUOCJ1Nxt2O4JqIH26qI8OQ3BNtvEFIHV3lJBWOa1zlfRYO1WUZapN8EG08ZosMwupCIlbFFcczN5VHmxB3LC4k8j5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BPQ2Zo3O; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BPQ2Zo3O"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4994d67d260so29885e9.1
        for <linux-coco@lists.linux.dev>; Wed, 05 Aug 2026 02:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785921022; x=1786525822; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gc5m4+tIBvg0egjJhph4T+RN5CfIOJByD9/EsS70PrM=;
        b=BPQ2Zo3OzLwoxVY5DhXz2e398BXYvN4DBJLZXLpVDBZy3gurjiCcsPcHscumAAMOZY
         pgmqaRZXz0Q8nczIetfwWcFhUdS9iJnI5REpXa6tCvJ8O63dervHaM0yK+ugsNrtbPc7
         TOTsivvNqeGv0obR757FtAka2lQx6kIGRJeJCrHZwaKE6wTMwoxY/EiZxsr6f8kpsJ4p
         Fkv4YVhOhVDPtwPBQNZo4N1NkLIr0uCKI3ZSKwerzzHYYq3TR8pm3gei1w4jqzi3WuNm
         cQhmJoZCTaik6gRyVyj8o8at8MN69mwMsUvb1aB0TL8G3uyovWrHdi925JQNZ8K08Dd9
         eWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921022; x=1786525822;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gc5m4+tIBvg0egjJhph4T+RN5CfIOJByD9/EsS70PrM=;
        b=bvHPqbcYFCm6JjhnWoJzPwNjyyopSieC+M0TTTnrn+Jc334eZoasrb5wh4cvtUOkbc
         nVpEo/sa4fyTlfFJrgZwHYayfQLyTLd0rOE75PiTPJn8yCV/kq2nDPUgYaRJZR10l9F/
         c2z88VxH7GG85A9hJXR8WKjdJla8AhDUJ6mUTECXiJLZAT8hTbePqC9tXVUmSQHXYPaC
         sSb5yssjtkneC22mTH1hMjDJdT2uD+Bs/kntJMshaB84A5Pyd+bZAoUlocPb6CLrZfx+
         1EW94CcoEukdvPwnvri5SdBsx0Ya46SaN9+eBd3gV+NvXJhK5SD50P7dIVNPRVafW3/w
         AjkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZSqFXRb4s3J/Xbm5iWbnegz77mPGtY3Wmb8mSO8UlwPKFSc9rvuG9a6u0ccDNRkVdk7aFg6Mv8v9h@lists.linux.dev
X-Gm-Message-State: AOJu0YyPK1+oRE9wP/GyhoxY4AeCcWfkoi+FuhyPYTa/9UsTSKpnzvk7
	USNrCDKlR7H1Qupms8vcdhMHLAzcvMlRuN3Mf1TBlno5NyWLitrP/MR0O3ZWMdsmLQ==
X-Gm-Gg: AR+sD11AP8TRYhT+ZFx6hgOPxQL32nz6xBnXpEmpo6nZMJYXxYNYXFakw20yRGOfA2G
	J9PhnbLEhBfW+NDCgVoZuCPEhyTqmU3L1uYGiIWCbPYBq7N7PvQsDQ01u2fpsdLj69EPaBr22As
	H+OCI76aneAwXuGkzDw4fxuXW20azCCf2W3LZmhRdsS33Ui2rbASj33ADOFl1RbmlvsPD0klYDn
	b3scMERdo91r4wqUsqgudg9H91fSHm/xGYG4WAX4Es74flLLAFUQopTJGghGI3AoOR9toyz8DmE
	A6IkEsQIkswC5o207lAtvpVuklchVXdOKuJTChz1SrmJjvCB05pZXn7UJhgwnfMX9Yny4R7KATj
	q062c4kA3tOO1A9mGzHNAJFT0h0Sx9+UfliVj0Gt3L51aQcIL3E++Rdv9RzpHRPFx1DO1SHmR1E
	8pdwInPSzoqZuR436vQTaXxE/BxPOfQRVbSazC3y3ePI+4NhhglU2dg/xUQMZGnG7ektQpBEi21
	OQO84qwDIdWLusAZoZqVEFNceJehA==
X-Received: by 2002:a05:600c:630f:b0:495:4069:b0de with SMTP id 5b1f17b1804b1-4994f123620mr696915e9.9.1785921021836;
        Wed, 05 Aug 2026 02:10:21 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994dfda45asm92632815e9.4.2026.08.05.02.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:10:20 -0700 (PDT)
Date: Wed, 5 Aug 2026 09:10:16 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 12/23] dma: swiotlb: pass mapping attributes by
 reference
Message-ID: <anL9-OrDGqYQAWNV@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-13-aneesh.kumar@kernel.org>
 <ami_mpd_1pF4Tmdu@google.com>
 <yq5a5x1ygo7z.fsf@kernel.org>
 <amnRB98ZZIysHuM3@google.com>
 <yq5acxw6dl1d.fsf@kernel.org>
 <20260804142032.GC27883@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804142032.GC27883@nvidia.com>

On Tue, Aug 04, 2026 at 11:20:32AM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 29, 2026 at 06:12:38PM +0530, Aneesh Kumar K.V wrote:
> > There is a possibility that we may support io_tlb_mem with cc_shared =
> > false in the future. As a result, only swiotlb_map() knows which type of
> > bounce buffer was used, making it the only place where the attributes
> > can be updated correctly.
> 
> Yeah, +1, the attribute should be changed at the same effective place
> the source memory is changed away from what the DMA API user
> provided. Only the thing providing the new memory (eg swiotlb) should
> know its properties.

I will keep the conversation here instead of 2 threads.

That seems like a big leap, I'd be worried about devices that operate
on confidential data that should not be shared/decrypted.

One example for this which exists in pKVM (this part is not
upstream yet) is non coherent devices that require bouncing but they
still want to keep the data private. In that case ideally they get
an encrypted SWIOTLB pool, but it's always better to fail than to use
a decrypted pool behind it's back.

I have not been following the work on T=1/T=0 devices, but IIRC, they
required some complexity to handle their stage-2 as these modes will
be emulated differently (for CCA, RMM vs untrusted host).
I was thinking that it might be easier to represent those to the
guest kernel as 2 separate devices (bounded to different groups...)
where one is trusted and the other is not, and that way the DMA-API
can have strict rules about memory sharing.

Otherwise, SWIOTLB does not seem like the right place to me, as it
does not understand the context the device is operating in, and the
DMA-API should deduce that from the flags passed.

Thanks,
Mostafa

> 
> Jason
