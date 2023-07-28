Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E31F14AA0
	for <linux-coco@lists.linux.dev>; Fri, 28 Jul 2023 19:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690572671; x=1722108671;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RReoo07Z8COfyQe4vCo2LnNBVJrUhMSozbnkyWWcdFM=;
  b=YLsLnojcakGLqg6bJDCDLohIWqBqDNKU3DTWmrn5tn34wxmzwf27l7DJ
   kvC7+8F7SauzrgETPrCrBlY3YZj9sUm+hzSk3XJIWVXC7TO0e0KuLJQsW
   yOlbCWGYg3dM52o2PZUyqBTA2VxC5xrn+GatRjvVawyvzXyU44xyYt86K
   aa3OMN4njjqizTxI3SyNy8ecdR8vfLZpXUQiireVJodYZEVb6h/roQ+nf
   elhWg7PmUIygWhUjaAzqdiO7F6Rc3j1rdW2RdsOwgVWkpLZZsC0eg7vHc
   L6+L+SLHEGyswRYz4HFE4puclomP7Zt58yovAizrgTYfUZNRKr4+E5K9u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="348958887"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="348958887"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 12:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="797529731"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="797529731"
Received: from cheehong-laptop.gar.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.212.158.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 12:31:10 -0700
Subject: [PATCH 3/4] mm/slab: Add __free() support for kvfree
From: Dan Williams <dan.j.williams@intel.com>
To: dhowells@redhat.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-coco@lists.linux.dev,
 keyrings@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 28 Jul 2023 12:31:10 -0700
Message-ID: <169057267001.180586.1162740444367661440.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
References: <169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
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
go out of scope.

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

