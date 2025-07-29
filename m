Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3389298CAB
	for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753810965; cv=none; b=GwiU36DbVp96oQ93XuW/aOPnaztcr2T0gxePTupzoDJvbmQwNwWOSAePlKOUIN5fYbfISW831nyddl19a+dsAJzTMviYqOXjRbRVJD7+WySJUtIUexI9Gdv1LwFKsCih8ciJlF5fWMDJMp+bo766tHEP+NKDUSgVK6ecmiFcmu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753810965; c=relaxed/simple;
	bh=Tw3eT5+iSuoQ8qKLRQi8HnYPIAcfpsKb0i0ErGvCLhc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M7GHf1xNEmShFbXvpxAZT2G1D9sE5cfW/KcGPhbstJRkVG/JzOYyxBI2JmwZDmqVe2/aTcfZcqExfBEsgwzTwQo730ZMYVKr5sVY3Bbx8fprKpLRmx60jI5AmCRsY/+7jLQ2hatIWWmD+rQdxAl29LNoPicdrOOs397pyagmkZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JV4M9eMz; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JV4M9eMz"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31ecb3a3d0aso2797776a91.3
        for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753810963; x=1754415763; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=28d3iRVWXUX6sIuoOntS0GSvjTzmcc+IeE+Mf6uMd/w=;
        b=JV4M9eMz7OEWBmHfabhzvS0k2XRtpp9hgaBmrBUJ048xZS/rI+Pd3/MBcclXil2Ph1
         yfgUqbu98B+QlMFIrs9NSXkW56tbpZSBYTs2SHxhu30WD8rirfznc3B2eN/18VGesRZb
         fDRf6TAOPk7r1GZ/ZQdnqMxJmk1yp+ycj+OqVsfoUYMYlIacEdVfgTUEGhG+Ca4o/Myj
         V3yqSwhQSi6fUrXP9bl9MjHXa02IyB7FD/xwhb8ZWIcC4bFCnLxsI5Hu4VOGYQyWLFeU
         K3b1FqIDeGvHUX1h5/TS5vP+oXgUSWn/M1gOtBI8XG0kZPAaEeBiUJxg19eyeGFCUioI
         EKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810963; x=1754415763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28d3iRVWXUX6sIuoOntS0GSvjTzmcc+IeE+Mf6uMd/w=;
        b=AVMhPEEaBIu0o93iNbsJTaPLagD1ci+cyeNmIs6qqEydvCqsoBSQU0QQo89O5/aEnm
         PssmVPlkrM2g34o0mXgFwrjPQqd/WlZbQgM8FxuNd5g1oxH8wen81GDQTXHIaHbr2G+K
         kJeIgQ5SggiwoDl9JBea/7xWXzSM5CHFqal8msMEvTRg0dSCyoPs800Zz/qtr5lYwDQi
         9PPszS1zbEODAIS27vbrqlDo7VsnZaM5dWlPV5pZkdpsdSbjptPysgiZzhyLCjc3Cr6r
         sGNkd9IpNtAfGgMcdy3TCdma5nKd1zgHnhwpziBfY9wezu88Ijr8nKXbP/Rfe73Vev3K
         uH3A==
X-Forwarded-Encrypted: i=1; AJvYcCXlZ9aVCc3WiMXO4eS7/S0qww5tUvr57iJkeIlRvduZtPsbff8NrVrfbSauj+wv971Y/ppraDUzK6vD@lists.linux.dev
X-Gm-Message-State: AOJu0YxzJ56zoCpdvO1VkJHfCZ8EwiQWf9FUKGuYZDEPpdLrF7/14VZO
	kMm/Lazhl+r+n5RqAz635W0dY7yJjoJ8T/bFO09EkyJCwhl6z6r93XTy9i03kCrJcKyI4IsVubH
	0MN9RxQ==
X-Google-Smtp-Source: AGHT+IGrgXqonk21Zb71xxleI4T0pEaWNxg21m5l9HHcgxwGP0sMZOCP8Yhgfitp+Fk5/XHGu56nse7Bq+I=
X-Received: from pjsc23.prod.google.com ([2002:a17:90a:bf17:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ac5:b0:31f:2efe:ced3
 with SMTP id 98e67ed59e1d1-31f5de2f623mr482833a91.5.1753810963229; Tue, 29
 Jul 2025 10:42:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Jul 2025 10:42:33 -0700
In-Reply-To: <20250729174238.593070-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250729174238.593070-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729174238.593070-2-seanjc@google.com>
Subject: [PATCH 1/6] KVM: s390/vfio-ap: Use kvm_is_gpa_in_memslot() instead of
 open coded equivalent
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Andy Lutomirski <luto@kernel.org>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-sgx@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Use kvm_is_gpa_in_memslot() to check the validity of the notification
indicator byte address instead of open coding equivalent logic in the VFIO
AP driver.

Opportunistically use a dedicated wrapper that exists and is exported
expressly for the VFIO AP module.  kvm_is_gpa_in_memslot() is generally
unsuitable for use outside of KVM; other drivers typically shouldn't rely
on KVM's memslots, and using the API requires kvm->srcu (or slots_lock) to
be held for the entire duration of the usage, e.g. to avoid TOCTOU bugs.
handle_pqap() is a bit of a special case, as it's explicitly invoked from
KVM with kvm->srcu already held, and the VFIO AP driver is in many ways an
extension of KVM that happens to live in a separate module.

Providing a dedicated API for the VFIO AP driver will allow restricting
the vast majority of generic KVM's exports to KVM submodules (e.g. to x86's
kvm-{amd,intel}.ko vendor mdoules).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/include/asm/kvm_host.h  | 2 ++
 arch/s390/kvm/priv.c              | 8 ++++++++
 drivers/s390/crypto/vfio_ap_ops.c | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index cb89e54ada25..449bc34e7cc3 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -719,6 +719,8 @@ bool kvm_s390_pv_cpu_is_protected(struct kvm_vcpu *vcpu);
 extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
 extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
 
+bool kvm_s390_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa);
+
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
diff --git a/arch/s390/kvm/priv.c b/arch/s390/kvm/priv.c
index 9253c70897a8..7773e1e323bc 100644
--- a/arch/s390/kvm/priv.c
+++ b/arch/s390/kvm/priv.c
@@ -605,6 +605,14 @@ static int handle_io_inst(struct kvm_vcpu *vcpu)
 	}
 }
 
+#if IS_ENABLED(CONFIG_VFIO_AP)
+bool kvm_s390_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
+{
+	return kvm_is_gpa_in_memslot(kvm, gpa);
+}
+EXPORT_SYMBOL_GPL_FOR_MODULES(kvm_s390_is_gpa_in_memslot, "vfio_ap");
+#endif
+
 /*
  * handle_pqap: Handling pqap interception
  * @vcpu: the vcpu having issue the pqap instruction
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 766557547f83..eb5ff49f6fe7 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -354,7 +354,7 @@ static int vfio_ap_validate_nib(struct kvm_vcpu *vcpu, dma_addr_t *nib)
 
 	if (!*nib)
 		return -EINVAL;
-	if (kvm_is_error_hva(gfn_to_hva(vcpu->kvm, *nib >> PAGE_SHIFT)))
+	if (!kvm_s390_is_gpa_in_memslot(vcpu->kvm, *nib))
 		return -EINVAL;
 
 	return 0;
-- 
2.50.1.552.g942d659e1b-goog

