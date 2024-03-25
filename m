Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C45E149C7F
	for <linux-coco@lists.linux.dev>; Mon, 25 Mar 2024 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711363221; cv=none; b=ibzf6FPj2v7BqXWO41kQ04sj1GAaVG1XKxHw1TEDJDfVnvN2yE17GKBnOaIpGKZOOrj+BSKvtdnI6wtfUp5trRP01AX2wT/XuWQMVlPKyFzgekN9aT6VpB/KtKzlnRs6es0waflEPGrPmf3vRea2UATnLv51fPj/Rm0YLIoNKCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711363221; c=relaxed/simple;
	bh=W80pqKoVc1vqxX/XGuHFDF0b+nJhSWWU10+X3joqYlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9DbVOqkgK/u+IoI5gGpYdeEAWIFsBl45otvEOQiPHzIZyvJJCLVZZU1/RhJ4+1lPXmjBUEsGwafR1Cx+6OcFW1/TJogYAk1HcIXAqQhtJl3OiFr74gC6zUAh68clLcD7SxpVXOoW85iBCQA8NiI6Nszhetn6hK+uHXbe07AiZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVgaYoP/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVgaYoP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711363219; x=1742899219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W80pqKoVc1vqxX/XGuHFDF0b+nJhSWWU10+X3joqYlo=;
  b=kVgaYoP/RQVM4QalQ4ikU8U8zDyDgxRg2asnGOByJN3fMMa8UrxWPx+u
   b4UhTaaDrs3nl2dfTk01gsrlWV57CLMAfuQ6YdY3j7NNWup3PV9G0b8Pf
   BEO4kbhnONI0o27V9olLo6MbtBdMyazLg96dY5VAYRKDqefw9A3Rprrn2
   Vly4pLYLzDo90PZsfyqjPDtLAnPoU/n/X/I5SWPSMB4yn/tqTlZjlBD4N
   RpjjacjgNnl6loqUMtQEIXghNqr1RA4fYzpDCBlndIUvM89fGZpBKjFq/
   yUoHRBW9Y1NSuCDQxPe2J3OSW7oLB3J5Dt3/3eYA4QsOLI7WblD6kZ5aG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6561378"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6561378"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 03:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="937070153"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="937070153"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2024 03:40:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 3F720815; Mon, 25 Mar 2024 12:40:05 +0200 (EET)
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
	Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv9 08/17] x86/tdx: Account shared memory
Date: Mon, 25 Mar 2024 12:39:02 +0200
Message-ID: <20240325103911.2651793-9-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325103911.2651793-1-kirill.shutemov@linux.intel.com>
References: <20240325103911.2651793-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel will convert all shared memory back to private during kexec.
The direct mapping page tables will provide information on which memory
is shared.

It is extremely important to convert all shared memory. If a page is
missed, it will cause the second kernel to crash when it accesses it.

Keep track of the number of shared pages. This will allow for
cross-checking against the shared information in the direct mapping and
reporting if the shared bit is lost.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 26fa47db5782..979891e97d83 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -38,6 +38,8 @@
 
 #define TDREPORT_SUBTYPE_0	0
 
+static atomic_long_t nr_shared;
+
 /* Called from __tdx_hypercall() for unrecoverable failure */
 noinstr void __noreturn __tdx_hypercall_failed(void)
 {
@@ -821,6 +823,11 @@ static int tdx_enc_status_change_finish(unsigned long vaddr, int numpages,
 	if (!enc && !tdx_enc_status_changed(vaddr, numpages, enc))
 		return -EIO;
 
+	if (enc)
+		atomic_long_sub(numpages, &nr_shared);
+	else
+		atomic_long_add(numpages, &nr_shared);
+
 	return 0;
 }
 
-- 
2.43.0

