Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B1B32ED31
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649367; cv=none; b=E03ww/lujoWGxOamc9m2OGgFdctYIsAixbt17zmKISKKVw5sEz3vXF+hGdjubSaOKapgJVPmu+lUEayGAWXErbA+O1QT+3V/B/zbkOXAkdL2PMiQ/kPmXZOc0nN2CCGJNLoqO00laqx+1D6as5X6iqmN7oAC18D/ofhIctQcLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649367; c=relaxed/simple;
	bh=D1RcyFmhh8+6broUyuRXqMJfbz3G6P8KH0L0jZI3CCE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n9jTPdhZpSqB7sCfmnlKXFTRuaPO+xd1nxdM6DdeJe1DE8QKvzDsWmcknnFLR/w5Y7c+8QbCazjzshox5ety8R+D6fd3pekJ/1Zkot7+E2SBv05jlNOGt3SJQqsSFIi1FxOugGr7JL/jxh7NUoBy4amYq7B2RzmwCHsdr8tItEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q7avGWbs; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q7avGWbs"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-81f3ed6e935so771679b3a.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649365; x=1770254165; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ex0+d/EF8QHeKOGyYN3KDqeLevHaBCQA5Sl9ZATFjF0=;
        b=Q7avGWbsSUdz0qvGqB2KtqwTNbjbKDkyuJDP+U1+9JlJrB70+47CjCAdLbkhk2WPpm
         XVWnUp6VyrdFAGV/tBy3fcofrI9FXdan+SygKZuPD1CrDO5Sdl6f4P++vowJTHd6wD5m
         w/d/bQiagnCTmR+KFZum1wJfeHyYZr/7Bnr/nFsV/rLhN9l8dSSFGvOeJ9mbMow/iCfK
         xmVYsVr9j5uP/WR9W9kbnLoE+Jn0qkRE95bgn1Y+jwIi83/hcbKHKsGWS6Rsa/5TP6Ke
         z7XWS3F9NpMLIcycS0tjSStEpNmbsHns0k8+7LjyASqKLZGGh5YrnpM2ry+8HSheiHVj
         bA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649365; x=1770254165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ex0+d/EF8QHeKOGyYN3KDqeLevHaBCQA5Sl9ZATFjF0=;
        b=aKgFLLWTEmGxWyPlwudni6ZcFy9TJ12NXb1g7whSOGyBOjdymYM2eInMLDrukNwk7W
         PTsjFI0TxJmdM+5cWnI9QtsKt+JpoH6XitmtBoexUo6s5LOYb82l1+V1fJ2dsA1QSstV
         4b5gUdXNbnu6rOsGhZDH6yZmIjgTG0n9YMKj6rX1iWlFXPUSRpqyMKDg6ZtroBz3g/Ey
         xKS8toRHaijzJw9P247hZqf0Hjj/WqevV8v59eO0uR2v1dH4jir8gnN7qG7txDTTYO5U
         kHByietknOjbAy212yDRRyHjAtOQSJzC0D1CamARCBNYAbCWuCOQhDFIR+6vr1OCSeu4
         V20Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDU7GUqLEwkKpsU7mDF2AhqjE7vRjx0U0pn5ka38iG5d87Vdjiyx/SkCtQnYCeMv1x6DZd46DgZs5G@lists.linux.dev
X-Gm-Message-State: AOJu0YxalnGLH15WWkoIgssj5j1A7O2b3sKO7N98Yihn6UWpzW1Wqu8M
	hzwPGsvuFtdQdO97jwsXayoM2Sglh/cpKRF5C9HFAljoSXS4bCXHJuShP69hOsPelSl0P2Jcz8y
	K/d5pJA==
X-Received: from pfbif13.prod.google.com ([2002:a05:6a00:8b0d:b0:76b:f0d4:ac71])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d82:b0:821:80bf:590b
 with SMTP id d2e1a72fcca58-823692a3747mr6686129b3a.34.1769649365031; Wed, 28
 Jan 2026 17:16:05 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:51 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-20-seanjc@google.com>
Subject: [RFC PATCH v5 19/45] KVM: Allow owner of kvm_mmu_memory_cache to
 provide a custom page allocator
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

Extend "struct kvm_mmu_memory_cache" to support a custom page allocator
so that x86's TDX can update per-page metadata on allocation and free().

Name the allocator page_get() to align with __get_free_page(), e.g. to
communicate that it returns an "unsigned long", not a "struct page", and
to avoid collisions with macros, e.g. with alloc_page.

Suggested-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_types.h | 2 ++
 virt/kvm/kvm_main.c       | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index a568d8e6f4e8..87fa9deffdb7 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -112,6 +112,8 @@ struct kvm_mmu_memory_cache {
 	gfp_t gfp_custom;
 	u64 init_value;
 	struct kmem_cache *kmem_cache;
+	unsigned long (*page_get)(gfp_t gfp);
+	void (*page_free)(unsigned long addr);
 	int capacity;
 	int nobjs;
 	void **objects;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 571cf0d6ec01..7015edce5bd8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -356,7 +356,10 @@ static inline void *mmu_memory_cache_alloc_obj(struct kvm_mmu_memory_cache *mc,
 	if (mc->kmem_cache)
 		return kmem_cache_alloc(mc->kmem_cache, gfp_flags);
 
-	page = (void *)__get_free_page(gfp_flags);
+	if (mc->page_get)
+		page = (void *)mc->page_get(gfp_flags);
+	else
+		page = (void *)__get_free_page(gfp_flags);
 	if (page && mc->init_value)
 		memset64(page, mc->init_value, PAGE_SIZE / sizeof(u64));
 	return page;
@@ -416,6 +419,8 @@ void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc)
 	while (mc->nobjs) {
 		if (mc->kmem_cache)
 			kmem_cache_free(mc->kmem_cache, mc->objects[--mc->nobjs]);
+		else if (mc->page_free)
+			mc->page_free((unsigned long)mc->objects[--mc->nobjs]);
 		else
 			free_page((unsigned long)mc->objects[--mc->nobjs]);
 	}
-- 
2.53.0.rc1.217.geba53bf80e-goog

