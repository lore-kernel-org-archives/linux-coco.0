Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0152A584C4
	for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 21:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2ZyxrFy"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5a9bc2ec556so3758257a12.0
        for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 13:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700601634; x=1701206434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbfDwkGJGwxULqg8ltFjMn30Y46reH21KWF1N/yir7w=;
        b=G2ZyxrFya+1e9DKNsRe/i4bNYt5R+YhgUYV/aEhs6JCFOLqQU82QFgFz58z3b7nHFz
         j5yqNl473TJi6u46wbGsn201lF9nEg/cgLemhPKqS1we/gd0YA5z/qgOkcOJ/AGIayPU
         YWlsr0fVN6L2UfrCmhzOZEzcd6tZ6DfzR4X7aPAZ6bPj3ELdgSVSSOYiDpCDwvVPvlNd
         PWSpsw8vVHbyNCz4/0rJzI9Yvg6jQsyVlP/TzuIz05MAvEnyQNDIM5pigK9Fr3tBZJ6C
         Q19vUA2z294mnEf5UGdAWbcFShcTmiRFux/Gs5SH7g+LTkZ6LyyiEfqw2tasaSjDs363
         WbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601634; x=1701206434;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rbfDwkGJGwxULqg8ltFjMn30Y46reH21KWF1N/yir7w=;
        b=qBVGFAxn8f5yTwqU9j3n/LqhYUbeD6iybfAplTCH98CmOlIfV8Axz1jGXEE1kfT4l3
         VQsbtw2dPxLlF9vSCSQ8rmk8ikZ0iBrUkY2WSKhhMvV2AcijV4qTV++agNMY8HJhChCe
         j9pjL9M3hNeYBEOFwdPMy+Pgwc73g0MwWL+ln7NtYPdbO+rOz7OvWLG39dFCoWwMYnPX
         F2sQA6ScJyi2FnDNiliN9IScCzQtp49cBM2iEjQ61xf1Cd1hjXx+vltES+4g1CeAXr8e
         aPKWTlhKCWwBHytn7TPx8pzQf3z7B7BJ2v3EFdD9nDGGmo7hK+M4G94uhCw0B1t+2ecE
         BSgA==
X-Gm-Message-State: AOJu0YwkrSjWrKzedAk2kv0DUvxj727W6xzPiJ510HEjfiliH1Nh7VyF
	FGXP6LPpol4eiYFNNjmCzRPTmOIDorE=
X-Google-Smtp-Source: AGHT+IEOsjamSGHkOASGUCwZPWO7OmI3DBmh+Jjr7fpstRfuOke2KTseFR9lGErT7CmT9qeaxU040A==
X-Received: by 2002:a17:903:32c1:b0:1cf:6656:69cf with SMTP id i1-20020a17090332c100b001cf665669cfmr467098plr.21.1700601634054;
        Tue, 21 Nov 2023 13:20:34 -0800 (PST)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b001bf52834696sm8281924pll.207.2023.11.21.13.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 13:20:33 -0800 (PST)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	kirill.shutemov@linux.intel.com,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	luto@kernel.org,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	urezki@gmail.com,
	hch@infradead.org,
	lstoakes@gmail.com,
	thomas.lendacky@amd.com,
	ardb@kernel.org,
	jroedel@suse.de,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-hyperv@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 1/8] x86/coco: Use slow_virt_to_phys() in page transition hypervisor callbacks
Date: Tue, 21 Nov 2023 13:20:09 -0800
Message-Id: <20231121212016.1154303-2-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121212016.1154303-1-mhklinux@outlook.com>
References: <20231121212016.1154303-1-mhklinux@outlook.com>
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Kelley <mhklinux@outlook.com>

In preparation for temporarily marking pages not present during a
transition between encrypted and decrypted, use slow_virt_to_phys()
in the hypervisor callbacks. As long as the PFN is correct,
slow_virt_to_phys() works even if the leaf PTE is not present.
The existing functions that depend on vmalloc_to_page() all
require that the leaf PTE be marked present, so they don't work.

Update the comments for slow_virt_to_phys() to note this broader usage
and the requirement to work even if the PTE is not marked present.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 arch/x86/hyperv/ivm.c        |  9 ++++++++-
 arch/x86/kernel/sev.c        |  8 +++++++-
 arch/x86/mm/pat/set_memory.c | 13 +++++++++----
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 02e55237d919..8ba18635e338 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -524,7 +524,14 @@ static bool hv_vtom_set_host_visibility(unsigned long kbuffer, int pagecount, bo
 		return false;
 
 	for (i = 0, pfn = 0; i < pagecount; i++) {
-		pfn_array[pfn] = virt_to_hvpfn((void *)kbuffer + i * HV_HYP_PAGE_SIZE);
+		/*
+		 * Use slow_virt_to_phys() because the PRESENT bit has been
+		 * temporarily cleared in the PTEs.  slow_virt_to_phys() works
+		 * without the PRESENT bit while virt_to_hvpfn() or similar
+		 * does not.
+		 */
+		pfn_array[pfn] = slow_virt_to_phys((void *)kbuffer +
+					i * HV_HYP_PAGE_SIZE) >> HV_HYP_PAGE_SHIFT;
 		pfn++;
 
 		if (pfn == HV_MAX_MODIFY_GPA_REP_COUNT || i == pagecount - 1) {
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 70472eebe719..7eac92c07a58 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -811,7 +811,13 @@ static unsigned long __set_pages_state(struct snp_psc_desc *data, unsigned long
 		hdr->end_entry = i;
 
 		if (is_vmalloc_addr((void *)vaddr)) {
-			pfn = vmalloc_to_pfn((void *)vaddr);
+			/*
+			 * Use slow_virt_to_phys() because the PRESENT bit has been
+			 * temporarily cleared in the PTEs.  slow_virt_to_phys() works
+			 * without the PRESENT bit while vmalloc_to_pfn() or similar
+			 * does not.
+			 */
+			pfn = slow_virt_to_phys((void *)vaddr) >> PAGE_SHIFT;
 			use_large_entry = false;
 		} else {
 			pfn = __pa(vaddr) >> PAGE_SHIFT;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index bda9f129835e..8e19796e7ce5 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -755,10 +755,15 @@ pmd_t *lookup_pmd_address(unsigned long address)
  * areas on 32-bit NUMA systems.  The percpu areas can
  * end up in this kind of memory, for instance.
  *
- * This could be optimized, but it is only intended to be
- * used at initialization time, and keeping it
- * unoptimized should increase the testing coverage for
- * the more obscure platforms.
+ * It is also used in callbacks for CoCo VM page transitions between private
+ * and shared because it works when the PRESENT bit is not set in the leaf
+ * PTE. In such cases, the state of the PTEs, including the PFN, is otherwise
+ * known to be valid, so the returned physical address is correct. The similar
+ * function vmalloc_to_pfn() can't be used because it requires the PRESENT bit.
+ *
+ * This could be optimized, but it is only used in paths that are not perf
+ * sensitive, and keeping it unoptimized should increase the testing coverage
+ * for the more obscure platforms.
  */
 phys_addr_t slow_virt_to_phys(void *__virt_addr)
 {
-- 
2.25.1

