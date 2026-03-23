Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516503E6DE4
	for <linux-coco@lists.linux.dev>; Mon, 23 Mar 2026 20:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774299572; cv=none; b=FSaJXifP5kJlDl0s5h/EO4czvXfCqMXU+TWA0Dfl4NpOmWnUDgy6iF0z/O3aRW+GB6cso4evuDY3uu/9VOoTRU3tikurK0ZEjSOmvFlTnrPyC94YbfCG/sxY+u9kVhKiTxZZCxQhdZdAw88aKX/smoTLMHMjFR7Ur4wg9nbu9ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774299572; c=relaxed/simple;
	bh=xmYUcXvNPSne4xx5aF8gVsTVubD4qSP5Sa6svWKJhE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BlIEbbN10MN6JgKQghOLrZsq5K8E3Orv/kp1M79cyDB06BdAuOlgSIzxcVoGoYG9dpjOWF6oNXtJND/LyCD96Xce2NkI33AG0o5cAMTNUXMtQiprsrq3iI+VtzNkHTIVSVCfSaK8ym5sqS4sPDF056nOgxw+tpnx1wfCKEjvHfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoMSjDFN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoMSjDFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774299565; x=1805835565;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=xmYUcXvNPSne4xx5aF8gVsTVubD4qSP5Sa6svWKJhE8=;
  b=MoMSjDFNgHOasA2nyYqKDe9BpeDCZrRbGxXjEcAJBEbHPfEGAJoQ8noX
   k9CaaiTh5Tz7oJjzzStKER9aJnOyC9OB9PwkMMzfQPXilhiF3cEhn5cyb
   emiCnYkRTaFA7tkJHeOlt6P7MDwHM0sN1r6vxl/JQqmaJ4UG5oIc8Y++9
   qhAK2u6wYB1x6hkdDryHFgPk2ixbFBaLIfjOv0LkmN13kn7ZyCpMAnI58
   2+KWMcABENxHM3eVin/255dmVT1x7yUgDI1ueo72KN5Qo+EmzPA70iS44
   ksScL1Z1T3TTIfAE2ipxjo2YrF/SkRstRSwbA5mek7QuJPM0oZnXRiDxQ
   Q==;
X-CSE-ConnectionGUID: +cfSkvEmQ26632Fu3YktSQ==
X-CSE-MsgGUID: R0Pm0oGDTFC/sfYsLEjndA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74491167"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74491167"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 13:59:25 -0700
X-CSE-ConnectionGUID: BjoZ1WcRSiudasIkKU8PuQ==
X-CSE-MsgGUID: 7agm+4TxT0qVDZ+w/HTbzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224156879"
Received: from vverma7-desk1.amr.corp.intel.com (HELO [192.168.1.200]) ([10.124.221.51])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 13:59:24 -0700
From: Vishal Verma <vishal.l.verma@intel.com>
Date: Mon, 23 Mar 2026 14:59:08 -0600
Subject: [PATCH v2 5/5] x86/virt/tdx: Remove kexec docs
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-fuller_tdx_kexec_support-v2-5-87a36409e051@intel.com>
References: <20260323-fuller_tdx_kexec_support-v2-0-87a36409e051@intel.com>
In-Reply-To: <20260323-fuller_tdx_kexec_support-v2-0-87a36409e051@intel.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Sean Christopherson <seanjc@google.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
 kvm@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>
X-Mailer: b4 0.16-dev-8c19c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264;
 i=vishal.l.verma@intel.com; h=from:subject:message-id;
 bh=/Bi8M4/fivZYl7NEWzkuzL9MCY3LYD9P0Q0j44q9A4c=;
 b=owGbwMvMwCXGf25diOft7jLG02pJDJkHVy4r2/5zadLeKYUaPJnfVu6Ye/FYAD+7/tULGzvKj
 5wK+FlyuqOUhUGMi0FWTJHl756PjMfktufzBCY4wsxhZQIZwsDFKQATefSD4X/i3cI5b6+5mGS4
 m7vtt5ljYfkvKN5RV77It0HH4PilrNUM/1PXdDB0xe3yuhk2bfF+2Y7gm8ZbBIKE906tqZtnbrY
 5kxUA
X-Developer-Key: i=vishal.l.verma@intel.com; a=openpgp;
 fpr=F8682BE134C67A12332A2ED07AFA61BEA3B84DFF

From: Rick Edgecombe <rick.p.edgecombe@intel.com>

Recent changes have removed the hard limitations for using kexec and
TDX together. So remove the section in the TDX docs.

Users on partial write erratums will need an updated TDX module to
handle the rare edge cases. The docs do not currently provide any
guidance on recommended TDX module versions, so don't keep a whole
section around to document this interaction.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
---
 Documentation/arch/x86/tdx.rst | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
index ff6b110291bc..1a3b5bac1021 100644
--- a/Documentation/arch/x86/tdx.rst
+++ b/Documentation/arch/x86/tdx.rst
@@ -138,13 +138,6 @@ If the platform has such erratum, the kernel prints additional message in
 machine check handler to tell user the machine check may be caused by
 kernel bug on TDX private memory.
 
-Kexec
-~~~~~~~
-
-Currently kexec doesn't work on the TDX platforms with the aforementioned
-erratum.  It fails when loading the kexec kernel image.  Otherwise it
-works normally.
-
 Interaction vs S3 and deeper states
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

-- 
2.53.0

