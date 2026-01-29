Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5888261B80
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700777; cv=none; b=YGGWGpMgLHpJPwlvNO2fPGB4YNIH/spgXLeOrofsHc3x6lfg5bpMSOQNqDmDH68RweM89QeMErI3UZ02kv+i+BU9HUOVxiqObf7MeTWPW8dCOctA+sy/a+5JXmu/+b4YEeSkPIX2+romLFGQBboBLF9JZHlxpYoT4FI6LiqSocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700777; c=relaxed/simple;
	bh=9S2As/HXzHxL2v62TjOZCZxd2DQ7lWQ3rjtr/Gdhi8c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=BkELukiFAxyeR3lcpIA70xh6mAeTV3vb7f3LojUUhA+iblEc1qcjp4GLtLb2djlfRcQxdNLjJw9JkW2db7djrQJw9UjAJnD33Dc93F03rvVSnpDNAit8TDcjeiwtT/YVZyPLm/vX58Y81QEW5EaTzqvf75IyorfmjBuTUbiNdAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FXcpP2Vq; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FXcpP2Vq"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-823486f311bso588537b3a.0
        for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 07:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769700775; x=1770305575; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUYJw4c3pdE7hwG9tr+c2v9CH1+8NBV9hRmRkDwEMLY=;
        b=FXcpP2VqtMtoo4aK5irqVo7u4/EEWIK2GkD6hC/FgaPGJSLtKGUQhb+hKTx+7jVxQH
         U8yX+HY5pKOB1/lBaGr0soznmx4Hd3Za3uHIfOp53vDaQEoy88nw5vlaDOslwqAIz/hM
         lFjvi1SPX51r9Y9sp0La2zeqOaGCPyekw5qwNSTDGC7WP8HXEZYCI+9vIyDE9og03VbG
         R3iF6WklZn2540PvfyWrh7hDBoz4uBTpHebZKCv9shMyjimpQbj3bCrTP8CHIV27bdfb
         JainEB8aTULwM815T3uRMzPseXnUXsh6puVpjfvRfMpAMTb4mNFri9RXtBL6tYskk6qG
         SzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769700775; x=1770305575;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUYJw4c3pdE7hwG9tr+c2v9CH1+8NBV9hRmRkDwEMLY=;
        b=Qky+G1qy/ODZaYnuxwiLXITKulDQmNsWhtZ/FVG24hyjo7s3EXNSgs9CoBfkoTeQdk
         ebpu/sKpw1SVdK1NJbXHst5HgwCvhMgNPL+RkP6e4hYMiBDgZEEnPQomNPY6OHI2HoLH
         OuigSKXmci3C09GwOCxadLUUe81Zj52USkHNtGxSU2OfVP7ENY+2Gn83JOPf4nyJXVgl
         We4DXlv/KOTkLOfaQ7a8h+RRB3qK955hrd4QKV60u5kb/Jg9W2enRmOlFS/KfehU9MC/
         flb0CWOBJ8G70CeDZ+Cj6el0ePfaVfGt+/IN9pS0AquEWR9+GaVdAa7q1nablLEjKgKd
         m4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnrdCDohPTQpkozDckX4I/KRUnBr5/gfEHV1kVFhzOE3O+S8LfmLUrdLggBjI6TBkROoptvAplNIrT@lists.linux.dev
X-Gm-Message-State: AOJu0YwewmRFME875P6Zyo/jP47LOCbo2n9LOY4fP+KeJIGhgaDyShEt
	T79OKun0l53VyzsZLDo6wjpfAXQh6GSFMmUKmUMIrTduOEjRKNSvmBTDFA7TnSZ2BPACOQaqpw5
	qwGW7nA==
X-Received: from pfbi1-n1.prod.google.com ([2002:a05:6a00:a501:10b0:7b8:e204:9940])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a1a:b0:7ac:edc4:fb82
 with SMTP id d2e1a72fcca58-8236915f3eemr8019448b3a.5.1769700774790; Thu, 29
 Jan 2026 07:32:54 -0800 (PST)
Date: Thu, 29 Jan 2026 07:32:53 -0800
In-Reply-To: <20260129011517.3545883-42-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-42-seanjc@google.com>
Message-ID: <aXt9pfN8uGLX2c-o@google.com>
Subject: Re: [RFC PATCH v5 41/45] KVM: TDX: Honor the guest's accept level
 contained in an EPT violation
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Sagi Shahar <sagis@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jan 28, 2026, Sean Christopherson wrote:
> +int kvm_tdp_mmu_split_huge_pages(struct kvm_vcpu *vcpu, gfn_t start, gfn_t end,
> +				 int target_level)
> +{
> +	struct kvm_mmu_page *root = root_to_sp(vcpu->arch.mmu->root.hpa);

This is wrong, mmu->root.hpa is the shared root, not the mirror root.  Dittof for
the sanity check in tdx_handle_mismatched_accept().

Rather than operate on the vCPU's root, I think it makes sense to add an API to
operate on all mirror roots.  In practice, there can only be one valid mirror
root, so KVM isn't actually doing more work.  Then TDX can reuse that API for
splitting the head+tail pages when preparing for a partial shared=>private
conversion.

Slotted in before this patch:

---
From: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 Jan 2026 15:21:30 +0000
Subject: [PATCH] KVM: x86/mmu: Add a TDP MMU API to split hugepages for mirror
 roots

Add an exported API to split hugepages in mirror roots for a given gfn
range.  TDX will use the API to split hugepages in preparation for
partially converting a hugepage from private to shared, and for splitting
a hugepage to match the guest's ACCEPT level.

For all intents and purposes, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 39 ++++++++++++++++++++++++++++----------
 arch/x86/kvm/mmu/tdp_mmu.h |  2 ++
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index e32034bfca5a..a45d8ee91481 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1597,6 +1597,26 @@ static int tdp_mmu_split_huge_pages_root(struct kvm *kvm,
 	return 0;
 }
 
+static int tdp_mmu_split_huge_pages(struct kvm *kvm, int as_id,
+				    enum kvm_tdp_mmu_root_types type,
+				    gfn_t start, gfn_t end,
+				    int target_level, bool shared)
+{
+	struct kvm_mmu_page *root;
+	int r;
+
+	kvm_lockdep_assert_mmu_lock_held(kvm, shared);
+
+	__for_each_tdp_mmu_root_yield_safe(kvm, root, as_id, type) {
+		r = tdp_mmu_split_huge_pages_root(kvm, root, start, end,
+						  target_level, shared);
+		if (r) {
+			kvm_tdp_mmu_put_root(kvm, root);
+			return r;
+		}
+	}
+	return 0;
+}
 
 /*
  * Try to split all huge pages mapped by the TDP MMU down to the target level.
@@ -1606,18 +1626,17 @@ void kvm_tdp_mmu_try_split_huge_pages(struct kvm *kvm,
 				      gfn_t start, gfn_t end,
 				      int target_level, bool shared)
 {
-	struct kvm_mmu_page *root;
-	int r = 0;
+	tdp_mmu_split_huge_pages(kvm, slot->as_id, KVM_VALID_ROOTS, start, end,
+				 target_level, shared);
+}
 
-	kvm_lockdep_assert_mmu_lock_held(kvm, shared);
-	for_each_valid_tdp_mmu_root_yield_safe(kvm, root, slot->as_id) {
-		r = tdp_mmu_split_huge_pages_root(kvm, root, start, end, target_level, shared);
-		if (r) {
-			kvm_tdp_mmu_put_root(kvm, root);
-			break;
-		}
-	}
+int kvm_tdp_mmu_mirrors_split_huge_pages(struct kvm *kvm, gfn_t start,
+					 gfn_t end, int target_level)
+{
+	return tdp_mmu_split_huge_pages(kvm, 0, KVM_MIRROR_ROOTS, start, end,
+					target_level, false);
 }
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_mmu_mirrors_split_huge_pages);
 
 static bool tdp_mmu_need_write_protect(struct kvm *kvm, struct kvm_mmu_page *sp)
 {
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index bd62977c9199..a6919de10ca2 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -97,6 +97,8 @@ void kvm_tdp_mmu_try_split_huge_pages(struct kvm *kvm,
 				      const struct kvm_memory_slot *slot,
 				      gfn_t start, gfn_t end,
 				      int target_level, bool shared);
+int kvm_tdp_mmu_mirrors_split_huge_pages(struct kvm *kvm, gfn_t start,
+					 gfn_t end, int target_level);
 
 static inline void kvm_tdp_mmu_walk_lockless_begin(void)
 {

base-commit: 86c3bb72bf5c6201636529ee4609334b0887c6e3
--
