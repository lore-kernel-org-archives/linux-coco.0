Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F079F381704;
	Thu, 29 Jan 2026 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682929; cv=none; b=swBs+yuzyJmCmTdKBHwDCTZ1bNgPo4vHzViO8FR9rzzSKd76yyrvC6PO3BwCWWcwXG62frf0F8PoQNronaG43J+nOHNsWheNP4WNfSdDsoKPsKZGXQbWBnOII/y/jQDrk2j4tE2WYnMSBsTe+zdb7B6mUO4wEs0bujOg+xTT62M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682929; c=relaxed/simple;
	bh=B7t+HX7cNhdeA2zHoB8ThQ6BCCEjOkvXW+5RQmoXcqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiNKPuNAjVxLxmSwmHN2KvYYmb67rtixVRXw9rHvYfwFeRqInl34dxYaULGB7OyJ6Vzg4GFnvepOpqr8N3rpvp27kPoAD25qnr2yn1rS6eF/dhaZMKSjYGC7sIVI7lYfn+NaDlNQnX19n3R3VWAlQsOs1nLZQBFDL9bIyLHrJI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGm+Pe5L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGm+Pe5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F97C16AAE;
	Thu, 29 Jan 2026 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769682928;
	bh=B7t+HX7cNhdeA2zHoB8ThQ6BCCEjOkvXW+5RQmoXcqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGm+Pe5LVrS1PH26EJ06OJbvCkYSjmCQAQZi9v2MpV1ld6e2sLKst4M+MqyMvgIYS
	 qFURRvzfYva0IqejrqLqhVJTphOz4DaiFLYx2fy72WrvQ2ZjTG8ZgsWMWM7d5TMQVV
	 I8rlMzuAZwxNvXEQ5bUa4GN8gnMz7cLiHiHPW3gtfFt8cmh0Ra38xu8+wkAz+ygmgE
	 kBkNV5yh7ldmTIORTrOEQewRueaVs602d0Kk0ckQTJWci7nUoMkANoZkGvPgZSZ1BY
	 TCq+5o4DDG5mviyrWmTa7Qw34U2Dh9IRoznrCiW0pLY39o01poMq7PpSzH2jfAvcWm
	 wY0H2bRr49elw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4B707F40075;
	Thu, 29 Jan 2026 05:35:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 29 Jan 2026 05:35:27 -0500
X-ME-Sender: <xms:7zd7aWQJIlX8xOpb0kie4rT16Qk1y3GzYJWoOJaYFH279eSUu-yz2w>
    <xme:7zd7acjgkHUISUSxBOAYvg0ACK-12IlSUtj5HajaTpOj9PTe-YLEyRSwsTQItoRyo
    e4OFTcM4M_87wkApNTragA0rp6a_I21i5qVR8Rks5J_B2IdngLHzBI>
X-ME-Received: <xmr:7zd7acuUyA6shq1QXasNuesRZEluwD8lmK27JJ5o-ojX2trXs2zMiR40DGWtog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieehleejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:7zd7aZ5S2PtK8kE94JZRSTnBS8HuW9UF_Qt30LmF8-RuV0Vw5LhZfg>
    <xmx:7zd7aepjz50WxJBcHBoKzoi-w8Hrs4p9jcbqVkSnGBYYX5RRcNi6MA>
    <xmx:7zd7aVc23eMBzgziJueSlmU9gfPoeexdkR8_7cHNmUckjb512LujWw>
    <xmx:7zd7aaIHC1DIYHwFrhQrOFkcu9-raY4Qqo0-_nV7V_heWN1NR1sUzw>
    <xmx:7zd7aXcBWU0tMq_Su0hEacRzXc6HpK27MXmIWeJSsHwsR9oWHj2EeWa_>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jan 2026 05:35:25 -0500 (EST)
Date: Thu, 29 Jan 2026 10:35:20 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: linux-mm@kvack.org, linux-coco@lists.linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, ardb@kernel.org, akpm@linux-foundation.org, david@kernel.org, 
	osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com
Subject: Re: [PATCH v3 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
Message-ID: <aXs09b7Q8wmHMFNQ@thinkstation>
References: <20260128204105.508855-1-prsampat@amd.com>
 <20260128204105.508855-2-prsampat@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128204105.508855-2-prsampat@amd.com>

On Wed, Jan 28, 2026 at 02:41:04PM -0600, Pratik R. Sampat wrote:
> Confidential computing guests require memory to be accepted before use.
> The unaccepted memory bitmap maintained by firmware does not track
> most hotplugged memory ranges apart from system memory annotated to be
> cold plugged at boot.
> 
> Explicitly validate and transition the newly added memory to a private
> state, making it usable by the guest.
> 
> Signed-off-by: Pratik R. Sampat <prsampat@amd.com>
> ---
>  drivers/firmware/efi/unaccepted_memory.c | 18 ++++++++++++++++++
>  include/linux/mm.h                       |  5 +++++
>  mm/memory_hotplug.c                      |  2 ++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
> index c2c067eff634..5a4c8b0f56c8 100644
> --- a/drivers/firmware/efi/unaccepted_memory.c
> +++ b/drivers/firmware/efi/unaccepted_memory.c
> @@ -209,6 +209,24 @@ bool range_contains_unaccepted_memory(phys_addr_t start, unsigned long size)
>  	return ret;
>  }
>  
> +/*
> + * Unaccepted memory bitmap only covers initial boot memory and not the
> + * hotpluggable range that is part of SRAT parsing. However, some initial memory
> + * with the attribute EFI_MEMORY_HOT_PLUGGABLE can indicate boot time memory
> + * that can be hot-removed. Hence, handle acceptance in accordance with the
> + * unaccepted bitmap. Otherwise, perform the state change for the memory range
> + * up-front.
> + */
> +void accept_hotplug_memory(phys_addr_t start, unsigned long size)
> +{
> +	if (range_contains_unaccepted_memory(start, size)) {
> +		accept_memory(start, size);
> +		return;
> +	}

No. This is buggy. The memory has to be accepted regardless of state in
the bitmap. If the memory is ever unplugged the bitmap state is not
relevant.

So, accept it unconditionally and mark the memory accepted in the
bitmap.

> +
> +	arch_accept_memory(start, start + size);
> +}
> +
>  #ifdef CONFIG_PROC_VMCORE
>  static bool unaccepted_memory_vmcore_pfn_is_ram(struct vmcore_cb *cb,
>  						unsigned long pfn)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 15076261d0c2..2d3c1ea40606 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4504,6 +4504,7 @@ int set_anon_vma_name(unsigned long addr, unsigned long size,
>  
>  bool range_contains_unaccepted_memory(phys_addr_t start, unsigned long size);
>  void accept_memory(phys_addr_t start, unsigned long size);
> +void accept_hotplug_memory(phys_addr_t start, unsigned long size);
>  
>  #else
>  
> @@ -4517,6 +4518,10 @@ static inline void accept_memory(phys_addr_t start, unsigned long size)
>  {
>  }
>  
> +static inline void accept_hotplug_memory(phys_addr_t start, unsigned long size)
> +{
> +}
> +
>  #endif
>  
>  static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index a63ec679d861..549ccfd190ee 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1567,6 +1567,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>  	if (!strcmp(res->name, "System RAM"))
>  		firmware_map_add_hotplug(start, start + size, "System RAM");
>  
> +	accept_hotplug_memory(start, size);
> +
>  	/* device_online() will take the lock when calling online_pages() */
>  	mem_hotplug_done();
>  
> -- 
> 2.52.0
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
