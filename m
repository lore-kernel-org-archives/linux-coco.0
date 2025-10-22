Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691412BCF7F
	for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761129044; cv=none; b=rGFgcD4dv9/OI3a2rVtw9/jMQB484imIKZl8GQ70sOh2qQSufYMPECen0mbrmTVYLAQEdcpXQziUmARLMWFyof5TwDGicdu15FlnEkm+MpvdqG0y+dwBx8ie1P8X4bJO7QKomFjXtwVJ6oqc1aC3IpnL6XHE9pEMDiuF8ZUb6eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761129044; c=relaxed/simple;
	bh=AtVzgtEYptB+vN8ZhDkUDCp0aV+Fk9CGqGuWi3YJUoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4JitEyNERL02lD9EFbhpxusH7CY1nQupMJteIgPsD5UfLCXHL8nnn96GzQjWMLv7SaE77pYTUXrlQehKAl31/8cH67QdOqxZUo8q/w140hRxaviCUDCtancVCIHzfTOQ4O7b1AtoLDofA1QXDYD2//qdFqwcYhQBr/6uRLGgLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mXVWrePA; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mXVWrePA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uNKIk35/eyByCH4WmhvYvjfoTgmk3aY+AVrFhrZJF5E=; b=mXVWrePAWf0sdmiR6p6fM7vrFA
	JcjbSn084yiQia9EUMi/t1Oac2zIsDL8kyhIeLs7x7+sTfXZOirg+xP2mwccDJjxpYrs9wvH9GTUl
	7WalpsuBWZqQ9g0358eyz2mPVdudy1WdGYkYaNwb1wzy8zvNqFJZOzJ5vnlTZZA0TvBEiV7WRaTjR
	HCC1V0ktdYkeOZiYHtOEtpI+0uoErSzzP7twAjrp73REfPuLjrkESpg4TaGjeBWhvVutjp/xpfNX7
	kM+hvGEfBDcnsA2yaWDhkkeupT6B8Mkl4rjof5GWuRmIytBDgfLq5jO21WkmnbW/uHfZr4+xX/iWT
	gHaVo4og==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW6x-00000003AVH-1ycr;
	Wed, 22 Oct 2025 10:30:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 95AED30039F; Wed, 22 Oct 2025 12:30:31 +0200 (CEST)
Date: Wed, 22 Oct 2025 12:30:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: "Huang, Kai" <kai.huang@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] x86/tdx: Make seamcall/tdcall CET-compliant
Message-ID: <20251022103031.GX3419281@noisy.programming.kicks-ass.net>
References: <20251022093644.320207-1-nik.borisov@suse.com>
 <7821da3d359f6df510bba3bc4323ede303dfde3d.camel@intel.com>
 <d8bdeaa7-3bda-43ea-8b98-ef4f23d0e7b8@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8bdeaa7-3bda-43ea-8b98-ef4f23d0e7b8@suse.com>

On Wed, Oct 22, 2025 at 01:21:25PM +0300, Nikolay Borisov wrote:
> 
> 
> On 10/22/25 13:14, Huang, Kai wrote:
> > On Wed, 2025-10-22 at 12:36 +0300, Nikolay Borisov wrote:
> > > _seamcall/_ret/_saved_ret can be the target of indirect calls via
> > > sc_retry_prerr/__seamcall_dirty_cache so on machines with CET enabled
> > > such call chains result in a  splat and a BUG():
> > > 
> > 
> > [...]
> > 
> > > 
> > > Fix it by adding an ENBDR in TDX_MODULE_CALL macro to cover all
> > > cases.
> > > 
> > > Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> > > ---
> > > 
> > > The kernel this was observed is a SLE, however it contains the current upstream
> > > TDX patches. And looking at the usptream code the problem persists there as well.
> > 
> > Does your kernel contain commit 0b3bc018e86af ("x86/virt/tdx: Avoid
> > indirect calls to TDX assembly functions")?
> > 
> > Some history about this commit:
> > 
> > I firstly found __seamcall*() could be indirect calls in some randconfig
> > when building the kernel, and tried to resolve it by (effectively) adding
> > ENDBR:
> > 
> > https://lore.kernel.org/lkml/20250604003848.13154-1-kai.huang@intel.com/
> > 
> > Peter suggested that we could use __always_inline to keep compiler from
> > generating indirect calls (which resulted in the above commit):
> > 
> > https://lore.kernel.org/lkml/20250605145914.GW39944@noisy.programming.kicks-ass.net/
> > 
> > I never met __tdcall*() could be indirect calls, though.
> 
> Well, adding __always_inline to sc_retry means it will be inlined, but
> inside the body of the function you do have:
> 
> __seamcall_dirty_cache (which is also always inlined) but in it you have:
> return func(fn, args);
> 
> So you still have this indirect call, no ?

If you do always-inline, the function argument can be constant
propagated, and thus func will be a known function and not result in an
indirect call.

That is:

void foo(void);

__always_inline void bar(void (*func)(void))
{
	func();
}

void ponies(void)
{
	bar(&foo);
}

The compiler is clever enough to see that is a direct call of foo.
