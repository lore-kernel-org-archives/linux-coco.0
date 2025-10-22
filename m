Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898132549C
	for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130273; cv=none; b=VqHoWf2H+YXviiBxl/zbQDX7ZsjWq0dIlF1ac/2NN03+WOe7RqBdztUmj5dW8IYSqkM9h1YpxJUyYKNmqPG6sJzVXVSnCvORPPGNleZ90F8NTHPbJKlAuCCSrLf9/jVplJthkFYlytsEbLzdjhbYRYLWQCne0KgjcjBDMRd5KkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130273; c=relaxed/simple;
	bh=pF/xVT4UN7NzJi7rciEEfPX/W9qFlKU61Om4B71XT68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAVgsuZY4ruFqR6uMjXfmF4WDu/+E1KNNGH3+ksFD9Pvd8E7nBbxPpWD/pUVoMt4MyJnTVEXhBOFRfPaRWTGLF855OmsYFKPUBj0zju437e0laQFVJpFILvPO7fjPslrQWMbEkFfC6+GmCq3NXB9UwkH+E+1lS25eywMjGcWbU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=G0C50URP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="G0C50URP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X25SCsaiSRonvvl/CG+yQu5ixS4z/pEGSy33eqjDCw8=; b=G0C50URPMp0H4ySuL/G7LIWhuL
	e1TH6kiUX/Q55KsCKwU2HdNa2wcRxyhQ45rCxRcn6J9Dq6zsAyTv7004aY5Id3oYhrD/N3TvJLP/K
	WBRwwuWHw0XrYwBt+cpzme+2Fz/eg+xZ/PWayjGROulxgHCZqatbDFtQiEjha38ybXvF9PAIybxPo
	MHBlIzSIeSV5geFpb9t4xz87zDGnApR3FxYZH8qAFFdmGmP9f/Mc37o6wi1VrIdK4rsff3HZj4rlz
	RLrVihcz7gIKuVlYGjgBfuz4fOIaaxO+Fr5JHLaKlBuH8XU7ZFTU+RY+zqaSE9TIeYufHgHj3NgFP
	LIfdFx8g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWQp-00000003W8T-0HKy;
	Wed, 22 Oct 2025 10:51:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C3A1730039F; Wed, 22 Oct 2025 12:51:03 +0200 (CEST)
Date: Wed, 22 Oct 2025 12:51:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: "Huang, Kai" <kai.huang@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] x86/tdx: Make seamcall/tdcall CET-compliant
Message-ID: <20251022105103.GZ3419281@noisy.programming.kicks-ass.net>
References: <20251022093644.320207-1-nik.borisov@suse.com>
 <7821da3d359f6df510bba3bc4323ede303dfde3d.camel@intel.com>
 <d8bdeaa7-3bda-43ea-8b98-ef4f23d0e7b8@suse.com>
 <20251022103031.GX3419281@noisy.programming.kicks-ass.net>
 <5e560948-8a71-4b07-8e1a-ed3debdd5540@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e560948-8a71-4b07-8e1a-ed3debdd5540@suse.com>

On Wed, Oct 22, 2025 at 01:48:11PM +0300, Nikolay Borisov wrote:
> > The compiler is clever enough to see that is a direct call of foo.
> 
> Thanks, I verified this, turns out we are using an earlier version of
> 10df8607bf1a ("x86/virt/tdx: Mark memory cache state incoherent when making
> SEAMCALL")

0b3bc018e86a ("x86/virt/tdx: Avoid indirect calls to TDX assembly functions")


