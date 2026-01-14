Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F84E39446D;
	Wed, 14 Jan 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387649; cv=none; b=C4t9sZDkX8RrnlcGErrgdwDFU+4dKpJniW+ETuZjk0z+El1w5s/TA4NpGBhGy0Cvp8yeAwgDhaXnYSgiBK5Q8HYpfZn37i0PTwyh1O1mEMVSNOGkyFNe1JBXYdSUWFVGEk8pSXtdwz7gIUhczKPCoJNijzdtjc2aS7CEbCDOliU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387649; c=relaxed/simple;
	bh=/pFm9EHouOniP7p5BFrqarS7UC8OMmNdqTIArQonxJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bE066akA5L7X6QINTc/i+XZ3kdCXchSInZEAp70rznzMEZDvP1HsEdUAEeLDwHVKpP3y5NnvsdzZ/v1KO9jgduqs0UIhU464ElJu/J3Zo2g4hO4/4uLKM6fzDRDGc2V50dQ9vJefxl+Qgcr6/MEC/MCgUmC63lGoTWQn67D4NiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEd9Pv9Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEd9Pv9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4C5C16AAE;
	Wed, 14 Jan 2026 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768387647;
	bh=/pFm9EHouOniP7p5BFrqarS7UC8OMmNdqTIArQonxJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEd9Pv9Qam7Yp+Q9FfI8Kmb71PM/4QnwQgzKAkkSvq20j4Kw424Hx0GcGs6oFLlbG
	 N6vAwxHV76qN7K2++Fds/RK5+fDDZtZ9OKc9VFajjy2PcyK+plQs80CPtQoXPDMWT1
	 0cWbl4faZm5giwD9cl6t46nV5nRSZ3QpWI+VreXYAhk9aPP5MFWkyoqTtd04QSz9kD
	 CZIAaBuKAIbPFTKEVkxOnxpiBHLd9Hd1olUz1MD1ywxbWTDJ03nKU87uWsata9vfKV
	 CRD6DxjMRpPCI5phuACZjYNSTyD03W8IbLjm2ppCnZkzTQ+iMxcO8Cta5f0VUzrbyh
	 T8037c4Mr5r6Q==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8FED8F40068;
	Wed, 14 Jan 2026 05:47:25 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 14 Jan 2026 05:47:25 -0500
X-ME-Sender: <xms:PXRnaV8QlCUoaNsDjsb_x1rhhPNUl3qjWjhGS4-ebEN7BNtBWvh6eQ>
    <xme:PXRnaadbx8H6fGsbzyKAf-V7JszsqF5BJHBP3r7Fp_q99Mzs3ZYPrw5Qm6C-sbPg9
    s-fPQoQtZh2OhRnUk1z6dThhJptk6Zco36ZuI-isDKimlef0iurEA>
X-ME-Received: <xmr:PXRnab4_8xsnnnZCK-0FE3DQPOzYcmyqcPE1lCWMrZQ97xy-DzM80N9heXy7kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvddvleejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:PXRnaRVunT5ucghZofY3xU31yQ4VjFZJ6ZUvGhW6HC9TWZsha-uq_g>
    <xmx:PXRnaZX_HKb0pbzTkZENrbXKzptOEvu052-pH9DkvrDwY3GsxkApUg>
    <xmx:PXRnaSYgaPIjvMj4fopNQstyKYVZVxJF4P2AXg-mdNHKm4_sb9O7xg>
    <xmx:PXRnacWOFFwmA5_GsOt_RkY6Aq87_aw-UKdHGHqmjuSVBlSK_UGMjg>
    <xmx:PXRnaV79FOu7p6OvSn7UA1GPw5oujqVPU1UQnMd0poCd4czUIQf987ln>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Jan 2026 05:47:25 -0500 (EST)
Date: Wed, 14 Jan 2026 10:47:23 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: linux-mm@kvack.org, linux-coco@lists.linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, ardb@kernel.org, akpm@linux-foundation.org, david@kernel.org, 
	osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com
Subject: Re: [PATCH v2 2/2] mm/memory_hotplug: Add support to unaccept memory
 after hot-remove
Message-ID: <aWdwIvzPDqY21cbS@thinkstation>
References: <20260112202300.43546-1-prsampat@amd.com>
 <20260112202300.43546-3-prsampat@amd.com>
 <aWYctexPTf-w7QT8@thinkstation>
 <af3bf2ef-0231-4e75-9a80-c2bd3a7e1bf1@amd.com>
 <aWaGBandNCLT93Tm@thinkstation>
 <7283516a-ee5b-4226-ba32-1d9325eb6748@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7283516a-ee5b-4226-ba32-1d9325eb6748@amd.com>

On Tue, Jan 13, 2026 at 12:22:33PM -0600, Pratik R. Sampat wrote:
> 
> 
> On 1/13/26 11:53 AM, Kiryl Shutsemau wrote:
> > On Tue, Jan 13, 2026 at 11:10:21AM -0600, Pratik R. Sampat wrote:
> >>
> >>
> >> On 1/13/2026 4:28 AM, Kiryl Shutsemau wrote:
> >>> On Mon, Jan 12, 2026 at 02:23:00PM -0600, Pratik R. Sampat wrote:
> >>>> Transition memory to the shared state during a hot-remove operation so
> >>>> that it can be re-used by the hypervisor. This also applies when memory
> >>>> is intended to be hotplugged back in later, as those pages will need to
> >>>> be re-accepted after crossing the trust boundary.
> >>>
> >>> Hm. What happens when we hot-remove memory that was there at the boot
> >>> and there's bitmap space for it?
> >>>
> >>
> >> While hotplug ranges gotten from SRAT don't seem to overlap with the
> >> conventional ranges in the unaccepted table, EFI_MEMORY_HOT_PLUGGABLE
> >> attribute could indicate boot time memory that could be hot-removed. I
> >> could potentially unset the bitmap first, if the bit exists and then
> >> unaccept.
> >>
> >> Similarly, I could also check if the bitmap is large enough to set the
> >> bit before I call arch_accept_memory() (This may not really be needed
> >> though).
> >>
> >>> Also, I'm not sure why it is needed. At least in TDX case, VMM can pull
> >>> the memory from under guest at any time without a warning. Coverting
> >>> memory to shared shouldn't make a difference as along as re-adding the
> >>> same GPA range triggers accept.
> >>>
> >>
> >> That makes sense. The only scenario where we could run into trouble on
> >> SNP platforms is when we redo a qemu device_add after a device_del
> >> without first removing the memory object entirely since same-state
> >> transitions result in guest termination.
> >>
> >> This means we must always follow a device_del with an object_del on
> >> removal. Otherwise, the onus would then be on the VMM to transition
> >> the memory back to shared before re-adding it to the guest.
> > 
> > This seems to be one-of-many possible ways of VMM to get guest terminated.
> > DoS is not in something confidential computing aims to prevent.
> > 
> >> However, if this flow is not a concern to begin with then I could
> >> probably just drop this patch?
> > 
> > Yes, please.
> 
> Putting more thought into it, memory unacceptance on remove may be required
> after all at least for SNP platforms.
> 
> Consider a scenario:
> * Guest accepts a GPA say G1, mapped to a host physical address H1.
> * We attempt to hot-remove the memory. If the guest does not unaccept the memory
>   now then G1 to H1 mapping within the RMP will still exist.
> * Then if the hypervisor later hot-adds the memory to G1, it will be now mapped
>   to H3 and this new mapping will be accepted.
> 
> This will essentially mean that we have 2 RMP entries: One for H1 and another
> for H3 mapped for G1 which are both validated / accepted which can then be
> swapped at will and compromise integrity.

I don't know much about SEV, but I assume RMP is similar to PAMT in TDX
where TDX module maintains metadata for host physical memory.

What side problems do you for guest here?

I probably miss something, but it seems to be VMM problem, no? I mean if
VMM doesn't update RMP on replacing one HPA to another for the GPA, it
is bug in VMM housekeeping. Guest is not responsible for this.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
