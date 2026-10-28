Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202489;
	b=5LvkLVE7abjwv8fU3/BBi/7vZ3ZUlkaMwipitFpqM77ZJAJzw+DhSm173h8Q/alPwm5F
	 xCxMtcULbmynzWsxbE4NxqcuFCSN48R3NWrb90i+2njQS6R/B4nR2ABDxZ87DAP21+YTA
	 IeH5v1LxGAzxha2ZKnUsgLwxttIVG3JVODJSlBF3DqMU59TC4mzOBqVc4S//hmsUeRcAP
	 3VB65OlKiRrr9jKLb3gIW39jLW+n/TQUPHbzJRUe0Gh7u3hZE22B+BGZvqGLR0Ja37cZm
	 RfhEf/IB2Is8V0OhXLZimJE4OmrKyD+2uI86/R9pWAbvB3ErSAL429qXuTXPTyBXBtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202489;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aaltjzKFEfEbF1rtU/0c4Nk1nD9Pu78rG2FlShgdIU0=;
	b=Kh78Gf8G1EGYgN2HvELdgvNTyG+M8eH1sRVIK+dty41CvdCO15Wo9c2XQ36CmWypXSDI
	 CbblZvloRFY0Bo0BwzhC1TBiXckNAp0CsmBi8EWIwbet9Rg6mdSO+T5DKuVIOp5jrq0bI
	 zojAy3lqEL5D82nweQ2h4m+OYOVx7TiHq+FAQqrXB/cURUEnf/qpcDvWhFEDAUGTqtPMH
	 SaPu0UcraiHTQG6fnllADG5/lKmkQgtedf7iLc+NNo/l6OLErlQlXAMGhPHgFY/lOFfF+
	 oVRB4nUVejEfWvyHOa/zXhH3CqLzLKD0z68e2/F2ulL/KUXptqXpJvl5W4dtUBl7EzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=CuHPcbbn;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6142606A31C
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 15:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6142606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=CuHPcbbn
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6210940E04D4;
	Wed, 28 Oct 2026 15:48:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZfiF1Mnx24IK; Wed, 28 Oct 2026 15:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793202483; bh=aaltjzKFEfEbF1rtU/0c4Nk1nD9Pu78rG2FlShgdIU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CuHPcbbnpjiItXwHuESNRo8VmbkEMiUNvEVKMBtMPyZL8v7e91hHWRRrh/sin0IGo
	 K9JnMwvttRqYhH470uv2H7pTbjMJ3bhjlejvuBRGBjzs69yd5WoTSErQQMpB0GrHJW
	 ZclMJykhAn7m9OXDHs8Nosh9SfoSN31FgQdr5WNa7zmGjWfevbYFwIAQny0cZ1zUGx
	 a+b4kdnlHpQdWsuby+0xM/+3VNpHzKj6TKztClSXU6ijqGP66hRtWPKqx7hfEjCfHA
	 hD48Kd87I5qrXbQo99MYplZKd9FWBGyLd4JTpO2Ebi0BaziVvie5ERpZxZUff6IBCP
	 KIlWUiS3fOWAMVjK4yoTbwdZJMXgHPbnw4QMtlCOvNd05kygHiaODyyBTR+8iDvM98
	 9fCudyf1abm4rmxRxkrblVn7ssy9uk2VQmn8j3a9+7DsG1GYNnt10yRoKvIruiChSf
	 2AqD2GECfPxk7WE39GpRUdUv7g1Gal3OyrRchEb4bIC+Xh3m+Pc7EqtCzVlAGUYYDX
	 hDzIwFWF77ujV8ZNMautfh7Ki14TztpQEtwjsFekVn0UtpgcMcRtwrNzwfkrt24mCW
	 maoBr4kPiWKyg43rxRHNdMSlTIp1WP/N0nSZAgrqzFp8TQhDq8S4uWG/T8O94cMwRY
	 A133YqKy3LXueBQBpBaEzhc4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 984EF40E016C;
	Wed, 28 Oct 2026 15:47:46 +0000 (UTC)
Date: Wed, 28 Oct 2026 08:47:43 -0700
From: Borislav Petkov <bp@alien8.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: Re: [PATCH v3 0/4] Fix transmit handling on SCI/RSCI ports
Message-ID: <20261028154743.GCauIZH3pZm24jCX9b@fat_crate.local>
References: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
 <20261027055750.GBauA9XlPykc1c1Xhv@fat_crate.local>
 <TY3PR01MB113468FBD8E5EFA65C4B4E5EB86602@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <072dd88c-4ca1-4c8a-98b1-7783bc43c1c5@kernel.org>
 <TY3PR01MB11346BAE55FF22F66E86A6F8B86602@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <afdf1864-4721-4177-bc18-2a5821d97559@kernel.org>
 <20261027205411.GAauEPc4AtLwvrDfFr@fat_crate.local>
 <7b0a2e98-c614-4cdd-8604-3b5b21e8474f@kernel.org>
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
In-Reply-To: <7b0a2e98-c614-4cdd-8604-3b5b21e8474f@kernel.org>

On Wed, Oct 28, 2026 at 12:02:22PM +0100, Krzysztof Kozlowski wrote:
> Someone from x86/tdx folks added such pattern, so it is not a
> contributors fault, that pattern hit.

No one's disputing that - I was trying to explain why I'm complaining. And
that is, the avalance of mails I am buried under and that I don't want to get
more, especially if they are unrelated.

So relax, please, we're fixing this.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
