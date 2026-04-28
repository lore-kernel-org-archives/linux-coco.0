Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D273B2FDF
	for <linux-coco@lists.linux.dev>; Tue, 28 Apr 2026 23:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419217; cv=none; b=mGRrbV5sF3OjbaMK/Fj70LPQ6TAw9xk29JioECB27MeeC1LLeJTFdCSzVGHeVGsrS+2/Xur9TUh90NMhIQmqSfrtGK9XJqfzrR07okScYozstuDNtKyiWigeaPMtgPN+vGgnItQrNyIfxADSXc991JklO2w+XROhb5tUql4r/BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419217; c=relaxed/simple;
	bh=bSl0Ml6IHrW3qDTTj/PbwouszbUAxe7p9oC9LS2cUxY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kSKICTF4yXDNHWADiTKb7gBwARgiaSE+Lju7NvFujUbG8JE+DOk9gEFeu0OrDkNitiO87xxU+yIfJTpG5m8KKB0RpP6Y2ZnVko4UX8XhI6iva9Tn3S3UbRbF7x0QnaBpsWYjjejjngKc9QEXkH+90w8ozo4k514+rhRvuiubcgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rs9+Ydoo; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rs9+Ydoo"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82f8bbb4045so6990612b3a.2
        for <linux-coco@lists.linux.dev>; Tue, 28 Apr 2026 16:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777419213; x=1778024013; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MEO36girPr+drwE77RQ8xryHhyT8L0VbpSDbMsS1X7s=;
        b=Rs9+Ydool5bxlaB0s0AWouWhDN2J7JrtFPhWiroz113s4i9up3vQOsR8helEd01gS5
         A+f7c/XqMw8BkJYhTP7d7AdAGnYWE9QVEm7kjqYVQvtiNdbEtV3p1ZE5FRr4SSc/XjCl
         4zWQOLxbIT9aOtVbupkfG7RL8oWZIBVOzWJ/4DxxEEfMs4y/PyWlXi1lGGEYJI97vkXn
         VHGdND7e20vZ069j7u6sHKSL0hYlRg/xQ12GIKqLG1NB6vcwLqvigJcN7TfxGqJTpSIj
         WrT1wTcqKAhS9pmIhzW0rjLpC8JfkDFlOYc1hrv2ZcKsyp1akfUx/v3nj1p4JbXBndEZ
         tVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419213; x=1778024013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MEO36girPr+drwE77RQ8xryHhyT8L0VbpSDbMsS1X7s=;
        b=bfCT7Mep7S/2foX2XkGxRdZUdgWG+MAdvn5YaiFPfE14Z6DVNj9H42fIswr8O8xJeY
         m7HZIiyH3HkSgiWQdVzyLXt63X89CKyEOD8NsnjRFOsNgA9gv/7MZeUo7He/6IJjANih
         jyWNfn9JSlxnau5N/KR1W0pOWTpmhmbdfoohOXB8hrS/UgqefqOSjSyt7VSVfsaovb88
         RSKlgAAU3zr2CqUbUiU5Lvwddkeh9HYscxckkokStxP8RcN5lnfVXGQr/R2M0NcAm4fe
         RrOKKvCkrtOnsfbez6F8Ho5IVqg0COiDeiq9bfirrehM9zn4dlJY2M7v4pn3nwFSkHJV
         gE5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+kcNwtJZeXVC6kbsNfrnlaPUcEYoYJRGBpO7/Lqriy5UUA5ABLhdMmHpDrLdEqj8ygxB3c8ghZxjT8@lists.linux.dev
X-Gm-Message-State: AOJu0YzlyOvEb7bB5HvMHVV0KBY9PCtx2AKLUSjhlOy7bDXRquxPP40o
	DsfHOF14BvFNFL8Nccm1Udhj/cWC+jc5IamtforFlk9uOMn9oMBnJK26TBP3T0fEWUbjFzOWj+L
	4PGd29SJwJgcpnikJxMkuyf3mKQ==
X-Received: from pfoo12.prod.google.com ([2002:a05:6a00:1a0c:b0:82f:bc93:4ae2])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1993:b0:82f:120:fd6f with SMTP id d2e1a72fcca58-834dd919817mr4905304b3a.0.1777419212551;
 Tue, 28 Apr 2026 16:33:32 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:33:23 -0700
In-Reply-To: <cover.1777418884.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com> <cover.1777418884.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <8c0dc96e0776bdcffc4d2e1a9d7336f106289a48.1777418884.git.ackerleytng@google.com>
Subject: [POC PATCH 3/6] KVM: selftests: Make guest_code_xsave more friendly
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
2.54.0.545.g6539524ca2-goog

