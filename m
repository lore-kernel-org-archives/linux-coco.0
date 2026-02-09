Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF1D2F28E3
	for <linux-coco@lists.linux.dev>; Mon,  9 Feb 2026 10:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633994; cv=none; b=f2BJ6PGsJ2HRHNG8czCmh0V/d/fPhl+2kMTGIWfa/f/jVmMvLFSvuAaPPDdfn2YmD6O+zISkFUt9gtqhcp8CLj5YqrOW8pRmAohvJS6T3SdcElI1ekdaeZYX6fZUfVzfrzK5Nrbr62uXaWXj3zgTvZKMb1zJMoJi0f2NZp4DQbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633994; c=relaxed/simple;
	bh=oIt396BW0G8JKjB3ihTbTUGQExj5VHd026WpVIYdpus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmE6HWAmH1/YwH+ZHSC3p/93yME5gTW+38Pii7/DkkZx/OFMmKGyN56u6bb9SDAxw812f7RwS/ho8RE4tPUTIOaleFYFG43J/w5Of9rX2iqYHSqZhHvmNykr+XdJlawfOg/BKcm2dm1Tk/7faKIAKqt+r22occH53QR1LvtQQjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQ9LIGJ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQ9LIGJ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F52C16AAE;
	Mon,  9 Feb 2026 10:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770633993;
	bh=oIt396BW0G8JKjB3ihTbTUGQExj5VHd026WpVIYdpus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQ9LIGJ7HQOg9wFwx7aTtpZw/xQw1ZLaXlhZsPc3tpd26A8p8ODANm7Ow7TLm4N/I
	 lp79Ho5tmDM9Iatx5V5pIXXZCIYkcJBZ0shgiSTRkEylBqgG5uI2zYWe4/Qa26fa23
	 OWaISnYsdibG5DXsqbOmSAV7TP/fowYYtMBX1SskNXRJE703ZLjuGMHwMJOKjVhSqt
	 f79Mul4IApL79s2RWWslBbYdT516iTOEW4QnhdwZw0aiC7QuZhlm6UBL8O+pbD7sp6
	 nU7eoT8QDZNsWtPmb13hmrfVvK3APvM7nE8k7Xf3cG9eyxAvP0XwrxEn8ObD/xquCR
	 0FRihjmXbKb3g==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 492D1F40069;
	Mon,  9 Feb 2026 05:46:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 09 Feb 2026 05:46:32 -0500
X-ME-Sender: <xms:CLuJaXXxQKKU56KpHtA4N-brlRRO3TdzHB1BQAMjTLLlbBAIguQlng>
    <xme:CLuJaYZchdMiYkeNYZ_Om82s8QFx_5KHYBNl3X_pvMGAhFymx5pxQmk971Ny3Q2JD
    oOPTYR-98Da44Bijk5Wv5MzPBlvXqIE2plVuKjPhlYnoMBAN4hbuAQ>
X-ME-Received: <xmr:CLuJaaWDRWKn_Ub_E6S2hVnJDFN35M3O19damgHYMxnjgoYr4Cmogv9TBMkxNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleeiiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfedtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghvvgdrhhgrnhhsvghnsehinhhtvghlrdgtohhmpdhrtghpthhtohepvhhish
    hhrghlrdhlrdhvvghrmhgrsehinhhtvghlrdgtohhmpdhrtghpthhtohepuggrvhgvrdhh
    rghnshgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehkvhhmsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqtghotghosehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghhrghordhgrghosehinhhtvghl
    rdgtohhmpdhrtghpthhtoheprhhitghkrdhprdgvughgvggtohhmsggvsehinhhtvghlrd
    gtohhmpdhrtghpthhtohepkhgrihdrhhhurghnghesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:CLuJab6AboiZ9JrcFOA7I44Omgg_Q9zC6j0XH56thRmXe_3cFkqaIQ>
    <xmx:CLuJaad8rS6BeJ8LPABmMD0TqLGLwZxxx7H6wG4vRefbrO363mwt6A>
    <xmx:CLuJad7_XFePpMqe_jPykn70JicMwJTlAdHchLMmK_yX4GGBfZJL3A>
    <xmx:CLuJaa2mgySh0A79OA0GfWgDEG38qzD2EtBqtTrsS-J2qLRoTubkTQ>
    <xmx:CLuJaQCESpHTIEyecjPO1R-qi7BK661LY8odbtzHiuJiU3gyLkG2O7eY>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Feb 2026 05:46:31 -0500 (EST)
Date: Mon, 9 Feb 2026 10:46:30 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Verma, Vishal L" <vishal.l.verma@intel.com>, 
	dave.hansen@linux.intel.com, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Gao, Chao" <chao.gao@intel.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"Huang, Kai" <kai.huang@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, "Williams, Dan J" <dan.j.williams@intel.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "hpa@zytor.com" <hpa@zytor.com>, 
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v2 0/2] x86/virt/tdx: Print TDX module version to dmesg
Message-ID: <aYm6-SMojt9uqi0G@thinkstation>
References: <20260109-tdx_print_module_version-v2-0-e10e4ca5b450@intel.com>
 <6d8d37740459963e6fd7f16a890a837b34ebdf17.camel@intel.com>
 <aYXSd8B00OtKZcAU@thinkstation>
 <2235a1cf-7ccf-4134-80b5-8056537c6d33@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2235a1cf-7ccf-4134-80b5-8056537c6d33@intel.com>

On Fri, Feb 06, 2026 at 07:10:58AM -0800, Dave Hansen wrote:
> On 2/6/26 03:39, Kiryl Shutsemau wrote:
> >> Hi Kiryl, just wanted to check on the plan for this, I didn't see it
> >> merged in tip.git x86/tdx (or any other tip branch). Were you planning
> >> to take it through x86/tdx? Can I help with anything to move it along?
> > I guess it has to wait after the merge window at this point.
> > 
> > Dave, could you queue this after -rc1 is tagged?
> 
> Sure.
> 
> Is there any other TDX stuff that needs to get picked up at the same
> time that's been languishing?

Nothing on my side.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
