Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B7378810
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649408; cv=none; b=bwI6pQI+LGzqMytvUGyNwppibGE5TBIBnuX95ldzEkuNlmqkr9FTzTxIOJNW2sFk3/lnlPRuXB2XSvMMMMnaNA+1M+ILoXdQ4QoTbApoFwDxtcmqz6wkhhgTpSdKM3s/nAhP7ohiT3g2f2fFo2gCWAzJvn/Eq9Vy1Ufu10ZqsLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649408; c=relaxed/simple;
	bh=2lbLvW6ijIN279zXFdILobLzEFRXyPlsR+WIhazYkJc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TaIeWcwA2ECMWXbP0ZQvJMG1+Xm+zkRNqQ3ZUKYWhM0YUX7oufU4bChccpEggniioDBqDud//jyMUsSc6Jgosc4Uo1cE2A4Tn6rGQUNf1EFdCh/wIqP68AlwuTVn2tQoMcyxIHeM7o1w9aefU9+9MkfgIZbGYFzBdxU7CiBTZPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eSRpizJE; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eSRpizJE"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c6124a9fb86so904375a12.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649406; x=1770254206; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eeY70eVnfoYCtpmYqMWIyko5YIZVo7ravcEk/U6/auE=;
        b=eSRpizJE5Sa+kSQ/19c01oBfc0kQitpysdnnQ/y3PpCZMkq1tyyFV8wOXR4DITCML7
         AAzWhEn7PvdFm6W+SAAcyQ35PRdZwWY+YV4I2tolHtPoqK5fEnTzKXWRsjC46Ya3BsMt
         DUhw0j0A22cC7UBB/CGP0Op8GkhA2EbMiOLRN5Rxms5n0+fDWgURMleL6RgUJLRuhH+j
         J4RYbuKDJOgnB6G5EZSJqny7D5iQmuE9nTDqA0F0JBKz30FCScXoieRuOPGYa+VPr3sL
         oMb+aQoY9H1TGQVYFs36uAx4vPdWHZVyH5TLtgDh4tcERQL/SqdjoYBKM8oY6orYV6Tw
         u8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649406; x=1770254206;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeY70eVnfoYCtpmYqMWIyko5YIZVo7ravcEk/U6/auE=;
        b=fvVddw/wWNR13oJGM4hPDeTx8uEJoKzCP68KmNpXd2FXW4qPrZrV63yMu5kewWPeFk
         EYwYSLKqhuRNmhBGK2QPIBG7KEbQ/arq8mnoeTxmtp4KvdqY/gqGW2M9bOwZ7oGUFC/V
         PBO/B5U7pAplK9WIEVTIJB6n05V9w6Xx32BCmrgFbLQS4e8Ia53qYFCnA12r7s4B4Ic/
         +9zfjXPGLju8rLONMgRqvejvw/zRFVooHcKqEEr3h7T3I/7a05ltOlQ1PJyYtgzNkc0P
         /0bUyyNm00p2m9APtZn4zsFZKCVDimDoAT+zo52lnLhhu5lrDcRDSMfkknAjS47IdIes
         fYuw==
X-Forwarded-Encrypted: i=1; AJvYcCULfeAxxUuv+jnIrIqhgbfCwLpKJs7Fc5Y8sayTuJXDHy19T5KBqVrg+TeA5lw3UD6lIpe2A0xboyl+@lists.linux.dev
X-Gm-Message-State: AOJu0YzYWZ58POlZulyqC+s+1HpJbEm+QXy7GJHCA1zM1/2scUkXyomg
	1U16y/f96VwOXWH09gpQivjNRWzE4eqON+jSJBGhQMtTuk6awsk7tnke06wBFHXv67d7HzE1ae6
	Cl6McEA==
X-Received: from pjyu17.prod.google.com ([2002:a17:90a:e011:b0:353:454:939c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:62c4:b0:38d:f62a:a9e5
 with SMTP id adf61e73a8af0-38ec6248055mr7357147637.14.1769649406445; Wed, 28
 Jan 2026 17:16:46 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:14 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-43-seanjc@google.com>
Subject: [RFC PATCH v5 42/45] KVM: guest_memfd: Add helpers to get start/end
 gfns give gmem+slot+pgoff
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

Add helpers for getting a gfn given a gmem slot+pgoff, and for getting a
gfn given a starting or ending pgoff, i.e. an offset that may be beyond
the range of the memslot binding.  Providing helpers will avoid duplicate
boilerplate code "if" future code also needs to iterate over gfn ranges.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 923c51a3a525..51dbb309188f 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -59,6 +59,21 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 	return gfn - slot->base_gfn + slot->gmem.pgoff;
 }
 
+static gfn_t kvm_gmem_get_gfn(struct kvm_memory_slot *slot, pgoff_t pgoff)
+{
+	return slot->base_gfn + pgoff - slot->gmem.pgoff;
+}
+
+static gfn_t kvm_gmem_get_start_gfn(struct kvm_memory_slot *slot, pgoff_t start)
+{
+	return kvm_gmem_get_gfn(slot, max(slot->gmem.pgoff, start));
+}
+
+static gfn_t kvm_gmem_get_end_gfn(struct kvm_memory_slot *slot, pgoff_t end)
+{
+	return kvm_gmem_get_gfn(slot, min(slot->gmem.pgoff + slot->npages, end));
+}
+
 static int __kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
 				    pgoff_t index, struct folio *folio)
 {
@@ -167,11 +182,9 @@ static void __kvm_gmem_invalidate_begin(struct gmem_file *f, pgoff_t start,
 	unsigned long index;
 
 	xa_for_each_range(&f->bindings, index, slot, start, end - 1) {
-		pgoff_t pgoff = slot->gmem.pgoff;
-
 		struct kvm_gfn_range gfn_range = {
-			.start = slot->base_gfn + max(pgoff, start) - pgoff,
-			.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
+			.start = kvm_gmem_get_start_gfn(slot, start),
+			.end = kvm_gmem_get_end_gfn(slot, end),
 			.slot = slot,
 			.may_block = true,
 			.attr_filter = attr_filter,
-- 
2.53.0.rc1.217.geba53bf80e-goog

