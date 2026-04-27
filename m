Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683CA3D88E5
	for <linux-coco@lists.linux.dev>; Mon, 27 Apr 2026 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303817; cv=none; b=cRFFM72sNi+RHZXS9pskN5Q0yVAJp5LmosfIIjTzL8cvaOoY+U0SJ8iCvHqaCk37MdI+wpqEdx7RHYTsRRCBZanq7FKBG18LWfdOW4GKYC+QJOjGbnIfIgWjBVH47MRB+74dMCATKGKvvYd5bnoU5ybuobAOrPsjcSCDwGhPla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303817; c=relaxed/simple;
	bh=E8KAfqiMC7/zX0TEeflmgG68M7YynVogr3OGqQ241C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8oekxH9GSb2MmD8t53/Hg7faGVJt2ypubjyPQkPQFADsaJpYY1sP4WstzijnqZogKk0dpyl7PLp1KjrQN8C8W/ylgUtXPcfFz39uTglMxHnzNpQO+znI9+2O/oiDu5TBxHOdb8eEEZotRZjkuQtpo9kgUbUx1RCLX7mOSlWpfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGGRfeIY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGGRfeIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777303815; x=1808839815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E8KAfqiMC7/zX0TEeflmgG68M7YynVogr3OGqQ241C8=;
  b=EGGRfeIYYILs6iZjAc95NHqITuDcNZShpgnxlqWakNJmjJQJtfEcJxNu
   GP+OvI3fDU1nEPckYqWjRMtwu0KWD413KIOoK0kuHO1rqJFq4tFpf+JWX
   W3N/Ev+xoaR41gnxFW74qB8sOpCssPjQ+3EfO/L/jg5/hGImJXqsBUSbS
   GxtIZzHUZHeNpewzvJziDLOxof9WOLk4sMB+FQwBPk1aE+n/p1RoecG/l
   WkXYZwuF06IO1LFKvQlqTMelfA0OWzqngWcxr+kX5mTSI7iXH3tLVFwMw
   /LVxXs5WO9KVTh5oJ5HWXUlXXY3oERMVZAq9Lsvk+CNBvgevMPm1FpDkp
   g==;
X-CSE-ConnectionGUID: JeIp3bONTtKsruKMgfCOgQ==
X-CSE-MsgGUID: e8w6PkSnTf2T0+RL/EDosA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77900834"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="77900834"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:30:07 -0700
X-CSE-ConnectionGUID: HAJsZFOaQqKdLr5QYl+zng==
X-CSE-MsgGUID: SjFJyL8qRCOnJ40kJRNoqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="232673369"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:30:07 -0700
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org
Cc: binbin.wu@linux.intel.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	nik.borisov@suse.com,
	paulmck@kernel.org,
	pbonzini@redhat.com,
	reinette.chatre@intel.com,
	rick.p.edgecombe@intel.com,
	sagis@google.com,
	seanjc@google.com,
	tony.lindgren@linux.intel.com,
	vannapurve@google.com,
	vishal.l.verma@intel.com,
	yilun.xu@linux.intel.com,
	xiaoyao.li@intel.com,
	yan.y.zhao@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v8 21/21] x86/virt/tdx: Document TDX module update
Date: Mon, 27 Apr 2026 08:28:15 -0700
Message-ID: <20260427152854.101171-22-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260427152854.101171-1-chao.gao@intel.com>
References: <20260427152854.101171-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document TDX module update as a subsection of "TDX Host Kernel Support" to
provide background information and cover key points that developers and
users may need to know, for example:

 - update is done in stop_machine() context
 - update instructions and results
 - update policy and tooling

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
 Documentation/arch/x86/tdx.rst | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
index ff6b110291bc..de6b99d9afa7 100644
--- a/Documentation/arch/x86/tdx.rst
+++ b/Documentation/arch/x86/tdx.rst
@@ -73,6 +73,42 @@ initialize::
 
   [..] virt/tdx: TDX-Module initialization failed ...
 
+TDX module Runtime Update
+-------------------------
+
+The TDX architecture includes a persistent SEAM loader (P-SEAMLDR) that
+runs in SEAM mode separately from the TDX module. The kernel can
+communicate with P-SEAMLDR to perform runtime updates of the TDX module.
+
+During update, the TDX module becomes unresponsive to other TDX operations.
+To prevent components using TDX (such as KVM) from experiencing unexpected
+errors during updates, updates are performed in stop_machine() context.
+
+TDX module update has complex compatibility requirements; the new module
+must be compatible with the current CPU, P-SEAMLDR, and running TDX module.
+Rather than implementing complex module selection and policy enforcement
+logic in the kernel, userspace is responsible for auditing and selecting
+appropriate updates.
+
+Updates use the standard firmware upload interface. See
+Documentation/driver-api/firmware/fw_upload.rst for detailed instructions.
+
+Successful updates are logged in dmesg:
+  [..] virt/tdx: version 1.5.20 -> 1.5.24
+
+If updates failed, running TDs may be killed and further TDX operations may
+not be possible until reboot. For detailed error information, see
+Documentation/ABI/testing/sysfs-devices-faux-tdx-host.
+
+Given the risk of losing existing TDs, userspace should verify that the
+update is compatible with the current system and properly validated before
+applying it.
+
+A reference userspace tool that implements necessary checks is available
+at:
+
+  https://github.com/intel/tdx-module-binaries
+
 TDX Interaction to Other Kernel Components
 ------------------------------------------
 
-- 
2.47.1

