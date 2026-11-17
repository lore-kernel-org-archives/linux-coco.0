Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945554;
	b=5iuy3an4oxCmFEo7bIfYmRi8XIACWhJRDMxY0UvdlYlTQvHb0igqEy2vjbiazgfCN/qX
	 d36BwuQuHjhRYAJud4dkwnT3hpNmCaIQYHzb9XO+1qTYIIAqnBJMj0+QwI3gVHedbKaMi
	 2EDE3UWxJHWbnlzZVJK90Z75q0nWQo0QyW72gHiHBN1mUEu78u0LJ845NtspZx9M69O2Z
	 sUjDXEqxgsPWAvwPHiaaeOsZ6L7rt2sn/gAYKlDIxxMHmoVwNbHyBtmpcNtc9l4X2d6FV
	 t6lCxhk/3lBLFrxe/Szibdd2iFE0cQHjNtNyuIS8b7UVRJYGrQU3gzs52teVZRxAK4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945554;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9EH3JL8IQJ0PmiYru6tlWPco2YdsvtZ18mnaf0uac0Q=;
	b=CptHfLSu6qmA8w9QoG//YO3GpT158zDxd34Xo2VCa8SFwjARW+qFLsxIZKwZC9vg7b3t
	 pqRCoPGeBNCkb7Akyf0LYXqGrEZOVQjn+Gq12YDG61fzZLcg5qhEqHNqlPUcSv0TjW23a
	 gw8uqsz6xG1H1pCsrSIMNy+Y2n0c8/hL/tgpU5owoQQZW9+1hB09tEce4G7X6ynUGM3K+
	 11N1qJ4YdmcNFbmzKq72KdThayiutimTonclrkC5UkWcMHl0ABC7382+3FnveC9o/GdZ8
	 NIsWud8s5KlYN9XEUayvpu/E78kUxXaRWEMrE4OZ3OCXIjeUxdj2OPen6hIpRwzeUqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=djzA0+BB;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF638606A31C
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 19:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF638606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=djzA0+BB
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 06D4440E01F4;
	Tue, 17 Nov 2026 19:59:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JIwThmmlM6VK; Tue, 17 Nov 2026 19:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794945549; bh=9EH3JL8IQJ0PmiYru6tlWPco2YdsvtZ18mnaf0uac0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djzA0+BBmBadvLFjgOeubS8kKiZhMNI++OkIcCh/ym7tXs500KNZfoDLaacpnQYrw
	 xeF9n9mUFV9eHg5I/wrhvLg9P5kF9QbdJhNs4dkoE+tLKZIpzH31ZmTMT9cMdreOa9
	 8YBM39T1FK32xe3vlZDsUS5v++ttuu0CAn9bgtgwqg5owUiECPE+jLf3bGEy7ibS5D
	 XD7tNuJY1XHYwSA+KA/xn6d82jjeK/JIwwP73N0a3a15TjYi5kFmW2owov0m8/IhWA
	 oTdqWOyVAWUiMkehbggnORFeoehuCK5OZpr8E7Wnsmosp4WqpUy4xtr4mK4Mv4a2+0
	 NlJMKhA6YQXkusdjRaX5RKOiXXHJFsW1p47lc7rMF0DyJy6coDaFdFhMc0CnrtfMVt
	 FlipLnhOoVwBtzU3EtuzPMujpwIZBESOWHMp8VUXdITvgCVXjSFSGX+ZQ7b8PP6Goo
	 FdYCtOtkm0hNPCaClK/HdVt9ZStj4prMnFEGCaQXlxWywKRExo7FCgGnWXitcn+rFM
	 SrnDa5YRLAuwH9aijHWGN/l/AAHhbvSUC7CedU0hpFCm52lppLyC5EHQDbjECk4IM3
	 kVaeJURpaajK82K6p/+MrxuVE9abEqWYQIjcPZmXD/TlrU3/JsV3+1ABj1wO+y4pBN
	 k/ER2DqfU2ESK58N63ER0XxM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7449340E00DC;
	Tue, 17 Nov 2026 19:59:03 +0000 (UTC)
Date: Tue, 17 Nov 2026 11:59:00 -0800
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Nikolay Borisov <nik.borisov@suse.com>, x86@kernel.org,
	kvm@vger.kernel.org, linux-coco@lists.linux.dev
Subject: Re: [PATCH] x86/virt/tdx: Don't print error if CPU doesn't support
 TDX
Message-ID: <20261117195900.GFavyyBNla_w1hCRlp@fat_crate.local>
References: <20261117190041.158949-1-nik.borisov@suse.com>
 <20261117190714.GAavyl4lS15Gwpc29U@fat_crate.local>
 <avytF4CYn5FUkA4F@seanjc-mac.roam.internal>
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
In-Reply-To: <avytF4CYn5FUkA4F@seanjc-mac.roam.internal>

On Tue, Nov 17, 2026 at 11:37:59AM -0800, Sean Christopherson wrote:
> FWIW, I prefer Jiri's version which just drops the printk entirely:
> 
> https://lore.kernel.org/all/27b6d824f7aee7078167944ce96d95676eee25cb.1793602266.git.jirislaby@kernel.org

Even better.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
