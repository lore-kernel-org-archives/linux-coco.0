Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB00130BF7D
	for <linux-coco@lists.linux.dev>; Tue, 18 Nov 2025 22:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763504614; cv=none; b=L47I/HzTyYJtblziyxk/krTsQy0eQJuMG3XshChkrIDc9/azXySs26Dg7ul8HNBcTjQA2nx8ojdsMavI4DnNhuwSASVKnVfYAzZnDbVi5TFk6gXv2VLRi8jip1+MGFv1EW/TsvEG8SBZiw69z7XlzVTdtyN+0Pd7SGLNUwla8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763504614; c=relaxed/simple;
	bh=1iQs026hZoi5t1uCrSj4KT0sve/8LeLDIXGloj9+TvI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=s+pX39/bgcbSTcM7BK1atMzcJyOds5Gydex0PEjByRWH83jnUR+lcZYWWd7UarLSJpgDKJEMuHyZsX9xTNO+ZCvUBL/kCFjtjb6vvxKSpSf9hiZNzBVYHo2foWSXdzTQ7c8lhPMLNHF4uCdMpJR8f79aDEcU3sazs2IEEzxz95Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CCiItxt4; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CCiItxt4"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7c240728e2aso1228264b3a.3
        for <linux-coco@lists.linux.dev>; Tue, 18 Nov 2025 14:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763504611; x=1764109411; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgYuW8UOyWLUyyathvu0pA9lXS215ZKHalLPZAaX/EM=;
        b=CCiItxt4K77GIhVQiUQXg55BbJQfCmybdWjuyUjSZHOaJgaG/LqPhx+CSeowxqRtQ1
         /IRmZ73gDa+XzqNO18szwyzCRyaJq71nA+hlWYiGcSbeKLafoPBESBRHYiOjKvJcigLh
         tfsq1mrXTNjaurXtC70MRtwNyuYHbrvhMrp0Ce8u5ZdafHxjPamgo5cxgobj96pdnzNd
         LWACZUS/iNsIkAzW2U3xopczBPU+8LOv7V+APD/Z48qB3n4O8Hb1ZiBR+3n6YbgcJgHy
         ZWR+yMFIs2K5ux+RrrskwKgtgk70oqx+klMh+/l1CrPRtdqhDNtEXoApxiBNAjfRl4Ax
         whxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763504611; x=1764109411;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgYuW8UOyWLUyyathvu0pA9lXS215ZKHalLPZAaX/EM=;
        b=Hq3gAB+0IBHXJ4X2Zm+mhC8IBEUrcVhTAf54566DH6KrqOryo1TOvNBJnau/AdSRPR
         L+7P2NyajaPKq313yQN3B2Mxt0vtHFM0HhOjAa78JMcq/e1ZG4gw3TCIJjINkcZ6L/JH
         lseuWtGUy2BR/tyrAbLkApMiTxnuMst1tZw/YpM+0HmeadaHcUgEJicPnV/wcn19OdpI
         jeGCTXKOqUH2DjVePbMruQ5hqYX+nsJiY9P914sLHlnIDRVRGcU4dLdhknQvkjI0GSdf
         5Crp5HolLgY1/Emrtx13YDZ4uwcBogFT3oZgWEwpqQfDZjappItFZDJqYHYDSBnWwSxd
         0wRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWewAXM3ji0FkDAnMngPXsVfng8kGNtN7wl3l77fytYZOrZbhxGz7MBgk2APiQVWs4JGyHW0y+GlsE8@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9YXuM69d+HoPPF3Mu4tY3V/JqeU/ovYzV2ITDdq3v5JBLuhG2
	E6CyiqxLiRhaIQOCg9nJ6vgCsMiVa+VOma80O8q7l6uTKoPVMP8EHGxWg2JxUNNWTDMej1RcBRE
	Q3VOpLQ==
X-Google-Smtp-Source: AGHT+IFXkFEO29YFXjyiYY3HorCCsF26L2b/h6RaXMwbRwLOl5iJ+9ZCln9TDezx9nP45smTnRSHgsQ+a4k=
X-Received: from pfbik6.prod.google.com ([2002:a05:6a00:8d06:b0:7ba:f8d1:3475])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7484:b0:34e:5dd4:b1b5
 with SMTP id adf61e73a8af0-35b9fc781d9mr20603421637.2.1763504610944; Tue, 18
 Nov 2025 14:23:30 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 18 Nov 2025 14:23:24 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118222328.2265758-1-seanjc@google.com>
Subject: [PATCH v2 0/4] KVM: x86: Cleanup #MC and XCR0/XSS/PKRU handling
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Jon Kohler <jon@nutanix.com>, Tony Lindgren <tony.lindgren@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Optimize XCR0/XSS loads that are currently done on every VM-Enter and VM-Exit,
by handling them outside of KVM's fastpath inner loop.

Context switching at entry/exit is unnecessary behavior inherited from a
hack-a-fix that papered over an egregious #MC handling bug where the kernel #MC
handler would call schedule() from atomic contexts.  The resulting #GP due to
trying to swap FPU state with a guest XCR0/XSS was "fixed" by loading the host
values before handling #MCs from the guest.

Thankfully, the #MC mess has long since been cleaned up, so it's once again
safe to swap XCR0/XSS outside of the fastpath (but with IRQs still disabled!).

Note, Binbin's kvm_load_xfeatures() still applies cleanly on top, so I
deliberately didn't include it here (but am still planning on applying it).

v2:
 - Collect reviews. [Jon, Rick]
 - Fix TDX (suprisingly, not servicing host IRQs is problematic, /s). [Tony]

v1: https://lore.kernel.org/all/20251030224246.3456492-1-seanjc@google.com

Sean Christopherson (4):
  KVM: SVM: Handle #MCs in guest outside of fastpath
  KVM: VMX: Handle #MCs on VM-Enter/TD-Enter outside of the fastpath
  KVM: x86: Load guest/host XCR0 and XSS outside of the fastpath run
    loop
  KVM: x86: Load guest/host PKRU outside of the fastpath run loop

 arch/x86/kvm/svm/svm.c | 20 ++++++++---------
 arch/x86/kvm/vmx/tdx.c |  3 ---
 arch/x86/kvm/vmx/vmx.c | 20 +++++++++--------
 arch/x86/kvm/x86.c     | 51 +++++++++++++++++++++++++++++-------------
 arch/x86/kvm/x86.h     |  2 --
 5 files changed, 55 insertions(+), 41 deletions(-)


base-commit: 4531ff85d9251ff429a633bdb55209d3360f39f2
-- 
2.52.0.rc1.455.g30608eb744-goog

