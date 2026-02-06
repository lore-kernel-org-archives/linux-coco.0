Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3E433A70A
	for <linux-coco@lists.linux.dev>; Fri,  6 Feb 2026 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770379428; cv=none; b=fcFpD4oCQ1Htq1q7YhxWo9tzvOeEgQ28OyfSyHVmLcJdf5tl1PEN7aI9XyjxTYnrZFsQRhh8EIZ5upg19kk2LxykbaPCzZxlUJKPbrlygWLrP8CwLTWCflYqQrFWgfFf+2mQKwOPX1v0WsqS9IHskgjwBABIRi3bCAjO/acadwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770379428; c=relaxed/simple;
	bh=uMgj70N3216PC7d5PJlZUPfJ7trqCmQKoi+TPeLlEEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcNIuCKHPGs8zc3FqNjsMKbJ7EeqNHSP3yvsGSnVogvmbIfKOyh2F5NEbCyFmDiaS1Veip83/gH7UT6VvhxzqHrzvUBmJLp4zG04jfjXOE3TJaD/cMdYIApwSxBHaRCur7CuQKAYQQjGNlG/Z43IU/VjiOr23ZcBTa2CfAft6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5xOzC7m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5xOzC7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBCFC116C6;
	Fri,  6 Feb 2026 12:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770379428;
	bh=uMgj70N3216PC7d5PJlZUPfJ7trqCmQKoi+TPeLlEEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G5xOzC7maqyE3zF8h9xz38W1B0DbQ/4VL4h7f81ggg03ALi8dY4hUXfRTG4xVp5JS
	 zAAFAWIq4P9bFkf54YoooUlreZfnjDfcYfRzZyEKypEhsN2udu10tYUz4jWHWZUpks
	 8jsnmHhIvZE+Ekv5hFcwHeit7UjYFBRRtCiu42/r+8IAwNFs+VW+xd8BBefXY8595X
	 OPqDPMJoPbEVcBaoKMEI74Fj3RMhWbPGriiDy84QTQLAGrt3ROiTI4YdFV88NtLRHi
	 DlEbDtWFazMbi4lxwPHLG0b7PLr24msjpq7EA53A4x6wjn3CxmcCC7G7wJXInLlq6J
	 9Hq55Vco8IKQg==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id C9422F40068;
	Fri,  6 Feb 2026 07:03:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 06 Feb 2026 07:03:46 -0500
X-ME-Sender: <xms:otiFaQEULD47vLfzOd_fg0E58Uo__xNLzoPHwEHRsGax1e3oTRp-hw>
    <xme:otiFaaFzHKN9407YmjK3-rMpIUflrQYprQS_a3KWLaM065Qu1GRxkPCPbDOwMO8oS
    lI9-xtOUz_jtzi7t5tSBuDabkWB1aMyMyGVYeWcOwywwbw5ujdiD6uQ>
X-ME-Received: <xmr:otiFaTARMWepb3L38GBwiin7VOSdMlU8QBqWHQ84zyqzpqtNdaWj6nvoQO-jRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeekuddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfedtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprhhsrghmphgrth
    esrghmugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgtohgtoheslhhishhtshdrlhhinhhugidruggvvhdprh
    gtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslh
    hinhhuthhrohhnihigrdguvgdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtgho
    mhdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
X-ME-Proxy: <xmx:otiFaZ8HNMMN3klfCbCKXshOKBsujGwRe1l6sKcNWOpkyEcNDSFgKg>
    <xmx:otiFaVdbZp9Tz7qLQmG4P6TDG6tLok3czcT7evMAsN3wHNPfTcov-g>
    <xmx:otiFacB97NFEo_X5WtU3UtB_XW0eZP5NVGx-t8J8bDzFSDtj3V9UKw>
    <xmx:otiFaVfFgEnrfojQBQkd31IsDKYRbhHd_vgG0mQdJzjb79vPFXqoUQ>
    <xmx:otiFaYhlxyVV5_mDe4Ex59CQpQkvQnEPkK5rjFhtC3nMHVXA802RUePi>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 07:03:44 -0500 (EST)
Date: Fri, 6 Feb 2026 12:03:39 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Pratik R. Sampat" <prsampat@amd.com>, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, ardb@kernel.org, 
	akpm@linux-foundation.org, osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com
Subject: Re: [PATCH v4 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
Message-ID: <aYXYRf4lxm_iQwjE@thinkstation>
References: <20260203174946.1198053-1-prsampat@amd.com>
 <20260203174946.1198053-2-prsampat@amd.com>
 <d07cbb96-ba30-4dcf-ad14-0479d6a989f2@kernel.org>
 <70be936e-e49d-4485-8d1e-416fdf8f40a4@amd.com>
 <aYR0vqwyFPo3EKAi@thinkstation>
 <ce4334f8-5e54-4dbf-9be0-059279ef1962@kernel.org>
 <aYS8O0phOE41IuEF@thinkstation>
 <fc60cc71-80eb-4058-8d0a-dbd19a5c10ef@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc60cc71-80eb-4058-8d0a-dbd19a5c10ef@kernel.org>

On Thu, Feb 05, 2026 at 06:29:08PM +0100, David Hildenbrand (Arm) wrote:
> > Ideally, we want to know on boot:
> > 
> >   - what memory ranges are unaccepted - we have it;
> >   - what memory range can be removed or added after boot - we don't have it
> 
> The SRAT describes memory ranges where we can see hotplug memory. Is that
> too late? We calculate max_possible_pfn based on that.

The cleanest way would be to declare the ranges in EFI memory map, not
SRAT. It should be doable.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
