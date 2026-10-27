Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069809;
	b=Ow+O0MtndooTHq1uJYqIKkPHrXDpFbJFqjDu9j95Rq+cPXENS1CtYOaQoeSKXOxSd0vK
	 sguCRNlB3OygUkNIM1BDNWC6d9XcKDs2uPaHfU+QeH8LX33zodz3t+yR29hqTQUCvmHTb
	 bImtsaKgVClRPwk39+PFtM3i+HTmkSZGXXDF99voSGOYVwnLUzEOUiXd/Pk3UYX+skTdA
	 7qu6PDQ7GfMgS6hA1FrNEpuvFo636CiOLd0jUQN3EHssK+vILgKM7TWQbmdx9Gyl4Uz1i
	 glpXk3dRMRgYo3Eq1TcO4nTi+FwUfHflE+svMXvuWz6YsTbfQpe+0QYoHu80SGm7/Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=i2TVROB2tkypKL2JwuC8PelARTqsfICvFAyjnT/ZhdE=;
	b=ISmBkurGpCsf4gonAEYQYW81+j5U3qtyZlXA5sLlaoUdcN3ptQCXoh+AmfpvBOV+oeqB
	 l1yiVzTU/u34PhhLbJ04HJdloZ7Wu9/08Y29JCI+jknnF9GJTZeRC5ARnxeBpAJ0YTut1
	 sGsGWjBirQiR0bH2DN3fNXwLV4krOop5npWczKqdQ+yTAC9kAeZEClGxyGpOaa87xuY/0
	 czQAx3GgrclXJPdFnyk2hjlPa9TmXQwiebiIp7vw2xkPF9iDGhoqDQIfrlKK500x5ADs2
	 9bh2yFtbNkoIgMWt8Ph5dWLZr/x0oZHlhAoZi3x2vwD8KRNqW/bdKtJqDrCppxVKgcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JMg1DWOK;
	arc=none smtp.remote-ip=209.85.161.69
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954F6606A31B
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 02:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 954F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JMg1DWOK
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6f8edf0c859so663256eaf.0
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 19:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793069809; x=1793674609; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2TVROB2tkypKL2JwuC8PelARTqsfICvFAyjnT/ZhdE=;
        b=JMg1DWOK1dUFkSPE2BCJP526jt+/TulYRNEBzk5Zgc8IqYdA8wfSJyDAp1wgp+JnDQ
         1a4vEY4jpHf6hOdhGcj7Djlrz9pxatYZJJF4ssJPjEVclgHNICuZ7a20hqFIADX9eSlw
         ygl/9BaQsvSg8fR5iG8WUV4PRqCxFhC2WPGCC62xHKWvfjNk6TK0Cx6r/lzk7VrHHHn2
         lRHslyriykbkp5upreinojSdyuMt0zBWpKCaqemWSoUv5q2dRCepPWjU5mQtzXbUC2a3
         thDzYetFP8TeHbI+d3ENc4JJFfuU74x2h+EgUY9/eaf3K3OGMMAdfz9HjukNrgFaLzqj
         w4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069809; x=1793674609;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i2TVROB2tkypKL2JwuC8PelARTqsfICvFAyjnT/ZhdE=;
        b=0Xnsa6V85wXVlWDPu65BZhmaBgPuh9wf0GTqyzD2MccZdu9Xq/+TFAOeSda0qQ0ImP
         bwabp1Qt4niJI3zZuJhxjQWFHsqQnUrTprc1GCd7A7kWioZlHGjw2qAuiL0CDourw3fL
         M/q1CQ72N+pQt9/UHFNHrczUX0ZFWGUobd/vVkF612WJMVJSPxim27GWeT1EjGpsjPAC
         QuFy0YtuQjChtan10GoUN6F/pAfoBpT44Qk0y2FI8/1tpICNTh35h9RWPmnclV6/LT0z
         7Yu5Dsd0WeoOMFwSS+oGsv+Id51bcSWiu1XhGSuhCR8K3libzufMLtqYJx/ufk/K1OCy
         gQGg==
X-Forwarded-Encrypted: i=1; AKwUvByORSdi+9ywg/y2ADQzr2c5eefex/Da/yAW/Tk1Osr60WeZ+xsWqdtE031rvqDfmFxmZOMQE97te3J+@lists.linux.dev
X-Gm-Message-State: AFq9FYIeoFQppdgbQzhlAzsPSWYTxElNzCQYcqKyy8C82iMwKqK30Wje
	GgDfNP0AO2iJtGYkQGqCWu7/0Hh8FTkCozPpBiCh+kH9z0VQ2dgMn/60n/+8I4vg/2sLniLl4hE
	/bKYh4i/4W00yaGqmJl+oYpStI/yQIbKuzQ==
X-Received: from ioyd21.prod.google.com ([2002:a05:6602:2bf5:b0:9c4:de2b:c40f])
 (user=kevinloughlin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1ca4:b0:702:c1a4:7563 with SMTP id 006d021491bc7-7126910deb4mr1003099eaf.8.1793069808399;
 Mon, 26 Oct 2026 19:56:48 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:56:08 +0000
In-Reply-To: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027025616.1632690-6-kevinloughlin@google.com>
Subject: [PATCH 05/13] efi/libstub: start unaccepted bitmap at address 0
From: Kevin Loughlin <kevinloughlin@google.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>
Cc: virtualization@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sidharth Telang <sidtelang@google.com>, Punit Salian <psalian@google.com>, 
	Peter Gonda <pgonda@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Jacky Li <jackyli@google.com>, Steve Rutherford <srutherford@google.com>, 
	David Skidmore <davidskidmore@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

When EFI_UNACCEPTED_MEMORY is present in the EFI memory map or the
platform supports dynamic memory unacceptance (such as AMD SEV-SNP),
start the EFI unaccepted memory bitmap at physical address 0
(phys_base = 0) instead of the lowest initial unaccepted address.

This ensures that pre-accepted low memory below the initial unaccepted
region is addressable in the bitmap so it can be dynamically marked
unaccepted and re-accepted later via virtio-balloon or free page
reporting. Non-confidential guests without EFI_UNACCEPTED_MEMORY
continue to skip allocating the table.

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
---
 .../firmware/efi/libstub/unaccepted_memory.c  | 45 ++++++++++++++-----
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/efi/libstub/unaccepted_memory.c b/drivers/firmware/efi/libstub/unaccepted_memory.c
index 757dbe734a47..fcb622ac0564 100644
--- a/drivers/firmware/efi/libstub/unaccepted_memory.c
+++ b/drivers/firmware/efi/libstub/unaccepted_memory.c
@@ -2,15 +2,28 @@
 
 #include <linux/efi.h>
 #include <asm/efi.h>
+#if defined(CONFIG_X86) && defined(CONFIG_AMD_MEM_ENCRYPT)
+#include <asm/sev.h>
+#endif
 #include "efistub.h"
 
 struct efi_unaccepted_memory *unaccepted_table;
 
+static bool efi_stub_has_dynamic_unaccepted_memory(void)
+{
+#if defined(CONFIG_X86) && defined(CONFIG_AMD_MEM_ENCRYPT)
+	return sev_get_status() & MSR_AMD64_SEV_SNP_ENABLED;
+#else
+	return false;
+#endif
+}
+
 efi_status_t allocate_unaccepted_bitmap(__u32 nr_desc,
 					struct efi_boot_memmap *map)
 {
 	efi_guid_t unaccepted_table_guid = LINUX_EFI_UNACCEPTED_MEM_TABLE_GUID;
-	u64 unaccepted_start = ULLONG_MAX, unaccepted_end = 0, bitmap_size;
+	bool has_unaccepted = efi_stub_has_dynamic_unaccepted_memory();
+	u64 unaccepted_end = 0, bitmap_size;
 	efi_status_t status;
 	int i;
 
@@ -30,19 +43,27 @@ efi_status_t allocate_unaccepted_bitmap(__u32 nr_desc,
 		unsigned long m = (unsigned long)map->map;
 
 		d = efi_memdesc_ptr(m, map->desc_size, i);
-		if (d->type != EFI_UNACCEPTED_MEMORY)
-			continue;
-
-		unaccepted_start = min(unaccepted_start, d->phys_addr);
-		unaccepted_end = max(unaccepted_end,
-				     d->phys_addr + d->num_pages * PAGE_SIZE);
+		switch (d->type) {
+		case EFI_UNACCEPTED_MEMORY:
+			has_unaccepted = true;
+			fallthrough;
+		case EFI_LOADER_CODE:
+		case EFI_LOADER_DATA:
+		case EFI_BOOT_SERVICES_CODE:
+		case EFI_BOOT_SERVICES_DATA:
+		case EFI_CONVENTIONAL_MEMORY:
+			unaccepted_end = max(unaccepted_end,
+					     d->phys_addr +
+					     d->num_pages * EFI_PAGE_SIZE);
+			break;
+		default:
+			break;
+		}
 	}
 
-	if (unaccepted_start == ULLONG_MAX)
+	if (!has_unaccepted || unaccepted_end == 0)
 		return EFI_SUCCESS;
 
-	unaccepted_start = round_down(unaccepted_start,
-				      EFI_UNACCEPTED_UNIT_SIZE);
 	unaccepted_end = round_up(unaccepted_end, EFI_UNACCEPTED_UNIT_SIZE);
 
 	/*
@@ -59,7 +80,7 @@ efi_status_t allocate_unaccepted_bitmap(__u32 nr_desc,
 	 * The bitmap will be populated in setup_e820() according to the memory
 	 * map after efi_exit_boot_services().
 	 */
-	bitmap_size = DIV_ROUND_UP(unaccepted_end - unaccepted_start,
+	bitmap_size = DIV_ROUND_UP(unaccepted_end,
 				   EFI_UNACCEPTED_UNIT_SIZE * BITS_PER_BYTE);
 
 	status = efi_bs_call(allocate_pool, EFI_ACPI_RECLAIM_MEMORY,
@@ -72,7 +93,7 @@ efi_status_t allocate_unaccepted_bitmap(__u32 nr_desc,
 
 	unaccepted_table->version = 1;
 	unaccepted_table->unit_size = EFI_UNACCEPTED_UNIT_SIZE;
-	unaccepted_table->phys_base = unaccepted_start;
+	unaccepted_table->phys_base = 0;
 	unaccepted_table->size = bitmap_size;
 	memset(unaccepted_table->bitmap, 0, bitmap_size);
 
-- 
2.56.0.307.g5fe7bd680c-goog

