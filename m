Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1644F4DEC2E
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 17:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012689; cv=none; b=bgB2LW5qnQSnlklULS0uAebhto0ERHcQa07pg7GLbGKf9sSBTduuVq5Q6iNGv4Cj8WJugsVUNlaqglQP4FJC2jjRjY0R21eY/yeUeJES8hIfU+1QxL3b7VCBULVl4MbXi0R2lTdhmLcqhcnzCqA2DjD25/YLEefLzk+h/qRTPRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012689; c=relaxed/simple;
	bh=q6sKknVxjsNpsOX3dGkf1KErMXo5zCoLn9mk28KTqNg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LokyAGQFa9flQkyhZw+/7lPzbM6ud9R+yTwnEj6lMRhxliPNZRzl8gh1jq9UXFB/l7XNwHrVbF6Mnwf6SgOzguepy8EdHlROAjMk20OsEQs3dcz3cOuTErE9V60NgGAn407z/KsfdJJf9EMpqgvTyCnnQhZo7z5TAYBaQoolUXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PQl6FtqD; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PQl6FtqD"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8538a72b430so3494955b3a.2
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 10:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012687; x=1790617487; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpZEGIou0oqWtJedTRzj6hNhUCCuK0pge9AESQcyXk4=;
        b=PQl6FtqDWuE9vUXKmSxxDIdiQnOsAjju4CH5gPzuZyR4hOP6ahWMMw7Kc+cnJszpGF
         JlyVQNkq5A6Jbk9RJZ7ZzxRuxWkWcQawSUg+RK73PGFcnMbFrtSFYqcO5axyeHU4cK4G
         k/sSlVnFJkCPa68a1zbUHD8MwuCw0va9QKwPuKIBRO1etxCh1XcirskcnAO3MvBAr734
         lc/K09htvTlVvzafmsI6dBQD2wRaJKsS0HO5L6zbAjRAsDU5rNogwYqVAv8wHM7BjG8Q
         RobkKAVcN5IQGpqaVuClYAMpKj9B/8SodDeSTqFNu2SUWq/osl1iJV8IGql0pXuwHvll
         2HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012687; x=1790617487;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vpZEGIou0oqWtJedTRzj6hNhUCCuK0pge9AESQcyXk4=;
        b=EWG4uB/93DOAXFIQ7dqlu69QlXaHEPpudRt9vIABHce/pbCjkOEVpAQk+OkO7oQ0Bg
         cKaBb0BewB9hM/bEwM5fZOjcFN3CQRGVfwuV8mweesaxn3njgvEO/N2JdS+mX6x9DF1P
         rTNDrXzJgGqdr63TAVTLBfDdkjE7+DuP84m678V/s1sc/NPKIXV5e9RgpH4JqAWbeA0z
         iQ4G9h6APfh33a44txSSyFdoH/P3Xon57o0Y8dI3F4fVxTyBSEazib6uGzO0a+5znphM
         arvPtDlCRqNbVXOtvzfN6dvG3sjf1j7ZMwZ9tGUgRMMbqo69pFp8EPkE/MFuU4bd4cQV
         k1fQ==
X-Forwarded-Encrypted: i=1; AKwUvByg4ykvMnf3+0BCyVJroqmbFhYErMHzb6/GLeqGbKIrnG9rc9QLyKfEBPM8L/u1d4yRiV9na+2vC2E+@lists.linux.dev
X-Gm-Message-State: AFuF++klv3vrfYDtAojaO5w5LsTssQMKu1oY0SLgqwSOLcydZdC3ZQvE
	vHNevmStTrTI2yFISrn6VIDdlHOLE57QTi7Ftgc5ytRhmae7C0mzWmXv7iuxiHwBpDAf/rX2HKz
	d63pNcg==
X-Received: from pfbgs18.prod.google.com ([2002:a05:6a00:4d92:b0:87a:49f8:6a76])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9487:b0:878:3507:8d6b
 with SMTP id d2e1a72fcca58-8783508a7bemr7870003b3a.50.1790012686945; Mon, 21
 Sep 2026 10:44:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 10:44:38 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-1-seanjc@google.com>
Subject: [PATCH v2 0/7] KVM: Serialize vCPU creation and revert vcpu_ids tracking
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, 
	"=?UTF-8?q?Pawe=C5=82=20S?=" <spawel523@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Serialize vCPU creation by holding kvm->lock for the entirety of
kvm_vm_ioctl_create_vcpu(), and then revert the now-redundant tracking adding
by commit 97d65b544f48 ("KVM: Check for duplicate vcpu_id as early as
possible").  I botched the math when justifying the vcpu_ids tracking; it's not
an extra 256 bytes, it's an extra 2048 bytes.  Roughly doubling the size of
"struct kvm" tripped x86's KVM_SANITY_CHECK_VM_STRUCT_SIZE, and obviously isn't
something we want to do in general.

The TL;DR of why it's a-ok to serialize vCPU creation is that no VMM actually
does parallel vCPU creation.  As with so many things, KVM's current behavior is
the result of decades-old cruft, not intentional, deliberate design.

Patches 1-3 are a tangentially related cleanups and bug fixes; I included them
here because holding kvm->lock for all of vCPU creation allows WARNing if KVM
attempts to lock all vCPUs if vCPU creation is in-progress (the caller must
hold kvm->lock).

v2:
 - Tweak patch 1's changelog to clarify that that only x86's manual checks are
   dropped. [Sashiko]
 - Add patches to convert additional arm64 and RISC-V usage to 
   kvm_is_vcpu_creation_in_progress(). [Sashiko]
 - Remove acquisition of kvm->lock from s390 and PPC vCPU creation flows.
   [Christian, Sashiko]
 - Add Jean-Christophe's Tested-by to the revert.

v1: https://lore.kernel.org/all/20260914181223.289061-1-seanjc@google.com

Sean Christopherson (7):
  KVM: Reject attempts to lock all vCPUs if vCPU creation is in-progress
  KVM: arm64: vgic: Rely on vCPU creation check in "trylock all vCPUs"
  KVM: RISC-V: Use kvm_is_vcpu_creation_in_progress() instead of
    open-coded equivalent
  KVM: Protect all of kvm_vm_ioctl_create_vcpu() with kvm->lock
  KVM: Move check for existing vCPU ID to the top of vCPU creation
  Revert "KVM: Check for duplicate vcpu_id as early as possible"
  KVM: WARN if vCPU creation is in-progress when locking all vCPUs

 arch/arm64/kvm/vgic/vgic-init.c | 12 ++++-------
 arch/powerpc/kvm/book3s_hv.c    |  2 --
 arch/riscv/kvm/aia_device.c     |  2 +-
 arch/s390/kvm/s390/s390.c       |  5 +----
 arch/x86/kvm/svm/sev.c          | 10 ----------
 arch/x86/kvm/vmx/tdx.c          |  5 -----
 include/linux/kvm_host.h        |  1 -
 virt/kvm/kvm_main.c             | 35 +++++++++++----------------------
 8 files changed, 17 insertions(+), 55 deletions(-)


base-commit: d599822bdb66aeec5ec76297b0fc6efaaeefe07c
-- 
2.55.0.1082.g2b9226bbc0-goog

