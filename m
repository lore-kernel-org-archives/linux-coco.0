Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094B034DB74
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649381; cv=none; b=gW4sTE+Yz/BKEQOdEuFr4FSJXh9KW9bpjjKjcBtvPf3qXl9sWQjH3TWyR9TFeih2MNyPGHd3u6yqIfGKBZg65lgFWVxJPxu1d4zUp5LFhlUaVp41hUgtI4lqbKPTNEP1ptqvbMqAjH9LTAOq3GeVmVGMM4sBlcxD8Lmeb3qbL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649381; c=relaxed/simple;
	bh=PfMNr2r+VH5JLxrfxOQQF4dS/m+8iJ8wfmAB6pwfKRU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pNQAhIjd/Q6DWKOVBjLEbTva9Pk/UtISls60A3IcDLkorW7H26f3xz/n0Myj1U0dr+k8GXP0O09/PBDJWCkmMqLXlbYMY50nFU7hSayPvC7dSqAzekwTUoxE1eNPhlRhVr103kNzwN5PpBHZHPwwB3JQrfGsYOQBjQ0qh6i1vU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R91+dw6Z; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R91+dw6Z"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-81e81fbbb8cso399521b3a.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649379; x=1770254179; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IDz9ZOJlCXDAbAOz3SQRUqJo6I1Od4zF7irdWu0ijNQ=;
        b=R91+dw6ZBiUS+DOUuIUAGiMISZK2eWnMhx1FkjcxnDb0pUt4524DW+3DxHLKSms1VM
         NNUbAsXu5nhXgrmB9V58OqesEi6V9tNMQnyyDQvWVVqFJH5waddqnQ7kGB/JTf3LNVBv
         A6WiUGdMhgFi4aKmWGFUbqinLk7aHbKTa4oZ8NOKeUZHJUvSzA0xrVnj2JrY5S26Jj1b
         BGi9Ol1jAWkfn+5EAAtPpxfnDVsk6tclFlWaXtMbIcOsnShnc9NMbFzi4eSkhAHdjnT0
         wdof4R9T0F15jvV8C6QSetetDGqStJ7bfrRNyRLjjL9tQ860bqH7Go5FxH4H/i1L37GQ
         LrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649379; x=1770254179;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDz9ZOJlCXDAbAOz3SQRUqJo6I1Od4zF7irdWu0ijNQ=;
        b=P+nj1K6acKuQNv1pP7Dp6b/nSjKI+4pvTHqOGzqemxRi0Nwmm49fIIRoQZ0olSr8/n
         Wh5/jkNeywg5zmokyzxsZdbP696W61Fw/ZCe+lNVhgUS6JLhOoLCPKMvCdPuEOV+2a7/
         HXXxbbJwaBebLaUucfbzAjBiP9Ta2agZyeoH8UUGMyMp5HC1zdJ+ZVbqVBWBFM3qEYAF
         /VoaqtTgPuU0InIN3qzGatxbxbhLxNC09CL2h4Ba43IIO6nN5iDmMt51fsVUa+8EpvTF
         7vIbo87sftHgyhWC3HusRd0sSQOISFgilRp1Cy7wEoXFWklBKRIuxB1qPAIDC/cOG6gR
         GoLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWua9vLoeJxT0dwVJPXUSPcvcW5L9qKYy6g1z1oWpTRexFiyYjMsxWMMCdQFCzNCnmeq0LgKyorYec@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu11es1y32mhpXK+FAKVgkSs5MUUIaB5QeN45k1mumtaQFPJJ1
	lSwG7QIPPSdannlh3RzOshvIwhUg5EoFR9VqO0GmEo7SEePhDtvcS7k4h+fqvIlevqr9A/PowR4
	6sGHfug==
X-Received: from pfbli11.prod.google.com ([2002:a05:6a00:718b:b0:7dd:8bba:63aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1a17:b0:823:1276:9a86
 with SMTP id d2e1a72fcca58-8236929d5fbmr5606152b3a.39.1769649379248; Wed, 28
 Jan 2026 17:16:19 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:59 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-28-seanjc@google.com>
Subject: [RFC PATCH v5 27/45] x86/virt/tdx: Enhance tdh_phymem_page_wbinvd_hkid()
 to invalidate huge pages
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

From: Yan Zhao <yan.y.zhao@intel.com>

After removing a TD's private page, the TDX module does not write back and
invalidate cache lines associated with the page and its keyID (i.e., the
TD's guest keyID). The SEAMCALL wrapper tdh_phymem_page_wbinvd_hkid()
enables the caller to provide the TD's guest keyID and physical memory
address to invoke the SEAMCALL TDH_PHYMEM_PAGE_WBINVD to perform cache line
invalidation.

Enhance the SEAMCALL wrapper tdh_phymem_page_wbinvd_hkid() to support cache
line invalidation for huge pages by introducing the parameters "folio",
"start_idx", and "npages". These parameters specify the physical memory
starting from the page at "start_idx" within a "folio" and spanning
"npages" contiguous PFNs. Return TDX_OPERAND_INVALID if the specified
memory is not entirely contained within a single folio.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tdx.h  |  2 +-
 arch/x86/kvm/vmx/tdx.c      |  2 +-
 arch/x86/virt/vmx/tdx/tdx.c | 16 ++++++++++++----
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 1f57f7721286..8ceaebc6c1a9 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -237,7 +237,7 @@ u64 tdh_mem_track(struct tdx_td *tdr);
 u64 tdh_mem_page_remove(struct tdx_td *td, u64 gpa, enum pg_level level, u64 *ext_err1, u64 *ext_err2);
 u64 tdh_phymem_cache_wb(bool resume);
 u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *td);
-u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, u64 pfn);
+u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, u64 pfn, enum pg_level level);
 #else
 static inline void tdx_init(void) { }
 static inline int tdx_cpu_enable(void) { return -ENODEV; }
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 4ac312376ac9..90133e8f5c53 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1867,7 +1867,7 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (TDX_BUG_ON_2(err, TDH_MEM_PAGE_REMOVE, entry, level_state, kvm))
 		return;
 
-	err = tdh_phymem_page_wbinvd_hkid((u16)kvm_tdx->hkid, pfn);
+	err = tdh_phymem_page_wbinvd_hkid((u16)kvm_tdx->hkid, pfn, level);
 	if (TDX_BUG_ON(err, TDH_PHYMEM_PAGE_WBINVD, kvm))
 		return;
 
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 37776ea56eb7..367df9366d57 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2071,13 +2071,21 @@ u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *td)
 }
 EXPORT_SYMBOL_FOR_KVM(tdh_phymem_page_wbinvd_tdr);
 
-u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, u64 pfn)
+u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, u64 pfn, enum pg_level level)
 {
-	struct tdx_module_args args = {};
+	unsigned long npages = page_level_size(level) / PAGE_SIZE;
+	u64 err;
 
-	args.rcx = mk_keyed_paddr(hkid, pfn);
+	for (unsigned long i = 0; i < npages; i++) {
+		struct tdx_module_args args = {
+			.rcx = mk_keyed_paddr(hkid, pfn + i),
+		};
 
-	return seamcall(TDH_PHYMEM_PAGE_WBINVD, &args);
+		err = seamcall(TDH_PHYMEM_PAGE_WBINVD, &args);
+		if (err)
+			break;
+	}
+	return err;
 }
 EXPORT_SYMBOL_FOR_KVM(tdh_phymem_page_wbinvd_hkid);
 
-- 
2.53.0.rc1.217.geba53bf80e-goog

