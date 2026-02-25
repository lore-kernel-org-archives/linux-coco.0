Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E420C012
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982453; cv=none; b=CcibFD5fE1whbZdv2xq5vUX6zQ4YRh7jJHEOhcqvj+M2qIFJASU34iq7suWdRz4L0YN5MJMDj9uNyDimHSeCTqWYUYJQHBN5vNDP9opoHxWgmr/oKH3cY/5zrScRttpGWmWqDzzyxGnMMJW6s4VpiglOY9LhwIOf5u8trGu5R2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982453; c=relaxed/simple;
	bh=rIfQEdmFShSU/hfE1nBXkImYGxL0rG4etafqHLncUjo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XGLigyesw4QGyYPDUbLQiE2MAo6+OsB4gS8I8AyqH2xhG8goqKgEyl+o8r/ZwrU4JaLNgWLxtAfHl7iYOdyFypirGmwmTp67AbAfkd5m6SaqC0101+iSq5C+MNuv7YGHj4xnlQxqk3doh7/zCy6te7I01Q/qIdN3UMb7vjE2nqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m/EU3UET; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m/EU3UET"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2adba04421eso37824435ad.3
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982452; x=1772587252; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOLZOHpBY9NF13p+U0yWvHRv6RzqdAH2//7LWxAyLYY=;
        b=m/EU3UET73nwlFNzVf4eBf5m6Nxbl812qSevQ4WK5spezHFr6A16AoX0N/m2DkZP9P
         K8BCYnFyH3xGtkyE6UgOVGJu9uryAv+93hgmIDJGknytm9BO/ccgAsx9aY1+HoXawm/s
         LceZ72JY/VcVMAdBOnuQiphxnV6qaT2BpCK8zUsvupjZtFlegbt2TnWL6EAkPsYxTGUR
         Bum70GdyHMt43B91aNuoPYR+uQEX9qKitgN9HdfDgDvKE0eK3SZDGgiNY/LajrKlT539
         mO187P67NW8NNXg9SPZ0sBgJdkEc7H3uh5U8ceW+wpfTBvDvqyyP4k+m1Rjq49udAf4g
         +CSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982452; x=1772587252;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOLZOHpBY9NF13p+U0yWvHRv6RzqdAH2//7LWxAyLYY=;
        b=qvz6yeufitTuTG+BNl+tggtu9Rh62i0OohdVbU+JfepZNNaPskfXcrT66R3ZdyiuO3
         NayOz3s6+MSBP8K3h/W9o5EcH/UjpU0CNk/yrJ5hKbW+WJJwoPUxOJsbJvmnUAdpN2zZ
         s4ULmFeUp+SORIMX9OfGEhZ90FHejUGoEzPfc0jT/2li1xzJz2Obf9yXGdnITDlVzIKV
         D3DYLbWQcnN4uAl3Q4S+RGpqCymu0WvJdfU/dLyPMosbk/l/D8LuOmJEZGrsOtYJZ/8R
         gKM8Fx3YDcrlUQu8D3JnDIURjmUZbDEB8j5ehIFjLOpJK1vajPrmLhUFdIRA5oJI2ZiB
         GXow==
X-Forwarded-Encrypted: i=1; AJvYcCWuD65RiqPsvqSbDAAYTptKb/GCVhjPFGl6+PBAVCvtjCXFnqhUx1W98XmTj0upLHdORmjQp20MhtRO@lists.linux.dev
X-Gm-Message-State: AOJu0YwnIVlLAfpdjpXtqs9cqUN7tWBRYI/aXP0ZyfJafoTKXom3R6au
	y1w3nlDFwBtUvThHSPKCh1bntAgtzbJPwLZOa+xP0lY7g3Sb/vMgTGsK5z5Sof/DiP8R4YoErsq
	kINmf1w==
X-Received: from plct10.prod.google.com ([2002:a17:902:d28a:b0:2a9:8200:498b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c7:b0:2a9:47d0:12cf
 with SMTP id d9443c01a7336-2ad743fbdf1mr128338145ad.4.1771982451342; Tue, 24
 Feb 2026 17:20:51 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:35 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-1-seanjc@google.com>
Subject: [PATCH 00/14] KVM: x86: Emulator MMIO fix and cleanups
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Fix a UAF stack bug where KVM references a stack pointer around an exit to
userspace, and then clean up the related code to try to make it easier to
maintain (not necessarily "easy", but "easier").

The SEV-ES and TDX changes are compile-tested only.

Sean Christopherson (14):
  KVM: x86: Use scratch field in MMIO fragment to hold small write
    values
  KVM: x86: Open code handling of completed MMIO reads in
    emulator_read_write()
  KVM: x86: Trace unsatisfied MMIO reads on a per-page basis
  KVM: x86: Use local MMIO fragment variable to clean up
    emulator_read_write()
  KVM: x86: Open code read vs. write userspace MMIO exits in
    emulator_read_write()
  KVM: x86: Move MMIO write tracing into vcpu_mmio_write()
  KVM: x86: Harden SEV-ES MMIO against on-stack use-after-free
  KVM: x86: Dedup kvm_sev_es_mmio_{read,write}()
  KVM: x86: Consolidate SEV-ES MMIO emulation into a single public API
  KVM: x86: Bury emulator read/write ops in
    emulator_{read,write}_emulated()
  KVM: x86: Fold emulator_write_phys() into write_emulate()
  KVM: x86: Rename .read_write_emulate() to .read_write_guest()
  KVM: x86: Don't panic the kernel if completing userspace I/O / MMIO
    goes sideways
  KVM: x86: Add helpers to prepare kvm_run for userspace MMIO exit

 arch/x86/include/asm/kvm_host.h |   3 -
 arch/x86/kvm/emulate.c          |  13 ++
 arch/x86/kvm/svm/sev.c          |  20 +--
 arch/x86/kvm/vmx/tdx.c          |  14 +-
 arch/x86/kvm/x86.c              | 287 ++++++++++++++------------------
 arch/x86/kvm/x86.h              |  30 +++-
 include/linux/kvm_host.h        |   3 +-
 7 files changed, 178 insertions(+), 192 deletions(-)


base-commit: 183bb0ce8c77b0fd1fb25874112bc8751a461e49
-- 
2.53.0.414.gf7e9f6c205-goog

