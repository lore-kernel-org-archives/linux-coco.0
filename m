Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922457;
	b=JHNt+5pk5c8W94VABXUQqj/KOzi9GT1R6felOwxzoSfxaiT/RN8L+la3cfea2gSmoky+
	 PtjpPHHwuwW/euCcSg0/1lGMZSWAslvPMvNt4KxiMNDGWY0xJEgMnTAMX31Gb/BNzRA8B
	 NuoaAMlw5rriLCd78WsE4V19Yt84Isjv7w05u61KRDhm2A//NduIgl3AiKMfyJQyu0D/y
	 pG4hpymFBqnQ6BlwzCzl8alWSMC3SyUCwobvXMTZT0qEatlF8qaUWz5TsAUYkEpeqwBeR
	 eTnUs1HOpJVuAL4rd8RVYO9H57YLzU53Y4+E7T55Fj+WfGH6t2iOePhLa1r7fzOMXuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tDICajUls+MVU3nlT8BKXeQcBxsJx76UetcWcsPTkIY=;
	b=lQgb/3HfbuPx0EHgwZD05BbkPY08IT/5FJ+abWaE7m/0+64zmV/FBLqpzBF2neDnlaIH
	 qji40TQOwSJtfwdIAJTiLUHiyeOg5Mi+b3h1tDZdnrLXDU8nbOuNbu7cEpacJX17Iwd+D
	 tdRx6K/hRLjCGiB6jPE+Z1ZZZXXsDRUO3MND3ELHt2sCCt3/D6IpACnwU8YRMwm8egvvR
	 WXnkeLM3Fu4VuPGjeLQbHFYUVVjWj+vjCXoCdxIXTLfEsiWLiRLS1k9TShhacQj3yJTyu
	 MgLI55nKjFlQw3xl0bfBCeldhULiaXlTx8XKhNNsSLfe2WSQu+bj2Uu30MLhc0FHmDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ov09XbTU;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C68E606D81E
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C68E606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ov09XbTU
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso563405ad.3
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922457; x=1794527257; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDICajUls+MVU3nlT8BKXeQcBxsJx76UetcWcsPTkIY=;
        b=Ov09XbTUKOT8/bwSJXJK0NtkGObbYz7umJ519suQhUxHLyMkDkiQ5c/xhv9xUTe+Y1
         w9mNAVWkDpn5eijfXFheN4/eKrqAr2D+cNyIIN4SmjTGumpXpfFSYxdsoP5gySk5fIZe
         WCuF95s2Pp1/Qub3cpsoyDPn53PaHx1rvkF+fYv7YpeX3gI9lGH6+tF/6fsvNx8UyDyY
         Ny1bR6Fc95v9owIuSeU165JGL4Jh4HTiJOPvC+NVmd21viSlebfl34ChAadLSa18i1w2
         sD0Z93dst/17pcpvHsUCQoCkPpa/OocHMwD8kd5l5UKHKfQfn7mX7Lm9E3NR9v9Xv9ih
         CoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922457; x=1794527257;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDICajUls+MVU3nlT8BKXeQcBxsJx76UetcWcsPTkIY=;
        b=ZlxF3ABBxNv+QISBuaITiwbVs4Qlip2etxICgBe+1x0fot1O8bwsU2v/w2DHSA81Y/
         LceZr8U4tz834m5YsJ8RlHdXPDBTWa/WbRUc/fWMcQZW18eNyYc/a3n3AL3qurF4t0ab
         V7kKWhBfd+da58Yoso0XiwFUFMWsN+heZzIuiUf7Tkn2/zBUfo/pL6OX11DGGBVv8yHn
         oKZOICGY/5NYXxIqgTnA+Z9VBBosyyDib4z2yKNkPpcUhn/NCHBAmiPqPormjL2fgbk2
         rp710jnovh6wHzmBI4cRjzmizKilh4RWqEDVkVwp3RkHYFFNDxGfeZLV7obx7DyMrUIp
         HA4A==
X-Forwarded-Encrypted: i=1; AKwUvBxe+iF1lN6EQS5LcqQZcniRX/LU0YKOyaA95wRq2WNcA8OUcRYlZgsPg3NdKxGlzKHc6KMDdSQTdDps@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZgjW986iaLcyxLOXL8BT/gtioiNUT8vov+KCtEXkknakyxpiZ
	DDRXKNbmQTgSzKNZfdLEV80Zof3DnXqNn3dH8de6viNGTGjcQ38shsztg3edPH07otc5WdeNiHM
	MNqMLaA==
X-Received: from plby6.prod.google.com ([2002:a17:902:ed46:b0:2e9:6f2c:71c3])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d586:b0:2ed:1df2:8b3c
 with SMTP id d9443c01a7336-2ed40bfdea1mr11999425ad.35.1793922456623; Thu, 05
 Nov 2026 15:47:36 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:48 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=1874;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=IUPFZFhS7USNqKMmulO0C0asUQ2Oci8U479LkW/s9KA=; b=AR5YKEO3dhz9+FQd/gbj96lSfiYyiK9uIPX1gpsBLe2AZJFI3pI8PL/ZgFBfiz3mTltPh4Eqr
 JHjwka7cH0lCTq6KIBdUR42ALzeVAoz1L0b2N2Rzd7iP7yvVyB1wpHE
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-4-2024e8fa517a@google.com>
Subject: [PATCH v16 04/20] KVM: selftests: Expose segment definitions to
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
index 7bbc0df49a18..fe56df0c7aa4 100644
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
2.56.0.455.g6c5a503b38-goog

