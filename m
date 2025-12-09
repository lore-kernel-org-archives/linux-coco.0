Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53132E0402
	for <linux-coco@lists.linux.dev>; Tue,  9 Dec 2025 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765280388; cv=none; b=F7w3t2/bFCy16IF7ambf9PhtCUfU+kuZrpPc4gehRwZDYuaI78MHYJGls9J8akgiQkbSHOVPmxNhCaBAX2t7Sbc0yJO6t8cg7SxWnLBNGa+0EAT44ls1EieJ6xxoy7Ek/SRjB9gNzo3qi7vCuPuSd9c+aufQcM/WsDMVRp/puok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765280388; c=relaxed/simple;
	bh=1KxgbayMMEqBznhk73xULfcxnfzjyfMydAu8lm5xH28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enS+HD08z4DzsQbEFLtACGKBF5a5AJxCmdQCwcqgPqbMKDC210Aiwc6UkQ3MUGG+hMeidux69F0h4A9LmF+EE94iz82k42idZrq+VGhB85h9OZra7YdS0BrJfhVLasJLmXqAGcV9a2HmtrT0YggnHgmf8j9zROJEM9+uRZTyPwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBAEB1691;
	Tue,  9 Dec 2025 03:39:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A37723F762;
	Tue,  9 Dec 2025 03:39:43 -0800 (PST)
Date: Tue, 9 Dec 2025 11:39:40 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>, <ardb@kernel.org>,
	<chao.gao@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 0/5] Arm LFA: Improvements and interrupt support
Message-ID: <20251209-miniature-curassow-of-energy-b6a303@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208221319.1524888-1-vvidwans@nvidia.com>

On Mon, Dec 08, 2025 at 10:13:10PM +0000, Vedashree Vidwans wrote:
> Hello,
> 
> The patches update the proposed Arm Live Firmware Activation (LFA)
> kernel driver [1] to incorporate review feedback [2] and refine the
> activation flow while remaining aligned with the LFA specification
> DEN0147 [3] and the SMCCC 1.2 calling convention. The series keeps
> the existing functionality but restructures and extends it to improve
> robustness, reviewability, and future extensibility.​
> 
> The SMCCC usage in the driver is updated to consistently use the
> SMCCC 1.2 register-based calling convention, consolidating arguments
> and results into a single struct to reduce stack usage and simplify
> the SMC interface. The patches also split the original changes into
> focused pieces and document the device node bindings in the commit
> messages, making it easier to follow and validate the implementation
> against the specification.​
> 
> The kernel driver is registered as a platform driver in accordence to
> the LFA device defined by the specification [3]. The driver now extends
> interface for interrupt-based enablement of LFA. During LFA, the
> interrupt
> thread refreshes firmware component details after each activation step
> and iterates over all activable components until no further activation
> is pending, matching the spec’s allowance for component detail changes
> after activation. This ensures that sysfs exposure of LFA components
> remains consistent with the authoritative information provided by the
> secure firmware.​
> 
> The handling of CPU rendezvous is adjusted so that the kernel now
> honors the rendezvous policy chosen by the firmware, instead of
> unconditionally forcing a rendezvous. This reflects experience with
> existing firmware deployments where mandatory rendezvous is not
> required, while still allowing the firmware to request it when
> needed.​
> 
> Thank you,
> Veda
> 
> [1] https://lore.kernel.org/lkml/20250926123145.268728-1-salman.nabi@arm.com/
> [2] https://lkml.org/lkml/2025/10/8/980
> [3] https://developer.arm.com/documentation/den0147/latest/
> 
> Vedashree Vidwans (5):
>   firmware: smccc: LFA: use smcc 1.2
>   firmware: smccc: LFA: refactor
>   firmware: smccc: add timeout, touch wdt
>   firmware: smccc: register as platform driver
>   firmware: smccc: lfa: refresh fw details
> 
>  drivers/firmware/smccc/Kconfig  |   3 +-
>  drivers/firmware/smccc/lfa_fw.c | 478 +++++++++++++++++++++++++-------

Same comment as before[1], looks like the feedback got ignored or missed.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20251009-calculating-glorious-oriole-ceccf6@sudeepholla
