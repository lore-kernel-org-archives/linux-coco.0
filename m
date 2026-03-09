Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732E3D2FE8
	for <linux-coco@lists.linux.dev>; Mon,  9 Mar 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069540; cv=none; b=iQ8WNU/jwr1Vls2asaXkPkWi9EJdr3yxSh1r99mfSBtHMI4cX3330e6eFd5wtzssuhCMMMVui17/d2wnIpjSpPHEcqDPc6nhKEr/87vDr8fsoDZqVI//SGkddHSnaMXrQjuKZIiRWQrX19sQO3n+YElq080Qm3lnwj2zAdwp9PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069540; c=relaxed/simple;
	bh=aW+gGf7B0n0oHC/qjuzmk77UUBB/ftL/cO6l96herO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSYpUQlrW0FgE7uLVsvn5ewFVBhqXbShIH7471KR+KK3CLva0yx5AA3Zxhv8ld1lXMWVJGbbjSncWClTkKVaAOCyLwM+/3/89L9BSgxKh8YUaTKjm9OJu7mnvLPq3BwBK7fv5pZa/IF61ZD39vIRt5YPNhNRmDExHKBNPMBZL1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=C/85+cCK; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="C/85+cCK"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899f79df682so87577186d6.2
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773069538; x=1773674338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oQoTcBcgSknYFDDhFBTqv/EpNp1AB8jH1zi0Ovpsfro=;
        b=C/85+cCKtTHVRF56ZmV5fUiHJnljelkdcwaOIFTteLDBk1pODYv1zDIeoxfI/NsRVy
         P7a546ojBwqSBP5YEBYS5lC9MPKT25DbytD5qECgHgy1b7+7sPYBuN8332SZRqnyxzl+
         fIB8rOZyuxILvBfKXsJIplJgm06OPNSL+anyeZQLfrw81Lwk/Vasz9CV+Cv6qNoOA63f
         W6q5bwsNwi/SsLskmNLz8ODS9Y4HgmTo1xMUQRGFZmMxGyTXTFA5h0D1pEbMSP7VCmt6
         MHtK4F3xPK15skgDOjcWyC9Nlzm89ibYcQUHlVuATAnsP7odXVAWKnDyAOvwtzh06/Jc
         SzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069538; x=1773674338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQoTcBcgSknYFDDhFBTqv/EpNp1AB8jH1zi0Ovpsfro=;
        b=bYTHJWddjwYW2ZSOF/p25Fs7WnVFEIRUHER00lDVLOE2PqTRTlQka51fn/2ti/y3qN
         xQ2RYgy5FliEeZS7Ok02jubrvDlUmMuolNuVsXaxK2C+J1yy1tGrHmELpncToDxMPWIF
         qQ8krYyU7sCj4ttzW0g8Yv6NxkIzzVia8aU4F65aU0ox1RSkAHnIVIf52tAHPCq3a/+Q
         v/UsM3a8wnGe8VzDLtWXe9ilcr+aZRX4I38TlehmWme4qB2IuKh7HL+jus7etpxLUWVM
         Xs07Y+T/S4TzRm6oWKVQUn1tO0n4NT4mw4TFUv6Yq7iQuT97JPDAcvKPAhWKLtqI7clj
         vyDg==
X-Forwarded-Encrypted: i=1; AJvYcCXR67X0PAbGIWYo0N+rpOzumwxm64TPADluj9q3cTGNOV5kojST8I6PBO2iOg9jl82dTR7Jnh2bvvMr@lists.linux.dev
X-Gm-Message-State: AOJu0YxgURygByfE2R2NM4z99e01wm/D8wpmuEmjwwtJKH5uWl9WYJL9
	kxo+kv6IzHoOAMgMBS93zqPP8XMfqisU2T5Qor4in86iS3ETRfHfEOQWiffBxeKHC+U=
X-Gm-Gg: ATEYQzysMONN4cWf/f8QcPz93HtVcjul1PgyHFgihXacg924uzxJ3K7qHx0W13HmuVl
	yQ3bjlu3Twev0ZHt7BxVYNkSUJLrugmCpWYwI7ka+9Xghk/vbUV1XF9wWerFP8LhfDgMvZUcs41
	+KafT7moclfKn7s0ANIjJXvhyh7pE7ZK6vhML/OLPHFmE/i1krlg6oNsrTX1RxB7CcRhQzXyzBn
	kgGhOnr26NjaUWS3yzWR80S0A3RD4cmnwViS1hxXuBUil1T4uuAIx6caSQsbc8T+NYeVBPfohGH
	ce+b9s9ySBPCrl/vNDFmbvqYqYEopc5sZfYWhMZIlSHgN6vtowtQSYEZi0hvOsHgSBzT/+xAk1U
	YY8YULY4vWZZJJTLkdMIdpHrsWPFq15mZ6yk0FaSNQO6TI5HohaAAdDLuGwSai1GVhv2rTkf9au
	ZVAl3gds0wTcaQWEv5SqydAXwafUCyxhtdN738cO2dLjRVSP4vyLsIIW6Vw7Ajsvh95pKYZgxNq
	eMK+BFE
X-Received: by 2002:a05:6214:3019:b0:89a:502:6054 with SMTP id 6a1803df08f44-89a30a2b5c5mr162839796d6.8.1773069538417;
        Mon, 09 Mar 2026 08:18:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a316ec570sm80067436d6.39.2026.03.09.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:18:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzcNl-0000000Giv6-151p;
	Mon, 09 Mar 2026 12:18:57 -0300
Date: Mon, 9 Mar 2026 12:18:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309151857.GO1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
 <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309140233.GW12611@unreal>

On Mon, Mar 09, 2026 at 04:02:33PM +0200, Leon Romanovsky wrote:
> On Mon, Mar 09, 2026 at 10:15:30AM -0300, Jason Gunthorpe wrote:
> > On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:
> > 
> > > > +/*
> > > > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
> > > > + * (shared) for confidential computing guests. The caller must have
> > > > + * called set_memory_decrypted(). A struct page is required.
> > > > + */
> > > > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
> > > 
> > > While adding the new attribute is fine, I would expect additional checks in
> > > dma_map_phys() to ensure the attribute cannot be misused. For example,
> > > WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
> > > that we are taking the direct path only.
> > 
> > DECRYPYED and MMIO is something that needs to work, VFIO (inside a
> > TVM) should be using that combination.
> 
> So this sentence "A struct page is required" from the comment above is
> not accurate.

It would be clearer to say "Unless DMA_ATTR_MMIO is provided a struct
page is required"

We need to audit if that works properly, IIRC it does, but I don't
remember.. Jiri?

Jason
