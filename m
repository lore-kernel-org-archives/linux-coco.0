Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706DF200110
	for <linux-coco@lists.linux.dev>; Thu,  7 May 2026 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186078; cv=none; b=LF99k10HpgYNDthpxYtP0AN5PMBqg0Dar0soCGilZj9cwor7hGKpxxWRE1CNvf/1kD66H2DmKMo8sNTSEVPkWlBjZT3mEPLeWcUrXmbZTsrgPLThtTaX7XVS2RCL598/mz+LSgmn+nUzA7kwH9tANENe1mKwff3UFV9y1Umvgyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186078; c=relaxed/simple;
	bh=XICUZV4Q3vo1bwz1aYHmgOLx20RYd7LOuzutPezZwNU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oDKr970rSHXYoAaxxZO0DvXdU9mY5OuwZ4yxTisRkKkhOAy+gQeJNCcxPV/mDh3X//PLgoaFdxZk0ZFRPWAo63mO81us9QirjsoKe8ejQo7leQiw5Zzi/fMp2Irq/XOtF6Sd7wn/SEZDDcrA6N9sEe5M4a8VQLxIqSupLh1d3rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ejdk87p2; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ejdk87p2"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so764669a12.0
        for <linux-coco@lists.linux.dev>; Thu, 07 May 2026 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778186076; x=1778790876; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3rSsfG+RQhLqlg/UzpmHhS2dOMMTtnfzAhKgDM/p2is=;
        b=Ejdk87p2msQ9b7mtQhPbIkrbMRc/MIgEAPijrGt4SL0J3nfrEPTXhi8UcGBq7aCFtM
         UFGZ9kh91dQVa9MbJCcbxh2b5xkGYFxYGuzFYYB+LDsLXOX5Rf1dRKEekCB8jZ7lOqqb
         a+rYSlQQRDf5z/2AvlWmljNj+9s2DPa63COeN+1zRbZG/w4Yxn4Vmw/lHQjPw0mtgRn0
         px1M6jaDeDqtjpyof9x3T5sVoZNFGMgtWonaG+LgPcwuHCri9/P/Nwoc5V8V6QnZCfAk
         tjh1xZYZnjGLZxCMsePchHSMkiRavK3MIvxr/TRIJBzTxsgdGfKUtbHpvHDReXMpLNlE
         9W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778186076; x=1778790876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3rSsfG+RQhLqlg/UzpmHhS2dOMMTtnfzAhKgDM/p2is=;
        b=jVuJfbcVtP5b4iyjsIrGYq4iyQvoHLffgCLthMwThEHT8iP0rae0f/ZBIkNLPQ6VtL
         aeeIbkO/m9v8oFoNYbvuneq789AGsTx95v4b4GCuV5jX/NHiKcz8RkNj4XZ5DVNx2S+H
         Bq4glyS70nhhRrjJ1+J1Yo/dFjvzLww1x7RQjEZj2uRA8Z22ByJfXGBvKXmaV+J3prWb
         OKt1gxYLxaZl8ToMbhNE/XO26qYrmKsrDyoovTu9YEs8gKaptLIYBIrK7yNP6fWEIJ6R
         8lRcJYVRtmZE3OIJq+IBTLKzz/CAAzQna1lDrWu0wVo0rWiERYL89YzJfaZDdk3Mh2bM
         F8AA==
X-Forwarded-Encrypted: i=1; AFNElJ//syWqGfAu9Ny6rz9Cw8UPzYnXlih7aAUMWnUW68doarXtjCf1JoJpdhVK1FpEcd33nMqrlmzNtGu4@lists.linux.dev
X-Gm-Message-State: AOJu0YwvUV/OFIaQL5v4RnKG1uGMnrcWZmQyVVr2rvP8EGCmtbNwcejH
	DtLoLvQ4XS7BOg1XqWQJ2qkOGfzcD9ZxnKZLikOhDSr0yU5QiYacOOGVmtqK5UT6SIjCeoufPZ8
	IC8tCCAlL7NiIECXmwuKz8/aDfg==
X-Received: from pgbdp8.prod.google.com ([2002:a05:6a02:f08:b0:c76:8ec1:5090])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a108:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3aa8be52328mr4117250637.3.1778186075304;
 Thu, 07 May 2026 13:34:35 -0700 (PDT)
Date: Thu,  7 May 2026 13:34:22 -0700
In-Reply-To: <cover.1778185936.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <cover.1778185936.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <47758a2b79c4bc570a17c9216929693953bdf5a0.1778185936.git.ackerleytng@google.com>
Subject: [POC PATCH 1/5] KVM: selftests: Initialize guest_memfd with INIT_SHARED
From: Ackerley Tng <ackerleytng@google.com>
To: devnull+ackerleytng.google.com@kernel.org
Cc: ackerleytng@google.com, aik@amd.com, akpm@linux-foundation.org, 
	andrew.jones@linux.dev, aneesh.kumar@kernel.org, axelrasmussen@google.com, 
	baohua@kernel.org, bhe@redhat.com, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, chrisl@kernel.org, 
	corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	forkloop@google.com, hpa@zytor.com, ira.weiny@intel.com, jgg@ziepe.ca, 
	jmattson@google.com, jthoughton@google.com, kas@kernel.org, 
	kasong@tencent.com, kvm@vger.kernel.org, liam@infradead.org, 
	linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, michael.roth@amd.com, 
	mingo@redhat.com, nphamcs@gmail.com, oupton@kernel.org, pankaj.gupta@amd.com, 
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
index d1befa3f4b305..a377e5f333116 100644
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
2.54.0.563.g4f69b47b94-goog

