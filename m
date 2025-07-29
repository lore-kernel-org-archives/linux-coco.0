Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3129E28506E
	for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753831367; cv=none; b=Qlh2UuNXNfjYETF/jMtP525RhOk29nLfNVqGhVe0QRDBKFeMpb+pRAZK6giNUG6MDUkf2JpyGKaAxV+QN7z0ch9Yk/UHHlkuSBVrw7peZPE1DXrKSHzjbBZne4ICyoYEVFtQkHSN+ksvKsi7UP4ZuCVi9jmbZQ8Hep9Kch7QBPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753831367; c=relaxed/simple;
	bh=5+SxyYSHlUovT7nMO8KUUry70XX33hvq1YMeYnlBo24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYe+dd4YBE0VUT1cdIBiBMowbmfLpGT8qY9cAsQpRdsMDtWmzCO1wBHZ98LxWekKmVLQnpIIhXbkO4KHe1UsiEU0L2U+WF6S9c2Hcbv4a18lQsedohuq6HRThiXgVuGVZKscN1of0Wmh575YyU44YdyjFgxa3/k8OCfEBYfibek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=QckLUOE7; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="QckLUOE7"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ab61ecc1e8so48927891cf.1
        for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 16:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753831364; x=1754436164; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=evOEy7fuRGdGypQDmd9QZXrLo8EABIsGfXRQCCvlWq8=;
        b=QckLUOE7wdM7sGMSqACx7Fnfla4aIIrLMKSV56+eDs5pvk2hnvOSZjiVg1OPRhpOet
         n2JBlGQoO6Vc3hHGDENRZBM17/RyCWx4zGPGQFahi7+OTA50XkH+Jh4CE3ozw8o/RRmz
         LuwWU+mkXwcQlryALd1rx2y0eyakOuJkbJ30sbQEjfB7J0Hx2sgIf9rVw8dbvfjqMhid
         veMDj9lbhI6qLgQaSLxTPKlBZvRdb+8TQvbvw5HS1wJV+rZUITD6RYV0iYzdU7yd3nPH
         3QONlTfFeI3dKChHyVdzn71+H0UJ2J9EoopVyfPAArUAnqN4tE/rVdYxXrU/CCJxULea
         2Y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753831364; x=1754436164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evOEy7fuRGdGypQDmd9QZXrLo8EABIsGfXRQCCvlWq8=;
        b=Brh5V9CcJ1DEh0FxAjScCCqTd4VpCIYoYD1sCVDZUQ3RP2yHChsrdBWxsyJhG37IdF
         fOfzkRlK/ZMxd+Gt2E1qx8gvCvfEpkBgkpc4RXNGga0lWrqA3KAbvpn6crPvbe9MMraJ
         aZBJ0PxY44Vb2XpTu7azbY6X3pnzBr6CEMoQTodqKqjiGRbXayx+to01BGad7C3xVLqV
         aZyOXM77tTCd0nkzeLBJ9YHIw0x1+gNqmEEf7URXtbbBMG1jkD0BRtx8E/oqWz8tma55
         3kFAdIOtAv3d36FgZloY9/fGFZ06P3H+mg6oCNA40EMzXAtAkqg+H2aIWovfjkyG451j
         QMZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBvcBwuIM+4CmGi6SpAQAeQvkrDfINzVylsJuMOL9eCgLFq7SeAfT+/g6Lx9XeTofmo1awsYezqJbh@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx0/0HBaey+YxTFxiLuOu5jbPZyUvQL2eyEaUbPfJz2k1wWa6r
	xj7oNOf44KDumgCompZ8qoTwkShNcedrfWbTyM9hLCVyNMiQPerS592bPZfFKI5YcsI=
X-Gm-Gg: ASbGncv95VPtEzx1gcaP7LBaaXcYpGidx2L+XWCs6luQ8MdwpljJo0qLlkh7dQ2fN2t
	kxa2xrume1+GY/SgCMcZRPfrSBp08meOEunf5U78zaYR0bKg1P+SLuJDVVET+PUisbe+9O02moU
	fDYrO9Z3kIosOS3y8FS2EHUPb6AixJgcaw18BbecZ9PaOFEfBJmzzIXAOtnbSrjFNOJrdNkUncQ
	SNIzw2NVUNYfhM0TiuD5QGnZ0HTzaVN1SL6/6vLxxriI3XBYFqNf7MRHaJorTWzD67yRN4/Zzsd
	+cuqGofzKY4meMgUDupahpNo6B4ob53T+AmIBAAZ8cEpmGvUG3aMMgjyg46ZJwBAPRGVQWtfbL8
	lIwRl9HUFLHZYFLbQFje+fZxyHId+nyiAEJCzvCiM0uflkaHBw5SK8Zn3D8TTovsJgfdPUtaatC
	bVFGo=
X-Google-Smtp-Source: AGHT+IEp29JmYKPTEUTfX9T0WcQPt09uHVFFYXFI1jbMPkfOwjEBLhDqzXpFec1njO1HN+oSVaPRoQ==
X-Received: by 2002:a05:622a:8f:b0:4ab:95a7:71d7 with SMTP id d75a77b69052e-4aedbc7919dmr24915231cf.53.1753831364093;
        Tue, 29 Jul 2025 16:22:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae9951a6casm56688261cf.13.2025.07.29.16.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 16:22:43 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ugted-00000000MjD-0XUr;
	Tue, 29 Jul 2025 20:22:43 -0300
Date: Tue, 29 Jul 2025 20:22:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 12/38] coco: host: arm64: CCA host platform device
 driver
Message-ID: <20250729232243.GK26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-13-aneesh.kumar@kernel.org>
 <20250729182244.00002f4f@huawei.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729182244.00002f4f@huawei.com>

On Tue, Jul 29, 2025 at 06:22:44PM +0100, Jonathan Cameron wrote:
> > +}
> 
> > +static void cca_tsm_remove(void *tsm_core)
> > +{
> > +	tsm_unregister(tsm_core);
> > +}
> > +
> > +static int cca_tsm_probe(struct platform_device *pdev)
> > +{
> > +	struct tsm_core_dev *tsm_core;
> > +
> > +	tsm_core = tsm_register(&pdev->dev, NULL, &cca_pci_ops);
> > +	if (IS_ERR(tsm_core))
> > +		return PTR_ERR(tsm_core);
> > +
> > +	return devm_add_action_or_reset(&pdev->dev, cca_tsm_remove, tsm_core);
> 
> So this makes two with the one in Dan's test code. 
> devm_tsm_register() seems to be a useful generic thing to add (implementation
> being exactly what you have here.

Pelase no, this is insane, you have a probed driver with a
probe/remove function pairing already. Why on earth would you use devm
just to call a remove function :(

Just put tsm_unregister() in the normal driver remove like it is
supposed to be done and use the drvdata to pass the tsm_core_dev
pointer. It is easy and normal, look at fwctl for a very simple
example.

devm is useful to solve complex things, these trivial things should be
done normally..

Jason
