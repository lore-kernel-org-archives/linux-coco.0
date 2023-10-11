Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E96179B9
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zy5Bn0lQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697005907; x=1728541907;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nEukgBs9em833oKxz7mX/So5mdv9uZNhTirZDUSdfBw=;
  b=Zy5Bn0lQ8B7zFoCgOFQP8EEAw5BvEomD8xmWKwdiyVvNLEe8lVPUGfky
   l+Fvb1NPvcmHpyyOvh6g7YYhUf466Zc4KesAF0RIrT+3kBsqhSRwTbmgT
   71pc4tH5Slv4m1WrC0tP10xqXcTVC8dEU1SrjvxtN28RdlI+ZOsyfI6EV
   eA9NZ/UyxtZW4yrAROWqX6rAnRnaGLL/gxh9iZpLhXuQ0LpRwcOmRqBxK
   8GlpDaMFTazYFtJ6ATGqdB27YDCzhbnXFDmhd4PYI2cnCKCHRxsIr0+9S
   /oZOsNEXA7z6icXhS+lzT6zVo7W/I7PHuL4kZNFt3LxbqpG5h1kdPJn9T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387434697"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="387434697"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 23:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="844443854"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="844443854"
Received: from gears-pc1.amr.corp.intel.com (HELO [10.251.3.56]) ([10.251.3.56])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 23:31:46 -0700
Message-ID: <4a734911-5ebb-4f82-8113-da76e520337b@linux.intel.com>
Date: Tue, 10 Oct 2023 23:31:45 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] mm/slab: Add __free() support for kvfree
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pankaj Gupta <pankaj.gupta@amd.com>, dave.hansen@linux.intel.com,
 bp@alien8.de
References: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
 <169700206079.779347.8165172682346973505.stgit@dwillia2-xfh.jf.intel.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <169700206079.779347.8165172682346973505.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/2023 10:27 PM, Dan Williams wrote:
> Allow for the declaration of variables that trigger kvfree() when they
> go out of scope. The check for NULL and call to kvfree() can be elided
> by the compiler in most cases, otherwise without the NULL check an
> unnecessary call to kvfree() may be emitted. Peter proposed a comment
> for this detail [1].
> 
> Link: http://lore.kernel.org/r/20230816103102.GF980931@hirez.programming.kicks-ass.net [1]
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Pankaj Gupta <pankaj.gupta@amd.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>  include/linux/slab.h |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 8228d1276a2f..df4c2d45bb86 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -763,6 +763,8 @@ static inline __alloc_size(1, 2) void *kvcalloc(size_t n, size_t size, gfp_t fla
>  extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize, gfp_t flags)
>  		      __realloc_size(3);
>  extern void kvfree(const void *addr);
> +DEFINE_FREE(kvfree, void *, if (_T) kvfree(_T))
> +
>  extern void kvfree_sensitive(const void *addr, size_t len);
>  
>  unsigned int kmem_cache_size(struct kmem_cache *s);
> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
