Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F67100AA
	for <linux-coco@lists.linux.dev>; Mon, 14 Aug 2023 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FsU/kUSJeE4IFdU+pvafaqq9P1yFMndH/wWAsxvd9/4=; b=hakcm+Ofq8QDSIor1cPcv+fxUB
	3xBVCq+UOwwoWJVyBYgzvb+LHSUGtmnhKxXkfr9Vd4C1StQN7XW0mpQUgsT/UPr9ss1uJ4lWjq68H
	ZSN9dFqJPzYQBqd4SlJkf9biaHZ3A5qQ6ZGVRvGVJ2iNiXMCGrNGPYUDZXZJfYI9jC5iJi2aq9ABP
	YcKFAbt2fsiruXQj47BzpFciCMHDH89mu2rjr9QXHYaCrGkhECosDN0uVzK+J5+XRbKDQ1ZGGd1vX
	PuUvw/KHgSrlYcM3J7BaHZ1uwMDrffzwPogOG+L9RjVdf3NRtzO8blptrwaZEUtUZsOuqG/vS54kl
	mA6XxuPQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qVfq4-00AuYL-2V;
	Mon, 14 Aug 2023 22:15:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EE4DC300388;
	Tue, 15 Aug 2023 00:15:03 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id DAB4820E3EFC4; Tue, 15 Aug 2023 00:15:03 +0200 (CEST)
Date: Tue, 15 Aug 2023 00:15:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 5/5] virt: sevguest: Add TSM_REPORTS support for
 SNP_{GET, GET_EXT}_REPORT
Message-ID: <20230814221503.GA919179@hirez.programming.kicks-ass.net>
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
 <169199901829.1782217.16990408177897780160.stgit@dwillia2-xfh.jf.intel.com>
 <20230814112144.GF776869@hirez.programming.kicks-ass.net>
 <64da55624c6c1_2138e294cf@dwillia2-xfh.jf.intel.com.notmuch>
 <20230814164804.GO776869@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814164804.GO776869@hirez.programming.kicks-ass.net>

On Mon, Aug 14, 2023 at 06:48:04PM +0200, Peter Zijlstra wrote:
> On Mon, Aug 14, 2023 at 09:25:06AM -0700, Dan Williams wrote:
> > Peter Zijlstra wrote:
> > > On Mon, Aug 14, 2023 at 12:43:38AM -0700, Dan Williams wrote:
> > > > +static u8 *sev_report_new(struct device *dev, const struct tsm_desc *desc,
> > > 
> > > > +			  size_t *outblob_len)
> > > > +{
> > > 
> > > > +
> > > > +	u8 *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
> > > > +
> > > 
> > > > +
> > > > +	*outblob_len = size;
> > > > +	no_free_ptr(buf);
> > > > +	return buf;
> > > 
> > > This seems broken, no_free_ptr(x) is basically xchg(X, NULL) (except no
> > > atomics). So the above would end up being:
> > > 
> > > 	return NULL;
> > > 
> > > What you want to write is somehting like:
> > > 
> > > 	return no_free_ptr(buf);
> > > 
> > > or, a convenient shorthand:
> > > 
> > > 	return_ptr(buf);
> > > 
> > 
> > Oh, I indeed did not realize that no_free_ptr() had side effects beyond
> > canceling the free when the variable goes out of scope. Will switch to
> > return_ptr().
> 
> Indeed -- ideally no_free_ptr() would be combined with __must_check, but
> I'm not immediately sure how to pull that off. Let me stick that on the
> to-do list.

This seems to actually work. I'll try and write some coherent comments
tomorrow -- it's definitely too late for that now.

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 53f1a7a932b0..162052cef4c7 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -39,8 +39,12 @@
 
 #define __free(_name)	__cleanup(__free_##_name)
 
+static inline __must_check void * __no_free_ptr(void **pp)
+{ void *p = *pp; *pp = NULL; return p; }
+
 #define no_free_ptr(p) \
-	({ __auto_type __ptr = (p); (p) = NULL; __ptr; })
+	((void)__builtin_types_compatible_p(void *, typeof(p)), \
+	 ((typeof(p))__no_free_ptr((void **)&(p))))
 
 #define return_ptr(p)	return no_free_ptr(p)
 
