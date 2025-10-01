Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AE627B33A
	for <linux-coco@lists.linux.dev>; Wed,  1 Oct 2025 02:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759287294; cv=none; b=GDogoCA4QfUs8sm+LKpSzFyApJLX6xftBtsdEYTlTvMVYMteuqL9xEqaZ5t15TEwq2eweUAei9BgiW4s5LAA8xcX4UvBrjTO6eNnHasP3Pm3o0LA52GiTczrk9Rj/Ftkhtc7rPU5GSefW4E2ElSSRNunujD4inMQjg5cKQQQ9zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759287294; c=relaxed/simple;
	bh=Bm1Rky4SqDIX2DDhUjvproP1XyUcq4gPtKHSlGNNq5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4WdvUCisABDp8J1csXxwIH8qHURv0pvFe40daYjQboDzFqeFlK/YlvcCzdKzPVdYJ8g3hMZuNKLvqI4TF22qI30QZ5EglrvGDVb/9E9E0U1IlRCudc5oYIeQStiMWz058Z8tUrzT5qT+7xB3P1ZgKFKW2dMLdumQaAkUt8btaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcjSbDcG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcjSbDcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759287293; x=1790823293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bm1Rky4SqDIX2DDhUjvproP1XyUcq4gPtKHSlGNNq5w=;
  b=AcjSbDcGjN3o01kTIF/Tg7iVt6dGW0k2csmjh2IBtL1qhF0cLikgjukb
   qLUo6Paej3o7gL6cmj9OCUdd2zbumyR1hcIxc6sH27HEyNm9v0l8M6Onz
   zY8464BmQW9l2OPbjlPGnO7BlpzSDNUGtwObfjiuNZu+iJ7FwBvvnaz/c
   uDvairchpOsDBwFme2nEuS+k6LvKyLwzWwdFVUby1XBB/j8bnI4MDt9Gr
   CK1DfSkY1te+Q8uXOIuNNoW1d7X7VQeedQJ/DI9Vgksi1RLtzZtlLF8kh
   wsg9FpV59a8skL3GANWCGN2M4HcUgtxR1wWMZ+IEvj9QTk9c9nfNuFXAQ
   A==;
X-CSE-ConnectionGUID: wiW7qUF+SsaCk4yBOsmLpw==
X-CSE-MsgGUID: UHIjs+YMRlu2YAFQcQL51w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61662209"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="61662209"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 19:54:50 -0700
X-CSE-ConnectionGUID: vAnsVhtyR16BsSuEgoGrGQ==
X-CSE-MsgGUID: PdnsPp/CRnCQox3bofkB0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="178629035"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 19:54:49 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	reinette.chatre@intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	dan.j.williams@intel.com,
	yilun.xu@linux.intel.com,
	sagis@google.com,
	vannapurve@google.com,
	paulmck@kernel.org,
	nik.borisov@suse.com
Cc: Chao Gao <chao.gao@intel.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 02/21] x86/virt/tdx: Use %# prefix for hex values in SEAMCALL error messages
Date: Tue, 30 Sep 2025 19:52:46 -0700
Message-ID: <20251001025442.427697-3-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251001025442.427697-1-chao.gao@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"%#" format specifier automatically adds the "0x" prefix and has one less
character than "0x%".

For conciseness, replace "0x%" with "%#" when printing hexadecimal values
in SEAMCALL error messages.

Suggested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Chao Gao <chao.gao@intel.com>
---
"0x%" is also used to print TDMR ranges. I didn't convert them to reduce
code churn, but if they should be converted for consistency, I'm happy
to do that.

v2: new
---
 arch/x86/virt/vmx/tdx/tdx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index e406edd28687..f429a5fdced2 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -62,16 +62,16 @@ typedef void (*sc_err_func_t)(u64 fn, u64 err, struct tdx_module_args *args);
 
 static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
 {
-	pr_err("SEAMCALL (%llu) failed: 0x%016llx\n", fn, err);
+	pr_err("SEAMCALL (%llu) failed: %#016llx\n", fn, err);
 }
 
 static inline void seamcall_err_ret(u64 fn, u64 err,
 				    struct tdx_module_args *args)
 {
 	seamcall_err(fn, err, args);
-	pr_err("RCX 0x%016llx RDX 0x%016llx R08 0x%016llx\n",
+	pr_err("RCX %#016llx RDX %#016llx R08 %#016llx\n",
 			args->rcx, args->rdx, args->r8);
-	pr_err("R09 0x%016llx R10 0x%016llx R11 0x%016llx\n",
+	pr_err("R09 %#016llx R10 %#016llx R11 %#016llx\n",
 			args->r9, args->r10, args->r11);
 }
 
-- 
2.47.3

