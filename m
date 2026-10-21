Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792554587;
	b=d+siaNDt40rcLZ9nl0Lk4pLwBAGYQahKNElvRAP89GBQsOv5K/awU9A6DyXVmeFl2ujF
	 mUzV8p22b8UIC/PsbtbY/Chtb19f7PbRBprK4XxzndoGS/GbwyGGNq4Wsl2ybHfuDTs0r
	 7yhc1HS9nvBUPXA+XdS7jryFdMiYmZP86vQ26umSifoAwm233rDgmrFaC5YBy8Rbae23K
	 jVlWuxZWdybUUS4a/9JaYTYOvi720C/H9tVmfMdzFuKv6uUw1WoAFbV3FJLnSuFvFR37M
	 kbXYMU8/UWxq9NIVyqQ6IIXLcVr9dx8Oo04PvExDRJBHAxC0QSzu1LvaxtGyS3XMvDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554587;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7ZO6RiPoMjpbwMXLA/Za1vrQjckBTV1ToQGoviGWntE=;
	b=Nwf6oMTCtof+rWSv7arlfGs65cd1Q5A6riRZnI0CHTzRb4NPq22Ff/qUGQ+9Y2scPlhu
	 ZofZorwSRzE1tyEIEPRO8Y8/Kzf2M4koWtKvy2gFGtfCRLRpl06d6yeSgi/SmNbxNmHOz
	 6gRFNsmfZlvj9mA4VPzq0T9bb9ptrjx5bWVTNM/5SL0jNmUtW2zfdUZSL5dG6ju+j3hvY
	 BvqPJP2Iu4x5Ag7oJVzw77YqxQPVl9MLD8Qe4L1Bh778cd/DJONlQCtpPqEw8gWp+InEr
	 R8/3ut84TCPAbxFdikYV3/0bUh5HrT/pzMavxXOptwzeF2dXeYtYlkkE/6ZLAxvGOVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=A5Aeze1F;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8119606A31C
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 03:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8119606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=A5Aeze1F
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2956640E016C;
	Wed, 21 Oct 2026 03:49:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id E9jvOzJ95JSz; Wed, 21 Oct 2026 03:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792554573; bh=7ZO6RiPoMjpbwMXLA/Za1vrQjckBTV1ToQGoviGWntE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5Aeze1FXpjemJIWHfCFBAatHUm8aqJK7BPsDXn6CuRYbx7EubCjv0g4vZODbizrd
	 0KS2FKhbE/2sA+TzcJLcy9iJPO7GwRvHHSENJdt+kdgeh8OB+9gU6P4PgUgoD1XWgb
	 xXfI0yOpLs9pM0Hk0Zh+lWcVwtqu6g2mwooR000Jtu8mYJ5nKtycJ4WwAKd9S1K7n2
	 ICsrbL6c2mPQLEDgx6LHeJjSB1sElG9KU3O6R9CuLgaj3DC8Rxjg6UIs65kQgG2cgU
	 tUP10JT5oY/BapLvZ0nJpNSNFGFOgyAiglsRcgTH19zkAoeM5IlNPj87/ToVsADMyn
	 ZW2Ja3rOzY06aCuEp7aTHWXWADxFrjpg5353oOnZ/YIVn+ZOT0tMIEcX3pS6Y1pzcq
	 Ooq6L1kuAPRFSDmH9PAaez6SxsIdXWFugHSYHPxIjQ8SdIxh1mZMS1ZMWpFRpMzYZH
	 nMB5bWOhHeuWteInXNkBZIE9P69JeJa8tu4/ZRMxoGiAlarrID86kW+0uMQgaEu5xF
	 u6pDAD4LUbeLn27wHWfAlnGgd9XHjFslle7LV/77KiM1wWvZ3oZZIsu4F9MqieW/xK
	 6Zj83eKnofXUEu5LQDT5zcGfnIpN0YnAYtU3xQqbeVyp5NaNM91ZJbrIeHxRAsjdT4
	 H7my4PqNlwHA6//fYcIxfMoM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DAEA040E01D2;
	Wed, 21 Oct 2026 03:49:16 +0000 (UTC)
Date: Tue, 20 Oct 2026 20:49:13 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org,
	peterz@infradead.org, ardb@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, arnd@arndb.de, thomas.lendacky@amd.com,
	shivankg@amd.com, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v2] x86/sev: Apply the RMP table e820 fixups before
 memblock is populated
Message-ID: <20261021034913.GBatg2OToG0uQD7FvZ@fat_crate.local>
References: <20261020202818.368416-1-Ashish.Kalra@amd.com>
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
In-Reply-To: <20261020202818.368416-1-Ashish.Kalra@amd.com>

On Tue, Oct 20, 2026 at 08:28:18PM +0000, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> When the start and/or end of the RMP table is not 2MB aligned,

When is that the case? Why aren't they? Why doesn't firmware align them?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
