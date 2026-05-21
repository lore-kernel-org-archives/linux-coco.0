Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D727372ED6
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405451; cv=none; b=eQ94pyZNV8UqkGstSfK0PLGw7gO/FqhNaM4o6iBCYmoLQoaUS7iFTlUwQR/5m7/+X2ptXX+KRcpElTHn5LJNaSNcJe+Xx8S79fPS4bblM62QWrRMO7q8eYEmIrahf71TzJ7awOASFydvSNYgjsAPU9XSZ9/LHfl9HUrX+MVDbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405451; c=relaxed/simple;
	bh=Yqcf2ZtCL2pZ/li1Zx21CJVqksuqw+042UtUypJf2Os=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XADZulPZ4A1YfZEBT7gPevgHp7yrd8/HeNuTuvE7Yd9N1Rko37HWdzQAFkDqBMk/spg9y1SsQpI4bsNDwJVppfD88Hm1OGLzbmigvReQOlt2eFSEEFQwz6j4Qz0ZzKX4u9KHzjTTF0gg4KrjDfTM5Jb2Pdcv/lBwlXtMyGNOVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IALhSUUU; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IALhSUUU"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so3870143a91.3
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405446; x=1780010246; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iTXdOOSDiQ937nyHyL9uNvA+3VdhPmcIfYckAt3V7kM=;
        b=IALhSUUUsbSn+9bvHNOj+pZ74MQLQnsuWnlQxpM5UuSa8dafmAeJm9joUBgEcCMOgd
         RFUwVZSOq8HVnTFvSOJo7e4460nMbPK0mz9niZSO8lEmjy4tZ+Qp/pUewtj8d5GfSPfb
         N1nnSkSBog3U9yZfF18H9VYNKCACm792j+0ngW4t1We8Hi0pfqan+pYhGX+dANDDgaHa
         FihTAkofMa5DxYQcDhhv2fq4DEBbBkRISE3kuse6g9nVCcSR3QFKVl78PV1Z2aWy2J3G
         jCR8HbUyp9bGMRFgmLpWpWfCFNLEW6hJMYH9rruh9cBLaiwvt+UqoTIO5VAWAkpeMzsB
         pE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405446; x=1780010246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iTXdOOSDiQ937nyHyL9uNvA+3VdhPmcIfYckAt3V7kM=;
        b=LUc573pUsESnWMD7ELI7Fi9/cm3HfNL0kqhf6Br5ImSAmy4W5QSLLx3osOucUXMuUh
         bEFgCMhQDcoy4GXYY5uZG7hy3FttW3AfZaP9Vr1vkOee2IAdMeoy9VVV9utSuRrOsaww
         +Z4HWU//XnC/BDHDhkIaRqFTVU3FU5q7iTVsZUMF5PO5lxDX5pec3GtjOcOhJ/wz04JW
         5NMBz3Sfl3q7oLByV+LGmiRWegDRrZPPtMEfJh6uBc60si0l6yGbXt6JG6Dq39BbfUBb
         mAauqEIrxU950Pdj1HHpCuR7UXe/VHrwxj1SVWehBu8kGCxyMhElfo0YbEhi+BUDnhKx
         X5kg==
X-Forwarded-Encrypted: i=1; AFNElJ/DeRXoLW6lXRz+ms6IHyQVsAldsF8NSOZ81RJS9H6UAbpLnI4tfLw1Vye2aUtN7JNLSO+ECkqG8qrD@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0f0HeNtc4jbcvBhzLemGo+sHPMv7VZIH4ik4mQOmG6cj9lGeH
	AvhCNt/Z+uDRzwAlPlbrM7X4UiV/fMbQdx7oHOrbzFDogHrxEQ5E9XxnBBFYgb7as7UgEtTUev4
	Z4Ya5Kg==
X-Received: from pjwo16.prod.google.com ([2002:a17:90a:d250:b0:366:337f:cac4])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33c1:b0:366:decb:d119
 with SMTP id 98e67ed59e1d1-36a677303ccmr1032725a91.11.1779405446261; Thu, 21
 May 2026 16:17:26 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:46 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=1790;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=pxBlg+u/5Mh8rNUdINlNPKZ9pQQ3gd4AFGSpLoMweI0=; b=Bhksl8BuA6r5EzGVF65bM234+KYyAdsEIT0gj8ZWD1p9EpBD2PbIucsQYkWtl2COstjYpuhFW
 PYodxxinzNRB5VxjznB2EXAsa/cKUXAna9cBfvV9ognTQJCAi9LGoN0
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-5-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 05/22] KVM: selftests: Expose segment definitions to
 assembly files
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Move kernel segment definitions to a separate file which can be included
from assembly files.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
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
index 8d06e7186df1..62abfe27fe3a 100644
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
2.54.0.746.g67dd491aae-goog

