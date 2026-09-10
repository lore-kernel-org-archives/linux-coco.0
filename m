Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683B04FECD4
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057445; cv=none; b=ritoWqe9DHiHZIfRFZUwx4FRlniEKFPkT1+UL8PDvw9IJZ2dUWpH0W6P1lfUNtkzneb8FU+WqihOYwsp5yIN9rH17MHciQA0cBKxspJJqByMYyu77FK/a5phQiMTmCvqv3lvgO/fFTejAX6KxbYtXlgLwiZkyuXD7Z5s6MToyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057445; c=relaxed/simple;
	bh=/1ZUt4dzZcbPmaM7S+5OTB49kLBy/Ei/YrHi3jIC1+w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y9oRd3Kt9SHWg95kZkzdmlTo1ParGcOQX10ghJ1pFqJzuToZzlXp3/6fXZDZ8OWUU0ZV3bmvo2Eg/+/60WR6s4EHKroMyM4mx1fRgGBGsCFedi+cUMx2vIAFoTNpe6kvDaWthm8z0C68m3VxfkgypjJf3PkEbYo2otOXuhR4VmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M5q3KvPd; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M5q3KvPd"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49b8c651ac0so59005e9.2
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 09:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057440; x=1789662240; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwSVU+R2t/RzQm+JBBs/i0HD0WgNEqi2oht1lvIUFrI=;
        b=M5q3KvPdgMHZGtZUifAGGeZZM59zsZd5EQEULKDPhskY7RH7pMVytDpLmuJ3z4ti7H
         wUTDbX5EXk+mhlLyxmc80xVnYjXlx+i8rVY2JsvdNF/T9SV1ydTy2npW3gEIPjSu6Sa8
         o/d8CPe+bJZl6910QBg5DVsfx9Y4cknZkdHwoCNSlPYou8YZH6O4+fV97v2YQGuXziE/
         6hPOwu3ax/F4oWFtNCz+cqLoLU7PQMTfkSWXE/G/YetVjGpqxfpZ9orx3E/TbtmS3tMP
         4nqQawtkUK5tJY/xrdc71+LxSUTIgSx7hi63ZsJ/3fsJPfUcndTxluO3Zu9fcS9m1tbn
         WKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057440; x=1789662240;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwSVU+R2t/RzQm+JBBs/i0HD0WgNEqi2oht1lvIUFrI=;
        b=M4u4UBDV/DszxT7KFxSRbnO/AmuA5i8Q4cIYVuiDcC4Lpw5qxl2/h8q6ffnBgFunIH
         5bhG0ZsDqXP7A15JNMMRSf4nCkoZd3qi0BG994D2RgDvTnzsxe0wUrALancxM3RiHME4
         0MYpReqCuRF7n2AL+0t8oWzm7cgiHOtKdx30oonozHxK6HvbSI3GKSEjxTZroNA1txOb
         lcwfsJZLpGrHKWeI9pSmz7dNfGMZp6rm3lWOUUdMRS9WO44UtiaIIYGYk675Kmg38rKx
         XHv3ZPuNIy4c00RK8j9Ez8k+3DOvAInHHVqqTOuL3GcNNjaSKeKLq/hSLQLGdhZ9ckOV
         LQjA==
X-Forwarded-Encrypted: i=1; AKwUvBz1NpqKLpQ3nRNtjOZpOkLy7TsnPrBP9BvOcS1Jgu+XfPyY5/EgyRxXMjKA9pUcrl9GKSdat6MEck/T@lists.linux.dev
X-Gm-Message-State: AFuF++mW2+QKmPhfiG/fIbDO/JXnmaCLwmhI29Y8gY0lvJGlpBUwG0uD
	+Alsc4zOjcqtX9s23HfxkD/ArHiuBRblJwGQkA8I/iMxa3ZRc/EID/q7XWv/Nb4zQG12oypG6f1
	C9g==
X-Received: from wmv11.prod.google.com ([2002:a05:600c:26cb:b0:499:4c8d:551f])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a00d:b0:49c:cfbe:5a76
 with SMTP id 5b1f17b1804b1-49cf81e4a05mr405814905e9.2.1789057440169; Thu, 10
 Sep 2026 09:24:00 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:21:37 +0000
In-Reply-To: <20260910162343.4092060-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910162343.4092060-5-elver@google.com>
Subject: [PATCH RFC 04/10] KVM: Refactor kvm_handle_hva_range() to avoid
 conditional mmu_lock
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Refactor kvm_handle_hva_range() to check for overlapping memslots
upfront via interval_tree_iter_first() instead of tracking found
memslots inside the range iteration with a 'found_memslot' flag and
conditionally acquiring and releasing mmu_lock.

This simplifies the control flow by cleanly decoupling the search for
overlapping memslots from the subsequent walk. It also separates the
lockless path from the serialized path into distinct branches,
eliminating the conditional locking, which subsequently enables Clang
context analysis to validate locking in this function.

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
---
 virt/kvm/kvm_main.c | 94 ++++++++++++++++++++++++++++-----------------
 1 file changed, 58 insertions(+), 36 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 65eb26a0520d..f7bfa2d32507 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -558,31 +558,14 @@ static void kvm_null_fn(void)
 	     node;							     \
 	     node = interval_tree_iter_next(node, start, last))	     \
 
-static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
-							 const struct kvm_mmu_notifier_range *range)
+static __always_inline bool __kvm_handle_hva_range_walk(struct kvm *kvm,
+							const struct kvm_mmu_notifier_range *range)
 {
-	struct kvm_mmu_notifier_return r = {
-		.ret = false,
-		.found_memslot = false,
-	};
 	struct kvm_gfn_range gfn_range;
 	struct kvm_memory_slot *slot;
 	struct kvm_memslots *slots;
-	int i, idx;
-
-	if (WARN_ON_ONCE(range->end <= range->start))
-		return r;
-
-	/* A null handler is allowed if and only if on_lock() is provided. */
-	if (WARN_ON_ONCE(IS_KVM_NULL_FN(range->on_lock) &&
-			 IS_KVM_NULL_FN(range->handler)))
-		return r;
-
-	/* on_lock will never be called for lockless walks */
-	if (WARN_ON_ONCE(range->lockless && !IS_KVM_NULL_FN(range->on_lock)))
-		return r;
-
-	idx = srcu_read_lock(&kvm->srcu);
+	bool ret = false;
+	int i;
 
 	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		struct interval_tree_node *node;
@@ -620,28 +603,67 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
 			gfn_range.slot = slot;
 			gfn_range.lockless = range->lockless;
 
-			if (!r.found_memslot) {
-				r.found_memslot = true;
-				if (!range->lockless) {
-					KVM_MMU_LOCK(kvm);
-					if (!IS_KVM_NULL_FN(range->on_lock))
-						range->on_lock(kvm);
+			ret |= range->handler(kvm, &gfn_range);
+		}
+	}
+
+	return ret;
+}
 
-					if (IS_KVM_NULL_FN(range->handler))
-						goto mmu_unlock;
-				}
-			}
-			r.ret |= range->handler(kvm, &gfn_range);
+static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
+							 const struct kvm_mmu_notifier_range *range)
+{
+	struct kvm_mmu_notifier_return r = {
+		.ret = false,
+		.found_memslot = false,
+	};
+	struct kvm_memslots *slots;
+	int i, idx;
+
+	if (WARN_ON_ONCE(range->end <= range->start))
+		return r;
+
+	/* A null handler is allowed if and only if on_lock() is provided. */
+	if (WARN_ON_ONCE(IS_KVM_NULL_FN(range->on_lock) &&
+			 IS_KVM_NULL_FN(range->handler)))
+		return r;
+
+	/* on_lock will never be called for lockless walks */
+	if (WARN_ON_ONCE(range->lockless && !IS_KVM_NULL_FN(range->on_lock)))
+		return r;
+
+	idx = srcu_read_lock(&kvm->srcu);
+
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
+		slots = __kvm_memslots(kvm, i);
+		if (interval_tree_iter_first(&slots->hva_tree, range->start, range->end - 1)) {
+			r.found_memslot = true;
+			break;
 		}
 	}
 
-	if (range->flush_on_ret && r.ret)
-		kvm_flush_remote_tlbs(kvm);
+	if (!r.found_memslot)
+		goto out;
+
+	if (range->lockless) {
+		r.ret = __kvm_handle_hva_range_walk(kvm, range);
+		if (range->flush_on_ret && r.ret)
+			kvm_flush_remote_tlbs(kvm);
+	} else {
+		KVM_MMU_LOCK(kvm);
+		if (!IS_KVM_NULL_FN(range->on_lock))
+			range->on_lock(kvm);
+
+		if (!IS_KVM_NULL_FN(range->handler))
+			r.ret = __kvm_handle_hva_range_walk(kvm, range);
+
+		if (range->flush_on_ret && r.ret)
+			kvm_flush_remote_tlbs(kvm);
 
-mmu_unlock:
-	if (r.found_memslot && !range->lockless)
 		KVM_MMU_UNLOCK(kvm);
+	}
 
+out:
 	srcu_read_unlock(&kvm->srcu, idx);
 
 	return r;
-- 
2.55.0.1003.g10538fe699-goog

