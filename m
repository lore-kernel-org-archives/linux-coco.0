Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B813BFE4D
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735955; cv=none; b=Cmrpjuo6GnqDJrp/btkICGC8ZhgwDJejUw1FN5quz+LReJaDVmyiev+dF1QNF9OA/Jjpkt1wHTESBHAwA98deKxq4NaC/8+bbGjXsKspJiCfUylfTOiKBGX3RnOwpq9DJd5MgJSe3ykuANiyclqwB54Ky9mtHih55qICbTxEu7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735955; c=relaxed/simple;
	bh=hllAZwlWW+ih1BmS23q9euXZautp6FkTBIIgcqLkrqc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sPaDsfbTsLoc64zW7ZahExSjDwAh9eQoudE2qf3TfNxTG6YP1RDY7E9vN8aGF70y3ch4vtCBnL8uTbwsVFU6ERi1nbQy3wpXwUkCRMS65ZJ1ynKURAuyVk804FeLN4hMzqAiYanBst5gc58oAfYNhODilnx0SVoKjPZ43vyoZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SVyRPT1K; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SVyRPT1K"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so1535271a91.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735948; x=1788340748; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ik/B5ZuTpzm8Db9Vos6QAKILR9bvsScWDRJqqgLCjsk=;
        b=SVyRPT1K8gtngBrlKtcwDKj9jbRwEo2iqHIbvLRf/u5zQBdF1uQANEoT49l0XF75MB
         cF8IKRxF61FE0LkORe7u8doxRV5zzDRL066sxkVikqoumcFX6j+GKeAyUypcRFlRu5Rq
         rFCq2WXw1lQlPtMda0GtShBc6qQmxQ7JPsXFzGxP89uaS4Ai8edltqbZHp67kR4Sxs6u
         m+kkIys6Rc1UVjwtjyxz2It2Ah6jb2pnRRe7m+24SP59J1iiOM+Z4KrEnswLFO3D8PIK
         +vi6DZRH6HFUH94ztwVO5kv1Cyw6oGIcm4JxI9I+iQF5ujPgVk9prk9FRdn6LocxBUWA
         M78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735948; x=1788340748;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ik/B5ZuTpzm8Db9Vos6QAKILR9bvsScWDRJqqgLCjsk=;
        b=YnzF3MlqjcrMjmJFEzNtCGCDqJxK+EutxTOHgsh0yQ7UI/CEM9BnH0v0aZHmQieiMu
         6POVWira71FSQ5KmYd4HT/HkzwKZPTxkOZdfsZqkur+SALSDQ+e2H72iRiEeHKQQ7ssu
         A7yzMAkx7cTqck30xIhCr1LKs4j4PvXMYibE/B2cNHR0RzD3EwiX71y9Au6Qr6iGxRrK
         BEcQbAlYCNOGhJ+HgBqBwDX/dmWsnNe868sErIdGwXIvv386SJsnByiwuYpDsAV+pjQz
         HfZdG7/wB4jqDGrPzv+nlDY6seMjdju2sN758LNcqoDF2aqQB4TyIFTsd14wAXS7/0Nn
         cQ7g==
X-Forwarded-Encrypted: i=1; AHgh+RqFDuRaGro9zyOw0IUoOFvMhX9bAnPQnWEnh+YoTTHM5SwBmny9+soWkWGZKlQRP/bj40K3Mucli8H7@lists.linux.dev
X-Gm-Message-State: AFuF++noFtcceTkjOIgh1wswL49ANG5mtnZ/XeXUZOfV/mMOGOGetIOp
	PCmKKalUuQhHcVch0FH0DOKSkKx+5EvIsJyFBA4APw4/LWE6YoxAnh6nlKkuDdjBuTpZraKQJzp
	+rMbybOOpdrYzRO3ffiQRRrzS2g==
X-Received: from plbkt4.prod.google.com ([2002:a17:903:884:b0:2d5:e7d8:3c3b])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d4c3:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d707803e2bmr78547545ad.0.1787735947278;
 Wed, 26 Aug 2026 02:19:07 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:33 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=2066;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=hllAZwlWW+ih1BmS23q9euXZautp6FkTBIIgcqLkrqc=; b=qsiVu/whfm9O8+e9PDF2qnZWi29DuDjd8KVnXJuUZNQ15/zioWZ2WGZ+Gc5d2n0THQKCtwyLF
 S93gEjTSxmiDnf4G6GH5/pNYzc3coo+pUgB7Mig8s+PQSoK8gbUsyxb
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-35-0a15d8a799aa@google.com>
Subject: [PATCH v11 35/46] KVM: selftests: Test that truncation does not
 change shared/private status
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

Add a test to verify that deallocating a page in a guest memfd region via
fallocate() with FALLOC_FL_PUNCH_HOLE does not alter the shared or private
status of the corresponding memory range.

When a page backing a guest memfd mapping is deallocated, e.g., by punching
a hole or truncating the file, and then subsequently faulted back in, the
new page must inherit the correct shared/private status tracked by
guest_memfd.

Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/x86/guest_memfd_conversions_test.c       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
index acdff2d154046..b7a54d2a90928 100644
--- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
@@ -10,6 +10,7 @@
 #include <linux/sizes.h>
 
 #include "kvm_util.h"
+#include "kvm_syscalls.h"
 #include "kselftest_harness.h"
 #include "test_util.h"
 #include "ucall_common.h"
@@ -312,6 +313,19 @@ GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(unallocated_folios, 8)
 		test_convert_to_shared(t, i, 'B', 'C', 'D');
 }
 
+/* Truncation should not affect shared/private status. */
+GMEM_CONVERSION_TEST_INIT_SHARED(truncate)
+{
+	host_do_rmw(t->mem, 0, 0, 'A');
+	kvm_fallocate(t->gmem_fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0, page_size);
+	host_do_rmw(t->mem, 0, 0, 'A');
+
+	test_convert_to_private(t, 0, 'A', 'B');
+
+	kvm_fallocate(t->gmem_fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0, page_size);
+	test_private(t, 0, 0, 'A');
+}
+
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));

-- 
2.55.0.887.g758fc8c411-goog

