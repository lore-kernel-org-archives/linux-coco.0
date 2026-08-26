Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E643C0A07
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735943; cv=none; b=D5v5APKMnOBK6JI0dl1FyKygXVd4ghgiacbbSTKl7yyTh4gsi/5i+wjOiGiEcNWb/V7yzuq7szEV6ga3H4EZ+xwxWFev+fr7sAsJOLwxDTRnnc1OnwdFaUwzUKVvOhbi0o/8nQ6ywJVfXrkFj5i6L/XUqIVxHqWb9uLmN5SZBwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735943; c=relaxed/simple;
	bh=l73U6b9QMJm++wnVRVWmusR6Da3x6x6ObMPGHhXOFXY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rZQ9tgAorMtF4kS3Wn3pUd+kNWtTokOmqbHMdL7VEldgDD693ygdLZQxT15b5fZ9zLa81iNWT09knV+ZdPaZ2o7Mi+kUqcuB33/0N+Z1wln/8mcpPPuPper5aLLvpvQUPO/vQBt4uAzQ0RucWpJIyHcjzRIusrMBPxvFtXkctBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fyISVZiX; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fyISVZiX"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso1124351a12.2
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735936; x=1788340736; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BY70MMIKZKRKauwOTq9m7n2x1FHu0Xdv6rM2Gy5jXqw=;
        b=fyISVZiXBZgDJqexCBOPJUZd9VubBE+68hPzYLnXPbbPDnQ2Gr1QD1QvimhdukbI01
         rfnNXyG/Zolu90p8CMc3FL5RooyViG8kqITOCNWiVI7t7qnqyQYCGhspMGOCE+PcX40X
         yeC/HzZdYFjgowjkg1Xi5hXAzHqvXQbLYEoQOs325dgj3y2hnZpcP+csRHD9YUrvOccc
         lRjslQB45sz1WQkhBiAN12qKq1gNEjh5uo8H54IqQSpM+sDVnfYos9xH4WGvChSuBQvI
         2K22gVE+imBTSLFetxLl6ns2rzQwV1sUYiLk+fns6MTckUsKlE5q/ZprrwnpUhdPs/lx
         8g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735936; x=1788340736;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BY70MMIKZKRKauwOTq9m7n2x1FHu0Xdv6rM2Gy5jXqw=;
        b=NrstRlZNvSbxXSqpgvUBjwQ/66KOuVJT8GxRlqmzvLO3vasopGENxC2DRVUO0q6w2I
         vP3AfFlKUkStOhLe7LyN1EB35cnICy/6yhkNQQSw9QRAmMP5dQb6cnl9hKmrhD6EpFwH
         VfQwEZrqOuvjPo7v0F+lAZ4rDm/hrdL86ucmUcKF0FjUTv9DRCMxl8o0kFFX0qNoQmXb
         igoJoWlufDADm/+M3VorsBbQeHDJp7j0BEPXeh8MD39xkv30IxOtVghCq0rDntApB2rI
         rfzasnagQ9YQ6terIWye9hQfyVYosgTQc4d6vnwOePLBETOJ1q8R5G165l4RwYvi3bG6
         hcFw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy6r1pFssvPQome2brS8Bnw3j4jeTYDwGHt7pJTHnFuCzQBeParLtrHsAZxJ3RNpS7792YaSyzcwSF@lists.linux.dev
X-Gm-Message-State: AFuF++lqbcf9IOd+8jRpK7b1Y51+tNIA2mcpJZs150nfPgfu3SOLRMxr
	MMyach+vI8cxjsCA8SV7tChTCh+K+BWK1H6ZAPHUNBmDVq7oUwUuE41AFU0P1s45k9ag2VK3uy5
	dfJn/hjP5coNcxXItubu5/M7E0A==
X-Received: from pgnd15.prod.google.com ([2002:a63:734f:0:b0:cbe:6339:419b])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9202:b0:3c3:64cb:9b99 with SMTP id adf61e73a8af0-3cf76283ed6mr11221625637.6.1787735935314;
 Wed, 26 Aug 2026 02:18:55 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:26 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=2380;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=Q/A6Dc0B0gRna9abP7QnB2WrkUxTYkjcUX3FbTtwMJI=; b=2YkTIc1SmD00N2MMdJmLmjlME4gtBWUYhIUyh7O71YGRuPDt2J8tpdmJsRGiLloiJb86kHa1e
 IiS094M8sscCQIJsw6CDHW3d9k4k2B+zvtFayWaStH6wkSP2zGMskI9
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-28-0a15d8a799aa@google.com>
Subject: [PATCH v11 28/46] KVM: selftests: Add selftests global for guest
 memory attributes capability
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
	linux-coco@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Add a global variable, kvm_has_gmem_attributes, to make the result of
checking for KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES available to all tests.

kvm_has_gmem_attributes is true if guest_memfd tracks memory attributes, as
opposed to VM-level tracking.

This global variable is synced to the guest for testing convenience, to
avoid introducing subtle bugs when host/guest state is desynced.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/test_util.h | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c      | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index a6a3e16578959..d5825211f2727 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -116,6 +116,8 @@ struct kvm_random_state {
 extern u32 kvm_random_seed;
 extern struct kvm_random_state kvm_rng;
 
+extern bool kvm_has_gmem_attributes;
+
 struct kvm_random_state new_kvm_random_state(u32 seed);
 u32 kvm_random_u32(struct kvm_random_state *state);
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 08d0bbcd421ea..cd468b2bb8343 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -32,6 +32,8 @@ static void kvm_seed_rng(u32 seed)
 	kvm_rng = new_kvm_random_state(kvm_random_seed);
 }
 
+bool kvm_has_gmem_attributes;
+
 static size_t vcpu_mmap_sz(void);
 
 int __open_path_or_exit(const char *path, int flags, const char *enoent_help)
@@ -527,6 +529,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 		kvm_seed_rng(kvm_random_seed);
 
 	sync_global_to_guest(vm, kvm_rng);
+	sync_global_to_guest(vm, kvm_has_gmem_attributes);
 
 	kvm_arch_vm_post_create(vm, nr_runnable_vcpus);
 
@@ -2311,6 +2314,8 @@ void __attribute((constructor)) kvm_selftest_init(void)
 	srandom(time(0));
 	kvm_seed_rng(random());
 
+	kvm_has_gmem_attributes = kvm_has_cap(KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES);
+
 	kvm_selftest_arch_init();
 }
 

-- 
2.55.0.887.g758fc8c411-goog

