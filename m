Received: from njjs-sys-mailin01.njjs.baidu.com (mx309.baidu.com [180.101.52.12])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B1313C69C
	for <linux-coco@lists.linux.dev>; Thu, 13 Jun 2024 11:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.101.52.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277965; cv=none; b=WHqGtUGelMZ/LhHDjZzoDHY1nEdpg3dJC1T7pxSpgR9sbdEP7lncy7GZOET/mmFY1yVQW3LZbzCKGQExuLQfzNeGoD8ncpoxBWXcvvfN22sMnOfqTjNc4Y86AUIyY3B2RnxnwqDVvvpQ1KuzFYNni9drBaKkxsM6VQVjnsZ77mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277965; c=relaxed/simple;
	bh=rDVIT4BXxF2it4bFKgmp8ECD9ggRMAF9vGgDBSlIvCY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=VtQzl6it30Vz2nQW3aQJTNapuO4LNAUPgJvcMUubhxJPTvyW2OfixgopFp61Xax6s4DV61IkvssDfmWdM0ynIjVFDxi+YvSmApP7Qy3/EUbmNMp9HJ6aOZ+JYNV62creBDmkIBeyvdwOA2swA/cb74GQwexKr/8Toa21aZpzLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=180.101.52.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Received: from localhost (bjhw-sys-rpm015653cc5.bjhw.baidu.com [10.227.53.39])
	by njjs-sys-mailin01.njjs.baidu.com (Postfix) with ESMTP id EC00E7F00045;
	Thu, 13 Jun 2024 19:19:32 +0800 (CST)
From: Li RongQing <lirongqing@baidu.com>
To: kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	linux-coco@lists.linux.dev
Cc: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] virt: tdx-guest: Fix the decrypted failure memory free
Date: Thu, 13 Jun 2024 19:19:31 +0800
Message-Id: <20240613111931.43123-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.9.4
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>

In CoCo VMs it is possible for the untrusted host to cause
set_memory_encrypted() or set_memory_decrypted() to fail such that an
error is returned and the resulting memory is shared. Callers need to
take care to handle these errors to avoid returning decrypted (shared)
memory to the page allocator, which could lead to functional or security
issues.

When set_memory_decrypted() fails, the memory should be encrypted
via set_memory_encrypted(); if encrypting the memory fails, leak it

Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 drivers/virt/coco/tdx-guest/tdx-guest.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 1253bf7..63271fc 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -125,7 +125,8 @@ static void *alloc_quote_buf(void)
 		return NULL;
 
 	if (set_memory_decrypted((unsigned long)addr, count)) {
-		free_pages_exact(addr, len);
+		if (!set_memory_encrypted((unsigned long)addr, count))
+			free_pages_exact(addr, len);
 		return NULL;
 	}
 
-- 
2.9.4

