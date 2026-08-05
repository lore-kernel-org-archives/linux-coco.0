Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D80643231B
	for <linux-coco@lists.linux.dev>; Wed,  5 Aug 2026 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785928914; cv=none; b=S/T52SDOGHmcUMbqOonSQyKurOzlvzo/+64B819Rkv3RNXiQdswJ/81jYRfRHTExgxjluWL/IpLyKFgM+l4d3uU3fEAKfJ37UqivijPg5RfNI9S4Cpau8cmIte7CUUch81Conca8plv/aomPfI3PNWEFxEVnAbthBIHm0dY8EqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785928914; c=relaxed/simple;
	bh=/iJTCW17ahxPRx1HgFbIWlIcrG14qstN68rpDrM2mKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rM9/09jfbX/QWdC6AOtfD54oWoEy4uXHZesjro/AjxqMjThRdchnNGIR05vaBv20zFcJ6fwIGI2UWdcwCt7OdufT4ussjtOKE4xW/DVS/w44DDrFlx4lTy76eYUVs5rXNPzRwbTChYxwvQ12qF6Vr1AuRBQCaYmxinh1Pf5VKbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=afsruKh5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="afsruKh5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB83C153B;
	Wed,  5 Aug 2026 04:21:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01DAB3F66F;
	Wed,  5 Aug 2026 04:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785928911; bh=/iJTCW17ahxPRx1HgFbIWlIcrG14qstN68rpDrM2mKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=afsruKh5eASSavojLCE9iWwxEk/PzOhPmR0YPhoJKNTNcEQKOHfI+yvWe7I048rqI
	 dXMAq8b7g+4TD6L2EqJpQwhkhqM4bnuvfJe/BLBKfxgZ1SgMOqO9U2bfSzXTcdrhIe
	 p8NIgTSFn8XE9fnNd4aeCsS6b+mtSjKHraeR25eo=
Date: Wed, 5 Aug 2026 12:21:39 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
Message-ID: <anMcw5lTFN7OYreL@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-4-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805063255.1638614-4-aneesh.kumar@kernel.org>

On Wed, Aug 05, 2026 at 12:02:51PM +0530, Aneesh Kumar K.V (Arm) wrote:
> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
> architecture specific definitions. Follow-up changes need to use them from
> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
> driver.
> 
> Move the complete Realm Service Interface (RSI) implementation from
> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
> command helpers are also moved to include/linux so they can be shared by
> architecture code and firmware or driver code. This also keeps the
> firmware interface outside architecture code, as requested [1].
> 
> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

I haven't checked but Sashiko has some points that it may break the
build on other architectures with COMPILE_TEST.

https://sashiko.dev/#/patchset/20260805063255.1638614-1-aneesh.kumar@kernel.org

(for some reason I get error 502 above; hopefully it's temporary)

-- 
Catalin
