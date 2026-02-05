Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F5D38F227
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288503; cv=none; b=aQs6z0ILCq0YcHZD/kqfYTlTRodU1li/j0sA/xEU19nfP9sp29h8CkS+/QEFmDIDHWszVQFy2AL6kOlguWzkmOTEW3oRjWRDB2XG0AGalrQuA72ivezILk4mc2E4u3Ml5Oq3ijW4w0uZE6R9KrwBunIE93mcJKl85pMnBS7YEYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288503; c=relaxed/simple;
	bh=KtgLQkOU/MenbkJ1CoPc5QlChz0x1XQvAlKnIeE5t4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TF6VoBVLVbagIxswxyJvzs4YkjiM1ty0It2p1OLuq4gQF2tegkKCEGAkT+JeVYcduCSW5dvkplyIdGdGTpKICmpRPa07byWYZfn7crc0AQ0ZlrhLGeCAXAx+xuu3xMVQeE4wKM1huecMNjfl4+b7OkliouYIFO6USpHp/GWopSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQGFSTWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQGFSTWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5182C4CEF7;
	Thu,  5 Feb 2026 10:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770288503;
	bh=KtgLQkOU/MenbkJ1CoPc5QlChz0x1XQvAlKnIeE5t4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQGFSTWIHkOvCNE1BlhUjQaajGN5Yh5b8paoTC6KavtX/e93aV098vEOpSEBCohAD
	 RMATrK4LB/gfZKv3VSZJmG0IrgEfkSTsNSZijh2dl6wTMqP4jrN1SwKlMi4d1B3Oaf
	 LwJX2srGjEWbFaQtj1ZH2joNZK+QS21BO+8/K/noDnf+Tw6KC0KYiWp7KmeecNVbmP
	 9Z/6mOATHxtgUrDDvT3v+WIbSKuo+uIoec7bRTixVSQKvFaVYnAI1ZggMX7wTv5TxE
	 2h7aHCl9lh07X7d+qwuWbpYjfN0TXJTEKJfPomReOtTJk0A4ZG/wwCiQunQyoFSx5M
	 Ff5qmpsDPuLcg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id C95E2F4006C;
	Thu,  5 Feb 2026 05:48:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 05 Feb 2026 05:48:21 -0500
X-ME-Sender: <xms:dXWEaTmF7yFUWQUwHHE7Yqpdz967qXai-r4RbF9ttGBXuUN-PUWpSw>
    <xme:dXWEaege_hDZX_A5jT9tYvXfxG1QWG2duZFZKvSoNYPPsZr7RHHp_jzgGB6VlAW55
    v54naWMACDK6a861LgqhYLGKs2ycHgEsxv8jIfU2IaKoHxm_yxGHaqn>
X-ME-Received: <xmr:dXWEafcudn86K3v7e1-sX3EvBClhFhI132dsYv4fWF-uNGKgRLPW7nguNW4QPA>
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
X-ME-Proxy: <xmx:dXWEac8rCswMdkOUD8ouc9KOqEyV0XjD5cdkzCno68cOQ6I8st38GA>
    <xmx:dXWEadgQmD84bqhvdJfsPTPCb_aOjJAlzrHqQcQMXcqdbxVpRpq1fA>
    <xmx:dXWEaY_21YuiMzn1Pm0rL99d2AyKVM_iUEVp0YrkV3GbfVptf-RW3A>
    <xmx:dXWEaWCq5d2m3qCBi4KOfQfyp-_ABe4tnq1aK6GIWccsYm_MrPZh1g>
    <xmx:dXWEaaHCKX-vVgOQFNesWeQO7sOwR9G0aDwNem1qAtAFaVIMsPDp4N-9>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 05:48:21 -0500 (EST)
Date: Thu, 5 Feb 2026 10:48:20 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: "David Hildenbrand (arm)" <david@kernel.org>, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, ardb@kernel.org, 
	akpm@linux-foundation.org, osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com
Subject: Re: [PATCH v4 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
Message-ID: <aYR0vqwyFPo3EKAi@thinkstation>
References: <20260203174946.1198053-1-prsampat@amd.com>
 <20260203174946.1198053-2-prsampat@amd.com>
 <d07cbb96-ba30-4dcf-ad14-0479d6a989f2@kernel.org>
 <70be936e-e49d-4485-8d1e-416fdf8f40a4@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70be936e-e49d-4485-8d1e-416fdf8f40a4@amd.com>

On Wed, Feb 04, 2026 at 09:50:09PM -0600, Pratik R. Sampat wrote:
> 
> 
> On 2/4/26 2:00 PM, David Hildenbrand (arm) wrote:
> >>   #endif
> >>     static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
> >> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> >> index a63ec679d861..549ccfd190ee 100644
> >> --- a/mm/memory_hotplug.c
> >> +++ b/mm/memory_hotplug.c
> >> @@ -1567,6 +1567,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
> >>       if (!strcmp(res->name, "System RAM"))
> >>           firmware_map_add_hotplug(start, start + size, "System RAM");
> >>   +    accept_hotplug_memory(start, size);
> >> +
> >>       /* device_online() will take the lock when calling online_pages() */
> >>       mem_hotplug_done();
> >>   
> > 
> > I really hate that accepting (and un-accepting) hotplugged memory is different to accepting ordinary boot memory.
> > 
> > Is there really no way we can get a reasonable implementation where we just call a generic accept_memory() and it will know what to do?
> > 
> 
> Sure, that shouldn't be impossible.
> 
> The only reason I initially kept them separate is because we accept and update
> the bitmap unconditionally. This mainly applies to cold-plugged memory since
> their bitmap state after remove shouldn't matter. However, as we are now
> correctly setting the bits in the hot-remove path we should be fine accepting
> from the for_each_set_bitrange_from() logic within accept_memory(), I think.
> 
> Something like so?
> 
> diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
> index d11e7836200a..e56adfd382f8 100644
> --- a/drivers/firmware/efi/unaccepted_memory.c
> +++ b/drivers/firmware/efi/unaccepted_memory.c
> @@ -36,6 +36,7 @@ void accept_memory(phys_addr_t start, unsigned long size)
>         unsigned long range_start, range_end;
>         struct accept_range range, *entry;
>         phys_addr_t end = start + size;
> +       phys_addr_t bitmap_end;
>         unsigned long flags;
>         u64 unit_size;
> 
> @@ -44,6 +45,21 @@ void accept_memory(phys_addr_t start, unsigned long size)
>                 return;
> 
>         unit_size = unaccepted->unit_size;
> +       bitmap_end = unaccepted->phys_base + unaccepted->size * unit_size * BITS_PER_BYTE;
> +
> +       /* Memory completely beyond bitmap: hotplug memory, accept unconditionally */
> +       if (start >= bitmap_end) {
> +               arch_accept_memory(start, end);
> +               return;
> +       }
> +
> +       /* Memory partially beyond bitmap */
> +       if (end > bitmap_end) {
> +               arch_accept_memory(bitmap_end, end);
> +               end = bitmap_end;
> +       }

You are calling arch_accept_memory() on every memory allocation if the
memory is not represented in the bitmap. Hard NAK.

> 
>         /*
>          * Only care for the part of the range that is represented
> 
> unaccept_hotplug_memory() truly doesn't do anything special for hotplug so I
> could just re-name it unaccept_memory().
> 
> Thanks!
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
