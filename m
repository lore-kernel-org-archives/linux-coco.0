Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9493C1D71
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735960; cv=none; b=ZjWE6mk0NFy4Mz5dAVDlFyXVSW+LnsV9tDtRug2iaReJJgTu5yHSGgpn22ZSbaji7vw8v9kQXHW7N7hikGD01sccguYj57fncjrBcn5otTeGlcyfOkYTTnmUIAYrbcwZOVuVQleFX5I4yET9EC1Vzb0HYlU1gyB+dlvcloXZayw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735960; c=relaxed/simple;
	bh=D4kSZoQjn2evbYJeBPXvMiB6VpABDixLKIO9Wkc0q2Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sDLihsLCryPpIHv7U1fl0TYYCB+9HzkM5SO3TWarBFebjbWka0LxMlgI+3K3+nEoPO8AHSjGhjSeX3VTntM0/lMeiCf+Zkzw2JB8p5lU79T6rpKVKJdcekOJ4UtYOOTCn45TWco4jvt1MwHG62SVItzXSyiXQNjyXKYSDe7gQSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KkgUHCTk; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KkgUHCTk"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84842381150so912370b3a.3
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735953; x=1788340753; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jk/fFiPly+8t/f3A0x8GyZ4oVakKVeks0566IWo6DSM=;
        b=KkgUHCTkbLQHhPZkY+F2SvQN011rtOTkj7oLEthduzT2vFQritCYXRz60kLc5AWZfE
         iuRhPrs+5fiPQ1kzGLhIpqsSs0QbH0U7Rd0fia7u+5SxkQlB9AMgGPKvd5qfUsVrDgaJ
         j+yI8ELcVPO111oBc0clLuf8RSOUZ2WMe/nlWETZhTbWeaOxxspU9mUrG5/RdQpPKbvb
         oDkOKwj4Fy/EdjPGF88wlHG6xi9HuPXzBetcPo5EfiMTZxrdKpItMkpBDRBf1Skx4zan
         vfNUOa4CzX/G2N5yFH5KNWOEyMRDaxxQiT1NLVrVhu0VViR2MezYGdjJwA1gji5VoyZz
         d9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735953; x=1788340753;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jk/fFiPly+8t/f3A0x8GyZ4oVakKVeks0566IWo6DSM=;
        b=A8nG7ae5urlSxcRB99TrSzZbinUEQhwFHIrmbR5M8o7QTA1isHsoKLafYCc3ls5USY
         F/xErAco2UZ+oIXedAmPS0eGBGzv77jy2IZUoKDzYjNg9IKlXTg41R8LhD9vUQLbnWlK
         xVji7zimY85eQCbuBHw/C1y5r5nE8/rmYUZrJvrDISl8dnlEjTBtSC0DWYd+ZeWE4A5n
         gAKln0FGx6ybN9h70SooP6otg38O+7wtcxOz+3IUCi4dlLNN94pCJF6LDCSrk+BaA6/M
         tIC1INa932fvSm56n5TlWLLpZ82XEiSz4ErH0MTNKpv3PXjZImt9Hz+XIoUsoqOYTt0o
         8zWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUXh2Cw7/DCAuV0aDZY20n0itROLx06ZKAvl3oh7ibIpl8EFUVkG90APu/yuMr08SGdq2D0MO/T3Wj@lists.linux.dev
X-Gm-Message-State: AFuF++nDO3b8DThT0387AKPZX/u8/C4yAETmYS6mw3NJitFFthzezk4U
	0lHL2rah3dbzQKguh9wAUdQzAvDjStgNvuzOXUzs4HMmi//IxYibYKxEGcrI+oAefPvqnzkd4uO
	EMzZtcybGpaCSDoQW87wp8mLsTA==
X-Received: from pgcn16.prod.google.com ([2002:a63:7210:0:b0:cc1:c6f9:542e])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4289:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-85372ea2586mr10262808b3a.4.1787735952477;
 Wed, 26 Aug 2026 02:19:12 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:36 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=3125;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=D4kSZoQjn2evbYJeBPXvMiB6VpABDixLKIO9Wkc0q2Y=; b=0Xl+Ft2JNeFgHc72cKdPUmlWIaaUKrTcWNaCuE5l4p0QjHUf+PDqPvln09IV5z3p6JgNwwSEQ
 MgPrgGhkueuDsaZhj/coMGB3BJHJjWnz0bwzPjys8Q0r27VmXRxCpWH
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-38-0a15d8a799aa@google.com>
Subject: [PATCH v11 38/46] KVM: selftests: Test conversion with elevated page refcount
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

Add a selftest to verify that converting a shared guest_memfd page to a
private page fails if the page has an elevated reference count.

When KVM converts a shared page to a private one, it expects the page to
have a reference count equal to the reference counts taken by the
filemap. If another kernel subsystem holds a reference to the page, the
conversion must be aborted.

The test asserts that both bulk and single-page conversion attempts
correctly fail with EAGAIN for the pinned page. After the page is unpinned,
the test verifies that subsequent conversions succeed.

Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../kvm/x86/guest_memfd_conversions_test.c         | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
index a972a09c5c6e5..e1c84df0f0596 100644
--- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
@@ -444,6 +444,62 @@ GMEM_CONVERSION_TEST_INIT_SHARED(forked_accesses)
 #undef TEST_STATE_AWAIT
 }
 
+static void test_convert_to_private_fails(test_data_t *t, u64 pgoff,
+					  size_t nr_pages,
+					  u64 expected_error_offset)
+{
+	/* +1 to make it anything but expected_error_offset. */
+	u64 error_offset = expected_error_offset + 1;
+	u64 offset = pgoff * page_size;
+	int ret;
+
+	do {
+		ret = __gmem_set_private(t->gmem_fd, offset,
+					 nr_pages * page_size, &error_offset);
+	} while (ret == -1 && errno == EINTR);
+	TEST_ASSERT(ret == -1 && errno == EAGAIN,
+		    "Wanted EAGAIN on page %lu, got %d (ret = %d)", pgoff,
+		    errno, ret);
+	TEST_ASSERT_EQ(error_offset, expected_error_offset);
+}
+
+GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(elevated_refcount, 4)
+{
+	int i;
+
+	pin_pages(t->mem + test_page * page_size, page_size);
+
+	for (i = 0; i < nr_pages; i++)
+		test_shared(t, i, 0, 'A', 'B');
+
+	/*
+	 * Converting in bulk should fail as long any page in the range has
+	 * unexpected refcounts.
+	 */
+	test_convert_to_private_fails(t, 0, nr_pages, test_page * page_size);
+
+	for (i = 0; i < nr_pages; i++) {
+		/*
+		 * Converting page-wise should also fail as long any page in the
+		 * range has unexpected refcounts.
+		 */
+		if (i == test_page)
+			test_convert_to_private_fails(t, i, 1, test_page * page_size);
+		else
+			test_convert_to_private(t, i, 'B', 'C');
+	}
+
+	unpin_pages();
+
+	gmem_set_private(t->gmem_fd, 0, nr_pages * page_size);
+
+	for (i = 0; i < nr_pages; i++) {
+		char expected = i == test_page ? 'B' : 'C';
+
+		test_private(t, i, expected, 'D');
+	}
+}
+
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));

-- 
2.55.0.887.g758fc8c411-goog

