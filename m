Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793497657;
	b=oBl2CST3H8MjFXwAYuReINUQG5gRhhTV6heTC5NMhephwdL1LrEzT6R8KRODrTdn0IKa
	 r+EBP7lbMJA9P4e+3RxvsHLZthX7BduoIJBFBZEj70TqTfj07LFKTsD0Cx6Gb5ZQenSOk
	 UP7xIuCBw1DzsHnQMPJ3mTNSquRATKiQgzcvmDJpYGkJkqFktjwKHdrUbAOSobI1xUwEo
	 XY9x4Rj55N3fdiG6/VIo250+jqmRYcDQJiB+rS7+TKeqDvs89ir32DhjiBjNFyHDf7Q9T
	 tFH6PEzPtXSd+dXFDzNhjCw3VthMJ02iCGgKqtw3eta5mOtJJyt+fYg17X6YMIKxJfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793497657;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4+bBvgSgEpcbPVnG6tEB9RqjnVmf4rED251owKlzT7s=;
	b=OdHG7lxozP46F4YZsuZAnprqcLZ9Okl1oUprEvZlxzjU9S0z+xJTQm/jv9UQ8f46cGZ8
	 35kspOtogQRyVJ7tnxwrrcsHNqQik/3h/qfVLl2dCnTdIhasgk+hY/EJHDkXkWg9iqdGZ
	 Oxu3rjVBJLPSENemA7WNORkCnM/vgdJkwSF4MKCOeNglFQ+gio/G0yueQPyFWVdLZdm8c
	 STiDbZsswWwlEOW7XJS0vVvx9ndH0J9RjDBFA2JfMniNI+5l5eB1QCTC/tRslnyXv3Nv9
	 Q1jEbgSoHoeeRAD4oDKbAMWhFpyTRiLxvuXhbUEQEgsZrsIdvpFEA8P6Udbfe3Qucuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=YdmJ0CfP;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8979606A324
	for <linux-coco@lists.linux.dev>; Sun,  1 Nov 2026 01:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8979606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=YdmJ0CfP
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A71FF40E0298;
	Sun,  1 Nov 2026 01:47:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fZAnZMHs9PfG; Sun,  1 Nov 2026 01:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793497651; bh=4+bBvgSgEpcbPVnG6tEB9RqjnVmf4rED251owKlzT7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YdmJ0CfPBfCqcGNsdj/Bg5aVbDQAvOK7x9YTa8ki8RgzSEKKKeTPijq5W7aUGw84g
	 8qddD+QVGrBWtESxBB3EIg6FwkLLpbblCmBZGfWdIimH/szyylGgK+xe9J02VYL739
	 6ixJ1q9CEIfH0sXqbFNiV7XCsLLOGVDKmvrWZQ0QmyMFpnRqd15OMPkrqVQkDfNeVu
	 VSkB8z2o1JBnl4Nt2HEc4siNM1OyQiZTzCJADxuZJ+u+GegstQ9jELHD58LmuY4BnE
	 upa6LoMLc6n1oFpOfMok4xGvmNuRhPynL6Ei+zeIDY3Qwgh53dm83sgoJLIoQpVyCa
	 g7OKz365jwHVa+Sr2dEH1Iv/xwhOSaAWa/QrcMLqRusUuzRifIUqJE19uAtJ4xKRd6
	 Lu+L7ZMrC3wN8Sh0ME+DNUxqTckznHkPqTCvpMU2z2+kxvIpqNzKFXfwAoWy+45knT
	 wgJtywPajG3PwSUGSIviwYnMGXssYiGAF/oHzsLp86qVdBji6dabf0uGZeolVNFDcx
	 8LRnIgBqWakiTt7DH81U/vXJba4MO2ccydLYH4+HrwBrVhyEGdvOtXJ9NlbsT1BL2/
	 y5PNi7uhVs6zwwleW4TGXic8OvzynHuiCg1EV93CMFjX40KO7vrowXdklqkZHxloPt
	 22bCZpZ+lWOTkZYBzzbyop4M=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BBC9740E0184;
	Sun,  1 Nov 2026 01:47:13 +0000 (UTC)
Date: Sat, 31 Oct 2026 18:47:10 -0700
From: Borislav Petkov <bp@alien8.de>
To: Joe Perches <joe@perches.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Au Dang <au.dang.jx@renesas.com>
Subject: Re: [PATCH -v2] MAINTAINERS: Fix Intel TDX kernel file patterns
Message-ID: <20261101014710.GEauaaHoYk5TzRpGBQ@fat_crate.local>
References: <20261027205411.GAauEPc4AtLwvrDfFr@fat_crate.local>
 <7b0a2e98-c614-4cdd-8604-3b5b21e8474f@kernel.org>
 <20261028154743.GCauIZH3pZm24jCX9b@fat_crate.local>
 <20261030023338.GGauQCAuYyXGwIhlqX@fat_crate.local>
 <20261031030112.GHauVZ-OI2KjdkjrcY@fat_crate.local>
 <35ba539820e1782bde038df98d3b49295eb7cd3a.camel@perches.com>
 <20261031202741.GAauZPPfNDpQLSmIZD@fat_crate.local>
 <94f0ab99b5c9072ce7c026672f704b2987db427f.camel@perches.com>
 <20261031235958.GDauaA_pScrsk2xYUF@fat_crate.local>
 <5ad69a1167fddc7caf1eb73e439765116db1ce17.camel@perches.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5ad69a1167fddc7caf1eb73e439765116db1ce17.camel@perches.com>

On Sat, Oct 31, 2026 at 05:38:46PM -0700, Joe Perches wrote:
> On Sat, 2026-10-31 at 16:59 -0700, Borislav Petkov wrote:
> > On Sat, Oct 31, 2026 at 03:52:50PM -0700, Joe Perches wrote:
> > > Please add a wildcard * at the end
> > 
> > I will, once the rationale is clear and documented so that people know what to
> > do in the future.
> 
> MAINTAINERS currently has:
> 
> 	F: *Files* and directories wildcard patterns.
> 	   A trailing slash includes all files and subdirectory files.
> 	   F:	drivers/net/	all files in and below drivers/net
> 	   F:	drivers/net/*	all files in drivers/net, but not below
> 	   F:	*/net/*		all files in "any top level directory"/net
> 	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs

	   F:  drivers/net/foo  everything under drivers/net/ which starts
	   with "foo"

?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
