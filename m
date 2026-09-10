Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6593806D6
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789008056; cv=none; b=eSv9LivhjsbQLSjznASemxtryu/+gl9qPgRWPPZsNTQu4k+0O4BjXqs/ohA7SBqrsT7vZhIr49xDry6Xk2yOnZ8FSMeBmU43hxiHvyPJR+AEhFo2tYdOc34hmvn4D48h/V+W6zuEF3yVX8UhB+8q20ohq5qoSgHkoes5Z7eSJ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789008056; c=relaxed/simple;
	bh=siWXtLb4Xqmxb+MLE0LPwHO76t1ByGk2lm2zULLyDaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tASrc3/9lHclgL6YHbNsCNJ06tXqWDKnXv3fKap2+lUBQKyVjsNEg2Pj9/WI0ql28xRNA8JwG8nTtMqrvMPkw/zadRvtMYzKL8znu+5asyYbUO7qVdOtKFE9AnHQbyfasmfLG4OdovrqmKVYbjGGHkt5lzahOZjejE7i75kCE28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XkUcM+h6 reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XkUcM+h6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1BF2B40E00B9;
	Thu, 10 Sep 2026 02:40:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YaY_fvoXfRlm; Thu, 10 Sep 2026 02:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789008041; bh=BpyKVZT1wDHvJHUW2EuXx8uzbo4ht0yONe1YaFsU0Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XkUcM+h6Q06RK56GTBZcG0Qi2nsmVQMYf8P0hvBSSScJP7QfPxuF0UwdmWeJMpg8i
	 grBYr6jyBJ+WHf7gKtFQ6wuVpblMFmxkaGgxpXz3wHCcy/r7ReR1TNIfEIOUgXXKoG
	 x4LA2Aqzl4sNzAvMd4NdpKTcT3TRMCcMnB7cjm9tY/EkHYhDixZS8bRexi/mUGUwoG
	 9FzL9axQnEU/EIWUJg+Te9i5Ruddtb0MOB41lEEvpF6qMrnBxzCKawvlDkE26crqNi
	 SGr6OAbpXks3W5ZMb6sBzkGs4p5eM2fv6S4jTFzlCWoTkQEE4tL63iShWal2yDq1vF
	 1WeW0Nuv0ov2tAaefIQBN5VQ4GchwA6Y8een/NdtVzWAm/ArN/QKpbLWOXLkT9F0EA
	 rC1kj+JrmzlY6FyVxlMFh84YMd0apDn6i3/PutNSmQmlSIxDz6fcc6Vvvz3uko/K88
	 SWj0dGaT4uThaPCPsLwC1ZC8EX++Y8CXch2Dg1eSWPaelxx5F2G+V9bcAnjXOs8BZq
	 YXLeWpeXcILd5fnM4KHlm7cgpm2cmAOyxjKHTOQmdcz5X6IbSUXLOqaXPEjv7yXaBg
	 awPcJ6hjXp9MzoUClC1gAnLeuaWr5a2V8MXw8AqyvT/cwk9BWBUlfZakdXB0IhFO5o
	 tIZg4AHVZQ25VjnTU7LK3BpI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7E79C40E01DD;
	Thu, 10 Sep 2026 02:40:30 +0000 (UTC)
Date: Wed, 9 Sep 2026 19:40:27 -0700
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	hpa@zytor.com, Tom Lendacky <thomas.lendacky@amd.com>,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: [PATCH 1/3] x86/coco: Add CC_ATTR_GUEST_SEV
Message-ID: <20260910024027.GEaqIYmy___31vI-iZ@fat_crate.local>
References: <20260803125827.718024-1-joro@8bytes.org>
 <20260803125827.718024-2-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803125827.718024-2-joro@8bytes.org>
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2026 at 02:58:25PM +0200, J=C3=B6rg R=C3=B6del wrote:
> From: Joerg Roedel <joerg.roedel@amd.com>
>=20
> Add a new attribute to the CC platform code to check whether the
> kernel runs in an environment using SEV memory encryption. This will
> be used to establish the an sev/ directory in SYSFS (which is
> currently SEV-SNP-only).

Yeah, the initial intention for cc_plaform_has() is to use it in arch-agn=
ostic
code and for something which you're going to use in coco code itself, you=
're
better off simply doing:

	if (sev_status & MSR_AMD64_SEV_ENABLED)

I can fix that up when applying if you prefer - it is easy enough.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
