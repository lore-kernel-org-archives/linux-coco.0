Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911713783A9
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649405; cv=none; b=irw8xS5TBpriyMoOLb+6FB/BMS5pFD/ENIDwzl8JY4KzAxwfxgTHzM6m8LQ9Pb+rA45GsRE5dyh6QXBZ9jKEq/gfPWmH/aSL4VUEA6C99klYgTI0MmTjtOzXqc5xPafiEzpkfYmxClba/xUSx7bCYXwIo4dTGdGF3ost3Gz7ykk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649405; c=relaxed/simple;
	bh=MaC+fCO7g1By3J/qOTxfjL/79GFuNBOpVwOO27+9vUE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aCsIDCjq39uobUoMrhalHk/yZ+kMicr88vCR0XalMWecPnym24Q5xWn2LmMTYLtaD6uav1k/L1sKYiy7+15TvgRCXqJp9ip3Ii8/Wf6uS8fQJG3CurglkE9m2iyoUmSM1o5p+R9wQhqJv989fifqna/sqGER3jxlPmHf+zCsZxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ctsONBXU; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ctsONBXU"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-353c9d644b0so266802a91.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649403; x=1770254203; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cCcD265cxmmVZ0UcKWxh2iCOGhqGhkNB0SavdcofzbU=;
        b=ctsONBXUi+IFbbyP9nmzCzmCrXmPvieD2niwyToHB+3jZFbT6v0prRAXptYbr5P1be
         4ioX8AvkIA3hwQZCF8jcTBmgty2ZDEq8qZiH8F1O9QFcFxKXgmea1YKRZFpUfgzllpEJ
         nEVb+fonNDz+BsiN/E226Z7zgdm5zEk8EEw1BtpChrHWgXCMkFwrScXOabvZYOOYCp/M
         Bdx7xNRgYGRgm+KqrPo6iPE253vdenAE/hrdJ3/c/daxqN+M12pEhLZP+4Zu0tmLuvHP
         n+024FeuXsFkj1LxEmGMfmqNnLqh8tO9iXWrfczDQCVm9huIqmPe0ThZYg7hyJGiW8Qf
         Cfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649403; x=1770254203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCcD265cxmmVZ0UcKWxh2iCOGhqGhkNB0SavdcofzbU=;
        b=nU1wvfEmqd6+w2Osi1hCzcAClP85HozAH9Gpxpc/LZe0Ludrc0MP762YHfNrgu8cMy
         g7hy8IHRqT4Ps99xEwi4gG6LxJlHxw5SnWI2cm1tYaAOfMTVcP5xR5zr/uw6GP1jBqEb
         9bUPZ3aD4VxkGsQFPCjRgsFyZ2eqNDGPol4UrOdQQlX2gZRxoZt4AOTxHYDvizXYqAWh
         UjCNr4mfnSUq0PauacBR7skI3o/Q/d1dTzlCktCG5MZqO/vEZi7lf8Nx6RyG+oY78v0n
         rVE+zwjHrZJsMRQfhOESL7VU4emfGW+KPj2iUvuvBIE2329RWXhxpF7L2HqHku/ElKnq
         tkcw==
X-Forwarded-Encrypted: i=1; AJvYcCU6FGC+u3wadUaaS5jHZTUDXGgkl3yxfmQMPbYSJG5KyzI2NRf1WvA+u8blIe2zSP8QKHCVLQDQOrFc@lists.linux.dev
X-Gm-Message-State: AOJu0YyWeVHCCi56uCx9Mfqf8S4ZP6U9PAQiV3tVdekdDOoZKS6bAxOL
	iwsJllSxeR5jPs6tiQaeNykgSBuzKlpiNuh6cWdCrJuvbw6HZ95miEI1iy6lQR+lI27YHED4ZO4
	Y1GshhQ==
X-Received: from pjbbf7.prod.google.com ([2002:a17:90b:b07:b0:34a:b3a0:78b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d008:b0:32d:e780:e9d5
 with SMTP id 98e67ed59e1d1-353fed6ebffmr5150167a91.22.1769649403000; Wed, 28
 Jan 2026 17:16:43 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:12 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-41-seanjc@google.com>
Subject: [RFC PATCH v5 40/45] KVM: x86: Introduce hugepage_set_guest_inhibit()
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

TDX requires guests to accept S-EPT mappings created by the host KVM. Due
to the current implementation of the TDX module, if a guest accepts a GFN
at a lower level after KVM maps it at a higher level, the TDX module will
emulate an EPT violation VMExit to KVM instead of returning a size mismatch
error to the guest. If KVM fails to perform page splitting in the VMExit
handler, the guest's accept operation will be triggered again upon
re-entering the guest, causing a repeated EPT violation VMExit.

To facilitate passing the guest's accept level information to the KVM MMU
core and to prevent the repeated mapping of a GFN at different levels due
to different accept levels specified by different vCPUs, introduce the
interface hugepage_set_guest_inhibit(). This interface specifies across
vCPUs that mapping at a certain level is inhibited from the guest.

Intentionally don't provide an API to clear KVM_LPAGE_GUEST_INHIBIT_FLAG
for the time being, as detecting that it's ok to (re)install a hugepage is
tricky (and costly if KVM wants to be 100% accurate), and KVM doesn't
currently support hugepage promotion (only direct installation of
hugepages) for S-EPT.

As a result, the only scenario where clearing the flag would likely allow
KVM to install a hugepage is when an entire 2MiB / 1GiB range is converted
to shared or private.  But if the guest is accepting at 4KiB granulairty,
odds are good the guest is using the memory for something "special" and
will never convert the entire range to shared (and/or back to private).
Punt that optimization to the future, if it's ever needed.

Link: https://lore.kernel.org/all/a6ffe23fb97e64109f512fa43e9f6405236ed40a.camel@intel.com [1]
Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
[sean: explain *why* the flag is never cleared]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu.h     |  4 ++++
 arch/x86/kvm/mmu/mmu.c | 21 ++++++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 830f46145692..fa6a8daf4b05 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -322,4 +322,8 @@ static inline bool kvm_is_gfn_alias(struct kvm *kvm, gfn_t gfn)
 {
 	return gfn & kvm_gfn_direct_bits(kvm);
 }
+
+void hugepage_set_guest_inhibit(struct kvm_memory_slot *slot, gfn_t gfn, int level);
+bool hugepage_test_guest_inhibit(struct kvm_memory_slot *slot, gfn_t gfn, int level);
+
 #endif
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 45650f70eeab..c2765bfc8492 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -718,12 +718,14 @@ static struct kvm_lpage_info *lpage_info_slot(gfn_t gfn,
 }
 
 /*
- * The most significant bit in disallow_lpage tracks whether or not memory
- * attributes are mixed, i.e. not identical for all gfns at the current level.
+ * The most 2 significant bits in disallow_lpage tracks whether or not memory
+ * attributes are mixed, i.e. not identical for all gfns at the current level,
+ * or whether or not guest inhibits the current level of hugepage at the gfn.
  * The lower order bits are used to refcount other cases where a hugepage is
  * disallowed, e.g. if KVM has shadow a page table at the gfn.
  */
 #define KVM_LPAGE_MIXED_FLAG	BIT(31)
+#define KVM_LPAGE_GUEST_INHIBIT_FLAG   BIT(30)
 
 static void update_gfn_disallow_lpage_count(const struct kvm_memory_slot *slot,
 					    gfn_t gfn, int count)
@@ -736,7 +738,8 @@ static void update_gfn_disallow_lpage_count(const struct kvm_memory_slot *slot,
 
 		old = linfo->disallow_lpage;
 		linfo->disallow_lpage += count;
-		WARN_ON_ONCE((old ^ linfo->disallow_lpage) & KVM_LPAGE_MIXED_FLAG);
+		WARN_ON_ONCE((old ^ linfo->disallow_lpage) &
+			     (KVM_LPAGE_MIXED_FLAG | KVM_LPAGE_GUEST_INHIBIT_FLAG));
 	}
 }
 
@@ -1648,6 +1651,18 @@ static bool __kvm_rmap_zap_gfn_range(struct kvm *kvm,
 				 start, end - 1, can_yield, true, flush);
 }
 
+bool hugepage_test_guest_inhibit(struct kvm_memory_slot *slot, gfn_t gfn, int level)
+{
+	return lpage_info_slot(gfn, slot, level)->disallow_lpage & KVM_LPAGE_GUEST_INHIBIT_FLAG;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(hugepage_test_guest_inhibit);
+
+void hugepage_set_guest_inhibit(struct kvm_memory_slot *slot, gfn_t gfn, int level)
+{
+	lpage_info_slot(gfn, slot, level)->disallow_lpage |= KVM_LPAGE_GUEST_INHIBIT_FLAG;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(hugepage_set_guest_inhibit);
+
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool flush = false;
-- 
2.53.0.rc1.217.geba53bf80e-goog

