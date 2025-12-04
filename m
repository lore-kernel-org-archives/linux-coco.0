Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F282D0C7F
	for <linux-coco@lists.linux.dev>; Thu,  4 Dec 2025 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860784; cv=none; b=POa8culNVFBa73zqwejo307ur9CorYtCqFZAgbEGo1BIVG81HQN3AOf9y5f20+6HGdHAEYjfrsRo/FJeJPA5Oh4IoRR4TzLE/ymXCPbxQdv4XLrbB+ckM2YQ7e/3XDFis6STNzMq/KiN+xRi664Bv2ghnAbdAcycXDq7wFwF0Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860784; c=relaxed/simple;
	bh=UT+yhYjGbdwSBaBUdw6hnKRxGNylCfOkuAgzj2FuEFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2BcZ2mwQnXq6PuRM9vn0VztDSmzuS9C2AqOQ47TMjQg/dwLCY9OXpl0/NDhcqTKKUqtQyPHq8JpTFmPxYgBUiLehIzk1oWuaKuQ8pzNS6vqxACXG7S6SpeHknS6bohOUW4u6R3yq7iNknJaN1QfjT2dzqaT/ty5LcZ3NPHCAPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=k9ks0GYW; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="k9ks0GYW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6199A40E00DA;
	Thu,  4 Dec 2025 15:06:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nv4pQTgHpSOe; Thu,  4 Dec 2025 15:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1764860775; bh=b6xPM1f3yNi5M8Zv4gHWo8Rxd01R1lPRMwGDOx5wSG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9ks0GYWAka2F0kU2c8aqbe5rSdhrHTcBLOL4DqqDrBi5zuEGbJ5hjrUEmuETSm58
	 jSdNjh7jSQXirqcpixhJeRMYDwP0mgc4C7aVEESPo03Iq9P/WCzPrgtcnuoVwi9r2c
	 MLl0puyCsBGH0r67DhZGLxI4jl82TKtVCtBE+ImYce6NZbuzeF2QIBi+0h1jC045T6
	 XFOHA6ftdab98KR6Ko+UTEiTw8Ldmy4fbBh5tYSeEdsE+hLINkIg0Dkshrnmi/7Kfv
	 X2lYMMN313qaGlgv6YSZ97igYCaRXv0wusDHVT5+5X9sAjODTxa9T5qMqnEmLKgWo9
	 rgiryHo8Mhx1ft2j6fqe7hmW+cGjMwsGIOhptVnK4NaqM1YMOqljPDF3VTtpR8N/EG
	 sH1uneBAJCP2xA9qAOpsPRkr0MbmjH/uFo6bfVZgiUC0xRd761cw34iswunArMRllh
	 0RqUbxJU6WopdMkaQCzHzYOYB6FkcA/NZZ9TjOCavaDyCWtYbPDNm54Mat1F/+Bs40
	 IqPOViTTMLwwXubJSC4rAJ1RW3SRvIowNjHA8USft+68pmZS+qXNN7yNjH1pEfTX6o
	 DqTQ2zOLH7pOba8LsYajFJsL9eAWSp10fHonFmSlBBF3zh7oqGWtjSaVfGoq2L2M/J
	 oeCERhstL4FOSuDqnPcPrgVk=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6E17840E00DE;
	Thu,  4 Dec 2025 15:06:10 +0000 (UTC)
Date: Thu, 4 Dec 2025 16:06:09 +0100
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Borislav Petkov <bp@kernel.org>, linux-coco@lists.linux.dev,
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] x86/sev: Carve out the SVSM support code
Message-ID: <20251204150609.GEaTGjYbx6JsXmz-ip@fat_crate.local>
References: <20251204124809.31783-1-bp@kernel.org>
 <e4571015-5b76-426f-9e12-0181df9ab1f7@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e4571015-5b76-426f-9e12-0181df9ab1f7@amd.com>

On Thu, Dec 04, 2025 at 08:53:01AM -0600, Tom Lendacky wrote:
> Quick testing doesn't show any issues.
> 
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

Much appreciated, thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
