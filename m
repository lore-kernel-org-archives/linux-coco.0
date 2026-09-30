Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5394DD3A2
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779595; cv=none; b=PaZ3NtK5vlPdg6N8twt9dFJg7QpBQyltmh8pb/Wxt8Ix5XisenJS6DQnST0R+2s+42n+0NShALAlgi01QYiIfj/CzdAmdqJ8smNsiz0juzafeSkwNwiNoon7Oz33wmeRmCXcF3lYm2OM6JQ0RFGy08LpRLPJzYc+taorch5edO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779595; c=relaxed/simple;
	bh=/tPonSezqD0pF109OBVVQK1etAIG40RxHqGagp/vXC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlwoUKKdP2FQCP1dTfSIInD0Lm3pxH1anwjvV8MKbnAKr7cKG6ceNcP/GMgo2dnaSe/nmq1xsna0i4q29fwGeLw3N6mfIJ435uxo3xqdAOisrNKZsff/TQIW3dNCo1gpn/zE1XyDsisn7XNWIly5vVJB1HQTGohgxBTHfn5dKUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ebXKJeNR; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ebXKJeNR"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c3304833so2129827a12.3
        for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 07:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790779578; x=1791384378; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtrQ0tj7FzMG4yS/5Pbmybyv3bn+aU+u1tYBCpeACnk=;
        b=ebXKJeNROqRr2rHxYljpc/UMGPfFO2Wx22hiNlHUIJ5cRnkBnnTiXEEqIaL/OazfsH
         LSpI5Dab7Oqhk1HPc2oqYnvi0CoQEA59SIZ+oP0sBgjfShsz28Tk/2feeDSDj7Jk/uiA
         FALzJxzuFVqzPBebrcqNEL7g8qdKXpxonz/pcbMEVdwK76qQdSa0uHuFQvts9NzA/Uoe
         9vl1GDuJxsGh9FVLafLYGK/aqD8+0n+2zdz4I4EaI2UM2cY+AMigbJtgpAq+voH07LMk
         Hzeknc2EZW5H9QPRd5NuQQsblXrxjMSuPdCARDNWybHqzxM1E2y4oFsITgrEKcMZoQtp
         9XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779578; x=1791384378;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtrQ0tj7FzMG4yS/5Pbmybyv3bn+aU+u1tYBCpeACnk=;
        b=IYCerqiOTCPiccFMWye/a0EioBr08hsMX+RNVZPMIvxABKSRDyDH4sFKnQtSLVCr2W
         uiEvru8XxBRyOGCdosrNQRS8ukOuFFNc9zbNgkSrjqHGazvgs6hWeX0nPJHRaivmjASR
         EmV1QaTJWAAVzXpRMH6pajzVju3EI8WEiHA5Wx92uYpif2iIeUOMyke09TBRU6MJ6v/E
         K3RLsFhSILIdQAuuuWki6XvJyQkCcKD6bI4Kt8JIGrDWlRpvtsO2jAyKnwxUkfvvHcM9
         nJ29JeMoEMbxZ517hlbFXLnGM9oMEBjHwizMv8Dta9id6q/j0xRQ0nWNxkTORUx9bHFQ
         QAJg==
X-Forwarded-Encrypted: i=1; AKwUvBwrTR5/TbgxyqJOCR8NEy+Z5ATNMwHvwbew51WJxMOb/GbP+lVe00iBLLfHNfx+30wJOEnrOukhXEGx@lists.linux.dev
X-Gm-Message-State: AFuF++mJUbhMTXFImeFEyAf2fYTy/DOH/xC7zi1eJrQPGC6PrRSxOpZ+
	PwYLb7x++b73IJC9HS82qgIoVaisb0DZvkOdRzezimW7Ti6eY2QBsXppokH7pCNK46o=
X-Gm-Gg: AYBFou36C8hE8ov5qTe/3ha3H6U3woUJ+7gU/42cvaUqcYCn6kxeJjWUcUUBuVsUv/a
	Scbk72zj3T67wcKw8wmjfXyMj5CCgUuR2lBZ8oG04SuMqRo6lY7DOJkbs4EzUsQJmcfRa7qaIS2
	dt1HIDhZ8hlK3YpVhfw/qvDu58Gpvq3cYWLVA6u+eKJnen6onwQ+Zhmd9iht1nBhR6ij+mw5TmA
	6WlUvhfxJOp8dR7Qn3XcdZUWgEeaQXVkxl1X5COFMuqkWjlwwcE8Q+ekFwlhTGA5bJTIFqW3mAt
	AuuRj2JubrRI0zyld76Yc9oaoheyO7WWLX2CVT3HAzycT9bAMBJVcgDIoPq3s9yiz+rLt8kAspK
	K+Jq0ZFRtmN22O/LDU0iMPbdsUCAN4z9wnJnPCuVQX2HrxSk9zg9esfcc1jvX3APwzPiJfM2xy0
	RRcCUCg1uQ13P24blTPjHSJeGTEjKBW8o7yFvp8cAgoXjEF+c5Y5reZtO++PdLvSd/2t7yrVZd
X-Received: by 2002:a05:6a20:2d2c:b0:3de:73aa:2f34 with SMTP id adf61e73a8af0-3de9e885dbemr1692719637.65.1790779573183;
        Wed, 30 Sep 2026 07:46:13 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f5b4:4d0e:70d:9fba])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7daafecb3sm1108997a12.23.2026.09.30.07.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:46:12 -0700 (PDT)
Date: Wed, 30 Sep 2026 08:46:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	ankita@nvidia.com, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Cedric Xing <cedric.xing@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Cameron <jic23@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
	Kai Huang <kai.huang@intel.com>, Kees Cook <kees@kernel.org>,
	Leon Romanovsky <leon@kernel.org>, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Lukas Wunner <lukas@wunner.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Fontenot, Nathan" <Nathan.Fontenot@amd.com>,
	Fang Peter <peter.fang@intel.com>, Petr Pavlu <petr.pavlu@suse.com>,
	rick.p.edgecombe@intel.com, Samuel Ortiz <sameo@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Saravana Kannan <saravanak@google.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Will Deacon <will@kernel.org>, yilun.xu@intel.com,
	Kevin Tian <kevin.tian@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH] coco/tsm: Update maintainership
Message-ID: <ar0gsWpZH3izCCvw@p14s>
References: <0-v1-52697321555d+14e66-tsm_maintainer_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-52697321555d+14e66-tsm_maintainer_jgg@nvidia.com>

On Tue, Sep 29, 2026 at 08:26:41PM -0300, Jason Gunthorpe wrote:
> With Dan's passing Aneesh and Jason have volunteered to take this on, with
> the support of their employers.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  CREDITS     | 9 +++++++++
>  MAINTAINERS | 3 ++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 
> I've now spoken to all the main companies contributing here and asked for
> volunteers. This is what I could confirm at this point. I'll be at LPC also
> for any further discussion. Regards
> 
> diff --git a/CREDITS b/CREDITS
> index a0bd941ca5dd26..7749f1e477ab43 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -4414,6 +4414,15 @@ W: ftp://ftp.uk.linux.org/pub/linux/people/willy/
>  D: Linux/PARISC hacker.  Filesystem hacker.  Random other hacking.  Custom
>  D: PPC port hacking.
>  
> +N: Dan Williams
> +D: Technical Advisory Board member
> +D: Asynchronous Transfers/Transforms (IOAT) API, Compute Express Link (CXL),
> +D: Device Direct Access (DAX), Filesystem Direct Access (DAX),
> +D: Intel I/OAT DMA driver, libnvdimm BTT: block translation table,
> +D: libnvdimm PMEM: persistent memory driver,
> +D: libnvdimm: non-volatile memory device subsystem,
> +D: Trusted Execution Environment Security Manager (TSM)
> +
>  N: G\"unter Windau
>  E: gunter@mbfys.kun.nl
>  D: Some bug fixes in the polling printer driver (lp.c)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 72294ddfa5b757..729ab465af96a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27788,7 +27788,8 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/trigger-source/*
>  
>  TRUSTED EXECUTION ENVIRONMENT SECURITY MANAGER (TSM)
> -M:	Dan Williams <djbw@kernel.org>
> +M:	Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> +M:	Jason Gunthorpe <jgg@nvidia.com>
>  L:	linux-coco@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/ABI/testing/configfs-tsm-report
> 
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> -- 
> 2.43.0
> 
> 
