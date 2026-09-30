Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72E18FDBD
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 00:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727094; cv=none; b=SYm43yPSvemtsN2W0/lYJr5GBUEWu0DjgosxFc4hTJQcGhq1ciOBJ/i4mlo84AuzwTkZKnkKcAEj8gnboN8KvIUcsC3HydzXShsE7cgT8/cP/SaUWI5buQ23FZFLV6YfjQuzPylWsysbziBFqvsY7ZJTI0leZnFsbkZB1Akv0Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727094; c=relaxed/simple;
	bh=rsmJJopby/zjOBBYlbUWEXvU10fwIFhLZJz8OKxRHo4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WSzd3d2jCCRqiWXI6qx/fm0B0VXlPZOVOmBsUmJJBn3dWxLS0CKsYxWrR6KGrTTCI6P6oo7XOi8aRHCBg8mUoGyUIr2TuK/1f+qU4nZBr12zukJpxicN1zGqQtI4XPjdCquwd3k9f7cWCF96q1GW32GrQfLLkAaI5tYqRsh4q9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gO1lpHnc; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gO1lpHnc"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so74115775ad.1
        for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790727092; x=1791331892; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hc+7AhFKRyAVFY2si4O9j85hgjPeFQ1ZmzMpM6zVemg=;
        b=gO1lpHncL3WzGE6+vFrzHHc7NA2sZu0pZmCoLy+PilG0VxN2CL3YsObAKWm6UpfUly
         n3aEocdsYAfKlWsyyaoGjXyIZtj99HSh9CsuuXNqgLpAmVoatVHRFlr3suR2zHiMt+cH
         UBZ+9HZ8yZPmLa9ubxSgGoY9Gnorxdj+4xOM9IDzP0hf6cMmjbjtQ9+zBI4XLVe6H/5w
         +Jz8vjgOxYAtRgn+lc6mzTbu6U0Byojned4V2Xj0Lgn+kviliR5SD94Kx5s68F2wSsx6
         M0GsvC+o63Wh40Mv81uIkjHxEiTXP1aBJ2nA03miv9bvZzce45BMiJIqmKQrcpti+tsn
         iitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727092; x=1791331892;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hc+7AhFKRyAVFY2si4O9j85hgjPeFQ1ZmzMpM6zVemg=;
        b=k+Q3n44Ee2Kb1TeM9hKyzOmCZKpu/2NuHUC/+E/U7O2rBlgKMIir1FVMXL0BpUvLQS
         456jpDI45zCa8liiEcJGHqzTGG2B9C8qiajJORt93g65kvkrI1MV9N6gen9hvX+r9Q4T
         F02yg6kcxWerlszGP4hlY/ky6pw5gvTsULjy1y0c/BY7oZfMqD2m+2r4pec61epQbEKB
         PowhIq5iOWJfOLnlBGA4aAdNCz7h0eEFzhvofoHs/AVBJ0eH3fSskyroZpAe+2ddltk7
         ZCEwu+YwVSuwk3sIuHJAUQzIYJZG4Rv6v9jsSakw1jjNp/X7mltlpdQS2HcvnwzmSyPH
         8avw==
X-Forwarded-Encrypted: i=1; AKwUvBx6k4p/DngtF+m9+D7D4DxoaOtGm9MhKWHaICdWgDtPyUthvHVy98S2iSrY3QNEY2R94vNbl2qHL70e@lists.linux.dev
X-Gm-Message-State: AFq9FYJf6M8UP3rfKN1YgY9GLGxzCBWPaigTDYQgV7jckpOrylOo9x6K
	zLgygAdrWNWrkzH9ch+hUyhE9pHj5CE4jkXc3FzHw8MZf7LLMXD663x7p8I+ytxOj+EFt3PLluL
	XTKhPhg==
X-Received: from plrd9.prod.google.com ([2002:a17:902:aa89:b0:2df:9a43:558b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d587:b0:2db:2413:87d2
 with SMTP id d9443c01a7336-2e2de428559mr5369495ad.4.1790727091670; Tue, 29
 Sep 2026 17:11:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 17:11:26 -0700
In-Reply-To: <20260930001127.3170009-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930001127.3170009-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930001127.3170009-3-seanjc@google.com>
Subject: [PATCH v2 2/3] KVM: TDX: Synthesize SHUTDOWN instead of returning
 -EIO on unhandled EPT violation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Exit to userspace with KVM_EXIT_SHUTDOWN instead of returning -EIO from
KVM_RUN if KVM encounters an EPT Violation due to a guest access to a
pending page.  Returning -EIO implies KVM is buggy, and most VMMs will
respond by completely terminating the VM, versus rebooting the VM in
response to KVM_EXIT_SHUTDOWN.  I.e. give the VMM the option of trying to
keep the VM (from the end user's perspective) alive.

Ideally, KVM would probably exit with KVM_EXIT_MEMORY_FAULT, but KVM would
need to extend run->memory_fault so that userspace knows the fault can't be
handled.  This scenario specifically occurs when the guest has deliberately
disabled #VEs on unaccepted memory for security purposes, i.e. the guest
literally disabled the mechanism that tells it it screwed up.  But, because
this is fatal, and the whole point is to NOT try to fixup the fault,
jumping through hoops to return MEMORY_FAULT instead of SHUTDOWN doesn't
make a whole lot of sense.

Don't bother bouncing through KVM_REQ_TRIPLE_FAULT as
tdx_handle_ept_violation() is a top-level exit handler, i.e. there is no
need to worry about failing to actually exit to userspace.

Fixes: e6a85781f783 ("KVM: TDX: Detect unexpected SEPT violations due to pending SPTEs")
Cc: stable@vger.kernel.org
Cc: James Houghton <jthoughton@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 29d4751f37fb..e3723f1222fc 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1939,8 +1939,8 @@ static int tdx_handle_ept_violation(struct kvm_vcpu *vcpu)
 		if (tdx_is_sept_violation_unexpected_pending(vcpu)) {
 			pr_warn("Guest access before accepting 0x%llx on vCPU %d\n",
 				gpa, vcpu->vcpu_id);
-			kvm_vm_dead(vcpu->kvm);
-			return -EIO;
+			kvm_prepare_shutdown_exit(vcpu);
+			return 0;
 		}
 		/*
 		 * Always treat SEPT violations as write faults.  Ignore the
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

