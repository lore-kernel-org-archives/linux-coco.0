Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922456;
	b=vsVZP8j6RtWH8OQKslQC+yL48WeVM5XuO5PqYmbFkwhPlpvTwmk46FU76k7mgeWW07w+
	 4Fv381QDWbQxXuQcW40NE+WkccnTbGu31auGZXnZkV0xOl4g1c9PhH2w27e88n1UMw6FD
	 2e63nkcF8x9p3fGJ/ISsnUf1p19356kVH1lM+RLo9MxOJ4oSx2eR6rwznG3K1wN46ee/i
	 37Ce5en1yaGwJczh0ZTtJ1OaFCj6KP2S1R3108UWS4osbEj/f+Du3F1UsSOOBl1l8uLTm
	 402vrlCtZc7WJq7zoKhUFG9oq44WzU0XZvd/T7Exe9dWnHobPrLejJOrYhaa0Gc1+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HSVxAxPHxLWJb+QPPocaz3W4kDp/YO8WZ+4Cex73wUQ=;
	b=WVavRcGJV06KPsUZZddpX7fr6AQ1xmtyqKLJ/ESw5/Q0KHgOGif1GsFN24uksLrD3kx8
	 cxbmd9v4KyztjtjXwigVGDNa7X7VwAKqXxfBtq6QmlyUzeDvGQVqkIfLykt8Zix3iF1v0
	 UZBZnZ2n22CYmMPnrKUIFoYjP488PL2faL0Z1fjccHn2fOCCTnC253uWsTq333S6UzApp
	 xMtFpRWnbJ/1H8FJezJ39uXrsocTaWz2ZAxb2srxXgBSH61ZgekN5XUckVeXRkQBgYsRF
	 WAcYqB14CQej+5yYJiK26paIhIYCl31oiXH8paeGBCwxMVL+knO8CmVOc2EMV6RSHVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i3VERukA;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0609606D802
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0609606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i3VERukA
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso55793a91.3
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922455; x=1794527255; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSVxAxPHxLWJb+QPPocaz3W4kDp/YO8WZ+4Cex73wUQ=;
        b=i3VERukAivkPxIjc3cvapuvg6mZDD2w8QKkEA5Gx3TrRs3gbkYj+pDHqL/ONZxsVLZ
         EajbNnGrsvEd9VDGuiedyPYNHb4VhxEPOv5MRjNyqvfsxSV4BNM1QcKhL54jemsbe18k
         9Rm5wpIqTzmEuuILM4zmAtlWE8qS7HenVQbGH1I87RoDEH+wnCA8O3lsnr8KoPEEz7tk
         snVkaNC7mauu6Ba4k04KvMLnn/jbjwomqcVhr0eL+chohIZM3L6mY4erL0M4tFmmntw1
         9Sw54WUQfUiWKoTM8yeDcyiSLuRhGfjPMptm3jizaa2JS6mFTyipEL1HXeN8WBc5C5W6
         52Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922455; x=1794527255;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSVxAxPHxLWJb+QPPocaz3W4kDp/YO8WZ+4Cex73wUQ=;
        b=FeweJr4oJw4DogupeZj32Iw7M/B5ct7FM+8H6gKhBf/8rDs3iKwnhVR5s02xu5Jq85
         CIXoOI1XFBLXJQ+ISkXo+7L5yoh8l6JTl2aK/4VK9nQmqhEVmCl9Q2R588tMvBTYVxu0
         ApFFctuLpOpBwdFGCeJOVUVjP7tuEgxgGES2v3q08v6Een+2lS9kJuR5+XItCZQupOHe
         RQgLXANX9nTS3lvLErfH1tFxPcehnc/4113rIZBWe20q+dXRv+AChc+iI68qX/iFvEgM
         vM0t1R6SlXtbdpMU9mtWLjXoN7AAtHJhaPSKe1Ss9a6gWNUgevEGG4ur6j9g8ObOasSG
         tyTg==
X-Forwarded-Encrypted: i=1; AKwUvByVMbl5kkPKRtZB5Xd+PJp+ZqQVS86B+PMfEoNRlcBSip3SeC0U1F4c0qXoB/keJqAy+o31BF2qFs2I@lists.linux.dev
X-Gm-Message-State: APuU4Z84sf7ZeveNiArpZlKOrv7NO/Ou1YqKA+mr0FCKpCVdDmM3fprP
	ve27It2ozc1fTRLBXPqpz6u54bSgoM412hQpkxpdJ6of3w+KBo+fVlJ9jqZGdAqOi6/54IaCNyb
	XWv/ycQ==
X-Received: from pgdu12.prod.google.com ([2002:a05:6a02:2f4c:b0:cdb:58e2:7cb7])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b8f:b0:3a0:b312:1fbe
 with SMTP id 98e67ed59e1d1-3b0db6c99a4mr578689a91.23.1793922454815; Thu, 05
 Nov 2026 15:47:34 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:46 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=2831;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=TsmjAstaSjFYixQhUYbJbOkD7vAXJprj3EzMr2Dw2cA=; b=v+qqqNmrw6MMK/e1gCj/lL1NXgXSnN2daUTFtgMasIYlyr9pv1EkxsDPEdCOygMDueOA2GoPI
 lOq7jE2xRQNDXan3XM0CV7U61a7ubrgmr7yreT7TB9VfkU0sqfxfFEr
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-2-2024e8fa517a@google.com>
Subject: [PATCH v16 02/20] KVM: selftests: Update kvm_init_vm_address_properties()
 for TDX
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
	Adrian Hunter <adrian.hunter@intel.com>, Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Isaku Yamahata <isaku.yamahata@intel.com>

Initialize the TDX S-bit and the GPA tag mask in
kvm_init_vm_address_properties() for TDX VMs, similar to how the C-bit
is initialized for SEV VMs.

The TDX S-bit is used to distinguish between shared and private guest
physical addresses. Its position is determined by the guest physical
address width, which is either 48 or 52 bits for current TDX
implementations.

Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
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
index 8374afd08baf..d705e9269a41 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -11,6 +11,7 @@
 #include "smm.h"
 #include "svm_util.h"
 #include "sev.h"
+#include "tdx/tdx_util.h"
 #include "vmx.h"
 
 #ifndef NUM_INTERRUPTS
@@ -1337,12 +1338,19 @@ void kvm_get_cpu_address_width(unsigned int *pa_bits, unsigned int *va_bits)
 
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
2.56.0.455.g6c5a503b38-goog

