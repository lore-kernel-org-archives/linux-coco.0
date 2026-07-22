Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC73E459ACC
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762060; cv=none; b=EVmxZpKRdSL7SBftZB8K6LKaQoBqGU8Gk17/mPTxQGaiyCZIDxkbzl7kGW5zQfc6wjkT9Xg+Fhr0jXDQ0pt49e71yEaJPpyzFRzYfETuPjh2GVXmftkTgdX9wtah8Xz9VDyap0q52BYzWaS67RyhZ07rcutAdmzpO8640xLX5mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762060; c=relaxed/simple;
	bh=HSUijWFM1BPOVfLPb88yrHGkaYxU/9q3xS5FLa0HHK4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fc+cVH2XzaITZT1PBvcy0JENDN7sO0qxoNoxX9YqqkH6QT2PIyeQ0DkDHeuO8kRHxPEfj57vTq1t0Jb4AhuRJaCDjbEZSKeuWIHKTeqIWMvMkYPaBnerGafRz+Lp2YwCrxp+7BAfo+O2TrVGZxhpV0v1iJ2XY+Z2CJnZiWt+V0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lcNqLnhQ; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lcNqLnhQ"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cceabd70f5so1421415ad.1
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762058; x=1785366858; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56NrxXkv0UVjMvjOx9by9wvi/d3mOyqzIaOMJLt53IU=;
        b=lcNqLnhQMymK0OfhH8d7D0WZyT1AQMuievD01TUmGO5zbc0llYsHt1kIKgsg8ECORk
         nYZkPoReaGVqgTh1I/EfMT6lYdJLt+pvcaaq6lzcxq3k9jU9Y7xkw7LsXKSXk6CP+W9b
         3PG+b4rNmsaVkecxSJB9TfKhXYypTR9U/2UzpZDSsJuxSRgnqkQt0P+Sa4nUG/0nmjQW
         AlwrdkWdSyn2OQL17SGAsySfud31H6bUiGhAjLkn4mKMHrgPkxMfC+l/8cBJYeiPGCMY
         JjXjyPVbcMNp3lCazHOev4hsIixOY0RP07eCI1MXXIRzuqq2JPReRpDa7XI3QT3fgwtu
         s7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762058; x=1785366858;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56NrxXkv0UVjMvjOx9by9wvi/d3mOyqzIaOMJLt53IU=;
        b=elCjPzVbij1vCK37MuHYDb5ct8KgfgbTYvUV4IaT2/x04Eqjad671pTjj7kcwsxly5
         1OUnw7q/D+BPxQPhI00EBZCdUIzsv7I8nvzCdIrSb4Hc3wYD+1A5OjyeQ56mCUmhA4uN
         6ThCOJiFpwRX+d4iIYDn4PTynxqEKcx9q8abeWhHc/j7zMJfpiiPe+Pr80PURZCtIG8u
         02a/KJE6qkC68FXKSXwJCmst4oN923XZj5rTG9LZPzwzxMozgB+BHPqfM9+MM6FR9t8I
         O9Lt4Wvlsx3AlMLLKBqpCtVPK4EigqbtDJL9AFGbG6IbTWHQuWmrvHGPo9BpB3cdBKa8
         0XSg==
X-Forwarded-Encrypted: i=1; AHgh+RpXS7X6EUehF20HXBBfNB/VsZG+qAUaJ+XdzCO71oCi67mSeQvfqbzhuEoCJA7aZ+Dvv7rpIQsj5vkw@lists.linux.dev
X-Gm-Message-State: AOJu0YxshOIi7dsHTHg7m6XaCJ3jo0fmUHCRWkVexQj9t4K+FSk564ch
	FesfJf7GVx/ZyCO/siESpSLGT5llmRX8tdS+XcIE/UOLDGW4I9ShitSPVjrAvWSnoENn2mfglfx
	Ah+giHQ==
X-Received: from pgjf8.prod.google.com ([2002:a63:dc48:0:b0:c85:db34:d7a])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a120:b0:3c3:7d12:a98c
 with SMTP id adf61e73a8af0-3c44b1e9a44mr575991637.52.1784762058127; Wed, 22
 Jul 2026 16:14:18 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:07 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=2831;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=nMhWICLdSh2frl7tfIaV4/PZJX0MLcCDKg8/gFmmfRA=; b=DaBxIbGI4Q0JBXmDhiTdq0R4HtbImm2MoSdd8eyphcWciY2zj/Me0FR8j6E77p6MHWfkCdI9m
 uxtlRF4MdCVArlmm+NgiqHHnt0Vm2NLFNdYXiXh739s5M6YknSSRwMS
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-2-15ad654a50db@google.com>
Subject: [PATCH v14 02/22] KVM: selftests: Update kvm_init_vm_address_properties()
 for TDX
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
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="utf-8"

From: Isaku Yamahata <isaku.yamahata@intel.com>

Initialize the TDX S-bit and the GPA tag mask in
kvm_init_vm_address_properties() for TDX VMs, similar to how the C-bit
is initialized for SEV VMs.

The TDX S-bit is used to distinguish between shared and private guest
physical addresses. Its position is determined by the guest physical
address width, which is either 48 or 52 bits for current TDX
implementations.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h | 14 ++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c        | 12 ++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
new file mode 100644
index 000000000000..f647e6ca6b34
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTESTS_TDX_TDX_UTIL_H
+#define SELFTESTS_TDX_TDX_UTIL_H
+
+#include <stdbool.h>
+
+#include "kvm_util.h"
+
+static inline bool is_tdx_vm(struct kvm_vm *vm)
+{
+	return vm->type == KVM_X86_TDX_VM;
+}
+
+#endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index b51467d70f6e..b68ad1dc7e02 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -11,6 +11,7 @@
 #include "smm.h"
 #include "svm_util.h"
 #include "sev.h"
+#include "tdx/tdx_util.h"
 #include "vmx.h"
 
 #ifndef NUM_INTERRUPTS
@@ -1311,12 +1312,19 @@ void kvm_get_cpu_address_width(unsigned int *pa_bits, unsigned int *va_bits)
 
 void kvm_init_vm_address_properties(struct kvm_vm *vm)
 {
+	u32 gpa_bits = kvm_cpu_property(X86_PROPERTY_GUEST_MAX_PHY_ADDR);
+
+	vm->arch.sev_fd = -1;
+
 	if (is_sev_vm(vm)) {
 		vm->arch.sev_fd = open_sev_dev_path_or_exit();
 		vm->arch.c_bit = BIT_ULL(this_cpu_property(X86_PROPERTY_SEV_C_BIT));
 		vm->gpa_tag_mask = vm->arch.c_bit;
-	} else {
-		vm->arch.sev_fd = -1;
+	} else if (is_tdx_vm(vm)) {
+		TEST_ASSERT(gpa_bits == 48 || gpa_bits == 52,
+			    "TDX: bad X86_PROPERTY_GUEST_MAX_PHY_ADDR value: %u", gpa_bits);
+		vm->arch.s_bit = BIT_ULL(gpa_bits - 1);
+		vm->gpa_tag_mask = vm->arch.s_bit;
 	}
 }
 

-- 
2.55.0.229.g6434b31f56-goog

