Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CC7349CEF;
	Fri, 22 May 2026 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779467478; cv=none; b=DgSHe9aoF+p0njiLuLbscDKAc0UTXa302OFGp3xVgtxuGvLjWhDGKqcqKa8Jp79Fpfcz04H5zG04juu6AdckEAo4SXcHJw0s9/Li87mtH74aAJj8iU2BF1nqKxjgmL5UGH2JMjx1ymJfGt+menPaaCFOSzEsVX4qpx06c9TsAWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779467478; c=relaxed/simple;
	bh=VuAtt/dzcCHHVMTS0n782wqgyTVqh4zXwzgIZIAF7Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7KieLRw2gU37dYRLEohbiIbL5peIkeYt5eTRkpRTqcmlHDGTgED2BrupZwCSrpRWhkEDg/89cO+ObnWS3nyEOcIHj6mO2Ntv8v3gG8xbJtExkQVYioNRErz6HWguSbIgF8T6El3T/xYixv+AA4cmG+dwvMNNS2FiuVmOw6Sp7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdvrwjlG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdvrwjlG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C151F00ADF;
	Fri, 22 May 2026 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779467477;
	bh=HBXpcrPNB6FEMfdVb7HY+3OOgzcnnLTD6v4nZT5urYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DdvrwjlGN7zLfUbDOXn8o047nIg+D3jyS5hlbUHMz0OE9EDYdbjjO2v4d4Xf3jSwT
	 Oova6a0RmRKwW+WvXR0n2bQr5VK/lCaqVioc/AG/K/kdIFgWsqe2PEDOXSTJUxz0he
	 YVk3cWXiH+v6bS/iOtK8HeiI/XriO2X7HrJDGvjn4Ir8D/47M4K1neTQNiHKQ2nb0h
	 l5EiTx4c0KxBGg9CQGfCRbHznnhXfBBPtokYODcXXPsMWd9GDxRQa9EI6kR1mCIBW0
	 dCLIeMWSp5b6DAw0IKAoWkgDQ+nPwWUWHFll72kaqepOMjUc7ojPkdA3e+U0ovifbb
	 y3BpsnRW3uVhg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9FC22F4007D;
	Fri, 22 May 2026 12:31:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 22 May 2026 12:31:15 -0400
X-ME-Sender: <xms:04QQag0e_bwsHwtp6R1fwWKiAH9vAKvgMx0157TOLnRuZQfVCX8bug>
    <xme:04QQamzHxG8PUUSgyQAIMGGvOy8i3hkUU6BK7sFwj6pxxfbVPWHg_ErJ1gI2oTd6s
    m73Yct1frBRpKrZVzUrszlJb3JJYAjEiUEat_KLzJSNixws8aAzCQ>
X-ME-Received: <xmr:04QQasiOv5tSn78F9Lcmdyp5xMWxdjZDcoJ6gjizgMfgaPUfXl9rdDpUGrDCCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduhedtieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepffffkeegffejgfekvdejgeegtddtleejkefhhfduieduhfeigfduuefghfehffdu
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeiudduiedvieehhedqvdekgeeggeejvdekqdhkrghspeepkh
    gvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopeeg
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephigrnhdrhidriihhrghosehinh
    htvghlrdgtohhmpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehpsghonhiiihhnihesrhgvughhrghtrdgtohhmpd
    hrtghpthhtohepshgvrghnjhgtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtghhl
    gieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepgiekieeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:04QQaqFJOWjrt1qdV1_bSJpheT94SNn5ZgaNt8Hu-n2BmKDIoLL5jg>
    <xmx:04QQahFFHUJXhf_hOFvEsvM13xtQyWIpJrH9vcGcVqvb2kGpx1lvPA>
    <xmx:04QQaq9PXlH8hV20n5ffWBghFZet5uSEFYnS7kGi6gbI-USNYeKaIg>
    <xmx:04QQarS-o1O1hKIM0Vn6C6OvbgyyGc8ezRoZGGTml2tmnoiw9pQrdA>
    <xmx:04QQahP52vMUXcIXTenbdpJu3dFE_a-OCZJxMR4kDmzAKEwMJw3yRTiO>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 May 2026 12:31:13 -0400 (EDT)
Date: Fri, 22 May 2026 17:31:08 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: dave.hansen@linux.intel.com, pbonzini@redhat.com, seanjc@google.com, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	kai.huang@intel.com, rick.p.edgecombe@intel.com, yilun.xu@linux.intel.com, 
	vannapurve@google.com, ackerleytng@google.com, sagis@google.com, 
	binbin.wu@linux.intel.com, xiaoyao.li@intel.com, isaku.yamahata@intel.com
Subject: Re: [PATCH v2 1/4] x86/tdx: Use PFN directly for mapping guest
 private memory
Message-ID: <ahCEoJiTz2lt8bpC@thinkstation>
References: <20260430014852.24183-1-yan.y.zhao@intel.com>
 <20260430014929.24210-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430014929.24210-1-yan.y.zhao@intel.com>

On Thu, Apr 30, 2026 at 09:49:29AM +0800, Yan Zhao wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Remove struct page assumptions/constraints in the SEAMCALL wrapper APIs for
> mapping guest private memory and have them take PFN directly.
> 
> Having core TDX make assumptions that guest private memory must be backed
> by struct page (and/or folio) will create subtle dependencies on how
> KVM/guest_memfd allocates/manages memory (e.g., whether it uses memory
> allocated from core MM, if the memory is refcounted, or if the folio is
> split) that are easily avoided. [1].
> 
> KVM's MMUs work with PFNs. This is very much an intentional design choice.
> It ensures that the KVM MMUs remain flexible and are not too tied to the
> regular CPU MMUs and the kernel code around them. Using 'struct page' for
> TDX guest memory is not a good fit anywhere near the KVM MMU code [2].
> 
> Use "kvm_pfn_t pfn" for type safety. Using this KVM type is appropriate
> since APIs tdh_mem_page_add() and tdh_mem_page_aug() are exported to KVM
> only.
> 
> [ Yan: Replace "u64 pfn" with "kvm_pfn_t pfn" ]
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Link: https://lore.kernel.org/all/aWgyhmTJphGQqO0Y@google.com [1]
> Link: https://lore.kernel.org/all/ac7V0g2q2hN3dU5u@google.com [2]

Acked-by: Kiryl Shutsemau <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
