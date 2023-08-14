Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC13CC139
	for <linux-coco@lists.linux.dev>; Mon, 14 Aug 2023 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8vjO5Vr4Iqwx53G4DlA4xQ/SuWmPFnqZp5UxmWeGppI=; b=GXcBKaGCu9y4BHouwwR94uvv3V
	GAKOL5U01e+9yy24mEyYKD8lM2LNFW8JuijYmcF9iaU8VcfVHT5EyCjp1uRVS7ZTV7ey769Qo7Z2l
	KqUBcyWiXY7llr+inmGpNJVx2ubEaEmdV6bEvExbjTplgVYQJPDXkJfcQVqjORrfaDFe27nwwJp2e
	qh5z9lUWYwZsGC/gHp0HHaAMu4iP7VLiTqBbEVhQ75bopT2QRQZSDB4mkqQ9gFYmayqtjhh2NW29c
	QUe/ULPnHCjDpXoYbv5agkS9oAXcXFijazUaCBm38tjLhwEC9bH1NbIFL7AYhL9tOSBKm4yOMat+c
	/ivwwvAg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qVaG3-002wjc-UG; Mon, 14 Aug 2023 16:17:32 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7BC3230020B;
	Mon, 14 Aug 2023 18:17:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5F844202C2249; Mon, 14 Aug 2023 18:17:31 +0200 (CEST)
Date: Mon, 14 Aug 2023 18:17:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] mm/slab: Add __free() support for kvfree
Message-ID: <20230814161731.GN776869@hirez.programming.kicks-ass.net>
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
 <169199901230.1782217.9803098171993981037.stgit@dwillia2-xfh.jf.intel.com>
 <2023081449-blurry-bath-248e@gregkh>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081449-blurry-bath-248e@gregkh>

On Mon, Aug 14, 2023 at 05:31:27PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 14, 2023 at 12:43:32AM -0700, Dan Williams wrote:
> > Allow for the declaration of variables that trigger kvfree() when they
> > go out of scope.
> > 
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> >  include/linux/slab.h |    2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > index 848c7c82ad5a..241025367943 100644
> > --- a/include/linux/slab.h
> > +++ b/include/linux/slab.h
> > @@ -746,6 +746,8 @@ static inline __alloc_size(1, 2) void *kvcalloc(size_t n, size_t size, gfp_t fla
> >  extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize, gfp_t flags)
> >  		      __realloc_size(3);
> >  extern void kvfree(const void *addr);
> > +DEFINE_FREE(kvfree, void *, if (_T) kvfree(_T))
> 
> No need to check _T before calling this, right (as was also pointed out
> earlier).

Well, that does mean you get an unconditional call to kvfree() in the
success case. Linus argued against this.

This way the compiler sees:

	buf = NULL;
	if (buf)
		kvfree(buf);

and goes: 'let me clean that up for you'. And all is well.


