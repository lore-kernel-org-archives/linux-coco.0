Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE97E1F9EDE
	for <linux-coco@lists.linux.dev>; Thu, 24 Oct 2024 17:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790532; cv=none; b=VBVvkDmKipEnw4eX9xTytv7emuhLlk2kyBN4+QEt5Yg3haK1lrvHfEPyDoP0I+BH5R2vzMifJT1ok9VeIPCN2PJxPkQbkIuj44DqgJovjSCeSPwTf1lidtCnHxqeQPnzNWlRC4bYIDywfrbQJ0zQoEM7k17c0sY8GECPK8ZGxnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790532; c=relaxed/simple;
	bh=bnRtLu29X/mZ/X5uxpZiNY8e+hzoqklwaqcoq4fqbn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMzPyOBHkBrroiMhfagBJ9GwQXXuj+RUobLm9xcLrb4cX2/OafdFz1TZXqQOSaNU/iYDf5BdTnEoQGYUGzhkO0i/P6wvie1a9KMEFuJVLbLGtAHc/rWjr5Eg3RQVKPpHClz/1KQD9OFdmohaJiYH+lxRGvz0G2KOlnUlCgsmSQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApBRnR4k; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApBRnR4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729790530; x=1761326530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bnRtLu29X/mZ/X5uxpZiNY8e+hzoqklwaqcoq4fqbn4=;
  b=ApBRnR4k3mK5bkReUe+wIi9axXwoAMnMhxebfXg3o/SxOO7gTJLG4J0k
   P0Cw6VkBebOcfuUMZAMnz2b/zFcBqs0SWS8YIQ0h2d8OVL50mGslLJe/f
   R7HNXAn93o+3o9QEosslive+jUsRNAlcmz6+NvQd5Dqh3ZK8FzeSxaFKC
   3ttmzCyzobHCOD0S+NgvsNo5yDvlBpPjeKAZIRLZULtEzmZWhFchdpnKQ
   ilQFrOR/S1oqzNg80RLcGi/ZY7guWTZwrn27zhXrWvjGpKUH8menxgy96
   ZqVY72//MUTirMz1gH/i7r5wMfG4QkQ2/PyIpRKooAfCbQkHNpVFc2Vlw
   g==;
X-CSE-ConnectionGUID: gxcE4ZQdT6aJ+qrmgZ5WsQ==
X-CSE-MsgGUID: xdLPOTaUSjq9Y+D58uWRxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40027208"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="40027208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 10:22:09 -0700
X-CSE-ConnectionGUID: wLxClO55QGi+1t+uB13+bA==
X-CSE-MsgGUID: gI4xmYpNRRaJ70rGWEUwWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80243571"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO himmelriiki) ([10.245.244.58])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 10:22:05 -0700
Date: Thu, 24 Oct 2024 20:21:56 +0300
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: "Xing, Cedric" <cedric.xing@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Samuel Ortiz <sameo@rivosinc.com>, Lukas Wunner <lukas@wunner.de>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Qinkun Bao <qinkun@google.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Subject: Re: [PATCH RFC 3/3] tsm: Add TVM Measurement Sample Code
Message-ID: <ZxqCNE-peVCmYus_@himmelriiki>
References: <20240907-tsm-rtmr-v1-0-12fc4d43d4e7@intel.com>
 <20240907-tsm-rtmr-v1-3-12fc4d43d4e7@intel.com>
 <86e6659bc8dd135491dc34bdb247caf05d8d2ad8.camel@HansenPartnership.com>
 <796ebe16-86a4-4109-9b80-91a238f975f0@intel.com>
 <529689b46df6a99a4a284192c461d16f7bfbb9f0.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <529689b46df6a99a4a284192c461d16f7bfbb9f0.camel@HansenPartnership.com>

On Sat, Sep 14, 2024 at 01:10:33PM -0400, James Bottomley wrote:
> On Sat, 2024-09-14 at 11:36 -0500, Xing, Cedric wrote:
> 
> >  Also, MRs are arch dependent and may also vary from gen to gen. I'm
> > afraid this might bring in more chaos than order.
> 
> I think I understand this. All measurement registers are simply
> equivalent to PCRs in terms of the mathematical definition of how they
> extend.  Exactly what measurements go into a PCR and how they are

Given this, would it be reasonable to go back to the digest based
input ABI idea where user space would use the TSM provider specifc
hash algo to prepare the input? The kernel eventlog for each MR (or
some notification mechanism to user space) would be provided just to
keep the digest ordering. Apps would map their inputs to that digest
list when doing attestation (in whatever format they choose).

On that note, we have the CCC kernel SIG call again Friday this week. If
we get enough people interested in this topic on the call, we could
brainstorm this a bit further.

-- Regards, Mikko
