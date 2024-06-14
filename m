Received: from njjs-sys-mailin01.njjs.baidu.com (mx311.baidu.com [180.101.52.76])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F28D1474D0
	for <linux-coco@lists.linux.dev>; Fri, 14 Jun 2024 05:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.101.52.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718342103; cv=none; b=fy5UKQ8ZCE2buEXq8e2w86sJGHJJeusLzwG8pUO9Zt4g1li2yhGcUt7hSSJlENj5S5TH3FqgkyhYV9ooWgrzn4UGwccbVCQMKdJiE4IQV+ZJ/5WJm3YOSPHXCdFIIN9U4e7hATmQuRCzT0o9SD10i9APzV2jy/EcK7rahlyQL7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718342103; c=relaxed/simple;
	bh=uiEvY12mTUmpxwij1oiWXlTlEpQzNEHXNSfhXCKrA48=;
	h=From:To:Cc:Subject:Date:Message-Id; b=trr30sG9n8PndxjF/7LUEPCW0Z4gSAGFkgPmpjRLox3CNc4h+m3BxUHafkpMJiDueXiHE/BA0DY7F3BLAxuGwo2PODexc1KpnP+zjSPKdCchc4dM8Z773PjK7R2Zx4H/XnXopWBm7m4wSN4YCGKaSOpxJpu/OhZBAOV8QIjcgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=180.101.52.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Received: from localhost (bjhw-sys-rpm015653cc5.bjhw.baidu.com [10.227.53.39])
	by njjs-sys-mailin01.njjs.baidu.com (Postfix) with ESMTP id A24277F0006A;
	Fri, 14 Jun 2024 13:14:53 +0800 (CST)
From: Li RongQing <lirongqing@baidu.com>
To: kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rick.p.edgecombe@intel.com
Cc: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH][v2] virt: tdx-guest: Don't free decrypted memory
Date: Fri, 14 Jun 2024 13:14:52 +0800
Message-Id: <20240614051452.14548-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.9.4
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>

In CoCo VMs it is possible for the untrusted host to cause
set_memory_decrypted() to fail such that an error is returned
and the resulting memory is shared. Callers need to take care
to handle these errors to avoid returning decrypted (shared)
memory to the page allocator, which could lead to functional
or security issues.

So when set_memory_decrypted fails, leak decrypted memory, and
print an error message

Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
diff with v1: leak the page, and print error

 drivers/virt/coco/tdx-guest/tdx-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 1253bf7..3a6e76c8 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -125,7 +125,7 @@ static void *alloc_quote_buf(void)
 		return NULL;
 
 	if (set_memory_decrypted((unsigned long)addr, count)) {
-		free_pages_exact(addr, len);
+		pr_err("Failed to set Quote buffer decrypted, leak the buffer\n");
 		return NULL;
 	}
 
-- 
2.9.4

