Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9315B2F44
	for <linux-coco@lists.linux.dev>; Mon, 14 Aug 2023 16:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t/aMvEKxZlkEkkm/kv8bnjK958eqXnXEqFiZGAymM0M=; b=u9+XebU3VV3/lBF4zMtrhG+MdS
	MNg2Hvb/KI44WXA6gFaOpCoV5+RyP4450OfOInYRHUFp79oscuIuWSi3PMh64OX2BBUY49KbUFfda
	CUxo1Z3IuWCx7anDXxTbxVBU4QYqnzWzf4+q23djUMEbr3BY7MjqxA2hTL/TL5ExZwbFtPT5e+KnF
	dxRX02fpW/qkAX+14RTWWS5tLKZ3PIlruBhE+B6wvuwlZSiy49g4qbWioeguficpk/q2uW9FXJhgZ
	+aALCIo/S3WMauolPjLgt47gU8p5/grpywGOk199xPBwxNXEmJICBtRlUbg2ryaQ89YP4mhOxG9N4
	eYKI7/Yg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qVajd-0035P9-5H; Mon, 14 Aug 2023 16:48:05 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9CF3B30020B;
	Mon, 14 Aug 2023 18:48:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8538A202C224A; Mon, 14 Aug 2023 18:48:04 +0200 (CEST)
Date: Mon, 14 Aug 2023 18:48:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] virt: sevguest: Add TSM_REPORTS support for
 SNP_{GET, GET_EXT}_REPORT
Message-ID: <20230814164804.GO776869@hirez.programming.kicks-ass.net>
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
 <169199901829.1782217.16990408177897780160.stgit@dwillia2-xfh.jf.intel.com>
 <20230814112144.GF776869@hirez.programming.kicks-ass.net>
 <64da55624c6c1_2138e294cf@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64da55624c6c1_2138e294cf@dwillia2-xfh.jf.intel.com.notmuch>

On Mon, Aug 14, 2023 at 09:25:06AM -0700, Dan Williams wrote:
> Peter Zijlstra wrote:
> > On Mon, Aug 14, 2023 at 12:43:38AM -0700, Dan Williams wrote:
> > > +static u8 *sev_report_new(struct device *dev, const struct tsm_desc *desc,
> > 
> > > +			  size_t *outblob_len)
> > > +{
> > 
> > > +
> > > +	u8 *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
> > > +
> > 
> > > +
> > > +	*outblob_len = size;
> > > +	no_free_ptr(buf);
> > > +	return buf;
> > 
> > This seems broken, no_free_ptr(x) is basically xchg(X, NULL) (except no
> > atomics). So the above would end up being:
> > 
> > 	return NULL;
> > 
> > What you want to write is somehting like:
> > 
> > 	return no_free_ptr(buf);
> > 
> > or, a convenient shorthand:
> > 
> > 	return_ptr(buf);
> > 
> 
> Oh, I indeed did not realize that no_free_ptr() had side effects beyond
> canceling the free when the variable goes out of scope. Will switch to
> return_ptr().

Indeed -- ideally no_free_ptr() would be combined with __must_check, but
I'm not immediately sure how to pull that off. Let me stick that on the
to-do list.
