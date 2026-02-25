Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3232248F54
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982473; cv=none; b=DsJ+YA6tP5s+HhQ+6QsohZV3tRlNq4oVbnL+PCSxXTaLB1B1mTEEe3VYjPhcfTeeJ1GPdNQisBvrw5cH06VD/hxuZQNMYytj9rgOWp8u51SDvwyLRT9c690o/YR+mAdu66aGKsDbhjER8ZQ7Bv0uNqKU+y4iHd/RCzyRfffp7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982473; c=relaxed/simple;
	bh=4zmfeUoFw0++ZD2R7XqZF7I3p6nxfaKrCAs/KOcytN0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DWn5dmKD6XkKpk7bU+X+PqtHFUctmjeeogPxha53nTMcv29VJ+y57qp44HVtr/FYq5Ss0pK5o9yE8vVG2S8hJW297O1eGLsLzc/j6+JnwjjJnl7oS/5LCfpx9tJDtFPdZvXvxTo+B6j7JbK72VqW6TyJR8r0Jq7E2QpT7qX2g+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Onp3j4Yt; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Onp3j4Yt"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2adae76a9d0so10808295ad.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982468; x=1772587268; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LNNapYowtT0YYRygm4WC7Vz/wQDCwBu2kBJka11VtD0=;
        b=Onp3j4Yt6OU7UqrCXSqCZ1A/CtOV7zQ62/ZxHFRt0LCPmBbQIoqHwXuiYvNK3eDhqx
         Smd0ABK9wza1bqTj12t4qPD2fhvUtNUhZyeHSJhsu8yZJaYk09MSybVwVTv60377Z830
         E9HFeADHRlOYdLz+Qe6uKvm/hnX1yR10IrEYZA9g8ZNVjtilUJupZqUb3CzLpMMU2pws
         KYPrm+2IkTFNtbejxGByhA2Vk7mcTgnqg/87TEbfn6nxtEQyMwxGrAKtlajORkhJmYj6
         pPNbz7qmuV0r3jYqtWVrAJVy4Z8wROhGDcjsT3kB0XpuRyBIybFdjLjClNS+Lo+yuEyw
         TdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982468; x=1772587268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNNapYowtT0YYRygm4WC7Vz/wQDCwBu2kBJka11VtD0=;
        b=sPktRS4cXFKozNEFv1iReMHs+k91Uq1npjUBTXPSp4Ce4Kxzs7NsWj7TuoRr+yXeg8
         SYtZcLfDP0WhclRGPyHCB9aNrUGeeiQgGKZgPMvbWwRLyqrsSNAJ5egiAX4A43DRHzAJ
         6zK3wBcZ99JYurQOdmQJLKcW1CC3kvY2Ie3Sm5tNZK23YLJ9jKC015HsszM283BbF0wW
         KXiTq5wL2oXhLa4RwqsfBldVT+LlqAgxRJd8oZHYpmHm0VV56Fa4bp11uiZi/G/T1/Ri
         CgkMh96wsMtSs12iiqCd9m67ATFZcilG5JoVJWQ/+Nkxj3kOj0VzFxOnJ9NN3L7ADuey
         ciHg==
X-Forwarded-Encrypted: i=1; AJvYcCUtFkiJy7gnS46iWm9oOrV6DYJlpqbu6VJpf3vQAqtlFrAWJ4ZHZRk5hAw0Mp7NoQmslbujB8WaZyuq@lists.linux.dev
X-Gm-Message-State: AOJu0YzzmsljZdtFcL0Zd6EN0dy168W12Xt45L3J68z1wtRkSDE5+bGS
	+t3zCIvQgfCKJ+/f9pX2M/orm/zLmQ5CKMIjFNuMN1N9O2+auFJu7v5hC0g9rXXd5HpZSVLNKzh
	SNe/Ibw==
X-Received: from pjbnh18.prod.google.com ([2002:a17:90b:3652:b0:358:dfd8:3150])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a8f:b0:2aa:f2ce:5ac5
 with SMTP id d9443c01a7336-2ad744e0d19mr151791755ad.32.1771982468138; Tue, 24
 Feb 2026 17:21:08 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:43 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-9-seanjc@google.com>
Subject: [PATCH 08/14] KVM: x86: Dedup kvm_sev_es_mmio_{read,write}()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Dedup the SEV-ES emulated MMIO code by using the read vs. write emulator
ops to handle the few differences between reads and writes.

Opportunistically tweak the comment about fragments to call out that KVM
should verify that userspace can actually handle MMIO requests that cross
page boundaries.  Unlike emulated MMIO, the request is made in the GPA
space, not the GVA space, i.e. emulation across page boundaries can work
generically, at least in theory.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 110 +++++++++++++++++++--------------------------
 1 file changed, 45 insertions(+), 65 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2db0bf738d2d..f93f0f8961af 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -14293,80 +14293,60 @@ static int complete_sev_es_emulated_mmio(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static int kvm_sev_es_do_mmio(struct kvm_vcpu *vcpu, gpa_t gpa,
+			      unsigned int bytes, void *data,
+			      const struct read_write_emulator_ops *ops)
+{
+	struct kvm_mmio_fragment *frag;
+	int handled;
+
+	if (!data || WARN_ON_ONCE(object_is_on_stack(data)))
+		return -EINVAL;
+
+	handled = ops->read_write_mmio(vcpu, gpa, bytes, data);
+	if (handled == bytes)
+		return 1;
+
+	bytes -= handled;
+	gpa += handled;
+	data += handled;
+
+	/*
+	 * TODO: Determine whether or not userspace plays nice with MMIO
+	 *       requests that split a page boundary.
+	 */
+	frag = vcpu->mmio_fragments;
+	vcpu->mmio_nr_fragments = 1;
+	frag->len = bytes;
+	frag->gpa = gpa;
+	frag->data = data;
+
+	vcpu->mmio_needed = 1;
+	vcpu->mmio_cur_fragment = 0;
+
+	vcpu->run->mmio.phys_addr = gpa;
+	vcpu->run->mmio.len = min(8u, frag->len);
+	vcpu->run->mmio.is_write = ops->write;
+	if (ops->write)
+		memcpy(vcpu->run->mmio.data, frag->data, min(8u, frag->len));
+	vcpu->run->exit_reason = KVM_EXIT_MMIO;
+
+	vcpu->arch.complete_userspace_io = complete_sev_es_emulated_mmio;
+
+	return 0;
+}
+
 int kvm_sev_es_mmio_write(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
 			  void *data)
 {
-	int handled;
-	struct kvm_mmio_fragment *frag;
-
-	if (!data || WARN_ON_ONCE(object_is_on_stack(data)))
-		return -EINVAL;
-
-	handled = write_emultor.read_write_mmio(vcpu, gpa, bytes, data);
-	if (handled == bytes)
-		return 1;
-
-	bytes -= handled;
-	gpa += handled;
-	data += handled;
-
-	/*TODO: Check if need to increment number of frags */
-	frag = vcpu->mmio_fragments;
-	vcpu->mmio_nr_fragments = 1;
-	frag->len = bytes;
-	frag->gpa = gpa;
-	frag->data = data;
-
-	vcpu->mmio_needed = 1;
-	vcpu->mmio_cur_fragment = 0;
-
-	vcpu->run->mmio.phys_addr = gpa;
-	vcpu->run->mmio.len = min(8u, frag->len);
-	vcpu->run->mmio.is_write = 1;
-	memcpy(vcpu->run->mmio.data, frag->data, min(8u, frag->len));
-	vcpu->run->exit_reason = KVM_EXIT_MMIO;
-
-	vcpu->arch.complete_userspace_io = complete_sev_es_emulated_mmio;
-
-	return 0;
+	return kvm_sev_es_do_mmio(vcpu, gpa, bytes, data, &write_emultor);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_sev_es_mmio_write);
 
 int kvm_sev_es_mmio_read(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
 			 void *data)
 {
-	int handled;
-	struct kvm_mmio_fragment *frag;
-
-	if (!data || WARN_ON_ONCE(object_is_on_stack(data)))
-		return -EINVAL;
-
-	handled = read_emultor.read_write_mmio(vcpu, gpa, bytes, data);
-	if (handled == bytes)
-		return 1;
-
-	bytes -= handled;
-	gpa += handled;
-	data += handled;
-
-	/*TODO: Check if need to increment number of frags */
-	frag = vcpu->mmio_fragments;
-	vcpu->mmio_nr_fragments = 1;
-	frag->len = bytes;
-	frag->gpa = gpa;
-	frag->data = data;
-
-	vcpu->mmio_needed = 1;
-	vcpu->mmio_cur_fragment = 0;
-
-	vcpu->run->mmio.phys_addr = gpa;
-	vcpu->run->mmio.len = min(8u, frag->len);
-	vcpu->run->mmio.is_write = 0;
-	vcpu->run->exit_reason = KVM_EXIT_MMIO;
-
-	vcpu->arch.complete_userspace_io = complete_sev_es_emulated_mmio;
-
-	return 0;
+	return kvm_sev_es_do_mmio(vcpu, gpa, bytes, data, &read_emultor);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_sev_es_mmio_read);
 
-- 
2.53.0.414.gf7e9f6c205-goog

