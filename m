Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CA72D97BB
	for <linux-coco@lists.linux.dev>; Mon,  5 Jan 2026 07:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599038; cv=none; b=GQIeFCxumsOQioZJqyapimqJhz12bkKk07Q8NPH/rcPC9iOrBvvIwxU5Un/DGO6ejERYX+FPsKC6VgehZt5D2hgcbAKIdAlfURcKp1YvkKm599EpkNkO9fPO9vywb6f5cOuh/kUZmgHF0m4shjVLppA0YJIsN1lUrhhVrI2N2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599038; c=relaxed/simple;
	bh=HoyR3hR6cttRXSNo6m4arpXKD/s/WTvls/Hs5c6I9MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkQMwhXHs4dYaYYg3hZQQFegxsLpYwaZlYp0RCr6zPRg7pXxLbWHhYX8S8iSawfK/41oPyYhUTHzg60tWQOKKK9/v+tZmpQx2v7kkvefHyWGKb3bT5dAyP+yfEh+GQVjJs23BFkf6pgGrfjWkU8EG2ktkacvgi0R70v4sxfB+Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJIBJC6a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJIBJC6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767599037; x=1799135037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HoyR3hR6cttRXSNo6m4arpXKD/s/WTvls/Hs5c6I9MQ=;
  b=nJIBJC6ap548NCy8eJEEKatpLkywrQ9FrzX3/GN8DQM5p9fMQ89jkm7J
   i/QIa9gd0FHRTNLsjs0ks9B8dxJUHtvRJj0gPwPvD5LMtgH6C+980Pea8
   VvrUmo/29v8Rs1xUTlsf2Jes/vkDjhRYZdaFk50ksWT8QDTdddjs52n3+
   7zQiKRyBVb6uqvReBFZvOrSwaREXY8offrrNq5Acr9UBVsrgchZVSdXSn
   OEnKV7UJkWbiSUhUgWWXpAbL43yo+tcI+cMqJUzyQDD9KV6zXTV8KuXVk
   3JGVFRf6f29Nf7yv4NqGV1ziHY7NotnBPI1FUZB+WxaeMMHnf34edi/cB
   w==;
X-CSE-ConnectionGUID: TlaZhfLrTtiDl/EO/QL3Sw==
X-CSE-MsgGUID: f1/kPdKsQEO/a/VdYKGQpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69012579"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="69012579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 23:43:54 -0800
X-CSE-ConnectionGUID: jFI/YOfIQ4GgGgooTu+wAw==
X-CSE-MsgGUID: q3Lh+Ks0ReOetW6Aq/o55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="239799067"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 23:43:54 -0800
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: vishal.l.verma@intel.com,
	kai.huang@intel.com,
	dan.j.williams@intel.com,
	yilun.xu@linux.intel.com,
	vannapurve@google.com,
	Chao Gao <chao.gao@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCH v2 3/3] x86/virt/tdx: Print TDX Module version during init
Date: Sun,  4 Jan 2026 23:43:46 -0800
Message-ID: <20260105074350.98564-4-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105074350.98564-1-chao.gao@intel.com>
References: <20260105074350.98564-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vishal Verma <vishal.l.verma@intel.com>

Alongside exposing the TDX Module version via sysfs, it is useful to
have a record of it in dmesg logs. This allows for a quick spot check
for whether the correct/expected TDX module is being loaded, and also
creates a record for any future problems being investigated. This was
also requested in [1].

The log message will look like:

  virt/tdx: TDX-Module version: 1.5.24

Print this early in init_tdx_module(), right after the global metadata
is read, which makes it available even if there are subsequent
initialization failures.

Based on a patch by Kai Huang <kai.huang@intel.com> [2]

[ Chao: s/TDX module/TDX-Module in the log message
        tag print_module_version() as __init ]
Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
Signed-off-by: Chao Gao <chao.gao@intel.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Kai Huang <kai.huang@intel.com>
Link: https://lore.kernel.org/all/CAGtprH8eXwi-TcH2+-Fo5YdbEwGmgLBh9ggcDvd6N=bsKEJ_WQ@mail.gmail.com/ # [1]
Link: https://lore.kernel.org/all/6b5553756f56a8e3222bfc36d0bdb3e5192137b7.1731318868.git.kai.huang@intel.com # [2]
---
v2
 - new

 arch/x86/virt/vmx/tdx/tdx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index ef77135ec373..3282dce5003b 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -352,6 +352,13 @@ static __init int read_sys_metadata_field(u64 field_id, u64 *data)
 
 #include "tdx_global_metadata.c"
 
+static __init void print_module_version(struct tdx_sys_info_version *version)
+{
+	pr_info("TDX-Module version: %u.%u.%02u\n",
+		version->major_version, version->minor_version,
+		version->update_version);
+}
+
 static __init int check_features(struct tdx_sys_info *sysinfo)
 {
 	u64 tdx_features0 = sysinfo->features.tdx_features0;
@@ -1158,6 +1165,8 @@ static __init int init_tdx_module(void)
 	if (ret)
 		return ret;
 
+	print_module_version(&tdx_sysinfo.version);
+
 	/* Check whether the kernel can support this module */
 	ret = check_features(&tdx_sysinfo);
 	if (ret)
-- 
2.47.3

