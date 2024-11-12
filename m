Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7621EBAB
	for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 23:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731453806; cv=none; b=QQIaM6pepmK0tMaXtqLMC2gH9Q4eC+UaCQ19HJ5/psMOHuz6Hey/otkpQt2YAopkfQxd+nP6gYqEWXMesaGg1y1cBfdSCmsIV5XeH54qI2IK7TcqiSOzxXnoRTQKnky1Tpp4NhAtzjVvZYUis2017KHaobqrJDtMcUV+elPKqMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731453806; c=relaxed/simple;
	bh=YSlU6X6JKLSeLbKMBuH/mDkE4l3HevChh3sRmgLUBXI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MuRe/rvSQ9bQczavjL5ahnoOckk5vL6D4JdNhpRSpWDbOf8w1Ood5y72qv0NnXX8o3XQjDPcbJPeBpiXIVdsjnoN+44OuDbNiJMSlwdAbKxpJ8YdyPSuZR2lsiTA2HwUSVrtTa8g7NndAGXoEahAL+LzTHEcVZhRu2RVQq4Tklg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jHbhL/8V; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jHbhL/8V"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71e479829c8so7537206b3a.0
        for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 15:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731453805; x=1732058605; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OuDWJG60RHXCqzpUFxAGPdqK8IqvXAJsitjiTXr/4nE=;
        b=jHbhL/8V/UZZTTIqrB6qoJmF63OvxAxmXXP7bUtzOzOXjRBrLKZp8P8qEF4AOtf/0C
         8PF+918plHnQMWZrIusXmUEzoNgM+mr993koB3fFB3w8gxHVAIclpFB7kqT351ocigKT
         quCzlLNewvjiHTcrWIK0DMO5YI942lRgrQe74WiGnL8iemQSuOQWQLwhWrqTfCiiSXVI
         BsgqS28fzWzWpvXCWv+2QyByB+b+ce540UB5qNkFEDSuuSbi4BZ2f5nEo2KZalaCoyVf
         YkYmvJV2mvTYWmLNfuHUFKU0xn9Cx2Jl4XpcQGhn0u2b+TTHMhcG4L2q5BEIIakVpeDe
         n8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731453805; x=1732058605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OuDWJG60RHXCqzpUFxAGPdqK8IqvXAJsitjiTXr/4nE=;
        b=bPyHK1pcyVWo6RWH42ORqiJ6LSiuV0Wrne5aqWe+0fn9qV1tLUiQnXxC7ezzLWNBq3
         Di8RtFUmNeDph7H7dWJjSMZFbEilFtqZpw/qeB4Rain/LBkd5GhCG1VUxkYLacrV+axP
         jVKpFKbRUBBhglqHRMUG1Dd87QKPg/QD4K3J06xHq8rR17L8UrkePA1PlFI9Nl3HEhMt
         e6U1tf+RUSwz+lWXWP0EF9TbuKQuAXvb6dR29bf+flwbNS8kxTV3AkSTuBTDvhfX8Xxy
         JjzKRBTULCpTIrb0YUzUtvTT1qL82rJxwOWMkbfIp4nzne/Gq63KCPjbdG8Qe6RkFyx1
         j0Kw==
X-Gm-Message-State: AOJu0YxAC2nWTpsHe1EbQvBXvE0Hs8dIV1sRVvdo3C5eUTDbNP6KmkQu
	Q3wSA6vxbvDjmCB5e2xs8utfYxTl0LFpa480Ku71duKJXjrZA2YKnD9tCsmFYR4gGEvGDdBojZx
	7Mo+ETWEpj+K3ZilLw38vrg==
X-Google-Smtp-Source: AGHT+IE6zPnpQVIS7blTj/Vhu9TTjYHNmJoBXH4WGKbfY0DY+2UePrQxclpNCjF7vH3HqWjU/xgzhv/gANZuiZaWCA==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a62:ee0d:0:b0:720:2e1a:de with SMTP id
 d2e1a72fcca58-7244a4fcc54mr33020b3a.1.1731453804651; Tue, 12 Nov 2024
 15:23:24 -0800 (PST)
Date: Tue, 12 Nov 2024 23:22:47 +0000
In-Reply-To: <20241112232253.3379178-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241112232253.3379178-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112232253.3379178-9-dionnaglaze@google.com>
Subject: [PATCH v6 8/8] KVM: SVM: Delay legacy platform initialization on SNP
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Michael Roth <michael.roth@amd.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When no SEV or SEV-ES guests are active, then the firmware can be
updated while (SEV-SNP) VM guests are active.

CC: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: Ashish Kalra <ashish.kalra@amd.com>
CC: Tom Lendacky <thomas.lendacky@amd.com>
CC: John Allen <john.allen@amd.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S. Miller" <davem@davemloft.net>
CC: Michael Roth <michael.roth@amd.com>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Russ Weight <russ.weight@linux.dev>
CC: Danilo Krummrich <dakr@redhat.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Tianfei zhang <tianfei.zhang@intel.com>
CC: Alexey Kardashevskiy <aik@amd.com>

Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Reviewed-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 arch/x86/kvm/svm/sev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 5e6d1f1c14dfd..507ed87749f55 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -444,7 +444,11 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	if (ret)
 		goto e_no_asid;
 
-	init_args.probe = false;
+	/*
+	 * Setting probe will skip SEV/SEV-ES platform initialization for an SEV-SNP guest in order
+	 * for SNP firmware hotloading to be available when only SEV-SNP VMs are running.
+	 */
+	init_args.probe = vm_type != KVM_X86_SEV_VM && vm_type != KVM_X86_SEV_ES_VM;
 	ret = sev_platform_init(&init_args);
 	if (ret)
 		goto e_free;
-- 
2.47.0.277.g8800431eea-goog

