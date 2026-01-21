Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4673A7F64
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998431; cv=none; b=b81bdApnq96E/DSlr9mS2CqlUx1onk9dpoXXynTqh1dSS7wQEemDLU/J5+BoiCqKt9ZlrVjQDrmhh56qxsdXtsO3yKTUuN2x9lavq4ikeGq3t/gJFJZcq4m6D3uZWO/fjyUg8mqx0YEM+3kPs24Xx0oclW8W1BXA1vtXLn8n8xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998431; c=relaxed/simple;
	bh=HXBDKlJ1Y2TIpsuFLP7ZFmGhYkA642JSH5fXA9DRa2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EniXdhgwhYABWjpHkZdEOVU6GwMZxRo9eTnVwTYWzgN9l9va1Pd32+GyrLlL6HZ2+/vaq9xjho79Uvn4PbggCbZLH7YjS2tT/IrUBhxT3HWTMsDrwJ3vd9zO4vz90YvO6BIPL5L5nNbS0/k60sXx7juFqjyv1sc3b+2iRE1ujUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQPJCuhS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQPJCuhS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2528BC4AF09;
	Wed, 21 Jan 2026 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768998430;
	bh=HXBDKlJ1Y2TIpsuFLP7ZFmGhYkA642JSH5fXA9DRa2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQPJCuhS2x7JjYh5FBGoxEKP8B/G9xkOtAL/Wbbx69m952gSO+ISLMRgdaL3YhT8p
	 deP+C+zWcCAHfYp6fS1Qvd/ESUfG8KJExU39BEUkRsLid1FB9cn5y0RDh+X954itWK
	 loPrbaV3EmBkiaHR2DPI3hH9JGlbxGNzXPRLdXEliGrhDpNquBIQzQfVEeeeSc37DW
	 Ck2/Mu3PUkDrWSY/xMU6WNWMARR+JlmapYU8fCWHTEdXajgcEQPLBmLnOyh9KXImD3
	 fjj0xhkukeo0uThjywa/xzqWT3Y3jsxyNR4Dmq7XIglHJIvAHYfXL5LHqsLRX2gbn0
	 lKJTsUOW/IKCA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2BF1CF40069;
	Wed, 21 Jan 2026 07:27:09 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 21 Jan 2026 07:27:09 -0500
X-ME-Sender: <xms:HcZwaQWUMfAFgeZ4aSE7nq_TLNqDGeuZlxmUij5esRHY0vzNhYUswA>
    <xme:HcZwaVWNJ9zxvIuHYxRFWxFsmybpo6Uw6YWtoCpdrJ6Yn7tNjqkvQYF7sI_ezwDOf
    pgnZi_NP5jFaisY8k8Qg3VB0zyhluUVV-dIuz108igANPCfCtZhUhU>
X-ME-Received: <xmr:HcZwadS68nNyR0hOS6BzZusDFb0Dt7qY9UkoHPFIGjioyZBEaztnuaOV74-4aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeefvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfedtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehhphgrseiihihtohhrrdgtohhmpdhrtghpthhtohepthhglhigsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthho
    pegsphesrghlihgvnhekrdguvgdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehlih
    hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepuhgsihiijhgrkhesghhmrghilhdr
    tghomhdprhgtphhtthhopehpmhhlrgguvghksehsuhhsvgdrtghomhdprhgtphhtthhope
    grkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepkhgv
    vghssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:HcZwaXOaQssHjqhbVcC-roujbIn2BOqM44JPz9x4tG_zIK64k3tZvA>
    <xmx:HcZwaZtX9VgAi4N737bHxPTMa4YDKaTXmMuYc1rEpw3FV3b0y6_s5w>
    <xmx:HcZwabT-ItHwQ4qz11NRyAoTxasrqdRDdvcWHSKajCJ5sY_wu4lWrA>
    <xmx:HcZwaTvlgGQ67PnUcm82QFazaH45N09tIq4WaHrrcP9yj9aJ06D_uw>
    <xmx:HcZwaZzRq9-w4eiq36a3LcB6iRkAllVN5ug2WbneyujP-8vpb0LhGpZG>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 07:27:07 -0500 (EST)
Date: Wed, 21 Jan 2026 12:27:01 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	x86@kernel.org
Subject: Re: [PATCH v1 01/14] x86/realmode: remove I/O port paravirtualization
Message-ID: <aXDF-TzkcansvuiC@thinkstation>
References: <20260119192923.651588-1-hpa@zytor.com>
 <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-2-hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120195407.1163051-2-hpa@zytor.com>

On Tue, Jan 20, 2026 at 11:53:53AM -0800, H. Peter Anvin wrote:
> In commit:
> 
> eb4ea1ae8f45 x86/boot: Port I/O: Allow to hook up alternative helpers
> 
> ... paravirtualization hooks were added to (some!) of the port I/O
> functions. However, they were only ever used in the 32/64-bit
> "compressed" directory, and never made any sense in the real-mode
> code, which is notoriously size sensitive.
> 
> Without these hooks, <asm/shared/io.h> is usable directly, so mode
> io.h into the compressed/ directory and replace "io.h" with
> <asm/shared/io.h> for the actual real-mode code.
> 
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>

Acked-by: Kiryl Shutsemau <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
