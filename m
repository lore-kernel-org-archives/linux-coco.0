Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE12377
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 01:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJWiv4QN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697764615; x=1729300615;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iai3Z5Z0sCoVWcTxNNJXR62irBh1sWVD6DxEb9TB+mo=;
  b=FJWiv4QNX3XlsKjbvn+PD6qiNJ2ajjjBYTrg85/H0RmRaQjQei7VTD1v
   GbcgdhURO3fLS9Ty8P2p8Dm1lUSQDHRQoBKYzvKnive5rg2V1flSaEOfx
   tZ7ybtPhAM4sMCW+GBjuzyROg7sE1nMy+1g3EYALwPNo+dKuaRNLic/OY
   Ctvkjhwjj83q/5K2F2wibLs1LLCMdDFVeHinKEDSs6WPP5wIRU27ql/+D
   f6nwqxLParQ5bbPNultCrzWJy4ZV0xY9obIYGWJCdGxsT25sCa8S1FvQD
   HRycq4xbEkGG870AUx6gqy582bwGUBxYUiRIoJOG8oexMd2DSWAbFOYlX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="389270330"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="389270330"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 18:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5215939"
Received: from hilldani-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.27.118])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 18:16:55 -0700
Subject: [PATCH v7 5/7] mm/slab: Add __free() support for kvfree
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pankaj Gupta <pankaj.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, dave.hansen@linux.intel.com,
 x86@kernel.org
Date: Thu, 19 Oct 2023 18:16:53 -0700
Message-ID: <169776461387.1705513.1890762019483676794.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
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
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
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

