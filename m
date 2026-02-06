Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6293313291
	for <linux-coco@lists.linux.dev>; Fri,  6 Feb 2026 22:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416925; cv=none; b=p7c5WZtKIHGPsxDtxke4BMu0vYbs4f51RztZxstNjWUBoulgT50rOcKZooUlUo4CvssiJVC+DhexyQZpkSm07YhIQ+Jb5vYD5x/q4fk89MW1TMzSga5XxEn7fj8BL1q13tSx4mhyVxrmgRGG1gpO53MRBjQORMdCTViE92Xks5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416925; c=relaxed/simple;
	bh=BZpL1RE9XfDIgFESeYrbtsYlln4FTRDnK6vMRKcrB4s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FKOvbtc3ME1oNvapsIEHUScZGw3xqj8gyL65eG89Oby6tCcYkPs4GTyzUdgJJvK475vipgPRPaA/BG5yZdn+Xin4SpeyGjII0VpQhRXbAY91yGBXFI24uM1BNBqOdF5R9S0LZdGvxSVPcbBWWN+4icKcveVODv0Dczy104YDNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nhIxhD5x; arc=none smtp.client-ip=209.85.167.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nhIxhD5x"
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-45c8650ffcaso2085983b6e.1
        for <linux-coco@lists.linux.dev>; Fri, 06 Feb 2026 14:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770416925; x=1771021725; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sPoqEhUMmdDPahIwHzxtMUXZ8ToMdzI8JESAi3VAuZ4=;
        b=nhIxhD5x3rqSX/Den613aUNuFqZRhD6x3qbNWjQ83DMvpwZA7ZtW3x8O3T/H+ZCf2c
         DnaJF+h8p77Mz+5YaiemnrqiHTLu7As35mfVgI9qQ1bT0w1fPHIfmC+SoeV3Az6QLcmk
         9O7x6GQevPzsoEgpyFbAv4LWZ5nSQvLFCeGRYHdB+shFflELAvTlk+5WGSgpfZywqNCj
         EhgJE4jaZ9bfiJ1Nw+65Ldy0T3PPZdUWOgVMBJuX+80h+vew8D2dKSzx88k9luI7m2kP
         o2yTDzfJErQmaF3OQZmZyz2OTNd912ttg5SWqXWnhhFiz7+NbP9rtJY7NoJFcf7kkle2
         dsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770416925; x=1771021725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPoqEhUMmdDPahIwHzxtMUXZ8ToMdzI8JESAi3VAuZ4=;
        b=F2FGrivUDSoR9QD5bA10A12LRtU+BMFTY4e9BP99JPs2JGIGJXi/UC5UPfl0tzddf5
         ajnbGctGEpRF2Bq7RabBVeTCN+tP837oZnKbu4EX9FOiZSZ5oNfL9/ZTxCaGXTp9KGQp
         EOLpxQwVkNJdLqrZybWPs58R5qLsIRbpRWGHLYuxhHlXlAK+isubySXFDajOhyeYRo8o
         SvoYTMD7Td6htdEcYzsmj++LL6VAJHPPPsTsRwbLkLhw6W2RxZTrDu8uQsCR1cRkAIZN
         LVC3DiN3DwQ/2BTOXDHG6aqmhO6MGOWV0gv1j6ogEndeQnxPwULpFu+i3sbVwcLVmGIM
         0QSA==
X-Forwarded-Encrypted: i=1; AJvYcCULUE3oG4tvAnjLlIaPZRbiGwlDqXyCOOUkZf9uWbLjsA93flZjcslXYhkIx4ui9XDzJbMYa9Q6uH5h@lists.linux.dev
X-Gm-Message-State: AOJu0YxefAGqyQmhb+afiF3rwTJWsmQBWf6eHymDXOgzIpJ6YHs9EspG
	UQ7Gm1vrF2dP9BxWVuZSSydKgKDGCdqEj6SXxdraA5fZSNFNSKOz+ZAkR9E1j10O9v+MHjkAbf6
	1ew==
X-Received: from iofm8-n2.prod.google.com ([2002:a05:6602:83c8:20b0:957:7451:a858])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:2910:b0:663:23a:caf6
 with SMTP id 006d021491bc7-66d09ac270bmr2203902eaf.5.1770416924752; Fri, 06
 Feb 2026 14:28:44 -0800 (PST)
Date: Fri,  6 Feb 2026 22:28:29 +0000
In-Reply-To: <20260206222829.3758171-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260206222829.3758171-1-sagis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260206222829.3758171-3-sagis@google.com>
Subject: [PATCH v3 2/2] KVM: SEV: Restrict userspace return codes for KVM_HC_MAP_GPA_RANGE
From: Sagi Shahar <sagis@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Michael Roth <michael.roth@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Sagi Shahar <sagis@google.com>
Content-Type: text/plain; charset="UTF-8"

To align with the updated TDX api that allows userspace to request
that guests retry MAP_GPA operations, make sure that userspace is only
returning EINVAL or EAGAIN as possible error codes.

Signed-off-by: Sagi Shahar <sagis@google.com>
---
 arch/x86/kvm/svm/sev.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index f59c65abe3cf..5f78e4c3eb5d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3722,9 +3722,13 @@ static int snp_rmptable_psmash(kvm_pfn_t pfn)
 
 static int snp_complete_psc_msr(struct kvm_vcpu *vcpu)
 {
+	u64 hypercall_ret = READ_ONCE(vcpu->run->hypercall.ret);
 	struct vcpu_svm *svm = to_svm(vcpu);
 
-	if (vcpu->run->hypercall.ret)
+	if (!kvm_is_valid_map_gpa_range_ret(hypercall_ret))
+		return -EINVAL;
+
+	if (hypercall_ret)
 		set_ghcb_msr(svm, GHCB_MSR_PSC_RESP_ERROR);
 	else
 		set_ghcb_msr(svm, GHCB_MSR_PSC_RESP);
@@ -3815,10 +3819,14 @@ static void __snp_complete_one_psc(struct vcpu_svm *svm)
 
 static int snp_complete_one_psc(struct kvm_vcpu *vcpu)
 {
+	u64 hypercall_ret = READ_ONCE(vcpu->run->hypercall.ret);
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct psc_buffer *psc = svm->sev_es.ghcb_sa;
 
-	if (vcpu->run->hypercall.ret) {
+	if (!kvm_is_valid_map_gpa_range_ret(hypercall_ret))
+		return -EINVAL;
+
+	if (hypercall_ret) {
 		snp_complete_psc(svm, VMGEXIT_PSC_ERROR_GENERIC);
 		return 1; /* resume guest */
 	}
-- 
2.53.0.rc2.204.g2597b5adb4-goog

