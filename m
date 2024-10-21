Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A25F14A90
	for <linux-coco@lists.linux.dev>; Mon, 21 Oct 2024 03:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729482548; cv=none; b=lTK/d+kgSD7q7DMr1vJR1aj7f6Bi+4qjcGeveafw5V5WHJaJhA83G5gVJs5MpQwAWzXx0kJ6BeGZTXs/3k1ZJqWOoNURtrZpgK87cXEardfTkG6WiCRHmQVTp+xYXAVcq2t7rR7khc3RwPGePQHLUXhBCuFS3huOORDbZFXPKkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729482548; c=relaxed/simple;
	bh=31d7ORNUlp0kIwwTotWiGmSTWYon69BtiQ1QjPfL2AA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMcG4x24kud7wfvrz7kJGa/WMRFQTx2fYL1hda9gdNHCA1P24EtH8+IZStwKjyk+N+Qlv3x2/hN0V9DZ1S6T3yBUOxSErjHqsq/tuL+hLIF4R89ujgJAWvMnKLrabejoKOdT0FZnkkBjZEXCD2dtCLC6dmVQKaEXoj8eYf07Pm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6dGqZFc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6dGqZFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729482546; x=1761018546;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=31d7ORNUlp0kIwwTotWiGmSTWYon69BtiQ1QjPfL2AA=;
  b=a6dGqZFcKgoH2vZKP404HRuB7qzkTW9UT2Rw/wC4mAImeUjuhxFyJGug
   SBLXsZGCIFJDsTqOYaXwPxA4VHQmDzBlVYQzO1scfaDmtSF42xgIeCDOx
   6J9yog1L8VTePNcBjlwumByIp7GYvowf6QD1Due1UycaWl2VUM8/KR+Xe
   wcPNkPlHzm4mwy0wD1JGW3t9qq8Rw2pFt4z2ctPa7bQ0uZAGJG49TOaSs
   hy7C4xfgn6RQGPnPfnrrZO14YdE1FFOk6/WvWqAkQSKZjStcDoA/iVg0A
   E1vlz26D9EivCYJkevE50tKhjHI1r6XyJ3JDamS7vvZ7NBRdIde5VIYt3
   Q==;
X-CSE-ConnectionGUID: hEpqL9gTT/ShUn4n2RZfCQ==
X-CSE-MsgGUID: sBftoyhlTBe1TVRXtARcGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28900686"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28900686"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 20:49:05 -0700
X-CSE-ConnectionGUID: ICSjrCbYRyeEF9Bfm+9lOw==
X-CSE-MsgGUID: ewORK1SQSKKhH7c4XTA2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79740999"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.62])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 20:49:03 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: ebiederm@xmission.com
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	x86@kernel.org,
	rick.p.edgecombe@intel.com,
	kirill.shutemov@linux.intel.com,
	Yan Zhao <yan.y.zhao@intel.com>
Subject: [PATCH] kexec_core: Accept unaccepted kexec destination addresses
Date: Mon, 21 Oct 2024 11:45:53 +0800
Message-ID: <20241021034553.18824-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kexec destination addresses (incluing those for purgatory, the new
kernel, boot params/cmdline, and initrd) are searched from the free area of
memblock or RAM resources. Since they are not allocated by the currently
running kernel, it is not guaranteed that they are accepted before
relocating the new kernel.

Accept the destination addresses for the new kernel, as the new kernel may
not be able to or may not accept them by itself.

Place the "accept" code immediately after the destination addresses pass
sanity checks, so the code can be shared by both users of the kexec_load
and kexec_file_load system calls.

Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 kernel/kexec_core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index c0caa14880c3..d97376eafc1a 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -210,6 +210,16 @@ int sanity_check_segment_list(struct kimage *image)
 	}
 #endif
 
+	/*
+	 * The destination addresses are searched from free memory ranges rather
+	 * than being allocated from the current kernel, so they are not
+	 * guaranteed to be accepted by the current kernel.
+	 * Accept those initial pages for the new kernel since it may not be
+	 * able to accept them by itself.
+	 */
+	for (i = 0; i < nr_segments; i++)
+		accept_memory(image->segment[i].mem, image->segment[i].memsz);
+
 	return 0;
 }
 
base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
-- 
2.43.2

