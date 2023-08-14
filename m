Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A316BA48
	for <linux-coco@lists.linux.dev>; Mon, 14 Aug 2023 15:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9035AC433C8;
	Mon, 14 Aug 2023 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692027089;
	bh=ip3+cm13zLW6dvsTq9Z9JEf7+UFKB7pZ0HPMZ31F96E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXgM87KHqQVpjShJhCTHZ2huuxusSIMml7y57itXxPEtPIzylX8NPuCRgfqRrSnCL
	 BYUaCoeK8oFQGwfa/L5pDfyuN7uxIWnObKdbNB882lLWJRjopmbyM0VeePVKbBRRtf
	 5Sof1EV65I4/2KuicNGp4um65pbY2D3rEQXiBQgo=
Date: Mon, 14 Aug 2023 17:31:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] mm/slab: Add __free() support for kvfree
Message-ID: <2023081449-blurry-bath-248e@gregkh>
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
 <169199901230.1782217.9803098171993981037.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169199901230.1782217.9803098171993981037.stgit@dwillia2-xfh.jf.intel.com>

On Mon, Aug 14, 2023 at 12:43:32AM -0700, Dan Williams wrote:
> Allow for the declaration of variables that trigger kvfree() when they
> go out of scope.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  include/linux/slab.h |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 848c7c82ad5a..241025367943 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -746,6 +746,8 @@ static inline __alloc_size(1, 2) void *kvcalloc(size_t n, size_t size, gfp_t fla
>  extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize, gfp_t flags)
>  		      __realloc_size(3);
>  extern void kvfree(const void *addr);
> +DEFINE_FREE(kvfree, void *, if (_T) kvfree(_T))

No need to check _T before calling this, right (as was also pointed out
earlier).

thanks,

greg k-h
