Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1216F378D6A
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649410; cv=none; b=NOq6yyMcezxk+Al30czHVwKLcbKTVgKlnRYCyEkfGoPYO+LM9J0Y9uLeAkHTqP4h3RFEA0HpRSQI8DYBSqRkRDe+V588EOva4+jFrJriVxEalEPJmwMircWJp0SNKZ1ohlpbntY9/JGEMprcuEQtgmq29QrcerP2gnF+xZVCbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649410; c=relaxed/simple;
	bh=NFixUjF3MwoYkH+QN/YHmqd9LbNtFdN+U0RPFkdel4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UsoNQAXTpoKyPBjFFOwRD/924OMpwnLQ3E/2/wEj8M2xQbJXetezuJqTo+s3wRW32jAWTCrlFiRCMlkzncwHE9y/NusLswaqd0YXCdtxLqZvA+BD40w40Eu0A36MmfjohT8IDAknvoba9GFepZ/fw2FF9vjYCafIqEo/sgrBabg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0ib6/vCp; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0ib6/vCp"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c634b862fcfso265416a12.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649408; x=1770254208; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UsNtWhNO0vhkCUAU93bPMBDIA0a/SH6YuHE+/bCD4zo=;
        b=0ib6/vCp/V4cxFk5CSHWQODycT76mpABUZNSVlgrdmYziNVnM4yCO5VYxzyBnEdyUX
         iN6aevFw1zaJ3GHdO+BibQ0yJIeEC01QjMNGWdc00ksPuFClcxcKi/mzkQT6Wm6DSkcE
         cenXJd438NIZZXIHbovTCyOaucKdzyyr9WOfHQlKe1rLRIbAZm5fDbMq7tYtBGMctPuM
         E6hBdeYfrXfYooVJiZ5WXDsY27PmV3wLruWdg8u/AMaAjLVW08LE2REa5r47SMW5oVSJ
         6AQLmKjVqUsD7Wcn9QxaMgoE4XQHWW4L4q7BxQTg82PINQubxy7aialH0GOrg31KCW4K
         fV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649408; x=1770254208;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsNtWhNO0vhkCUAU93bPMBDIA0a/SH6YuHE+/bCD4zo=;
        b=GU6YsyAX9kiUnbfvxuS197YJYaj7kVrd8XI9FSVawRF426y34UIoHEy4cyU8Qx1ftP
         q8IUI+Ozcx6UPijNzHxlfBXoTHNrEpGI2ZqHqDXw3gK3msWqhYgQgKldjA1BjxZWJsK4
         Pa+eO6mcVLh1maGiley5QGcZAAcP8nNbFU0K9716ZxITi1+kNIi2uibE0ofaY98py5f3
         vrjAQUZLJ2MED+mv9YZCvAOMw7GzX01rS5thzZS6hm2fvidWn9ZerirOaiqHY4fw0bPp
         ddK6vwq3Kbm3xUbxhOjAh7RkrzZ6XmtfDf6Mw5OXxZ805gWhVhJhRx59GVbCW+4Txk/T
         vDMw==
X-Forwarded-Encrypted: i=1; AJvYcCX8iA2CNQlfSHVMsRH/ergQY2XZ/ZDmoQaP5RSiMuDA7CncK39nzJvuBJyYX1VuPjm2jf5jJFG/dgmS@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh1A64FXBiwckzrhUHR/4OonCLRlpqyJ59UgR76shrCjr81GlZ
	Lt4gcn7Tx3rCC9nhV65zie/WjbWvGuopE9oFwnq5F6WEwJlCfyQhlTkIESwPpxdG0yR2YJN4RwL
	bCGLXHw==
X-Received: from pjbga13.prod.google.com ([2002:a17:90b:38d:b0:349:3867:ccc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d19:b0:366:14ac:e20f
 with SMTP id adf61e73a8af0-38ec6581747mr6919458637.77.1769649408354; Wed, 28
 Jan 2026 17:16:48 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:15 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-44-seanjc@google.com>
Subject: [RFC PATCH v5 43/45] *** DO NOT MERGE *** KVM: guest_memfd: Add
 pre-zap arch hook for shared<=>private conversion
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

Add a gmem "pre-zap" hook to allow arch code to take action before a
shared<=>private conversion, and just as importantly, to let arch code
reject/fail a conversion, e.g. if the conversion requires new page tables
and KVM hits in OOM situation.

The new hook will be used by TDX to split hugepages as necessary to avoid
overzapping PTEs, which for all intents and purposes corrupts guest data
for TDX VMs (memory is wiped when private PTEs are removed).

TODO: Wire this up the convert path, not the PUNCH_HOLE path, once in-place
      conversion is supported.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/Kconfig       |  1 +
 arch/x86/kvm/mmu/tdp_mmu.c |  8 ++++++
 include/linux/kvm_host.h   |  5 ++++
 virt/kvm/Kconfig           |  4 +++
 virt/kvm/guest_memfd.c     | 50 ++++++++++++++++++++++++++++++++++++--
 5 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index d916bd766c94..5f8d8daf4289 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -138,6 +138,7 @@ config KVM_INTEL_TDX
 	depends on INTEL_TDX_HOST
 	select KVM_GENERIC_MEMORY_ATTRIBUTES
 	select HAVE_KVM_ARCH_GMEM_POPULATE
+	select HAVE_KVM_ARCH_GMEM_CONVERT
 	help
 	  Provides support for launching Intel Trust Domain Extensions (TDX)
 	  confidential VMs on Intel processors.
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 0cdc6782e508..c46ebdacdb50 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1630,6 +1630,14 @@ int kvm_tdp_mmu_split_huge_pages(struct kvm_vcpu *vcpu, gfn_t start, gfn_t end,
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_mmu_split_huge_pages);
 
+#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
+int kvm_arch_gmem_convert(struct kvm *kvm, gfn_t start, gfn_t end,
+			  bool to_private)
+{
+	return 0;
+}
+#endif /* CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT */
+
 static bool tdp_mmu_need_write_protect(struct kvm *kvm, struct kvm_mmu_page *sp)
 {
 	/*
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 782f4d670793..c0bafff274b6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2588,6 +2588,11 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t gfn, void __user *src, long npages
 		       kvm_gmem_populate_cb post_populate, void *opaque);
 #endif
 
+#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
+int kvm_arch_gmem_convert(struct kvm *kvm, gfn_t start, gfn_t end,
+			  bool to_private);
+#endif
+
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
 void kvm_arch_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end);
 #endif
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 267c7369c765..05d69eaa50ae 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -125,3 +125,7 @@ config HAVE_KVM_ARCH_GMEM_INVALIDATE
 config HAVE_KVM_ARCH_GMEM_POPULATE
        bool
        depends on KVM_GUEST_MEMFD
+
+config HAVE_KVM_ARCH_GMEM_CONVERT
+       bool
+       depends on KVM_GUEST_MEMFD
\ No newline at end of file
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 51dbb309188f..b01f333a5e95 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -164,6 +164,46 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 	return folio;
 }
 
+#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
+static int __kvm_gmem_convert(struct gmem_file *f, pgoff_t start, pgoff_t end,
+			      bool to_private)
+{
+	struct kvm_memory_slot *slot;
+	unsigned long index;
+	int r;
+
+	xa_for_each_range(&f->bindings, index, slot, start, end - 1) {
+		r = kvm_arch_gmem_convert(f->kvm,
+					  kvm_gmem_get_start_gfn(slot, start),
+					  kvm_gmem_get_end_gfn(slot, end),
+					  to_private);
+		if (r)
+			return r;
+	}
+	return 0;
+}
+
+static int kvm_gmem_convert(struct inode *inode, pgoff_t start, pgoff_t end,
+			    bool to_private)
+{
+	struct gmem_file *f;
+	int r;
+
+	kvm_gmem_for_each_file(f, inode->i_mapping) {
+		r = __kvm_gmem_convert(f, start, end, to_private);
+		if (r)
+			return r;
+	}
+	return 0;
+}
+#else
+static int kvm_gmem_convert(struct inode *inode, pgoff_t start, pgoff_t end,
+			    bool to_private)
+{
+	return 0;
+}
+#endif
+
 static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
 {
 	if (GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED)
@@ -244,6 +284,7 @@ static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 {
 	pgoff_t start = offset >> PAGE_SHIFT;
 	pgoff_t end = (offset + len) >> PAGE_SHIFT;
+	int r;
 
 	/*
 	 * Bindings must be stable across invalidation to ensure the start+end
@@ -253,13 +294,18 @@ static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 
 	kvm_gmem_invalidate_begin(inode, start, end);
 
-	truncate_inode_pages_range(inode->i_mapping, offset, offset + len - 1);
+	/*
+	 * For demonstration purposes, pretend this is a private=>shared conversion.
+	 */
+	r = kvm_gmem_convert(inode, start, end, false);
+	if (!r)
+		truncate_inode_pages_range(inode->i_mapping, offset, offset + len - 1);
 
 	kvm_gmem_invalidate_end(inode, start, end);
 
 	filemap_invalidate_unlock(inode->i_mapping);
 
-	return 0;
+	return r;
 }
 
 static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
-- 
2.53.0.rc1.217.geba53bf80e-goog

