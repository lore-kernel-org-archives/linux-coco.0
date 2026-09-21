Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C7B4E7801
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 17:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012698; cv=none; b=KIJ1STUqgoVdoAMFByIcejMhKT+W9/U3rCRa2cuX0twZKsIsz/GnApINmaLL8JUmhgBh3U+cvo65Qnn+atdnLjaTCluhQmIdoHgct1GvDto+w23DwphAT7Cd1LdQ4rtha3VI2KqN10yyEe7XwDvdQhl1KCmivYXOuDZjwbjYX8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012698; c=relaxed/simple;
	bh=d+HwDcZ+iWoQ8qx4aIkqNrZBIcx5nx1EjGGCYbcSOIk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qOoJR5UOK8j9dpku4J3s+j6WT7/VUlqoeymIB4U341FVPc+XlsX9WUElMwEsYMR1MkX+j8rw7ybTp97o3fJLsC/ZgfKsKw92FV9hFNDqF42kIxS2bkFH5rWrbY4qZEH4IsLf8ABRn1OKlBUWXe4unXA8GPtLMdEXQUuk6O/rMlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TEJBeU9p; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TEJBeU9p"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so44540495ad.0
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 10:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012695; x=1790617495; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:reply-to:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1dhUTiarEg5c5I3QHkxBctKjtcsAKr4VX6TAcrbU/Q=;
        b=TEJBeU9pNTAM7iTPmyYS5A5OVGj8bAZVYpJshdjUIxs9bf3aR8fegUxxq3e2sHzGct
         ntp06cYsXSy5Yc5F6aa24bxrfkIrW9l2oVZDTftSSEVqal7ZWKMrtW4mPqo4MERqa3BN
         p5+Ruef49REi6ISXvHQPt91rmwNpT/CLnrVHRAwmVwKTISkiL+fXbmm2lR3+EUqWTgA2
         8dsV/RoXm8yqZSt85/8t1boX9YCENN7bkf/DhoGHzaX5sD3z3lsk0XR6HAWSfelhBf+R
         92wSAzTwP1D2Yk23Xh3tg5Q8t1mtqe4iBVledZknF1RBnhQsXsySEjNKSqhhnT39Zfiz
         KpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012695; x=1790617495;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1dhUTiarEg5c5I3QHkxBctKjtcsAKr4VX6TAcrbU/Q=;
        b=HfHDJKYB8WAT8Fx1n5tnalMx4vd8JsYMvOzBhz6WgvCmw+NG5MGAEo7Iq4JMQVpB0E
         6KKJx0HJrPGF5y3WWeadCxMHuZ0N+6qLCYUVNhdHlqXTfFBzJvtB2gCxvHhk7wbKKbxn
         Jzg5VWBZNLNfFfIdnhq418CyhEZtfw9Ej24Lvjn6XSpkGeJufX4fVBVQAIilnYxjlISW
         1oahbBH9yBvLPBK/X5X8Dli/zBWX46hy5BaM8g8SEiQn50cgG1/d3T/YD4L611Od4rDO
         wOLQv+flDNFbxF3f7VzFdURCyAtEQsgiJ1TG6sQgXRsHxqLBZHy1t3T4Etu8TnwfpfHH
         3oqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0T+h2wHiysj6MvHOBhOg5tDIBZX8Pqbh2yuOa8GNkgfCdIo3nZhU+wqRcglDrgYjIdNzDwkRQHgtX@lists.linux.dev
X-Gm-Message-State: AFuF++k3DkQRcPAvsrMp2SdOW8u/GzvRNAHsMi+GySd9PLlBsgawY8Yc
	nJKP2Ieh4+5/nP3ah226qjfx7L34+VUJVJ7OcoOEMuAKCTS4pPfbi6LVrhUEKmWL3jpZDPxMdNo
	FpKZV1g==
X-Received: from plao21.prod.google.com ([2002:a17:903:3015:b0:2dc:5417:2772])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d984:b0:2df:3b09:664
 with SMTP id d9443c01a7336-2df3b0909cbmr71040325ad.32.1790012694298; Mon, 21
 Sep 2026 10:44:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 10:44:44 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-7-seanjc@google.com>
Subject: [PATCH v2 6/7] Revert "KVM: Check for duplicate vcpu_id as early as possible"
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
Content-Transfer-Encoding: quoted-printable

Now that KVM uses kvm_get_vcpu_by_id() to check for an existing vCPU ID
before doing any meaningful work, which was made possible by holding
kvm->lock for the entirety of vCPU creation, revert the now-redundant
"early" vCPU ID tracking.  The claims about the impact of kvm->vcpu_ids on
the memory footprint were a wee bit wrong: the worst case scenario isn't
256 bytes per VM, it's 256 "unsigned longs" per VM, i.e. 2048 bytes per VM.

Increasing the size of "struct kvm" by 2048 nearly doubled the total size
on many architectures, and tripped x86's KVM_SANITY_CHECK_VM_STRUCT_SIZE,
which was added to detect this *exact* scenario, where a single change
significantly increased the size of "struct kvm".  I.e. attempting to build
KVM with CONFIG_DEBUG_KERNEL=3Dn fails on x86 (the build failures got misse=
d
because all build bots apparently test only CONFIG_DEBUG_KERNEL=3Dy kernels=
,
and maintainers' test flows were similarly lacking).

This reverts commit 97d65b544f48b2ee49f6aea32145e3e7969955dc.

Fixes: 97d65b544f48 ("KVM: Check for duplicate vcpu_id as early as possible=
")
Reported-by: Jean-Christophe Guillain <jean-christophe@guillain.net>
Closes: https://lore.kernel.org/all/56a4bc35ee605588b7cc36c8e45c12b5f3b506c=
b.camel@guillain.net
Reported-by: Pawe=C5=82 S <spawel523@gmail.com>
Closes: https://lore.kernel.org/all/CABD%3DWFOS4j4hDv%2BpW-eEM9HAM2q2GY_iYd=
AG%2BqvYcUEinUrcQQ@mail.gmail.com
Tested-by: Jean-Christophe Guillain <jean-christophe@guillain.net>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 1 -
 virt/kvm/kvm_main.c      | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 03bfc92864b6..6aab167bf482 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -791,7 +791,6 @@ struct kvm {
 	/* The current active memslot set for each address space */
 	struct kvm_memslots __rcu *memslots[KVM_MAX_NR_ADDRESS_SPACES];
 	struct xarray vcpu_array;
-	DECLARE_BITMAP(vcpu_ids, KVM_MAX_VCPU_IDS);
 	/*
 	 * Protected by slots_lock, but can be read outside if an
 	 * incorrect answer is acceptable.
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d5524ac8c5cf..985af39b980a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4185,15 +4185,11 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm=
, unsigned long id)
 	if (kvm_get_vcpu_by_id(kvm, id))
 		return -EEXIST;
=20
-	if (WARN_ON_ONCE(test_bit(id, kvm->vcpu_ids)))
-		return -EEXIST;
-
 	r =3D kvm_arch_vcpu_precreate(kvm, id);
 	if (r)
 		return r;
=20
 	kvm->created_vcpus++;
-	__set_bit(id, kvm->vcpu_ids);
=20
 	vcpu =3D kmem_cache_zalloc(kvm_vcpu_cache, GFP_KERNEL_ACCOUNT);
 	if (!vcpu) {
@@ -4276,7 +4272,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, =
unsigned long id)
 	kmem_cache_free(kvm_vcpu_cache, vcpu);
 vcpu_decrement:
 	kvm->created_vcpus--;
-	__clear_bit(id, kvm->vcpu_ids);
 	return r;
 }
=20
--=20
2.55.0.1082.g2b9226bbc0-goog

