Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CBF7482
	for <linux-coco@lists.linux.dev>; Wed, 30 Aug 2023 19:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693424018; x=1724960018;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=igrcA3q8KN5WrWYA/jTLGNsZx4aaW/jLTGUAudQ8oU0=;
  b=iLcm855V6b1GKtzSO4xlo+Z6n493Fr+G8Xpz8Vd8DxQxAlcjffWAigI6
   s2v8WqKaabvkwQ+ahO+LsV/tNZ7sCSRHsqHGwRDcHdCSqZvrTsy/gWjI5
   H0Z30BZRChaCai/SX+gcpKkr8PKJNp6X+C20zPkGXXWDorw5LRIjzR+fv
   48ZZPvA0KS0nRJyNKympisbgbBtYDpV54mwyDiPLqx0G5iUsbERhw3yVr
   x3SQaq7+2lGXseSrfGV3tA2OTUbOrIAwpwFfoXon8fI6yNtMd8vgp4BXr
   zEAyFDw9soEVQElAMm5CzhkBJLxf42c2AoK0JnuwAbi82SfoTTJ1ioiKB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360723664"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="360723664"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 12:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="853844876"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="853844876"
Received: from nivakuma-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.212.238.163])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 12:33:37 -0700
Subject: [PATCH v3 4/5] mm/slab: Add __free() support for kvfree
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 tglx@linutronix.de
Date: Wed, 30 Aug 2023 12:33:36 -0700
Message-ID: <169342401666.3934343.5520453508283712955.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
References: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
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
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/slab.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 848c7c82ad5a..241025367943 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -746,6 +746,8 @@ static inline __alloc_size(1, 2) void *kvcalloc(size_t n, size_t size, gfp_t fla
 extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize, gfp_t flags)
 		      __realloc_size(3);
 extern void kvfree(const void *addr);
+DEFINE_FREE(kvfree, void *, if (_T) kvfree(_T))
+
 extern void kvfree_sensitive(const void *addr, size_t len);
 
 unsigned int kmem_cache_size(struct kmem_cache *s);

