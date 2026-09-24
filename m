Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CAC3DA7C8
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266847; cv=none; b=VWq6BXzz5/f9xrfHoYR5UEb/uh56ZGK6msac7p7IROxd8joW/uvUNGZG4lms2SFgmfUoJEKWK6y9alirk4DxQT6891FKnwaLgCvV3C1GqS6u9sScUWLnR/9dFrLU5y5DrLX9unke3X+/Vxxj+My/X0TY5Qako6AqJ4atLR7SQyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266847; c=relaxed/simple;
	bh=Pe/zNtEpCcy1McYVhFRzIjTbk04DgTe7ite2+ZGUsnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=frprjHdJCblj3sXm11leP2EFqkMjeXAe8Aj9bWOrdwNCKGV+85Uu6S/k5qXXydpLBTIzaWEay+wOttVTu3jHvTGE0FKSefmRgIC049EkmlNibJvAgSJ78+/LsHzWg5DEwFNwikZ9xstsErOlMhLnqsk4Tb+/MYki+B95RgybCi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qBhabypI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qBhabypI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 016C3497;
	Thu, 24 Sep 2026 09:20:41 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECCA23F86C;
	Thu, 24 Sep 2026 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790266844; bh=Pe/zNtEpCcy1McYVhFRzIjTbk04DgTe7ite2+ZGUsnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBhabypID4ejayZoORGRa0QqVCZ74MT0qol8kkbDdKqzRo6plOuNZigFbSpt1/OV2
	 wwHY8tQYzR4DZxbj+Rtdgx7v2O7WHekeP09NJqp38PFXbIeu73JuestUb5ihi1tuXQ
	 esuvnghGt/9e2ulRtg10zxb/ejkCB/o1uDB8n/Ds=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Russell King <linux@armlinux.org.uk>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v13 0/8] Switch Arm SMCCC firmware services to an SMCCC bus
Date: Thu, 24 Sep 2026 17:16:25 +0100
Message-ID: <179026658584.3654431.7189876471375206962.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 23 Sep 2026 19:33:57 +0530, Aneesh Kumar K.V (Arm) wrote:
> As discussed here:
> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
> 
> The earlier CCA guest support used an arm-cca-dev platform device as a pure
> software anchor for the TSM class device. That platform device did not
> correspond to a DT/ACPI described device, MMIO range, interrupt, or other
> platform resource; it existed only to make the CCA guest driver bind and to
> place the resulting TSM device in the driver model. The same pattern also
> exists for smccc_trng. Creating separate platform devices for such
> SMCCC-discovered features is misleading, because those features are not
> independent platform devices.
> 
> [...]

Applied to arm64 (for-next/smccc-bus), thanks!

Greg, I think the latest addressed your concerns in the past with
abusing the auxiliary device, so I queued them for 7.4.

Olivia, Herbert, I assume you are ok with the hwrng changes in patch 2.
Please let me know if there are any objections.

[1/8] firmware: smccc: Add an Arm SMCCC bus
      https://git.kernel.org/arm64/c/fe7f2a805443
[2/8] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
      https://git.kernel.org/arm64/c/d8263a131bb0
[3/8] firmware: arm_rmm: Move RSI support out of arch/arm64
      https://git.kernel.org/arm64/c/4cd849026e2c
[4/8] arm64: realm: Move Realm memory encryption ops to RSI code
      https://git.kernel.org/arm64/c/714153dca3a8
[5/8] virt: coco: arm-cca-guest: Rename TSM report source file
      https://git.kernel.org/arm64/c/07005b64d72a
[6/8] firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC device
      https://git.kernel.org/arm64/c/0d5be76b6086
[7/8] coco: guest: arm64: Add sysfs ABI for CCA Realm guests
      https://git.kernel.org/arm64/c/d541df166d18
[8/8] coco: guest: arm64: Remove dummy CCA platform device
      https://git.kernel.org/arm64/c/bce57945f5e7
