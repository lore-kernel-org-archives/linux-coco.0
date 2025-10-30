Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F3C37DBFA
	for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855013; cv=none; b=OFbl8czNCq9VT3Q8QP9UMc7j80nmF8lTJhLb1oyat+manGQiNp1yNKCTy1rg8w3zlt89aFCXb+YblQyqtUILZRCNVVJgJ+u659+k39SqKqAb95LMG8WqXapE4WC1t02BCeglBOx9TbUoPsEhoKo9nsY7ZfcC8JTe8M8ki45V6gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855013; c=relaxed/simple;
	bh=Q2c6cNYSKoGYP4CYOI8nHGq0kI85fWBL8NZOIPZmdhU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yi45Y8xIi9qRx2JdAv/6HuyR0jYs/iEYFOTfs3FeYXp6QbV3tTfFbi7h1qcpXQSOpLvrVrTIm3w3U1Ro4bJJaAd5pQEzX8AXai1fwif1K/9qzHdA5T2FlREjk4M4X2PtslUM74eg4s21ffQAUpX2IHXmkAnle8/XCO6i5s6AWxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=umVi+29G; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="umVi+29G"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b522037281bso968653a12.3
        for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855011; x=1762459811; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=;
        b=umVi+29GlBMqC9PBZwUtq52Zvsm9mhX1HUBpuKEf7XecdfuWCGrPnSkLz4djFm4ReC
         ibPTQ1nVHKXnicXup3lM1Mg9YYRg6W6j2EFq5USq354esNTw5oFa/CbNUtJ/XRsZP64D
         3VVktGd21ALuRPrIWmQAg4OeAEsrjDDNJxTzhpBTjJMQ0z0BfXHIJ7U0iqzcC519OGYc
         0ehnRNhzB7SKzSGxyCNfl516wBp53si0mLAiMnO9hTlwYAUCaxD8I22OgXPtI4cOwwjd
         NzS/Px4A0SXFUDveGjVCZwJsULMigMsrk7a2//sepo5pbwcTQnkQONYUuofUAb61Jc2Q
         OLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855011; x=1762459811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=;
        b=B2jJWcV2v8DKRjqLvMHqZelwEXxF5EpUiqp1PuQ2FHpj1WUgIDur9xzTm3Quj0iczZ
         2uELFqcMoCqhJHxtZLAv+6UYp0/GKKOHQlhfXie6Kq9FKaL1b/431L5oK3wffBQsJWkc
         56YYIvuUjdP1YrLDnE24Hw9rAKdHsBME5SHmpylYG6oATR3WPk0INCSCLMsZTcBojHQG
         4T+nwV8IQJBxAPFGlGF5wzWwmlpOyu4JqdkdjP+a12yPijvtI+SZtOY3TPGAIuVCgGH5
         C230Ecx3OrIpAEkb13MnfajoOn5TArkvdsGdcyo8mo1Blzm79bQiBr8ePTngWxaKD/wN
         2OqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHXJt0TKt1BxSokI4BbqgpvIFsnmPro8UVvov7p1ZDsBFYoXOJDjWbuY/QJwtdYVARvVZxUkMasQVK@lists.linux.dev
X-Gm-Message-State: AOJu0YxxTYt0aArolTSjNb5pAkwwn3mAbrHSkVQQ9SiVukHSmqur8lR3
	Qs1X2azDLg1aNQbWDqvl4oqfFOVfel9X/vqECJ/4ItCr/lvYxtyRHPfn8c9wUDAFBSAa0JfVEKt
	NEBSQ4g==
X-Google-Smtp-Source: AGHT+IHqKKH3jALoT7jRe2OHIQ2mXXV+pELYiJKGwKEjf4ZIM+twJ+5jG3TjV8eGRlfpIUNYgujs+bg0n4E=
X-Received: from pjji4.prod.google.com ([2002:a17:90a:6504:b0:33b:dccb:b328])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c8d:b0:33f:ebc2:63a
 with SMTP id 98e67ed59e1d1-34082fc2cb0mr1192488a91.14.1761855011296; Thu, 30
 Oct 2025 13:10:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:28 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-6-seanjc@google.com>
Subject: [PATCH v4 05/28] KVM: x86/mmu: WARN if KVM attempts to map into an
 invalid TDP MMU root
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

When mapping into the TDP MMU, WARN (if KVM_PROVE_MMU=y) if the root is
invalid, e.g. if KVM is attempting to insert a mapping without checking if
the information and MMU context is fresh.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c5734ca5c17d..440fd8f80397 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1273,6 +1273,8 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	struct kvm_mmu_page *sp;
 	int ret = RET_PF_RETRY;
 
+	KVM_MMU_WARN_ON(!root || root->role.invalid);
+
 	kvm_mmu_hugepage_adjust(vcpu, fault);
 
 	trace_kvm_mmu_spte_requested(fault);
-- 
2.51.1.930.gacf6e81ea2-goog

