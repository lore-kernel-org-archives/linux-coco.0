Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6458528EC
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 22:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674772300; x=1706308300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oJ60TuZ/WAThDiZfd1xgtqkLBDwCMemAxdyGLVSzJlk=;
  b=SNr0Wrij8MYZEu5rADYl/YLSKjoTdr1PlBcNahmTiGZuDu+DsgYvTYxV
   yCGCuuuhwjfDaqzhZ6hyvEC1R7biDqohgq6Y8ZmQ/IZqkNkhA+wqnvcn9
   zCnMNWHaN/XecZ+l84hPHTJQfRg+wkpwGzieHIZ6TXSZvNgN+ClH5qqmb
   NHrczYB4T8We3QK4uCMpfHZbQYcWZ6qMcZeW8kLEBYzwQaubza8+Ygjsm
   vmOFrbhO8BAq7/J/U43l+7jiwKyMw7zz026r8LVCLmZ8d3VsN2K+VqKHK
   YR4EUG7pgJ7nZqlZXX/7+p8qSyFRUKXRxKLXkDQRHZyLVvBzJwzQ3dN4v
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="391516405"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="391516405"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="908411169"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="908411169"
Received: from smadjatx-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.210.179])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:05 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 4945410DB5C; Fri, 27 Jan 2023 01:12:03 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Elena Reshetova <elena.reshetova@intel.com>,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2, RESEND 1/7] x86/tdx: Fix typo in comment in __tdx_hypercall()
Date: Fri, 27 Jan 2023 01:11:53 +0300
Message-Id: <20230126221159.8635-2-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126221159.8635-1-kirill.shutemov@linux.intel.com>
References: <20230126221159.8635-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Comment in __tdx_hypercall() points that RAX==0 indicates TDVMCALL
failure which is opposite of the truth: RAX==0 is success.

Fix the comment. No functional changes.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdcall.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/coco/tdx/tdcall.S b/arch/x86/coco/tdx/tdcall.S
index f9eb1134f22d..74b108e94a0d 100644
--- a/arch/x86/coco/tdx/tdcall.S
+++ b/arch/x86/coco/tdx/tdcall.S
@@ -155,7 +155,7 @@ SYM_FUNC_START(__tdx_hypercall)
 	tdcall
 
 	/*
-	 * RAX==0 indicates a failure of the TDVMCALL mechanism itself and that
+	 * RAX!=0 indicates a failure of the TDVMCALL mechanism itself and that
 	 * something has gone horribly wrong with the TDX module.
 	 *
 	 * The return status of the hypercall operation is in a separate
-- 
2.39.1

