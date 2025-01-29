Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3347B1B6CEC
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738152639; cv=none; b=AQKJDQuvoDU7ocKTNFk+5ayo0skOhAELOTw6IcstQgb2d0lUDP2vz3uJUWJ/r6q8KiAOXiZMk36A/sPFZBw/s1yE6mgRKid6OWM/qBzeXU3Yc8lXUQEHh/MyglskvzJMpTvXcbdw6QdTexXcBOiikC0+G//DsC93tHYh8VFDNw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738152639; c=relaxed/simple;
	bh=3LhXCAMTkbXxoxSs/tmqxPLvAvC9k7XkreQkUnwVnb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edw85ilyTpwv7288ws8LSep5YyJ65kIRQP4Y8QXvrb9trreyTKYrlqt5ZLkmuiEknPaOUiqGuezoGpzeNaLcxMB+aJPE53fmp1+s3xFLKytm1u8WM4hbhLxDab1hvOixa1lwnBmvAezOUICGtX9ID+Ico4Lc8junPfmykwA9X+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=O9qJgfcv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=0tKxlYud; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="O9qJgfcv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0tKxlYud"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 20490114015E;
	Wed, 29 Jan 2025 07:10:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 29 Jan 2025 07:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1738152636; x=1738239036; bh=1pnP3jBrU9G6i+UVdP0rTJqKQsB6Lxlj
	+SCK0hLd8nU=; b=O9qJgfcvJcPRqnZAn3WKZHAFbGB/y4EmmLORdhGlA0tpH4As
	rYvLnMxc/ooc1oa+gxq/mbE96dqudkIQbAVTWbo2G5ylcLMn43OPSqPzB3r75/bh
	JbUETwCon/xPZDvnpdiB1iOmOa0XFsgNQ2joSHw6rQGC+Njg65u3LQFUEED2+cw6
	/EvDCiyIPCHg4NWUaDv6Z4MTj4v0nhuQFaqCe3D/gqpdLyfavgn9fR92QVaSYBFv
	JeFhOzWpuvouTck0zA2NJfg2xrlMfLuMNPLcAtApKalqvdVyCb1S6cR9aFpUt7qR
	gNhtR2hV5Lyi5+0cB7OlWMvLZa7Pm+IHYujXSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738152636; x=
	1738239036; bh=1pnP3jBrU9G6i+UVdP0rTJqKQsB6Lxlj+SCK0hLd8nU=; b=0
	tKxlYudi+vtT9urvvt68/yOkgxc9wVxryiak7IOsxZ4JfsaZ2LvgVQFD0qiLfrL4
	0/ifXGqgmXR4sOlHj5YGZfchJtYC9mYu+LqukLSxTCq0KQ6Y3pCKzXR55c570BDD
	nQ9xVfS2qX8dDfqsXWEQlgBnZAf89YHGoc+HX8FPhbsKen1fmcK5aRwzPm6F1Y/m
	V0jlbtIQzyzwZK9fI5r1jqABTO0TD6pmK7EjxH3y1oE4bmrKcRwzklhqZRDLHYfl
	WB+Mf1iQft2HxntjJPG5l+28h6aOXlmsAOwZFVmJRTnjtgDGvlWOUZOR0GAIiJGu
	jNQ+xPkY8tSjsC7lzBl9w==
X-ME-Sender: <xms:uxqaZ2Dczh3RTuAHB3xXNRU44MuovKZderH76AFKxvXFbeFzaz91lw>
    <xme:uxqaZwgxiDvNFBYD7kHl9hA8x61FWFeU0eHWG09LM7eKF2IJOHoNgoXfWxfrFbgO7
    HQbsrURTXbXxJZVGwc>
X-ME-Received: <xmr:uxqaZ5loys8HVs43Mc3nK9dwJlpOKZApkdoC0SNonN2xlC_Xq6otqGDbkJiDG5UGOeLDyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkefstddttdej
    necuhfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllh
    esshhhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepgeeuveeiffegueff
    jeffudeufeegkeeiheeugfeklefhhfevvdfhtdfhfeektdehnecuffhomhgrihhnpehirh
    hqrdhsrghfvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvgdpnhgspghrtghpthhtohepud
    eipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsvggrnhhjtgesghhoohhglhgv
    rdgtohhmpdhrtghpthhtohepvhgrnhhnrghpuhhrvhgvsehgohhoghhlvgdrtghomhdprh
    gtphhtthhopegurghvvgdrhhgrnhhsvghnsehinhhtvghlrdgtohhmpdhrtghpthhtohep
    giekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvggu
    hhgrthdrtghomhdprhgtphhtthhopegvrhguvghmrghkthgrshesghhoohhglhgvrdgtoh
    hmpdhrtghpthhtoheprggtkhgvrhhlvgihthhnghesghhoohhglhgvrdgtohhmpdhrtghp
    thhtohepjhigghgrohesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:uxqaZ0xrF7MaiIEVbLH-fNNm4ZHrPTi_NBvReYlg8yl29I3Ir2uZ2w>
    <xmx:uxqaZ7S7slmLYf1ln84M-dvO21dqaDEZg4nhUeTlZxRQ3sZ8_L2zQw>
    <xmx:uxqaZ_Y_lGiFnQpbq8h_Paz6rAKT_J5efSz1LifXutd7Z9QWNQKF3A>
    <xmx:uxqaZ0TR-3Xklv5_0wzB66CxI9TlAyW5MhcEXuY7zLyfOTXmvXA_rg>
    <xmx:vBqaZ8B-LCjInXNEOS9--5wAWtfUmSjnz_0QnSmaOA06BA4-rJUHBfYm>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jan 2025 07:10:30 -0500 (EST)
Date: Wed, 29 Jan 2025 14:10:26 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>, 
	Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	pbonzini@redhat.com, erdemaktas@google.com, ackerleytng@google.com, jxgao@google.com, 
	sagis@google.com, oupton@google.com, pgonda@google.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com
Subject: Re: [PATCH 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt
Message-ID: <slfw63tenzxur6fvfjf6ni3lp2exqcpzodgetx6p5eqchw66y3@oqjvn6ezgmod>
References: <20250128213652.1880545-1-vannapurve@google.com>
 <4e07bbe6-9f74-45e5-b8d4-f992d2be78fc@intel.com>
 <CAGtprH_1hc35um_47n=TMJzXAvpa7LY6kyXUafjJt3sPCosC_w@mail.gmail.com>
 <Z5l6L3Hen9_Y3SGC@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5l6L3Hen9_Y3SGC@google.com>

On Tue, Jan 28, 2025 at 04:45:35PM -0800, Sean Christopherson wrote:
> On Tue, Jan 28, 2025, Vishal Annapurve wrote:
> > On Tue, Jan 28, 2025 at 2:08 PM Dave Hansen <dave.hansen@intel.com> wrote:
> > > Do you have any thoughts on why nobody has hit this up to now? Are TDX
> > > users not enabling PARAVIRT_XXL? Not using ACPI?
> > 
> > This has been a long-standing issue which would show up visibly with
> > certain workloads where vcpus hit idle loop quite often during the
> > runtime. I was only able to recently spend some time towards
> > understanding the cause properly.
> 
> ...
> 
> > > > @@ -1083,6 +1089,15 @@ void __init tdx_early_init(void)
> > > >       x86_platform.guest.enc_kexec_begin           = tdx_kexec_begin;
> > > >       x86_platform.guest.enc_kexec_finish          = tdx_kexec_finish;
> > > >
> > > > +#ifdef CONFIG_PARAVIRT_XXL
> > > > +     /*
> > > > +      * halt instruction execution is not atomic for TDX VMs as it generates
> > > > +      * #VEs, so otherwise "safe" halt invocations which cause interrupts to
> > > > +      * get enabled right after halt instruction don't work for TDX VMs.
> > > > +      */
> > > > +     pv_ops.irq.safe_halt = tdx_safe_halt;
> > > > +#endif
> > > The basic bug here was that there was a path to a hlt instruction that
> > > folks didn't realize. This patch fixes the basic bug and gives us a nice
> > > warning if there are additional paths that weren't imagined.
> > >
> > > But it doesn't really help us audit the code to make it clear that TDX
> > > guest kernel's _can't_ screw up hlt again the same way.  This, for
> > > instance would make it pretty clear:
> > >
> > > static __always_inline void native_safe_halt(void)
> > > {
> > >         if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
> > >                 tdx_safe_halt();
> 
> This incorrectly assumes the hypervisor is intercepting HLT.  If the VM is given
> a slice of hardware, HLT-exiting may be disabled, in which case it's desirable
> for the guest to natively execute HLT, as the latencies to get in and out of "HLT"
> are lower, especially for TDX guests.  Such a VM would hopefully have MONITOR/MWAIT
> available as well, but even if that were the case, the admin could select HLT for
> idling.
> 
> Ugh, and I see that bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests")
> overrides default_idle().  The kernel really shouldn't do that, because odds are
> decent that any TDX guest will have direct access to HLT.  The best approach I
> can think of would be to patch x86_idle() to tdx_safe_halt() if and only if a HLT
> #VE is taken.  The tricky part would be delaying the update until it's safe to do
> so.

I am confused. HLT triggers #VE unconditionally in TDX guests. How would
TDX guest have direct access to HLT?

Even if it would in the future, it is going to explicit opt-in from the
guest and we can avoid setting x86_idle() for such cases.

> As for taking a #VE, the exception itself is fine (assuming the kernel isn't off
> the rails and using a trap gate :-D).  The issue is likely that RFLAGS.IF=1 on
> the stack, and so the call to cond_local_irq_enable() enables IRQs before making
> the hypercall.  E.g. no one has complained about #VC, because exc_vmm_communication()
> doesn't enable IRQs.
> 
> Off the top of my head, I can't think of any flows that would do HLT with IRQs
> fully enabled.  Even PV spinlocks use safe_halt(), e.g. in kvm_wait(), so I don't
> think there's any value in trying to precisely identify that it's a safe HLT?

I can only think of "CPU is dead" use-case of HLT where interrupts are
enabled. But I hate special-casing HLT in exc_virtualization_exception() :/

> E.g. this should fix the immediate problem, and then ideally someone would make
> TDX guests play nice with native HLT.

I've asked (some time ago) TDX module folks to provide interruptibility
state as part of the guest so we can handle STI shadow properly, not as a
hack around HLT.

The immediate problem can be addressed by fixing the BIOS to not advertise
C-states (if I read the situation right).

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
