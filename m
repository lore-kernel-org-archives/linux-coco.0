Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597572112
	for <linux-coco@lists.linux.dev>; Thu, 12 Jan 2023 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673518461; x=1705054461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7DqRv8Yg6e6tLhs+ztrt2ocPkjLI6upwYnCAtIxC5R0=;
  b=Y8sVaVqpTMGsxmwNpousR6ra9ds4jkjXRsDcqvQ/2tqFu+gLyx9ZK1eY
   t/jFKscPBnqpDKqg5KdhliEWcws/qQ+XfZz1ANdk7BDsGWiZzOz2qEmg4
   JJ3kCRoJlhAZEwZPc1WYcylOwB38J+zbVL17l1ICch7A4zttdbrjr3Y1I
   E4hScF2f8oetBZv8jUQpBKk2m+passqIQkcDhFRrsTQwsRTA2t9unz3et
   k8TaZM9BObzmfSsaPuAPb/qW9VSO1/SM0zkEInKpfAJDJDI9+2ueWTWUX
   WddK/a/chaKPu3cGr7dG/OyzbjZBqcDF+2627lpWTdwEOTzfNGYZU2+Hv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350892145"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="350892145"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 02:14:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="659722887"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="659722887"
Received: from glieseu-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.52.1])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 02:14:16 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 7CD2F109AF1; Thu, 12 Jan 2023 13:14:13 +0300 (+03)
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
Subject: [PATCHv2 1/7] x86/tdx: Fix typo in comment in __tdx_hypercall()
Date: Thu, 12 Jan 2023 13:14:01 +0300
Message-Id: <20230112101407.24327-2-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230112101407.24327-1-kirill.shutemov@linux.intel.com>
References: <20230112101407.24327-1-kirill.shutemov@linux.intel.com>
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
2.38.2

