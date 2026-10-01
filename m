Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55F647A876
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883529; cv=none; b=mDn9Aiy72H7H2VhpFAnpr0lXNLTIulHi+QL44SZlYvz4QyyoKiz2a3cLRpn8Yo+EwLBVcAuQZABTB0As8H1dCextkZ5Su4/x0t4y/0cUULVjP9IpbtGHwHjAt8x2rTv6ADxWXoH/Ea9E5XYmQRR8Rw+JG6Hkyt+OU7IHqci2hDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883529; c=relaxed/simple;
	bh=zp0fCXEEXhwkdiJK13QWS3aC86M9pq8mXqRQKAIXcDw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WatuxANAx0TRkZOB/sOsW1Pg+HeWeWBKLt5IPDSnXxlhhc1ChiPvGFwObsoLCxzRfaisp8TUEpdckXr5PFJsu3g7pRChmmcHaAhtMzB4oe8AI8KXUPS0mX+cDn0hZHUgwUWXrUwTRZl8coQfYFm5lS5dD2uYxIw+Zy+/hkMkZ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cVOcjKzh; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cVOcjKzh"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8c152622so45609685ad.2
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883526; x=1791488326; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/NoryhY8HfDhtfJWA4MzZfEK4rb7jcSVHQTgNWX/UM=;
        b=cVOcjKzh7xrlu/Yw7kipZEX1CSNPTExv8iMvTQgLuyy9VhicgB4qsu2vD3PiQmLBGR
         sm//aBqfVGTTOXPExoLwEihhVCEMiyDGabfNVPFB14cDXVLr326oBb9Qf3mPuDzGx1uQ
         aD8ZJ08bfpVtL988LFMzxhXgyJFd2R5cr+ExNKiKpzgoSl138ppiZLM8UQbK96PQbbhF
         lafR93Yh9bimXkpR7SIJRjqoO3NoB5TnR5y0zxck+keuXQL4+ENZF9vgyhxK5pBEm7C7
         0fBJtt3XVLPP4cPYkfOvzQ/d/vWN9pQIU7yKX0X9tIHGE4CkgRejWwDrm5Mt+IV9ID05
         /lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883526; x=1791488326;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/NoryhY8HfDhtfJWA4MzZfEK4rb7jcSVHQTgNWX/UM=;
        b=q6rhBiqiorQN2qz8yPXBXhRsvHYONrCtEeQxSUE1OXiPxOaA16mbTdV+uG37UwWqi4
         vI+4tuRQVWJIlYF02Ch4Co9my4RQKI9lC/uM07nDEyDRP8v/xwJZrrZ+IiBfKJZYicMK
         enVk0i+vxldzBvO+17gJALXHh9aREb4XevdkuUNRsSkpyQ414zFA/vUEb6Mbm6mJzE8N
         faS7pEyaspCzpGG+sFAHVsipJWHPP1DIUR3sAho0+5bmnJQpaWeoWU/nXrRVvTJ2i11u
         czSI7kFAnx3mr6KSvoUM56d5yOaBzq2ClxgYSC1iIvDSrd41vLkFsHXnjtAQXS1byJnB
         sljQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvGTUEPpwc+B50DqmupsXlgAtbxq+TgY7IDgS1ORhJl6xVaHLuSB5QScnho80oTqtayZwpthtJWtlQ@lists.linux.dev
X-Gm-Message-State: AFq9FYJDinQOAnNv6+7jIUo2sqV48CBesIMIJiZPhESCO5Ti50JJxhWw
	P0xrz6duF74yA9o0Oj4NTNB4UH90bPBREMSHoU+/hhBHBMwq41EN/wkJVoDNmy679V72PNX+vJX
	x8J3dPA==
X-Received: from pjnq4.prod.google.com ([2002:a17:90a:8704:b0:3a6:c7ae:6dd9])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44c:b0:3a4:e013:8768
 with SMTP id 98e67ed59e1d1-3a6ceb1b22dmr485911a91.45.1790883525538; Thu, 01
 Oct 2026 12:38:45 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:31 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=1878;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=JAF4AonfKOce2MPkEm+6H47o5hzM1UYJCFnc5WFeYP8=; b=DztLG+OxqhK/sRaaOkaqQqgPibtyctWSl8J8kXdEMwYHg5RjZIo9FjVbn/6aPjylEB/+7+w3w
 kBaLg6DuipIDI6IBKsYm1AdVsAInVjZDqMT90f8ik2KB++RcTL156uM
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-4-7c62a5d8a992@google.com>
Subject: [PATCH v15 04/23] KVM: selftests: Expose segment definitions to
 assembly files
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Extract kernel segment definitions into a separate header for assembly
files.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor_asm.h | 12 ++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c         |  5 +----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor_asm.h b/tools/testing/selftests/kvm/include/x86/processor_asm.h
new file mode 100644
index 000000000000..713b6bc0aeb7
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/processor_asm.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Used for storing defines used by both c and assembly code.
+ */
+#ifndef SELFTEST_KVM_PROCESSOR_ASM_H
+#define SELFTEST_KVM_PROCESSOR_ASM_H
+
+#define KERNEL_CS	0x8
+#define KERNEL_DS	0x10
+#define KERNEL_TSS	0x18
+
+#endif  /* SELFTEST_KVM_PROCESSOR_ASM_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index b87ba7d8538b..1944eb2489d8 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -8,6 +8,7 @@
 #include "kvm_util.h"
 #include "pmu.h"
 #include "processor.h"
+#include "processor_asm.h"
 #include "smm.h"
 #include "svm_util.h"
 #include "sev.h"
@@ -18,10 +19,6 @@
 #define NUM_INTERRUPTS 256
 #endif
 
-#define KERNEL_CS	0x8
-#define KERNEL_DS	0x10
-#define KERNEL_TSS	0x18
-
 gva_t exception_handlers;
 bool host_cpu_is_amd;
 bool host_cpu_is_intel;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

