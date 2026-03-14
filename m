Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BE27A916
	for <linux-coco@lists.linux.dev>; Sat, 14 Mar 2026 20:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773521735; cv=none; b=JPX9lqYHV9oQy52A+xPekZUlhL2qvTsUbergSmZtr5vpZ1YZospH15c7f0B7n4IToKdk9HFesPvB3GU1RXUq8AvcWLE2FBEjfGZm+xreeo0NMFs8sLNWJwHHVqNyDaAWgLwN3kgHJSqSFXFz0inJ0oUXMHd8wlOZx7FYd94cBfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773521735; c=relaxed/simple;
	bh=SFHZ+WUdAAk1jmhWj0Ad6rw0XD1dHb32MLo1qxIct5U=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHscMIb4TklyTR/IlGPZaxUj+GYZIo4Jh+k6FDexD5+BClHqm3DEtlxm32oeh5Q8MrP1nRcx3RPUD8VlTJpd/jAdwVzrGwmbcHhFpWlGSvbbs32Hex5hMG66ToQq3hyyrVURz2gNi/1uJqCak3w3U2g4iWA3tyDBenUQgVWm5GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3r1R2BH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3r1R2BH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1259DC116C6;
	Sat, 14 Mar 2026 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773521735;
	bh=SFHZ+WUdAAk1jmhWj0Ad6rw0XD1dHb32MLo1qxIct5U=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=J3r1R2BHZkpyhIy2LCKMEoITcXaXEYgN0EXWWYOetyFz+MmgWamEoKQcAaz+G1VV6
	 oYnDQLmWsu7cVVSUXS7JASBVP+97StwwbT91RbvhHpj+vX5JO9Sp+8RwRSUoOYl29g
	 Ee3sqEMQE9o2A85wjgtLIwFEEsrLSbMfyz1M9D1nDo1nG9O/5xOVJ2WebV0fyOVfou
	 YZdwwEHLHI/J3Ucz0RM9JVRRT9Ma7IQipnUYx0QeHJ9qacMFeoYndtbeXVGETVIG0R
	 nRG7dVk1p7tM8lXLJrAnCxShDrv6/7AFg77fWj8msNagXZQgpgvd4/hWZMiBpUShOj
	 WtYYpct1r4ISQ==
Date: Sat, 14 Mar 2026 13:55:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Subject: Re: [PATCH] coco/guest: Remove unneeded selection of CRYPTO
Message-ID: <20260314205533.GA45660@quark>
References: <20251204055512.494013-1-ebiggers@kernel.org>
 <20260109022620.GB2790@sol>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109022620.GB2790@sol>

On Thu, Jan 08, 2026 at 06:26:22PM -0800, Eric Biggers wrote:
> On Wed, Dec 03, 2025 at 09:55:12PM -0800, Eric Biggers wrote:
> > All that's needed here is CRYPTO_HASH_INFO.  It used to be the case that
> > CRYPTO_HASH_INFO was visible only when CRYPTO, but that was fixed by
> > commit aacb37f597d0 ("lib/crypto: hash_info: Move hash_info.c into
> > lib/crypto/").  Now CRYPTO_HASH_INFO can be selected directly.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> > ---
> >  drivers/virt/coco/guest/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/virt/coco/guest/Kconfig b/drivers/virt/coco/guest/Kconfig
> > index 3d5e1d05bf34..da570dc4bd48 100644
> > --- a/drivers/virt/coco/guest/Kconfig
> > +++ b/drivers/virt/coco/guest/Kconfig
> > @@ -11,7 +11,6 @@ config TSM_REPORTS
> >  	tristate
> >  
> >  config TSM_MEASUREMENTS
> >  	select TSM_GUEST
> >  	select CRYPTO_HASH_INFO
> > -	select CRYPTO
> >  	bool
> > 
> 
> Any interest in applying this patch?

Ping.

If there continues to be no response, I'll take this patch via
libcrypto-next.

- Eric
