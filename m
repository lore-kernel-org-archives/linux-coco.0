Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0F93FADFA
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735959; cv=none; b=ImOvFty9PSjDdEEv1B8dmYIIKim0KyzR94HqS5nBDPIrQpDBrtXDn6sVugkIArJd8DBmYSa0xEkei47iCjQqTJMeJ00+aZBnt1yfyNbStgtZePqC9LJU8QzyHcDDjNzzxqgRUSsYR83Yt1JIEM3btgrAWU4+NoNQFWPfzJ+hxQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735959; c=relaxed/simple;
	bh=oKhUk7AQ/XVnJUDFQGQ0T3PCQ/fs9vSttvSiNTvu8TA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hdaXxHY9SxKa/CBWbGdV6umRsOgIlRYdio94lR9x7wvrIJI+03LjquQwtPu4NjGpanaa+0RmB3WgXMxSjas9zn0Zsi5bfSfEfB62RC6o3E6PrGUfLapsDZfE3UbNqqchdvAZZ3v/p8+E21nN/fJFhDh+XqGaa6H8uTMfqFkgJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ClK+iqX9; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ClK+iqX9"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so10277115ad.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735951; x=1788340751; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7znZB4+fu5SSeJJtVXjdDiNwNEk+mtdzszQFSpw4D4=;
        b=ClK+iqX93+fQOlUqGgDiMLhukG7ApDVG5JqITd2j3VpliBxDe0jLMtHcGs4QPSHImj
         bhaZ/0kJyypYNoDl2Y9k80acP9iqznPP/kIqEpiOULG8qyAIWq/Csn5N4/EhS0bo958Y
         u7hNLLI/dGW+HWgqxoLQ7r38IF1VTjyIasGBq/ddLgGTKE6nw5JXa5S+LMdMoBKpY36z
         ylneBJrCOVPdk+pJgkZ1cbWtdr9qc6qIIzd4TbaCopq1Wp6BlgLzM++7P3u/4glpuDKp
         FymLVBllYFNDjl8roNvh7YrplG81SzYqYQoHtDDlkBpl5AYLM6aEfvuYITk/OzwN3kkx
         gizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735951; x=1788340751;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7znZB4+fu5SSeJJtVXjdDiNwNEk+mtdzszQFSpw4D4=;
        b=sbcxYTb926CySdOJCZd+D/njn/Hbl1o7zxipD4OLwGQPWd5Om04TbInOqqEo7Rja6w
         TxshxLPyI/6cgGfw6+jS3g3R1Q9cj9B3JkUl+v5npU5ARdvwaynzonmmAUFKQDJ/HjcH
         sgs0YQzwtUn1857FoJEyOzcvCrn2MH7itnROlBe8zI3j2Q8b5rNgv4OKzckjT+T5dftQ
         tf7Nqv4XnJm3BFtXHIs01dFgZ1ntFyOm2L+YSW3vhjnbhf5e4LeoIVl89+T6AURK6K/D
         j50OfwSpUUWJRiWJ6hZIOc0a/Rh6XIr5TQrLhcVRPOj2fzQWnOl1NhmrJ2Kc4PcqpmcJ
         NWiA==
X-Forwarded-Encrypted: i=1; AHgh+RorLTIS1n4vam6sGS5fE6JbAv2HHpRHgxoKmL9Je5wr4qxk7ZEcXSd7Ru+DCHRHa6wAJRnrIjhiv9Eq@lists.linux.dev
X-Gm-Message-State: AFuF++m6C8NKnan+MaB3oss8RfuovmznXw84cdoQo/CHB+NBolE4c5HF
	GZXtbzi66/4or0CQqT1+2jSmJWaQtKFsujyOFnCHix5PyFpsTPL+TWXGxkD0w8qmScNldIJA0h4
	KlsThh8iyTs6qQ8C8siwa5eQsuA==
X-Received: from plbkb13.prod.google.com ([2002:a17:903:338d:b0:2d3:768a:b66c])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e550:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d707b64aecmr85060725ad.12.1787735950795;
 Wed, 26 Aug 2026 02:19:10 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:35 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=2738;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=oKhUk7AQ/XVnJUDFQGQ0T3PCQ/fs9vSttvSiNTvu8TA=; b=E3s7CyKmuQ7u5Mqr0j0RmOVbgjxJwnqa6vu50TWR1xpcdjjO+0Nj9vghzwKHhtDd1aD8uPwMQ
 5K1FBJ/M+TkCu5I+2+SMQWquWdJ3o1KIoWaNX0et7JTlybJ0RWLUVFk
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-37-0a15d8a799aa@google.com>
Subject: [PATCH v11 37/46] KVM: selftests: Add helpers to pin pages with CONFIG_GUP_TEST
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

Add helper functions to allow KVM selftests to pin memory using
CONFIG_GUP_TEST. This is useful for creating test scenarios where some page
has an increased refcount, such as when testing guest_memfd in-place
conversion.

The helpers open /sys/kernel/debug/gup_test and invoke the
PIN_LONGTERM_TEST_START and PIN_LONGTERM_TEST_STOP ioctls. Since this
functionality depends on the kernel being built with CONFIG_GUP_TEST,
provide stub implementations that trigger a test failure if the
configuration is missing.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h |  3 +++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 575032e9791d2..3cfe243d7c8b0 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1206,6 +1206,9 @@ static inline int pin_self_to_any_cpu(void)
 	return pin_task_to_any_cpu(pthread_self());
 }
 
+void pin_pages(void *vaddr, uint64_t size);
+void unpin_pages(void);
+
 void kvm_print_vcpu_pinning_help(void);
 void kvm_parse_vcpu_pinning(const char *pcpus_string, u32 vcpu_to_pcpu[],
 			    int nr_vcpus);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index cd468b2bb8343..b1456ed76e27e 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -19,6 +19,8 @@
 #include <unistd.h>
 #include <linux/kernel.h>
 
+#include "../../../../../mm/gup_test.h"
+
 #define KVM_UTIL_MIN_PFN	2
 
 u32 kvm_random_seed;
@@ -645,6 +647,29 @@ int __pin_task_to_cpu(pthread_t task, int cpu)
 	return pthread_setaffinity_np(task, sizeof(cpuset), &cpuset);
 }
 
+static int gup_test_fd = -1;
+
+void pin_pages(void *vaddr, uint64_t size)
+{
+	const struct pin_longterm_test args = {
+		.addr = (uint64_t)vaddr,
+		.size = size,
+		.flags = PIN_LONGTERM_TEST_FLAG_USE_WRITE,
+	};
+
+	gup_test_fd = __open_path_or_exit("/sys/kernel/debug/gup_test", O_RDWR,
+					  "Is CONFIG_GUP_TEST enabled?");
+
+	TEST_ASSERT_EQ(ioctl(gup_test_fd, PIN_LONGTERM_TEST_START, &args), 0);
+}
+
+void unpin_pages(void)
+{
+	TEST_ASSERT_EQ(ioctl(gup_test_fd, PIN_LONGTERM_TEST_STOP), 0);
+
+	kvm_free_fd(gup_test_fd);
+}
+
 static u32 parse_pcpu(const char *cpu_str, const cpu_set_t *allowed_mask)
 {
 	u32 pcpu = atoi_non_negative("CPU number", cpu_str);

-- 
2.55.0.887.g758fc8c411-goog

