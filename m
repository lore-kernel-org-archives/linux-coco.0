Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76222E7631
	for <linux-coco@lists.linux.dev>; Fri,  9 Jan 2026 19:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767986088; cv=none; b=bJ7xEVrJlkUCxQjor3fHUtGGfW/oV/IiAqKL77nbXN8RqlzgKOt8VyOAMV+YWcmtFbBY8MZTh5+1AImPERjaGkbJy9FvNbpI91oA4pVDjsqwfsgfELfymzw4avucmKKo7STvnKm2qDpo6XhyV2An32Su9kQVWlsNtevLWOek8II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767986088; c=relaxed/simple;
	bh=HAST+iBWW1rthNVsK5i+2cKNI0GpuvQ6shdHcZN3PGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WZR+qpjdkIcdyG6aY1X7yH7Qlae5PKdP87mbajWckUj0leLhZCGOqs1ps/QGbPpoTgPcQ1tSTXt/MOfYSLFSXmZTVrrUpa3syS9wHOO387lnEaQPSAE0N+CrxE/6tvCAUQ0WoFV4/wk9+k6wuar+lZcXdSzo8pSO1KtZFjbVLS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GP3rV3K4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP3rV3K4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767986087; x=1799522087;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=HAST+iBWW1rthNVsK5i+2cKNI0GpuvQ6shdHcZN3PGE=;
  b=GP3rV3K4E9UUJ8LtGE62DEbiUY80gTh/4ZMvhDBoy/qPi6JAJYYnjizt
   KMFNOn9Ah3Yjm2e/T49qT1dldTfU+VhRSUfdO6iAZYSiA/2D3osLGkxyi
   vg+9DKK4XmGO1Khqg9TrsL5I5yHV90bzExmauVhmgJ/XbdVR7aXWPitcN
   /ux8A3wdxmYMcVa9S+CA10p0G1RcQSvBBEoPDF0+gAZHzp5xc9TbzNLVq
   fOZnkx8IdKy6e7otrsCiyotSHCVLbKFJJ1jUItIviCg4BvQDNDsto3e9B
   FgjT8M2ghQ6K8sEFLabLqbj9LH7D/Act/mEgp9Ni6WIWKXeDu5iw3fSeR
   w==;
X-CSE-ConnectionGUID: BCBrV96HTHK+n3xQ5Vx3JA==
X-CSE-MsgGUID: B4ms6EXHT5ija48Da1UsZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80824262"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="80824262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 11:14:47 -0800
X-CSE-ConnectionGUID: RBevAgCdRMetouLWcPsvbA==
X-CSE-MsgGUID: km6/aHnaRWu5PSJpi0kE7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="203456701"
Received: from vverma7-desk1.amr.corp.intel.com (HELO [192.168.1.200]) ([10.124.223.127])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 11:14:46 -0800
From: Vishal Verma <vishal.l.verma@intel.com>
Date: Fri, 09 Jan 2026 12:14:31 -0700
Subject: [PATCH v2 2/2] x86/virt/tdx: Print TDX module version during init
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-tdx_print_module_version-v2-2-e10e4ca5b450@intel.com>
References: <20260109-tdx_print_module_version-v2-0-e10e4ca5b450@intel.com>
In-Reply-To: <20260109-tdx_print_module_version-v2-0-e10e4ca5b450@intel.com>
To: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
 kvm@vger.kernel.org
Cc: x86@kernel.org, Chao Gao <chao.gao@intel.com>, 
 Dan Williams <dan.j.williams@intel.com>, Kai Huang <kai.huang@intel.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047;
 i=vishal.l.verma@intel.com; h=from:subject:message-id;
 bh=HAST+iBWW1rthNVsK5i+2cKNI0GpuvQ6shdHcZN3PGE=;
 b=owGbwMvMwCXGf25diOft7jLG02pJDJmJwUtWqRSmNf149fOf/NbkzYxam77v/3LX9Py2M3+Xn
 PoTIX1wdkcpC4MYF4OsmCLL3z0fGY/Jbc/nCUxwhJnDygQyhIGLUwAm8ugvw/+C6lv8TA/U73ax
 BwYLnl8ywT/Of1/C1+TJCyZsjddRXbCEkaEr88vkQ0m9f9/kX96weH9kya6pR++9m8vfeyfQTir
 5kgcXAA==
X-Developer-Key: i=vishal.l.verma@intel.com; a=openpgp;
 fpr=F8682BE134C67A12332A2ED07AFA61BEA3B84DFF

It is useful to print the TDX module version in dmesg logs. This is
currently the only way to determine the module version from the host. It
also creates a record for any future problems being investigated. This
was also requested in [1].

Include the version in the log messages during init, e.g.:

  virt/tdx: TDX module version: 1.5.24
  virt/tdx: 1034220 KB allocated for PAMT
  virt/tdx: module initialized

Print the version in get_tdx_sys_info(), right after the version
metadata is read, which makes it available even if there are subsequent
initialization failures.

Based on a patch by Kai Huang <kai.huang@intel.com> [2]

Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
Reviewed-by: Chao Gao <chao.gao@intel.com>
Cc: Chao Gao <chao.gao@intel.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Kai Huang <kai.huang@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Link: https://lore.kernel.org/all/CAGtprH8eXwi-TcH2+-Fo5YdbEwGmgLBh9ggcDvd6N=bsKEJ_WQ@mail.gmail.com/ # [1]
Link: https://lore.kernel.org/all/6b5553756f56a8e3222bfc36d0bdb3e5192137b7.1731318868.git.kai.huang@intel.com # [2]
---
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
index 0454124803f3..4c9917a9c2c3 100644
--- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
+++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
@@ -105,6 +105,12 @@ static int get_tdx_sys_info(struct tdx_sys_info *sysinfo)
 	int ret = 0;
 
 	ret = ret ?: get_tdx_sys_info_version(&sysinfo->version);
+
+	pr_info("Module version: %u.%u.%02u\n",
+		sysinfo->version.major_version,
+		sysinfo->version.minor_version,
+		sysinfo->version.update_version);
+
 	ret = ret ?: get_tdx_sys_info_features(&sysinfo->features);
 	ret = ret ?: get_tdx_sys_info_tdmr(&sysinfo->tdmr);
 	ret = ret ?: get_tdx_sys_info_td_ctrl(&sysinfo->td_ctrl);

-- 
2.52.0

