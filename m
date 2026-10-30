Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369339;
	b=sNGiDU9E+iNqx2A/x5rKf5EJj8FZcNAvqQzM2cjLDTMz9HTVQf+OftagKmOl9Bf34lnP
	 CtKWvU5W+SKLa8gzLz6wsW+ocKXANbeHBgXhoFOoD8MRdBtRSzrkWi0eBabDEzUFyHq2b
	 kO1Igug6HIqGT25PqtlkzABaKeTE1Ohv11S4eXkfOZcFXqk+OSUDXGlbkNvhy7ZCoMrsW
	 F8xUXVDLyNfnsXT6+jQEyksX/UlAb3OK3bFCPNX394wAxeSerWWTzzmlAP3l5aMTAancU
	 1bu+bWq4O6Fr6FVd1ZKBAy5hpeHs8iBNvFkef6GrV37hYFlzpBGN+DNXkrYip0eI3oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zCF/A13vIjO+9DR3ZIgrg0bWRmU50vlNeLEYnFpFx/0=;
	b=0xTvzh5eFnXlmzUHGKkSg4wACrbgZkTMFf9AvP3dK6gs2Cmtg+5ztnKlufj/ccVqXlr6
	 uzeEMH575+TzTWxvcpfgX/OHDUIm/buqttoWAfWYTgBS+Oh5jX1hsY8THz6F2L0tLZ7jM
	 sPrkxfyiK2iUbhWq7Gm7rUzL5Rd54guzH5TitOF0cI5G1VXvSsNU2CsyIwtwokQm79L48
	 Q3cgjpB3BLC50EKW1e9GXTr6qznUtL7QeAQWUMnTs/rTkSMau71Qoxecrxui04626qEkE
	 jf/UQ3puSlAl5bHkXjAad1QXi3GnM0Nk0M3q76Bjhcez1mJqSHQYlSvzcTq/zcbG1HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=yTzkdy9e;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FE5606A31A
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 14:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FE5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=yTzkdy9e
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab3dd9667dso6482291fa.1
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793369337; x=1793974137; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zCF/A13vIjO+9DR3ZIgrg0bWRmU50vlNeLEYnFpFx/0=;
        b=yTzkdy9eitMqOy2kzOfvIRsqaOJQ2G9d2+Bf7ACC+eL7OAdgZcQJyd7+JxuCrucmTm
         5PXQglR3d92hFN3lC+Pw3gKxkdkWwpRJJdiBk+qsAXVCKA9rpvPeRqzNvWE0kO8cefxI
         ji5HCTWgQsKPiHaRyfuda0QtbEVNjgWlgq11FuDqNml4abtvFIAzlTl2NtOC0U6jD14Q
         2fDL+x9xPAAwsTQjMgvfhTg8h09jStOQRZwsvMo5dBRS80fsQZC5U4691YFlG6ZWh1Gs
         aq8ICIymXmJw6AStiKYZSTMYM/lNlJVpdJ9ZZNqLfU8Y6fSTBhD3eDUCeRkfFRIL5WvC
         kaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369337; x=1793974137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCF/A13vIjO+9DR3ZIgrg0bWRmU50vlNeLEYnFpFx/0=;
        b=xs0KeuVjeOepVPwsgKBg8EnkG4E5qeWchWYgqw4//+1MQ9UVw9WqxTsGz2D9aiW6WE
         MGfb9/sadrjVXLgKjO3GQt1lybFVTuuRNi16kuGynM558dFq+7/Qk5tz8oZ4DPRKqPY0
         wpfUgMcdouun6erOAy1rvd4lneRtjac4+L2tBoFPw4XJ+0vcZkOSlusD4caFAQms4CZl
         62jeB/sszMuDRndOjgD2AI3Lp3qTTZWgGXNYrXZBIM0B4+KvR3AOs2w0Dg7z6IENPJGZ
         MzSpqjCzGsvTITkYIQUb7jzaY8Tm+Cfw4Y8wmwCOVqJIh0sCI3/KvELn4hRSO048AV7O
         8kFQ==
X-Gm-Message-State: AFq9FYJQ4LFBScCQ0erFKG1X1BiNdyV6cn/FkMhtr876hnkANMakl5rf
	FbuPevFBshiYYljAxbeCq8sF+v1nns8V6kUZU1wzNyjCN/DiqN9x0bkpYrzLbWDUbOA=
X-Gm-Gg: AYBFou3QGRwHRyDUSgMNMJnmNptLkLKwY2hekazV459GlqfaiAOx+1y2iw4O94Y0+kE
	Ng0aBYo/0ePv6vU22rvvHL3+kZY0mjMVTS7oXSpnvexZ2zxBp4JoOwy1vm+6hvDSgYbsl8q53V3
	lkb7Le62mRj5bLwYB8XkKPHLBEXwzkt7Ftjl+C4oPtFGMws/UDrrRaoq9zEez6n9PT3lmgAK0KO
	h0mG7Stj9j+izPU+jh+lQXKG/6fKpjysr4ZGHsraXCuqCGPAT6dyg3Zu1ZCG/TlvU0TWk0ndzUC
	6IDtWt6WaWtS/Z9fodaVxynMPbDHMRHfUsS9ID3dmJvRUJsBhuvOAdQ2sLbwgQU5uStlG22yVFL
	stImVVm3YNltcq6cjaKdxNeCGdRAZOwFHXO5w6mde6xVCZxXy68j2UyjE5doOAd46NazetvWbm/
	h6OEvhWDUsqnYdJGE7mHYG/rniBXjp4H9gIpeXlzogEKNxq8sboveEL1KX27LEswFpmJn4BqUhd
	MP7cYj4uKXjPn8VQfZl1M5xYLDnZiTqZJ0Z4J6J5lWK6T4PBmCC+9IlGpbQ3gXmYpPfOzWM6fWl
	PUo8Ahiw8U+UwVWFVVYIoyum9XufGnVZatF4uVQd
X-Received: by 2002:a05:6512:1314:b0:5bf:c27b:8e52 with SMTP id 2adb3069b0e04-5bfd9582a06mr842560e87.65.1793369337326;
        Fri, 30 Oct 2026 07:08:57 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0737065sm2501e87.42.2026.10.30.07.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:56 -0700 (PDT)
Date: Fri, 30 Oct 2026 15:08:52 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev
Subject: Re: [RFC PATCH v1 08/11] PCI/TSM: Bind CTLV attestation to connected
 and locked contexts
Message-ID: <auSkHORl2mg_FiOf@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-9-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261028152618.1356860-9-aneesh.kumar@kernel.org>

Wed, Oct 28, 2026 at 04:26:15PM +0100, aneesh.kumar@kernel.org wrote:

[..]

> 		available authentication methods for the device.
> 
> 		When present and the tsm/ attribute directory is present, the
>-		authenticated attribute is an alias for the device 'connect'
>-		state. See the 'tsm/connect' attribute for more details.
>+		authenticated attribute reports the TSM name only after secure
>+		session and stream setup succeed, otherwise an empty string.
>+		Connection control uses tsm/connect and tsm/disconnect.
> 		This is a "link" TSM attribute, see
> 		Documentation/ABI/testing/sysfs-class-tsm.

[..]

> static ssize_t authenticated_show(struct device *dev,
> 				  struct device_attribute *attr, char *buf)
> {
>-	/*
>-	 * When the SPDM session established via TSM the 'authenticated' state
>-	 * of the device is identical to the connect state.
>-	 */
>-	return connect_show(dev, attr, buf);
>+	struct pci_dev *pdev = to_pci_dev(dev);
>+	struct pci_tsm_pf0 *pf0;
>+	int rc;
>+
>+	ACQUIRE(rwsem_read_intr, lock)(&pci_tsm_rwsem);
>+	rc = ACQUIRE_ERR(rwsem_read_intr, &lock);
>+	if (rc)
>+		return rc;
>+
>+	if (!pdev->tsm || !pdev->tsm->dsm_dev)
>+		return sysfs_emit(buf, "\n");
>+
>+	pf0 = to_pci_tsm_pf0(pdev->tsm);
>+	if (!pf0 || !pf0->stream_connected || pf0->base_tsm.error)
>+		return sysfs_emit(buf, "\n");
>+
>+	return sysfs_emit(buf, "%s\n", dev_name(&pdev->tsm->tsm_dev->dev));
> }
> static DEVICE_ATTR_RO(authenticated);

I had in mind removing this attribute alongside the staged connect
change and reporting authentication state through SPDM_GET.

This instead retains the attribute and changes when it reports the TSM
name. Could we settle that together with the SPDM_GET interface rather
than maintaining parallel authentication-state queries?

Jason, what do you think?

[..]
