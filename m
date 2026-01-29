Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2993733123A
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649360; cv=none; b=n9CDsef83afCFBFo1S2oJj6aca2wM6TFOOInHSTshHubsM52lyI9wuKQfQf73O8N9kZgD7gqIws5wB3Qa+KMDQNs9JkyBtqxHhxlyYw2Pgbn5yJDCDkprd2PIhUmsc7+YnJWjZHsmOUsRm7g9j3gP5P34YY32su3ijebH5UnHAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649360; c=relaxed/simple;
	bh=esb0FgEarAvzd7he3f1yhhOtX7p49PRyk0uclVgGx9Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ry++z4vt6XcHg3t2BsHK2hrYiGjjpHu0qbQVyPo+3Y0/YyS7nWeVN933qio7Eth4RWOQwWABvSrQ7dhCpWHQhzvML9eN2s8qQ9dJODtqzb5aF76a7l17ziIbDod0hgCIGe/WTuM8Lo+sOfx9zj4/Af+htqH7QdINpfEdf5JYOFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bE8h9Enn; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bE8h9Enn"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a871c32cdbso3794745ad.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649354; x=1770254154; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UlFOBu5FArwUjFk9bCGxsyWYTTpURccpKRpfejh6JpM=;
        b=bE8h9EnnheZqn487wv+nwZac7PIjdEd2vgPdSCyTTi27v+XTf9dpXA91pEkSssgFsn
         VFSh6GXWHImRnNY03OEQQnH8s7IRkiOFQNgq986tW42QxXXfKDU/E79ciiSaeHedJZWS
         m5Vj2QylZH4gsnloqJ55yM3KamwWJz+PqUMEoreYJTgIIVBwXAROj12k/wPWyEWN0w1s
         X4Pe0i492HQI7fqGpwY33W8O2kn3+qih4R7mUg2pF/KEn2lBQdRgV9/7iVg/8wxORpP9
         qk0v8QucYDTLQlcMsb2VnFcXu5L8vLaEYn+fTCey5MsSR2lUwHmO7ARiCIdsw53pvTiB
         sKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649354; x=1770254154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlFOBu5FArwUjFk9bCGxsyWYTTpURccpKRpfejh6JpM=;
        b=MQ88YLBmKYdWSTACwlQDirkBbHT4gO/Nox/2+31wn4pbbgpWUkpG8DfFQQLOunvfPD
         R294l9KBuxBWwNSBoMAl3eLK12fQ9uSMlfU0Jir2q0yAAwb6BoFuuxB3v9qcpyAtbrL0
         7ZbO64EobjEmFiY6+3t4AOVOVEZEqbrrOFDGzYJ4lmBCOjv7kyjKCma5Yz5AoftFBjzj
         GzpJkco8h1RFRnr1uAaS5A/gO9WZ1bzfcswnRN51cj25NVmMfgF3EpdRjBSm+hS5bIxc
         MWtbhBTxljtis0PWdQb+nDdFvWtgFdKEMj7ZXOz+QVuD7aFZbUm2jMYQbYBiK11iMMXT
         esHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1qYqqqyqdb9k2CXNJHMffoaomYu9NNlugmSFuyGAv5HXKPYAn7mDFfsaT3kvljFAkUsJ92SvIZUK4@lists.linux.dev
X-Gm-Message-State: AOJu0YyPTZzlLIyzPrsI1NgTwWnc2A9mRUqvVX0431ZwO/m5t5tlfhbQ
	7sQlLlGXbEAFCVTqGVfilQ8rurAdU6jh7t9rqzOs63OR1f+O2vHy+fkJcztHVOopQH9IwhqICCA
	F9GH4Kw==
X-Received: from plbd1.prod.google.com ([2002:a17:902:f141:b0:29d:5afa:2d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ca0f:b0:2a0:9fc8:a98b
 with SMTP id d9443c01a7336-2a870ddc60amr49753935ad.40.1769649354439; Wed, 28
 Jan 2026 17:15:54 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:46 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-15-seanjc@google.com>
Subject: [RFC PATCH v5 14/45] x86/virt/tdx: Allocate reference counters for
 PAMT memory
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Kai Huang <kai.huang@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

The PAMT memory holds metadata for TDX protected memory. With Dynamic
PAMT, the 4KB range of PAMT is allocated on demand. The kernel supplies
the TDX module with a page pair that covers 2MB of host physical memory.

The kernel must provide this page pair before using pages from the range
for TDX. If this is not done, any SEAMCALL that attempts to use the memory
will fail.

Allocate reference counters for every 2MB range to track PAMT memory usage.
This is necessary to accurately determine when PAMT memory needs to be
allocated and when it can be freed.

This allocation will currently consume 2 MB for every 1 TB of address
space from 0 to max_pfn (highest pfn of RAM). The allocation size will
depend on how the ram is physically laid out. In a worse case scenario
where the entire 52 bit address space is covered this would be 8GB. Then
the DPAMT refcount allocations could hypothetically exceed the savings
from Dynamic PAMT, which is 4GB per TB. This is probably unlikely.

However, future changes will reduce this refcount overhead to make DPAMT
always a net win.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[Add feedback, update log]
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Tested-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/virt/vmx/tdx/tdx.c | 47 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 517c6759c3ca..db48bf2ce601 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -30,6 +30,7 @@
 #include <linux/suspend.h>
 #include <linux/idr.h>
 #include <linux/kvm_types.h>
+#include <linux/vmalloc.h>
 #include <asm/page.h>
 #include <asm/special_insns.h>
 #include <asm/msr-index.h>
@@ -51,6 +52,16 @@ static DEFINE_PER_CPU(bool, tdx_lp_initialized);
 
 static struct tdmr_info_list tdx_tdmr_list;
 
+/*
+ * On a machine with Dynamic PAMT, the kernel maintains a reference counter
+ * for every 2M range. The counter indicates how many users there are for
+ * the PAMT memory of the 2M range.
+ *
+ * The kernel allocates PAMT memory when the first user arrives and
+ * frees it when the last user has left.
+ */
+static atomic_t *pamt_refcounts;
+
 static enum tdx_module_status_t tdx_module_status;
 static DEFINE_MUTEX(tdx_module_lock);
 
@@ -184,6 +195,34 @@ int tdx_cpu_enable(void)
 }
 EXPORT_SYMBOL_FOR_KVM(tdx_cpu_enable);
 
+/*
+ * Allocate PAMT reference counters for all physical memory.
+ *
+ * It consumes 2MiB for every 1TiB of physical memory.
+ */
+static int init_pamt_metadata(void)
+{
+	size_t size = DIV_ROUND_UP(max_pfn, PTRS_PER_PTE) * sizeof(*pamt_refcounts);
+
+	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
+		return 0;
+
+	pamt_refcounts = __vmalloc(size, GFP_KERNEL | __GFP_ZERO);
+	if (!pamt_refcounts)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void free_pamt_metadata(void)
+{
+	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
+		return;
+
+	vfree(pamt_refcounts);
+	pamt_refcounts = NULL;
+}
+
 /*
  * Add a memory region as a TDX memory block.  The caller must make sure
  * all memory regions are added in address ascending order and don't
@@ -1083,10 +1122,14 @@ static int init_tdx_module(void)
 	 */
 	get_online_mems();
 
-	ret = build_tdx_memlist(&tdx_memlist);
+	ret = init_pamt_metadata();
 	if (ret)
 		goto out_put_tdxmem;
 
+	ret = build_tdx_memlist(&tdx_memlist);
+	if (ret)
+		goto err_free_pamt_metadata;
+
 	/* Allocate enough space for constructing TDMRs */
 	ret = alloc_tdmr_list(&tdx_tdmr_list, &tdx_sysinfo.tdmr);
 	if (ret)
@@ -1136,6 +1179,8 @@ static int init_tdx_module(void)
 	free_tdmr_list(&tdx_tdmr_list);
 err_free_tdxmem:
 	free_tdx_memlist(&tdx_memlist);
+err_free_pamt_metadata:
+	free_pamt_metadata();
 	goto out_put_tdxmem;
 }
 
-- 
2.53.0.rc1.217.geba53bf80e-goog

