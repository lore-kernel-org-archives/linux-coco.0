Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2863E3B2FD9
	for <linux-coco@lists.linux.dev>; Wed, 18 Mar 2026 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831533; cv=none; b=Eq4+Ev3kOLy51KDliIKZ43NtJKu9HoPI90azrCReetUUE7sxdpJYrSnKZI3/e0KPuc/Y44Hj2uThRZTYCzX5DnzU497LQhz/z6U4Km/eKUztWUhuzAp9Qj4WIgbegRV6UY2kKbJJsZ6+yo+UXO9LD7I/MfWdfC4E2pCA9lz04uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831533; c=relaxed/simple;
	bh=p2jBKMiGYkYgEeNXsJreklTsyyl9Kb+6pJjVfF66qec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDgUBPwK6RRGvYLCZ14jHV//mQuz58FPkOY6fICm2xM6BSJIz2fpIZGKGbLgykR4UIu+H8Tc5Vu7odK/+CnZ9KjLrSSexdBLxrgv9Ee/BnufR32HhyqPeTNoMDsWfU/l2e5i05wLPOyRRoNVE2IonGzqeyGthUoNvBIvQAol7FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3qsFYK8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3qsFYK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE670C19421;
	Wed, 18 Mar 2026 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831532;
	bh=p2jBKMiGYkYgEeNXsJreklTsyyl9Kb+6pJjVfF66qec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3qsFYK85Bm0VBFDgGZsxdnyAykRaNm2g2uRZfJTcZDi6ZC1Y5aIGdR3GAbgDTmNH
	 Hgy+PJ85NT8PcReeLyRJHqWgv0OUz2acbit2xTse6RD4ck7WtVAFxaAadq+F6EWw+e
	 b4SG2Nq3BDx8bZJIDg6jnhIu1ac6Wj9NK15m/DJ/NzcT/ZCUkVv3NLucBkWIgLfT7P
	 zyuc6bBL6mGkxgF3yuKQ34HHObLBrwYSAnNARYk4apG+z24COdDvxHt5/S205X4/3n
	 b7u52QCfB73lZbg1ucllp8nW6/XA4/nesYAHpfFEzrIbKQ+BmcPj6E9wSGLpEzjcYV
	 IxEIKdNxcnmkQ==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id DBCDDF40085;
	Wed, 18 Mar 2026 06:58:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 18 Mar 2026 06:58:50 -0400
X-ME-Sender: <xms:aoW6ab7SUFEhqM9NWURgvZ_sHtUOCtxfu4t5FlTTBtPVStP6pDJVeg>
    <xme:aoW6aRnW33YsbVaYoGKPcZCr6Rk5ZrEXdOV6PzZMKhz2B6fENYzQZ0GKfRrGR8nJq
    hsCo_75dUx3Wa3HO1wWiqQwJ9I8NNJRwsyWdOTWmdcIF2xDsHy4JqCg>
X-ME-Received: <xmr:aoW6aW9whSe42eWgDeJl5Kq6p4oGR7chSGt2jZ4VbM8o3lH2L8TKNYjxSz_95w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdefleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohephedtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegthhgrohdrghgrohesihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgtohgtoheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehkvhhmsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghinhgsihhnrdifuheslhhinhhu
    gidrihhnthgvlhdrtghomhdprhgtphhtthhopegurghnrdhjrdifihhllhhirghmshesih
    hnthgvlhdrtghomhdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhi
    nhhtvghlrdgtohhmpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
    dprhgtphhtthhopehkrghirdhhuhgrnhhgsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:aoW6acoie7GL4I_S2Z4BAPAf5cs0LJ92lUWUtbo5becHFMcu3jq5bQ>
    <xmx:aoW6aVtXLHiF8t-LCYVJiK0TJSZTPagK-z-qdBnJiL7RYKi34j2eLw>
    <xmx:aoW6afQXXWYNlg27MLIoGYhvtVxR6tlm-ePlyh4LcVheCgE1RqmNsA>
    <xmx:aoW6aXWrYIxygT6QSHpcFUH_-TY-51wUDzza_z4Mrxk_eHtXswgoWw>
    <xmx:aoW6aSBLmZZebujhUFKDFJS01f0auFT4TUKDqn31PRBihM13_oa4NzCG>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 06:58:48 -0400 (EDT)
Date: Wed, 18 Mar 2026 10:58:44 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, binbin.wu@linux.intel.com, dan.j.williams@intel.com, 
	dave.hansen@linux.intel.com, ira.weiny@intel.com, kai.huang@intel.com, nik.borisov@suse.com, 
	paulmck@kernel.org, pbonzini@redhat.com, reinette.chatre@intel.com, 
	rick.p.edgecombe@intel.com, sagis@google.com, seanjc@google.com, 
	tony.lindgren@linux.intel.com, vannapurve@google.com, vishal.l.verma@intel.com, 
	yilun.xu@linux.intel.com, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v5 08/22] x86/virt/seamldr: Allocate and populate a
 module update request
Message-ID: <abqFJZo632DAFsl_@thinkstation>
References: <20260315135920.354657-1-chao.gao@intel.com>
 <20260315135920.354657-9-chao.gao@intel.com>
 <abkvOYQIi2RvEYh8@thinkstation>
 <abpnWkENgaWoofZV@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abpnWkENgaWoofZV@intel.com>

On Wed, Mar 18, 2026 at 04:50:34PM +0800, Chao Gao wrote:
> >> +	ptr = sig;
> >> +	for (i = 0; i < sig_size / SZ_4K; i++) {
> >> +		/*
> >> +		 * Don't assume @sig is page-aligned although it is 4KB-aligned.
> >> +		 * Always add the in-page offset to get the physical address.
> >> +		 */
> >
> >I don't follow this. If @sig is 4k aligned in VA, it is page aligned.
> 
> Dan's concern was that PAGE_SIZE is not guaranteed to be 4096.
> 
> I agree that PAGE_SIZE is 4K on x86 today. But to address that concern, I saw
> two options:
> 
>   1. Add WARN_ON_ONCE(PAGE_SIZE != SZ_4K), or
>   2. Handle it as in the code above.
> 
> I didn't find existing code using option 1 in x86, so I chose option 2.

Please, make it clear in the comment that you are talking about PAGE_SIZE != SZ_4K.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
