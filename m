Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383E426B2AE
	for <linux-coco@lists.linux.dev>; Tue,  8 Jul 2025 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969977; cv=none; b=U8W5HJkP+9LmzF+BiimBOX+4+XCeqxY3qjZ7LGy9N/kLgEy6SMq2/Bjn3S+r+Z+YkYJNWEuIHI0dbMuyuhWWnXWbq3eJxoy12YoxBxkn5uH4CkEbTyOGoRPui3kw/MyO3cIyu3TG/cre7U1KUZev9Z8cb4TDMNaF+7kWbR1as8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969977; c=relaxed/simple;
	bh=8ul1RV4tBolZAx/RFBjHZzoaOwiSn78OumHYnn57vxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AU05s7NUAvkPQaiPPF0P5f5oZalQAq25dUaoQpXvQIEliA2a7kJ5XmECNBVx1sMGwvcs6BP0H3MsVYTdd70ofecIHuo5VcB+QezZjSQ0EagjXh02i4Lbielm7fy9/C11TpwFgqVSyWdCY4XFQQIfsW7Lz1yzND4v3OWnxY1YA1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyN/yu5n; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyN/yu5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751969976; x=1783505976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8ul1RV4tBolZAx/RFBjHZzoaOwiSn78OumHYnn57vxM=;
  b=MyN/yu5nKpWIjLACkL3GYEK+aWLVYtefydgiun8X3YaC76uFxK92Rw55
   DbSm9Y+Yw38iAO4pumInnAIb9G4NktBggmouY5xZVciFDOm1BdqKGoGKY
   G+WGHYzE8l9JK9rnkowkgj+6+7QpZPvozGPWOigrzao3jYRXLYocFu8EG
   VgviR2tkVwbXAZatr6nldG2CbQJeizjbrHpFywO3K4yXCrTOJUAl1ey73
   3mM1zZihs/F8JVE2MN7WC+u8LGLKEo1p8UMJjBtYrt4TgVOZzLAtPI80P
   9ZbGm0tBYJCcu/KR55ztXTF1uh3lONKxRkUZKV8bDA76zEFgMbrf4Rks1
   Q==;
X-CSE-ConnectionGUID: z7ga0bf+S2O/8ScEiIeLaw==
X-CSE-MsgGUID: 2SewAXD2SsaGgPvDYqixNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79632837"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="79632837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 03:19:33 -0700
X-CSE-ConnectionGUID: KMzA/f9XTPidh33tExTg4Q==
X-CSE-MsgGUID: D7YuoiXoS5Om6mzDiRT7Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="155952282"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 08 Jul 2025 03:19:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id AD5F91C5; Tue, 08 Jul 2025 13:19:27 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 3/3] MAINTAINERS: Update Kirill Shutemov's email address
Date: Tue,  8 Jul 2025 13:19:22 +0300
Message-ID: <20250708101922.50560-4-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250708101922.50560-1-kirill.shutemov@linux.intel.com>
References: <20250708101922.50560-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update MAINTAINERS to use my @kernel.org email address.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index b0ace71968ab..85ad46d20220 100644
--- a/.mailmap
+++ b/.mailmap
@@ -416,6 +416,7 @@ Kenneth W Chen <kenneth.w.chen@intel.com>
 Kenneth Westfield <quic_kwestfie@quicinc.com> <kwestfie@codeaurora.org>
 Kiran Gunda <quic_kgunda@quicinc.com> <kgunda@codeaurora.org>
 Kirill Tkhai <tkhai@ya.ru> <ktkhai@virtuozzo.com>
+Kirill A. Shutemov <kas@kernel.org> <kirill.shutemov@linux.intel.com>
 Kishon Vijay Abraham I <kishon@kernel.org> <kishon@ti.com>
 Konrad Dybcio <konradybcio@kernel.org> <konrad.dybcio@linaro.org>
 Konrad Dybcio <konradybcio@kernel.org> <konrad.dybcio@somainline.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index b0363770450f..d7da3e22f4d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26945,7 +26945,7 @@ F:	arch/x86/kernel/stacktrace.c
 F:	arch/x86/kernel/unwind_*.c
 
 X86 TRUST DOMAIN EXTENSIONS (TDX)
-M:	Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
+M:	Kirill A. Shutemov <kas@kernel.org>
 R:	Dave Hansen <dave.hansen@linux.intel.com>
 R:	Rick Edgecombe <rick.p.edgecombe@intel.com>
 L:	x86@kernel.org
-- 
2.47.2

