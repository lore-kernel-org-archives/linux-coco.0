Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C83C132
	for <linux-coco@lists.linux.dev>; Fri, 22 Mar 2024 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711088274; cv=none; b=eMYw3JzCbKll/3ILNuWtAfy1boWNEqgVdSlBTn9O7+rHGzMuDaxsuJEbAjfHDXRdYcf+7xv7O5l0XcskX7iGkqEowOF0gyCvImWEMPMiWVfqmr+nb9CGH+zfX1ntYlIiI/GgVQkva8fZdXg+fxJvHruPXKdO4ktmEyYDD321exA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711088274; c=relaxed/simple;
	bh=vKn8m1DHwhDiog5OyjdVZMOak55qk31tA/1OfFLNQAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TQ3tQgdd4GXjWF8GlxO4nVUi4h9/LSyR+DVOd7mKIX4kfLNEnEfiNheoxJdoFw4FvKu+XLCK0E+RCWyJNNyvY5ByJXeB8teQ5DHqrTZfrlz+3Ay60NHujnPkLZfKevaYdIf5i+pkNlYvjfxHonCo2XQ5Gkiu9tjSMp8JtmJfS5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ewS283RN; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ewS283RN"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1711088269; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5ItwkbfBI36gD4+fLsboHG2pr+jRHC/1cyKhqHaieO4=;
	b=ewS283RNuZD4k0CdaHzWvOjQSvsfe0Ypa0tI3sMWrvohEuN/UZDmo3NXUHGRMy7NQ0OIKx+tPvS0mhOGcbbosQQGZH9CJ96guijY8IKtpli6oFGjYsbEBkTNu7H78gfqmeXLHh2y8Mm9NB/iLKa5INEVkilkz6u5F4WQYCXGuFA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0W31.zcW_1711088262;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0W31.zcW_1711088262)
          by smtp.aliyun-inc.com;
          Fri, 22 Mar 2024 14:17:48 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: kirill.shutemov@linux.intel.com
Cc: dave.hansen@linux.intel.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] x86/virt/tdx: Remove duplicate include
Date: Fri, 22 Mar 2024 14:17:41 +0800
Message-Id: <20240322061741.9869-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./arch/x86/virt/vmx/tdx/tdx.c: linux/acpi.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8609
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/x86/virt/vmx/tdx/tdx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 4d6826a76f78..49a1c6890b55 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -27,7 +27,6 @@
 #include <linux/log2.h>
 #include <linux/acpi.h>
 #include <linux/suspend.h>
-#include <linux/acpi.h>
 #include <asm/page.h>
 #include <asm/special_insns.h>
 #include <asm/msr-index.h>
-- 
2.20.1.7.g153144c

