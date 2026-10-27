Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080703;
	b=b0FbMzZtcuST/laH5Ceq9tP6I7GWjp0rKW9ELF0ekbSVCYqsBYJbk+3ydUBeFpib+6RP
	 glcm1C5hGa/vqU+HSzyEu9GY0/3oJmG4WQYxvnYffngeUKrCObcx4UCp7yDhJJR0Kz4cP
	 HgqEisNzgx3pSpb4xWEd7w3diIYFKGkt3oNDcIi0uFXo2UQd+x6UiQO/QhFoWDblHvUEl
	 O9fXHoMfm610wGi66WowcEBoAF0GC+FRA6sE2HRFzHN8oCTjRNQzpDe4ZG6lAP0GBrU3L
	 DzyTr/EadALmgeB3cjb3IYV3G4kwXsuKoI7IaOi4p4bBsxR1JohDIljuHMCTryGdQag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080703;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U6GE1LrLOCs5b3m6xLmSmwKe0aSHdCa9uF8nqQ/v9LY=;
	b=qN2PUiRbf81hUeSUkmCh1pR0EcmovNN9tX9+t/v0OS4lJrmrvpSxYU6OnS1nLL+ns/Y3
	 qcXf8oxn519i/ygJWsSD3M9RS3/q//qKx/QBoaSnxtq9Us9wFen2pLAq9oz+SM+OM7DW7
	 CWptNmwklbZOfPubJrnpGi+d0MEjXwSMkvmxG35UXIcWY0c24sdsIUgINPFPCoSUZSzn6
	 hY0fi1tY1ex2qqhhAQL4+lIOP3CQM3I09IiMpS20/pjg05nIWq2Q8y0N012kz2rJZtVKf
	 swvNVU1Q1nGQVfoI/mFrJ9Icrb4/Pp5vyFGZO1UxAZ0pZGmIfqt8dh8A+fBX+Tp00eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=k8Fa0uXR;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F8606A31A
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 05:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=k8Fa0uXR
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 704F540E029C;
	Tue, 27 Oct 2026 05:58:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dnewe4J-05mh; Tue, 27 Oct 2026 05:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793080688; bh=U6GE1LrLOCs5b3m6xLmSmwKe0aSHdCa9uF8nqQ/v9LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k8Fa0uXRq3nhY8JsoX4ytOOAV79yrsJgwQrxOsSMH5SJj1N3PJEWxUoKPzKGE40Ck
	 H5aetr7EGyQw/Rr7IfWw18HB2AQbdRoDlLCqZpse9lhVVRlW/EtVPuwReRQSaXkFYa
	 VjZRXByjQNqMIHLLf3KF88moIKsIUMX4F1zqAJeciTOR36+ZkVbiwVYiyFwYY4l9UA
	 3X7ICl0N6vmEvMk2mhhf8i8tRTZPQp0RObf0pC7JhDXiTpiBYEx9TJVUFRoU4ya+W5
	 42E3+sXbYBs0haLQ508za1nIyTkvYFs1HT4DWkt9QEPoHvh8yHYDXk2qRpc4YdBxKK
	 W4T4ohunLd8CXltthNnWVuoJjXnE5WCDs9EUrwcTzXiFAc3A7K/4kakFZtWL7DVZxJ
	 KMEK3rZ/WqCXNNRdxRD45Sh/9xcedK8vPPGqQEiu6IacBCmTYuemZxk/X9rkZeYBD5
	 1N6XAuwESUITP7g2kEf/z/nO8Haw2/88yp+3s8qiZ7vvWLC9DBw2tpvzPr2QdW236T
	 XcbqDzhQSJebMrnz4ybNzeZudYngtQNj0eztbDQ1WoPepAtLxq5vD4N742SWd4EmMS
	 iJW5prAIfnGLBdX3DR31Esntmn3EB+AHnpeiC1K2gbde5rNR68uD+vCu+UtDonzPJz
	 ZcyF2Le85vTi5LCvgBRG97tU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D7CAA40E0298;
	Tue, 27 Oct 2026 05:57:53 +0000 (UTC)
Date: Mon, 26 Oct 2026 22:57:50 -0700
From: Borislav Petkov <bp@alien8.de>
To: Biju Das <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, x86@kernel.org,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Au Dang <au.dang.jx@renesas.com>
Subject: Re: [PATCH v3 0/4] Fix transmit handling on SCI/RSCI ports
Message-ID: <20261027055750.GBauA9XlPykc1c1Xhv@fat_crate.local>
References: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
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
In-Reply-To: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>

On Mon, Oct 26, 2026 at 11:23:32AM +0000, Biju Das wrote:
>  drivers/tty/serial/rsci.c          |  4 ++-
>  drivers/tty/serial/sh-sci-common.h |  4 +++
>  drivers/tty/serial/sh-sci.c        | 71 ++++++++++++++++++++++++++------------
>  3 files changed, 56 insertions(+), 23 deletions(-)

$ ./scripts/get_maintainer.pl --no-rolestats -f drivers/tty/serial/rsci.c  drivers/tty/serial/sh-sci-common.h  drivers/tty/serial/sh-sci.c
Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Jiri Slaby <jirislaby@kernel.org>
Biju Das <biju.das.jz@bp.renesas.com>
Geert Uytterhoeven <geert+renesas@glider.be>
Hugo Villeneuve <hvilleneuve@dimonoff.com>
Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Frank Li <Frank.Li@nxp.com>
linux-kernel@vger.kernel.org
linux-serial@vger.kernel.org

So why is

x86@kernel.org, linux-coco@lists.linux.dev

in your Cc: list?

What can those people do about Renesas-something-serial driver?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
