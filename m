Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC048C3F2
	for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723898; cv=none; b=q7EarnFoiRvR0zoqCZl0fwjQ3LNUOovQfInVbv88P4cMWWyjPnMecQQFho6h2xMWBC3c1HaIR47vvuwogDiMxaScj1fRm0nlrSbDRM6laID3wYYz93n9cSGQm2HeUey7M/09h1rHFmkM9XpmVhIVwgquCFSBVqNzL3/5CnzY018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723898; c=relaxed/simple;
	bh=Yjwp5sXg8hA+IFzilFQC+IgVznGjRjghxOVmLb6eHpE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jTx69DiHpI0BqPDjF+Rj7EODmwy9A9TA5+clbLPEUIWyfYbNLW524+l0mrESR/fCzXyAt+Y7UWx8o70f+os/Q3bDMMnhZGsgI1wPgj65fMl2865g9MCDMwmtLGt2P7g9w/aNttiaKglso/PqLhJsDd75PVB8YB7V17/Occ2QxI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dd6KmCmJ; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dd6KmCmJ"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so1644471a91.2
        for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786723892; x=1787328692; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1QOpGA/mOfm9r1jqGgG0mT+xGoxs+eURoQ2xm4eLKI=;
        b=Dd6KmCmJl56zKH88udMe3LLrwqdnhFodeIRTpTpYrNo5SFhvkpj/jvi6CPMK7k0c27
         PlKwkHoHK0+OjS/cQUQGkGVAX5j/FQGCB2JxTpbeNga9GoLl1oW7sTlgToQO0mI8aFh1
         VDrbDe0Xap6IgPi2eCygSU8TrkAha1VyUv+w+o8tiH4gV1KSiBvk0RZAcdWpUsBafDA+
         hZBkPy59dvcPNX5YqQ7sQsHnQPQbaawRuB6rTWjI4Gg0qT/6APnZdJBXSxksO5K2EkEI
         xJBKhmnfAiEb9pas/06N3LgHXiGacf3EnxTx4c63RqaddTMb4k8etx3qofgZvUeIOyFE
         SdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786723892; x=1787328692;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G1QOpGA/mOfm9r1jqGgG0mT+xGoxs+eURoQ2xm4eLKI=;
        b=Nh5DX6By5oK0fHmqzUrzWHxuH7VNRkPVCjko7aM7OdT0gYo3pa+TqbA9ag3UKHdRjK
         3Y2kI678q8/chlXxCr3OmgFvAUPQoVvqZRXNsdpqYF6sghKhqlx04KwIHdCTA2GNV8Eu
         U8tSRVtNVAhl9ImyDwMHLWbRa3GEjNZ9WREk6p/t2aa5DdknLC1vJ5atIV2zOidGi4y+
         JmGgEwzKyYe39gHyxuP3nb1KpEdcJBjjMfsKyw38JPNy4urP9dorwgqctiymoYnQkxEj
         BC1hB/DsswsZlLvkWAuf/36M1CezqNXpArm98/CQMskXTvQWIxUCi0sWwTmTtx/JbQh1
         2Bfg==
X-Forwarded-Encrypted: i=1; AHgh+RrmTmrjLT00q+uJKdIktwuukjesN8mb6nHQJyzHoOnXyBQyQ7prxUKYtaqm5rf/2Rdh0KULQMNiuq8F@lists.linux.dev
X-Gm-Message-State: AOJu0Yxby2LlJwgzG6iNnZJZm36CMZi7M8ViiuO3DaS2Oa6QredPuglU
	R8mMaM/k4bVomK8jSj2gd2dQWHfmRG/AjtC2Xe6qTelULAgyoaExlJ5DgiDeAXWGeX1RSEBYygY
	VQWnUKA==
X-Received: from pjte4.prod.google.com ([2002:a17:90a:c204:b0:38f:749d:db46])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:384b:b0:37f:e1af:df22
 with SMTP id 98e67ed59e1d1-3933ba90e38mr7162627a91.17.1786723891326; Fri, 14
 Aug 2026 09:11:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 14 Aug 2026 09:11:26 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260814161129.2177118-1-seanjc@google.com>
Subject: [PATCH 0/3] KVM: VMX: Harden against interpreting TDX vCPU as vcpu_vmx
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move vmx_handle_exit_irqoff() and all its helpers to main.c, and then poison
to_vmx() for the common .c files to harden KVM against misinterpreting a TDX
vCPU as a VMX vCPU, i.e. consuming to_vmx() on a TDX vCPU.  Spotted when
working through the bus lock series.

TDX changes are compile-tested only (one of these days I'll track down a host
that's fully TDX-capable).

Sean Christopherson (3):
  KVM: VMX: Move the shared "IRQs off" exit handler(s) to common code
  KVM: VMX: Disallowing using to_vmx() in common VT code
  KVM: VMX: Rename posted interrupt prefixes from "vmx" to "vt"

 arch/x86/kvm/vmx/common.h      |  6 +++
 arch/x86/kvm/vmx/main.c        | 75 +++++++++++++++++++++++++++++++-
 arch/x86/kvm/vmx/posted_intr.c | 18 ++++----
 arch/x86/kvm/vmx/posted_intr.h |  8 ++--
 arch/x86/kvm/vmx/tdx.c         |  4 +-
 arch/x86/kvm/vmx/vmx.c         | 78 +---------------------------------
 arch/x86/kvm/vmx/x86_ops.h     |  1 -
 7 files changed, 97 insertions(+), 93 deletions(-)


base-commit: 1b731e5ded480bd1e5546aed35584238661ce72e
-- 
2.55.0.691.gc56d675ccc-goog

