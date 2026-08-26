Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3CD3C10AF
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735947; cv=none; b=fVAvJ+nJgCHW1Ap7XG5xz35OFD9zYB6nveK3Xqv/A9eLMu/00zQRXjlZk6v3rpqUSq5TdZI1+pRXPqQJjS0W5DqL01qKYe3RL4Afv/XGd15QXiD8r9M59q6eM93dmPgQrHa40+c0vm/oIuSVBxUZgOyZXV3oVyAI/F9PK2v9iRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735947; c=relaxed/simple;
	bh=m1EnsponEK3ffE+S4viVcHUMFCcCRT7Oe+a5rZdir9o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pLl/m60oEAnMqhwLiAvqHKhzd9UR0oamwbgXt0e8weLfcaVQNKMuKChNKoLPk5sQ/iI/Y7bMYwcso3YLXFtPkuLz5TkUQaJD/fhvkdWMzNBuOU3BSszRuBM2cTUnsyOpPaSHa2JSIYYmnztzzTpQQuRkIwmFD3JgSFzE2fnwLuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VUSlML1i; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VUSlML1i"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d54187d8b0so20168525ad.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735941; x=1788340741; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mryHVYsFMw5QfnvdlFWfWH3DHg2cIJI/N7Q9jVqtsNo=;
        b=VUSlML1iS5ggEc6fQt0oUZPowULO9tEOU2lVneM60zAxT6hSWOtRO6EITJrry0wMlR
         Od40fEoyHDNLl8WtyuE3fr1Je8WR65mo6dPfQiECfjCWoD73azNI9+sWO9ydyayhyxQ8
         JznySR8du6DIPulurO2vdlip+Q+AOBktd5YhLMstrnmBbu9PbdKaU9nq8sISv9DON31m
         JODlmHrWgZepS+HHRw5sy5gm+f4Bx6kRsoUyRmJC9gzwtfqZ2j12JhIyigTOkm9HnPYZ
         QlH0Lrr04MqZgxFf1O6pDJ4hw0MVQCXIU2DGQ9o0IXoM+x0dJqch5UlIsf9FSLHgw7xr
         Vr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735941; x=1788340741;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mryHVYsFMw5QfnvdlFWfWH3DHg2cIJI/N7Q9jVqtsNo=;
        b=EkQXBPkz5toczYIfOyktzBAtxrDJQV4Khac4CtHroIOHoEZERyHd7A+5qkQ5BaSYTN
         LwDFHWA4/NK+t/b103TMEZjRTA+QtCAWL75KhALppxRiVzMDHjy/lT1o0cPmCMwWA14E
         B6Jyo0Tzs5pXw8habmzeOZl2gVqIRBBl2K1/iwcC8PzrNCUW3fgrr2Bckkz9KuxsxPVD
         8Hodssm4MPxk75A7eCR/3xanXIeExHg3VKStAZuKCYaCZfG1qxXnceRkJ2BvP31vxV8t
         PwinuTVxkd2ot162iUSzqXasbDvTb7fHv79PE4zZBcOpbVRNK2PQvX+8Wm3LEIFUeP2r
         y7cw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6fwUE/pJJ5tq0sGm8rVQ+GcYTs5pJ+1zZ+pRwmpJSM30vVL9gzDY8Mi8/qIhUzojPvrdhO7/XYyDh@lists.linux.dev
X-Gm-Message-State: AFuF++lW5Egs3bMI90c6bAuDT43h4YSPrhwkVuGq5NKwkj+l4nzspxob
	dwfsinH/hj5lhgLTggNSLPnZGB3wax+2j5TqWgf3oXGpgvR8Ru1EShSWt9aHFUJsuKSeUsqjoVo
	6K2NXvM/toQ5qFT9nCx2BVvVV6g==
X-Received: from plblf11.prod.google.com ([2002:a17:902:fb4b:b0:2d6:eae9:3470])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d548:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d707953a04mr97889795ad.3.1787735940315;
 Wed, 26 Aug 2026 02:19:00 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:29 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=1820;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=m1EnsponEK3ffE+S4viVcHUMFCcCRT7Oe+a5rZdir9o=; b=qZJHVh35jrourMTzyQzc+m35d5hPzDRKD19154Bae8Nxq+4fEcdWMhoaHFA76qJd8wJSveiTc
 yd1CymUqKYyDI830woVD48JV9E21apI2rkTcg9PPgAYBmpucJvjTMcK
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-31-0a15d8a799aa@google.com>
Subject: [PATCH v11 31/46] KVM: selftests: Test conversion flow when INIT_SHARED
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

Add a test case to verify that conversions between private and shared
memory work correctly when the memory is initially created as shared.

Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/x86/guest_memfd_conversions_test.c        | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
index 77f95d49349ce..4c20d3d8e9349 100644
--- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
@@ -97,6 +97,12 @@ static void __gmem_conversions_##test(test_data_t *t, int nr_pages)		\
 #define GMEM_CONVERSION_TEST_INIT_PRIVATE(test)					\
 	__GMEM_CONVERSION_TEST_INIT_PRIVATE(test, 1)
 
+#define __GMEM_CONVERSION_TEST_INIT_SHARED(test, __nr_pages)			\
+	GMEM_CONVERSION_TEST(test, __nr_pages, GUEST_MEMFD_FLAG_INIT_SHARED)
+
+#define GMEM_CONVERSION_TEST_INIT_SHARED(test)					\
+	__GMEM_CONVERSION_TEST_INIT_SHARED(test, 1)
+
 struct guest_check_data {
 	void *mem;
 	char expected_val;
@@ -188,6 +194,13 @@ GMEM_CONVERSION_TEST_INIT_PRIVATE(init_private)
 	test_convert_to_private(t, 0, 'C', 'E');
 }
 
+GMEM_CONVERSION_TEST_INIT_SHARED(init_shared)
+{
+	test_shared(t, 0, 0, 'A', 'B');
+	test_convert_to_private(t, 0, 'B', 'C');
+	test_convert_to_shared(t, 0, 'C', 'D', 'E');
+}
+
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));

-- 
2.55.0.887.g758fc8c411-goog

