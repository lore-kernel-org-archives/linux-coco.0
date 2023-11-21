Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB11F584CE
	for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 21:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyUSPtCD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ce95f96edcso25963475ad.0
        for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 13:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700601638; x=1701206438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt8kvnxFSl+/wVVyFPR7xfVyeuKxVIIu+IJHgsCJP0Y=;
        b=SyUSPtCDg8JNDcHPTenHdKzzkS21nPcl+XYevQHMUkMbo7FeI9tcOkRja8134zcGZ7
         ypfJ2NwmDrbTIIOQET2mn2LII00SutqZBGNElWeSRanJujmRnxDEh3QTIYSh1zuWrFaH
         R215wuy7VtDiVU+xSJQnGrz5D92OBmDvyZzuIxTIYf/8DgyPsOUTYo4C2Y1GmnMPjMY3
         Nv30uS4jiHUoI/cE3YKugmZz9CjtLrvVa+Q6tliV4436Rj3qcJ4bnaS0VIvKiXyvLHcV
         tWjxDrU8H0AeMqVjoE80nGpuxiNauMnbzm5/z63VUubZjbNigQ9uOGH0Xfo/sr3irM1n
         Ol+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601638; x=1701206438;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nt8kvnxFSl+/wVVyFPR7xfVyeuKxVIIu+IJHgsCJP0Y=;
        b=ZvRg9+o3SWWlHewt9tUUwqBKkVLR+3GJ6qoRX63guHtanqAe3me66Fl3kxm1p7V5ea
         JlRxjDIURVzrUwE+lYVs+T3+a94/wzaNRFOkrz7BPrxg5cGV3FpWnsZIi3Ign9lxIdOv
         lwiaGUl63JaKIv+dQMimqHYbuFg3dPRYmTn/Tj4rnrueTWIYV+XhONhJN4M3E4eu1vAZ
         o4fSNq2dwo94hjGdF6dTKk+hJ7vGsdM3uaZYR3oi8WpRh/doyq+wY9kpCNnCU3unjPSe
         8IxgdmRCdk7LdzMyl02To2vw3JSY4E3xsGQCx9BjTDY1WwgO2dS5HSiALexaMteqxjMJ
         D/iw==
X-Gm-Message-State: AOJu0YyZcSTZRqhbtJD6TQGI/EHfpmatr6N2tof65o5gNhIODqqWpHwa
	HofCPGrAslyfciG+umrnPPs=
X-Google-Smtp-Source: AGHT+IEPwy5ASKSSy89dfpOvuqw7AqdqnJir15Ua8HeuGGJBuSGULdcSSfuzaTCr2on+/k5ZZyh5Vg==
X-Received: by 2002:a17:902:f687:b0:1cc:3bfc:69b1 with SMTP id l7-20020a170902f68700b001cc3bfc69b1mr443828plg.24.1700601637908;
        Tue, 21 Nov 2023 13:20:37 -0800 (PST)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b001bf52834696sm8281924pll.207.2023.11.21.13.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 13:20:37 -0800 (PST)
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
Subject: [PATCH v2 4/8] x86/sev: Enable PVALIDATE for PFNs without a valid virtual address
Date: Tue, 21 Nov 2023 13:20:12 -0800
Message-Id: <20231121212016.1154303-5-mhklinux@outlook.com>
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

For SEV-SNP, the PVALIDATE instruction requires a valid virtual
address that it translates to the PFN that it operates on.  Per
the spec, it translates the virtual address as if it were doing a
single byte read.

In transitioning a page between encrypted and decrypted, the direct
map virtual address of the page may be temporarily marked invalid
(i.e., PRESENT is cleared in the PTE) to prevent interference from
load_unaligned_zeropad(). In such a case, the PVALIDATE that is
required for the encrypted<->decrypted transition fails due to
an invalid virtual address.

Fix this by providing a temporary virtual address that is mapped to the
target PFN just before executing PVALIDATE. Have PVALIDATE use this
temp virtual address instead of the direct map virtual address. Unmap
the temp virtual address after PVALIDATE completes.

The temp virtual address must be aligned on a 2 Mbyte boundary
to meet PVALIDATE requirements for operating on 2 Meg large pages,
though the temp mapping need only be a 4K mapping.  Also, the temp
virtual address must be preceded by a 4K invalid page so it can't
be accessed by load_unaligned_zeropad().

This mechanism is used only for pages transitioning between encrypted
and decrypted.  When PVALIDATE is done for initial page acceptance,
a temp virtual address is not provided, and PVALIDATE uses the
direct map virtual address.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 arch/x86/boot/compressed/sev.c |  2 +-
 arch/x86/kernel/sev-shared.c   | 57 +++++++++++++++++++++++++++-------
 arch/x86/kernel/sev.c          | 32 ++++++++++++-------
 3 files changed, 67 insertions(+), 24 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 454acd7a2daf..4d4a3fc0b725 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -224,7 +224,7 @@ static phys_addr_t __snp_accept_memory(struct snp_psc_desc *desc,
 	if (vmgexit_psc(boot_ghcb, desc))
 		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PSC);
 
-	pvalidate_pages(desc);
+	pvalidate_pages(desc, 0);
 
 	return pa;
 }
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index ccb0915e84e1..fc45fdcf3892 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -1071,35 +1071,70 @@ static void __init setup_cpuid_table(const struct cc_blob_sev_info *cc_info)
 	}
 }
 
-static void pvalidate_pages(struct snp_psc_desc *desc)
+#ifdef __BOOT_COMPRESSED
+static int pvalidate_pfn(unsigned long vaddr, unsigned int size,
+			 unsigned long pfn, bool validate, int *rc2)
+{
+	return 0;
+}
+#else
+static int pvalidate_pfn(unsigned long vaddr, unsigned int size,
+			 unsigned long pfn, bool validate, int *rc2)
+{
+	int rc;
+	struct page *page = pfn_to_page(pfn);
+
+	*rc2 = vmap_pages_range(vaddr, vaddr + PAGE_SIZE,
+			PAGE_KERNEL, &page, PAGE_SHIFT);
+	rc = pvalidate(vaddr, size, validate);
+	vunmap_range(vaddr, vaddr + PAGE_SIZE);
+
+	return rc;
+}
+#endif
+
+static void pvalidate_pages(struct snp_psc_desc *desc, unsigned long vaddr)
 {
 	struct psc_entry *e;
-	unsigned long vaddr;
+	unsigned long pfn;
 	unsigned int size;
 	unsigned int i;
 	bool validate;
-	int rc;
+	int rc, rc2 = 0;
 
 	for (i = 0; i <= desc->hdr.end_entry; i++) {
 		e = &desc->entries[i];
 
-		vaddr = (unsigned long)pfn_to_kaddr(e->gfn);
-		size = e->pagesize ? RMP_PG_SIZE_2M : RMP_PG_SIZE_4K;
+		size = e->pagesize;
 		validate = e->operation == SNP_PAGE_STATE_PRIVATE;
+		pfn = e->gfn;
 
-		rc = pvalidate(vaddr, size, validate);
-		if (rc == PVALIDATE_FAIL_SIZEMISMATCH && size == RMP_PG_SIZE_2M) {
-			unsigned long vaddr_end = vaddr + PMD_SIZE;
+		if (vaddr) {
+			rc = pvalidate_pfn(vaddr, size, pfn, validate, &rc2);
+		} else {
+			vaddr = (unsigned long)pfn_to_kaddr(pfn);
+			rc = pvalidate(vaddr, size, validate);
+		}
 
-			for (; vaddr < vaddr_end; vaddr += PAGE_SIZE) {
-				rc = pvalidate(vaddr, RMP_PG_SIZE_4K, validate);
+		if (rc == PVALIDATE_FAIL_SIZEMISMATCH && size == RMP_PG_SIZE_2M) {
+			unsigned long last_pfn = pfn + PTRS_PER_PMD - 1;
+
+			for (; pfn <= last_pfn; pfn++) {
+				if (vaddr) {
+					rc = pvalidate_pfn(vaddr, RMP_PG_SIZE_4K,
+							   pfn, validate, &rc2);
+				} else {
+					vaddr = (unsigned long)pfn_to_kaddr(pfn);
+					rc = pvalidate(vaddr, RMP_PG_SIZE_4K, validate);
+				}
 				if (rc)
 					break;
 			}
 		}
 
 		if (rc) {
-			WARN(1, "Failed to validate address 0x%lx ret %d", vaddr, rc);
+			WARN(1, "Failed to validate address 0x%lx ret %d ret2 %d",
+				vaddr, rc, rc2);
 			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PVALIDATE);
 		}
 	}
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 7eac92c07a58..08b2e2a0d67d 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -790,7 +790,7 @@ void __init snp_prep_memory(unsigned long paddr, unsigned int sz, enum psc_op op
 }
 
 static unsigned long __set_pages_state(struct snp_psc_desc *data, unsigned long vaddr,
-				       unsigned long vaddr_end, int op)
+				       unsigned long vaddr_end, int op, unsigned long temp_vaddr)
 {
 	struct ghcb_state state;
 	bool use_large_entry;
@@ -842,7 +842,7 @@ static unsigned long __set_pages_state(struct snp_psc_desc *data, unsigned long
 
 	/* Page validation must be rescinded before changing to shared */
 	if (op == SNP_PAGE_STATE_SHARED)
-		pvalidate_pages(data);
+		pvalidate_pages(data, temp_vaddr);
 
 	local_irq_save(flags);
 
@@ -862,12 +862,13 @@ static unsigned long __set_pages_state(struct snp_psc_desc *data, unsigned long
 
 	/* Page validation must be performed after changing to private */
 	if (op == SNP_PAGE_STATE_PRIVATE)
-		pvalidate_pages(data);
+		pvalidate_pages(data, temp_vaddr);
 
 	return vaddr;
 }
 
-static void set_pages_state(unsigned long vaddr, unsigned long npages, int op)
+static void set_pages_state(unsigned long vaddr, unsigned long npages,
+				int op, unsigned long temp_vaddr)
 {
 	struct snp_psc_desc desc;
 	unsigned long vaddr_end;
@@ -880,23 +881,30 @@ static void set_pages_state(unsigned long vaddr, unsigned long npages, int op)
 	vaddr_end = vaddr + (npages << PAGE_SHIFT);
 
 	while (vaddr < vaddr_end)
-		vaddr = __set_pages_state(&desc, vaddr, vaddr_end, op);
+		vaddr = __set_pages_state(&desc, vaddr, vaddr_end,
+						op, temp_vaddr);
 }
 
 void snp_set_memory_shared(unsigned long vaddr, unsigned long npages)
 {
-	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
-		return;
+	struct vm_struct *area;
+	unsigned long temp_vaddr;
 
-	set_pages_state(vaddr, npages, SNP_PAGE_STATE_SHARED);
+	area = get_vm_area(PAGE_SIZE * (PTRS_PER_PMD + 1), 0);
+	temp_vaddr = ALIGN((unsigned long)(area->addr + PAGE_SIZE), PMD_SIZE);
+	set_pages_state(vaddr, npages, SNP_PAGE_STATE_SHARED, temp_vaddr);
+	free_vm_area(area);
 }
 
 void snp_set_memory_private(unsigned long vaddr, unsigned long npages)
 {
-	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
-		return;
+	struct vm_struct *area;
+	unsigned long temp_vaddr;
 
-	set_pages_state(vaddr, npages, SNP_PAGE_STATE_PRIVATE);
+	area = get_vm_area(PAGE_SIZE * (PTRS_PER_PMD + 1), 0);
+	temp_vaddr = ALIGN((unsigned long)(area->addr + PAGE_SIZE), PMD_SIZE);
+	set_pages_state(vaddr, npages, SNP_PAGE_STATE_PRIVATE, temp_vaddr);
+	free_vm_area(area);
 }
 
 void snp_accept_memory(phys_addr_t start, phys_addr_t end)
@@ -909,7 +917,7 @@ void snp_accept_memory(phys_addr_t start, phys_addr_t end)
 	vaddr = (unsigned long)__va(start);
 	npages = (end - start) >> PAGE_SHIFT;
 
-	set_pages_state(vaddr, npages, SNP_PAGE_STATE_PRIVATE);
+	set_pages_state(vaddr, npages, SNP_PAGE_STATE_PRIVATE, 0);
 }
 
 static int snp_set_vmsa(void *va, bool vmsa)
-- 
2.25.1

