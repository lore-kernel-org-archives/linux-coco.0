Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D4F25D1F5
	for <linux-coco@lists.linux.dev>; Thu,  9 Oct 2025 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997613; cv=none; b=EK25SqYlaAb2V8iibGg42LMOTyXgB4VQTgpmpo8aapApOnagFOOh22yV0bSGORiFdyHvEwrivNfZeiSR60AoEOFSSfZ3TGAsz9VZDaBlnwFH+7AYGZYQ5FJghSU0lKW8XxRW2jGAkAe4ulCdCeJVclJpDP+P+t2LQswqf0+eNTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997613; c=relaxed/simple;
	bh=/mhrOfJYmZpD6Yss7l6sfik86/51FFB1qIV0SvX5uxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxEHgJlf2OWGpeFKlz9178kmtl2BrgMrsUX3GNpMlazlRKq8W+7Ukihm5NJQZiPcqWuTlYvXzQfsOSmaV2Ot+SmzmRFxbC0Ri7L538cS/snAw9a7PAS0Pblaq02NxaNEVYZJGDZz/l2Q2H3KC3/3EOXZpE5iXcFNvI+h1I2uSfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 282BA176A;
	Thu,  9 Oct 2025 01:13:23 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3F8D3F738;
	Thu,  9 Oct 2025 01:13:28 -0700 (PDT)
Date: Thu, 9 Oct 2025 09:13:25 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <lpieralisi@kernel.org>, <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <andre.przywara@arm.com>,
	<ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	<vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 2/3] firmware: smccc: LFA: refactor, add device node
 support
Message-ID: <20251009-calculating-glorious-oriole-ceccf6@sudeepholla>
References: <20251008190907.181412-1-vvidwans@nvidia.com>
 <20251008190907.181412-3-vvidwans@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008190907.181412-3-vvidwans@nvidia.com>

On Wed, Oct 08, 2025 at 07:09:06PM +0000, Vedashree Vidwans wrote:
> - Add support for LFA device node in the kernel driver. Implement
> probe() to register LFA interrupt and threaded interrupt service
> function.
> - CPUs will be rendezvoused during activation.
> - On IRQ, driver will query FW components then triggers activation of
> capable and pending components.
> - Mutex synchronization is implemented to avoid concurrent LFA updates
> through interrupt and sysfs interfaces.
> - Refactor LFA CANCEL logic into independent lfa_cancel() function.
> - Enhance PRIME/ACTIVATION functions to touch watchdog and implement
> timeouts.
> 
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>  drivers/firmware/smccc/lfa_fw.c | 299 ++++++++++++++++++++++++++++----

I was expecting to the devicetree binding based on $subject but no.
So this patch can't be reviewed without one.

-- 
Regards,
Sudeep
