Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4A934F49A
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649384; cv=none; b=pBeZRaxrzJs155ZeE/dczQ+6k7CgCnoI/dBnTg6VtCPXCsbtG5rSVSLfFQdaVgF+ZB5E94eKL0LsdfwZ4DSY1gG7bkdsKEQthFcxz1q66aciehtjXB4fJWa2/hHLDQTrJCOUF3j2DOqoImAhvhGv43l/rRAEEA8vD57Io+jD6lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649384; c=relaxed/simple;
	bh=CYTYIlGGcrH6BQ0d71EBgYmrRkYDF9cUwwiwLMPdHys=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sVFxN0u2BIQYmv0GOQaGzoM9fx8X30EUuPC89yX//rn7Xa2HxkCHMzvrh83tS6Uve0ivNTodbgZQAL1tuTG2xenlQQkKlSw+PCrJunxubXPT6z/36Yjai5O8WUVKyO282fqGkVjmnHSJLC0pkFe+RRqw+1qnc1ebiXrSYylDnJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DjoT2310; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DjoT2310"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-352ec74a925so683464a91.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649381; x=1770254181; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=msD2jv18E2L4HOYUfz15g4GHsjmr/D9b7fjjCRW4KGo=;
        b=DjoT2310JcxFn+DaylXh+HZTJLR1ie6Mn+mWgbG+fVDJSy/iDnM0KBDK7lJ3XCcPwp
         SKH3wzu9hzu42Vh+Pir4vjca8jLK6sdK+vTcAk0po2Gk+3pradTs5AO5MwilpeQQUkCB
         u9zkHSfRevCkgQzjO1L33ojDFlyCDnudNmeDvg8qGMGcsJ0OE0UUJ83U1z3nzzIzrQdW
         DyUtZmXuvLkrqOpJgBv7uA7CefRfRDVlpCLtSUr/evxay4NHKfe2W7S+vE/uTQXBrpE7
         GeAx7pU4enmVlCVkTqObRVlOxcIijqlETkYXSE8Zadel+Z0tNtesrUT320PXu2iwvgz0
         uhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649381; x=1770254181;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msD2jv18E2L4HOYUfz15g4GHsjmr/D9b7fjjCRW4KGo=;
        b=BeQeDzxMT4+PROq6Weyl6kAqwcJ8x78JD4uqbnAA9kSKnCMKtikeGhEypPeDE0S/99
         lKZYtn78u8q0KsRB2E/E9P8C8KuuQD/MD7L/rMSBpM4XOvi6wKitB79g/sIAdLxSFNYV
         P8BPKX+DWnRRgy3rav+RrZK6KGBg66+NMMI5J/TL5nwxtZD+OSyHO0Pb4u03tTUcwRRw
         yY+y0qHykur7OSTbeBRSq8RedYIKeDVdOIZuFTAIBhBd1/iQX2BhxiDwR9h8MKLXXfyO
         m4x+8y+lB1bS5I9j5DXeKeoRZKz/5k3sQKw0yzpzVQ80yCwBzoWRmxNbuj+Ag6G/NbT+
         /qkw==
X-Forwarded-Encrypted: i=1; AJvYcCUU2+GT6chiiqs08konZ5puy1kU4khPqO15dxDGdA0GKa4CdCLyBBhFjKcsP4Yd154j7myPPcbdZXlf@lists.linux.dev
X-Gm-Message-State: AOJu0YwUidsQNndfdetLi6c6cZ5TuYFUiJJqcjkNXC32Qb41XQnrdkT3
	57aK39HzfEzM3X2cMYwwE6eeqzOnttTTv8ylKa2MjfidExW9IOaed4REEuuiz3GNWMRlvh7soxt
	ATXE+qg==
X-Received: from pjof4.prod.google.com ([2002:a17:90a:8e84:b0:34c:cb46:dad7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2789:b0:34c:cb3c:f536
 with SMTP id 98e67ed59e1d1-353fedbb396mr7057728a91.36.1769649380899; Wed, 28
 Jan 2026 17:16:20 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:00 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-29-seanjc@google.com>
Subject: [RFC PATCH v5 28/45] x86/virt/tdx: Extend "reset page" quirk to
 support huge pages
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Kai Huang <kai.huang@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

Extend the APIs for "resetting" TDX pages to workaround the TDX_PW_MCE
erratum to support huge pages, e.g. so that KVM can pass in the pfn+level
without having to manually calculate the size in multiple locations.

No functional change intended (because KVM doesn't currently support
anything but level=PG_LEVEL_4K).

Suggested-by: Vishal Annapurve <vannapurve@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tdx.h  | 7 ++++++-
 arch/x86/kvm/vmx/tdx.c      | 2 +-
 arch/x86/virt/vmx/tdx/tdx.c | 6 +++---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 8ceaebc6c1a9..e61b0b3cc403 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -157,7 +157,12 @@ int tdx_topup_pamt_cache(struct tdx_pamt_cache *cache, unsigned long npages);
 int tdx_pamt_get(u64 pfn, struct tdx_pamt_cache *cache);
 void tdx_pamt_put(u64 pfn);
 
-void tdx_quirk_reset_page(u64 pfn);
+void __tdx_quirk_reset_page(u64 pfn, enum pg_level level);
+
+static inline void tdx_quirk_reset_page(u64 pfn)
+{
+	__tdx_quirk_reset_page(pfn, PG_LEVEL_4K);
+}
 
 int tdx_guest_keyid_alloc(void);
 u32 tdx_get_nr_guest_keyids(void);
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 90133e8f5c53..aca556923822 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1871,7 +1871,7 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (TDX_BUG_ON(err, TDH_PHYMEM_PAGE_WBINVD, kvm))
 		return;
 
-	tdx_quirk_reset_page(pfn);
+	__tdx_quirk_reset_page(pfn, level);
 	tdx_pamt_put(pfn);
 }
 
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 367df9366d57..411e5feef39f 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -799,11 +799,11 @@ static void tdx_quirk_reset_paddr(unsigned long base, unsigned long size)
 	mb();
 }
 
-void tdx_quirk_reset_page(u64 pfn)
+void __tdx_quirk_reset_page(u64 pfn, enum pg_level level)
 {
-	tdx_quirk_reset_paddr(PFN_PHYS(pfn), PAGE_SIZE);
+	tdx_quirk_reset_paddr(PFN_PHYS(pfn), page_level_size(level));
 }
-EXPORT_SYMBOL_FOR_KVM(tdx_quirk_reset_page);
+EXPORT_SYMBOL_FOR_KVM(__tdx_quirk_reset_page);
 
 static void tdmr_quirk_reset_pamt(struct tdmr_info *tdmr)
 {
-- 
2.53.0.rc1.217.geba53bf80e-goog

