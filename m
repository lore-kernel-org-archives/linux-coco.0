Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFAC2FB7
	for <linux-coco@lists.linux.dev>; Tue, 10 Aug 2021 06:26:26 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id x27so16605444lfu.5
        for <linux-coco@lists.linux.dev>; Mon, 09 Aug 2021 23:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yhM9rzQZh1hFlmIsdV4JGrfhMhv28jDR+Y6mMaIyOd4=;
        b=iI6obK6IDsJ5WRxV6OM1M/tAx2RUXXdpWjOOljATFp3gKmjcJd16cMca3CRczpVk90
         vdUUedOazrl3bkG2F0IfOJ6AItLxNYJwCF1n4JKF50+TflcgrRKXqnKIm/J/THTyieZr
         KsM8HcwID/NK5sqFV1M5hQPxhiER2JGcI0YABCRIa4iVTkIyyqaNxusuU50potUPb3Oi
         PUB+8f9Ij8rl+y/qgnVCYh7HdM2F7I53V4Dh1DLgERtHiB2qPWoUfEd0GCbBsUCX6DAg
         /nKOFs0c2RkzNtTU4ew3Npu0B4ABZRqH7MBpxW8V+hsglvKIqewABkD2rTgSDih6C3Up
         n1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yhM9rzQZh1hFlmIsdV4JGrfhMhv28jDR+Y6mMaIyOd4=;
        b=aTyNXB0GbhBO6FeOf8pRurcG2ky7FEeFwSKby3HosMgKSP6Wt9GQOSgVdTNppORh99
         Yr8Bsr0lf5asuZ0adI9VxbR/W1gAyjb2x4xz/jrQEaaLvOuC5F+4gTn9p0S+iK+pGOjn
         oc92EhX9uZYKQP0iWZGTO7WCPXDi+EvFiDXvfvxTlCsb7NT2N10/SeYe/KpsMGiXGT0o
         4SrmePZ/pNHSl8gWcA4ZM/a6aJbbAKf8IMGl6gXTIILc5qPbpchIlUHxkLwEgWZD3Ker
         fSzO8//qJsrecOY/ubbSJmDHb28dvEav3fxhDnc2tCAzcqTB6+u4YUTfsTyRexChW2f4
         D4lQ==
X-Gm-Message-State: AOAM530S/NEN1cPrj/zYPYzdBbLTJA2D0KwnTBySQD0fa0YYtSmV1o36
	jhcp9xBmB1UfNrtWo9/ijMozeA==
X-Google-Smtp-Source: ABdhPJywOJGNlI7IqnnlU0lsO+YPTdIUQE6GK58teoRywSZHJeH0Ifngw9u6S0AYbWyYjWXtNj2VvA==
X-Received: by 2002:a05:6512:e86:: with SMTP id bi6mr21473291lfb.592.1628576784944;
        Mon, 09 Aug 2021 23:26:24 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id w27sm264085lfa.308.2021.08.09.23.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 23:26:22 -0700 (PDT)
From: "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
	id A60D9102BDA; Tue, 10 Aug 2021 09:26:34 +0300 (+03)
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
Subject: [PATCH 3/5] x86/boot/compressed: Handle unaccepted memory
Date: Tue, 10 Aug 2021 09:26:24 +0300
Message-Id: <20210810062626.1012-4-kirill.shutemov@linux.intel.com>
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

Firmware is responsible for accepting memory where compressed kernel
image and initrd land. But kernel has to accept memory for decompression
buffer: accept memory just before decompression starts

KASLR allowed to use unaccepted memory for output buffer.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/boot/compressed/bitmap.c            | 62 ++++++++++++++++++++
 arch/x86/boot/compressed/kaslr.c             | 14 ++++-
 arch/x86/boot/compressed/misc.c              |  9 +++
 arch/x86/boot/compressed/unaccepted_memory.c | 13 ++++
 arch/x86/include/asm/unaccepted_memory.h     |  2 +
 5 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/arch/x86/boot/compressed/bitmap.c b/arch/x86/boot/compressed/bitmap.c
index bf58b259380a..ba2de61c0823 100644
--- a/arch/x86/boot/compressed/bitmap.c
+++ b/arch/x86/boot/compressed/bitmap.c
@@ -2,6 +2,48 @@
 /* Taken from lib/string.c */
 
 #include <linux/bitmap.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+
+unsigned long _find_next_bit(const unsigned long *addr1,
+		const unsigned long *addr2, unsigned long nbits,
+		unsigned long start, unsigned long invert, unsigned long le)
+{
+	unsigned long tmp, mask;
+
+	if (unlikely(start >= nbits))
+		return nbits;
+
+	tmp = addr1[start / BITS_PER_LONG];
+	if (addr2)
+		tmp &= addr2[start / BITS_PER_LONG];
+	tmp ^= invert;
+
+	/* Handle 1st word. */
+	mask = BITMAP_FIRST_WORD_MASK(start);
+	if (le)
+		mask = swab(mask);
+
+	tmp &= mask;
+
+	start = round_down(start, BITS_PER_LONG);
+
+	while (!tmp) {
+		start += BITS_PER_LONG;
+		if (start >= nbits)
+			return nbits;
+
+		tmp = addr1[start / BITS_PER_LONG];
+		if (addr2)
+			tmp &= addr2[start / BITS_PER_LONG];
+		tmp ^= invert;
+	}
+
+	if (le)
+		tmp = swab(tmp);
+
+	return min(start + __ffs(tmp), nbits);
+}
 
 void __bitmap_set(unsigned long *map, unsigned int start, int len)
 {
@@ -22,3 +64,23 @@ void __bitmap_set(unsigned long *map, unsigned int start, int len)
 		*p |= mask_to_set;
 	}
 }
+
+void __bitmap_clear(unsigned long *map, unsigned int start, int len)
+{
+	unsigned long *p = map + BIT_WORD(start);
+	const unsigned int size = start + len;
+	int bits_to_clear = BITS_PER_LONG - (start % BITS_PER_LONG);
+	unsigned long mask_to_clear = BITMAP_FIRST_WORD_MASK(start);
+
+	while (len - bits_to_clear >= 0) {
+		*p &= ~mask_to_clear;
+		len -= bits_to_clear;
+		bits_to_clear = BITS_PER_LONG;
+		mask_to_clear = ~0UL;
+		p++;
+	}
+	if (len) {
+		mask_to_clear &= BITMAP_LAST_WORD_MASK(size);
+		*p &= ~mask_to_clear;
+	}
+}
diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index e36690778497..89cdc17dcbf1 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -729,10 +729,20 @@ process_efi_entries(unsigned long minimum, unsigned long image_size)
 		 * but in practice there's firmware where using that memory leads
 		 * to crashes.
 		 *
-		 * Only EFI_CONVENTIONAL_MEMORY is guaranteed to be free.
+		 * Only EFI_CONVENTIONAL_MEMORY and EFI_UNACCEPTED_MEMORY (if
+		 * supported) are guaranteed to be free.
 		 */
-		if (md->type != EFI_CONVENTIONAL_MEMORY)
+
+		switch (md->type) {
+		case EFI_CONVENTIONAL_MEMORY:
+			break;
+		case EFI_UNACCEPTED_MEMORY:
+			if (IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
+				break;
 			continue;
+		default:
+			continue;
+		}
 
 		if (efi_soft_reserve_enabled() &&
 		    (md->attribute & EFI_MEMORY_SP))
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 743f13ea25c1..eeefcde8394d 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -18,6 +18,7 @@
 #include "../string.h"
 #include "../voffset.h"
 #include <asm/bootparam_utils.h>
+#include <asm/unaccepted_memory.h>
 
 /*
  * WARNING!!
@@ -435,6 +436,14 @@ asmlinkage __visible void *extract_kernel(void *rmode, memptr heap,
 #endif
 
 	debug_putstr("\nDecompressing Linux... ");
+
+	if (IS_ENABLED(CONFIG_UNACCEPTED_MEMORY) &&
+	    boot_params->unaccepted_memory) {
+		debug_putstr("Accepting memory... ");
+		accept_memory((phys_addr_t)output,
+			      (phys_addr_t)output + needed_size);
+	}
+
 	__decompress(input_data, input_len, NULL, NULL, output, output_len,
 			NULL, error);
 	parse_elf(output);
diff --git a/arch/x86/boot/compressed/unaccepted_memory.c b/arch/x86/boot/compressed/unaccepted_memory.c
index c2eca85b5073..17b70627b0cd 100644
--- a/arch/x86/boot/compressed/unaccepted_memory.c
+++ b/arch/x86/boot/compressed/unaccepted_memory.c
@@ -34,3 +34,16 @@ void mark_unaccepted(struct boot_params *params, u64 start, u64 num)
 	bitmap_set((unsigned long *)params->unaccepted_memory,
 		   start / PMD_SIZE, npages);
 }
+
+void accept_memory(phys_addr_t start, phys_addr_t end)
+{
+	unsigned long *unaccepted_memory;
+	unsigned int rs, re;
+
+	unaccepted_memory = (unsigned long *)boot_params->unaccepted_memory;
+	bitmap_for_each_set_region(unaccepted_memory, rs, re,
+				   start / PMD_SIZE, end / PMD_SIZE) {
+		__accept_memory(rs * PMD_SIZE, re * PMD_SIZE);
+		bitmap_clear(unaccepted_memory, rs, re - rs);
+	}
+}
diff --git a/arch/x86/include/asm/unaccepted_memory.h b/arch/x86/include/asm/unaccepted_memory.h
index cbc24040b853..f1f835d3cd78 100644
--- a/arch/x86/include/asm/unaccepted_memory.h
+++ b/arch/x86/include/asm/unaccepted_memory.h
@@ -9,4 +9,6 @@ struct boot_params;
 
 void mark_unaccepted(struct boot_params *params, u64 start, u64 num);
 
+void accept_memory(phys_addr_t start, phys_addr_t end);
+
 #endif
-- 
2.31.1

