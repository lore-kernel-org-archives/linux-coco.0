Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616300;
	b=r/Yv5xo5ov5ko/qMvRCyk92+6dQP36vxpdhupWffGQPky7A86cWrZhlPWpqZT7CdDV7R
	 rXkJhWK56vcxspEZ1LOSN+pzEx5Bmuyss48oga0+ndrKlRA7L7y30fubVlVXGQ7GnQwCh
	 TinTloWk1fYIlGWF6hEdsvsLY1MwMgdmvn+0mmTJBV17ROKnHWzYB03p9QYWetAt0LGpW
	 5I+6A6qeAUoICwu3ZthrkIcXx7ReQHz+DYZkZ8yQPv8v/4dDkVd2PECwnf8+KAF4yrwNh
	 I/xvPXB4nfenYUxGFjSZtCtv1ckIGrPa/UN4hYoAcT3S/+v4lkgIhk1rz62ersWzczQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5bQ37Dr+87om1NS6c4tle8Uvo6AzgbEUJjiMwoZ0S2Y=;
	b=5JKXZzstCbHfSALEqG2X3tjuVuLfGbZP2Vm+E3Ufqnq8cDaFsJ/ElGtmGovMEdIfkZl1
	 JIw9x0zVvYiuJQE2PbyVvV82fBBS3NeLMKH5NlHIdGE6qSXVTLcBPrOCZnPatZvyyeDTY
	 LbSgBqvhNPx5JG1tAZdFHRJ9rNFgQl45dUC+iX2VccpfFNjxyI6glgRGF+GtMoMGKXVAR
	 iRr45GnYzbiQxJx3ZQyVENznJjQiP6WxmBbb1Md/5HeFdkBD7vz35WS2dWTO4G6wkrIno
	 XfoG001k6EM1jnmrn3i0xoUccirmZCCW7PHR4P3djbL4l5jPnYC8/KddyajlyJAUWYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nSGECwOx;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67787606A321
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 14:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67787606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nSGECwOx
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55c48582654so65463441cf.0
        for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 06:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795616299; x=1796221099; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bQ37Dr+87om1NS6c4tle8Uvo6AzgbEUJjiMwoZ0S2Y=;
        b=nSGECwOx/IH9Ow0CjCOosSbhj0hMs+uxX4hcfJg8vCaphCA0cBH1Iwc+gx9xV82SgM
         PDdW/1xbsl/Au8nWOUUJ4LePWf1qxDv8g4jAD9GRJsG8fqzDtkXkwrA5edDEGIsGW9yR
         GoeQ2ox2dr8RNU0UPrm1VuJ5om5GqY5+EB+ZQPMzSQ/wLF7f5f2mCLCrJmM7XnELJyP8
         fB8IcE8uWGpAaxNiZOC1z2VS2b/VnNTX0g3P/zi4sRI61ffKHGeQToVdU8gSVmfrTD3y
         6llm3A+xKM+O6T7LJ/tH0uqAWv6gFykFjaQx/GG6FAYr+g2uxO8GZjnjw65w9gUA7rvd
         c+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616299; x=1796221099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bQ37Dr+87om1NS6c4tle8Uvo6AzgbEUJjiMwoZ0S2Y=;
        b=Y7emoPWQVS9mVpUDFMg+U6nTQs1g/+F+3ffssF37Z62OoaBeNBgkpHXz19s1vazWg1
         05ldgrHsp98gH79hOhcgWNAYNcQicTteMa1Iyl32ZuAR43lpCiQ+DrS6FXgoXirtkbAl
         IsZ7836MTW+BobdkY03+YIys59RzuOtgb4hGbllNyhH4Skd4Ey2oW2pRtJKZgoHfPAnS
         4oQfg4iTD3CUBWyDPOLRcAs4prhCj1odzoHf++TPBIT6AxmhqolOulm5GkGFbsbki7Ty
         tQN3yDcA4xjc+qPyvBiHmhVIo3MsrnYZhq6eNLXzKc6fLjpJSE7/Olajooh8sN7sWdt0
         0fXw==
X-Gm-Message-State: APuU4Z9pX18LoTIm9c13IBSfaaLsdggQDdiBAagC3aML+y5psA8ExFkN
	YcSTGPaXN2/z7Sf47Ig8E7c0Q4nvzN/HkjMHomyVHgjClLVOcLPj4HitePQmQqCq6Pc=
X-Gm-Gg: AZFdTZfpJ8kJnRs6QyQ17E4k08fKrIQF8S1DgA9poQQA5+gSxL7m0CiuanGRtwi6Bzd
	Qm2HZ0cibLfdXQy3aEu/i4YjRaURY94zJwZOfRePUdfb/3GSiIc9XzBHp+Zr/BDnGBFBxZtS9uN
	Wr9BPoR5ihm5K+deiVKjkA2HtDjOM5QwpUFDISYY01OZ3vXy6ndgnUqGc8+wIPnPj686DDPe7ti
	xf2nqEIp3OoSqPAolJS7N2feeXInaY9PBm/978IpB0hDKn8T6tpWneAmVLIDFxvoPLWiItkxrIo
	W+qUG5/iOGLWIAQzET57SIjlq4w3pZ3esaPKiBCeNP5AHIc0MfRC+gNn882GAtWbSSvGIn80TYr
	c9zxA6bsZyjKCTexUq1qeqkXXj+AXkJjQjTaQ0L3LpHSZYY/TxSnFva7jxoE4mVGDh0zlMm7jDj
	8CiZMJzPutVgVb1I8eoeAmn4MMwdkgcIDwuB8rMjDMNg78iWSluTnstzgH66DmJD4dMqkKsKmbP
	FdgFPjA44tZa95vyy/d6xb7GQT5n/ozA7zLKTOsBt0DOHmZEQTil+HrSOSiMIr41cZu7QilnxG8
	CMR+LQ==
X-Received: by 2002:a05:622a:1aaa:b0:55d:3721:872e with SMTP id d75a77b69052e-55d76b34525mr321765931cf.69.1795616299369;
        Wed, 25 Nov 2026 06:18:19 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55db5bc2f31sm27755541cf.20.2026.11.25.06.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:18:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWDpB-00000001jOX-3H6e;
	Wed, 25 Nov 2026 10:18:17 -0400
Date: Wed, 25 Nov 2026 10:18:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Message-ID: <20261125141817.GC246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-3-aneesh.kumar@kernel.org>
 <20261123152903.GG179082@ziepe.ca>
 <yq5awlq19v10.fsf@kernel.org>
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
In-Reply-To: <yq5awlq19v10.fsf@kernel.org>

On Wed, Nov 25, 2026 at 01:56:19PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Mon, Nov 23, 2026 at 02:03:29PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> Register the built-in TSM class with subsys_initcall() so it exists
> >> before a platform TSM driver probes, independently of object link order.
> >> CONFIG_TSM is boolean; remove the unused module exit path.
> >
> > Why isn't it modular? This is going to force alot of stuff to be
> > non-modular.
> 
> tsm-core.c contains only a small number of helpers. Most of the tsm
> implementation is in pci/tsm.c, and even that codebase is not large.
> 
> This differs from the architecture-specific backends, such as
> arm-cca-host and arm-cca-guest, which can be built as modules.

So, why isn't it modular anyhow? It doesn't matter that it is small,
the expecation is most systems wont need this stuff so we should have
a clear reason why it isn't modular.

Jason
