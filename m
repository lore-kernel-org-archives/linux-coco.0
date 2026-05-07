Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50EC30DEBE
	for <linux-coco@lists.linux.dev>; Thu,  7 May 2026 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186082; cv=none; b=byJTiFwXQnN4FsAkcjKjeb8nkMbBW9QnFLivO/RE64G8KyjdNXYmuwbFSU+qCu+n0IsLmiDuQlEvNC0TvjVMP4+6wbVpZsavLajvtErTbS7x9KJlR6JiCYl9sdeHaLzlkTei1lkQPVi1GD0CBtFuoot4XVBm2GMcR0ixSvWdalA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186082; c=relaxed/simple;
	bh=GOjFoV94awk7GYninYEq+I3DCtzIDlhYvlgo8SkP+9g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xk2WjWIevOMcD6we4yCOpN3CMqleAOMcy3CjEuFTQYsg9pRNbt7jbHO/w8B086PLPWjKvi/cMDssBC2Mdk5FfoH2G3oS8t2ctqGqcUZN+DI2JvwdyYZmmZl9da92zEnRTJiGl2UXq5EB3S44Eo+PtWqc7RKZpG3X7A+Db7h6eI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uOvi+bRT; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uOvi+bRT"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c798ace3e03so619280a12.0
        for <linux-coco@lists.linux.dev>; Thu, 07 May 2026 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778186078; x=1778790878; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FwdqijLGyLJ4WnaXvFgo9eGiQSeu4QsrqPYNc8/yMrg=;
        b=uOvi+bRToh60bqi54Sg7ao4T7LVj3yZT5XR7rnbEb6U42FELpJJZWtLfX9vi3YVPAx
         FSm85am+6AlpFQL6aDOeuZuwQQoL3MpkQp9GuylznellE/F/Afd+uD8+sIN+X+aPyZFp
         eUGwzbNQLlekfcgFTfKaKGgI8LEHfa6y0gzT2c3dWkn/gAGdFsy93N2lwiN2SEn4la4e
         rSDlyjX2hLTMv5xBc2Qqj4IT6QPZayMsXIVu5KtwO3SsrqiiWcg5vU9ou8qkiURO3HBI
         yOQePnKa43HS2OhcrJFwBXaiM2pjVa0vAcSqg7teOspckysJd/HQpJJpo5kuUxNvrors
         fGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778186078; x=1778790878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwdqijLGyLJ4WnaXvFgo9eGiQSeu4QsrqPYNc8/yMrg=;
        b=tYsOfELrU+w6bEkfJnW6pWf3ncaofWa6HQiS2uDdnyjjUwRfZwdlRmA2r+JHeXlFAO
         kD8xBKWfZ6lFIN3X/Gvg0f0hlvOwIClVwOjIHqGG1ZsxSzzZ5p7LdVBp4iLgbMOc3M5u
         2MeAs3lNPepGFmZcZ5d8DM4CyVS9ZzhhgR53g7Tt1iTE7rp/WD7oCmod84Z6D+qDRP3x
         N48w4DY8lTpvA2PYARgd+z0wbtH+WvambQgy1U5bnT8zHY+3AARbYe1RfLQRxVsLRXAs
         I5yAz/5CuSLflfqk2ZU/U+/PDADer0bsROsh+LZQyLeSSePYv2CeyWGkALn15mp4OHqF
         f39Q==
X-Forwarded-Encrypted: i=1; AFNElJ9aehBWAOy5hwUHQmfDs2D1CXKkWmNJlPSREe+0kgcmR35SxRDYXEL7LVz27HnRqI7IVQPjFkp3C4H4@lists.linux.dev
X-Gm-Message-State: AOJu0YxeYID9YdJ0nPS14KkSOSaEEV6uZmgICpGMLdYFfHyy9Cq17Yyz
	sPWz9jOgMjF6dn6lO9+hx63ksB6JFEyelQwBj0Tyxv6Z0tPmSqzG+Ii97EIs4J3R2K1TZWkALpM
	5vx2Q49YM1B0UcSeynKWnQEdolQ==
X-Received: from pgac15.prod.google.com ([2002:a05:6a02:294f:b0:c79:5ec2:4a68])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:431e:b0:39f:54fb:e465 with SMTP id adf61e73a8af0-3aa5acd7603mr9313570637.50.1778186077180;
 Thu, 07 May 2026 13:34:37 -0700 (PDT)
Date: Thu,  7 May 2026 13:34:24 -0700
In-Reply-To: <cover.1778185936.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <cover.1778185936.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <b9de3cc382f0cda398ee928467147979adf9b06c.1778185936.git.ackerleytng@google.com>
Subject: [POC PATCH 3/5] KVM: selftests: Make guest_code_xsave more friendly
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
	yan.y.zhao@intel.com, youngjun.park@lge.com, yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

The original implementation of guest_code_xsave makes a jmp to
guest_sev_es_code in inline assembly. When code that uses guest_sev_es_code
is removed, guest_sev_es_code will be optimized out, leading to a linking
error since guest_code_xsave still tries to jmp to guest_sev_es_code.

Rewrite guest_code_xsave() to instead make a call, in C, to
guest_sev_es_code(), so that usage of guest_sev_es_code() is made known to
the compiler.

This rewriting also gives a name to the xsave inline assembly, improving
readability.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/x86/sev_smoke_test.c        | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
index 1a49ee3915864..8b859adf4cf6f 100644
--- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
@@ -80,13 +80,23 @@ static void guest_sev_code(void)
 	GUEST_DONE();
 }
 
-/* Stash state passed via VMSA before any compiled code runs.  */
-extern void guest_code_xsave(void);
-asm("guest_code_xsave:\n"
-    "mov $" __stringify(XFEATURE_MASK_X87_AVX) ", %eax\n"
-    "xor %edx, %edx\n"
-    "xsave (%rdi)\n"
-    "jmp guest_sev_es_code");
+static void xsave_all_registers(void *addr)
+{
+	__asm__ __volatile__(
+		"mov $" __stringify(XFEATURE_MASK_X87_AVX) ", %eax\n"
+		"xor %edx, %edx\n"
+		"xsave (%0)"
+		:
+		: "r"(addr)
+		: "eax", "edx", "memory"
+	 );
+}
+
+static void guest_code_xsave(void *vmsa_gva)
+{
+	xsave_all_registers(vmsa_gva);
+	guest_sev_es_code();
+}
 
 static void compare_xsave(u8 *from_host, u8 *from_guest)
 {
-- 
2.54.0.563.g4f69b47b94-goog

