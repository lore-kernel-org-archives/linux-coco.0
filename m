Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA6B37107D
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649399; cv=none; b=aPUrEk3AIGh61I8UAUunMP2XcN/BZNjVUw8VejxBdhq4kRW7FDrvagca3bJ9zcfgZJnwoe6+EsbGR8EmkHNg1NdxYW16vBbJC/SiJ5Tp8uI6EDwBgdsMJwQgJY6hpCHv1UOpy2avieRLKQu/UhNQ0mT3zLzq6COAX7U63Bz/Ydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649399; c=relaxed/simple;
	bh=Oi162mi6i9IEnnNv6uPixUH7Wd19+um7eCx9W0j7qNY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oz5h2wpMzHhan0zJwQGwkgzE1OGOtFEC8XUQfoXTEyfSfvUY+8TWxXsCzvBq01VBrsdoHxgdWWZ9cM1MU2haw7ZDcEJUW4Cxcji0z2BHdeey1BPK/oDRJHAMpODhr8t/XJ0zddn5KnDmlF6jtE/fi5uV55KZRqSl9rZiax0lxk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yFB4WNjS; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yFB4WNjS"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34ac814f308so632964a91.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649398; x=1770254198; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=f+prWW7rpbp1pSxf9bX6axWwAfKRzuFR7Mjnf0TwcpA=;
        b=yFB4WNjSQ2liXaCndiOsvTwUr3GuIXS+ucHWX8/a7/9sWHDWLyqvL9sngvZjlYoMqh
         Ed4FhKK+eRWqTgkbZAjVPGlnxP2FFk2SSQAY0r8jX3/qeclRfkR6t9/C74bUZYO+5WDY
         GuJ1JBtOKwjr9Wc9b2Er49Xbg49QdkPkDQocjiSK5c2rDkUW91Ih7OoQghIabpWx4PWl
         nkP8TWW3CcBnhV6S/4GYFNkjKmNT0QZ8ctbqaTe/zyudh1nJmGnXCUVp3SS2A2z79BoA
         zEqxN4oUOYYN6sOALPjboZVS2U2+K93kAd5U6Glt8FhSfgQoKdKlLEy7NqW52Yqns3qg
         Ep7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649398; x=1770254198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+prWW7rpbp1pSxf9bX6axWwAfKRzuFR7Mjnf0TwcpA=;
        b=jaAbVj+weoHQ0nLQ3BBHtAIWY81fZpLIC7cAjLX3RpL8NUfeXQGbuTlueQC+HJphPj
         lJZjAvh5yl2EcbIhiBSQ2kPYOjXbF8zcCSqnCZ/G8I2lDBlTX7RpFIxyG74r6ElTP2wf
         Z9+c9eKrOuPkSNIqri1QyzoQEuqq+gWaSlUDh06fGiubM8rZiy9oRaB9Xz4a1ZpUrnjM
         hyzM1eQ3qyzYG94x1YQ+CLuVhnNFvnTzh8yrhSTRejJS9Sh81Lg5WhjcY0LunYPMqKkq
         RnUtnIwFSBieDfsthwUgpSgt6FhLmsLCJ7ZS1G6Eol931xBujKoOPFjHgu9ONPcEOzyp
         RI6g==
X-Forwarded-Encrypted: i=1; AJvYcCXmmQmJEdCShPu90PRiKN2TMqcchnnp+1bB/+2TI/HMnjEaja8RpE+iUzr9TRGdictpjW7EKosxLBsK@lists.linux.dev
X-Gm-Message-State: AOJu0YwQf+mwftXk6de0+D8pbIlAczi6uxE0u4e/MtsAgWThG5gx/fMW
	pVYNn8z9wJ3cdh1FeRhiGB+ePUIcUOonbPecZ6IP6j/nW2av42qUZ6oPSE4Q503zJsE1yN9PQr3
	CY9d3vQ==
X-Received: from pjbso3.prod.google.com ([2002:a17:90b:1f83:b0:33b:c211:1fa9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d603:b0:34e:7938:669c
 with SMTP id 98e67ed59e1d1-353feda725cmr6069000a91.25.1769649397968; Wed, 28
 Jan 2026 17:16:37 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:09 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-38-seanjc@google.com>
Subject: [RFC PATCH v5 37/45] KVM: x86/tdp_mmu: Alloc external_spt page for
 mirror page table splitting
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

From: Isaku Yamahata <isaku.yamahata@intel.com>

Enhance tdp_mmu_alloc_sp_for_split() to allocate a page table page for the
external page table for splitting the mirror page table.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Co-developed-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
[sean: use kvm_x86_ops.alloc_external_sp()]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 3b0da898824a..4f5b80f0ca03 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1447,7 +1447,7 @@ bool kvm_tdp_mmu_wrprot_slot(struct kvm *kvm,
 	return spte_set;
 }
 
-static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(void)
+static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct tdp_iter *iter)
 {
 	struct kvm_mmu_page *sp;
 
@@ -1461,6 +1461,15 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(void)
 		return NULL;
 	}
 
+	if (is_mirror_sptep(iter->sptep)) {
+		sp->external_spt = (void *)kvm_x86_call(alloc_external_sp)(GFP_KERNEL_ACCOUNT);
+		if (!sp->external_spt) {
+			free_page((unsigned long)sp->spt);
+			kmem_cache_free(mmu_page_header_cache, sp);
+			return NULL;
+		}
+	}
+
 	return sp;
 }
 
@@ -1540,7 +1549,7 @@ static int tdp_mmu_split_huge_pages_root(struct kvm *kvm,
 			else
 				write_unlock(&kvm->mmu_lock);
 
-			sp = tdp_mmu_alloc_sp_for_split();
+			sp = tdp_mmu_alloc_sp_for_split(&iter);
 
 			if (shared)
 				read_lock(&kvm->mmu_lock);
-- 
2.53.0.rc1.217.geba53bf80e-goog

