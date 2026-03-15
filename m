Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C5C31E832
	for <linux-coco@lists.linux.dev>; Sun, 15 Mar 2026 17:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773594939; cv=none; b=Zl3srvZiJKyQh4GIa7ewweASVo/zRYyPzxolu011CInI+Czuot6CB54SjIm9Yy0jhkFNmXSMRUg854BW8XdM7Es1g4uypia65+Z5FRPK5ZvUUJcAfQGiVEGiAzpMfT9vid8wLf+trajX+rlKlN2RXotjsGtXV10V+Awv+X0H1rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773594939; c=relaxed/simple;
	bh=/PXDmNvTQe04nzBnvn9IcHu4JSu1uHuCD182LPPLpRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVlDUe/qMj2/RqySlqf2JmbJTPH1PmSR1h6R0yHHEvv0zC9S+pauU8Myaf5XsEFxsJA2BsAgJGgftOYraKtjh/XbgFFq+b5yiI/0GSDYDLknWFGGn6MK3T6fODKiq2RjbIqbqTit5jc8D7bsl5wsTXINnWCEtAzs5LtfXewqj3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byA7M9aD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byA7M9aD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D06C4CEF7;
	Sun, 15 Mar 2026 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773594939;
	bh=/PXDmNvTQe04nzBnvn9IcHu4JSu1uHuCD182LPPLpRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=byA7M9aDCyI/H5DYBIjy6zxAFGx6o5mNkWUMDaBBaKeRKdmg8qM04we0loTtK7isL
	 o7D3FlGLILwEDQ7m5XikNsHqKhXypubcwyV1dPmbQZw9hFtqWe1nNl4WcKQu9R4RwJ
	 rGaEktsNIn0JXI7Hvvg0PmwMRP2DT7Keesf5XGxpe7CYkBDBauhgnPiYU3suJRnsto
	 NCzbbt1e05uLPxVlNevEVijCtD7qQq8824xyrPJ3AzGLCZ/zNzHpWQLhiwmm/SnxHS
	 uozDRvxQn1q2TkqQN+o/Hb1ao/Pdb0ALZsF3i35OI4JZuB4xT13QIt7P1XRR9tyPCO
	 PV3p/9Z8iN7Ow==
Date: Sun, 15 Mar 2026 10:15:37 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev
Subject: Re: [PATCH] coco/guest: Remove unneeded selection of CRYPTO
Message-ID: <20260315171537.GB23968@quark>
References: <20251204055512.494013-1-ebiggers@kernel.org>
 <20260109022620.GB2790@sol>
 <20260314205533.GA45660@quark>
 <69b5db52e0aac_b2b6100b8@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b5db52e0aac_b2b6100b8@dwillia2-mobl4.notmuch>

On Sat, Mar 14, 2026 at 03:04:02PM -0700, Dan Williams wrote:
> Eric Biggers wrote:
> > On Thu, Jan 08, 2026 at 06:26:22PM -0800, Eric Biggers wrote:
> > > On Wed, Dec 03, 2025 at 09:55:12PM -0800, Eric Biggers wrote:
> > > > All that's needed here is CRYPTO_HASH_INFO.  It used to be the case that
> > > > CRYPTO_HASH_INFO was visible only when CRYPTO, but that was fixed by
> > > > commit aacb37f597d0 ("lib/crypto: hash_info: Move hash_info.c into
> > > > lib/crypto/").  Now CRYPTO_HASH_INFO can be selected directly.
> > > > 
> > > > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> > > > ---
> > > >  drivers/virt/coco/guest/Kconfig | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/virt/coco/guest/Kconfig b/drivers/virt/coco/guest/Kconfig
> > > > index 3d5e1d05bf34..da570dc4bd48 100644
> > > > --- a/drivers/virt/coco/guest/Kconfig
> > > > +++ b/drivers/virt/coco/guest/Kconfig
> > > > @@ -11,7 +11,6 @@ config TSM_REPORTS
> > > >  	tristate
> > > >  
> > > >  config TSM_MEASUREMENTS
> > > >  	select TSM_GUEST
> > > >  	select CRYPTO_HASH_INFO
> > > > -	select CRYPTO
> > > >  	bool
> > > > 
> > > 
> > > Any interest in applying this patch?
> > 
> > Ping.
> > 
> > If there continues to be no response, I'll take this patch via
> > libcrypto-next.
> 
> Apologies, not sure how I missed this.
> 
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> 
> ...and yes, fine for this to go through libcrypto-next.

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric
