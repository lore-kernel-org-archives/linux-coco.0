Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8B19D086
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738147060; cv=none; b=K/7wOpd6yB1xxNd2nx2gypAuqaJwwy+9ayhZ1o3Z+O3o/yTAuwSRQ0PA/0AS6Oh5e/KOxJ08E0BhkV+BH0OKk7K9LEgl7bXyHyY7VojMxl/RbEzSmjFpydMCmwB8Wv9sL+cSCvnX/pxTosrAfgVIgnjIZeowpebDd/EIVZbjBPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738147060; c=relaxed/simple;
	bh=dNlbhYl31fHVmWNReadnGtF4atreASpiJ/CwVhae1Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WI1BTQa+FwEVFmWOUfqtvHpbx9ACJdfw9pTk9xAvf5Qc6iJhZ2xeG9iXEIZdsm/GbBEFSMq6yQ4aw7l3GdEt1i6zmGRP4CwzaYsoXj9eDepva4rzQHutk9pspdGySStIZXt+VGsk/swupV6iNN8d7gyb7emfhuQFCqr6+sbfcwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=JU/wSTE3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DwaRUCIz; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="JU/wSTE3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DwaRUCIz"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1312211401C0;
	Wed, 29 Jan 2025 05:37:37 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 29 Jan 2025 05:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1738147057; x=
	1738233457; bh=LF0dKqT96peauPh1Fyit0yCbdG6syUpxpWqJiCMycpU=; b=J
	U/wSTE3FBR7mUzPe9+u/xmsbZaeDYNc3eHQCb5JOmzMpOBkN7db5Cn39wHjPA79s
	6eNAmOsSDaLSbDCebcgATusQFuLldQnzgjbp/m+m7MrrD45jDq0oBqp8w/72Q/95
	trJQwLgfP8qafh/xOdMeG2P36SGki7ChCUbiixVV3y6JKhqNJo9G+cbsQisMYLXv
	wkj6HFFuqR3z3pO3h65PNtgbzq55ohC0sLwqnzVOtWBsqUR82bWhb0L1gPhL6sA5
	PWaRLY6rk9WOKiaj5SSIydpSvH33lMVNX6ctWMagcnTAJ2GT7CRsYPwg0zeYNZGN
	/MxsLLr8pPxDc9mVZaVag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738147057; x=1738233457; bh=LF0dKqT96peauPh1Fyit0yCbdG6syUpxpWq
	JiCMycpU=; b=DwaRUCIzq0iYAdQnqzILUP8wJoWgJcQgc/8dP7DOniuws6M2/B2
	i9xaR15plwbJE2I2C9qVMmtcdFuEMWQxlUDcHjBXWunV1te2gZ9R9J75HU/j/lz1
	zr0sIl7FVZn/tCsrTe6Ds9giBWns0OlV1XAFSKCJ7zOAOTEM/0M9dKDXlMoOPG8i
	ZcHulQbl3ZDXaZqZ55viGOAxGN8dNMULvinF1ks85/r8eEVN4qdpSaLZ4yRzU0lB
	OXxitV+vA+o91qdtYg7ZzBASlykeCNhCMSS1s/T1vP/+Lsg4f+QRQtgaXrVdFer5
	Qxjp0zGbvoeGwla/O+3FT8l5BKwLA5EX3Hg==
X-ME-Sender: <xms:8ASaZ3vp6RTPThe3Wnf_-nsNsNwn9i09_M5Yw6ETOYGe6ehloOrhwQ>
    <xme:8ASaZ4cHtz7-owfWO9SEHwurqrJ3ZHi1-_IbDaUPWpLf9OQIKFz5Ol-UiHYt0jJQM
    0asLW5vDt3mHjtd5A0>
X-ME-Received: <xmr:8ASaZ6zWhR64sngK601C948uIAfMdKAzkqOpt5KnwVVmlw9LL7lkuSQHIPbDBVyVhlJTZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvden
    ucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlse
    hshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfhhfff
    veelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhv
    rdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehvrghnnhgrphhurhhvvgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepgiek
    ieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgr
    thdrtghomhdprhgtphhtthhopehsvggrnhhjtgesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepvghruggvmhgrkhhtrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopegrtghk
    vghrlhgvhihtnhhgsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjgihgrghosehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehsrghgihhssehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:8ASaZ2NbTpFRim4E5MFO68aSsINvtdiTll-XYEIDXUz2vk9rQy4iwg>
    <xmx:8ASaZ3-f_5l27uHjW_O6xSoCxCbi4LiWir7VB0-rzCAY4SUolBTiIg>
    <xmx:8ASaZ2WfHedx_i2tYKQCuKloRQTXGcHOWQm0diCzxYEC1Q6Vj8Dcyg>
    <xmx:8ASaZ4cti_4jTBk9Wlh22TAaTjPGdSCjLcbMwLWG5sxxkaNDYz3htw>
    <xmx:8QSaZ-caC4q_xDMLciCA6j6xBfJkhQjvzfyGrMWz3uUDWYyFAlJIdK-l>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jan 2025 05:37:31 -0500 (EST)
Date: Wed, 29 Jan 2025 12:37:27 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Vishal Annapurve <vannapurve@google.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, jxgao@google.com, 
	sagis@google.com, oupton@google.com, pgonda@google.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com
Subject: Re: [PATCH 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt
Message-ID: <sbcyntzl2z3egouaysbd7ua3obldyl7ukpwvy5jehnq5vcke7p@i27u43q7x2rb>
References: <20250128213652.1880545-1-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128213652.1880545-1-vannapurve@google.com>

On Tue, Jan 28, 2025 at 09:36:52PM +0000, Vishal Annapurve wrote:
> Direct HLT instruction execution causes #VEs for TDX VMs which is routed
> to hypervisor via tdvmcall. This process renders HLT instruction
> execution inatomic, so any preceeding instructions like STI/MOV SS will
> end up enabling interrupts before the HLT instruction is routed to the
> hypervisor. This creates scenarios where interrupts could land during
> HLT instruction emulation without aborting halt operation leading to
> idefinite halt wait times.
> 
> x86_idle is already upgraded to invoke tdx_safe_halt to avoid such
> scenarios, but it didn't cover pvnative_safe_halt which can be invoked
> using raw_safe_halt from call sites like acpi_safe_halt (acpi_pm
> subsystem). This patch upgrades the safe_halt executions to use
> tdx_safe_halt.

The question is why acpi_safe_halt() is ever called.

It only supposed to be called if the CPU supports C-states. See
pr->flags.power check in acpi_processor_power_init().

pr->flags.power is zero for me.

Maybe your BIOS is broken and enumerates C-states. I don't see how
C-states make sense for VMs.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
