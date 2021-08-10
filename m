Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD022FBF
	for <linux-coco@lists.linux.dev>; Tue, 10 Aug 2021 06:26:27 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id x8so39340400lfe.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Aug 2021 23:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wBfWTIHuoUkiwmizGdYmrNr5TmKY7E7Jf9eiL0J7uVk=;
        b=0h4kwTTU9bgsr5+7M2dbKNl6HdsvupLgIPjYSGLs6f8fz3APWo6zJSPPWqNXW4N/Li
         UunV42SnRXg/QfbOe6YhRwV3FHVUGTQLs/9luwBZqG1bEgUsxo7c8tHkZ+XQFDIuTpU/
         dE60LpbSxBQE68n6v6KGu9eg0zHbWg3jw9ysv+LSIJuLieR4bO4yps2uMY/2h7Q1vR2P
         q/QdcwI+rjdhzncpWhT1oKNYF68WnvwozDBbb0/dok1B+62Pzyuw46SN/Dp7slhPoMUW
         fd/rPnR6ZCWvPlxEXkK6rmZqS/R7ooKaJrHFi/MtCXKJLO9zPFiKSaryFrn4KeSfJFd0
         VQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wBfWTIHuoUkiwmizGdYmrNr5TmKY7E7Jf9eiL0J7uVk=;
        b=nGU1oAxa9bHudUqu2X3zUAD9Rg8MZkuMXq+UmIpCklc6eZSTYE8aSY7RQj+ws8YG/s
         IIXu8Avr1FquYfM67nyXVxcuuW11mVGHZ2RQuGHivcMUdpq3kxPl0LTPzhRoBK2ci3U7
         e2Vces1NhjCofyMnPhg2/YPn7/7NDa9q+eDmINLkppg7tgzB2UkPRup5OASKB5Nlf35G
         InuWvmmudZm6ci5xzz15Y+QCuH7ZSYnBS4ux6Af4sEYryk2NO9mk4Ek1kCxvH0sRE8E7
         nnrdgI6fD0RMnSv6afMYbBZ/pzb6Obg0UbPvAGR5O0U6S4czWxFHK36tNIZdPnAgoTXQ
         IMFA==
X-Gm-Message-State: AOAM533c/uArZnuf34di+OsuifpJ6XroJYAU6QJfIdVROoYJae6c+JpT
	dXQR7XAFXIgDwK6CklSC8TD2ww==
X-Google-Smtp-Source: ABdhPJwRONZllplmQufLj5RnClnVIfE2Nmqatiq9pV28+ucprKnq9Or8NIypwNI4s9sGELeie9B4GA==
X-Received: by 2002:ac2:443a:: with SMTP id w26mr3042148lfl.537.1628576785236;
        Mon, 09 Aug 2021 23:26:25 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id m13sm1948755lfu.5.2021.08.09.23.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 23:26:22 -0700 (PDT)
From: "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
	id AECA5102BDB; Tue, 10 Aug 2021 09:26:34 +0300 (+03)
To: Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>
Cc: Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 4/5] x86/mm: Provide helpers for unaccepted memory
Date: Tue, 10 Aug 2021 09:26:25 +0300
Message-Id: <20210810062626.1012-5-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
References: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core-mm requires few helpers to support unaccepted memory:

 - accept_memory() checks the range of addresses against the bitmap and
   accept memory if needed;

 - maybe_set_page_offline() checks the bitmap and marks a page with
   PageOffline() if memory acceptance is required on the first
   allocation of the page.

 - clear_page_offline() accepts memory for the page and clears
   PageOffline().

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/boot/compressed/unaccepted_memory.c |  3 +-
 arch/x86/include/asm/page.h                  |  5 ++
 arch/x86/include/asm/unaccepted_memory.h     |  3 +
 arch/x86/mm/Makefile                         |  2 +
 arch/x86/mm/unaccepted_memory.c              | 80 ++++++++++++++++++++
 5 files changed, 91 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/mm/unaccepted_memory.c

diff --git a/arch/x86/boot/compressed/unaccepted_memory.c b/arch/x86/boot/compressed/unaccepted_memory.c
index 17b70627b0cd..818d32169eef 100644
--- a/arch/x86/boot/compressed/unaccepted_memory.c
+++ b/arch/x86/boot/compressed/unaccepted_memory.c
@@ -13,8 +13,7 @@ void mark_unaccepted(struct boot_params *params, u64 start, u64 num)
 	unsigned int npages;
 
 	if ((start & PMD_MASK) == (end & PMD_MASK)) {
-		npages = (end - start) / PAGE_SIZE;
-		__accept_memory(start, start + npages * PAGE_SIZE);
+		__accept_memory(start, end);
 		return;
 	}
 
diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
index 4d5810c8fab7..1e56d76ca474 100644
--- a/arch/x86/include/asm/page.h
+++ b/arch/x86/include/asm/page.h
@@ -19,6 +19,11 @@
 struct page;
 
 #include <linux/range.h>
+
+#ifdef CONFIG_UNACCEPTED_MEMORY
+#include <asm/unaccepted_memory.h>
+#endif
+
 extern struct range pfn_mapped[];
 extern int nr_pfn_mapped;
 
diff --git a/arch/x86/include/asm/unaccepted_memory.h b/arch/x86/include/asm/unaccepted_memory.h
index f1f835d3cd78..712128760131 100644
--- a/arch/x86/include/asm/unaccepted_memory.h
+++ b/arch/x86/include/asm/unaccepted_memory.h
@@ -6,9 +6,12 @@
 #include <linux/types.h>
 
 struct boot_params;
+struct page;
 
 void mark_unaccepted(struct boot_params *params, u64 start, u64 num);
 
 void accept_memory(phys_addr_t start, phys_addr_t end);
 
+void maybe_set_page_offline(struct page *page, unsigned int order);
+void clear_page_offline(struct page *page, unsigned int order);
 #endif
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index b31cb52bf1bd..fe4e16322868 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -57,3 +57,5 @@ obj-$(CONFIG_X86_MEM_ENCRYPT_COMMON)	+= mem_encrypt_common.o
 obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= mem_encrypt.o
 obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= mem_encrypt_identity.o
 obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= mem_encrypt_boot.o
+
+obj-$(CONFIG_UNACCEPTED_MEMORY)	+= unaccepted_memory.o
diff --git a/arch/x86/mm/unaccepted_memory.c b/arch/x86/mm/unaccepted_memory.c
new file mode 100644
index 000000000000..e11933f62ead
--- /dev/null
+++ b/arch/x86/mm/unaccepted_memory.c
@@ -0,0 +1,80 @@
+#include <linux/memblock.h>
+#include <linux/mm.h>
+#include <linux/pfn.h>
+#include <linux/spinlock.h>
+
+#include <asm/io.h>
+#include <asm/setup.h>
+#include <asm/unaccepted_memory.h>
+
+static DEFINE_SPINLOCK(unaccepted_memory_lock);
+
+#define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
+
+static void __accept_memory(phys_addr_t start, phys_addr_t end)
+{
+	unsigned long *unaccepted_memory;
+	unsigned int rs, re;
+
+	unaccepted_memory = __va(boot_params.unaccepted_memory);
+	bitmap_for_each_set_region(unaccepted_memory, rs, re,
+				   start / PMD_SIZE,
+				   DIV_ROUND_UP(end, PMD_SIZE)) {
+		/* Platform-specific memory-acceptance call goes here */
+		panic("Cannot accept memory");
+		bitmap_clear(unaccepted_memory, rs, re - rs);
+	}
+}
+
+void accept_memory(phys_addr_t start, phys_addr_t end)
+{
+	if (!boot_params.unaccepted_memory)
+		return;
+
+	spin_lock(&unaccepted_memory_lock);
+	__accept_memory(start, end);
+	spin_unlock(&unaccepted_memory_lock);
+}
+
+void __init maybe_set_page_offline(struct page *page, unsigned int order)
+{
+	unsigned long *unaccepted_memory;
+	phys_addr_t addr = page_to_phys(page);
+	bool unaccepted = true;
+	unsigned int i;
+
+	if (!boot_params.unaccepted_memory)
+		return;
+
+	unaccepted_memory = __va(boot_params.unaccepted_memory);
+	spin_lock(&unaccepted_memory_lock);
+	if (order < PMD_ORDER) {
+		BUG_ON(test_bit(addr / PMD_SIZE, unaccepted_memory));
+		goto out;
+	}
+
+	for (i = 0; i < (1 << (order - PMD_ORDER)); i++) {
+		if (!test_bit(addr / PMD_SIZE + i, unaccepted_memory)) {
+			unaccepted = false;
+			break;
+		}
+	}
+
+	if (unaccepted)
+		__SetPageOffline(page);
+	else
+		__accept_memory(addr, addr + (PAGE_SIZE << order));
+out:
+	spin_unlock(&unaccepted_memory_lock);
+}
+
+void clear_page_offline(struct page *page, unsigned int order)
+{
+	phys_addr_t addr = page_to_phys(page);
+
+	/* PageOffline() page on a free list, but no unaccepted memory? Hm. */
+	WARN_ON_ONCE(!boot_params.unaccepted_memory);
+
+	accept_memory(addr, addr + (PAGE_SIZE << order));
+	__ClearPageOffline(page);
+}
-- 
2.31.1

