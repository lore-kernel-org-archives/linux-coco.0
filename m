Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1FD3D5245
	for <linux-coco@lists.linux.dev>; Thu, 19 Mar 2026 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927195; cv=none; b=NTYzFvR/XbAZEH0i8IfBIJ1/Nx3z/RM2VRdKsl1DBjjocZVJIfQHJV25c+csbk+j9E2Xa4I7zcZF8Hvny8HnoZgUaJKqC3Q4os9/vz4y1hCL1oyLCXFnZHxgU8MbPyEzFadn/TIq77cDte4ZPe8KegqPENBdJdsCURZgqAImfBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927195; c=relaxed/simple;
	bh=Vfe8ULqyqHmbMNbiIFw9HUotmHZ3Q6rw6hBAZNjuGIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V74jd8SDutOBSxGPtEMWiorOKsxXKO6RAV5fzQPL0+Fsmnv0RBBVNRWNa+wtxrQfXCxrfSwdusKeY+3qrBoeFZnGS0hfG9Gsn9oLRinyAy3JP9E6OhZU/SszUa1bnLd/mw3CUyZjaeYQQw8c8UG0dCL/HrAwZ3kFR4hiB2Gxe2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8awRuqW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8awRuqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C5EC4AF0B;
	Thu, 19 Mar 2026 13:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773927195;
	bh=Vfe8ULqyqHmbMNbiIFw9HUotmHZ3Q6rw6hBAZNjuGIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8awRuqWJLn/qSLf63m58he5tNlvK4nG1T29/1IayWn026AXubkVs4Gnxres35gPS
	 x5dnMFfW0SzmXGj+ZgURIB4LNJgaL8LZReo8XAjTVmL+u508HkdaeDnF5eDHzV1710
	 vNJM66FNh5B/3qbKp27TQs5QPtdp3E/xZu7Iz3BtQY7CqzgSJCHMi5W8xjvwPP6BAI
	 yqFZGbEEK+3E4fW9pK9uP91ljwLQrxWsbmChBZ1T0lI0iEmq+yKvTEyfoWducI0rkk
	 45hgDb4l1Uk1j70T9/KLJaZTMB1E/LTAr+gXxfzx4FnsRrUsoZSmxPOxSCQ1yDhOMG
	 8jXpBU4/sY2cw==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5CA11F40068;
	Thu, 19 Mar 2026 09:33:12 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 19 Mar 2026 09:33:12 -0400
X-ME-Sender: <xms:GPu7aYM-PV518PuB9QHFXas8ehEbvw7zsQgK0b1hJ3CFJcSj_PJulg>
    <xme:GPu7afq2-I_eGF_DSALmJlrFZfWKCDwxDlRqYAlgaSEM_1IAw_kVKwmW2dcqb905w
    v0XbEyrhzdwfVXeBDvk3NUETNXQIG4fVxQ5gvkYAB-lTzk8LmR4>
X-ME-Received: <xmr:GPu7aTxWk56JmA7H5xqF-UOEiju8BY82yPBAf_D7gt8f1bNLMGS_56w8HRId4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejudegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:GPu7aRMp2H0y2ZOYUlchNRS9-un8peQtrLmdC4CeTQdfm2wmODDrVA>
    <xmx:GPu7aXCauSg7RZqtJVBhVzmr4qHm5LJwjIxBNpzh4nRVt3KNekrXNg>
    <xmx:GPu7aeWFI4q86SZTx9WptliOSvckfQcEOQq6ffoWvPNAXFCFsT15xA>
    <xmx:GPu7aRIB0GYWq3wUjcZwcEjDuUgk8o23W90TBYt3G_cVSomczotCUw>
    <xmx:GPu7afnMp7FR2SUQ0SZLo-DO7KeU-RW_f7zvbZLSTp8ivKUYzpEzr-4o>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 09:33:09 -0400 (EDT)
Date: Thu, 19 Mar 2026 13:33:04 +0000
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
Subject: Re: [PATCH v5 14/22] x86/virt/seamldr: Do TDX per-CPU initialization
 after updates
Message-ID: <abv7Bb0As6uRk8UY@thinkstation>
References: <20260315135920.354657-1-chao.gao@intel.com>
 <20260315135920.354657-15-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315135920.354657-15-chao.gao@intel.com>

On Sun, Mar 15, 2026 at 06:58:34AM -0700, Chao Gao wrote:
> After installing the new TDX module, each CPU needs to be initialized
> again to make the CPU ready to run any other SEAMCALLs. So, call
> tdx_cpu_enable() on all CPUs.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
