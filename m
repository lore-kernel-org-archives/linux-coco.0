Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280A346A0F
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649374; cv=none; b=o11KMY9yHVmUhycPEWtCmwWbWIGyED7FI3hxk3GmXiShZHj7QgIoMkadr2UVm7yPwa2Sq5fZd///8xEAHmckMJw8j2U52LiJtHOS/cpIJGqj++AYgnRVVWCIEe2sNPpELgUN/HUkb1hQZ1l2Mh7W3IgChkvb5M7mZ6dQIBRGxnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649374; c=relaxed/simple;
	bh=xiOF/ywd/+MHn1BhHUiTZVc2zVcx2UHV6SNWBozy59Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ELOO+J0K2SRuDWHt+AuC/FY+FE7hdZSMCMjTqc4Ytl8va6NWTpAVf0vrcUR8d63SlvTh+uMgVbyc2y4iDvLszkW+b1WB3Tb29tRXzY+662N1lRnOe+SrwoG2BitOn8dp776tdxAGqFC0f0Xf3XRY5maVCiyb6ZQ3vpgtqkVRv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JFfu074W; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JFfu074W"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c5e56644646so1058660a12.0
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649372; x=1770254172; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gE55/NsqfamORgnZHIenHqCeRcUi8ZNblQ/btnBuAf4=;
        b=JFfu074WOMg9jaWaghU+wFBUQ1/KgIlydoDZZ3mQJDWWgRQHZc29ZAz6/U+fTnjv32
         Sf51Vhfu06xKJI6nGMWo+BPaakr4Bl2ovmmrU30H820JPtVhZYDRo6s/5SqDUcvukJhN
         VMA8MgPL0h1qITTYtX0hSofxd/H7/nAo6xsJFaIvryo81lVnaC3bcdOwXveSZu0m+SZ/
         QynpqzQerjJ4YouGm7izxM9q1Q/+CuKuuQlrf5O87JjH5JuCEfS5U5lwgY6RUItODeWV
         jHejeNgj5ZMSXhNaC0V47LKfNRkrvo/rxpSDOL8IE91BG+0Qq7lTN55XQYFgMV9thFCa
         XDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649372; x=1770254172;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gE55/NsqfamORgnZHIenHqCeRcUi8ZNblQ/btnBuAf4=;
        b=EB4t6ICLtpa4FR214scexcf2jJ7u4+GAtiSe+V01+bKioTpKKCUYizmeWK3sx+j90I
         SP69fIQef7OQKEcesT1g42EZ+x6sHgoIQ0Y7IK224wHyniRQLEXYDByaIYiyy7A2dbhB
         CM38aiOTRJM4fKTs4jSlCWFUsyJnUKz0xvL4oB81fH2eJpid3GBFUEYZft5ck82KIgHd
         pLP8iT8//RLCZwSOZZsPI4/4fXWY/Ra3leZUK/MvXrQciQNNaTlpmzlnazJ5VrA14PWY
         BlCBCzqJEv0bk7iuUFvvTUE/1YfD4Iw+f4fYj31lsIH7+9cG9sHKfiTnGtbmi7AcfnY+
         pcog==
X-Forwarded-Encrypted: i=1; AJvYcCUFvIe0tpaMWA4SMKbzcyQWzUtrU8DJ1ocuN19UPhha9/pxEOlmHeEpy9pXi93KKbcjN6S/AQaRkL58@lists.linux.dev
X-Gm-Message-State: AOJu0YzJTzvv5SChg0Ae1xOSwXRmSVebaNFOhAFzC5r6cfKlSTYkUhLU
	8cuVwkRc78RiSyltUexxh6VKQDw0dL8Q0diszNR/kVXw7+aIqmy9CWjr32JR0NB114Fq4vB7h3o
	+KLD+Rw==
X-Received: from pgbdn8.prod.google.com ([2002:a05:6a02:e08:b0:c1c:1a2d:bc85])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d50c:b0:389:5767:5763
 with SMTP id adf61e73a8af0-392cc6b1ab7mr1088866637.24.1769649372269; Wed, 28
 Jan 2026 17:16:12 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:55 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-24-seanjc@google.com>
Subject: [RFC PATCH v5 23/45] x86/virt/tdx: Enable Dynamic PAMT
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

The Physical Address Metadata Table (PAMT) holds TDX metadata for
physical memory and must be allocated by the kernel during TDX module
initialization.

The exact size of the required PAMT memory is determined by the TDX
module and may vary between TDX module versions, but currently it is
approximately 0.4% of the system memory. This is a significant
commitment, especially if it is not known upfront whether the machine
will run any TDX guests.

The Dynamic PAMT feature reduces static PAMT allocations. PAMT_1G and
PAMT_2M levels are still allocated on TDX module initialization, but the
PAMT_4K level is allocated dynamically, reducing static allocations to
approximately 0.004% of the system memory.

All pieces are in place. Enable Dynamic PAMT if it is supported.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Tested-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tdx.h  | 6 +++++-
 arch/x86/virt/vmx/tdx/tdx.c | 8 ++++++++
 arch/x86/virt/vmx/tdx/tdx.h | 3 ---
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index c39e2920d0c3..56bdfbce4289 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -12,6 +12,10 @@
 #include <asm/trapnr.h>
 #include <asm/shared/tdx.h>
 
+/* Bit definitions of TDX_FEATURES0 metadata field */
+#define TDX_FEATURES0_NO_RBP_MOD		BIT_ULL(18)
+#define TDX_FEATURES0_DYNAMIC_PAMT		BIT_ULL(36)
+
 #ifndef __ASSEMBLER__
 
 #include <uapi/asm/mce.h>
@@ -133,7 +137,7 @@ const struct tdx_sys_info *tdx_get_sysinfo(void);
 
 static inline bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo)
 {
-	return false; /* To be enabled when kernel is ready */
+	return sysinfo->features.tdx_features0 & TDX_FEATURES0_DYNAMIC_PAMT;
 }
 
 /* Simple structure for pre-allocating Dynamic PAMT pages outside of locks. */
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 53b29c827520..90407493bb45 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1068,6 +1068,8 @@ static int construct_tdmrs(struct list_head *tmb_list,
 	return ret;
 }
 
+#define TDX_SYS_CONFIG_DYNAMIC_PAMT	BIT(16)
+
 static int config_tdx_module(struct tdmr_info_list *tdmr_list, u64 global_keyid)
 {
 	struct tdx_module_args args = {};
@@ -1095,6 +1097,12 @@ static int config_tdx_module(struct tdmr_info_list *tdmr_list, u64 global_keyid)
 	args.rcx = __pa(tdmr_pa_array);
 	args.rdx = tdmr_list->nr_consumed_tdmrs;
 	args.r8 = global_keyid;
+
+	if (tdx_supports_dynamic_pamt(&tdx_sysinfo)) {
+		pr_info("Enable Dynamic PAMT\n");
+		args.r8 |= TDX_SYS_CONFIG_DYNAMIC_PAMT;
+	}
+
 	ret = seamcall_prerr(TDH_SYS_CONFIG, &args);
 
 	/* Free the array as it is not required anymore. */
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index 46c4214b79fb..096c78a1d438 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -86,9 +86,6 @@ struct tdmr_info {
 	DECLARE_FLEX_ARRAY(struct tdmr_reserved_area, reserved_areas);
 } __packed __aligned(TDMR_INFO_ALIGNMENT);
 
-/* Bit definitions of TDX_FEATURES0 metadata field */
-#define TDX_FEATURES0_NO_RBP_MOD	BIT(18)
-
 /*
  * Do not put any hardware-defined TDX structure representations below
  * this comment!
-- 
2.53.0.rc1.217.geba53bf80e-goog

