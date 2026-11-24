Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540081;
	b=atsq0ouy7PqjviooUD5R3VjUf4EKB7yf6EPdXMLrTEIG0YhQ5haawtuFIE4V0DM0cWl9
	 WTVr0tqkBOFKXYTCxFxeVcyNUxpfDxO5wPKZcaOSG0bZxr5PhFQCwsycwcfakV08u8cL2
	 bh/IVhrMz3TAJNtUyhHTOIyEplZ3pxonMGPj8OjwZreFFGe7urwcZEEtlmHuK9s1MAua/
	 baU7CsFb045Tc/3IcGQl9iDHyPgahUrSt/I/B89fXiSXbiNMedQ+MQEgq03/wksp/Os30
	 vvTXGC+6IBbUDxs11im7u3WGnc74+hLZWeHE3cW3YHRcW0Ct0erGI3Ghkud5pNJwnVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u9RNgucBnI08qUwk1iWfTQpaGbeV2FiwOEeQoPQxy0A=;
	b=f9kwCQIrl4kd49AACOTJ9Om5LA+cIzQKgRUp0XwtXHLqA6GqG7INPqimtkxwLYLXoukJ
	 y5804uTHeZyIrpaCeWgfw0be2E/gf1o06iTmjH+47u91JoryDku/pTbibsY2VArWUdrmc
	 kPCv8hXwKWr5GxMHJ+vVAuo2czdN6FqOu5icYLRkTS/RJFMhfhM+cYwfHAC52ncAup6oR
	 GM2VkkyAiQgkuLq8DO4hXDW0uByrtq1Z4RYT6vPv3vjIFhv+bJGBsGVmKmq7L4R8oMEeF
	 zpoWdJZBPmu4NAw/VHuQ4twuD3hR/UyT1ml0mWFpwwWi25uMTAcF5W07eRlYum/KCBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=a7uxdXId;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D919606A329
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 17:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D919606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=a7uxdXId
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2ca055399so1398417137.3
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 09:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795540075; x=1796144875; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u9RNgucBnI08qUwk1iWfTQpaGbeV2FiwOEeQoPQxy0A=;
        b=a7uxdXIdscfFP6MO7kegi9TO0eRGMDCqklhQrwLvdboZ5LuIN8fiGRsiJYuaJC2zEM
         flASYZ1eyha8gk14nzPwKSJYQwyyP0WJ7BY3JrzJ60taGXCf5oD7blz1DWhT9ywSbXM+
         FUDM9E5OC906ySVup+NEHB92Hr+giMTpoDcD9L3FGQGrLHlPU4iXnuxdASeVbWpQDWJj
         rVD1639CuvBybqSHg9MgO8/LlbbsLVqVuAhmWHMGiwaFHM+GGaYcycI2dB1xNJoOqu4w
         D94hPVb/rnL3vTdBG2LGKCisIkUkz6TfWkCL0trNWiqGgUplmNviSCBN/TpXJSw/WFGP
         UxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540075; x=1796144875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9RNgucBnI08qUwk1iWfTQpaGbeV2FiwOEeQoPQxy0A=;
        b=mjEiPnl1Nhg7+wC4Hzv639Ut4zr2cAO0/itDBhemR0nvaUX9PbmVOSgrlNZN9rNyBc
         QisSUvt0jQtnTUOZi6QEy63MH0Tkz6rHF/HEz/dcyIUveR1UW427qgFMUFWFtMaHfbtS
         vF9JGZ3EXgSmnAzBgG1y1zjnVDHNvf1kK88vGtq8ZV1iJAbOM76wXRda8SIbEhtssg3a
         dm08amXymRMIS/ItvAhueIU49s7FELmUqLBl7FAkxClr9EWLVMw88w/NgNy9y1zr7i/3
         IDf4Mq2O1/tYI8umuqSpggVF9NcLJd0W+AY3MFEYo2ld6enwrz+M9VDRCzhvaV10GHbD
         rzOQ==
X-Forwarded-Encrypted: i=1; AL+hErF7l1q/HatZ5prpKPCcL9UBH1PesDHtaXKGizVe+IY5GFjpBjJJ+UG0PqRpzODvpyhJFQBxRatzvsxO@lists.linux.dev
X-Gm-Message-State: APuU4Z8NWBkA0n6AAEfm+zVAi+hqBuj5zQPn5Cx5+MqsS18Mwkv0evIg
	MvUTc2I7XD0+5UK1h1Wn6aJjEvSL1xRO1h2lCZr4Hls4hqS4pMdZLUvbgjPVZiDKYpQ=
X-Gm-Gg: AZFdTZcOL6jHYcZPM4G1Oleal8bU1j8X17muBxhwbc3CQz3p2iw9qW7Azq94RwN5Fxy
	uy+RZyVnJc5TNtMilzTB9y8PDr+0FxiruSaKiLwIRuxBgYRcXiXvR9FSI1/yqetqGFkgktxrZUB
	n/Rzq9AKSptfFMnOp9j6y1m7zgMcmGRfHG/4qWCZ/P64yqGTSfPRfzkYawp1LWtBLHXImaQU3rL
	1S/tTuc2vAZ0fuczUpqSFL/Ci0gjgBeNSXAUFqe2NGhmemdWoUkGNPUu06SRkazCt95XqXyCees
	zqK3WkoSS5pFMBY/3U6U7oTUxim+UsNDP+5K71IBzuBzVxJG9BCgp36IoNg1WdBKddJYmeAVHoP
	ZD4UufD8xnJLMmU9Eg1BxbbMtSf2BHlg9n/XcymtIZDa4e2/kqpR6BdYLG4iKWxGLYNlf5kJy1b
	AMNq2e7abgQ4Kq6/qYwL3rIdmGzsSWnL8WcRmd/noT6TwfOSkcTbOGSu4UbOesorkeJoJEd7E8C
	mFAZnNku3a5ZL4Cim8VEk7roZlD3WzCssJtN/rNBK6qS6aYrgO5oZBF4Mc/44mIIOjFVQuislA/
	q/ULdw==
X-Received: by 2002:a05:6102:688c:b0:7ce:a69d:b020 with SMTP id ada2fe7eead31-7d72b36164amr6731183137.5.1795540075186;
        Tue, 24 Nov 2026 09:07:55 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921366d853esm132634586d6.27.2026.11.24.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:07:54 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVtzm-00000000uyF-0Lng;
	Tue, 24 Nov 2026 13:07:54 -0400
Date: Tue, 24 Nov 2026 13:07:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
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
Subject: Re: [PATCH v1 02/10] coco: tsm: Register the TSM class before device
 drivers
Message-ID: <20261124170754.GB114530@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-3-aneesh.kumar@kernel.org>
 <20261123152903.GG179082@ziepe.ca>
 <9f92f7ed-5198-45aa-9cef-515ccbf98398@amd.com>
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
In-Reply-To: <9f92f7ed-5198-45aa-9cef-515ccbf98398@amd.com>

On Tue, Nov 24, 2026 at 11:40:16AM +1100, Alexey Kardashevskiy wrote:
> On 24/11/26 02:29, Jason Gunthorpe wrote:
> > On Mon, Nov 23, 2026 at 02:03:29PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > > Register the built-in TSM class with subsys_initcall() so it exists
> > > before a platform TSM driver probes, independently of object link order.
> > > CONFIG_TSM is boolean; remove the unused module exit path.
> > 
> > Why isn't it modular? This is going to force alot of stuff to be
> > non-modular.
> 
> The TSM core registers a class. The platform TSM drivers register
> TSM devices of that class. If a platform module loads before the TSM
> code - the class is not registered yet so it fails. We could either
> teach modprobe or have dependencies in the module or do this:

I understand that and Aneesh's patch is fine to solve that problem.

I'm asking why it isn't modular. They don't conflict, using
subsys_initcall works just fine as a module.

Jason
