Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD9827816B
	for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 23:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753831192; cv=none; b=CgnKT94q3Pl6ZFFKV4Fl3hO7NRF89nTJAchzk6mdFoZWQ9o7etzCNopexoeM8P9Dw9mATAufrCdRb3dVSWMY3flNETp7c5446J7kIpBtgIpHJzphGPXOCPsIB44UCIHJOqs30//oXhnp0Ecb7Bv0cIo0kdl+qTP95XFT2MvHueg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753831192; c=relaxed/simple;
	bh=c+qevVRK65+YEsONllF903kUYgjJYX41JiZtG9/l2tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/6WltczSsZiNVjNomRJOaeYvTISgWKI/DxmfibtsKUVkr3jxqNUsOXVfXEypeoF89vpfKNrbkr5yi+p6CyplfnqGyqGYioRk1I42ekFGJTXmknmy02kP3r1/b6FiXAsg3+wcoJn+cGxxhYG+4uQozs++ZsmVCaR1B0L/DZhe+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XMmcwBYH; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XMmcwBYH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4aeb5eb611bso24295881cf.1
        for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 16:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753831190; x=1754435990; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AMNPBYRiksp7mCFMd1azqDvewT0I1SAEyDTPXzSObOQ=;
        b=XMmcwBYHD/LTP3EI7IBOnUTwcvN2zNNbu6HTaEl7cn5huAjgq2eMRLhZfNHUIf/W+p
         T80wBPPV25lofIavXpGEEmuRdpSjshhXVn+Pwm9b7InZaDuk73KSyOOfrlP5LyOevW/6
         7IxQ/uwFUYZIwxz5sXAEdnd+KAwOYlfslEn3q/DLjzZ4QEqUH6vKGKdM7nVtezHsiT4F
         F8dHlQ86NFypg6G9Mux5o+4oPxyrwHfGwp+DCnxC6Ip/saitfPg2isimO9nmCjzDnhtK
         lRSHi+rzk/jdhxTcaT9ZrBYsaIPO6J48Xj9h2IrUq1yqVoWKnTf0TGGV6eKZk5SZx8oB
         o12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753831190; x=1754435990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMNPBYRiksp7mCFMd1azqDvewT0I1SAEyDTPXzSObOQ=;
        b=TmPkIwdlC/isW46lB3qI1CiqvDVP/UFwFlCvbWX3UT4oFRMqcK3G/Mabny0LfsWrAJ
         YvpUkggkvLZ8h+ZVm/+hf4p6vi1kzhX4cF6JLDJz2RIQYA732O9WiVQq5Y03u77LyVrI
         Ennm4TsSyyGXybFbD/MWKehgYiz5c1iU9VCimDxP82qUiR+eIw9ZKHyitCNG+XK1VFUr
         tuP8DCuVvp7qoZu34FSV7dy28gUULCpMj4qANoE9A1ikxcSbHkSxM7ZOO46+gdQUa/jK
         jJyx42yXLTbfhEkXE2k5Dw+zDuZbOxDr93Mr/rnQdrNpMbSytzsWKl3vLH3mixAeEORs
         8uwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDOlJn4OgQtm+IOrh7irGJC6T4Vne+ykXxbUR96oodQ/j1z+WC5zwrDRB9u8dsUD0MO71ggBkpx3QH@lists.linux.dev
X-Gm-Message-State: AOJu0YzWFomKnOjB/zBTScE1iuyWJQrnvjoT9okk6RsoGwzT1ib5XiKU
	eJUig5O7AXrGsWrp2rytgnZIxBcooqBhx0sscuCaK0YZo0MTzG9mBRqKuAWAx5SukSw=
X-Gm-Gg: ASbGncupt1jfCvzvzPncYLvzyTXl7NsDuVH4zmeUdjlox9E8MAZKGwSpKwolrBvxZbV
	UqvaSOphKi5RQ+YMJOJCPEebT1KnwfcyasG0EiOtcGkoYvb7t/6qfXMMAgYc4zaoNJILZdmJRsG
	1cCJ2wA8KLFJqONNwsifJgT2gbebdqtNMAc4jAUCvkfkc/56FgqsUi14EpcB+UM5XXQ4YAJTdYb
	WiArwqQNr8ruuDUgyhhP62VDR/D3Wbhh9UADHS1g6QBWt0J9nuWwiKupoT5+nIK80fxjZ/B8v9r
	UjKJA645rgRyXqcpZlKBFAH9atAFq/vUG72FS9dxgxRFvwVESYhQBgpYjcAHG4kpYa7RGdY5vAM
	lVXGojGHXSKFKTQV/iYIdgd1tV2tzh6E9zAD1R5Ils5e8BNt2aZagVacCIUPSH2IONYCY1glmmF
	LGEZk=
X-Google-Smtp-Source: AGHT+IEYB+v/aC52I3ETJqWCtvUpxpSoF5Ed5PqfVqNjoX+1qc9FE31iT0mWajpl0SB8iOsRrvOo2g==
X-Received: by 2002:a05:622a:351:b0:4a9:a90a:7233 with SMTP id d75a77b69052e-4aedb97af80mr26047401cf.12.1753831189896;
        Tue, 29 Jul 2025 16:19:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae9963ba4bsm54605101cf.31.2025.07.29.16.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 16:19:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ugtbo-00000000Mhy-3zTQ;
	Tue, 29 Jul 2025 20:19:48 -0300
Date: Tue, 29 Jul 2025 20:19:48 -0300
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
Subject: Re: [RFC PATCH v1 11/38] KVM: arm64: CCA: register host tsm platform
 device
Message-ID: <20250729231948.GJ26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-12-aneesh.kumar@kernel.org>
 <20250729181045.0000100b@huawei.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729181045.0000100b@huawei.com>

On Tue, Jul 29, 2025 at 06:10:45PM +0100, Jonathan Cameron wrote:

> > +static struct platform_device cca_host_dev = {
> Hmm. Greg is getting increasingly (and correctly in my view) grumpy with
> platform devices being registered with no underlying resources etc as glue
> layers.  Maybe some of that will come later.

Is faux_device a better choice? I admit to not knowing entirely what
it is for..

But alternatively, why do we need a dummy "hw" struct device at all?
Typically a subsystem like TSM should be structured to create its own
struct devices..

I would expect this to just call 'register tsm' ?

Jason
