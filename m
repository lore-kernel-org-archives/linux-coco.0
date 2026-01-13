Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39000346AF7
	for <linux-coco@lists.linux.dev>; Tue, 13 Jan 2026 10:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300138; cv=none; b=KL4C889kR3Ln5B9HW8truf8UIiIZetr30il/y44efPk3FDdVIYjApdr6/3dWGCgns4g2UdX1pWfoyLal4pTUYhILkI4gocwR2PBgbOsusWnETsvWo2lF8YExlo5+9amI3aFhRfZf8LUWlvClaHgRKqUmJI+XKZP3xirKGyntrRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300138; c=relaxed/simple;
	bh=N68j10Imr8Oj2TObO7c8P8UDnygSs8IugasnfTpCDZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ay3AL9l4lMiU17ItqxtPaV4WM+SGp+5c2E05ja+m2vGC3spGHoz9dumNoapFCgfhXEx5358adnNrkDNDcHdmjF1T+XErbbmh3zjjfSmQFgwJiLVtw5ql1Xmo+YYiTvhN6IvgtTrGssY6JGSDrmTrPKcyLhGed4pvcy5FltLPHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2aUrJVw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2aUrJVw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851C5C4AF09;
	Tue, 13 Jan 2026 10:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768300137;
	bh=N68j10Imr8Oj2TObO7c8P8UDnygSs8IugasnfTpCDZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2aUrJVwgXahtVnOEwCpcxQKO/9RKMSR4dsAmEzqxaz9Voia1Jsr5qTQS+pSj0OTT
	 7Qu44FzfWQ1IZ/jwI1AKjwQg/vbEUXcWrkPJ3K+E6j+eoiigZEFrG6r7Ftrzdbjjy6
	 z7DAp88TqrKe3s+kiGvxjO3Xf/ZrQie7B9nDKfuw9vJSxX1TGxUoO1Rwey+mg8f/jz
	 OKvnG5eWPZB6+MuSWWifE5vrpedZyB5hvDA1b4RQwCWQ3XvzTg5On4AvzmgAnet5W/
	 p7FN3Bp4XDUd8sUReSo9eiOizM1b8DzkFz5axgB86Vx5dL1oUmSqzBaT8cCYZinKCi
	 tw5xLZyvkuGHA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id A6D20F4006C;
	Tue, 13 Jan 2026 05:28:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 13 Jan 2026 05:28:56 -0500
X-ME-Sender: <xms:aB5maeWdtLxRpWUhslSqbEuaig6QFcNdvjduZioHMp0nUi5haG7Yaw>
    <xme:aB5maSQopPHtnJiDrpDIYflf8cmKzFjfQ3_yadwr03qgpauc_mZE9HRwdBm0U_VzD
    Ew9oUHE16nxExWE3wHhAvtqonEQu1A9nwXQdTzY9nn3BYMKDq03mGw>
X-ME-Received: <xmr:aB5maYMFxN231BNejme6KU2QB5vban3K2oK9n9I2cIwkzhXH8tzehZaEZoiqlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvddttdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfedtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehprhhsrghmphgrthesrghmugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmmh
    eskhhvrggtkhdrohhrghdprhgtphhtthhopehlihhnuhigqdgtohgtoheslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehmihhngh
    hosehrvgguhhgrthdrtghomhdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgt
    phhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:aB5maWtNABOE5heYiTbE1RhalIxva5dQv_tU5i-qNStTUyy067IEJw>
    <xmx:aB5maUSIZtxolFI3W-P3f2_vTqOhJ-BBgun7iWnQFgCbYSKik6HrxA>
    <xmx:aB5maYvXmY6f-3MY030OOGUjcBYEEX9gLaw0Y7FCkt0jsMuGPTFHXA>
    <xmx:aB5maazdvvek_kPITXbFnNJ6nUHWHS6frh2Sgu1ehszVz7oZA1A9TQ>
    <xmx:aB5maf3hytYqmQ0d0peATdxeCnV3I7-IxCpN_0t29dqCyoIA0ORAsIkT>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jan 2026 05:28:55 -0500 (EST)
Date: Tue, 13 Jan 2026 10:28:50 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: linux-mm@kvack.org, linux-coco@lists.linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, ardb@kernel.org, akpm@linux-foundation.org, david@kernel.org, 
	osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com
Subject: Re: [PATCH v2 2/2] mm/memory_hotplug: Add support to unaccept memory
 after hot-remove
Message-ID: <aWYctexPTf-w7QT8@thinkstation>
References: <20260112202300.43546-1-prsampat@amd.com>
 <20260112202300.43546-3-prsampat@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112202300.43546-3-prsampat@amd.com>

On Mon, Jan 12, 2026 at 02:23:00PM -0600, Pratik R. Sampat wrote:
> Transition memory to the shared state during a hot-remove operation so
> that it can be re-used by the hypervisor. This also applies when memory
> is intended to be hotplugged back in later, as those pages will need to
> be re-accepted after crossing the trust boundary.

Hm. What happens when we hot-remove memory that was there at the boot
and there's bitmap space for it?

Also, I'm not sure why it is needed. At least in TDX case, VMM can pull
the memory from under guest at any time without a warning. Coverting
memory to shared shouldn't make a difference as along as re-adding the
same GPA range triggers accept.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
