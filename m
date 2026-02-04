Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70981AA7A6;
	Wed,  4 Feb 2026 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204164; cv=none; b=e19GUOZ2UZfNPy8tDgVTNu11/nxR+x/DNDjSAPajT7B+q9I1VF1uWDPGt6X+pXZ2g14NiUXOf250mytxq74G2w8ZJvT7L7q3Drydazn/BduaAS6xFxI9xRn/ZF/waJmO+rm7m4QDfbZ6WWxSbqNmaqHbAjhGZUQGnfnETPEfhjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204164; c=relaxed/simple;
	bh=BJIDXXgBuKxRtpxYGYjkSIboKZRBz0aB2ToXuvdwHfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlLY++QfO6W9pfE3Uqc6GNd0ITdkfHQRWK+X3qvKfjp8l09T4H5VbJUfQJGUTu0J7IZhhDGchmAIURA+zwgmhLG8kltCMpj+s9XOVEeGZUadJUndvPj3hH2cgQR5evq97UVkEsOw5fZiPV20GXCuW4jCl0C+qy1b3O/tnKeH1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUXU4qbr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUXU4qbr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA680C4CEF7;
	Wed,  4 Feb 2026 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770204164;
	bh=BJIDXXgBuKxRtpxYGYjkSIboKZRBz0aB2ToXuvdwHfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUXU4qbrT3jzzDesvgUaNyGjY/3Fz9r72nTElF8l7MooBGYwo+p7AQ5u2o11tb2L9
	 KhTHkQZV79AmyjoGVpv10zw7Mpuuq8qLCXTeDeXpeaAc9OnVZEr1gtFxLTXXrbeiQJ
	 RJg+XDSdIdQFD/jyRW+I+vAJNoWtFz4x2z6aDUwZJyFnC5lz6xaiTdud9TFXPO2/dc
	 Z+QpST3IvSt45ihQE/yCWZtDBjDVA379pb7YrQjgFE1NhwBfFeBDy3F3a2/ingvgdc
	 Swk69IZDawVQUhFnknf4Qn0ZACJXVp7fl9akV7Zsrx+yOna8pw/5n8Aj7lTCpwVOAf
	 bnyq+lbfXxkaA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id E2C4AF4006A;
	Wed,  4 Feb 2026 06:22:42 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 04 Feb 2026 06:22:42 -0500
X-ME-Sender: <xms:AiyDaUL3F9n3DNPjuSDCd23uY22UkYpDhwpKL_T79q6pms2EIOMZdg>
    <xme:AiyDaU6cpGU6s6dKLYN8uHo_xbrD0Ivb5ANIwCiD-ncsaeYfOmf1WGkqzL55nV4LN
    a1yAeLkQbEyZEqcTTYtsZZDG58gjNJxS92OPTvHnn1-9qi4zcc0sNI>
X-ME-Received: <xmr:AiyDadnQMRWXBPIxL__hR2uQ_TjXXNeXMKT27Q1EHYDWSB1_bXtmRH39xPwnDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvfeduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:AiyDaZR4g8P1oPcROqQ2WPtnhXz3ACGkzlh5Gj8bU76LM8SqByRTdw>
    <xmx:AiyDaaiRkbjWP5pqUymNm3nSmfvZ0VrcGwTlaiLW1C9mRtydAoQgGA>
    <xmx:AiyDaT1ky6zD1is-cSozOnwrJqSSWgk6DRPLqMM7cv4PIB2ShqyIhA>
    <xmx:AiyDaZA2uZ5pHL3_XQDkheAP42GKjwTXMpDfqg1_aiUiVelE4qJhPQ>
    <xmx:AiyDac3QFPOBI_Ph4m9-sBGH2Kclp7CQJXruc2UkM9egc4Ie8vHbb7B3>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 06:22:40 -0500 (EST)
Date: Wed, 4 Feb 2026 11:22:35 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: linux-mm@kvack.org, linux-coco@lists.linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, ardb@kernel.org, akpm@linux-foundation.org, david@kernel.org, 
	osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com
Subject: Re: [PATCH v4 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
Message-ID: <aYMjjyVVax5cml9B@thinkstation>
References: <20260203174946.1198053-1-prsampat@amd.com>
 <20260203174946.1198053-2-prsampat@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203174946.1198053-2-prsampat@amd.com>

On Tue, Feb 03, 2026 at 11:49:45AM -0600, Pratik R. Sampat wrote:
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
>  drivers/firmware/efi/unaccepted_memory.c | 47 ++++++++++++++++++++++++
>  include/linux/mm.h                       |  5 +++
>  mm/memory_hotplug.c                      |  2 +
>  3 files changed, 54 insertions(+)
> 
> diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
> index c2c067eff634..359779133cb4 100644
> --- a/drivers/firmware/efi/unaccepted_memory.c
> +++ b/drivers/firmware/efi/unaccepted_memory.c
> @@ -209,6 +209,53 @@ bool range_contains_unaccepted_memory(phys_addr_t start, unsigned long size)
>  	return ret;
>  }
>  
> +/*
> + * Unaccepted memory bitmap only covers initial boot memory and not the
> + * hotpluggable range that is part of SRAT parsing. However, some initial memory
> + * with the attribute EFI_MEMORY_HOT_PLUGGABLE can indicate boot time memory
> + * that can be hot-removed. Hence post acceptance, only for that range update
> + * the unaccepted bitmap to reflect this change.
> + */
> +void accept_hotplug_memory(phys_addr_t start, unsigned long size)
> +{
> +	struct efi_unaccepted_memory *unaccepted;
> +	unsigned long range_start, range_len;
> +	phys_addr_t end = start + size;
> +	u64 phys_base, unit_size;
> +	unsigned long flags;
> +
> +	unaccepted = efi_get_unaccepted_table();
> +	if (!unaccepted)
> +		return;

This can be tricky.

If we boot a VM with <4GiB of memory and all of it is pre-accepted by
BIOS, the table will not be allocated.

But it doesn't mean that hotplugged memory above should not be accepted.

I don't think there is a way to detect such cases.

Your check is probably the best we can do, but it means VMs are going to
crash if memory accept is required by no table.

This is ugly situation.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
