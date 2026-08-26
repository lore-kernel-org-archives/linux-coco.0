Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533C3F44F4
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735953; cv=none; b=YwtQJMlvPhhyIcC+2aYU/xp0jFPe4fkqsBUpMb9NLlN0uqX0Hlugb+xA40Ex+Z75/ijlNKSwpkAGJgpIMMD86zlW3laLh/2vshjjRQG/oMFBbipB4Dygn9IL2jGMdGLS4ypoQrm3H0zsHiAjqVSZbj2MxiaheEbg0xPHPiCAJLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735953; c=relaxed/simple;
	bh=Z2UFei2SRBY3/wzto9IlHBrYtnnFhcb6Xe3JALubj7U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WwHT66Rdxm0egEc8D2sPjFspZCdf1lKSBl3bijIZO9eJRTpPerO3UNfqRCw+FFVMSzFUE5TwMIVAzR0QjuPktWhZr8FZcAUrGu9JKvVhIDbcDwXtqAPZVSVCmSC+rf5XzYD5Vxr0JMiPjBmwNi91eofrG9E7diKskvuLmPGSW1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ozgWAOlY; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ozgWAOlY"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6c166bafcso13238285ad.2
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735944; x=1788340744; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+QIStebluGuNMlcnL56N5FeU5gomqFB4kLU+1RXvFs=;
        b=ozgWAOlYM5sQcnJwQUtLZtzRYVBESAC3N1m+azAwK+T0pbz4lfnubWnK6J9zPOCGeN
         pauf7DTNRsfyRGmeuZZFactg6LjjLR2y5ioNfqm1VCivnrpKFYH83nv6vqVYIhToy6XA
         xEs6k++iT6n7tMsMBR0w5EBar+CTszeSIRG7a2WTEbYCjhlNXHDls3MhN4uTqKlbkErS
         2YdAiAW5XtX74Fby8xLEPM2jZO9rQoQUN03L0aR6ROR2Kp0C+rZY88ShaRkOixWWl7ZN
         nxB1jfMRDm9s9BpqOwgFa+8LP24w6dxKzch938GaBEXIa0EPecojXj9U2gX/sAqKLK4Q
         WznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735944; x=1788340744;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+QIStebluGuNMlcnL56N5FeU5gomqFB4kLU+1RXvFs=;
        b=hQMDVAR8Aeru5G9C1tvgfAUDecsbsLk37AdSf2Hlly1QYJ3Qv5GCeOLaJZbfu0lE9Z
         rUg9rc6Jt8q8CCag/lBca945rBm9ZYEZQ2BIvMpJrO+xj85nQxqisxIn30Cxv1379VTU
         PR5YoO4acgxW76nTrcd54rdUVSI5kxv8TS/BBjuNh7w7+J8xtZr7Q4peQco7imuXp7AJ
         /R8SDt1+epTbWdeAGMZWZgPX1RguUoGXUQj8XobtwgdGOjZTNF+ATvHo8kP2UiaCUJ2w
         hwvXmy+obQuX5j24joiEj20VPKNeMIMtYZv8e8HSUxEpXZp2RFaaXL6hQopCRSLzzpyG
         txuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+wrJvHiBEvSCLbqFjSsUt6v748YjpSTDIqopqtPdTLQ0rd4VAo4ZeJEz8eifH8VuDPfJXsjxn6YmD@lists.linux.dev
X-Gm-Message-State: AFuF++nhDmXNXsLDLy8RdufHQwQhPRfNX/ORUaiabIzhtxVLbpvDPwLi
	bhEmRzNuovoskSSaBwHjCjc5G3s3Rt/5treqg1KkZ3YoqhirgyBgDfUptTHCuZB26ndCNZOg5aG
	iCtQWleF7L6Gj/47ENO3vWsZEIw==
X-Received: from plblb3.prod.google.com ([2002:a17:902:fa43:b0:2cf:75c1:ab87])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2283:b0:2d6:7409:7145 with SMTP id d9443c01a7336-2d707a2edd0mr90992585ad.1.1787735943792;
 Wed, 26 Aug 2026 02:19:03 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:31 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=1811;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=Z2UFei2SRBY3/wzto9IlHBrYtnnFhcb6Xe3JALubj7U=; b=iF9oclctKMAmtq8/BXAmeziLVob0gwQiMxab9AP4cOna1dViC2KVb0DXsHietLlhMm4MmiLFx
 NG5IyiRqrCFAgls8o8R4aRa0shTBIbhH28LRiR+I6Ogpy3OSwNF8ZVo
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-33-0a15d8a799aa@google.com>
Subject: [PATCH v11 33/46] KVM: selftests: Test conversion before allocation
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

Add two test cases to the guest_memfd conversions selftest to cover
the scenario where a conversion is requested before any memory has been
allocated in the guest_memfd region.

The KVM_SET_MEMORY_ATTRIBUTES2 ioctl can be called on a memory region at
any time. If the guest had not yet faulted in any pages for that region,
the kernel must record the conversion request and apply the requested state
when the pages are eventually allocated.

The new tests cover both conversion directions.

Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/x86/guest_memfd_conversions_test.c       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
index a8d89df53e46d..f46f1530a94b9 100644
--- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
@@ -268,6 +268,20 @@ GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(indexing, 4)
 #undef combine
 }
 
+/*
+ * Test that even if there are no folios yet, conversion requests are recorded
+ * in guest_memfd.
+ */
+GMEM_CONVERSION_TEST_INIT_SHARED(before_allocation_shared)
+{
+	test_convert_to_private(t, 0, 0, 'A');
+}
+
+GMEM_CONVERSION_TEST_INIT_PRIVATE(before_allocation_private)
+{
+	test_convert_to_shared(t, 0, 0, 'A', 'B');
+}
+
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));

-- 
2.55.0.887.g758fc8c411-goog

