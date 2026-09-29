Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFD53E763B
	for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 04:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654619; cv=none; b=eP82owS3bD8eDeY0BIfnyX5uE32lBnK0+VPcRdY4RPlmpJIMHPeJVzatv6hGJuzl3xi0U1uowYixQrgYx7BSWM/1GSS+svV1Yn3A8oEhNRyfMIS81Gu3RAYlWHDQ2ueuDYyOy4AhumfeDWdTAaoFO/FFFplUv5c3Xk/biB1MW4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654619; c=relaxed/simple;
	bh=rUzQo5KHgL8B6Zt2JDNYEUTyvIMbiqzpi4ZnuUlZBBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3z0+hxvyGSgjbubzRCvat6jAItzu7HjBJdiDLOTuII5vCWlXIOWiII9id5P+jJEbEihE4C4/GQIAbvcVAIb+k3kpcyx/avbEhCD9AS3Dfs6fktCSCvVh9PfPjyCsSL4a75xSBoleOhF4gn0rfNLmPZP5bSmhSKbTLEr8wA5wT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ER1BL5Gs; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ER1BL5Gs"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1561008a91.2
        for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 21:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790654616; x=1791259416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV8TEMBP6IF+2lIlzYCpg42JpAwpPVBphnZX2jCaOFA=;
        b=F596UCtMldmaZCGWA3EnnMv/SbX31ZA2xvZxV9Uhtec3EAtdqX6XMcmCVVp5ybpCwe
         ykhxUaSZs933qR1M58SIdgDYqjpo+DGc6x4CjeUgE6C7D8RyiJPAeMwr95lJabKDnc9I
         HQmoP4HKicfPPlEJVJScS34QaItPwUU1ZHE9YOSD5diRvyKJzQ13r08JxH82AB3UjM3u
         Z/k27A1vGRNGEFemUGPH0Q9EJtlxj3L2kQf5c06FELaIB91142B5qdtvjbbOlo86EDK/
         YhPeIQyN7O3RMEuoLIaNno6mcKHMYWOIbT+LuIqBpXLwyuWNz9vyr+6deOv7qaD+KabX
         hJ5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxv4Yfk4DgsLWb1lcseG3h47JixzsUO2YJZ8edFKu1Wl3H9cfpX80USyt+mHE+wPqjw2GvrEzxggV+6@lists.linux.dev
X-Gm-Message-State: AFq9FYKbacUDVTKPn8PXYblrdv3wgiax9cl8woLm0+9htKMXezqEQkG4
	DgmYV/TO3QEE2s5b+uJndaJU72A6gvw+6qW2Qol0VN2xin27pTPKne9rOkWSwI8TNZrQ4OonCaa
	xu33MUWmG4grwlC5EBENs5bbNQEchrUd2Ryj4gLH2PZ5S5UhTsuV08xyftfWCWqEJX2LRq34sbs
	oQ09xatPSv4rdVyvx80ZtxkL2o/AiEORaDCV43HCUPBZ0nTdEQ/kVL6D/23+JsSmyr+vWhiW0k3
	1vgPwQzPrd9gA==
X-Gm-Gg: AYBFou26kpKzH8Nc5cipGV+VVy9cb+GzBwLBZmBePBi+63KPHhmevib9bpZC9D/Z4sQ
	VaBDgLbmcNl7b81qfOkzHjGc0OLj2yeGN4+PhHd4YTxa0rrJb5d3dCydKfG8DLgtLYPotasmEbT
	ZRfNP8jOKONyd+eLTCYVtQ3p+h9JD3t/tl/MkEqv+sEl7vmkrmXkiD6jXJ83V3bZ8qbRwt0qd3Q
	VgfyQu04EpI5CjK86a074VhbFer6TGQ6lFTkymrLGphl4dcG9wZTR7CoIBca5kwoUENV8UyL2Qx
	489aKR7TtbndEZIy7hf+Op/vb8OIFwwjr+pIeFX/B8JvGUmHSg2ey2mM2yImCbyFX/QGas85oTx
	PyKYP258fSPX/OUZYpvWXkz7zBfMy/h6pwBfNxVAuhrQJ0n/3khY/Uj1wfDGmUX685uxNc2suUO
	Xe5Fyqpcc3hUDB33rrLZGxZMOJe51d7y5/p64=
X-Received: by 2002:a17:90b:2d8c:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3a4967c70d5mr970163a91.21.1790654616371;
        Mon, 28 Sep 2026 21:03:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a498edd9b8sm336646a91.4.2026.09.28.21.03.34
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 21:03:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342217d8d53so12163088eec.0
        for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 21:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790654613; x=1791259413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CV8TEMBP6IF+2lIlzYCpg42JpAwpPVBphnZX2jCaOFA=;
        b=ER1BL5Gs94jlqX99uKXYE7uTM/ldG3TrwA73UTle11mQcD2c1zSXEzl/Je/cXcdliJ
         y6Xg+/5kLvju4AhxSMFn/KiULmKJSNypTLmuwWi75V88hBSNRQ2/rv+BX01lRKxNLAYV
         DBQiSytdKdoX22QB03AxzvfqPINQsVdMvIPzI=
X-Forwarded-Encrypted: i=1; AKwUvBxPLqLq1C4zAkv5pdT/TmLkbEsiMVxFGg0qufxKLJA7wwqO3Vi4vZVmqQapWHgzL/WcLwVxR932a0sy@lists.linux.dev
X-Received: by 2002:a05:7301:4d0b:b0:341:d191:b838 with SMTP id 5a478bee46e88-34272562bc0mr12611794eec.31.1790654612967;
        Mon, 28 Sep 2026 21:03:32 -0700 (PDT)
X-Received: by 2002:a05:7301:4d0b:b0:341:d191:b838 with SMTP id 5a478bee46e88-34272562bc0mr12611727eec.31.1790654612252;
        Mon, 28 Sep 2026 21:03:32 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm10952571eec.15.2026.09.28.21.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:03:29 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Kiryl Shutsemau <kas@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bo Gan <bo.gan@broadcom.com>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>
Subject: [PATCH v2 5/6] x86/tdx: Support early sharing of kernel data
Date: Tue, 29 Sep 2026 00:02:54 -0400
Message-ID: <20260929040256.543767-6-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929040256.543767-1-zack.rusin@broadcom.com>
References: <20260929040256.543767-1-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Share pages before the page allocator is available, after both their
direct-map and kernel-image mappings have been made shared. Preserve
initial contents in a private scratch page, matching the AMD early helper,
and use the existing MapGPA path and shared-page accounting.

UP per-CPU data has an image alias. Drop shared image mappings before
kexec converts their backing pages to private through the direct map.

Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Link: https://lore.kernel.org/r/aqqGUAX65s4LdJkr@thinkstation
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/coco/tdx/tdx.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index f904a636d449..4a683e9eafc3 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -4,6 +4,7 @@
 #undef pr_fmt
 #define pr_fmt(fmt)     "tdx: " fmt
 
+#include <linux/cacheflush.h>
 #include <linux/cpufeature.h>
 #include <linux/export.h>
 #include <linux/io.h>
@@ -18,6 +19,7 @@
 #include <asm/paravirt_types.h>
 #include <asm/pgtable.h>
+#include <asm/sections.h>
 #include <asm/set_memory.h>
 #include <asm/traps.h>
 
 /* MMIO direction */
@@ -1006,6 +1008,23 @@ static int tdx_enc_status_change_finish(unsigned long vaddr, int numpages,
 	return 0;
 }
 
+static char tdx_early_buffer[PAGE_SIZE] __initdata __aligned(PAGE_SIZE);
+
+static int __init tdx_early_decrypt_page(unsigned long addr, unsigned long alias)
+{
+	void *buffer = __va(__pa_symbol(tdx_early_buffer));
+	int ret;
+
+	memcpy(buffer, (void *)addr, PAGE_SIZE);
+	clflush_cache_range((void *)addr, PAGE_SIZE);
+	early_set_page_decrypted(addr, alias);
+	ret = tdx_enc_status_change_finish(addr, 1, false);
+	if (ret)
+		return ret;
+	memcpy((void *)addr, buffer, PAGE_SIZE);
+	return 0;
+}
+
 /* Stop new private<->shared conversions */
 static void tdx_kexec_begin(void)
 {
@@ -1033,6 +1052,18 @@ static void tdx_kexec_finish(void)
 
 	lockdep_assert_irqs_disabled();
 
+	/* Drop image aliases before the direct-map walk makes pages private. */
+	addr = (unsigned long)_text;
+	while (addr < _brk_end) {
+		unsigned int level;
+		pte_t *pte = lookup_address(addr, &level);
+
+		if (pte && pte_decrypted(*pte))
+			set_pte(pte, __pte(0));
+		addr = (addr & page_level_mask(level)) + page_level_size(level);
+	}
+	__flush_tlb_all();
+
 	addr = PAGE_OFFSET;
 	end  = PAGE_OFFSET + get_max_mapped();
 
@@ -1160,6 +1191,7 @@ void __init tdx_early_init(void)
 	 */
 	x86_platform.guest.enc_status_change_prepare = tdx_enc_status_change_prepare;
 	x86_platform.guest.enc_status_change_finish  = tdx_enc_status_change_finish;
+	x86_init.paging.early_decrypt_page = tdx_early_decrypt_page;
 
 	x86_platform.guest.enc_cache_flush_required  = tdx_cache_flush_required;
 	x86_platform.guest.enc_tlb_flush_required    = tdx_tlb_flush_required;
-- 
2.53.0

