Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A162EF662
	for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 19:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761851743; cv=none; b=FMVcoEw3vLxRGspof7k8VJ7BRYf/YnwkJXYy7IEQZtHK+wsSJRFIG1a8qCLF6jwGDqRQleaZofCsHQhT2oaKfClwbmDIjfD9opVX4mQYa1T8/EpFeiz/CVAuhr5gH1cnDhmU/OIkTsIqqSMvb8sXrjls+h+2RiZkAjKMcY5rHS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761851743; c=relaxed/simple;
	bh=5kpuGHjjpW7eTD6TcJHKfUqA4500T6O1STI83TOW8fs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SyXikdUVI9GPfad+BBulHUwbfvmdzeSuyaXvs8DbajmAKphlRiVhOV4AE79Zo0o4WR/WrrJIs3d06U+ca09/JuwxtsUyt++sKnxT6IE1RGhz/9JmP4yHMpTOszBAQBDSd+LGXif2pXxa2IiSV8kryGO/udgH73qX8I+zwT9qDBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R2dBFcg/; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R2dBFcg/"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29085106b99so13617605ad.1
        for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 12:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761851741; x=1762456541; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=W/2e8g1L0c2/fPIAdJgPfrLPj4zwW85TJ2q4DSKPNps=;
        b=R2dBFcg/k83pCwflHK5wq6QnwQK7pk3l9WskatSJ7mGPyynzrLp26M0QSGjy3SUnAs
         iatAeA7eZyJiwMD8vHZjx73hAdm+7YqvyHVzwgmxhwWPjhpRvt+u74JJaRq19WLysVqC
         wxIXv+Tqp12arBxCCUbpkj8yEcsK6hZJ002M+reyivJzkYotGCFcUsnuNmcD3D9Y9VDF
         mdBe7ZNf7fdebwvi4RbczKsj1idY15z8JseMc9hDlpaeHc5yjVt3te9nUAASRu1tI+V/
         eF78ayyLJcMnvMj7sA5kNG9Zf/jynSp4gNdZfur/+fTbd8Nbsu+o4mnEK9VYlkEdcqpC
         N/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761851741; x=1762456541;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/2e8g1L0c2/fPIAdJgPfrLPj4zwW85TJ2q4DSKPNps=;
        b=ZLtlq/QzJmi1S1yaIwFLiDn8XZKj5El+WEVM2xbrvRSwzgigx8h11eUwWfNWhSQ94m
         AtcMyrRpgzUNlTDvwsX+kQENjbQWeSt0eznqgvLebcPSbiX/Z8la7zQ8Kj4+xzdLCdGD
         n7GxTERGNIdzl6UCzqf6NoOPLg0wFYt+ffKrycT6AbPcVKJACtQpXH8CFXMfeK5SoGMu
         l8/9SxxFzf75EkeaJBHdOkv9fYtgLB3d3VocYPteYbDSwvC3GWY+LDOjZJk4BH8mWfep
         vuQAzwOudBrAds1v2KnGot9aSvKiA6ppmnUW7Rw1Ld49plHox0HIcHRHLWiPKe5YC732
         i9UQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZKlZ62ATcaS+S9ReC9LfKqzxJVwVtJZZQZBtdUqne/45TdEoXao30NjKJ34kAZ4iSdMi7Bv6ZUfX@lists.linux.dev
X-Gm-Message-State: AOJu0YzgMyEIkElW9RRM3gDW10ygUAPMGx5JYyCbeNPzXWT+v2gSMlKH
	JFW6KshI6XTTOZHWQhfotxe5g4AYKbqYRsD2l3Gdk8b2X/aFmYRnAfDN6S/xDr06M1CgdJJM082
	qDxLpYg==
X-Google-Smtp-Source: AGHT+IHBG+E9whSy2GErOVQq7nq3zTa9mi3obzAxIEd5dUmGB6oa0sd3yHkkpbWzPAltL195JDv7MbsuY58=
X-Received: from pllk11.prod.google.com ([2002:a17:902:760b:b0:290:b136:4f08])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a67:b0:295:ed6:4641
 with SMTP id d9443c01a7336-2951a3bfafamr11598625ad.25.1761851740789; Thu, 30
 Oct 2025 12:15:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 12:15:28 -0700
In-Reply-To: <20251030191528.3380553-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030191528.3380553-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030191528.3380553-5-seanjc@google.com>
Subject: [PATCH v5 4/4] KVM: x86: Don't disable IRQs when unregistering
 user-return notifier
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="UTF-8"

From: Hou Wenlong <houwenlong.hwl@antgroup.com>

Remove the code to disable IRQs when unregistering KVM's user-return
notifier now that KVM doesn't invoke kvm_on_user_return() when disabling
virtualization via IPI function call, i.e. now that there's no need to
guard against re-entrancy via IPI callback.

Note, disabling IRQs has largely been unnecessary since commit
a377ac1cd9d7b ("x86/entry: Move user return notifier out of loop") moved
fire_user_return_notifiers() into the section with IRQs disabled.  In doing
so, the commit somewhat inadvertently fixed the underlying issue that
was papered over by commit 1650b4ebc99d ("KVM: Disable irq while
unregistering user notifier").  I.e. in practice, the code and comment
has been stale since commit a377ac1cd9d7b.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
[sean: rewrite changelog after rebasing, drop lockdep assert]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c927326344b1..719a5fa45eb1 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -602,18 +602,10 @@ static void kvm_on_user_return(struct user_return_notifier *urn)
 	struct kvm_user_return_msrs *msrs
 		= container_of(urn, struct kvm_user_return_msrs, urn);
 	struct kvm_user_return_msr_values *values;
-	unsigned long flags;
 
-	/*
-	 * Disabling irqs at this point since the following code could be
-	 * interrupted and executed through kvm_arch_disable_virtualization_cpu()
-	 */
-	local_irq_save(flags);
-	if (msrs->registered) {
-		msrs->registered = false;
-		user_return_notifier_unregister(urn);
-	}
-	local_irq_restore(flags);
+	msrs->registered = false;
+	user_return_notifier_unregister(urn);
+
 	for (slot = 0; slot < kvm_nr_uret_msrs; ++slot) {
 		values = &msrs->values[slot];
 		if (values->host != values->curr) {
-- 
2.51.1.930.gacf6e81ea2-goog

