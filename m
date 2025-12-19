Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78311283C9E
	for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 10:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140675; cv=none; b=hmllrv7bqJAqha65MH5g0EgJ6062P47IJ9QgahCbF2Q1L8HeKlrPcWVhDAZCCLYU6Lo/M04H/9GsEdl+iUbGLilyfLIlmBXVp1ckGRuFzZRurDPNZ3b9PcuxXeBA+Bam94P1uzWOT6Sc9ROV1FXQRzHt9eQChWjOyzEanlJCpEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140675; c=relaxed/simple;
	bh=ifjsug7VkEupSLIZNABm6msSDTMCZxgwlDsajvv4uhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUqrtUFK8XHFanhHI+EkoIFdPYf994kuEqn8Mmw3wFS4K4+pFtolRFX6dXMTObDXF5c2ekXgXtNGMDfPlQEl8VntnYjKeBJ2B5aHy/kOW2SzNdrv9PF109UfeWc1WdKkO1HN8MavflkCWFy1fX9Iz+nHBeJSBok7Zi9HXdXejA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8B24FEC;
	Fri, 19 Dec 2025 02:37:46 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7617C3F5CA;
	Fri, 19 Dec 2025 02:37:51 -0800 (PST)
Date: Fri, 19 Dec 2025 10:37:48 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <lpieralisi@kernel.org>,
	<mark.rutland@arm.com>, <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	<vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 1/5] firmware: smccc: LFA: use smcc 1.2
Message-ID: <20251219-thundering-striped-nightingale-db4ecf@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-2-vvidwans@nvidia.com>
 <20251209-curvy-walrus-of-wonder-dbb178@sudeepholla>
 <b8fdec67-584f-492e-b2a7-8c932871f459@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8fdec67-584f-492e-b2a7-8c932871f459@nvidia.com>

On Fri, Dec 19, 2025 at 12:47:52AM -0800, Vedashree Vidwans wrote:
> 
> 
> On 12/9/25 03:42, Sudeep Holla wrote:
> > On Mon, Dec 08, 2025 at 10:13:11PM +0000, Vedashree Vidwans wrote:
> > > Update driver to use SMCCC 1.2+ version as mentioned in the LFA spec.
> > > 
> > 
> > I would prefer if you work with Salman Nabi and get this incorporated
> > in the original patch by providing this as a review feedback.
> > 
> > There is no point in having this independent of the original patch as it
> > is not yet merged.
> > 
> > -- 
> > Regards,
> > Sudeep
> 
> Thank you for the suggestion.
> 
> Hi Salman,
> Could we come up with a strategy to combine the LFA driver patches? I have
> been working on this recently and I would be happy to revise all the patches
> so that we are followiing the specification from the start.
> 
> Please let me know if you think of any other approach.
> 

Ideally, you should comment directly on the original submission, outlining the
specific changes you would like to see - just as you would when reviewing a
patch. This helps document your requests clearly and allows the author to
address them and post a revised version, ensuring that all changes are
properly tracked on the mailing list.

-- 
Regards,
Sudeep
