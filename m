Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C81C5F08
	for <linux-coco@lists.linux.dev>; Sun, 27 Apr 2025 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745790877; cv=none; b=bHfpHpYGb7ahlGoH9mtWs3299KQaAEZZNsfME8kSxN8xUB0KOYEHGpqbcBba6Hc4cP9gUdxfyLoHI7BprwJFD9ngN1PIErHIHzrXxcP2/sMR9bKU+oL18qz5SwVkiSRsOVNsvvlc3o/8xoJC16gZZHMT6UUQaDkXqkiiCcxcIeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745790877; c=relaxed/simple;
	bh=gq3kUgbQ+zxNTIEcoa1zb/FYXjyuduTzY3e45duD2ys=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mq+PZqYQ+EKJ8dUaAndJix8QVOS+WMPbWtf002VvOow2yqPr35RyJ536qwubMHEUm0LfyEg/EDeEzBLvWmA++2JHpRishZWztzf9vwzOaIVVlDv7Eb9G6M+XrdPAlPFU63UmY2238yRICVXsTqUzZUKPkh2uMlze9v/VjFfIbkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BRJIA+f+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BRJIA+f+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745790872;
	bh=YuVneS3DdK+hR48IbenYUj3KHcJJk0K8tUXPdPtZ7JI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BRJIA+f+GzPdtLoXG96PYvl+kXPuhmmX+WUNtW5f35mVR6ZxBxG77D9YKASwbR/LN
	 Y0O3rnog+hwBG813N0Q4PVr4XM3Wg/rEq36Zzucx1gh1hhwxJ561N0zmo/RIp2hfqa
	 SCvgPIKLkyhDWM8/CAmHuA5DiTBQK5slPp2PMri9ubGmsh363b2w205K8bZt6Lt+it
	 zRWhVVggX4o2i8ZUhJ0fkvMNfQZLivhjX2/e0RihCtt4JzJaFmu+o7VPQG20HvSnYc
	 SNQHVF157lLLeZMl3ZRX6m+fgmJfqKkhS+PLLzzFalZYqzuwmSMPHVHmty49B6iQax
	 2Uy8azGoUq3Dw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm0jK6jWcz4wcr;
	Mon, 28 Apr 2025 07:54:29 +1000 (AEST)
Date: Mon, 28 Apr 2025 07:54:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: <linux-coco@lists.linux.dev>,
 <sathyanarayanan.kuppuswamy@linux.intel.com>, <yilun.xu@intel.com>,
 <sameo@rivosinc.com>, <aik@amd.com>, <suzuki.poulose@arm.com>,
 <steven.price@arm.com>, <lukas@wunner.de>
Subject: Re: Add devsec/tsm.git 'next' and 'fixes' branches to linux-next
Message-ID: <20250428075428.442f537e@canb.auug.org.au>
In-Reply-To: <680b17b66af1f_1d52294a0@dwillia2-xfh.jf.intel.com.notmuch>
References: <680b17b66af1f_1d52294a0@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HEL+yLiLwG.dW9LODORtsPo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HEL+yLiLwG.dW9LODORtsPo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu, 24 Apr 2025 22:03:50 -0700 Dan Williams <dan.j.williams@intel.com> =
wrote:
>
> Please add:
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git next
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git fixes
>=20
> ...to linux-next.
>=20
> This repository contains cross-vendor confidential computing content for
> platform "TSM" (TEE Security Manager) functionality. This includes fixes
> and ongoing development for the configfs-tsm-report facility, RTMR
> support, and PCI Device Security (PCIe TDISP).
>=20
> These branches merge cleanly with today's linux-next and pass an x86
> allmodconfig build.=20
>=20
> The names on Cc: are suitable to add as contacts for issues with these
> branches. The bulk of the impact of this tree touches drivers/virt/coco/.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/HEL+yLiLwG.dW9LODORtsPo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgOp5UACgkQAVBC80lX
0Gyy5gf+JsAR0SmwzyvC+fevC9eYHW9u5lRyl0fDUS7nAPAmSjWNzEplKdr744wr
t8U4inakdZSog8olJhOQg7Ft2qNla/oZ+cbJbhdUAMkBmz6d+Fue4h+SASVNRXZw
2HHInsiap4fNNZgSpUiRR2Exl/42I/Zu2SF1xjuIY3M6KmkLC53GebDcOI6UBiLZ
Vj4KhLGg0L3XeRx1dGSJVPwV56xLyOaMuFXY7FbE2hW8YggB1AEtJfCTX5/GYnvb
2sm2x6JHLxLW4bJa1er3H4dOW+hhhwXzYwE2iNCprDh5yPmiCodMvx2iSLBycqog
3FMBbyFCzlKuZdkWPNTQyBJJr+n10Q==
=CuDd
-----END PGP SIGNATURE-----

--Sig_/HEL+yLiLwG.dW9LODORtsPo--
