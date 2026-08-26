Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608BE400988
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735961; cv=none; b=SoDbPljcrI604zt4KDn7CX6nqw/o7+wKSmerwVP5Z0Dk2VAQ++3tTP8avMIKhW+zN60NaVtIWe2xblg3rla7BtY1i04GYCxv9DXIYkrdMKehpyZyqXlE/ZOuAj506nLm2FKfSg2z5TgRywwzMG8jGghhE5qzrWgiBNcAZjtzfgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735961; c=relaxed/simple;
	bh=Z2tr8qvCMQ6vCwWclEIKVEn4lsWDwgpi8MEvWzFtaCI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UDBRoGgSCtRLUVA6zVc7fFZSPVMyuNaANQ8ycEgeD98X84iFvgnEIzVmspmhR2q6cyPnK2B3YYeEAyvZR6DSUrN+WPaM/y3uHOAJ93NLoxaTjQRkr510daTb7x+P41uK5+zAxp1MxcfQYtCISZXb677VzQZLYO8y4ExXu1djjwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nlcsNn3h; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nlcsNn3h"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso761224a12.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735955; x=1788340755; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLTz+QoAp4yNZ1r8wY9Xq6qZeJQ57AOaVsGWHTn9ANY=;
        b=nlcsNn3heldMl/eAYh2seqidLCyQcDPa5h0Z52jhm1KZCbBnDM2IeoAnhW//egfuSY
         OhiosVfF/DDn778L0LRYuMNfZjWasAJRyp7RIhjHrEtyEpBhUd8ZBJTZDY1P+ClnF9Cj
         PDZ0eEzZHZqtFhdHXDl76CT7R0T28FubJqkXGM1IWotH6Fctwmx2Rg9dq20HGAJOX5Q5
         QKqfjdXtYcL6PI1ywBn/ZYKDwao5O66sNdJ6I+/nDXVtZyLHxcptp91pGegB+ShQFuBk
         3Ur/5hs3Pi2DB0QsCb97CxlQv74yMaTq2KMA9oBjlqq4M0t5tG4vj08damGdAUgu+qcE
         FuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735955; x=1788340755;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLTz+QoAp4yNZ1r8wY9Xq6qZeJQ57AOaVsGWHTn9ANY=;
        b=Zuqty+HrXZPI6gDbHWHDyW7h6C0M4zzAqJsxYLNhWddDoCGbIqyAuiL3N2BT381R6O
         toPuEZL5grWuRV138wwEIRfCFoIpZtVaKUeF3wVh8y+/tO/d5Ms/V5fE8doRnvL1/K+Z
         k8xwrEghiYuR0PAVmqRtcuGvkCa0Hmm8NT6hnGf0vZ593Jg8Ul51EWlBp2i/sHsZKYbS
         HAGwjgHO74S0qerZAaVNA6ZRNzUGSD4a1IHbxmHvhD6v0b8sKHPnbW3pBJlfIb4ocMCW
         xln99wQDpZW0H4fr1EcyajublAwgbkI5Zz3nocL6vM0s2DMTuyaS4CVlWBXtZO/xSv0p
         lUBA==
X-Forwarded-Encrypted: i=1; AHgh+RoujUcGjWZCPAuLwy4+Tikj++K+bOF/gFoIaoshu0xvq9Y6omgXiOLZjIb6xSHJgLJVGLz6J/vLzcmw@lists.linux.dev
X-Gm-Message-State: AFuF++n5eIxNN7H6pcazvqEMJCVRtFAUdtE/5hTTjrDxe9WdNeO/mXZd
	pwahpNp3DQDmOudWRx/5TQGf5YryqK0BoyZLQmDOTIKaHZaaDh5SIrRpVXw9uS0m7vwyYDfS5T6
	XKpTEh8+P+W/JQuBHt1CcxoZuCg==
X-Received: from pgcq30.prod.google.com ([2002:a63:751e:0:b0:c9b:2759:d240])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:6681:b0:3cc:9288:99aa with SMTP id adf61e73a8af0-3cf6673e199mr11680996637.0.1787735954249;
 Wed, 26 Aug 2026 02:19:14 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:37 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=2579;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=Z2tr8qvCMQ6vCwWclEIKVEn4lsWDwgpi8MEvWzFtaCI=; b=uYPyckNcYtbmNIce6USQWE2ZQN3yzQ5s9PRlHn/kQiqauAVRj01fYWLdGSn4JUn4Y8ICRU4i5
 SrOFy7IMtVFANbmMI9ps1KJiTpkrRcJ6bBbcMXjogb2zUhXxCkElfSO
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-39-0a15d8a799aa@google.com>
Subject: [PATCH v11 39/46] KVM: selftests: Reset shared memory after hole-punching
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

private_mem_conversions_test used to reset the shared memory that was used
for the test to an initial pattern at the end of each test iteration. Then,
it would punch out the pages, which would zero memory.

Without in-place conversion, the resetting would write shared memory, and
hole-punching will zero private memory, hence resetting the test to the
state at the beginning of the for loop.

With in-place conversion, resetting writes memory as shared, and
hole-punching zeroes the same physical memory, hence undoing the reset
done before the hole punch.

Move the resetting after the hole-punching, and reset the entire
PER_CPU_DATA_SIZE instead of just the tested range.

With in-place conversion, this zeroes and then resets the same physical
memory. Without in-place conversion, the private memory is zeroed, and the
shared memory is reset to init_p.

This is sufficient since at each test stage, the memory is assumed to start
as shared, and private memory is always assumed to start zeroed. Conversion
zeroes memory, so the future test stages will work as expected.

Fixes: 43f623f350ce1 ("KVM: selftests: Add x86-only selftest for private memory conversions")
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/x86/private_mem_conversions_test.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
index f3de2a4ab0551..cf50e9a332c5b 100644
--- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
@@ -202,15 +202,18 @@ static void guest_test_explicit_conversion(u64 base_gpa, bool do_fallocate)
 		guest_sync_shared(gpa, size, p3, p4);
 		memcmp_g(gpa, p4, size);
 
-		/* Reset the shared memory back to the initial pattern. */
-		memset((void *)gpa, init_p, size);
-
 		/*
 		 * Free (via PUNCH_HOLE) *all* private memory so that the next
 		 * iteration starts from a clean slate, e.g. with respect to
 		 * whether or not there are pages/folios in guest_mem.
 		 */
 		guest_map_shared(base_gpa, PER_CPU_DATA_SIZE, true);
+
+		/*
+		 * Hole-punching above zeroed private memory. Reset shared
+		 * memory in preparation for the next GUEST_STAGE.
+		 */
+		memset((void *)base_gpa, init_p, PER_CPU_DATA_SIZE);
 	}
 }
 

-- 
2.55.0.887.g758fc8c411-goog

