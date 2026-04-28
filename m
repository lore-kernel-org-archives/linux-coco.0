Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637138F230
	for <linux-coco@lists.linux.dev>; Tue, 28 Apr 2026 23:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419214; cv=none; b=HRc8dit82ho5CSJprFLUToOuKCLnwtO6tCltKHarC/h9OOKqodQ5KHgAP1cBNiJSBlyBKjppgiTV4B9YZVe/2KUwl8cuM3qHI4zHliwHf/p4ZkGRL1cjOvAXtwPnLlY4lTA+3NIZbyecBZGWGQSeTWnzo5tdVXHJ5vhCiUZD/sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419214; c=relaxed/simple;
	bh=w9utNXxCCC62f2kYxm5u5Pd5S1Lxi8j2YN3oYBMKdM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SmNVmGUvr9PnIk2qyXGEJdtBjir0E81HT1YkGYREFrCz4XqcJCXF9Ht1O2cFxw6UoBCFo08CvXBwAIf1nEomAwAlPO76AGKw883zrdFtOqL4hIEPgoGKKEO6oMalLne2AVJnxQFEhjP5BVVX9W2031Jx3C3oK1wY1MkfGqn8pxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j6yHTQCr; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j6yHTQCr"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b79f4b35b7so61073535ad.0
        for <linux-coco@lists.linux.dev>; Tue, 28 Apr 2026 16:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777419212; x=1778024012; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=clSh7OBsCI0JhKUCKzkprD+sDtva2OSfrDX8pAze+SM=;
        b=j6yHTQCrUr04OgZRqD92diFrDQz3r984IK/nRVoqhlNyStsrOBzqKJJMj02OZPGSTO
         zqtVwPwJAfY8JjYgo5kaS0jkr6N5AXRbIuGbNdzmw2cqwLvoGikxMQYF1bnK3RYmjN7n
         cb4oGUqKLPi7E0e1zQHk8Xj4jIPaHQjrtFEaZFU9lKd2Vzv0NhaFkY119nhOMtXeDA8v
         DbhdodsNyO45VaWwhYzhA0VgAtEHNU/d40NKzqamCU9YVndLtwOa5XEhiDAJT8yZrdUe
         La24K8r3f1wfkvlYy/zSABhP5luyBaKyIvUlzjUoAkJxgjguKUWuMHYGkx0+GPn7WCQu
         chaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419212; x=1778024012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clSh7OBsCI0JhKUCKzkprD+sDtva2OSfrDX8pAze+SM=;
        b=YHgLE4sWqQkLxANTeQ/2l4AswcbMcA1x/fHBBt0UOKDkUm5oVoV1ZGg3gW692YpcOg
         jM46d2UhuGtQAioCYovtASGh0EN611G7SdTKYkbLmmf1TC06PO0+z6NhTsTdbt8hUa25
         /AdSqofklUc7t7gLkZ92aDfffjhrTn1mjpUONyiNbtgWTHynuhiszmO55SaCOSzleirx
         VF0JHAofF4UXgxeHm0cR7d8sbqs43swzaRiTbCA4o2eVFBM0JtVg3VDXL+GKLIbIRwSh
         /srk671BeQu4t865qW8IXm2CWnoPyvbsESbMPxy5bdQrUeuEOG1oUBjv1Ym3MpQntCeP
         pKMA==
X-Forwarded-Encrypted: i=1; AFNElJ8yr1ivezydp2xeBnLBGARybYA3iq8dspo2pZyVJCSHmuhFp8zufIcuFITTFjfiv9i1PYrmmC7xt0D4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9hsdoqz2njgLqu+KFbikSvD9IcE47ijgkvamwwccbmpURJzXG
	mtgrRJ9CfBKMwR/KthDb3fo+q03gS2GDRv8AYPVorNLyVWZHrdeqpvBetN9/zqhPM/+eyckfY6H
	QzArcniF8TPNc/cyS39bqeol0cg==
X-Received: from plpn20.prod.google.com ([2002:a17:902:9694:b0:2b2:ec1e:c943])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3c2f:b0:2b9:6453:389a with SMTP id d9443c01a7336-2b97c3cc0b3mr49885595ad.8.1777419210821;
 Tue, 28 Apr 2026 16:33:30 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:33:21 -0700
In-Reply-To: <cover.1777418884.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com> <cover.1777418884.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <94c9e342215e6c88988d7aa62f3ba627eda34e94.1777418884.git.ackerleytng@google.com>
Subject: [POC PATCH 1/6] KVM: selftests: Initialize guest_memfd with INIT_SHARED
From: Ackerley Tng <ackerleytng@google.com>
To: devnull+ackerleytng.google.com@kernel.org
Cc: ackerleytng@google.com, aik@amd.com, akpm@linux-foundation.org, 
	andrew.jones@linux.dev, aneesh.kumar@kernel.org, axelrasmussen@google.com, 
	baohua@kernel.org, bhe@redhat.com, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, chrisl@kernel.org, 
	corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	forkloop@google.com, hpa@zytor.com, ira.weiny@intel.com, jgg@ziepe.ca, 
	jmattson@google.com, jthoughton@google.com, kas@kernel.org, 
	kasong@tencent.com, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, 
	mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	nphamcs@gmail.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, pratyush@kernel.org, qi.zheng@linux.dev, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shakeel.butt@linux.dev, 
	shikemeng@huaweicloud.com, shivankg@amd.com, shuah@kernel.org, 
	skhan@linuxfoundation.org, steven.price@arm.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vannapurve@google.com, vbabka@kernel.org, 
	weixugc@google.com, willy@infradead.org, wyihan@google.com, x86@kernel.org, 
	yan.y.zhao@intel.com, youngjun.park@lge.com, yuanchu@google.com, 
	Sagi Shahar <sagis@google.com>
Content-Type: text/plain; charset="UTF-8"

Initialize guest_memfd with INIT_SHARED for VM types that require
guest_memfd.

Memory in the first memslot is used by the selftest framework to load
code, page tables, interrupt descriptor tables, and basically everything
the selftest needs to run. The selftest framework sets all of these up
assuming that the memory in the memslot can be written to from the
host. Align with that behavior by initializing guest_memfd as shared so
that all the writes from the host are permitted.

guest_memfd memory can later be marked private if necessary by CoCo
platform-specific initialization functions.

Suggested-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 216d6e037153c..3811aef8c98cd 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -483,8 +483,10 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 {
 	u64 nr_pages = vm_nr_pages_required(shape.mode, nr_runnable_vcpus,
 						 nr_extra_pages);
+	enum vm_mem_backing_src_type src_type;
 	struct userspace_mem_region *slot0;
 	struct kvm_vm *vm;
+	u64 gmem_flags;
 	int i, flags;
 
 	kvm_set_files_rlimit(nr_runnable_vcpus);
@@ -502,7 +504,15 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	if (is_guest_memfd_required(shape))
 		flags |= KVM_MEM_GUEST_MEMFD;
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
+	gmem_flags = 0;
+	src_type = VM_MEM_SRC_ANONYMOUS;
+	if (is_guest_memfd_required(shape) && kvm_has_gmem_attributes) {
+		src_type = VM_MEM_SRC_SHMEM;
+		gmem_flags = GUEST_MEMFD_FLAG_MMAP | GUEST_MEMFD_FLAG_INIT_SHARED;
+	}
+
+	vm_mem_add(vm, src_type, 0, 0, nr_pages, flags, -1, 0, gmem_flags);
+
 	for (i = 0; i < NR_MEM_REGIONS; i++)
 		vm->memslots[i] = 0;
 
-- 
2.54.0.545.g6539524ca2-goog

