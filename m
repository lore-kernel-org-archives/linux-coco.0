Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384470;
	b=b2tIoAS2N1tRiSWtwL9cpgJn+Q2TPRfV5I28URYbh0rvho8eMQNihjGVcNRuUTwCqn8Q
	 savQ1OCzUFrepYHjmkhyTQbp/Q+mM9VuiMlKG5SI+YK4I9vjNXxggyNR9GrGJ/HtTaVaT
	 F1vEBHHvsOvDEqmcdFrejyQWQNM/whjkmHUUGWCv8/GHrlo1pnnIkwzw5XaWrOOiy480m
	 49UthfJXcIdjgvQKNOXKJpVBhs6rlx9ZWT7hamkT3M16uLSa80zJn7dkqlfi3ZIIS9Ddq
	 79VJxkOQyLuXlR/aAMJMVqXOgBMfjtkNVwYz8gEP2smoXmX6pvF4GrHRUPul0RczIMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384470;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TA0ier9L2dOG8aDW3mq4N88jDjf82Z6ca1kvjV5M8Wg=;
	b=RirBt5x16XeZhzBVW4fSRMpzai2e28ezWp08tLtBkJynHZvVISe3TMzANk5o+iYNdCyZ
	 LvBZvLqyXHFj27dSccCwSpNyWKjqzGDg5hmsonzTwWVS1XUk5AmpA2v0tsKjDRGvxVrlN
	 OclGN623JItcPYeqBcq6Qfnvu5dlJLkvcfRZjORE+K3VjJXiSAUktEym51PIOU3C6gv1E
	 PhX9ugqlLx+776d1j9pKI0c2AyTFUIaD0nliYHWIfNj8zdEZsbDW04Xr1owAV7lmS/JRC
	 790FA5Vs0MdMQiBDwO/P4NUHMaWV1ozEosjELAy6B77YEuW+LuH2KNxnre1q+PrZctQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=aMFhnyLj;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6EE606A31C
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 18:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC6EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=aMFhnyLj
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 39FD740E03BE;
	Fri, 30 Oct 2026 18:20:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Fm28ecBqvhZs; Fri, 30 Oct 2026 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793384452; bh=TA0ier9L2dOG8aDW3mq4N88jDjf82Z6ca1kvjV5M8Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMFhnyLj00DlXpNhVKtkOikorM2JTL5YJ6k/kfvP3CA+6rZYsVJujx1lOehecSUvr
	 IsOneQJKSDKDJCdGNjvpNRqWiBXW2We6TDUqaPWG6p0ilQvHg2GRhMGvxUZkAj++eG
	 pRznLjTgM9DCtwRzJCnLJs+I0k1owmvHyEsyFwNz3HcrwA3Z9a5Ydukht+3WtFrGbr
	 R0Cfvgn30/hXGUf161V/VqN02inKtwckYNvbWLiTXapt0AN/FyL7Reke/pW+/OdR6f
	 +wAG0Yaqa07+R3BlybzGNnGk/O+rjX2+kJuCDrL9RUxks5HeuR4KDDXIwpJHuqhvIi
	 5d5KEL1LzecUii08ARp+tRm14TpiZUuZML9jIDLbqfyvo+pDCTZGkUMSlvmc4tBgV2
	 FZ9dvQlBlMgwDpqV1Tf0+sSiFQJqzn8oxC6LyRClVW6osKHedqvtOoK2nqKAFP4bcF
	 oCnSRmnGD4VnTc02f+5r+8WcTtCXvCfpj1aWeYIfZeUU9DX0PVjCKGMk20Wpe3GUSv
	 2ZkKQ3NL6g06IFW4dxJVqzgNe8gPwAPrZjGoPlcJ2GrUvYMLa1AoU2LgXkVsfix13c
	 cJn6A233z8FguWs+lq3prnd4MuLQf86tauj6JSQngpWh9QNaxwZCrg2mwuNW1TIJdt
	 RYOACRdzZtdiLD3oTUU2Nz9k=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 915CA40E016C;
	Fri, 30 Oct 2026 18:20:34 +0000 (UTC)
Date: Fri, 30 Oct 2026 11:20:31 -0700
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
Subject: Re: [PATCH] MAINTAINERS: Fix Intel TDX kernel file patterns
Message-ID: <20261030182031.GAauTf71ujnYNQPluW@fat_crate.local>
References: <20261027055750.GBauA9XlPykc1c1Xhv@fat_crate.local>
 <TY3PR01MB113468FBD8E5EFA65C4B4E5EB86602@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <072dd88c-4ca1-4c8a-98b1-7783bc43c1c5@kernel.org>
 <TY3PR01MB11346BAE55FF22F66E86A6F8B86602@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <afdf1864-4721-4177-bc18-2a5821d97559@kernel.org>
 <20261027205411.GAauEPc4AtLwvrDfFr@fat_crate.local>
 <7b0a2e98-c614-4cdd-8604-3b5b21e8474f@kernel.org>
 <20261028154743.GCauIZH3pZm24jCX9b@fat_crate.local>
 <20261030023338.GGauQCAuYyXGwIhlqX@fat_crate.local>
 <7d35e2db2da34735760a08a6f103abee075413c8.camel@perches.com>
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
In-Reply-To: <7d35e2db2da34735760a08a6f103abee075413c8.camel@perches.com>

On Fri, Oct 30, 2026 at 10:16:46AM -0700, Joe Perches wrote:
> It's probably better to use F: and not N:

The reason being?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
