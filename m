Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C69F433BAF;
	Wed,  5 Aug 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932546; cv=none; b=Z36038C2o4rgeT4cWdqNv3/ReGM9PxPV1TU82gNjF4+hzgvKTZ7VQ8wKuRHsbZWT5WHaCUno4Qp/AmuzNCRslcq5lsemBwSWtbvjD8LOuvm1A2BBYBFkubvj6+1hOoZaelrtxvTWnTD/B7oR1W2w21vyZoIv9DF4n0+QHgBsMmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932546; c=relaxed/simple;
	bh=OHqTPpoy4PlrSjK5plmGj+ERzLd4Tg5Z8i+fDM3t4Tg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mfZnLXz86mC3sR/rqLLq3jJavRGCYEi+Q1cYNkgm2jy7OYquKMdF0MAZydAvstqmvmTBq/WkXnWJEF3mdL90qyT6Hrpv2HYtg5QiR/VpVV9jgJdV20VRNR7+0CXGPsi3uh7AxWzWCOH1kUrZ3BIqVuslijWs1YcmBKwdSNUrC9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6OiclPv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6OiclPv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0D81F000E9;
	Wed,  5 Aug 2026 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785932545;
	bh=OHqTPpoy4PlrSjK5plmGj+ERzLd4Tg5Z8i+fDM3t4Tg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=d6OiclPvJS/21qaE6HRFu5Cd9pppTVz8Z7gq3bGnzkapMrP4+qwNgwAEUDUZF3CsB
	 elSFTEmNXwLrS/m5A9zKH2TtagQ6Jj5nGFSSyMLAKYDos1qwOEcFfMwRn8og1htpMO
	 88cbECxUyTntBhcbLFpUwjrzFlLJY3x/3EyHDEq25vdvr/nFilqdN6PcqeznXFjNF3
	 gd28hdU0y+C3+sdx4bo2GYv2Ybcp2wrDXdq9btP50HNeyK7yy/KQBhOxfeN8Kzug2I
	 5VVU53QIBho1A2kTD1D3R0g0tz82ZILCqC1O9SaguLJUWkoVzwdkBKTtyiO/DjDoKo
	 uw6fQESbB5xXA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
In-Reply-To: <anMHs65s6Mk-ZRdT@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <anMHs65s6Mk-ZRdT@arm.com>
Date: Wed, 05 Aug 2026 17:52:17 +0530
Message-ID: <yq5awlu43gg6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Wed, Aug 05, 2026 at 12:02:48PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Changes from v8:
>> https://lore.kernel.org/all/20260707081351.1680209-1-aneesh.kumar@kernel.org
>> * Rebase onto the arm64 for-next/core branch.
>
> Was there a dependency on anything in for-next/core? We normally apply
> series on their own branch on top of the vanilla kernel (e.g. 7.2-rc3)
> and merge everything together in for-next/core. We (and many other
> maintainers) strongly prefer series posted on top of an -rc kernel
> (typically -rc1 to -rc3) unless there's a dependency on a different
> branch. Never based on -next or -next like branches (which is what
> for-next/core is, as the name implies).
>

The reason is that these two patches create conflicts. Since this series
involves file movement, resolving those conflicts was not
straightforward. Therefore, I rebased the series on top of both of the
following commits:

commit 24f55f511b9e ("virt: arm-cca-guest: use migrate_disable() for attestation token requests")
commit e62decaf98e7 ("arm64/coco: Add pKVM as a CC platform")

-aneesh
