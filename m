Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA30A44
	for <linux-coco@lists.linux.dev>; Fri, 13 Oct 2023 02:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efYYN6/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697163265; x=1728699265;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AlODxUrU/MdC9wzroOkVUI51+AoH8OHxCEw0qezCq30=;
  b=efYYN6/nqfPjgDCH7TB4+rrKqDmrfHLfeuz08YSVGMUCUvh00MM32vgs
   1Ceww85ei8E7Qko1FQgI9U7brwMuTj45JIxeAR2Wfn7qBuJUQQda3tmMB
   qQc5pzNGpFouw/F1W0CUihdfkFZ8NiiCcfMIA6gtVxxzZGmgLzDGwqVUL
   29IDts1ef/PtaaSAUygCFflCZg8aoN608GkGHnVUgWB+Z1O6nR+RzyF5i
   okjVs301O0vwOkpS8JkVj5BuVbOQIBWf7ax2OmG/MYa+1K3mf6IEBB9XF
   /WZMM5TFRXdNH09KxCZi+JD/iYMYeQY57nb7BckHfdjig6sySBAkis5DD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364451981"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="364451981"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783957106"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783957106"
Received: from jamieko-mobl1.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.108.60])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:14:24 -0700
Subject: [PATCH v6 5/7] mm/slab: Add __free() support for kvfree
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pankaj Gupta <pankaj.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 sathyanarayanan.kuppuswamy@linux.intel.com, dave.hansen@linux.intel.com,
 bp@alien8.de
Date: Thu, 12 Oct 2023 19:14:24 -0700
Message-ID: <169716326447.984874.5558976177587402497.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Allow for the declaration of variables that trigger kvfree() when they
go out of scope. The check for NULL and call to kvfree() can be elided
by the compiler in most cases, otherwise without the NULL check an
unnecessary call to kvfree() may be emitted. Peter proposed a comment
for this detail [1].

Link: http://lore.kernel.org/r/20230816103102.GF980931@hirez.programming.kicks-ass.net [1]
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Pankaj Gupta <pankaj.gupta@amd.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/slab.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 8228d1276a2f..df4c2d45bb86 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -763,6 +763,8 @@ static inline __alloc_size(1, 2) void *kvcalloc(size_t n, size_t size, gfp_t fla
 extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize, gfp_t flags)
 		      __realloc_size(3);
 extern void kvfree(const void *addr);
+DEFINE_FREE(kvfree, void *, if (_T) kvfree(_T))
+
 extern void kvfree_sensitive(const void *addr, size_t len);
 
 unsigned int kmem_cache_size(struct kmem_cache *s);

