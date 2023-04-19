Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E271D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:19:09 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-63b4a64c72bso365646b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942749; x=1684534749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8vKC+DATLxW+QWgEBtVVKhLwPezg/zgsscm2TPJ1sU=;
        b=BwX+DM7PF0bcRvAKKIu4MHKKajOEzXLxGIauLswkbEgjP6DJZ6w6f7IIzl8Qpi8c98
         ed4C65vIGkkrNIrLR5kdnMXy2vcDHhmfQHa8C6amTJnDRxQZMkqxUQV7hs024Ati36Dt
         zpHCU/W8PLW1oErRDOCQdSTnQVm/WTAOCvbqhuYsNSC3p+RiRejOdpcZADkJX6CbNoIH
         9EVmLfGzACsyDnRZvTGg/b8+8stR7Al9zVOUv8bZ/yCdHCLAg6/FhYsFSYe4Yx79Lh8K
         qgEDVcvH60RycDNT8QKaO1+287IZvvLfcWjMdpa7LI9GrhUlCgUkAt3/dSeYRn7Itqpu
         sgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942749; x=1684534749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8vKC+DATLxW+QWgEBtVVKhLwPezg/zgsscm2TPJ1sU=;
        b=LMEp3b1OrSe9XlajQqvVQTLIqKsAwFUmpE52mit6OZhlbXsgJbzyAO6iVt6hrdMzQq
         cAfcaBrp0w5Ir5+2hhBkJghJRHLME3Q3R5MKK3RFyp9Vo3pvF8j8iYY5Pqmq5nqzlTJT
         UbvidL2ZI/0+KR85km8fOA0gz1H/AW1wFrzRT52XjFSfA+0EXa2o80fXIe/DKmydvkjo
         rn2ZOKU7MzhoLL5IT5DBLY7bNCIdezVTThf1hAMHBDniNsJ8mQah6MnuT/HfYaitemJl
         7vLRuZyPgNILy39ddLiiw4GXuyg3cNU/o+xYUPS5H7ucBirBMilwSmueZ8ApEp5+Baf3
         5VfA==
X-Gm-Message-State: AAQBX9e9h9s6PzE9KSstd+DC5uywzup558HfQLpSgo1GImKVxFucQq3/
	2lU6ovVPuGK2Xeuim1aB4GKqdQ==
X-Google-Smtp-Source: AKy350YMt1GXaXJLEtI/tcFCT7P2BRkKgLnzDade8rOaHZzTbglX9T86uEwEdM3HEdy8DD35oL3itg==
X-Received: by 2002:a17:903:3013:b0:1a2:8940:6da4 with SMTP id o19-20020a170903301300b001a289406da4mr5416617pla.29.1681942749582;
        Wed, 19 Apr 2023 15:19:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:09 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap hooks
Date: Wed, 19 Apr 2023 15:17:13 -0700
Message-Id: <20230419221716.3603068-46-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

The guests running in CoVE must notify the host about its mmio regions
so that host can enable mmio emulation.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/mm/Makefile  |  1 +
 arch/riscv/mm/ioremap.c | 45 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/riscv/mm/ioremap.c

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 1fd9b60..721b557 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -15,6 +15,7 @@ obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pgtable.o
 obj-y += pmem.o
+obj-y += ioremap.o
 
 ifeq ($(CONFIG_MMU),y)
 obj-$(CONFIG_SMP) += tlbflush.o
diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
new file mode 100644
index 0000000..0d4e026
--- /dev/null
+++ b/arch/riscv/mm/ioremap.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#include <linux/export.h>
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+#include <linux/io.h>
+#include <asm/covg_sbi.h>
+#include <asm/cove.h>
+#include <asm-generic/io.h>
+
+void ioremap_phys_range_hook(phys_addr_t addr, size_t size, pgprot_t prot)
+{
+	unsigned long offset;
+
+	if (!is_cove_guest())
+		return;
+
+	/* Page-align address and size. */
+	offset = addr & (~PAGE_MASK);
+	addr -= offset;
+	size = PAGE_ALIGN(size + offset);
+
+	sbi_covg_add_mmio_region(addr, size);
+}
+
+void iounmap_phys_range_hook(phys_addr_t addr, size_t size)
+{
+	unsigned long offset;
+
+	if (!is_cove_guest())
+		return;
+
+	/* Page-align address and size. */
+	offset = addr & (~PAGE_MASK);
+	addr -= offset;
+	size = PAGE_ALIGN(size + offset);
+
+	sbi_covg_remove_mmio_region(addr, size);
+}
-- 
2.25.1

