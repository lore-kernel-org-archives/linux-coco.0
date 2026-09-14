Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021444756BA
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391046; cv=none; b=NCcSfoKsQw3tzJBwqs7L7KaDhggSBYMLVsUjs8Jo3hFA8dq12SR0kQt5w+SlpHxBpApP/y0qORC0GTPYJgZHCK6AHX11zklt5e9Coh/6e0jrJVSeoKUYXcQ18TFmV9lztyF5NWkFCslZ+9+LzcLrj1+2zF7huNZrg46kemD1INk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391046; c=relaxed/simple;
	bh=27WhJHw+wdi8jw8D9edQJlOm2hP65aaJOCyPs9cmJAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARvqhkUo4sKbeAi4jN2fTAbrPf+qPE90xi746tda3XrZGp7+rB5GfmMGE5BZ6dOzAsOcqFa9wZuk+L1ObAFJjvTHplOa0pg54Ipw8veH20U91/o7vepWihnj1EGbzkeBigDDnjdIRVrobZ2wsc8aUel579SnWbh6ZXc3GENBG8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ql147+2n; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ql147+2n"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C24101570;
	Mon, 14 Sep 2026 06:04:00 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E7063F59E;
	Mon, 14 Sep 2026 06:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789391044; bh=27WhJHw+wdi8jw8D9edQJlOm2hP65aaJOCyPs9cmJAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ql147+2nskpgnc7uM6EzX9Tjh1eIHq+F7P0cfA5/E8bopcShrbZ4VI8MBR7uPalRC
	 LMZCG4jkFgtQcxmliI4sMQ20tsGG95mwY2Z9asd6uL1hxDwkN38mcSUmCZSQJDJJe6
	 TeEkYftp83ApnqWmZc+jVfbzVVsFxuGM/wFmRJro=
Date: Mon, 14 Sep 2026 14:03:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <aqfwtAEbj9X5u7VU@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-2-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-2-aneesh.kumar@kernel.org>

On Mon, Sep 14, 2026 at 11:35:05AM +0530, Aneesh Kumar K.V (Arm) wrote:
> SMCCC-discovered firmware services are currently represented by separate
> platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
> represent independent DT/ACPI-described platform resources; they are
> features of the SMCCC firmware interface.
> 
> Add an Arm SMCCC bus for services discovered through the SMCCC firmware
> interface. The bus provides SMCCC device and driver registration helpers,
> name-based matching, modalias generation, and a sysfs modalias attribute so

Nit: "name-based matching" is no longer true. The latest series uses
function ID.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
