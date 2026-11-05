Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922480;
	b=VTscghGSV52c6ku0C0q6juDZhy95LMdKbsvy+ymEHGLsr+gGXY6pPgFda+EVKWaV19n/
	 tItIq9ez+FyPOqpm347+I9dTKebeDfZIIDo8oTV6xVBedJ+4L8jgqofWkl1jbdUOaDq5y
	 LvGLmlkjqbNERRB37ad6/b+YE0c6gVd8wnD/eij8AGeVlYdRnmFmMSRge1gYJZYjxZeaZ
	 DS2XrmjjIsOBxb72g33lcZkJbefVCM1xbwOz4XE5jrxg6QKT4+KdG3SGrD8DzZOmiuITb
	 rI7fAvjBJl3ysZknFJVi5Jm+2L7SVYEb+2f9CUsNQVm2m2vAwa89k5UU3SyedCxHG5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=5XK1YSSiiA4WmmUnF56HGEq5CRIfmQKX3JC+zcltYJQ=;
	b=caoSCJAc58y9gST0KKFNMTyBPi0zCwDyyzZCzntEKsFJVZc2c4fITasVwDuHtTCf+H5J
	 y0HuvTawKfyWhZeBp6EgdnvHvyjtZdMdV5uzpcxbxUzUSlUlmTDJBnAdV5azl7nGwn5Ty
	 jdU+vU/PvAf1egaov42ENf5rNGQmM5U5exbyDeeV87Odw5kX2tOuZeNbSVeSH3qy+cUZR
	 8m4uGOQqRPvppK40kVAcnB/IU6FohD1OZrJ/uFL2iMTGL4Bi7xLeohJZ3fB4SRPWBoOlL
	 dSHedeDjU6FuEhZ5UD8faYcgttrl3XML6GkghQL2FFMTS1hfW/6BncDw6J4IYzh/PDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="G+7A/zIA";
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0368060A2615
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0368060A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G+7A/zIA
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2a74482so33788a12.3
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922479; x=1794527279; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XK1YSSiiA4WmmUnF56HGEq5CRIfmQKX3JC+zcltYJQ=;
        b=G+7A/zIAlHGSOHr8KdYrIgBDbUTAm3RKIYE90sPLnH4mw/Lnp9jS5Lnh9Lr30Vx6+5
         imofpHX2jHOgWXtderSOgnMz1+PALNvLRohN5iCCqHbED5ieOVkcT4yBdBBwq3tJtm9j
         Q17IUk/AowgqRpHHdNfigB8LTmC5vSbBSjlrWaAYEpcM7A7KXPhOYzytRdu3cX9ulL3d
         t7hPPddZGl621xahJ1yD/fuv73rgjdvBbri9WE1/xPkvp9M0ZzOv28XngAAMy1g90xy+
         0pTM6kIVsajPB+8U1ig8reYmtKGMMR5G+JegdrvNc92n34YrJbaUF1DAKgGM7dEVQM0h
         pQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922479; x=1794527279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XK1YSSiiA4WmmUnF56HGEq5CRIfmQKX3JC+zcltYJQ=;
        b=ocDvXy6tHNQ6j1QIx+9MHIMDzyN5kHF8QaHLwKdm/f+nTnEoGMHrMq+RTo5hDOxOtv
         I/vlu3DA8uoLyVUIP1DyujGvg67H7AGgz5gPdX82xVpfkMmFTAYdAiG8eEAENdGyzUTm
         +R0M8VsPgDji1FDsz7yvcuCHIbCyrRXZal8ittU7pkiYKNU8fgXtWug/8kW3ovU1yTl0
         PScUKvQf2igO3RndkAehnkJVtfRxXYHdKaRbA5qgN2AXGhQff9xEgL6Aqeh9oWtLZCKT
         dH4QAhQGEZvG8YOaeaXi8R6dFzGbL/SXwrDp8ebRFsdhCaogsbLp1ShseDHEyzApVYFN
         HSew==
X-Forwarded-Encrypted: i=1; AKwUvBxO/I+9DeDM0WipCbZfS2RKEdO6801f1xJVD710uyvzGXRdkoWRP7TxHW2eeAHyCPTtlbtXqnnVbuF7@lists.linux.dev
X-Gm-Message-State: APuU4Z8grrn+vbZgQF0cAbzfckTS+j4QJzLvLET2wHRaGAaWME7bm9Yx
	MBFlwK9gXj+lTlXUWE7REgsd0e0NAKASFTmt8HvMcv4QyPpqYcisvAfpNh7mWUbEfe/26fR4qLG
	HbXVZEw==
X-Received: from pjpu13.prod.google.com ([2002:a17:90a:a20d:b0:3a8:7374:19e9])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c0d:b0:3ab:b39f:41da
 with SMTP id 98e67ed59e1d1-3b0db6e04e3mr565340a91.11.1793922479064; Thu, 05
 Nov 2026 15:47:59 -0800 (PST)
Date: Thu, 05 Nov 2026 23:47:02 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=2640;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=pWnEq5zFqLJWNHptUXsnYM2oqxjXaqm1yYG5yOoXRkw=; b=6HoXdebY+5MC2Bax7uAk7M565VRvG1CnBtQiks6B3HlFCi1vONcu/O4Qbx1bADHdnysslN1gQ
 WEPkKqgTL0vAb1EWC/If5Q+oalKtxK68LszInLxgOUz/lmZ1tWcD41l
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-18-2024e8fa517a@google.com>
Subject: [PATCH v16 18/20] KVM: selftests: Add support for per-VM ucall ops on x86
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
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Add a layer of indirection to x86's ucall infrastructure to allow wiring up
a different set of {do,get}_ucall() operations for TDX VMs.  TDX can't use
port I/O (at least, not robustly), as the TDX ABI doesn't allow the guest
to share arbitrary register state with the host on a PIO exit, and the PIO
data payload is limited to 4 bytes, i.e. would potentially truncate the
address of the per-ucall structure.

No functional change intended, as the ops are still hardwired to the common
x86 ucall functions.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/include/x86/ucall.h |  6 +-----
 tools/testing/selftests/kvm/lib/x86/ucall.c     | 27 +++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/ucall.h b/tools/testing/selftests/kvm/include/x86/ucall.h
index 0e4950041e3e..aca582bb2cd5 100644
--- a/tools/testing/selftests/kvm/include/x86/ucall.h
+++ b/tools/testing/selftests/kvm/include/x86/ucall.h
@@ -2,12 +2,8 @@
 #ifndef SELFTEST_KVM_UCALL_H
 #define SELFTEST_KVM_UCALL_H
 
-#include "kvm_util.h"
+#include <linux/kvm.h>
 
 #define UCALL_EXIT_REASON       KVM_EXIT_IO
 
-static inline void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
-{
-}
-
 #endif
diff --git a/tools/testing/selftests/kvm/lib/x86/ucall.c b/tools/testing/selftests/kvm/lib/x86/ucall.c
index 38050c60a067..3aec4dd46d1b 100644
--- a/tools/testing/selftests/kvm/lib/x86/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86/ucall.c
@@ -8,13 +8,13 @@
 
 #define UCALL_PIO_PORT ((u16)0x1000)
 
-void ucall_arch_do_ucall(gva_t uc)
+static void ucall_x86_do_ucall(gva_t uc)
 {
 	asm volatile("in %[port], %%al"
 		: : [port] "d" (UCALL_PIO_PORT), "D" (uc) : "rax", "memory");
 }
 
-void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
+static void *ucall_x86_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
 
@@ -26,3 +26,26 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 	}
 	return NULL;
 }
+
+static struct {
+	void (*do_ucall)(gva_t uc);
+	void *(*get_ucall)(struct kvm_vcpu *vcpu);
+} ucall_x86_ops = {
+	.do_ucall = ucall_x86_do_ucall,
+	.get_ucall = ucall_x86_get_ucall,
+};
+
+void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
+{
+	sync_global_to_guest(vm, ucall_x86_ops);
+}
+
+void ucall_arch_do_ucall(gva_t uc)
+{
+	ucall_x86_ops.do_ucall(uc);
+}
+
+void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
+{
+	return ucall_x86_ops.get_ucall(vcpu);
+}

-- 
2.56.0.455.g6c5a503b38-goog

