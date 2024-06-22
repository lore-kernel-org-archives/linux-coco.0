Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE07A2F34
	for <linux-coco@lists.linux.dev>; Sat, 22 Jun 2024 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719078562; cv=none; b=b2MMPzbjyOCDew1nFU23Z97zoTJS1eEm5J90uWv8HscAVGtpHoc8RpiNSZ6YZj8jEBUajEarffDizjUvQysyC52YdBBwr3xPeQbtUYIYWoH7+bnQXCDYro39QzVGlYDWkepkmuv4P+sgZ+2GPVniBOedweYa5OOH/J0Fjx5pIB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719078562; c=relaxed/simple;
	bh=v/3PsyHRdGU+Zt2FlaAQF+81bhW37rE13RUnr7A5H8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qfGXEdux5wsURtxzL7DNjMVkGoH3XfrebEFu63piKl0FyptrjoNnxmD2B1Zviy4/F7LoiltPYEQPgl0Jpku7aw4yZOqyPABzCZOb2kapqmVfZgc4ZiLMku3zQtY9qFfV/vgRYrtdm2Cn/7cpr2niZ+sFx9VQVtRg0s0MVubEOcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V05lHDj3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V05lHDj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719078561; x=1750614561;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v/3PsyHRdGU+Zt2FlaAQF+81bhW37rE13RUnr7A5H8w=;
  b=V05lHDj3YPv+KaBU/WhjlImQnsTH7sddPxDv4yon6PP+kBEq5LXxfvhF
   OeTmHYERr13IPgBYAj5DX1L/z7p+Lq95PwLOMS3+jdv3JqKx24reYkC+U
   z0VM6YUNiU77R/cyTgGlOsMRHTdNjCfw1zXfPTZDl4YvOsjzpZtFRf4In
   gZBb47bzgd0XnLI1JPryNIKCKxveKDtki6RG5N1F9/Tn0WjP68DtNLzPY
   SgEhOx1WXk7bSYVvRLCgpFlps0tYAHvotqtpQbRrC+w5/zffjxBdhn2IM
   o7w35ErAaKwAE0kNsBvw+lhtUY5eW61HarUMd87bm9PvmkJTa5SSwehvv
   A==;
X-CSE-ConnectionGUID: VBRcasA/SFCtJTfwJJlzZw==
X-CSE-MsgGUID: 9XBEP5JTR7C8hUYh0YoiCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16068243"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="16068243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 10:49:20 -0700
X-CSE-ConnectionGUID: +Z6xpWNkQnGxJPga6maZww==
X-CSE-MsgGUID: nB9QnuNPTGqemPerYC9Z1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="48043910"
Received: from unknown (HELO ubuntu.bj.intel.com) ([10.238.156.105])
  by orviesa004.jf.intel.com with ESMTP; 22 Jun 2024 10:49:19 -0700
From: Jun Miao <jun.miao@intel.com>
To: kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com
Cc: linux-coco@lists.linux.dev,
	Jun Miao <jun.miao@intel.com>
Subject: [PATCH] x86/virt/tdx: accurately distinguishes TDX module loading situations
Date: Sun, 23 Jun 2024 01:50:37 +0800
Message-Id: <20240622175037.2051612-1-jun.miao@intel.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first SEAMCALL is important to response the state of TDX Module/BIOS.

In actual incorrect BIOS setup or deployment, the sysinit_ret will be
-EOPNOTSUPP. But the message "module not loaded" isn`t enough to describe
the accurate loading situation when module loaded but SEAMCALL failed
for some BIOS wrong setting. So add the error return operation code number.

Signed-off-by: Jun Miao <jun.miao@intel.com>
---
 arch/x86/virt/vmx/tdx/tdx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 4e2b2e2ac9f9..787dfaf44036 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -122,10 +122,14 @@ static int try_init_module_global(void)
 	/*
 	 * The first SEAMCALL also detects the TDX module, thus
 	 * it can fail due to the TDX module is not loaded.
-	 * Dump message to let the user know.
+	 * Dump more detailed message to let the user know.
 	 */
 	if (sysinit_ret == -ENODEV)
 		pr_err("module not loaded\n");
+	else if (sysinit_ret)
+		pr_warn("module loaded error ret=%d\n",sysinit_ret);
+	else
+		pr_info("module loaded\n");
 
 	sysinit_done = true;
 out:
-- 
2.32.0

