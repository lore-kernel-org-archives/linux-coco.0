Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8749416C44C
	for <linux-coco@lists.linux.dev>; Tue, 28 May 2024 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716890142; cv=none; b=iA0AJluJJrb6qmXKjMWrtl79+VvxbFpOoNaMoVZJynvO8MOdls2TfRkssB5PgIY0QyvZL8iL5X6SfUtIpD5nT5MLzW3k1pFNwMxapdGEFpAJo+/GTy5XwZsBZaU7gblzVemBzt6Ap9YUlp6t/B13s2Fiw4dLxGkkcD4+U/6vni0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716890142; c=relaxed/simple;
	bh=s730yGUroyCZk2Qy0O4yxg2z82ePxAmz/neB9MJtick=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+uUHgr9FkXa/hKI8GBT76Xh0I8cW8Gw1L9QPs73lPQcj4fel8VA94Cv+qNlbVnalVfw5nH3iycyl+8/en0zEHogT5O4BqmW+dKlec1g8GxbL0OS+Ktg6xJP37O1aKFLVhazNW5OW2+yo7AApaDaLWtId/QvCIs8Upk+yUWbBFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MkfrwV0U; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MkfrwV0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716890142; x=1748426142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s730yGUroyCZk2Qy0O4yxg2z82ePxAmz/neB9MJtick=;
  b=MkfrwV0UPIopPFU+1vLEr8JWnwFGNIWWVAuYqgp6IvOWzgzbf03RQNb0
   bRh0u6g452MFt1npWEKspvoamq5O+rDET8YXPq7C2w7uoBLGN5r3IC8D8
   ikAyQOIuuLlfM+9a6iHG/qLRIJKURMcTtK7aRh+ZTxcxFMKJCslEdFEd2
   vROTSutjjJrnZ3A6aP8fm+RgvUCwiAK6MiUaKzCtnXgvAFK2hV9CmL4xY
   a8P8E4Oc01tI0RX2aqCv8qtt8Hh+AqeqhsEQ4DEhf6IR2baQPLf/fKM2f
   U1oCYLWT0kaTNRrO+h0GxOeyJmjLOVbQCCoqeu6RKbpSkAYvwxnKQ/3KE
   g==;
X-CSE-ConnectionGUID: zPzvd9xUTTKLBgV7Zz4fEw==
X-CSE-MsgGUID: UGclS2+5TiqfOlNYMVHqiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13097713"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13097713"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 02:55:40 -0700
X-CSE-ConnectionGUID: jxXrk9WpSi6aYilnhfaRng==
X-CSE-MsgGUID: eBpOqsVTRbaqlMeuHj/kGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="34951735"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 02:55:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 7350D499; Tue, 28 May 2024 12:55:26 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe  <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Baoquan He <bhe@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	kexec@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCHv11 05/19] x86/relocate_kernel: Use named labels for less confusion
Date: Tue, 28 May 2024 12:55:08 +0300
Message-ID: <20240528095522.509667-6-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
References: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Borislav Petkov <bp@alien8.de>

That identity_mapped() functions was loving that "1" label to the point
of completely confusing its readers.

Use named labels in each place for clarity.

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/kernel/relocate_kernel_64.S | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index 56cab1bb25f5..085eef5c3904 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -148,9 +148,10 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
 	 */
 	movl	$X86_CR4_PAE, %eax
 	testq	$X86_CR4_LA57, %r13
-	jz	1f
+	jz	.Lno_la57
 	orl	$X86_CR4_LA57, %eax
-1:
+.Lno_la57:
+
 	movq	%rax, %cr4
 
 	jmp 1f
@@ -165,9 +166,9 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
 	 * used by kexec. Flush the caches before copying the kernel.
 	 */
 	testq	%r12, %r12
-	jz 1f
+	jz .Lsme_off
 	wbinvd
-1:
+.Lsme_off:
 
 	movq	%rcx, %r11
 	call	swap_pages
@@ -187,7 +188,7 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
 	 */
 
 	testq	%r11, %r11
-	jnz 1f
+	jnz .Lrelocate
 	xorl	%eax, %eax
 	xorl	%ebx, %ebx
 	xorl    %ecx, %ecx
@@ -208,7 +209,7 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
 	ret
 	int3
 
-1:
+.Lrelocate:
 	popq	%rdx
 	leaq	PAGE_SIZE(%r10), %rsp
 	ANNOTATE_RETPOLINE_SAFE
-- 
2.43.0

