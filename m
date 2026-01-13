Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343472512C8;
	Tue, 13 Jan 2026 17:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326824; cv=none; b=KUeGS1RC3+oo5D6PqXMrmVZOVM35nEtydA0ZuI46lKwFBJpGtQZ5dnNPUHRf/Ud/5D4r1XqCD6jgzQUw3QkyL+4D2S39JuMkDdZJH/ZxkbUE9foMB1D78fRHR3XDrRnGetcq4CPkcvDGAYgKgWQ+uGlzZPwcnz6HjVwj48HkUpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326824; c=relaxed/simple;
	bh=TZLi4ME24WYwqZOOdhzNI1VhxAjc2a4f/YofFPJkMlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeQ0otGmtTw7hR/oXKKwQ9oxUYbW3ZudvDWCNlukmmkL6NxQgZZD+eFnoMMQ7vWQ8Fk9jjuFALpGvYrHPNPj8NYdbV52SMF34BmQQbGIGETnXrPjHoe8uAC1OrEQKjkCuf/H8DqhUIMQ9hC3cw02VI7YDoXBqmzMD4PbmAazJ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGolsI8a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGolsI8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFF7C19424;
	Tue, 13 Jan 2026 17:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768326823;
	bh=TZLi4ME24WYwqZOOdhzNI1VhxAjc2a4f/YofFPJkMlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kGolsI8aU1zq1ShpfCjLTWdGuLpt1HxmoVBIKfRAxxB2YLWJpSfxxE2ZBN0+vDv9U
	 j7YFFXPvYsloOyCFZ9hXXQpSTlBn+hlkNJUB+hqbXwvMv+EQLBm/FtfHOaL0V6AvB5
	 05Pgaq83FyGmVF5tdQFOr02MdH92hNjKaDWSw9gBp0F307EYWyKOFdpSZWAXqGfONg
	 7RqYgo7vsnqSytUvR+rODXKr4ETiQCDDzh8v6kkdxMt6jN5nfips+3D1PphAWxdOoF
	 QBuRfa2/uP0hQ9f6eZhEHzoK3SYyJoZp7iU21/H0JFy9OWR4TZJr4d5WRCSYKOmD2I
	 3nJYH60QNuxwg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9B5F7F4006B;
	Tue, 13 Jan 2026 12:53:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 13 Jan 2026 12:53:42 -0500
X-ME-Sender: <xms:poZmadtyFWLt0MZUPIvzVRlgczQ8z1IuOjmQJJ9DjgbmuvQWoggZbw>
    <xme:poZmaXOyqRXhm9-TP_9AyGsoVTtCxiE7fU0hpuhS7gEWARlJynEo0TtpMkqvUNbSO
    59lqmXUVjhCs8X1h8HtCMDrkrhytWWbXt3tEiN1izOB1nrFFCr1_Q>
X-ME-Received: <xmr:poZmaZp8XRmADqNhsj3LlVtbio9seb7-WBw2Mw7qNODLgWgef1dI0ExsqiZZSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvddtleejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:poZmacH_Vno9g_4DneJbjrrhcY7wmFrveme8nP0QYnu3oeBNC5txrA>
    <xmx:poZmadGNkD-Sa_E0mQp72F1Atg_UTVTfOLKPSKr26qonBY--6XPpVA>
    <xmx:poZmabKXtUEXMWeS1wQcjM4fvOhNaDdV5yGyCRpyaHQ8Yu6l-DlcMg>
    <xmx:poZmaWE9iFZfvP78fmKUwg4x36GSOUmPMhtrWD4uWvUkIPetpgSiQA>
    <xmx:poZmacp9Br2Ifd3R7tHXQae5hqWuqQoQySbOo-stogIZ2vOGVxhlvd4s>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jan 2026 12:53:40 -0500 (EST)
Date: Tue, 13 Jan 2026 17:53:35 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: linux-mm@kvack.org, linux-coco@lists.linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, ardb@kernel.org, akpm@linux-foundation.org, david@kernel.org, 
	osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com
Subject: Re: [PATCH v2 2/2] mm/memory_hotplug: Add support to unaccept memory
 after hot-remove
Message-ID: <aWaGBandNCLT93Tm@thinkstation>
References: <20260112202300.43546-1-prsampat@amd.com>
 <20260112202300.43546-3-prsampat@amd.com>
 <aWYctexPTf-w7QT8@thinkstation>
 <af3bf2ef-0231-4e75-9a80-c2bd3a7e1bf1@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3bf2ef-0231-4e75-9a80-c2bd3a7e1bf1@amd.com>

On Tue, Jan 13, 2026 at 11:10:21AM -0600, Pratik R. Sampat wrote:
> 
> 
> On 1/13/2026 4:28 AM, Kiryl Shutsemau wrote:
> > On Mon, Jan 12, 2026 at 02:23:00PM -0600, Pratik R. Sampat wrote:
> > > Transition memory to the shared state during a hot-remove operation so
> > > that it can be re-used by the hypervisor. This also applies when memory
> > > is intended to be hotplugged back in later, as those pages will need to
> > > be re-accepted after crossing the trust boundary.
> > 
> > Hm. What happens when we hot-remove memory that was there at the boot
> > and there's bitmap space for it?
> > 
> 
> While hotplug ranges gotten from SRAT don't seem to overlap with the
> conventional ranges in the unaccepted table, EFI_MEMORY_HOT_PLUGGABLE
> attribute could indicate boot time memory that could be hot-removed. I
> could potentially unset the bitmap first, if the bit exists and then
> unaccept.
> 
> Similarly, I could also check if the bitmap is large enough to set the
> bit before I call arch_accept_memory() (This may not really be needed
> though).
> 
> > Also, I'm not sure why it is needed. At least in TDX case, VMM can pull
> > the memory from under guest at any time without a warning. Coverting
> > memory to shared shouldn't make a difference as along as re-adding the
> > same GPA range triggers accept.
> > 
> 
> That makes sense. The only scenario where we could run into trouble on
> SNP platforms is when we redo a qemu device_add after a device_del
> without first removing the memory object entirely since same-state
> transitions result in guest termination.
> 
> This means we must always follow a device_del with an object_del on
> removal. Otherwise, the onus would then be on the VMM to transition
> the memory back to shared before re-adding it to the guest.

This seems to be one-of-many possible ways of VMM to get guest terminated.
DoS is not in something confidential computing aims to prevent.

> However, if this flow is not a concern to begin with then I could
> probably just drop this patch?

Yes, please.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
