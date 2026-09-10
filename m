Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2CF4CA798
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 16:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057441; cv=none; b=jm3vYJ1Zb6em+nlLgoICgIXeDTfhHiCR1HjciVK9rIq74hVmmTitgv+T/YaVjgvloqegQY88VQl6mlYnlwNWfbslyifyElGEY9nTf4V6kiawyEHzAwS6sVStdVwYGE5YzmW77cwu1mIUdd4Of5Cvv0nxCrRgixIWnr/Pbk/L9WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057441; c=relaxed/simple;
	bh=FXlmfD+i35+iX4uCD+rWudM4SzaRO4YkxNrcJ/VTr5Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mOtL6X0GNBPnMFUeTP1HLpL+sE5i4JTDXiVvjzzE63aKZacNXAOwKRNm/TrRilRFJh93ESkia3Mo9X7aIRsj7LXqsAOA/rxe29K7sl0EBA1wi6GyknP4pG7awPCEK8sS++IZ0VKukFoVrCnhMZVSVGAJHm73JgKDFyfukt6GVtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S7xp9zc3; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S7xp9zc3"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cced8309bso25255e9.3
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 09:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057437; x=1789662237; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2noM4J4G4Z/91+d3z307VtID9oIWCOO73XBAg9AhrEM=;
        b=S7xp9zc3ubiVqxLG54snm5aLHD20zJh942p8y+pdJ9O7mBov0S4hHem6Iw49pBNh4t
         ZxqeBmtbzmxnVFl78cSrpgaOWPfiqkye3i4dduVInu8PAuakR6xqnJECaNJUTsEBTbvA
         rNk+79POSb+iTAUlWfJ0yXUgLgqTO5DIGVeOl05v2zUEzBtpGYtfas7evjEODwFaQ9/n
         iHExJuQtwwux0eC9m+/KU8jRU7dNs5u8iKzHAQXE+FbV5zo/+GwdYzWLl8dA450vj2NW
         rpxYaB3sFj0Wk74W9YqTzsQxLOQ4ceR4DdKPOzgyBVEEk4nMc8QJDupXWMpggCd+xE0Z
         WCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057437; x=1789662237;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2noM4J4G4Z/91+d3z307VtID9oIWCOO73XBAg9AhrEM=;
        b=IOMYh0BUggBSdl/WTJCElK0jzquHkCbmahCgogtAuTr7tny4la+6v/T62BdhbYMjg/
         ESD15eUJiWkgbyKqcC44grbNrvcahbsITdzhKWeJao0Np6WDqXIhhaKp5Ra/yEHWO9GI
         7MNqs5SIOgnNZh889KYM/nqwXqGrdi85TvDrEzwbqz1KXMGvnosPo31bMPtTfv0olCzD
         /bhr57lSbg4oq5vnQJ3DTSTcN5bwuHhOB1s22B2kFcpdrNAMhbfgiNAGaDYaT9ohck2G
         8rCOZO9jmt2ZjHBcTsXbJ54OCWWCCtk3VvVYHpPivReLnuZufwuWNx+KjkvF4pZ6126d
         /Wmw==
X-Forwarded-Encrypted: i=1; AKwUvBwEDMkyji+bzbADIBJsHA8EvzdmPRF0TMWpzepuOt/JGClTuflMhNP5f9T88pAIjFhsss6wYeQQtiTA@lists.linux.dev
X-Gm-Message-State: AFuF++l8v8Jk1ZPdF6KB+f+Dxc0pADMZwprHlipgjwU6BV6GSTBPWN3k
	s9BZD5ridQQGr+OjB80pEGGoI6BLM+b8lW9YKqS5OU6NwSYYXebAtpNi4sqT56Es9mPZkKe+Pg5
	sMQ==
X-Received: from wrzf4.prod.google.com ([2002:a05:6000:1b04:b0:484:36e2:923e])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:848e:20b0:495:4d88:e630
 with SMTP id 5b1f17b1804b1-49cf824f697mr311679985e9.10.1789057437113; Thu, 10
 Sep 2026 09:23:57 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:21:35 +0000
In-Reply-To: <20260910162343.4092060-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910162343.4092060-3-elver@google.com>
Subject: [PATCH RFC 02/10] KVM: Allow reading memslots while holding slots_arch_lock
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

kvm_swap_active_memslots() updates kvm->memslots[as_id] while holding both
kvm->slots_lock and kvm->slots_arch_lock. Holding either lock guarantees
that memslots cannot be concurrently modified.

Allow reading memslots in __kvm_memslots() when kvm->slots_arch_lock is
held.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/kvm_host.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 03bfc92864b6..5ed8260ef01f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1089,6 +1089,7 @@ static inline struct kvm_memslots *__kvm_memslots(struct kvm *kvm, int as_id)
 	as_id = array_index_nospec(as_id, KVM_MAX_NR_ADDRESS_SPACES);
 	return srcu_dereference_check(kvm->memslots[as_id], &kvm->srcu,
 			lockdep_is_held(&kvm->slots_lock) ||
+			lockdep_is_held(&kvm->slots_arch_lock) ||
 			!refcount_read(&kvm->users_count));
 }
 
-- 
2.55.0.1003.g10538fe699-goog

