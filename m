Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F82EC0A1
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808667; cv=none; b=rmyPGLtjDzly32+MZqw3k13ORE6WtAIZRl3ya3snKrYSji3PhZ9HefJjhD3QN4yBSo00zYjsR6nGqxq5U41vQ0fmfGRIjzw9AH0G/PZ7pPo/pAbpaAd/OOjVxszp79ttMElzIc7FsgKjkSw9WUyATJY+QaXHaBkcEeIjoPwLx80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808667; c=relaxed/simple;
	bh=Jp3G29LRoniDECbxeusFH2bwxbxUW5JNY940z1mEmIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcwsIl/7rScgGATNdqz5GnObmdWxfP9RfUflrPsiAQtVkToyUVVQr5jZvUG7VNAYHyoP/5Ec3FinFcwIvMuy0NgQPFQQccEJOUfBTLk617TmN8wMfY7iA4kJSaw7HkSOwdlg9/2eDuTwSwjaAiA3ofjZ2LMEMLt2SsTsy9UITS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzXUlPZB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzXUlPZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04873C19421;
	Wed, 11 Feb 2026 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770808667;
	bh=Jp3G29LRoniDECbxeusFH2bwxbxUW5JNY940z1mEmIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzXUlPZBgcboC1TJmnM1NsnLpKx93Jkpc2hXzUUGLA0Pzt+kSre0hAaq3tvn6kl6k
	 gHZ6EsfC67kVagKMKMgju8H872hzHVhRdPmi2MtyQshaZeuf9cQcTaIdWSdRuf0VDd
	 01jq9s4J4HlDiSPuZ78MNcIer4sy3JtqShgOTbAPOdd7kegYnRi9+5BD2biaBvUUhQ
	 FsrPG39TBDFHtGvGZZfxIGLehKxivZskaHhy81YySbUfXfqkKnaWbR4YklYNNcqN9H
	 KkeR0xOxK5+el07snrSpw8ZAzjHLrm2glL4+SKQpYNZHfsyG4s1eLsOk29PkRpJXpk
	 /1MwhVLBYdIlw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 252E1F40068;
	Wed, 11 Feb 2026 06:17:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 11 Feb 2026 06:17:46 -0500
X-ME-Sender: <xms:WmWMaW-NumFODThTeCV1sxtgYbRSWAuoV7fuiUcklKgUK3FFKxmd3g>
    <xme:WmWMaeTBZTJzbRHQI_1APRHHErrA3qPlHN6hhLZfCACb4zQKHxkRwFzpmlR7lnDA-
    o8nxv6nSqjKLTkhzrDTO7aJ8tbU8Kmuv2NEuWDDRskGJrRJua1jhRk>
X-ME-Received: <xmr:WmWMabpwYXICKs4uBGMQ_5b70axw8Ir9qXnxieLqP_ViPnPIf103lfQJU045Pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddvgeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehsrghthhihrghnrghrrgihrghnrghnrdhkuhhpphhushifrghmhieslhhinhhugi
    drihhnthgvlhdrtghomhdprhgtphhtthhopegurghnrdhjrdifihhllhhirghmshesihhn
    thgvlhdrtghomhdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinh
    htvghlrdgtohhmpdhrtghpthhtoheprhhitghkrdhprdgvughgvggtohhmsggvsehinhht
    vghlrdgtohhmpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqtghotghosehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:WmWMabN67ynhbrJ4L7s_E5_omF--m-TegjokYz0kwroGV8Qi9bNixA>
    <xmx:WmWMaRyYiW59yD0Gxc7-bVbBaH4qeaPn1sVVt_9MG3AIfc-zPJ3ztg>
    <xmx:WmWMafwplRA4sT8fzvFDwH4FSMD2-USI-cGVmAbDW3tp3BMM7w0NGw>
    <xmx:WmWMaSJkh8X-9668J62sMH9QbP3abS37D0AjuUDB40aU26W6CMuiTA>
    <xmx:WmWMaTh6WlvpH80VF_BUHkRiKdXPBTCQjmK3fZC1I2t20FhF2W0iGhLy>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Feb 2026 06:17:43 -0500 (EST)
Date: Wed, 11 Feb 2026 11:17:38 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Subject: Re: [PATCH v1 3/3] virt: tdx-guest: Increase Quote buffer size to
 128KB
Message-ID: <aYxjhdES2MOI7rj9@thinkstation>
References: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260211001712.1531955-4-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211001712.1531955-4-sathyanarayanan.kuppuswamy@linux.intel.com>

On Tue, Feb 10, 2026 at 04:17:12PM -0800, Kuppuswamy Sathyanarayanan wrote:
> Intel platforms are transitioning from traditional SGX-based
> attestation toward DICE-based attestation as part of a broader move
> toward open and standardized attestation models. DICE enables layered
> and extensible attestation, where evidence is accumulated across
> multiple boot stages.
> 
> With SGX-based attestation, Quote sizes are typically under 8KB, as the
> payload consists primarily of Quote data and a small certificate bundle.
> Existing TDX guest code sizes the Quote buffer accordingly.
> 
> DICE-based attestation produces significantly larger Quotes due to the
> inclusion of evidence (certificate chains) from multiple boot layers.
> The cumulative Quote size can reach approximately 100KB.
> 
> Increase GET_QUOTE_BUF_SIZE to 128KB to ensure sufficient buffer
> capacity for DICE-based Quote payloads.

It worth noting that it requires guest physically-contiguous memory.

Single order-5 allocation is not that bad as long as the driver
initialized during the boot.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
