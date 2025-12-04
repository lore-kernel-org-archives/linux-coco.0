Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7256127E1C5
	for <linux-coco@lists.linux.dev>; Thu,  4 Dec 2025 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860256; cv=none; b=oGqf/9cFmcMZkjR7HuXeEI4GdM+CF4ER1oUxHT7K+wObFQLISPSR9XvjafFZgVUJE/eDOALtlsPdAdVJhjVEo1hyTsLTqSq5uPLs5qL0Gn3WQkKeALfrQ//K3tGiNQ5+kdEKpvIzOTLWA7oIpZudJt49FZwemLk6oHv9loA/HVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860256; c=relaxed/simple;
	bh=qQHC48v2/nQUhM3b5foBAbRHE2w+Hu94dfDKhRwlq38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OygqRkP3hatPwGbdnLDstcFz/lFB9hEthyhdWoW0pruV/p0MxqcHosnEhHrYSbsH5+Fj8ozw5svYuFIJJB910OW7MPylADKkjxohIDcWrsXeFRg0/OoAwVY2TIOF/KM1Nt0dD0SK9m2PAeHukeFaiNFe6RnqXqq0hExAMrj4/ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VWSD23Y+; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VWSD23Y+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7994140E01A5;
	Thu,  4 Dec 2025 14:57:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id r0_f5swPa32S; Thu,  4 Dec 2025 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1764860247; bh=8sL20oYzsBJkHeXxX9jCYnku1VCRA/cRcaR7iXTwLaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWSD23Y+9YKUMGokQecCnrgiEBG37ydhqImazcrSWW9GTQkL9N9w4mrifM3JPTKtj
	 Mqq3CDTYY7GJ0ghqPISKY6CSMtVAa+PCf6VrBGWU9AoS7w8cI5gZ2y0FLX943MFgM2
	 Gk+LTh6YFnDdAi4rV9pWdwtSh8HxxnxP9It3L+ppJ5bqOwJN/0RyQgsafujjuKwckU
	 6rx1GNa452S4nZUjVpDUDkMHpSwPmOyrCW/ISbUf2Z84KKNqAaakGJ/1CcZ6qaJ91I
	 BojXLIJmkbr9yCWTydfQEYq2zfJvu6pF/SqPxTMlCqUY/sdlOoAv7LKDrumwREwJb1
	 5sD0WaobAl9dDp0MVsgz4TYET28WyqSjyafe3Gt2F1uXKhr/U82qJA2P3HknnVwbK4
	 6TrksjfYalWDesvEoGVtrAyZtkncNw6yGEf8Z673b1ZglX9PvhEnF2uQ5fr9WT3V7j
	 YveyrrPUXf2wdRY+Sy3/9KI2QN1tqfCZ+p1XkcovCK5VLcdHhOl5NSXeBuJG537bkH
	 V9QHB77xY+3Z2aXBQ9eAKCX61WUVZkn5vp0TQL38UGwaL1gmtdWdMJb72Z90whmLLj
	 /OsKzbnnY+u++h42WcfHtVVvUOiamhoKP4L4IMtEGZhZ1LbX7p2f7FbspNjQKIbM8A
	 LLrQwvo/xT8XGpsejwO080GM=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id ABE2140E0200;
	Thu,  4 Dec 2025 14:57:22 +0000 (UTC)
Date: Thu, 4 Dec 2025 15:57:16 +0100
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Borislav Petkov <bp@kernel.org>, linux-coco@lists.linux.dev,
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] x86/sev: Move the internal header
Message-ID: <20251204145716.GDaTGhTEHNOtSdTkEe@fat_crate.local>
References: <20251204124809.31783-1-bp@kernel.org>
 <20251204124809.31783-2-bp@kernel.org>
 <740dd1aa-a1b8-46d5-8b9a-ce03bed50dc0@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <740dd1aa-a1b8-46d5-8b9a-ce03bed50dc0@amd.com>

On Thu, Dec 04, 2025 at 08:18:42AM -0600, Tom Lendacky wrote:
> > +#include "../coco/sev/internal.h"
> 
> Shouldn't this be "../../coco/sev/internal.h" ?
> 
> What is strange is that it works with either.

Pure luck :-\

gcc cmdline is:

gcc -Wp,-MMD,arch/x86/boot/startup/.sev-startup.o.d -nostdinc
-I./arch/x86/include...

so the include path becomes:

# 1 "./arch/x86/include/../coco/sev/internal.h" 1

which is

$ readlink -f  arch/x86/include/../coco/sev/internal.h 
/mnt/kernel/kernel/linux/arch/x86/coco/sev/internal.h

And /mnt/kernel is my kernel-sources-containing SSD :-)

In any case, good catch!

I'll do the "../../" so that it is perfectly clear and future
potential include directives changes do not break this.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
