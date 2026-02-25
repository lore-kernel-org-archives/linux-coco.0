Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8291D2797AC
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982471; cv=none; b=TJzy3inZyZt8sUj+QU7S7trMQv1mNqslc993WP7+9GfAUpmnTZhtxdJfebwm05Ht27uaJzDW2BRUduEbtELT/rG47UHy1VJpC+5p2gNQi2TRSDY0AymUt/G9tpLOdqzRynadyPlmwX9B258MgOKeHFhb5Zm4YCibUQiiHJLNFJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982471; c=relaxed/simple;
	bh=jhFdYJ/k2G4ufjPQSuQbjjN1qZ0Psh4hxK61qelisac=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Timk2gvTfrpDG1wRlsxNDwrJD6YhlhPdWUX49i4KP92ZfV+tnWAiEEhtmStb5+hVItX5UVJmNl1wPo7ls1fXYneI6spMaBgUlJwXmuocvYx8vAGDgC4WyVejCZuvN1XTKbiVY2nyb5O+TkcRsKWOJRG69R1n/CWBDFA16rC22Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Es9NssSu; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Es9NssSu"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3568090851aso39449269a91.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982470; x=1772587270; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sb25WqFS5MOa5y8whWmlEi7jKLk6DH13/xEv6hI9zy0=;
        b=Es9NssSulKCL4N1xham2dIUS7RMJtLauL5nuC7iquxPA+SgKYAzYKuBwJ/CLcjT+fM
         t715+fdv6DBU5WfsXGTtC6OAV7cMX6Gd4fhOpSvAR6XSoOwjln4f0JqKfsJNx6CpAXX6
         6NOvO7g9hmI9wf86QG45Ut1TgGIK3Tgk5IVp8IZVm0EyJ0hNxiH333LT64O7u1hOJmM5
         J0OD+04WLiSl7RcCTxZeC2eZjdxBCrI70Z5ZkX3bvcKW8t74APIT6WYvt1xFOTWhtyJx
         pC4Py4Cm7SkXcDvjKhKNYI+F/KGbXHCK5UPfMsF+R8hfzgMEqxXrVXHfV6u9nhvYD07U
         IOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982470; x=1772587270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sb25WqFS5MOa5y8whWmlEi7jKLk6DH13/xEv6hI9zy0=;
        b=IezVOlZqLGK4g8mwPLopC6+6WNtovoW28NZHRkdOTkFmfm8SbjG7OIR44CMighPFae
         hNEUT4KA6AMgFQYuWHrhRB4K5GtsS/B/h9VMAbesEXsBED467xT3oo1ThQcxxoyOfEkQ
         VS9fu0UKMpGSP8nLqUg6rVeUOA4l+uRohYWX0MPEBvCBRhwuFxEdd5ULsJxRz9mF6A9k
         15sohWDoXjp3rudI3vNNlyDv0KyoGrEeCeVSrAAzHpn0VOleaSM88LG1ShDKhFESLkpt
         usyPgtqoixJTltTYzF36KM8Z3kUKsIfETMQgyZ839P8B3FaM7CdvW+o/TaDIl/MwHbW6
         R6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXlmc19nMBpHZzbmlATg+cS/rjrIwIiT+EIlHGtpUOSrSbf69vhGvs4KqAGiGJE4OI8uhTYAaLJybTx@lists.linux.dev
X-Gm-Message-State: AOJu0YwzkstsiRwNBrUyNOSyhdmEeLjep6IlbfxS5Jyh1RbB/JUzxnDY
	DbKdXt94kMjG/L+RlsTxkMBUI1PqsUEO5TIxwZmV57aHcKrPKuHY2riSGOj0D2h7+kJd4k7ns/y
	mMJWBnA==
X-Received: from pjz13.prod.google.com ([2002:a17:90b:56cd:b0:354:c1db:b113])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8e:b0:356:2c7b:c013
 with SMTP id 98e67ed59e1d1-3590f205431mr539675a91.29.1771982469774; Tue, 24
 Feb 2026 17:21:09 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:44 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-10-seanjc@google.com>
Subject: [PATCH 09/14] KVM: x86: Consolidate SEV-ES MMIO emulation into a
 single public API
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Dedup kvm_sev_es_mmio_{read,write}() into a single API, as the "cost" of
plumbing in a boolean is largely negligible since KVM pulls out a boolean
for ops->write anyways, and consolidating the APIs will allow for
additional cleanups.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 20 ++++++--------------
 arch/x86/kvm/x86.c     | 29 +++++++++--------------------
 arch/x86/kvm/x86.h     |  6 ++----
 3 files changed, 17 insertions(+), 38 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index ea515cf41168..723f4452302a 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4434,25 +4434,17 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
 
 	switch (control->exit_code) {
 	case SVM_VMGEXIT_MMIO_READ:
-		ret = setup_vmgexit_scratch(svm, true, control->exit_info_2);
-		if (ret)
-			break;
+	case SVM_VMGEXIT_MMIO_WRITE: {
+		bool is_write = control->exit_code == SVM_VMGEXIT_MMIO_WRITE;
 
-		ret = kvm_sev_es_mmio_read(vcpu,
-					   control->exit_info_1,
-					   control->exit_info_2,
-					   svm->sev_es.ghcb_sa);
-		break;
-	case SVM_VMGEXIT_MMIO_WRITE:
-		ret = setup_vmgexit_scratch(svm, false, control->exit_info_2);
+		ret = setup_vmgexit_scratch(svm, !is_write, control->exit_info_2);
 		if (ret)
 			break;
 
-		ret = kvm_sev_es_mmio_write(vcpu,
-					    control->exit_info_1,
-					    control->exit_info_2,
-					    svm->sev_es.ghcb_sa);
+		ret = kvm_sev_es_mmio(vcpu, is_write, control->exit_info_1,
+				      control->exit_info_2, svm->sev_es.ghcb_sa);
 		break;
+	}
 	case SVM_VMGEXIT_NMI_COMPLETE:
 		++vcpu->stat.nmi_window_exits;
 		svm->nmi_masked = false;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f93f0f8961af..022e953906f7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -14293,9 +14293,8 @@ static int complete_sev_es_emulated_mmio(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
-static int kvm_sev_es_do_mmio(struct kvm_vcpu *vcpu, gpa_t gpa,
-			      unsigned int bytes, void *data,
-			      const struct read_write_emulator_ops *ops)
+int kvm_sev_es_mmio(struct kvm_vcpu *vcpu, bool is_write, gpa_t gpa,
+		    unsigned int bytes, void *data)
 {
 	struct kvm_mmio_fragment *frag;
 	int handled;
@@ -14303,7 +14302,10 @@ static int kvm_sev_es_do_mmio(struct kvm_vcpu *vcpu, gpa_t gpa,
 	if (!data || WARN_ON_ONCE(object_is_on_stack(data)))
 		return -EINVAL;
 
-	handled = ops->read_write_mmio(vcpu, gpa, bytes, data);
+	if (is_write)
+		handled = vcpu_mmio_write(vcpu, gpa, bytes, data);
+	else
+		handled = vcpu_mmio_read(vcpu, gpa, bytes, data);
 	if (handled == bytes)
 		return 1;
 
@@ -14326,8 +14328,8 @@ static int kvm_sev_es_do_mmio(struct kvm_vcpu *vcpu, gpa_t gpa,
 
 	vcpu->run->mmio.phys_addr = gpa;
 	vcpu->run->mmio.len = min(8u, frag->len);
-	vcpu->run->mmio.is_write = ops->write;
-	if (ops->write)
+	vcpu->run->mmio.is_write = is_write;
+	if (is_write)
 		memcpy(vcpu->run->mmio.data, frag->data, min(8u, frag->len));
 	vcpu->run->exit_reason = KVM_EXIT_MMIO;
 
@@ -14335,20 +14337,7 @@ static int kvm_sev_es_do_mmio(struct kvm_vcpu *vcpu, gpa_t gpa,
 
 	return 0;
 }
-
-int kvm_sev_es_mmio_write(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
-			  void *data)
-{
-	return kvm_sev_es_do_mmio(vcpu, gpa, bytes, data, &write_emultor);
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_sev_es_mmio_write);
-
-int kvm_sev_es_mmio_read(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
-			 void *data)
-{
-	return kvm_sev_es_do_mmio(vcpu, gpa, bytes, data, &read_emultor);
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_sev_es_mmio_read);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_sev_es_mmio);
 
 static void advance_sev_es_emulated_pio(struct kvm_vcpu *vcpu, unsigned count, int size)
 {
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 94d4f07aaaa0..1d0f0edd31b3 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -712,10 +712,8 @@ static inline bool __kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 	__reserved_bits;                                \
 })
 
-int kvm_sev_es_mmio_write(struct kvm_vcpu *vcpu, gpa_t src, unsigned int bytes,
-			  void *dst);
-int kvm_sev_es_mmio_read(struct kvm_vcpu *vcpu, gpa_t src, unsigned int bytes,
-			 void *dst);
+int kvm_sev_es_mmio(struct kvm_vcpu *vcpu, bool is_write, gpa_t gpa,
+		    unsigned int bytes, void *data);
 int kvm_sev_es_string_io(struct kvm_vcpu *vcpu, unsigned int size,
 			 unsigned int port, void *data,  unsigned int count,
 			 int in);
-- 
2.53.0.414.gf7e9f6c205-goog

