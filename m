Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920912C846
	for <linux-coco@lists.linux.dev>; Tue, 24 Oct 2023 22:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZBqScZl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1698185032;
	bh=88vKDjjA+xov6FJePy9Vq8oZHz11PGRQYYK9MwqxtOQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZBqScZl4Slh4rYtEWQkGGols39v9q19UxFwrcFPZSETZutfizjx3QEgrn2eKYsXq8
	 PvKTxd7Sm/IbVRduQco9bV5seiaRuBKprL4Sj5aikIDztQn9t4cBPFiGVGRfDGridW
	 xRjUooeoh1ARjmX40yxrDUuHduF62qnmAfRyF4YHClbzCro+45XxaqQDERgL0j9u19
	 Pelj6r5wmglh7kpYIzNbEF1mSDkG/TLWQzvkViYV5mdQJt8vEs0ICLHuSfFy2p4f3u
	 obZR2R3PVuReKbDw+7NvF1gur5PH9rF332Jpy0W5YF1AsPBH+yaeHc4WUByuzEqPZ6
	 I/q7kh40l30dw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFR0R26Ntz4wcg;
	Wed, 25 Oct 2023 09:03:51 +1100 (AEDT)
Date: Wed, 25 Oct 2023 09:03:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: <linux-coco@lists.linux.dev>, Kuppuswamy Sathyanarayanan
 <sathyanarayanan.kuppuswamy@linux.intel.com>, Erdem Aktas
 <erdemaktas@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, Peter
 Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, Dionna Amalie
 Glaze <dionnaglaze@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Samuel Ortiz <sameo@rivosinc.com>, <dave.hansen@linux.intel.com>,
 <x86@kernel.org>
Subject: Re: Add 'tsm-next' to linux-next
Message-ID: <20231025090349.53de9760@canb.auug.org.au>
In-Reply-To: <65381c093d0a3_1894294af@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <65381c093d0a3_1894294af@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gys_SAwKL1akCW+el=TA.SP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gys_SAwKL1akCW+el=TA.SP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Tue, 24 Oct 2023 12:33:29 -0700 Dan Williams <dan.j.williams@intel.com> =
wrote:
>
> Please add 'tsm-next' to linux-next:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux tsm-next
>=20
> This branch contains work to unify the "attestation report" flow of
> confidential computing (for both AMD and Intel platforms with hopefully
> more in the future) behind a common ABI.
>=20
> As this is a new proposal for confidential computing infrastructure
> (outside of arch/x86/), there is not an established owner for
> drivers/virt/coco/ common code. So, Stephen please add this branch for
> now, and folks on Cc please holler if you would prefer to take the
> patches through another tree.
>=20
> This merges cleanly with current tip/master as of this morning, and the
> arch/x86 touches are limited to supporting the tdx-guest driver.

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

--Sig_/gys_SAwKL1akCW+el=TA.SP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmU4P0YACgkQAVBC80lX
0Gw2AAf/dXkYx0amnmWhKuvaFL9ffcIvWQIT7Ro8aLhe9mCNsHls7VTcc4LRMn1V
+QeVmefpdgKzD5W1+W045zHDAdVwAh4dG3sZBdbLLEV67r3DIjRUH4ZxaT5+Oe8t
uFy+ixv/ueNG0RU9bPhoVqwTPbIf/BLlunmdfstoRe53r03imiAJ6WvfImb+g+zR
seNF+klus26RukdIVl/K/olg28kKnlzlxuWtrzLYLctEG1U6ojcB6sIWyPiJrEBM
Gqn3O6E9rodHVAN06xejt4ZqJZK/zzfechskN4HhdjVW3ICGrEOt87U+HKtJLhRn
ksUXhUOfpwERbKg+UEUBdK+ZF/5h4A==
=059+
-----END PGP SIGNATURE-----

--Sig_/gys_SAwKL1akCW+el=TA.SP--
