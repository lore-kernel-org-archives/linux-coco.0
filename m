Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32C63BFAF7
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735900; cv=none; b=suTvNK+i9WgG0/hhOP81lvZkDaBbtlEgTqXMHYL+1Kq87J48r2KglmixNUATsSm+MRhlLuQ8ja254X9whteaiFNUkrtK6Stt2nPWRMD1HtjGUMKCNRT7TB2s3eFfutz2sVuosej4aZuYi94tP6vUu39bEdCmnzKSJNYJx1Uxym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735900; c=relaxed/simple;
	bh=mIzudRH3R8PElJ60G9cbne5ej0VMWxfhUV90F9mivPw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aF86yXdeWJ/J53FexRCa8DwcqXs2Soltfu1Z5RR8i0SWhjWj7aTWRDoSnuiIQfcBLsVYCWAn3AjjVTgUvdkapn/bQnXlzIwhS8sQ3pvgxVOB8jYnzUD8qB4NUH8mcSUsbclS81t33klvtQot/bRxOcpPx94OfHUgLWhi30KiVlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zd+ectsJ; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zd+ectsJ"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d5d00fd19bso16661415ad.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735897; x=1788340697; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TC3Eeg8HHmJGsEMhcB9JAjXxd+Sjyj6Ja2pFhCLMeNM=;
        b=Zd+ectsJJRkC1wyxlgB8/EKLzw8KHvqacd1km/iHhD04S6KcVIDeAORjQbJuGRsGLJ
         wPHEejvvrM81OB+wNvRGiuTWxQdUOcqvo68TyDBGAkbl3+W/lCZjLI3LpLgmKZHroAfW
         bbRSqp7Q1KXs3ngXrJbUJKvdg4+pV5AZHb/xmwrrK7o4al91jlE4YoH23EhMFivhwWj7
         IuA/p55OlrmMbu0l1ddNAjLzaowUxKjiFl4932fzB6HZZbPh8TLqhZ07VbnvZtggU0Pg
         IUjtuWoemRtI6hGbKn1Y+dYEDIDnezpOhBO7WVy22VG+asLnfS9nqYAmVPpfl19+8h91
         S3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735897; x=1788340697;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TC3Eeg8HHmJGsEMhcB9JAjXxd+Sjyj6Ja2pFhCLMeNM=;
        b=B9ZRuKr3UzzJ2OH1fbqo7+h0BI6qNRxhPMskgqqRWMC82PDj3FhmFV1YR4LVv+4H8w
         dhXoHofJODK5LjAAfMBcLGPkq5oHsGhHvnJ1NNJie8sictyQSjTF6zZ/OtQ7GnYjUl3c
         VFyk3iof2GfvxAOZhQWQ1IvkQnx4c3LDsIp3wKA6S171IbvUWsMxHh1S8TcyvI2FQUEs
         GMBrxYewWrK/2rVmKFpXLq30p7YsRInm9+zfoUNJBf1P9691g8ZPpEBh9JVa7lPlphLk
         uCaADIWkzhAZll2+FXv/4RKs+LKu5jP9NxHBnp/qKTmYE87pNCjU20L4nMF9FgLWB0ut
         x6XQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIFXuouYDuRWcCBmx8feVwJzqXnRKFKkoEnUSXOQ0uMBiVKo1Zcfw3XKWpooawgD/kxUzmz8UHNK3X@lists.linux.dev
X-Gm-Message-State: AFuF++l0LRRlJTTObQbXJhIzMMX/NInhRKsCIDiBqrsOldfUQgKtm6Jv
	DsLsvjV7bKfecIdWNMa9JtuGubBGBX1QGCccvT1tyGvW4YYjBLC4NCq+zRORnhCynkpvFGVSb0H
	6ry4rvgnCGDnTk073p2ZaFaEnOw==
X-Received: from plgd8.prod.google.com ([2002:a17:902:cec8:b0:2cc:c554:a93e])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f549:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d707a501e5mr66214505ad.6.1787735895566;
 Wed, 26 Aug 2026 02:18:15 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:03 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=2388;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=ogSExkBJJQ0shJgqMiTFGyZ7TdxK9ZVCrr3NofP4mmE=; b=1VX8N8uXNhbB64TEP35V6sDoTKXKwmyT3n8b5as3eYzSda3HxQRMrx3iH9t7mWRMGk60IOhnx
 3126PLKu+/IAhStJ/lCMVD5ke3zv0gqVMqqbPje0NlXfe+BE1kamZ5b
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-5-0a15d8a799aa@google.com>
Subject: [PATCH v11 05/46] KVM: Enumerate support for PRIVATE memory iff
 kvm_arch_has_private_mem is defined
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Fuad Tabba <fuad.tabba@linux.dev>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE based
on kvm_arch_has_private_mem being #defined in anticipation of tracking
PRIVATE vs. SHARED state per-guest_memfd, not per-VM (to allow in-place
conversion).

guest_memfd support for memory attributes is expected to be unconditional
to avoid yet more macros (all architectures that support guest_memfd are
expected to use per-gmem attributes at some point), at which point
enumerating support KVM_MEMORY_ATTRIBUTE_PRIVATE based solely on memory
attributes being supported by KVM at-large would result in a system-scope
check (NULL @kvm) over-reporting support on arm64.

Give architectures full control over overriding the default definition of
kvm_arch_has_private_mem() by removing the coupling with
CONFIG_KVM_VM_MEMORY_ATTRIBUTES.

In a later patch, kvm_arch_has_private_mem() will be defined based on
whether architectural features are compiled in, and made orthogonal to
CONFIG_KVM_VM_MEMORY_ATTRIBUTES.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 include/linux/kvm_host.h | 2 +-
 virt/kvm/kvm_main.c      | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index cffa16647f2ab..b45fb80b0aca0 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 }
 #endif
 
-#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
+#ifndef kvm_arch_has_private_mem
 static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 {
 	return false;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7d5325e3cb44b..050757544a1cb 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2422,8 +2422,10 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
 #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
 static u64 kvm_supported_mem_attributes(struct kvm *kvm)
 {
+#ifdef kvm_arch_has_private_mem
 	if (!kvm || kvm_arch_has_private_mem(kvm))
 		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
+#endif
 
 	return 0;
 }

-- 
2.55.0.887.g758fc8c411-goog

