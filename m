Received: from out199-18.us.a.mail.aliyun.com (out199-18.us.a.mail.aliyun.com [47.90.199.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EBB8F47
	for <linux-coco@lists.linux.dev>; Tue, 12 Dec 2023 00:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0VyKODcO_1702341506;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VyKODcO_1702341506)
          by smtp.aliyun-inc.com;
          Tue, 12 Dec 2023 08:38:27 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mingo@redhat.com,
	tglx@linutronix.de,
	x86@kernel.org
Cc: hpa@zytor.com,
	kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] x86/virt/tdx: Remove duplicated include in tdx.c
Date: Tue, 12 Dec 2023 08:38:25 +0800
Message-Id: <20231212003825.70297-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header files linux/acpi.h and asm/cpufeature.h are both
included twice in C, so one inclusion of each can be removed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7713
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/x86/virt/vmx/tdx/tdx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 13df68ef40b5..49a1c6890b55 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -27,14 +27,12 @@
 #include <linux/log2.h>
 #include <linux/acpi.h>
 #include <linux/suspend.h>
-#include <linux/acpi.h>
 #include <asm/page.h>
 #include <asm/special_insns.h>
 #include <asm/msr-index.h>
 #include <asm/msr.h>
 #include <asm/cpufeature.h>
 #include <asm/tdx.h>
-#include <asm/cpufeature.h>
 #include <asm/intel-family.h>
 #include <asm/processor.h>
 #include <asm/mce.h>
-- 
2.20.1.7.g153144c

