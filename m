Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53FD3AFD1E;
	Mon, 10 Aug 2026 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357489; cv=none; b=KPCKronySrgXuWr+6HoSPkr7uG48NJsB5flTdqXt0vmrWIuULrnqnN8kGdhH78G+gg73lXFsclGjGTLfoYWtUvr+7vz5bZLRwMWil1lAx13FVFo7lFD2WTmInymZue61Aa7nKdHBKhjSBvmDEHqWLarSLZ1r8R/5ljBs0vEzaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357489; c=relaxed/simple;
	bh=bneS2MJY5en1XEnvDFxa1d3x8igWxDWzwYgNM6XvMsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ib4TLFIjhsGYM40Wskf+nJzwZDLSj+XkCF9thAQER7mkTST5DmaPMlHwuqG6duX9MGdK1/+mVRaXJ1g29yhEUad/2ZHAPFGxmRBFn+4rHtyFupEfhUMnTNaWlMuCqPh3+nm7mXHyJ5dmJSd5shEjRFoQQWMevdSzWodG3yMyl0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLtTk0Cf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLtTk0Cf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE3F1F00A3A;
	Mon, 10 Aug 2026 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357487;
	bh=QO2Ev8YLzg13BRqdk5yRT8KPxiqC1zHZFeTk1LNCdF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PLtTk0Cfh6D8YQALwyYjF/H80rQE8ujJkzfn5lrQUhlV95MEwjd+K7Gxb1k2/SgjG
	 9npDiu8Na/le4Hclc0lJ3jVSa0pTYi9WCKVtSVDKdgxTdrIH5pr3gxeJvsPnU2A7sl
	 ns8wRevt4hq0OPAFdmSgNtkyk09L//YG/XM9VqjugsqEI+Kd3HeHwmad8SihPZh9Bq
	 PItIDsM48bf5cyqxeBL3FRBf6WxSHrgV/sURQIXj9X86d2h8HnsWx0HInO0jerOyPI
	 LnUK9dQa4cNAbzHuh3G7p51y2JJcjsO4r7WMxTKYxlA9FpZ84uEcmEQlIpKHdByU5b
	 BUISB4Ix0Dbgw==
Date: Mon, 10 Aug 2026 11:24:42 +0100
From: Will Deacon <will@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
Message-ID: <anmm6nF6GN-vSRn2@willie-the-truck>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <anMHs65s6Mk-ZRdT@arm.com>
 <yq5awlu43gg6.fsf@kernel.org>
 <yq5ase4miaib.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ase4miaib.fsf@kernel.org>

On Mon, Aug 10, 2026 at 03:05:08PM +0530, Aneesh Kumar K.V wrote:
> Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
> 
> > Catalin Marinas <catalin.marinas@arm.com> writes:
> >
> >> On Wed, Aug 05, 2026 at 12:02:48PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >>> Changes from v8:
> >>> https://lore.kernel.org/all/20260707081351.1680209-1-aneesh.kumar@kernel.org
> >>> * Rebase onto the arm64 for-next/core branch.
> >>
> >> Was there a dependency on anything in for-next/core? We normally apply
> >> series on their own branch on top of the vanilla kernel (e.g. 7.2-rc3)
> >> and merge everything together in for-next/core. We (and many other
> >> maintainers) strongly prefer series posted on top of an -rc kernel
> >> (typically -rc1 to -rc3) unless there's a dependency on a different
> >> branch. Never based on -next or -next like branches (which is what
> >> for-next/core is, as the name implies).
> >>
> >
> > The reason is that these two patches create conflicts. Since this series
> > involves file movement, resolving those conflicts was not
> > straightforward. Therefore, I rebased the series on top of both of the
> > following commits:
> >
> > commit 24f55f511b9e ("virt: arm-cca-guest: use migrate_disable() for attestation token requests")
> > commit e62decaf98e7 ("arm64/coco: Add pKVM as a CC platform")
> >
> 
> Any chance of getting this picked up for the next merge window?

No, we're at -rc7 and you sent this half-way through -rc6. Regression
fixes only at this point, I'm afraid.

Will
