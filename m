Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564282;
	b=xYouybPXqMIkeV6/MWxJTAyzxO2LqnczO1bKDuh9sd2oeDXuiSJtM6WAyQvAWIHEwSLp
	 B+YWFkMpxsL/YrGRIDSstpw6BmXkAoOOdZPuD8/TwAA+HN60OvK/bKTYpJisCSkIgjRp0
	 LWsrtqnCgU2jiAkmd6oYrQlsJyLNX0Cu5KZSzMdho3Tg4QwVfQq/K1sCcoeHwQUNkDLyL
	 NF8penQ3TBjNp+qdJ2eDVAvv4UGK0ECG+CSGiPWg1q9MRaLw00QhO5ERm3i7BUI8aovnR
	 MtE4B/xtfSNg76OCbzsdjHWDSv/uGz+WTE+LWys8z+9dOPiXalhzUZWekfISfT5DsZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564282;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CcMs9tvtlwt5Bs19TD28TDiqHmuTbnMeK3Pwk1m9fcI=;
	b=VWcOpRu8KUJ0Efnc/Vx5KRlu9MFcKlN6jka9xG33rfJIsAXfbqKkMCMVSr3DBwWeSw3o
	 DgULE7pbZs0kfLo4LeydhDh7qu5TNnLRr4Tw5TGKG4tvaDRakI5uVZKK06v+i+KVGnXle
	 Exprnz2xByjM6Q4XRPRQJmC8nmz0ag+7iCW55CoNj6a5hEMJGEe8lY4MpFF1FkF69/+RZ
	 4m5H9rqc3U73zOa7glJWnPbDZjy3RHeUZgfYEL1CUSGawXPJ1vehCz00V6/L1dKeOqui0
	 UB0qp5zd27ShRso9NRfdm6CcWk7VKtR0WPuDjJfovq4IfNl+NQW0HRnfCJ1BiXZmnTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=BdZrPLVn;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1976E606A339
	for <linux-coco@lists.linux.dev>; Sun,  1 Nov 2026 20:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1976E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=BdZrPLVn
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5C99340E03BE;
	Sun,  1 Nov 2026 20:17:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Bd7ecPcu3egA; Sun,  1 Nov 2026 20:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793564269; bh=CcMs9tvtlwt5Bs19TD28TDiqHmuTbnMeK3Pwk1m9fcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BdZrPLVnCOqsebut2c7nykFo/vNmhjON4fQa50k/KbCavQnJesAcCCeyovv86jH0Z
	 6c91xRny7T8cZrM/nOsb7OJFJbpCFlj5B8DX8XbLQ5oJjm7WwEtTuY+HcRSBo9SZ+0
	 +TiXYiVUwm6ZyrCGWXAISZIx19w4dFtAGYrgjj0IhLYisQ67RXNYWLz3zAfohIVIDN
	 kdpJ90prDrv09xZpeTqFnN3k5JB7fc7p5Sl2pvahQ3ORoY0Z9jN5W6hZ7O2mHAyjAh
	 zmU+s1UUy+58aEpNvuRAdxbHn+zsuMukhvt34hgdotP5uO0sSGXBANvo+mRpXrmMc8
	 +m41JE+gKXLRoPqSEG16r9V6R5T2smfVdoP18vgO48YC1c+ngHB3iE4e6l0WpSE9Zy
	 CHHfE3wxVIpPrfaSlAMLUWRijoH6NrjVgGeqKI0odptOsvWBp9gUospPyx7+IlS6nd
	 2hdNNgScNU7TNmJzwlG7KTJRIGQsC3Gh5yZQhOoHvZ9F+gpfA24Rq3S05mdMO+AKF7
	 QoaBFOzIIgK9Jx9cEUIzXheIbNXcUVMjf3NjqBIn5NuGlsNdS5NGEWDn8qJaz73H4D
	 jL6jnXgqqUdE3En7PDXPe3PUnpQyGrcf5ytzSHIwKOh7K+Ej2/uyz3dB82z+kwrOIM
	 vt+Hq3gPyHodhUq01aAERb58=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7C7F040E0299;
	Sun,  1 Nov 2026 20:17:30 +0000 (UTC)
Date: Sun, 1 Nov 2026 12:17:27 -0800
From: Borislav Petkov <bp@alien8.de>
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Kiryl Shutsemau <kas@kernel.org>,
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
Message-ID: <20261101201727.GCaueeVySou8SsgdDY@fat_crate.local>
References: <20261031202741.GAauZPPfNDpQLSmIZD@fat_crate.local>
 <94f0ab99b5c9072ce7c026672f704b2987db427f.camel@perches.com>
 <20261031235958.GDauaA_pScrsk2xYUF@fat_crate.local>
 <5ad69a1167fddc7caf1eb73e439765116db1ce17.camel@perches.com>
 <20261101014710.GEauaaHoYk5TzRpGBQ@fat_crate.local>
 <b700f0fb96b9454287850f7aa54d876b709cadb0.camel@perches.com>
 <20261101185452.GAaueK_PzlK68DsmRz@fat_crate.local>
 <44db8c930587810e902dcb36b5a0718a52eb94fc.camel@perches.com>
 <20261101193759.GBaueVF-1a0H8BDmZ2@fat_crate.local>
 <874236faffbe90543d69361f04628fd8047ab1b8.camel@perches.com>
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
In-Reply-To: <874236faffbe90543d69361f04628fd8047ab1b8.camel@perches.com>

On Sun, Nov 01, 2026 at 11:54:42AM -0800, Joe Perches wrote:
> I do think it was already generally understood though as
> there was just one exception to the pattern match style
> in the existing more than ten thousand ^[FX]: MAINTAINER
> entries.

I leave it up to you.

As said, my only angle is having this documented as clearly as possible, even
with an example, so that people in the future do not stumble over this and
have to add debug prints to get_maintainer.pl code to figure out what exactly
happens.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
