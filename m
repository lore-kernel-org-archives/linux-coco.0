Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D2932FA19
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769683213; cv=none; b=DwF1SN44bJod2dnprNrewBAzRiWRrLVXGmzxP3bzeEPv5h/O8iuklysekvQNSnvzmqrxftYL81H9AePy07uv/0NWoeMxQbrzbaS0zbc/KqJ930423JUYMaSxGrvRlLSNU+StUB5RFDQk7EXJvez48roMptNP4mMlNayoUG6jSeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769683213; c=relaxed/simple;
	bh=ROiK4CJcKz2ERuSK3/5HMDVtSfo4l/Sj8AonTKI6eG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNKsyhKuZI1yqA2nAZVGd83w77fYr9NtLkYAWlultA8C0gt7vccfiUhlJI7Vk6VKiFwk7Du5pe9qnhN5in/0pvNJiuVN7enX0fGyrBgpGJGaSHjfPrA04gRg/Aaxs1TR22JEWt7IS3i1gH/IBHRhZ38tokO4b7Ow07wG/FUV63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtCtSb3F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtCtSb3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAA5C116D0;
	Thu, 29 Jan 2026 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769683213;
	bh=ROiK4CJcKz2ERuSK3/5HMDVtSfo4l/Sj8AonTKI6eG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GtCtSb3Fhv9MMWZybLqPaBrkMUrHMAs8bqLkZ00HygjH3mN5RFr/KFNUUrGGNm7GH
	 mT9CIvS1RX5uBn73PvZMRxeK6jNorIfWj7i6+mb4Nzy64y/XYQOOaIzSbzCREn9XaC
	 jbjDZ38Zw/FjVQKAtyo8bFXY6GFw+0dCXbjGye2DhxbsQrmlQ9RdRUOlAY0h9Rd+2V
	 2ieQjd/Ae7NQp8+PNAjXFCy/IY7ZSvzW343RbxPyJ3TZXgZHj+GsY+5UAVWToWIdyc
	 3CuJkctZMfgN07RKPvBT0xXQ7M+BUxfKOUKX5spSRsOy5nw0Q3eOKkdbe8SdFaXvdT
	 XRh+QHl5LYkLQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id C3C81F4007A;
	Thu, 29 Jan 2026 05:40:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 29 Jan 2026 05:40:11 -0500
X-ME-Sender: <xms:Czl7adizN3nfBdbdZZ7YTYb7wkpvs6dH-khtCd2eVQpWxrRXS2HXrg>
    <xme:Czl7aUVHZWDsKRTF0dvEjiHMASmN9QFc0vGfFnx4jlg_56R2WyTxQ_4vXkScY56Qc
    C_MTV-JzEgU1DWlxUO4A_XENZtWqj4sXLKcAOyP48wu8-44JDiK3Q>
X-ME-Received: <xmr:Czl7abyzlq_BB9vPdHoE6PEHW4sxCuLU7sg4lnP1WsgX87QDOJMQWOJbU8JhCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieehleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfedvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghvvgdrhhgrnhhsvghnsehinhhtvghlrdgtohhmpdhrtghpthhtohepphhrsh
    grmhhprghtsegrmhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghk
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqtghotghosehlihhsthhsrdhlihhnuhigrd
    guvghvpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepth
    hglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepmhhinhhgohesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepsghpsegrlhhivghnkedruggv
X-ME-Proxy: <xmx:Czl7afOEIluNTssr6FgztnLEDYpyZz4XhBy6sylZN6QnoveYnhebwg>
    <xmx:Czl7aYYKurg10Z4bz8K7BC_2g3WekrT5H3wg3H2uU89odOYhupnYUg>
    <xmx:Czl7aQ6PAuT_uq9keXqSCqNwZXBhF6PLH_grgJovKe-M3WEOcwSYfQ>
    <xmx:Czl7afCS-nA8iM3BOHW9cweuItiS1UOIlu0GlrloiUVWBmVd_TxPpA>
    <xmx:Czl7af4XZW748jN_I5qNUdeZoIeHEUN5mGwCVLocYa6uSH7QPsiSI4cO>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jan 2026 05:40:09 -0500 (EST)
Date: Thu, 29 Jan 2026 10:40:04 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Pratik R. Sampat" <prsampat@amd.com>, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, ardb@kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, osalvador@suse.de, thomas.lendacky@amd.com, 
	michael.roth@amd.com
Subject: Re: [PATCH v3 2/2] x86/sev: Add support to unaccept memory after
 hot-remove
Message-ID: <aXs4DTXCbI_c0JPO@thinkstation>
References: <20260128204105.508855-1-prsampat@amd.com>
 <20260128204105.508855-3-prsampat@amd.com>
 <16aa84a9-83ce-4748-bc73-ccf5cb6ce376@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16aa84a9-83ce-4748-bc73-ccf5cb6ce376@intel.com>

On Wed, Jan 28, 2026 at 01:15:06PM -0800, Dave Hansen wrote:
> On 1/28/26 12:41, Pratik R. Sampat wrote:
> > +static inline void arch_unaccept_memory(phys_addr_t start, phys_addr_t end)
> > +{
> > +	if (cc_platform_has(CC_ATTR_GUEST_SEV_SNP)) {
> > +		snp_unaccept_memory(start, end);
> > +	} else {
> > +		panic("Cannot unaccept memory: unknown platform\n");
> > +	}
> > +}
> 
> This panic() is pretty nasty.
> 
> Can't we just disable memory hotplug up front if it's:
> 
> 	!cc_platform_has(CC_ATTR_GUEST_SEV_SNP)
> 
> ?

I don't understand SEV-SNP situation, but I don't think we need to do
anything on unplug for TDX. We should expect the unplugged memory to be
removed from SEPT. If VMM doesn't do this, it is effectively DoS and we
don't protect against DoS in CoCo.

Converting the memory to shared will do no good for us.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
