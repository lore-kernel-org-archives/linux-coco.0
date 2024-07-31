Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40FF1A3BD5
	for <linux-coco@lists.linux.dev>; Wed, 31 Jul 2024 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722441127; cv=none; b=mQ5f7037gdpmx77VRrCGkdfppbkUTyjKKl4hz5F0Ch9ddIFPvw2TYXp0Eae1pjOkxX7lz5My3vrAQaKRK2YOsVAMktXCIz/wGu1xTg+NmnhLLaY4xzNfuA7eIv9YZgT9XvzKbvWYxcZg7T5cPHtD8vA1DI4isbhmtjfYHUqcZc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722441127; c=relaxed/simple;
	bh=KCfpEQp3Fm377I4mLWpB3ggzaQ0C55CfTxjhAOpt3dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXJ6C/pIfDkMLsLmHgtDpp/8JjgkTQZyLTg/kVbL9OrxKxL7DqhRJBnyHvn9T9NQEUEhUVNdQRN0TrR3462rRJcB0icXnE1iAV1aFRj77Kt17SY0Nh/sdEiMgsdUhO4iJ0yXBddB7rtqYkDfPXGzMS5TC4gX4ZblfALFgs6GMMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FoddpZmi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FoddpZmi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18E5C116B1;
	Wed, 31 Jul 2024 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722441126;
	bh=KCfpEQp3Fm377I4mLWpB3ggzaQ0C55CfTxjhAOpt3dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FoddpZmi6dMF54h85wejmdCYGTQ0nIXm9uRS3a8LpUyBgswc1GS7XCQzSljJ3GHJv
	 5H23OPiQqMJ3qzQU2RKxKEtdwuD4eWJRBl5MYccPKhSurgW1ZYZya5LUVnLezqbqVe
	 gg1dC1P2Dy3TfZIDdQd1lBP88LPbXQJgIHlyxz/5n/ZplrcdhtvmrwXgHFeN1ef9RA
	 SJzp9PjS+ODBrgT0YAkv87FAsZbniDTq1BTK+SUymRoael/1tfO6L3QJ0CegGyzfTR
	 2gKBsYyA4fFz/MdiR2BdO9msG/KNiqy08KND8RZY/HXIIn1QweM0jDO8T/4nVT18mn
	 +Xc+2SlrF8l4g==
Date: Wed, 31 Jul 2024 16:52:01 +0100
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
Subject: Re: [PATCH 0/6] Support for running as a pKVM protected guest
Message-ID: <20240731155200.GB3296@willie-the-truck>
References: <20240730151113.1497-1-will@kernel.org>
 <7bbe63b9-339f-4a67-bde6-1a5f01da36a4@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bbe63b9-339f-4a67-bde6-1a5f01da36a4@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jul 31, 2024 at 02:55:13PM +0100, Suzuki K Poulose wrote:
> On 30/07/2024 16:11, Will Deacon wrote:
> > Since the patches for running as a CCA guest were posted already at [1],
> > I figured it was worth posting the equivalent pKVM changes needed to run
> > as a protected guest under an Android host kernel. In particular, I've
> > tried to structure the code so that the CCA patches can use the same
> > hooks. I'd welcome feedback from the CCA developers (i.e. Steven and
> > Suzuki) as to whether this is sufficient.
> 
> Thanks for the patches ! The hooks for set_memory_*crypted() and the
> ioremap_prot() looks fitting for the CCA support. We will cherry pick
> those and base our next version on it. On a side note, this doesn't
> solve the "fixmap" for earlycon. Hopefully, we can push something
> based on this in the coming weeks.

See my reply to Aneesh about 'earlycon' (and why we don't care for pKVM).
Hopefully the rest of the stuff is helpful, though.

Will
