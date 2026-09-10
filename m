Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2895D408031
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 16:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057444; cv=none; b=AWvL3kFrK4H9CyUJewYSbSta8ctNDQo3A8eikXT/NqfWjoZvkHBQU+s1xV4Bgo5F/OtUi05WgNp07UAZiXaz2EYBxB35786K6M4jKFFI8GoZVSBGxezP1Og0w/XrV8dhK0DVnE2tTVhaVZUTTNhjRihKBwvNBowrmvHhQOwOfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057444; c=relaxed/simple;
	bh=MnMX/OSFrRzbTxG7baAXBumw8j8z3VdCQcDWmSfrIJ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qdvvJW1UlB2fkqelQ9yFkrQtqUHqNGZqyC0EL6wLQ1EtI5pdQfWZfkfhZ8G8omBaj4ovfCZhw+lG94t9Mq3kCJRstfXxBxxv51UxvrfVl4NtW+MBJDML0KGPUz3fHFXuYJi9pjkYtBX78pgpdiqfUoW9xQ6SGbBEp0gIDmixhiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JufvYok8; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JufvYok8"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4839f9edb08so4476401f8f.0
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057439; x=1789662239; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRWmScgPx+BLIgnYUF1mxiVgMRyBAcMFYt7T+8tBBLE=;
        b=JufvYok8/ueeN9tNU+Ph0+pZlX7iEfBZz7rj7o2Z2BAbxXhPvHaHvmhvJhbUIJ91ck
         CSMIPzvZ5uP7Mypsx7P1276LQbHkmgZuTuf4fXsxtufZc1Z4MBUeGzbb92lvrvyq5NpF
         07L8BVhydF/ldfWtwyvBwrcPSnsuy6XXlezb0YKcqlfWLfYzJbd0obgNoYT1yc1U09yf
         ut+LS1nEMBeaEvtFZ79LWTrOlpouzkOLzpHLu9aM3777hLSS0PdG324cQm39Qfkzy3QG
         QIsqgI27hBWPGiaWpN+s3qxIYFipa8/j/3d/56ZVerQeUp7Yr2JmnHZFoGgHEmryFk3J
         akjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057439; x=1789662239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRWmScgPx+BLIgnYUF1mxiVgMRyBAcMFYt7T+8tBBLE=;
        b=sX1Qyern1JC2C2+vv+2iR60uL53esO5RoTeefaYIGCqNvx7SSsXUSBba0Lc++qyxPX
         amUiMWe/b/V0BA7W48aM070N7j9j086wUQKtL3dE06wuRU6SH80xMyHpGmiEfTAE4iBe
         3Jl1eBAxwZGbvNeupQVrfwLo0mYP630CFFFKdAQO5mlQOC4PoLSQ2+Tzb8Ht74pawVI1
         O7Q/jG4XdkndqeO7mKzz8L9zH6xVKEtAmyNeAfp/mRAyw4nWizZjx6tu4+rbdlw7E+ol
         BLxSKtrHvUGT88WiarxtDtCaSR9ekwSA92YcCa9CfVRhvdD9QHcPOsE78UCnkU7jAFXq
         S/VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtBZBBkyNOL2mLjKxDMwkRNXHnLrbBUKXpGTIPIRSFmWBdowgaieWdY7Dn7DrFJaYkXLOKWHi44o2D@lists.linux.dev
X-Gm-Message-State: AFuF++nJnm1H6J3GwEB6NR8phCQrNfCep1OVoQdZr9gsyOSHcPyp0eAN
	3U/z7u4h9/j/Zkrsvsstbtna232/eO9OP7ano8TLSps8VqR1jjd51jkiSExz+2V7NKNv88eskQB
	G3A==
X-Received: from wmoy5.prod.google.com ([2002:a05:600c:17c5:b0:499:d96d:63b2])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46d5:b0:49c:fc6c:be06
 with SMTP id 5b1f17b1804b1-49cfc6cc142mr367514185e9.29.1789057438931; Thu, 10
 Sep 2026 09:23:58 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:21:36 +0000
In-Reply-To: <20260910162343.4092060-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910162343.4092060-4-elver@google.com>
Subject: [PATCH RFC 03/10] KVM: guest_memfd: Avoid conditional mmu_lock acquisition
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Refactor __kvm_gmem_invalidate_start() to check for present bindings
upfront via xa_find() instead of tracking found memslots inside the
range iteration with a 'found_memslot' flag and conditionally acquiring
and releasing KVM's mmu_lock.

Eliminating the conditional locking inside the loop simplifies control
flow, ensures lock scoping is straightforward, and subsequently allows
Clang context analysis to verify that mmu_lock is held unconditionally
across kvm_mmu_unmap_gfn_range().

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
---
 virt/kvm/guest_memfd.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 625e62e1a031..896f3b076562 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -124,10 +124,16 @@ static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
 					pgoff_t end,
 					enum kvm_gfn_range_filter attr_filter)
 {
-	bool flush = false, found_memslot = false;
+	bool flush = false;
 	struct kvm_memory_slot *slot;
 	struct kvm *kvm = f->kvm;
-	unsigned long index;
+	pgoff_t index = start;
+
+	if (!xa_find(&f->bindings, &index, end - 1, XA_PRESENT))
+		return;
+
+	KVM_MMU_LOCK(kvm);
+	kvm_mmu_invalidate_start(kvm);
 
 	xa_for_each_range(&f->bindings, index, slot, start, end - 1) {
 		pgoff_t pgoff = slot->gmem.pgoff;
@@ -140,13 +146,6 @@ static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
 			.attr_filter = attr_filter,
 		};
 
-		if (!found_memslot) {
-			found_memslot = true;
-
-			KVM_MMU_LOCK(kvm);
-			kvm_mmu_invalidate_start(kvm);
-		}
-
 		flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
@@ -157,8 +156,7 @@ static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
 	if (flush)
 		kvm_flush_remote_tlbs(kvm);
 
-	if (found_memslot)
-		KVM_MMU_UNLOCK(kvm);
+	KVM_MMU_UNLOCK(kvm);
 }
 
 static void kvm_gmem_invalidate_start(struct inode *inode, pgoff_t start,
-- 
2.55.0.1003.g10538fe699-goog

