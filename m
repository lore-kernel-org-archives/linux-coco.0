Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B1F3DAAA9
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735929; cv=none; b=QTjkJUBZaM+AhE0XwFBVDqT8rZOwXpzWc1jI3ojwkK8ixLWra51YpXATXCoiTJLSygcYVd4zCKmCzopWNbMLTO8c3Man+aGmla7m+g3bZFow/cr66i4lImzcgXagUf5ubUc9roPziCi5nKqVA/RhsfpIfbVPbnphTc7+6khqs4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735929; c=relaxed/simple;
	bh=rjS7YIkj9IfMwuN6szgnaq7r9mhIQEiYfekeu/by3Vc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CdoeLLVDf9PnfbAbZtYfrrdDNxWZiDOgQfgv7O0NyAwkEvDfu9jFQi4SAG+yu47IE3xqkN90Rfu54S3U/7OKccMFC/AZtJgliRXZAl+o7SU+eNNzbt2Yo5ct3QXkqajr4QGGkxTjsDc1OKrQxC74PSG2o2mBLIDVITZ0JShP5PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VgNyLe7n; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VgNyLe7n"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so278917a12.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735920; x=1788340720; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlxub+uHBO/9tuD+fZ54oP42v4czhWpxNnl1EZnj2VA=;
        b=VgNyLe7nCGe3YhZby4uKAS0qNXPMoKt7A5k2K3wHlrTg59tUGo40Adag1A5/E8o1Na
         1PoqpeYcGgS2BvzphPX6yF+b149+tYrstNjJx+CoE038Yx1AOl+tg2IhaJkbR+qRvKHi
         BMp/fqvuRH36ZM9IURy5HuSLdR1yUI4H3ykGXHQczjpWwT16GTjO2qJ4ts3DLQRhniyu
         /+Wf3kPpZcT64HnSjYKPMzvbMaauk2pmRU4GTbvEnfHwOP9CX7xxaX6nR83OMPOedFz3
         B3yv1zY1TQm+xu4tT1XsxefndSqPBvMmZAZrz7ecrucoF9OQ9LGJVU54kOBAKKcW1zcn
         e66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735920; x=1788340720;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlxub+uHBO/9tuD+fZ54oP42v4czhWpxNnl1EZnj2VA=;
        b=rRML/tQKKkbV640StyOOAhzfCzC/0eh3hJab1KNVL4xiRbIa7x+wRSxFDfNljsDBoe
         6obHYgMW+WbRkBjJEFxvEfWes7M5QyxGRRy091ZAWLC+VWRd8rCa4g5TUSqR7hgGSL8P
         pu7WXsJOPGpCJzMHErX/++jzpegt5YjVNpHSvv4Nll2vN5jX+ZIEXtjiThqDf3i6KoMU
         4LBoXtwWUNvLHuvaaWm9U4DfY9FjqMRCu5LNn+ehjABVVNaY5YrrA3t8Z7v3c1cBu8sa
         vYUgUdxwRnR8OlQSJ7NpDvCUPWB/6wyHFXr/RAvPrJSiQjET6FLLRxP7kYNFWI2gYEF2
         c2PQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc0HM4Vg15D/k/8R6BHwHyELgcpY9UX+36td+0Zv4GogUGZHINasuOuq3enBxCj+dd58mehTMb4+Lo@lists.linux.dev
X-Gm-Message-State: AFuF++ni3KOjKRWSJupkLQ2DoHM8FlrRzcbvvoqzTbXHZXZiRbP2dMlK
	Rz1/pcL92hDDcNAdFuJxTCbjLxI56FrnVFRgXgLPr5SmrcDxJqqKVZKE82lTRwZlHWcZr8nTfFa
	JyzM5WRqbvGSocuWu+EnqGhU1fA==
X-Received: from pgmn1.prod.google.com ([2002:a63:5c41:0:b0:cc1:b785:2d5c])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1398:b0:3bf:8de9:c64e with SMTP id adf61e73a8af0-3ceed381cdcmr7706302637.2.1787735919845;
 Wed, 26 Aug 2026 02:18:39 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:17 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=3028;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=rjS7YIkj9IfMwuN6szgnaq7r9mhIQEiYfekeu/by3Vc=; b=lCUCj1iZvnbvBq8YHDBpqof0pVd2qwZfFFterSX0jRK7/rf6Au2LXCto6eoK3sBAVMPHL3rmu
 YzrbJeQTET3CW+0To48scfCtCha+gH4+4h5I0KZt9qWeSUgUInKR50f
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-19-0a15d8a799aa@google.com>
Subject: [PATCH v11 19/46] KVM: guest_memfd: Zero page while getting pfn
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
	linux-coco@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="utf-8"

Move the folio initialization logic from kvm_gmem_get_pfn() into
__kvm_gmem_get_pfn() to also zero pages if the page is to be used in
kvm_gmem_populate().

With in-place conversion, the existing data in a guest_memfd page can be
populated into guest memory through platform-specific ioctls.

Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
might contain uninitialized host memory, which would leak to the guest if
the populate completes.

guest_memfd pages are zeroed at most once in the page's entire lifetime
with guest_memfd, and that is tracked using the uptodate flag.

Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
kvm_gmem_get_folio() since other flows, such as a future write() syscall,
can get a page, write to the page and then set page uptodate without
zeroing.

There may be some performance penalty due to redundant zeroing, but this
would pale in comparison to the cost of actually assigning the page to the
VM.

This aligns with the concept of zeroing before first use - the other place
where zeroing happens is in kvm_gmem_fault_user_mapping().

On populate failure, the page is not re-zeroed, since on SNP, if firmware
rejects a CPUID page, the expected CPUID values provided by firmware are
returned to userspace via page contents. More generally, page contents may
be modified on populate failure.

Don't mark the page uptodate again after populating, since the page would
already be marked uptodate before the post_populate() call.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 virt/kvm/guest_memfd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 4912f90567fe8..9c2d52bdf25ec 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1105,6 +1105,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
 		return ERR_PTR(-EHWPOISON);
 	}
 
+	if (!folio_test_uptodate(folio)) {
+		clear_highpage(folio_page(folio, 0));
+		folio_mark_uptodate(folio);
+	}
+
 	*pfn = folio_file_pfn(folio, index);
 	if (max_order)
 		*max_order = 0;
@@ -1133,11 +1138,6 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		goto out;
 	}
 
-	if (!folio_test_uptodate(folio)) {
-		clear_highpage(folio_page(folio, 0));
-		folio_mark_uptodate(folio);
-	}
-
 	if (kvm_arch_has_gmem_convert() &&
 	    kvm_gmem_is_private_mem(file_inode(file), index))
 		r = kvm_arch_gmem_make_private(kvm, gfn, *pfn,
@@ -1179,8 +1179,6 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
 	}
 
 	ret = post_populate(kvm, gfn, pfn, src_page, opaque);
-	if (!ret)
-		folio_mark_uptodate(folio);
 
 out_put_folio:
 	folio_put(folio);

-- 
2.55.0.887.g758fc8c411-goog

