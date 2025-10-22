Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908AF2F363C
	for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 11:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131960; cv=none; b=Uqx30nd5dCv7DM+15Ffb6yuEkdb4pxu4Aj2y1l+xOUCgkEYauOZzaEeG8J9OlpZD13cSO13cu835JWGykZPnbwk6IDRHjL7PoGX+BihiSZBoI0w5NrbI2JUVgSmFaOBdMoB4vGklmAO4fKhpgCO/4H0iPii2yWUio+fqWWrst28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131960; c=relaxed/simple;
	bh=zAjKC7J4vEp8iAIUwMxDGkOJNcFXB0TklT//QrvZRDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0YVTKeNuyZFzEfvWAWWuZRgCMiR92E7b6jYtJzXaIYdHdlL+ru6imTpO3xzhOwoR6/+9CFDrxAe8jYWNYS8U7ksCGWZLBUhfoMsCOJfO+1HirWk2c04CmEg/nwiZYbJZYnPgszR6ZO3w5wTxL5eBTCDXAI05bXPAaUC4VeEymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=obPhuMJr; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="obPhuMJr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ThMsm10o+ftSyWGKlvrtb5hvEm7Npnt62djFHRE10gw=; b=obPhuMJrribmV6nIPguye/fVbU
	oYy1yywuxQ/VdTzyJBZU6B4f7kfmYrb9ihbvEO2hzTL+jPcc6fEO9e+IKzx5NhTIYiCtDr0hLsk6W
	ctRyzcnDqWcouUjvMhxfqTSqlDFxYIKqAk6ABXqvT1h9U0ZzRpWtZxtQn36EY+uGWDS7H/mFjIvng
	5/viq4JIoNVNbCovZS4BQqOiU2gA6023szTIOwwhG+/AQGj9zWeuyRX6rC3+KtAjDQYSDiM+duE+z
	gCLd+/7v85UTsacDbKM7Lx9cEaItfkWoRmy1IdTU+/DpDxcNe7SVoKBJ0iW9AXCEDdI+Wf67yKHdc
	LvSPT08A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWs6-00000003xZb-13oO;
	Wed, 22 Oct 2025 11:19:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6B6FE30039F; Wed, 22 Oct 2025 13:19:14 +0200 (CEST)
Date: Wed, 22 Oct 2025 13:19:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: "Huang, Kai" <kai.huang@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] x86/tdx: Make seamcall/tdcall CET-compliant
Message-ID: <20251022111914.GM4067720@noisy.programming.kicks-ass.net>
References: <20251022093644.320207-1-nik.borisov@suse.com>
 <7821da3d359f6df510bba3bc4323ede303dfde3d.camel@intel.com>
 <d8bdeaa7-3bda-43ea-8b98-ef4f23d0e7b8@suse.com>
 <20251022103031.GX3419281@noisy.programming.kicks-ass.net>
 <5e560948-8a71-4b07-8e1a-ed3debdd5540@suse.com>
 <20251022105103.GZ3419281@noisy.programming.kicks-ass.net>
 <9d93a6a5-a431-4548-ac1c-0e1e5a214dc3@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d93a6a5-a431-4548-ac1c-0e1e5a214dc3@suse.com>

On Wed, Oct 22, 2025 at 02:10:45PM +0300, Nikolay Borisov wrote:
> 
> 
> On 10/22/25 13:51, Peter Zijlstra wrote:
> > On Wed, Oct 22, 2025 at 01:48:11PM +0300, Nikolay Borisov wrote:
> > > > The compiler is clever enough to see that is a direct call of foo.
> > > 
> > > Thanks, I verified this, turns out we are using an earlier version of
> > > 10df8607bf1a ("x86/virt/tdx: Mark memory cache state incoherent when making
> > > SEAMCALL")
> > 
> > 0b3bc018e86a ("x86/virt/tdx: Avoid indirect calls to TDX assembly functions")
> 
> We have that, but as it turns out it's not sufficient, we need
> __seamcall_dirty_cache to also be __always_inline as it also has an indirect
> call in it.

Right, so that commit does the __always_inline and explains why, and
then the other commit just copies the __always_inline.
