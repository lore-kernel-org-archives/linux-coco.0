Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE38F40D563
	for <linux-coco@lists.linux.dev>; Wed,  5 Aug 2026 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923524; cv=none; b=OOmii5Sxnz058Ofpx8k7lTrKD4CW4Xm0cToY4MrU3hBIa8KWy5XKOQJekVlqiWhCqhL+H3I2cpjbVfWBcOvvn8caCMZyNn0yVKHXzjXhYLYGOhxN+cCQaUtiRGL6S2Sw75xatrpmpi9sgtOFYry24BePPeqlvZyZ2+uWV0I4gJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923524; c=relaxed/simple;
	bh=FppMoqQb3BS4Kf1KNqMwfV4k8nOttVFmvr6G6hrRElA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2jF1Dk0SN/gLWQydBYQWRMmQvmzRmVugH1a2NKQCL5azCqHzTgDuPXIxJrduKzBnJm1HMo2LxRVJ0289tWTqgtq8wFkyVFkA+eVLJatOTVbttCf8PxL/iAA1g4BWpszoWMM5dK0iHPjKz8NzjXA7GmAT1uF1kwApyJVlyJmoBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kYbB2UOA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kYbB2UOA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC50E153B;
	Wed,  5 Aug 2026 02:51:57 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E59393F66F;
	Wed,  5 Aug 2026 02:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785923521; bh=FppMoqQb3BS4Kf1KNqMwfV4k8nOttVFmvr6G6hrRElA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYbB2UOAtU/w+8T0WUapazRtMn6GjaxxiWPzKTHqDxwl79u9u7ObSXVPAad5G2uSJ
	 todOdUjAG4zwFnnP0uj/RyEzw63v0bh1H5qXpNsDPIx+FpKzHavx6yjnKGQ7ggACrM
	 r7WF6wYRUTfUutcGeOh2p8HMq1pySbmJTWswVlwA=
Date: Wed, 5 Aug 2026 10:51:47 +0100
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
Subject: Re: [PATCH v9 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
Message-ID: <anMHs65s6Mk-ZRdT@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805063255.1638614-1-aneesh.kumar@kernel.org>

On Wed, Aug 05, 2026 at 12:02:48PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Changes from v8:
> https://lore.kernel.org/all/20260707081351.1680209-1-aneesh.kumar@kernel.org
> * Rebase onto the arm64 for-next/core branch.

Was there a dependency on anything in for-next/core? We normally apply
series on their own branch on top of the vanilla kernel (e.g. 7.2-rc3)
and merge everything together in for-next/core. We (and many other
maintainers) strongly prefer series posted on top of an -rc kernel
(typically -rc1 to -rc3) unless there's a dependency on a different
branch. Never based on -next or -next like branches (which is what
for-next/core is, as the name implies).

> * Move the RSI code from arch/arm64 to drivers/firmware/arm_rmm in patch 3.

Thanks for this.

-- 
Catalin
