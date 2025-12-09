Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4AA2E0406
	for <linux-coco@lists.linux.dev>; Tue,  9 Dec 2025 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765280543; cv=none; b=eufPWMcH2qZ5OEoL+7h87SNN6Ufo8Xc+m95pfPKazXoxlKoGokJHNczNyZkN8bakOzGzReoJxayt3WeXeywRYx1C50lkroNaGawAbFQu1zwJ+mU6yFONmoQRcVf14nGK7R3bl/h6qP9vncLouoUypjoQZeAt8Cz4uQNIA5tO8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765280543; c=relaxed/simple;
	bh=IZefoNLqlNZMQPAjkbRurFNqzqH4OZVI4mD/rWpaiQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaCF9M7JMio1cSnp6y0v7gz4n84p/AoElUsTs3CjMtdcmXwdn6yYsnWJGkFeM6YvvO19otjBGHyOrF8FGEKF0QXt8Musvuq0n9tybhpbqxTUr/e1vlMKM1ZbWJtmIiYFxkPiP4A2+XKW2TzBbIiI6TQKBLUX98qcdgcix9Z/2ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FFB01691;
	Tue,  9 Dec 2025 03:42:14 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58A813F762;
	Tue,  9 Dec 2025 03:42:19 -0800 (PST)
Date: Tue, 9 Dec 2025 11:42:16 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>, <ardb@kernel.org>,
	<chao.gao@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 1/5] firmware: smccc: LFA: use smcc 1.2
Message-ID: <20251209-curvy-walrus-of-wonder-dbb178@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-2-vvidwans@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208221319.1524888-2-vvidwans@nvidia.com>

On Mon, Dec 08, 2025 at 10:13:11PM +0000, Vedashree Vidwans wrote:
> Update driver to use SMCCC 1.2+ version as mentioned in the LFA spec.
> 

I would prefer if you work with Salman Nabi and get this incorporated
in the original patch by providing this as a review feedback.

There is no point in having this independent of the original patch as it
is not yet merged.

-- 
Regards,
Sudeep
