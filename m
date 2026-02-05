Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68CD423A6D
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307700; cv=none; b=MZ0OXzP8J+yGfOJ7rGKtgw56Of4L2yUZX7iW9eRjeKW/N6nW6riwe4dS5PrR7J/VuUueWGcHtFVnuumcAag9thzc2PPhP8zLRqmyHHcScU905LTforUFZ3KfL1stkKtlc3m5l0Y8bZ+K+7xrio06Gu3TqJzppu2GfyFD8/+/V5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307700; c=relaxed/simple;
	bh=k2UXN2RrYY0M0lsve0wmEhAd/SPspaOnsUkAsfKm9fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPiz97HwRxp4KT5+IWHn+zkDaxREK1tT91h25LhUfVbiifFxFy4dB7Mq5fRGhbdM2zYFcyslrNBpZ9BFUqY4lkJ3vsmEWZ2YP+e4aCd5MtudbKpVEs8+doIY34Xv8e3gyPZ2TQnrJBFbH/2ZZd3WCoBAGGlMBn0Jk6YZDN47sws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9ZwUTyV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9ZwUTyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BB7C4CEF7;
	Thu,  5 Feb 2026 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770307699;
	bh=k2UXN2RrYY0M0lsve0wmEhAd/SPspaOnsUkAsfKm9fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9ZwUTyVTCDY0G0TF6Wt+T8gJD7LImn6yuQ845l73PyCsGn7VzV+4kihkuvHDRVuw
	 Sy9Xzu0hm/hSbDYn/2pyF12BpzoxQ9YK9BRoWINfY2LUfO0pdLSDeTV7pGrDxgUveL
	 8omb2zSVCf3D0+JaSbMhggRjKDEJIJds6zfjzvyWcj2ijt8Nw68vtVC4xZoiGZwwcO
	 LLnNl+9cJf3qjP+JI3c1sk5kuS07GfXwwRcMNT/wLKHW3lIRFgwZ3zRsORbEfUHK7i
	 xGhQ5YOOJbSCiIsNHZ3lezTX9DIdDtOWVvjEvQM7QoWM1sxbDU24D/lsbfqa0jPoax
	 TP1vJSYxNNJIA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id E571CF4006A;
	Thu,  5 Feb 2026 11:08:17 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 05 Feb 2026 11:08:18 -0500
X-ME-Sender: <xms:ccCEabF_qd9ukejDFLfNozPclDMKLpA7sFv9wzadFwQipqQMbE8fDA>
    <xme:ccCEaZFtg_qprAhdJxHHZDu0IoaXaJoUo8PBb0LugnNpzaG1HArwxujTHAzpC0FKY
    fGQZcyav180y_ilRjd2gHRTem8SwMLoNkrAbSkxz9lpx9HQvehMB8Jo>
X-ME-Received: <xmr:ccCEaWAc16sfzu2lsCIMsy71YmvzaE7oziiNDf6LYY19A4czyMLf0m3-JMKQAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehjeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:ccCEaQ_rMxxNl2QFdvUiqulUPnCA2QIQ2R9xO8rkFiNGdY-Gc6Wj0A>
    <xmx:ccCEaQfS8DW8Dz8sqv4GlNq8k8FYByKlVDO_RkJ9axW45-t3MeYDiw>
    <xmx:ccCEabAmw1v1JbyZB6OdUoAM8SrmFQ8yoRNaFPiOX5aLFZG5ymMGpg>
    <xmx:ccCEaYdT7rK8cTriOGLumYg8cm90Bcb9Xkdk2HCYWO0dx_ocGSmKaA>
    <xmx:ccCEafgPbCu2F_1n3aMOzVKaCDDe9ybq3HSvUahnwzh2RMWOk2v6z47z>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 11:08:15 -0500 (EST)
Date: Thu, 5 Feb 2026 16:08:09 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Pratik R. Sampat" <prsampat@amd.com>, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, ardb@kernel.org, 
	akpm@linux-foundation.org, osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com
Subject: Re: [PATCH v4 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
Message-ID: <aYS8O0phOE41IuEF@thinkstation>
References: <20260203174946.1198053-1-prsampat@amd.com>
 <20260203174946.1198053-2-prsampat@amd.com>
 <d07cbb96-ba30-4dcf-ad14-0479d6a989f2@kernel.org>
 <70be936e-e49d-4485-8d1e-416fdf8f40a4@amd.com>
 <aYR0vqwyFPo3EKAi@thinkstation>
 <ce4334f8-5e54-4dbf-9be0-059279ef1962@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce4334f8-5e54-4dbf-9be0-059279ef1962@kernel.org>

On Thu, Feb 05, 2026 at 04:48:13PM +0100, David Hildenbrand (Arm) wrote:
> On 2/5/26 11:48, Kiryl Shutsemau wrote:
> > On Wed, Feb 04, 2026 at 09:50:09PM -0600, Pratik R. Sampat wrote:
> > > 
> > > 
> > > On 2/4/26 2:00 PM, David Hildenbrand (arm) wrote:
> > > > 
> > > > I really hate that accepting (and un-accepting) hotplugged memory is different to accepting ordinary boot memory.
> > > > 
> > > > Is there really no way we can get a reasonable implementation where we just call a generic accept_memory() and it will know what to do?
> > > > 
> > > 
> > > Sure, that shouldn't be impossible.
> > > 
> > > The only reason I initially kept them separate is because we accept and update
> > > the bitmap unconditionally. This mainly applies to cold-plugged memory since
> > > their bitmap state after remove shouldn't matter. However, as we are now
> > > correctly setting the bits in the hot-remove path we should be fine accepting
> > > from the for_each_set_bitrange_from() logic within accept_memory(), I think.
> > > 
> > > Something like so?
> > > 
> > > diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
> > > index d11e7836200a..e56adfd382f8 100644
> > > --- a/drivers/firmware/efi/unaccepted_memory.c
> > > +++ b/drivers/firmware/efi/unaccepted_memory.c
> > > @@ -36,6 +36,7 @@ void accept_memory(phys_addr_t start, unsigned long size)
> > >          unsigned long range_start, range_end;
> > >          struct accept_range range, *entry;
> > >          phys_addr_t end = start + size;
> > > +       phys_addr_t bitmap_end;
> > >          unsigned long flags;
> > >          u64 unit_size;
> > > 
> > > @@ -44,6 +45,21 @@ void accept_memory(phys_addr_t start, unsigned long size)
> > >                  return;
> > > 
> > >          unit_size = unaccepted->unit_size;
> > > +       bitmap_end = unaccepted->phys_base + unaccepted->size * unit_size * BITS_PER_BYTE;
> > > +
> > > +       /* Memory completely beyond bitmap: hotplug memory, accept unconditionally */
> > > +       if (start >= bitmap_end) {
> > > +               arch_accept_memory(start, end);
> > > +               return;
> > > +       }
> > > +
> > > +       /* Memory partially beyond bitmap */
> > > +       if (end > bitmap_end) {
> > > +               arch_accept_memory(bitmap_end, end);
> > > +               end = bitmap_end;
> > > +       }
> > 
> > You are calling arch_accept_memory() on every memory allocation if the
> > memory is not represented in the bitmap. Hard NAK.
> 
> In which scenarios would we not have memory represented in the bitmap?
> Guests with <4 GiB? (how does kexec work?) Anything else?

We create the bitmap that covers all unaccepted memory.

What memory is unaccepted is up to BIOS. Current implementation of edk2
accepts the memory in the first 4G range of physical address space. It
means we won't have bitmap for this range (unaccepted->phys_base >= 4G).

If the whole VM is smaller than 4G we won't have the bitmap at all.

We can allocate bitmap for all possible memory. Maybe upto max_possible_pfn?
But we might not know the value in EFI stub. It costs 4k per 64GiB of
physical address space.

Ideally, we want to know on boot:

 - what memory ranges are unaccepted - we have it;
 - what memory range can be removed or added after boot - we don't have it

Then we can allocate bitmap that covers all this memory.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
