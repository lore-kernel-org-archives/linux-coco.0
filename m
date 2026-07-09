Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EBD3E9F7B;
	Thu,  9 Jul 2026 08:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584768; cv=none; b=fXGEu5JgsvwaEZPMS5wyLDIRMUr66rP18Y8WQhgaCZUvaB5Wgb/JaIcFW9Y6Tt+73gfUVUTHHc825N46ARLtB6gMtCiFRzkjNch6EndViZ85HJiX6o/PIDwwTkVBAXRk3FYdtvxjQ28rAC096WPeQyLM0bAo29iiFfG+4RzpuCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584768; c=relaxed/simple;
	bh=DK8MVWBWKjtJtYiD+0OToxpXOQbJoHg2VaMODL64xeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8bmpg79agJTdm2MXNKyQSdCOexnBjxxipIdYrI9skHZxFw9QeCqs9CwMzsOy1s0Zfm0lzPDjRVlGR7Fvaz9kEr5cTXBor3pmDq1jwqmz7qTc2Uvfk2g08mVXeoKW3qIzjqEZsjAhuIrwK4brUvA8ajZLH6lD7dK9WMSxoWGP6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrD8WIf3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrD8WIf3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A6B1F00ACA;
	Thu,  9 Jul 2026 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783584766;
	bh=UXqUN5fCLyZCbN7uBG3JtTUMvasjG9uxSeitMnaL8+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrD8WIf3qzu0F+NJBla2ORd0jSfnJE21w4csBd2BoRKkRnlvPYCzn382brDiLHOj6
	 87oqQ616n/DJfrnhSBmlb3oG60ugLTh5j1mzNkHmhY6Z8YJpIQASmRLUWTF7A/IodW
	 8nFE30Vmw2Cvzzswm97tz4XI45zKyEi7OXV1OM/bE5sxo33NSZDycJ2dVfiClRdRAX
	 wUQOovmWzLjGgAMNypKyzT6h0W0oBzDFNcjm6xfSbmI40CLXFMgLPj6X3jo8KsO+vW
	 B4wYjrBOf90XL69uOA4QkbnSax4KvdQ1OWVqiyWUMtlH7+Ah+1F2j0EAHYY3lFIYXc
	 B5PWKjlbCSvtw==
Date: Thu, 9 Jul 2026 09:12:37 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v8 1/6] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260708-precise-prudent-firefly-17c1ce@sudeepholla>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
 <20260707081351.1680209-2-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707081351.1680209-2-aneesh.kumar@kernel.org>

On Tue, Jul 07, 2026 at 01:43:45PM +0530, Aneesh Kumar K.V (Arm) wrote:
> SMCCC-discovered firmware services are currently represented by separate
> platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
> represent independent DT/ACPI-described platform resources; they are
> features of the SMCCC firmware interface.
> 
> Add an Arm SMCCC bus for services discovered through the SMCCC firmware
> interface. The bus provides SMCCC device and driver registration helpers,
> name-based matching, modalias generation, and a sysfs modalias attribute so
> SMCCC service drivers can bind to discovered firmware services and autoload
> as modules.
> 
> Follow-up changes can then register SMCCC firmware services as arm-smccc
> devices instead of creating independent per-feature platform devices.
> 
> Based on arm_ffa code
>

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep
