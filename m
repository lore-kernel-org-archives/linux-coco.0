Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5E5354F6
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 05:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltFqQ865"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697002062; x=1728538062;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bDADOCK5y6EfdtJCioVa1Ksl06xw+gGHZUtfoSD5ALE=;
  b=ltFqQ865y3FpzfHhXguBUlPoYwld5UMRr8ZETVdZXbNCXguVOfFFaHsr
   m7Hl9NKz0SanDQggI6pbcyDghtNCBemSTOrZcMA/AiiqZ9XvVK58iM3Xh
   /94RZ0REEDa1R0QKmg5zkRdGG83omNhBNoaxtJDdEeCgUDxRLf5UCKbBZ
   Onq2SubD90w5Ic3Mt/ZTPTYxY+VK+WKzIINZAR0BYbKoPbKzsvSIPARl/
   0gYZ6IPxb7J2BLoHX3XsmuU+0PygvWEW0UbHYWrD6K+np5ksgrJ97CAhO
   uBn5OHrRpR485aHJqLur9uZhz4t2517a/viDWaxYxZiGYU+3Zg1I8s6l3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387424323"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="387424323"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 22:27:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747322560"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="747322560"
Received: from mghorpad-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.251.2.142])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 22:27:41 -0700
Subject: [PATCH v5 5/7] mm/slab: Add __free() support for kvfree
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pankaj Gupta <pankaj.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sathyanarayanan.kuppuswamy@linux.intel.com, dave.hansen@linux.intel.com,
 bp@alien8.de
Date: Tue, 10 Oct 2023 22:27:40 -0700
Message-ID: <169700206079.779347.8165172682346973505.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
References: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
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

