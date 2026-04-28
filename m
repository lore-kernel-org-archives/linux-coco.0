Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF433E0C61
	for <linux-coco@lists.linux.dev>; Tue, 28 Apr 2026 23:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419222; cv=none; b=I+I2bgatX3jJ040AFHc77SzmUYDYGytuaKOQ2lrunxH/Qg+2zNyHovrU65egevxW/zyzg/5K5KXANaXh9atBKcRmV2FuObvBf+C2OzJWmXr/0/nnjHxNeK0fiGXB3TYm1SX4Yq88dmsahlB38oUU2zu9QuQauayJhFQ/wEafhcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419222; c=relaxed/simple;
	bh=hGDZPIbsrD5lLb5dYXlyY3ktqiFSkkP6mLXsuKfVtQk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kkUxsJKpUbQqRPwwaLU0Aaot+SrL5tcgl/FH2jTXcPyvVKA30S+uWZXuDNIsIyIb5OBNiHM2aT4dw/mPLkAnH9ANkqMcfnnx90kRp80YN3j8bNzeDZC8vq//0MQAwDPTO+vp6IlBKjzJ6+p8HbP/YSTPoWs+9u9Jpo9ogEkOI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S9T0PukN; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S9T0PukN"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35fbb5779e8so12566256a91.3
        for <linux-coco@lists.linux.dev>; Tue, 28 Apr 2026 16:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777419219; x=1778024019; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZczNi69+WMKOJksOctcu51kanJpEjkfDW1oXPOUGF4=;
        b=S9T0PukNW2h/BuxU17TZQ5gFu7jhVsmdoSqgV4FdvLajh5rGQACHm3AwqprGH/B/xQ
         gOKYwBBhup7KbEMWs+OVJJWwxTOSbEA5KkVXJkBYbQogH/mdW4xcrnisgpngU6tiSbzD
         e2WxbJoCp92je2ElT7LsLLhMOfA0qfOlt9ugodxP2PbhHJuOVr7Tvsctff6NrZxLlkym
         zfJpYaLUPirR6YYY6Sl2+8OZ1wzOA6P2Bh12CeDfXiX6LzWdfz1DH/bB1q3aSbOMovCf
         rhuQc6shkssUcfLaAtWGaDPhcLU5v4LsOUGQz74U26XDKWvLPAJsqgqPK8EGMldnyQ7h
         Rn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419219; x=1778024019;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZczNi69+WMKOJksOctcu51kanJpEjkfDW1oXPOUGF4=;
        b=jKb4a0U0UgXLEl1BQ051Di0GKTovgpkjcbvH0jkP8RmbnmPSnKxCErJrM0UUgHae+E
         LmOuuZt/CzKhg7k/gnRycUXOQHZ0rZ2HWREJPQZfDOn6x/TPdjA5MCuuH6Jhjb2mHtje
         5LjGYlqQOcL96AyU4++3lniNtz6Mk0uwkIWCpSMCqoCdyGExFso84fUzWUqWP65GXg9/
         CWnhxQ5ZXKpoEN8uOTNhwAixzFrf+BkJeuRG3A0VOan7q8lEuJGSAW9gfic9LhPiMVFL
         BJty//nNd3RuB71ytPRz1HHJB2icj8MlJyOlzxgtIf+1q6V9BeR01PTITMs3NBLx5oqr
         3K/A==
X-Forwarded-Encrypted: i=1; AFNElJ/m5pIstVYEZMKnyGRX8hvu3RZTTM9bPuOTQrm6ilPmoaQ7puvWZywUWENVgRQxkJc+iPkb5Z29H+Jj@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbe/nmuuFJ3EWPXKMDe5lC6Z2heHZSyYr2OfOS6dNhY4oqLbLe
	5iduLRoEjOf7jS2fxPsisKwGqnHwgQyjGlyGd45yDhz1SZOtp6+GgG2nW/Kqey62IkvQ9jgawm7
	ajZrVIoPVLSFWmj55osgb7KuVcw==
X-Received: from pglr36.prod.google.com ([2002:a63:5164:0:b0:c76:a2d8:308a])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d20:b0:398:9820:f6cc with SMTP id adf61e73a8af0-3a3af654fdemr1435167637.55.1777419219029;
 Tue, 28 Apr 2026 16:33:39 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:33:26 -0700
In-Reply-To: <cover.1777418884.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com> <cover.1777418884.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <8ab73dc90c83af8dd30af3fe531fa68ee1cb4b96.1777418884.git.ackerleytng@google.com>
Subject: [POC PATCH 6/6] KVM: selftests: Test content modes ZERO and PRESERVE
 for SNP
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

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/x86/sev_smoke_test.c        | 47 +++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
index 86f17e59e9392..7a91a113c4fb7 100644
--- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
@@ -365,7 +365,26 @@ static void guest_code_conversion(u8 *test_shared_gva, u8 *test_private_gva, u64
 	vmgexit();
 }
 
-static void test_conversion(u64 policy)
+static void vm_set_memory_attributes_expect_error(struct kvm_vm *vm, u64 gpa,
+						  size_t size, u64 attributes,
+						  u64 flags, int expected_errno)
+{
+	loff_t error_offset = -1;
+	size_t len_ignored;
+	loff_t offset;
+	int gmem_fd;
+	int ret;
+
+	gmem_fd = kvm_gpa_to_guest_memfd(vm, gpa, &offset, &len_ignored);
+	ret = __gmem_set_memory_attributes(gmem_fd, offset, size, attributes,
+					   &error_offset, flags);
+
+	TEST_ASSERT_EQ(ret, -1);
+	TEST_ASSERT_EQ(offset, error_offset);
+	TEST_ASSERT_EQ(errno, expected_errno);
+}
+
+static void test_conversion(u64 policy, u64 content_mode)
 {
 	gva_t test_private_gva;
 	gva_t test_shared_gva;
@@ -409,6 +428,21 @@ static void test_conversion(u64 policy)
 	TEST_ASSERT_EQ(vcpu->run->hypercall.args[1], 1);
 	TEST_ASSERT_EQ(vcpu->run->hypercall.args[2], KVM_MAP_GPA_RANGE_ENCRYPTED | KVM_MAP_GPA_RANGE_PAGE_SZ_4K);
 
+	/* ZERO when setting memory attributes to private is always not supported. */
+	vm_set_memory_attributes_expect_error(vm, test_gpa, PAGE_SIZE,
+					      KVM_MEMORY_ATTRIBUTE_PRIVATE,
+					      KVM_SET_MEMORY_ATTRIBUTES2_ZERO,
+					      EOPNOTSUPP);
+
+	/* PRESERVE is not supported for SNP. */
+	vm_set_memory_attributes_expect_error(vm, test_gpa, PAGE_SIZE, 0,
+					      KVM_SET_MEMORY_ATTRIBUTES2_PRESERVE,
+					      EOPNOTSUPP);
+	vm_set_memory_attributes_expect_error(vm, test_gpa, PAGE_SIZE,
+					      KVM_MEMORY_ATTRIBUTE_PRIVATE,
+					      KVM_SET_MEMORY_ATTRIBUTES2_PRESERVE,
+					      EOPNOTSUPP);
+
 	vm_mem_set_private(vm, test_gpa, PAGE_SIZE, KVM_SET_MEMORY_ATTRIBUTES2_MODE_UNSPECIFIED);
 
 	vcpu_run(vcpu);
@@ -419,7 +453,12 @@ static void test_conversion(u64 policy)
 	TEST_ASSERT_EQ(vcpu->run->hypercall.args[1], 1);
 	TEST_ASSERT_EQ(vcpu->run->hypercall.args[2], KVM_MAP_GPA_RANGE_DECRYPTED | KVM_MAP_GPA_RANGE_PAGE_SZ_4K);
 
-	vm_mem_set_shared(vm, test_gpa, PAGE_SIZE, KVM_SET_MEMORY_ATTRIBUTES2_MODE_UNSPECIFIED);
+	vm_mem_set_shared(vm, test_gpa, PAGE_SIZE, content_mode);
+
+	if (content_mode == KVM_SET_MEMORY_ATTRIBUTES2_ZERO)
+		TEST_ASSERT_EQ(READ_ONCE(*(u8 *)test_hva), 0);
+	else
+		fprintf(stderr, "test_hva contents = %x\n", READ_ONCE(*(u8 *)test_hva));
 
 	vcpu_run(vcpu);
 
@@ -441,7 +480,9 @@ int main(int argc, char *argv[])
 	// 	test_sev_smoke(guest_sev_es_code, KVM_X86_SEV_ES_VM, SEV_POLICY_ES);
 
 	if (kvm_cpu_has(X86_FEATURE_SEV_SNP)) {
-		test_conversion(snp_default_policy());
+		test_conversion(snp_default_policy(), KVM_SET_MEMORY_ATTRIBUTES2_MODE_UNSPECIFIED);
+		test_conversion(snp_default_policy(), KVM_SET_MEMORY_ATTRIBUTES2_ZERO);
+
 		// test_sev_smoke(guest_snp_code, KVM_X86_SNP_VM, snp_default_policy());
 	}
 
-- 
2.54.0.545.g6539524ca2-goog

