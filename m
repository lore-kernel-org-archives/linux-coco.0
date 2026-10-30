Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384590;
	b=Pea7bOpjAozibXhzqcqy6ucUy72YidvoXzGMyVMafX2hwgFPM+xJunLj/VOLMJp/+cho
	 cPnZDC6bbLa94yey80STa6p8yVQLiW4mxhPF+zqjaghpu1o/l4eUzdxFk/Gnc03nlaPw8
	 bfk5lEsKRSRB26FMoQzCf4l8W2p2osMxejYhMt2GDJHJXP3F8MncIVYUhm5Igs6f//1BU
	 b9k8ck5Yz7yvdm14kJrrmWMMO3nL5a75gKsPu0b3WoyG0T7ZAKmMzIMqAOBmzi83CzQ5X
	 shIz2TR/dLTfrvbFmsbnU8Cynx3XmuX7MTR2o+tcmJpIHopTnsWcsKpkAlTUXsuf1cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384590;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/Xvg0R25amrWBeRSgNLozzHcB9qbFo+cgJRFaRIuY8s=;
	b=35w8K+amCLM5K/DJSPigh20XLS6zyoAPvq0nUXPApWRGXp7yfyXc8Ha850AfwJFNdoIt
	 BGW0AJmBF6VgmtbX6HX6azMGpXdhc/T9M8ieoFoF8pw36NxWvCNBaE8b8Ypp7JL9p9dZ0
	 AlQ7CZzEmTGl/1mZ6lBKDM/YRYKiX8/GjROErOhkBekws+ccCrS8vzCmBSp8NEvEVcZek
	 ejx8C5ueL3gw48DYdyN1Vi6gszAsPcLSBkQcELrHi+2WENOQ0DKuaxY9p8/a2qjZd3SkE
	 R7N10tZ69xQYJPPIru43F8hglWOyJRNwc9GW6aZ5do1sn1BsEMVVmftxhjgLoKZkDlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Q06kMkXv;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E34606A320
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 18:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E34606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Q06kMkXv
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EB5F540E02B7;
	Fri, 30 Oct 2026 18:23:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3HScSIozuZQu; Fri, 30 Oct 2026 18:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793384583; bh=/Xvg0R25amrWBeRSgNLozzHcB9qbFo+cgJRFaRIuY8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q06kMkXvdpQNuBgPUoBEd6jxa4S5aHs1FyNGqdyg7Amy5j6BGcJNl7/LZkmVpYEh5
	 zZ/0jspxBpDgsL39fn1ydFRA/Q/+a7Kmf1qtGhG5NOzhcCZiivvMLEQEyAsCyBCBhd
	 UJU2ShDPDySy8LNX7D5eaDsV+DOjPWF79vRMkYPk5QSFH0Si0Yo4k5BGe1nDOPMCTG
	 GYlv6lRUaKBMNfsejSLgNhKf8c3bksFOx3A4IH7t9wqOOs/gl+KadQXg5qcM16lD6s
	 yuEiBeKN1lgAiiT2yRJkZAl4Z0VrKrPLdyJOC3lPUAFCQjQ7g2428yHun69ORlvKy7
	 mNaJ1ftqcTu1LE0Idog3jN/wwjng14W652V4Y7Ij5QzuLftcXAh5ScjZEvuMkOBuvt
	 nWwAPLKmXT2t1hWOAh8JffB5k53AUPa+T+xnda6pJ+qjDklGZ7MowDD+4En/XOCsRS
	 FvP68M39jTF/9aypl8TacTO19etLDGbz+Ln1EInsMM4nnqnntOcWdcLZcMHWEre/c2
	 a/oDCJKSs3zJyBQCn9ATmkZZZL8LWZ5PGt13uXzuK6aR06Vk+cW/Em6xygSxyH3pi4
	 OpCSO6DNIZWxZewMKjEwF2hopsYtzFu8XxpwU+iRo5LpAkmALLrAjfxA/s0RMGVs9k
	 XF2RW0rXfK1gQhB0kFX0SqRA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 438B140E016C;
	Fri, 30 Oct 2026 18:22:47 +0000 (UTC)
Date: Fri, 30 Oct 2026 11:22:44 -0700
From: Borislav Petkov <bp@alien8.de>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
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
Message-ID: <20261030182244.GBauTgdBvhDWLoloSJ@fat_crate.local>
References: <20261027055750.GBauA9XlPykc1c1Xhv@fat_crate.local>
 <TY3PR01MB113468FBD8E5EFA65C4B4E5EB86602@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <072dd88c-4ca1-4c8a-98b1-7783bc43c1c5@kernel.org>
 <TY3PR01MB11346BAE55FF22F66E86A6F8B86602@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <afdf1864-4721-4177-bc18-2a5821d97559@kernel.org>
 <20261027205411.GAauEPc4AtLwvrDfFr@fat_crate.local>
 <7b0a2e98-c614-4cdd-8604-3b5b21e8474f@kernel.org>
 <20261028154743.GCauIZH3pZm24jCX9b@fat_crate.local>
 <20261030023338.GGauQCAuYyXGwIhlqX@fat_crate.local>
 <auSrwtQgJRM09_ve@thinkstation>
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
In-Reply-To: <auSrwtQgJRM09_ve@thinkstation>

On Fri, Oct 30, 2026 at 02:40:00PM +0000, Kiryl Shutsemau wrote:
> K: matching is case-sensitive, so the TDxE prose never matched. The hit
> was tdxe_auto_clear, the field that patch adds, in the diff as well as in
> the changelog. A keyword can't tell that from TDX code, so paths only is
> the right fix.

Right you are, thanks. I'll fix it up.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
