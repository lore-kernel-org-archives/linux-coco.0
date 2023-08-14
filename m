Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB7523D0
	for <linux-coco@lists.linux.dev>; Mon, 14 Aug 2023 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CwtUPOcQ0JSmPG9joS7Jsy94l0Wu6FGllPhroZRoesw=; b=qz0rQNpK8fMbkHdREE5ywA9Z44
	MRZBhwNhNjgiOSISK5PlBdd/8RL2TWqH5NheUcedNazezmmK6/vyyYC3oXcA+/rpLEDwZ+t1cty8v
	zVv9CjI6LMn0m2DiLwBcBoLhUQbRNvGIEPqIiS7y0lArWgxwpxy7kyZ7qaNMz4l25anUv/0vxt58k
	61V9cxRr6FDgVzTpmXSoJJS0lMRY7h85ar5H9D9F8xfHViZ9l+7wYjSdf+Vj7ffEM6nxUn0/jNxFY
	qxWINC1yUtfX8xp+OuKWZzQQMFboa5zwQaHm0hKp6ZATJrR2CPcafi5UWZ2cy1sF6720zQAsLy3KX
	d5t4qY+g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qVVdo-00AYBH-2f;
	Mon, 14 Aug 2023 11:21:45 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3ABA630020B;
	Mon, 14 Aug 2023 13:21:44 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 280B420167A97; Mon, 14 Aug 2023 13:21:44 +0200 (CEST)
Date: Mon, 14 Aug 2023 13:21:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] virt: sevguest: Add TSM_REPORTS support for
 SNP_{GET, GET_EXT}_REPORT
Message-ID: <20230814112144.GF776869@hirez.programming.kicks-ass.net>
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
 <169199901829.1782217.16990408177897780160.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169199901829.1782217.16990408177897780160.stgit@dwillia2-xfh.jf.intel.com>

On Mon, Aug 14, 2023 at 12:43:38AM -0700, Dan Williams wrote:
> +static u8 *sev_report_new(struct device *dev, const struct tsm_desc *desc,

> +			  size_t *outblob_len)
> +{

> +
> +	u8 *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
> +

> +
> +	*outblob_len = size;
> +	no_free_ptr(buf);
> +	return buf;

This seems broken, no_free_ptr(x) is basically xchg(X, NULL) (except no
atomics). So the above would end up being:

	return NULL;

What you want to write is somehting like:

	return no_free_ptr(buf);

or, a convenient shorthand:

	return_ptr(buf);

