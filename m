Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C0184F
	for <linux-coco@lists.linux.dev>; Tue, 26 Sep 2023 04:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695701843; x=1727237843;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bDADOCK5y6EfdtJCioVa1Ksl06xw+gGHZUtfoSD5ALE=;
  b=V8D8lo5+1HG8X0EJ8TY7l4O2f2Ut1XoMIqARpvbUOonps/MGt51nPAFA
   ZWSI4/Sr8gZUeUuEzAMKsomMB/8SmaL5Y9iYcNBCqfgAhC1DwfvIeiLRK
   WE3Iy0IfgTwMnRKam6gHynFinm5i6EskerAty+aj/g2QSFz8cHfjLDJgG
   E7HSy6nDY9eTPhW50u8ROf1Ww+yrH3obyvrWEfVVhQoYf3yQDAkDLJ7jy
   60ilYo5SbCuYral0ynHUL4wrIYoZ90qtr81UL+zphxvuVkYcH3tNeYlMN
   wRwjAPz00jeerQm7wPZkNO8kIOBVuNX/i3bOfscL/5h+KNCBq1C8R+5qu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412395849"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="412395849"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 21:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814314534"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="814314534"
Received: from fvivekku-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.251.18.72])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 21:17:22 -0700
Subject: [PATCH v4 4/6] mm/slab: Add __free() support for kvfree
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pankaj Gupta <pankaj.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, dave.hansen@linux.intel.com
Date: Mon, 25 Sep 2023 21:17:22 -0700
Message-ID: <169570184210.596431.3407746911924957078.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com>
References: <169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com>
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

