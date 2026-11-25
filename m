Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616245;
	b=xVd8p2myW0o+8FCxlyDmhjmQR4YCtxoRM1jC7NSqWF+c/XlxePu8Mf9gtt6nYz4MXKeB
	 bHgBbElCM3IktGgJClWlsJ5XSuMiSzOM65neZKkLCPH2jiEtyXwZRaqKKsUnBvuhxTmsA
	 E0sBzxJYLd6KuSDag8fubcCITjnooMvz+6En2m9QS1dVb4wEoAncska5UinShES907ZaP
	 gx1wNRx07W/pg62D/tfYmjokTZYO8V6BTiztgSSYnjgbuh0LK0ORgETP+cry6kz4jtSCU
	 FS5B97UBiBowW9kYP32Gg09UG7Ky5IyDgxtR9L2vlYi6IOYdeobRJmOBXsIRiI11xWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=82OlthbTcf764s1+nsFlIqp1XEt+X8IqMsOwsuhDROg=;
	b=xT9Hx3n5Z9AaEBbUD+Cwn2aXo/MmBHS22Hy07TGfzUjKxH09x7eS9HI8bgVyFfGCeDte
	 ZFTI7sCkVq71tEHHbWbN3/in/9V1Bp5W1R1Lp5sAn9AqN1z5vVB19xe5vFQVPPLcX7wy3
	 OYMsUFK7KDomu1GKDjIXvJVvLFU/N4t8sq9zw25QOPcpmUgAaePjLQr2OiFpwdIplvluB
	 jpaBV9EauKIlep9etdz2ZxZx0kdBTTFnmIx96GcgF3/9o2e3+gQ/ekNwcACMuHnma+xhL
	 NPTV4T07UQQbBxReW6IvCh1yFVjmwrhsKn3SjGzxPCwrSa7UwB8457a0AvLOhJdWhiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=aWoAz+MR;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC0606A335
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 14:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EEC0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=aWoAz+MR
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so1867858137.2
        for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 06:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795616243; x=1796221043; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=82OlthbTcf764s1+nsFlIqp1XEt+X8IqMsOwsuhDROg=;
        b=aWoAz+MRKJ7ZzjVoomqnIi8F7xtWVif6B6xrm3ZiQN3LCsHrIzjNoksJDeqVFfgfZ0
         6ScroIcQtVKUDNtBAPGV3gBj1UTZMu23rMtu12tc/NKzM+VSVgiTAJHQz/giCI3WIIPW
         D3V5eEeiuCWiaqpKsWTt6RB7RwSlyGVaGakyOvMA5iAKnNz3viOiWz9xJ2v134dF/Dcw
         2ZGCZ8UJR/qejGtBWQuimnD+roaYurUturyOREBMHnebxmuHrypMEyhHLVlTe2fICpGc
         vbkIPICxUyAtihDBln18T9TX69g6GVFbyxkgqC+M9b26nATNNGftaQdMySjfeaQApBTR
         0rJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616243; x=1796221043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82OlthbTcf764s1+nsFlIqp1XEt+X8IqMsOwsuhDROg=;
        b=CF5LnTG1BuuCoqLits0Vf0r+kvleIWQhguE7vy+CXy3TRP826EjHiztRx3cjnCkY6c
         ANZ/YeefBgGG3dnEQ8dQ+4dG8zpsbh5JXhCNnlAAuh/CRxKYvY5OD8BpwnltBxJEdgZi
         ODf57JC8paObc5nsSpkwm9Sr5/1BhiOY6lv3WOsmeSKG9Mqa45UtvQGvtJZm3SyLOUpI
         fQ07wCfmb0EMujC8jpdHrU9npUPPiYR0it6ndl4FKlGSgrr01Io7tlY+7WKnhDx19ERk
         uJchJayo+UugsLGKLoDDlH3tmKiUVGmw9S2/FxOTVb4Fk5pVATopn2cqp6edV8cO1Mf9
         BtzA==
X-Forwarded-Encrypted: i=1; AL+hErEXfWmB7dn1GD4v1ThoFp4lS+KwHIPFaWPYqCizYeXbubCepp+PXibXMYMUQVrDSUysNzbx493oU905@lists.linux.dev
X-Gm-Message-State: APuU4Z+WtP7V9tJnFTDnxSvYwxOSborBHRi4FJHip35XBoW9IUqfRyKX
	9WfmOjqPanmoEiDEdpWbb+PzQ0y0Q3IarY4WWL1fSmB0S+rnvcAhyqAdCMsn7qw6Wmo=
X-Gm-Gg: AZFdTZeWT6jbpJqhmMsWzeVVEgE8V1J3tPV6Rdwn4SsedXkLFXCQuCT9515Myt5jjwn
	UeAg2WUohBCiSicT6bM+x5XkTwx9tsse29joGHIm+Yd5pwrUQoWVtkKSwWep48zCpq9bFYNfpzL
	FSXzvNIWKzx9A599cWOjPHtxUkRJK/QhGC56tYI59twFl4AcMdwaP+Z3/czPXrapZgnyTrKBWFz
	qQftrWTiq2PqOJYWrJPMhkKpsuReHiGe4RGj15pJsmgd2xiGniYI4Z4A5Vt52SBQ0EwoRyRL+hL
	cZjAviqba9oXg2jjndKdojQFcud5gNoX4Ivi4Uo5nUSvhNZx+rQqyKi4zgHn4/Ly6O/Neq4IDYG
	cH+gZk165DLaSxPHiRxrrIkjZD9B0e1ujgIJ7NOHHXPgS8Yypg0GbOOxzFpNNKheXouFYIF647x
	5nJWWZS1FANLsmiKJI1Z9DxQ1oGwIJwhCwIN39yOZge+mXKw1LyCR2nUvbhSkkz5u0NwKvzLTvu
	35r6UMurhaFsh6oMZk+B2tL26Ww7b467zhd8bTgep0PfuIPsxm98Ovt99vRKv0M9E9JGiktvaEh
	3fn0kQ==
X-Received: by 2002:a05:6102:374c:b0:7c1:75c5:c4c with SMTP id ada2fe7eead31-7d739570939mr8150077137.25.1795616243315;
        Wed, 25 Nov 2026 06:17:23 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921645f50f3sm60805116d6.24.2026.11.25.06.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:17:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWDoI-00000001jMI-14hV;
	Wed, 25 Nov 2026 10:17:22 -0400
Date: Wed, 25 Nov 2026 10:17:22 -0400
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
Message-ID: <20261125141722.GB246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-3-aneesh.kumar@kernel.org>
 <20261123152903.GG179082@ziepe.ca>
 <9f92f7ed-5198-45aa-9cef-515ccbf98398@amd.com>
 <20261124170754.GB114530@ziepe.ca>
 <17ee3598-9cc3-45d8-b068-31fafa06268a@amd.com>
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
In-Reply-To: <17ee3598-9cc3-45d8-b068-31fafa06268a@amd.com>

On Wed, Nov 25, 2026 at 02:34:38PM +1100, Alexey Kardashevskiy wrote:
> On 25/11/26 04:07, Jason Gunthorpe wrote:
> > On Tue, Nov 24, 2026 at 11:40:16AM +1100, Alexey Kardashevskiy wrote:
> > > On 24/11/26 02:29, Jason Gunthorpe wrote:
> > > > On Mon, Nov 23, 2026 at 02:03:29PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > > > > Register the built-in TSM class with subsys_initcall() so it exists
> > > > > before a platform TSM driver probes, independently of object link order.
> > > > > CONFIG_TSM is boolean; remove the unused module exit path.
> > > > 
> > > > Why isn't it modular? This is going to force alot of stuff to be
> > > > non-modular.
> > > 
> > > The TSM core registers a class. The platform TSM drivers register
> > > TSM devices of that class. If a platform module loads before the TSM
> > > code - the class is not registered yet so it fails. We could either
> > > teach modprobe or have dependencies in the module or do this:
> > 
> > I understand that and Aneesh's patch is fine to solve that problem.
> > 
> > I'm asking why it isn't modular. They don't conflict, using
> > subsys_initcall works just fine as a module.
> 
> it "works" because it is module_init() in include/linux/module.h:
> 
> #ifndef MODULE
> #else /* MODULE */
> [...]
> #define subsys_initcall(fn)             module_init(fn)
> 
> and then the dependency problem again. Do I miss something?

What have you done to make that a "dependency problem"

The module loader chases the symbol graph and orders the module_init
calls based on a depth first ordering of the graph.

How do you get things out of order in that world?

Jason
