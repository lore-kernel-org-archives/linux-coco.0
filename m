Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89163A7836
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288698; cv=none; b=fZgwH7B9KPjIGVfyp//meZwzSdNtm98gJu1gykP2qYQQIXqxxslo+UorjyJvuoV0hv/FEyeMQqllE6SGGF6w84euGyUb8HvnSqHMZuYVOhzVl1Yb7BWsVfa4JjEfeD8wVkwaAXx7bkgrR8zOUp7NKi67UXQVOL45KHOYweA5WVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288698; c=relaxed/simple;
	bh=9fuN5USsUGF1WzrDo+pVyaNuOxLtr0Q5xXjchPRotqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KseyPed47rfSRQ7kX9+6ypmF+ZWzszuHMasD6IZzT1gmnCvRJA9fvbdFZrR32oZnfjicLjfJjPm8Tk6YZwG/roBYUMRsvosK8kUVsUsIo51stTfT7xpLhlgVJl2yLHZjp97ceXvhztpHyrIjL7rWA41HEwo0kUH0s0Q4DKMir4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFELBMmF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFELBMmF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C4BC19424;
	Thu,  5 Feb 2026 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770288697;
	bh=9fuN5USsUGF1WzrDo+pVyaNuOxLtr0Q5xXjchPRotqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFELBMmF5iSGzD2J5VYYW2H3R9B6pzc5j+IhnlokeXNfkFF0f6YxB0RMGYkWRlDvB
	 XORLZo/xV1lIkCTxp74jyBQpV2hcklZgJge2Sm77ZJkVdQZvK40jGHVsNeeAC08iev
	 /DvAHMRPnJ1pmYJ4OqbwNT1S6z7JPsrhxKrQdwhYF109w51/oHKrx12hdxSubhbCqG
	 SF4WJ9gcH4ATliKMb03KHtz9ui30tKljPgpSNf1UUrs+ylk9A8flowxQF9lsm++Fhy
	 590VVTL5/iBz7c20nFYiGOKzkaBLofkltWDcK4btqJr5gNN/ZRgrzu6u6m6JRDcZOc
	 5wk0vT3qOCM5w==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6DE10F4006C;
	Thu,  5 Feb 2026 05:51:36 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 05 Feb 2026 05:51:36 -0500
X-ME-Sender: <xms:OHaEafKqpsc8ta6aeUJbuntP44wZSocgehA1wKvzRGgAy_GM0Wlucw>
    <xme:OHaEaT4-F3S3AevY6I6KM1hg6QptUUanOx_8OvZQ7PKAjanZlOpS2nXCK4_AS3G0D
    MP_JnEbJdk3mQqpo1gj907HtPsHK8O1eorj8vQ0tETek46PagW8wJIC>
X-ME-Received: <xmr:OHaEaQlkvqLhg1rUapShdAuFOH1hUCOGdSfABYsupqIYm3d4WoDDHTKFwTAZeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeeludettdeigfefhffhhfelveeludeuleduvefhgefgueeitedtleffudegfffg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkih
    hrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieeh
    hedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovh
    drnhgrmhgvpdhnsggprhgtphhtthhopeeftddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepphhrshgrmhhprghtsegrmhgurdgtohhmpdhrtghpthhtohepuggrvhhiugeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqtghotghosehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigse
    hlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgt
    ohhmpdhrtghpthhtohepsghpsegrlhhivghnkedruggv
X-ME-Proxy: <xmx:OHaEaQRE26RNnCSybKljxN8W8lncdtQSxl7KTw5A1qoUfyd6L86umA>
    <xmx:OHaEaVjQ-TZmarRLpDenGpA5D_UHLJix_dpT9PW0waNajbtbaDgLfw>
    <xmx:OHaEaS01wJGc_olWceNoo8rAT3fNHCnk9SqtNQNK-IcNpnHrZJ6NCA>
    <xmx:OHaEacDM7cs_-3yoGsInKTS04RlOvYi4q-qRNxlcH62oo5JJYdD1lg>
    <xmx:OHaEaT3jp4VA1ftSsnEax-lXbv0ie8TzuQulFNcSENn5VNkxvOMYg0ge>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 05:51:34 -0500 (EST)
Date: Thu, 5 Feb 2026 10:51:29 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: "David Hildenbrand (arm)" <david@kernel.org>, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, ardb@kernel.org, 
	akpm@linux-foundation.org, osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com
Subject: Re: [PATCH v4 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
Message-ID: <aYR1jHu4oq6LXKYF@thinkstation>
References: <20260203174946.1198053-1-prsampat@amd.com>
 <20260203174946.1198053-2-prsampat@amd.com>
 <aYMjjyVVax5cml9B@thinkstation>
 <29b4dc97-bb01-42fd-8ccd-f4cb2886ccd3@kernel.org>
 <550c89ae-de6e-45f7-89a2-ccc815f8d5a2@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <550c89ae-de6e-45f7-89a2-ccc815f8d5a2@amd.com>

On Wed, Feb 04, 2026 at 09:50:01PM -0600, Pratik R. Sampat wrote:
> 
> 
> On 2/4/26 1:59 PM, David Hildenbrand (arm) wrote:
> > On 2/4/26 12:22, Kiryl Shutsemau wrote:
> >> On Tue, Feb 03, 2026 at 11:49:45AM -0600, Pratik R. Sampat wrote:
> >>> Confidential computing guests require memory to be accepted before use.
> >>> The unaccepted memory bitmap maintained by firmware does not track
> >>> most hotplugged memory ranges apart from system memory annotated to be
> >>> cold plugged at boot.
> >>>
> >>> Explicitly validate and transition the newly added memory to a private
> >>> state, making it usable by the guest.
> >>>
> >>> Signed-off-by: Pratik R. Sampat <prsampat@amd.com>
> >>> ---
> >>>   drivers/firmware/efi/unaccepted_memory.c | 47 ++++++++++++++++++++++++
> >>>   include/linux/mm.h                       |  5 +++
> >>>   mm/memory_hotplug.c                      |  2 +
> >>>   3 files changed, 54 insertions(+)
> >>>
> >>> diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
> >>> index c2c067eff634..359779133cb4 100644
> >>> --- a/drivers/firmware/efi/unaccepted_memory.c
> >>> +++ b/drivers/firmware/efi/unaccepted_memory.c
> >>> @@ -209,6 +209,53 @@ bool range_contains_unaccepted_memory(phys_addr_t start, unsigned long size)
> >>>       return ret;
> >>>   }
> >>>   +/*
> >>> + * Unaccepted memory bitmap only covers initial boot memory and not the
> >>> + * hotpluggable range that is part of SRAT parsing. However, some initial memory
> >>> + * with the attribute EFI_MEMORY_HOT_PLUGGABLE can indicate boot time memory
> >>> + * that can be hot-removed. Hence post acceptance, only for that range update
> >>> + * the unaccepted bitmap to reflect this change.
> >>> + */
> >>> +void accept_hotplug_memory(phys_addr_t start, unsigned long size)
> >>> +{
> >>> +    struct efi_unaccepted_memory *unaccepted;
> >>> +    unsigned long range_start, range_len;
> >>> +    phys_addr_t end = start + size;
> >>> +    u64 phys_base, unit_size;
> >>> +    unsigned long flags;
> >>> +
> >>> +    unaccepted = efi_get_unaccepted_table();
> >>> +    if (!unaccepted)
> >>> +        return;
> >>
> >> This can be tricky.
> >>
> >> If we boot a VM with <4GiB of memory and all of it is pre-accepted by
> >> BIOS, the table will not be allocated.
> >>
> >> But it doesn't mean that hotplugged memory above should not be accepted.
> >>
> >> I don't think there is a way to detect such cases.
> >>
> >> Your check is probably the best we can do, but it means VMs are going to
> >> crash if memory accept is required by no table.
> >>
> >> This is ugly situation.
> 
> Agreed. Breaking hotplug for VMs under 4G is absolutely not the way to go.
> 
> Would it be worse if we call arch_accept_memory() if the table doesn't exist?
> The table is primarily to operate on the bitmap's entry. We could wrap these
> accept calls within an arch check for TDX and SNP guest if the unaccepted table
> is NULL. Or, less preferably convert the panic() of the existing
> arch_[accept/unaccept]_memory() to a WARN() instead.

I think you try to workaround a lack of proper design. I think the right
way would be to make unaccepted hotpluggable ranges declared upfront in
the EFI memory map, so kernel can allocate bitmap for all of it on boot
and not playing guessing game.

If it required EFI spec modification, let's do it.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
