Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB2C1DA60F
	for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140363; cv=none; b=VLzQ6DkEjyXDVa+m59bV6zerk5EdYfDrEnexxAIi9mp1BEXJ40+RgaEpRCaH+orWjQNHQBitMvcgjbFMIYdSRipOUXhR4gIlH6sANnWa97YQAE9rEraXCiGXTx+tz+T4x/YgmX+CEnGB4yhglAPpp0cBqnSF+R3y5+d4+Ys2BMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140363; c=relaxed/simple;
	bh=J34AXjwbxjh92AIz0R9nMGkKSlmwdNVKP4SfPFoL73E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4RDLg+Nx0DFkwTp6xgQSh4gj4ZzxNueTgoOipgh89GRIQVRyAFNfTgVUTsJyHtJ47jJWzhxtrF+ySUaNc4r/bB7mNZ8F7so8dGLzSaOJRW+ypzbwD+Imd0Opn55RtYVXNRNyp6xrCkpLLXcRFaylPjqW/EmyfRJQRnJdGF+/1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B34AFEC;
	Fri, 19 Dec 2025 02:32:34 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14C353F5CA;
	Fri, 19 Dec 2025 02:32:38 -0800 (PST)
Date: Fri, 19 Dec 2025 10:32:36 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <lpieralisi@kernel.org>,
	<mark.rutland@arm.com>, <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	<vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 0/5] Arm LFA: Improvements and interrupt support
Message-ID: <20251219-visionary-hissing-sidewinder-5e95c5@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251209-miniature-curassow-of-energy-b6a303@sudeepholla>
 <8bca8c4b-52b8-4a1d-9f21-176c994a58bb@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bca8c4b-52b8-4a1d-9f21-176c994a58bb@nvidia.com>

On Fri, Dec 19, 2025 at 12:38:39AM -0800, Vedashree Vidwans wrote:
> 
> 
> On 12/9/25 03:39, Sudeep Holla wrote:
> > On Mon, Dec 08, 2025 at 10:13:10PM +0000, Vedashree Vidwans wrote:
> > > Hello,
> > > 
> > > The patches update the proposed Arm Live Firmware Activation (LFA)
> > > kernel driver [1] to incorporate review feedback [2] and refine the
> > > activation flow while remaining aligned with the LFA specification
> > > DEN0147 [3] and the SMCCC 1.2 calling convention. The series keeps
> > > the existing functionality but restructures and extends it to improve
> > > robustness, reviewability, and future extensibility.​
> > > 
> > > The SMCCC usage in the driver is updated to consistently use the
> > > SMCCC 1.2 register-based calling convention, consolidating arguments
> > > and results into a single struct to reduce stack usage and simplify
> > > the SMC interface. The patches also split the original changes into
> > > focused pieces and document the device node bindings in the commit
> > > messages, making it easier to follow and validate the implementation
> > > against the specification.​
> > > 
> > > The kernel driver is registered as a platform driver in accordence to
> > > the LFA device defined by the specification [3]. The driver now extends
> > > interface for interrupt-based enablement of LFA. During LFA, the
> > > interrupt
> > > thread refreshes firmware component details after each activation step
> > > and iterates over all activable components until no further activation
> > > is pending, matching the spec’s allowance for component detail changes
> > > after activation. This ensures that sysfs exposure of LFA components
> > > remains consistent with the authoritative information provided by the
> > > secure firmware.​
> > > 
> > > The handling of CPU rendezvous is adjusted so that the kernel now
> > > honors the rendezvous policy chosen by the firmware, instead of
> > > unconditionally forcing a rendezvous. This reflects experience with
> > > existing firmware deployments where mandatory rendezvous is not
> > > required, while still allowing the firmware to request it when
> > > needed.​
> > > 
> > > Thank you,
> > > Veda
> > > 
> > > [1] https://lore.kernel.org/lkml/20250926123145.268728-1-salman.nabi@arm.com/
> > > [2] https://lkml.org/lkml/2025/10/8/980
> > > [3] https://developer.arm.com/documentation/den0147/latest/
> > > 
> > > Vedashree Vidwans (5):
> > >    firmware: smccc: LFA: use smcc 1.2
> > >    firmware: smccc: LFA: refactor
> > >    firmware: smccc: add timeout, touch wdt
> > >    firmware: smccc: register as platform driver
> > >    firmware: smccc: lfa: refresh fw details
> > > 
> > >   drivers/firmware/smccc/Kconfig  |   3 +-
> > >   drivers/firmware/smccc/lfa_fw.c | 478 +++++++++++++++++++++++++-------
> > 
> > Same comment as before[1], looks like the feedback got ignored or missed.
> > 
> > -- 
> > Regards,
> > Sudeep
> > 
> > [1]https://lore.kernel.org/all/20251009-calculating-glorious-oriole-ceccf6@sudeepholla
> 
> Thank you for your comment.
> I did include DT binding in commit message of the patch. Please let me know
> if there's anything else I can elaborate.
> 

Sure. I meant I don't see any patch titled "dt-bindings: firmware: Add LFA...."
or something similar. I also checked the delta for the files under
Documentation/devicetree/bindings/ to rule out the possibility that the
patch title may not be following the DT binding upstreaming process.

-- 
Regards,
Sudeep
