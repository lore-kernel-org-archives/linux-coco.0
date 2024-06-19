Received: from njjs-sys-mailin01.njjs.baidu.com (mx310.baidu.com [180.101.52.44])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0BE2139B1
	for <linux-coco@lists.linux.dev>; Wed, 19 Jun 2024 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.101.52.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718786878; cv=none; b=dIkuxYl/xa8PTlfRBBLv3fHehgAazLzG5ujilzaxhdlbYnumTq3rN9UUWmbEPtwwLw66KY39+FFCzpaiza8nHPYsJirdPHXGIAZyBE/YDXMy/bnSnufGAhcjCmOeTZX776jYjBVLsxqMX0b6qX4RQbe6LfGha6r2aLeBETG3xUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718786878; c=relaxed/simple;
	bh=FCE4CHEiQevoo0zi1nKry0ww328+u54fXJyCP0cAAWs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=qIEd9n3MimSmqFdUMjJDXD7g6TF8JpymlVx12VUwr7zS/sIw2ydzIknF0nGbhgwhYc2RM21dqHDJl4XZDy/YzlQJXepMjf05MrdjwO60BnOZxtxG3p3ocLNa8q4xDhsc4HeO5QlJ8of3+prTgidpyadqlRxN0pbgIwHTQGGZW5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=180.101.52.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Received: from localhost (bjhw-sys-rpm015653cc5.bjhw.baidu.com [10.227.53.39])
	by njjs-sys-mailin01.njjs.baidu.com (Postfix) with ESMTP id 059B07F0004B;
	Wed, 19 Jun 2024 16:47:52 +0800 (CST)
From: Li RongQing <lirongqing@baidu.com>
To: kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rick.p.edgecombe@intel.com
Cc: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH][v3] virt: tdx-guest: Don't free decrypted memory
Date: Wed, 19 Jun 2024 16:47:50 +0800
Message-Id: <20240619084750.9207-1-lirongqing@baidu.com>
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
or security issues. So leak the decrypted memory when
set_memory_decrypted fails, and don't need to print an error
since set_memory_decrypted will call WARN_ONCE.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 diff with v2: remove print error
 diff with v1: leak the page, and print error

 drivers/virt/coco/tdx-guest/tdx-guest.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 1253bf7..8575d98 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -124,10 +124,8 @@ static void *alloc_quote_buf(void)
 	if (!addr)
 		return NULL;
 
-	if (set_memory_decrypted((unsigned long)addr, count)) {
-		free_pages_exact(addr, len);
+	if (set_memory_decrypted((unsigned long)addr, count))
 		return NULL;
-	}
 
 	return addr;
 }
-- 
2.9.4

