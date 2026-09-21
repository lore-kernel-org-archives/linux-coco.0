Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010CC44F558
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980757; cv=none; b=BGg6CiXfzWALvFNgHzhf4AKB3BWQmew++vwxbyy1kQwrReVmN35MLtXyj1qcuJlG0JOP6ztOKF3hlMnZmfT7oKdcGAXr/SVQJBtiwrMnnAYZdo5AAZVXV6KYAE3Jm2CGryfmFcGAaLnXaWir9BwqwmnPqDEGQtS1W1Ryi+g09Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980757; c=relaxed/simple;
	bh=CwLcddffhPz1q16TjfUQujTQsfAVYtH60K63Ky4xlqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqUyh80RoPgYE8NMbU6b1mv/t3Tovm8OvpKLWW9PCJWI+LsGV/Y6nE98YCa4EnstFyULbY98zeuVBgvEgjOQ/dK6Plv45HHtGir37jHwIpDAsFhdhWaMLvkV1MMMc9UaFoN4CqYGilLEm4yOwJvWVvclyMRIoUmp2wkYec2qT5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RB4Ur3Yo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RB4Ur3Yo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE6F0175A;
	Mon, 21 Sep 2026 01:52:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A63C3F86C;
	Mon, 21 Sep 2026 01:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789980755; bh=CwLcddffhPz1q16TjfUQujTQsfAVYtH60K63Ky4xlqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RB4Ur3YommdXR9xBY86laBzbrVcWw1+EetAV4WEc2Wk5F635xhMaNYBW6Nwezoxm5
	 OaKe3m1nHsIe3zYQEh3c46yvD69Ehz9V3vEELXk1jUrHtGyBIb+31EGqxn7OVm/dOX
	 bUxkSS46JTLbKNIAZasFbySTDjhSQRFMHBolWKlo=
Date: Mon, 21 Sep 2026 09:52:30 +0100
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
	Suzuki K Poulose <suzuki.poulose@ram.com>
Subject: Re: [PATCH v12 4/7] arm64: realm: Move Realm memory encryption ops
 to RSI code
Message-ID: <arDwTjQiqF6VZOau@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-5-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921053807.354802-5-aneesh.kumar@kernel.org>

On Mon, Sep 21, 2026 at 11:08:04AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
> registration with the RSI initialization code instead of pageattr.c, which
> only needs to provide the low-level page-attribute transition helper.
> 
> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
> the Realm-specific encrypt/decrypt callbacks and warning policy.
> 
> No functional changes in this patch.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>

Nit: Suzuki's still at arm ;)

-- 
Catalin
