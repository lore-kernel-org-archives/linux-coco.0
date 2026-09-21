Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B698451991
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 08:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979950; cv=none; b=eoMzLkX+qQ5d8CErqBhFOH/XewjIpCk9xkSk5By9mFydHU+sOPoEaXWAqh7a4CSPfuT3aEK2DKEYSYG+pLlbG/+1XSRmzubjMkjjOJ7bDHozhujgC3Dgdj5lVMMgxMl520jCeRAGmABR6yHHvDzN/NvGO9r427qYZBFc/1nBgaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979950; c=relaxed/simple;
	bh=GvzSXGOfWBYszOeMAcCGr5j7yP5kLMd+6elkwQKdA0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvcrR8O0xx+AKGqtfZgYVw73DbRk+6mEJtqG6Bz+g4L64HUqd6Zc6zW347d4ILWIaT3nE3WA/lhBIIasVMb6dBiMVOcKfsjqjM9SZcdy40bGX5vrK0N902Fz1SKA1a/NwrkW+Jbt5q94zBFyVKK1pKpVjnbpxNJetLQk7Ppf3pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=efjYDGOz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="efjYDGOz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D833F175A;
	Mon, 21 Sep 2026 01:39:03 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6E403F86C;
	Mon, 21 Sep 2026 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789979947; bh=GvzSXGOfWBYszOeMAcCGr5j7yP5kLMd+6elkwQKdA0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efjYDGOzAkbD7o9EOG0YIDSQRNlf0X871uMPY1tnZLNoJCZf/qvsYURtrwJ9TBWTb
	 teOTny1QW77hZZiN+obpSsQoG81tjC/RnEU/OL12TVF821L6JDQKsDhbPZPlBT6dhX
	 2G51pdU6TiTyLuH94XzqMuzi5zhs5hjfqCxsFJ/Y=
Date: Mon, 21 Sep 2026 09:39:01 +0100
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
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v12 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <arDtJaSvZMgpnP1t@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-2-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921053807.354802-2-aneesh.kumar@kernel.org>

On Mon, Sep 21, 2026 at 11:08:01AM +0530, Aneesh Kumar K.V (Arm) wrote:
>  MAINTAINERS                         |   1 +
>  drivers/firmware/smccc/Makefile     |   2 +-
>  drivers/firmware/smccc/bus.c        | 158 ++++++++++++++++++++++++++++
>  include/linux/arm-smccc-bus.h       |  48 +++++++++
>  include/linux/device-id/arm_smccc.h |  19 ++++
>  include/linux/mod_devicetable.h     |   1 +
>  scripts/mod/devicetable-offsets.c   |   3 +
>  scripts/mod/file2alias.c            |   8 ++
>  8 files changed, 239 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/firmware/smccc/bus.c
>  create mode 100644 include/linux/arm-smccc-bus.h
>  create mode 100644 include/linux/device-id/arm_smccc.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2414447892c..42364c540f50 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24741,6 +24741,7 @@ M:	Sudeep Holla <sudeep.holla@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	drivers/firmware/smccc/
> +F:	include/linux/arm-smccc-bus.h
>  F:	include/linux/arm-smccc.h

There's also include/linux/device-id/arm_smccc.h introduced by this
patch but not covered by MAINTAINERS.

-- 
Catalin
