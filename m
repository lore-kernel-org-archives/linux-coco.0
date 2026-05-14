Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAE73D1A8E
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795647; cv=none; b=ipIb+FbvM94FtwJiwUhPbN24ACghuJuw64v2DLxgNegoE3HezpAF5coc0PxFfro5EeA5UvcF92IcEbYUHUpxdGRc3Ccio3SzMD3ntnzf+q6ZoyHeZ/NMjqLkzmb9XF4jpJvipAAz/IYvrsqKXiy4VvzvrKBB/1sYG4Zrdq7pc+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795647; c=relaxed/simple;
	bh=G1jqVtRGMHHU2pYLXqlDWhngOFL0xaMmd6fXfWamkcQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VfLEWxsy3+9tkEwqCmRnGonNGS2kHBxxdC0IxmL5SdcB3YNjWzS9kdMf46yORMq95dLS22XQT4nM3Hq3wTgLBvVAdGEpfdcgho5SjK3xOdDTkj3+SxW7zDQtNS1WrEBOAxgDnqPvJAe7msyqG2PFX95hd8w3cx2yzTqeL5Ew5Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nyBsD0oC; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nyBsD0oC"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so193702b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795644; x=1779400444; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uJv9wi2J1zMACcV+TLkHPu/SNZnF0/LBSZ3jiwDXSHs=;
        b=nyBsD0oCcdOOjlNvxt1sTz2VEnZAwCWyXAPZ6mV4c0JjfhKUe3i1WjROQm3kysdqPV
         K46pfD5eOZEpJM/ye7UvMuMx8OtNKvqYGolxd8xGKj2sFUGQlcGrnorIWYRFi4pDYpcE
         VVvmTLEEM8EvasYNJa2KV2e9YK9RnpmtxhMUq7li2C1lc3BHAWy7Pfor1Nwax8eIIYhE
         R0t6cJlTbvJkDI3CrVwU/ZeVtswrSzcA9xQsQp9N1cB2jYefSokfvfgm43/GOTE3Jymn
         qf63zGKdmybw+vZON5F01GfwAR/afKBdYfFvhbksAREbqbNIe5vW1+HFfLyTWCzNWBhI
         FZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795644; x=1779400444;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJv9wi2J1zMACcV+TLkHPu/SNZnF0/LBSZ3jiwDXSHs=;
        b=TDwY2lBCnX0zmxTFqYvBA4g0EPLt4g9fz5dcYjlIHlmlD9NFX6/u6qutZGKvv65dts
         YKkVT03r9f9w/P44nfOum9cVE0icnM6+oIwWATEMF4X056p4c6VMc9kifBsK3wJB0/mA
         DUVU/4sotyrIB776www5XM2uDChtwC7s9PM3MZcB33X1iIJ5wF5uwQNp7g1tK8j8Kimi
         Xn9T3M1mEc/ovS0PeowPK5oqqEaDm6zZZMbI7Pti0fyjgAkdK2fhmYxetR5jxVNuYXTR
         T2PEufHa3yROR+A/zAaWKPjfdsBd6m3bhVlEMkV5IbKVGPQqVae/ZK3xSjqwmuFaqUyv
         OkOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+k7Cy81Yn47aWwqFQ5xxfhy+ySaldmHy3RQOvA13YZ5VaadJgShjVRrDLZBMyYh9/rY9YbFlAeb2KP@lists.linux.dev
X-Gm-Message-State: AOJu0YytTniJesSuqYsXiVQdSgG35fln1Oxob6MwPBf42Z60TxnIRQ9T
	yrrlGAbVmFilP+p+ENp+agaBuIf/ELMUDThd5GdmRr0gM1alSaIVCUinHOnjgVsxiNjjGIyIgHj
	EFGv/OQ==
X-Received: from pfblg3.prod.google.com ([2002:a05:6a00:7083:b0:82e:7f41:df84])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a227:b0:82c:9c90:6ea0
 with SMTP id d2e1a72fcca58-83f33ad8782mr1023609b3a.3.1778795643702; Thu, 14
 May 2026 14:54:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:46 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-7-seanjc@google.com>
Subject: [PATCH v2 06/15] KVM: x86: Rename kvm_cache_regs.h => regs.h
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Kai Huang <kai.huang@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Rename kvm_cache_regs.h to simply regs.h, as the "cache" nomenclature is
already a lie (the file deals with state/registers that aren't cached per
se), and so that more code/functionality can be landed in the header
without making it a truly horrible misnomer.

Deliberately drop the kvm_ prefix/namespace to align with other "local"
headers, and to further differentiate regs.h from the public/global
arch/x86/include/asm/kvm_vcpu_regs.h, which sadly needs to stay in asm/
so that the number of registers can be referenced by kvm_vcpu_arch.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/emulate.c                    | 2 +-
 arch/x86/kvm/lapic.c                      | 2 +-
 arch/x86/kvm/mmu.h                        | 2 +-
 arch/x86/kvm/mmu/mmu.c                    | 2 +-
 arch/x86/kvm/{kvm_cache_regs.h => regs.h} | 4 ++--
 arch/x86/kvm/smm.c                        | 2 +-
 arch/x86/kvm/svm/svm.c                    | 2 +-
 arch/x86/kvm/svm/svm.h                    | 2 +-
 arch/x86/kvm/vmx/nested.h                 | 2 +-
 arch/x86/kvm/vmx/sgx.c                    | 2 +-
 arch/x86/kvm/vmx/vmx.c                    | 2 +-
 arch/x86/kvm/vmx/vmx.h                    | 2 +-
 arch/x86/kvm/x86.c                        | 2 +-
 arch/x86/kvm/x86.h                        | 2 +-
 14 files changed, 15 insertions(+), 15 deletions(-)
 rename arch/x86/kvm/{kvm_cache_regs.h => regs.h} (99%)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 8013dccb3110..6e64761f64b1 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -20,7 +20,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "kvm_emulate.h"
 #include <linux/stringify.h>
 #include <asm/debugreg.h>
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 4078e624ca66..d8dbfb107bfb 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -37,7 +37,7 @@
 #include <asm/delay.h>
 #include <linux/atomic.h>
 #include <linux/jump_label.h>
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "irq.h"
 #include "ioapic.h"
 #include "trace.h"
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index ddf4e467c071..e1bb663ebbd5 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -3,7 +3,7 @@
 #define __KVM_X86_MMU_H
 
 #include <linux/kvm_host.h>
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "x86.h"
 #include "cpuid.h"
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c87c26bf4149..b8f2edf2cfeb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -22,7 +22,7 @@
 #include "mmu_internal.h"
 #include "tdp_mmu.h"
 #include "x86.h"
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "smm.h"
 #include "kvm_emulate.h"
 #include "page_track.h"
diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/regs.h
similarity index 99%
rename from arch/x86/kvm/kvm_cache_regs.h
rename to arch/x86/kvm/regs.h
index 2ae492ad6412..4440f3992fce 100644
--- a/arch/x86/kvm/kvm_cache_regs.h
+++ b/arch/x86/kvm/regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef ASM_KVM_CACHE_REGS_H
-#define ASM_KVM_CACHE_REGS_H
+#ifndef ARCH_X86_KVM_REGS_H
+#define ARCH_X86_KVM_REGS_H
 
 #include <linux/kvm_host.h>
 
diff --git a/arch/x86/kvm/smm.c b/arch/x86/kvm/smm.c
index f623c5986119..a446487bdd5c 100644
--- a/arch/x86/kvm/smm.c
+++ b/arch/x86/kvm/smm.c
@@ -3,7 +3,7 @@
 
 #include <linux/kvm_host.h>
 #include "x86.h"
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "kvm_emulate.h"
 #include "smm.h"
 #include "cpuid.h"
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 4ad87f8df392..be775d285ce7 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4,7 +4,7 @@
 
 #include "irq.h"
 #include "mmu.h"
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "x86.h"
 #include "smm.h"
 #include "cpuid.h"
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 2b6733dffd76..b8c7f4535691 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -23,7 +23,7 @@
 #include <asm/sev-common.h>
 
 #include "cpuid.h"
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "x86.h"
 
 /*
diff --git a/arch/x86/kvm/vmx/nested.h b/arch/x86/kvm/vmx/nested.h
index 213a448104af..6d6cd5904ddf 100644
--- a/arch/x86/kvm/vmx/nested.h
+++ b/arch/x86/kvm/vmx/nested.h
@@ -2,7 +2,7 @@
 #ifndef __KVM_X86_VMX_NESTED_H
 #define __KVM_X86_VMX_NESTED_H
 
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "hyperv.h"
 #include "vmcs12.h"
 #include "vmx.h"
diff --git a/arch/x86/kvm/vmx/sgx.c b/arch/x86/kvm/vmx/sgx.c
index 4c61fc33f764..66c315554b46 100644
--- a/arch/x86/kvm/vmx/sgx.c
+++ b/arch/x86/kvm/vmx/sgx.c
@@ -6,7 +6,7 @@
 #include <asm/sgx.h>
 
 #include "x86.h"
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "nested.h"
 #include "sgx.h"
 #include "vmx.h"
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b02d176800f8..67bc6edfd856 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -59,7 +59,7 @@
 #include "hyperv.h"
 #include "kvm_onhyperv.h"
 #include "irq.h"
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "lapic.h"
 #include "mmu.h"
 #include "nested.h"
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index daedf663c0a9..de9de0d2016c 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -10,7 +10,7 @@
 #include <asm/posted_intr.h>
 
 #include "capabilities.h"
-#include "../kvm_cache_regs.h"
+#include "../regs.h"
 #include "pmu_intel.h"
 #include "vmcs.h"
 #include "vmx_ops.h"
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 23b3957b9ae0..ab13aed2cbd0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -23,7 +23,7 @@
 #include "mmu.h"
 #include "i8254.h"
 #include "tss.h"
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "kvm_emulate.h"
 #include "mmu/page_track.h"
 #include "x86.h"
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 38a905fa86de..2bbecc83ecc2 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -6,7 +6,7 @@
 #include <asm/fpu/xstate.h>
 #include <asm/mce.h>
 #include <asm/pvclock.h>
-#include "kvm_cache_regs.h"
+#include "regs.h"
 #include "kvm_emulate.h"
 #include "cpuid.h"
 
-- 
2.54.0.563.g4f69b47b94-goog

