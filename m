Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2704B1CBEAA
	for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753799362; cv=none; b=a8hD2m7iAgj1ugdx/dGol8atespm83MEHl1/tVM9roxYDSWo2niWE2otiyBAcSMqV3QGuCngmLFQ3P6EvocRACoeagePfwjdlGjTllPK0ydx/vSo3edg20Vgi/itskt6driIhTUrSOSshfOZKx3GOyYW94U5UYacAF9vaE7NN9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753799362; c=relaxed/simple;
	bh=xOGcPk1h5mkQlFHPfT4qZPTUZq5yx18xGEjyCFHAQpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvHXBVzo1/WFZdMlduzDahZpJfDPCvOaUopHG4uQuX4XEj69CtyhICAKfGfzHCAuQfbP6/C6lN6WFElnrGHKPezCBOLCb/Qu9YZDp2o4iVaZzXUghqd0LY7H5wwzady1WYOoYmNbpCnG/q9CFoAgfXv5n4kPDAED67lmqwCkrUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=j29O4yhb; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="j29O4yhb"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e638975262so524572485a.0
        for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753799359; x=1754404159; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qz67H2QziopzvIbpAdOwNF/pBaaQ95fyoFVZsRKl+KE=;
        b=j29O4yhbeeY7Xi4n2elxBnGJfos0GzSQ+ttTVYAjMCaX44hs+SeP3fNSVwTYESZ6Tu
         Ajod8lAtKoW3Zj+GMqGmUvt8HV8Pruhy+UU93RHz4n7sMiYYuOnUVaAe4fUkZiO5OMh+
         mhi1hLulaVfRrJU4OQS2I8sQtWZB8VxbHX0WX8LuFECPmmxV6t6UCgabUUV/Cso8R9CZ
         K/srzN9tfqQ0A6/UafJiREW8TSQlhg/a+ZreV2BzwqZ9wO66mCM/e+LHTBRvJWQ+XRcq
         LzQiVuNwGYhSlHYudRGSRQwdEE/wEudyPKIWgE0SdtOHHrL+Tp7yIGIeuYRzKZuMu62A
         9pdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753799359; x=1754404159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qz67H2QziopzvIbpAdOwNF/pBaaQ95fyoFVZsRKl+KE=;
        b=JqCRilWENVdHVhDxQzn1jbmUC+9dtnZVuXngA3UtzRG+RDiWcv+TCBNmUvUeDwOOuz
         HDUfZX0nohPUYkt51KiQ/yjEFNMxh2G6YVTNtyM3+LgzTW+uOVwPokO933By1eJ2gZ2v
         SDoyt6zfr3HzNp0nAZEYaKbOmhw0R+I3ebKtQCH6AImXHuEbLwrfqMKJ0zpY3VW+v9UP
         QK7EZ5MzDmkVta2H+gY3uh5Q8EQI6U7djJ5Y7p0gU7Z6B2DHEp2CinsDgnxUPpowOzQp
         MuEZ9xdQdKvC8/7cFy38dKuq39ad+uj0OXL90wfv6XUJi4NM7VYKwyjO5mN7jZmHfeOV
         1ouA==
X-Gm-Message-State: AOJu0YzfrmVlSrtL1kN3ic2aP3FcItl3h1PderwtTsOLj7lopQlvTiCa
	fQa1xtPoE4g8ezJ/FP9VZsDOo/Y/U2bOQH38uKNDbkc2+KW2nO9yGnPiEQeaVLVHbFE=
X-Gm-Gg: ASbGnctxQTZctjnquvNL/viA8MiFwHriXrbwJA07KE3urRU/s8pn1gctBFTH/fzJypA
	uWVqXWB7/wtomi9bchb2Km0SwZ0qEweA2ho3sXAMuYmFMbAJMMPk9xdUBiZlc8iZOIJBTI3s937
	y6HZdg/F0OuQ5z/gpNp+8ae/thrqSWPRfIHFh95pYxfZ2iUJVx8F0FYyuY+XmPEsVXPDD4sj2pu
	YdBPKhmmrulufH1XIQ9K4DjMld8iDN9ERCCbsePjKPR4jaAaMcSiOs8yLztVmfyDzXgg8MitivD
	VInS5IN19pIuUoXkgufc+UcmQGy6x4nfbxXTc4+9gVRw8VjHopQLBg+6KGeuEE/eCWq2g1F1kEx
	9KT2l703pkYepDRLP31j5kDxYzEY/srTDLXMWIq0EJhHpQfcEqsbVkFCcZpHYYYN8BuUB
X-Google-Smtp-Source: AGHT+IHYkw6eFpxfaIRVF1srsJ9FJ19UlQqBR6yhpID34uYqJijJ/A3tTeVFt7I+4cQKncFmezcccg==
X-Received: by 2002:a05:620a:8386:b0:7e6:65ce:2bb5 with SMTP id af79cd13be357-7e665ce2c46mr224992185a.47.1753799358715;
        Tue, 29 Jul 2025 07:29:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e643897b24sm431209085a.75.2025.07.29.07.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:29:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uglKP-00000000JGf-22cn;
	Tue, 29 Jul 2025 11:29:17 -0300
Date: Tue, 29 Jul 2025 11:29:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 06/38] iommufd: Add and option to request for bar
 mapping with IORESOURCE_EXCLUSIVE
Message-ID: <20250729142917.GF26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-7-aneesh.kumar@kernel.org>
 <20250728140841.GA26511@ziepe.ca>
 <yq5a34afbdtl.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5a34afbdtl.fsf@kernel.org>

On Tue, Jul 29, 2025 at 01:58:54PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Mon, Jul 28, 2025 at 07:21:43PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> >
> > Why would we need this?
> >
> > I can sort of understand why Intel would need it due to their issues
> > with MCE, but ARM shouldn't care either way, should it?
> >
> > But also why is it an iommufd option? That doesn't seem right..
> >
> > Jason
> 
> This is based on our previous discussion https://lore.kernel.org/all/20250606120919.GH19710@nvidia.com

I suggested a global option, this is a per-device option, and that
especially seems wrong for iommufd. If it is per-device that is vfio,
if it is global then vfio can pick it up during the early phases of
opening the device.

> IIUC, we intend to request the resource in exclusive mode for secure
> guests—regardless of whether the platform is Intel or ARM. Could you
> help clarify the MCE issue observed on Intel platforms in this context?

As I understand it Intel MCEs if the non-secure side ever reads from
secure'd address space. So there is alot of emphasis there to ensure
there are no CPU mappings.

Jason
