Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527859;
	b=ANwLhPqJ26tfmGj+OEaFuIrf7fkbK37idOh/G65p7yZ35+H4adaZh+ZlWL8uwmPHTjEm
	 VNC6YUo/ICwnOAXhixQMgdMVcYQ9XcGRA5jPzBxlozUl1lMMd+VQTNLJKpINnZ4UqZtoT
	 GDrQtSuD4KvzEyYA7AE8bDDN10fJOOqGS4Tdv1MjHM1oqyAeViFi/7dT5UOfrS0ZgNLg4
	 P92hrJGj8QQayIZecGxPX/XHHLXjzVSkAa5v3uSyZrCE075XDpN6kn6wJcQD44JyeeiqJ
	 z/YQsw8NKQAcopyF393cNr3DKo+C9A/aBm2BN/8VA3EVPqDrrsjYSTMkKsVJLYZA6Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=GOO2liEeh3ZNTv2cYVirV3xpcqc+Z2dTdYpM4j0pd4M=;
	b=DvCCSRxUD+5sVSryNQCGTP3Bm7peNFKhbeid03vFp23uXxZ5MjwlNP1UppnqPnzQAY6j
	 AjNUSnleT0sQmXz6dphTcnDLSWH7RkmkXzTuHP8KmzGhhC2i/jhb1JY1CmyK4ngeWJoUj
	 Kt1meTERbwTeIDep0jfOUrEnADWFWAF/MBpU8oVuPIJ9TukLFGdnnJyqYGUi36bD2c3JI
	 ZXZMXMik7jXx8n/Svbb5qtqujTz+z/7YFrU54xPodsU9iNMBBbdlwC3MxkqgtYGfeAS4o
	 dAhKt/Zjqz2wkHb2XWRZhqPRT7Qv+cE7hnzdpyXwumiDqMEkKughK04weFztu55msHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="fxBd6d1/";
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA19A606A31E
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 13:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA19A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=fxBd6d1/
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5363c8de563so50431141cf.0
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 05:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795527858; x=1796132658; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOO2liEeh3ZNTv2cYVirV3xpcqc+Z2dTdYpM4j0pd4M=;
        b=fxBd6d1/8uC1nMuxQ26Hy97S88WFxPZpKH9iERv491Rw3cwRIDH6U6QK5PqpwalQaP
         y241V5L9IQCKoZ+XwCrcqq/ZsiZkim6aOF9ev6lTFe6GuaKjZjlzBtMj0fUiJo1qUmpm
         Z2dx2RUoaAKBK0N8wU3UqeIk5J3TuOPwJYg31cSLwqdBZTvHv+qGbDbgG+K0TqBC1OaH
         Ov8zmAdg364g/mUbDSGSED57D/F86datpbDZZ+SOjLpeVCu84VIHTjWaLftjRrIT9IEa
         h9by/FazbgIVm3Z84KxjHt2hz/vJ9mZaWXmok7YA3cu88hdd3KBaF7GXojSqjhmNzkr9
         WKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527858; x=1796132658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GOO2liEeh3ZNTv2cYVirV3xpcqc+Z2dTdYpM4j0pd4M=;
        b=JwmLDzIIQ7ATSqXNr/HjA7zXuE6fldTZnSn8VWju0oSREgILLeek5t5jPKEdEy9d+k
         o+fx92ELWRlt5NNjtwlFYlxEINVeNHyJT0Hd0Gi1OXAXoxQKVAPHUaMq2L0Ojb6yWr3j
         2hQG6QixHpR/zj/bqBRUNhRfrMZGfi67KsQsOLumDKjfODxbT7pnBjnaysZFM7UGihPP
         3QxrRHKRfe08W5MZTcA8f4rfWwnxzfXiPKDqw0Z4P45en3Z+1CO1sTjs4EYf/1LHyI62
         us0t+tTtbz8HYkJkpXO4oiMieDvjmHnwoU64Ov4QjDJLaJO37LE1YwpbirTsVkpkx9wu
         PHkA==
X-Forwarded-Encrypted: i=1; AL+hErErpEGyGj0FeckNRByh0/Qujz1nA4GYCLKeOTX2Hm4qPRa9do92+oW27pTo7NHNrwQVQrx5oK3j47mj@lists.linux.dev
X-Gm-Message-State: APuU4Z97Uced+wGea7yfBmPwm/pFYSxYWilp8ko5FSdPCSjCF4B8NR2h
	tZVAuMtPu2uG3UWGTPXqKnvOZ44LBImUoxwrixuuevRaF7AWprRtK5uCwEQyULm+x10=
X-Gm-Gg: AZFdTZdr6eLABRF08mEkpqWlduzwyflONs3JKD3BLdXTHWm0NieW2qqSn06ZQpc63WO
	YbLBuzJIYNOVdDALgEL+nxqRYZLae/10Ruo0yPwld5ROfjVFGxZM3gMe82gvmDQI1Y5X4F0/xN6
	Cxr5o4DtH4vuzJAqRX8y+v1nz1YpGR2eTeuoJQMbYHZEKFKn8SmXQQXVBXrkqslLNOTwSu9Zwos
	dg0M2IWqX/tSioC4w3GJofVsaePJKN7b09AOXlb+0J29cWCgU38Bd1UGjsARa6UKWNu9uJ4Ukja
	DaXIRKD+5Sh42u1+ugs3YhOW97qO03023eqiWJ7o7v52IT8+VNKCB+dTAjTDTI72di6jNW2dCaZ
	pm2h55G5WXAxLc3kuQhAFIeSGy5KxNHnitaDbt1y/H//ppWsUPJsh4AaAWi+1e6YpcqPY84IBVV
	2s1LIxiqd4rFudBp1uRTHExi5nlwV2HU21/o6Z5vjivRjwdax4YJJWlNwdVGhWTfBmCUtMZwoML
	rIq+OqFv9uggpvS2aRImlbMJ9EC6b0feNGVKejufB1AxPiVUefRYzVYKb4YxLrGKstaZxvSTUxv
	OVGh9g==
X-Received: by 2002:a05:620a:6c01:b0:93e:c12c:43f9 with SMTP id af79cd13be357-949bab6e243mr2406376285a.70.1795527857835;
        Tue, 24 Nov 2026 05:44:17 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3ba04bsm1055445785a.24.2026.11.24.05.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:44:17 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqoi-00000000QDP-3RBH;
	Tue, 24 Nov 2026 09:44:16 -0400
Date: Tue, 24 Nov 2026 09:44:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Message-ID: <20261124134416.GH9566@ziepe.ca>
References: <2026112325-emit-squeezing-5d96@gregkh>
 <20261123090623.GK14811@unreal>
 <yq5a7bi3riha.fsf@kernel.org>
 <20261123115803.GN14811@unreal>
 <yq5awlq3pto0.fsf@kernel.org>
 <20261123135638.GO14811@unreal>
 <20261123152533.GE179082@ziepe.ca>
 <20261123185826.GP14811@unreal>
 <20261124131754.GF9566@ziepe.ca>
 <20261124132536.GS14811@unreal>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261124132536.GS14811@unreal>

On Tue, Nov 24, 2026 at 03:25:36PM +0200, Leon Romanovsky wrote:
> On Tue, Nov 24, 2026 at 09:17:54AM -0400, Jason Gunthorpe wrote:
> > On Mon, Nov 23, 2026 at 08:58:26PM +0200, Leon Romanovsky wrote:
> > > On Mon, Nov 23, 2026 at 11:25:33AM -0400, Jason Gunthorpe wrote:
> > > > On Mon, Nov 23, 2026 at 03:56:38PM +0200, Leon Romanovsky wrote:
> > > > > > >> >> But it should not, as you are making driver core changes that will
> > > > > > >> >> mirror the same thing that that patchset is attempting to do.  Please
> > > > > > >> >> work together on this.
> > > > > > >> >
> > > > > > >> > +10000000,
> > > > > > >> >
> > > > > > >> > Greg,
> > > > > > >> >
> > > > > > >> > This series came as a surprise to me given the fact that device trust
> > > > > > >> > series is exactly for that - allow confidential computing.
> > > > 
> > > > Device trust's primary role in enabling confidential computing is to
> > > > give space for the userspace to do all the TSM and attestation stuff
> > > > to get the device into T=1 private DMA mode.
> > > 
> > > <...>
> > > 
> > > > Getting the device into T=1 should influence how the userspace decides
> > > > to set the trust level, but it doesn't interact inside the kernel.
> > > 
> > > The point is that I’m describing the reverse relationship: the trust
> > > level should determine how the device is configured, not the other
> > > way around, as you suggest.
> > 
> > They are unrelated. Neither influences the other. The user gets to
> > make orthogonal choices if they want T=1 DMA and if they want
> > adverserial. All combinations are useful and valid.
> 
> Our proposal is to represent these combinations with an internal trust-level
> enum and manage them in the kernel through that FSM, rather than maintaining
> two parallel sysfs flows that permit every possible combination.

We already talked about this when Dan proposed it. Combining entirely
orthogonal things into a huge enum is not a good idea. It creates a
combinatoral explosion, there are more security related knobs than
just these two :\

It is not even a FSM, it is a bitmap of enabled functions, and that
isn't an enum.

They are orthogonal subsystems, they should remain orthogonal in the
uAPI and we definitely don't want to use trust level to control the
TSM, that would make a mess of the SPDM flows.

All this was already discussed, it is why these two series look the
way they do..

Jason
