Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE74F3EFD22
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284438; cv=none; b=TJp45QcgzikRSntsBMLiC87BS4Ivwp5y4JZyyiC9d1tOSlWQOj1wlRx0jZQQypr6/Gll4H2MatCbUW8ft+bwrnWvf0jSuAzX9jIGCZIm2W74N1jKAVf7dURKDVpNMrEYd+vdOD2k1QDJorZbN0O90egBkbhtZmlK7arnxxnBenI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284438; c=relaxed/simple;
	bh=SfUqIbovDctXOfDJoZGNmcLgvKdlszSKEqnHPTKF+R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnQzoW9DmWpbDrg8ZZ4wfY2KJK2N1o4LTNxZfOU9JkwugpW2UGCElZoDN+U2i1q8vSP8zI+GQ8Y+c7dG/1qag7X5/s8N3D5FuOHs0SaK/hFYOrdlUsJuQT4MyTFU74BKL6Zw4GfICCfUiJIGBhamTFUGYohtK3HQdqtz+hE4efI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgZNlHFy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgZNlHFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779284437; x=1810820437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SfUqIbovDctXOfDJoZGNmcLgvKdlszSKEqnHPTKF+R8=;
  b=cgZNlHFyLN/zHUatcxR1Ge0ivWRjRRkhzOYwvKUidKcVqnOqRkI74MNi
   LtfIHI9qknT5SzyA7GoiAIdTdN9hfjWCYsPtbaXpCkjj3KIEuyDEEzceK
   2HsIttK10BjVNphkLWEmJ6U0VI0criGzvshdQhXOOPkYxxRdRHdV7VE8w
   46hS6p7xDfyNXr7fkE+ppxJaxET53YTG76FMdUSPFA+Cf0hBjnbv7WFbJ
   GUsTM6Ih6SomFah18x0hXPiOBnEgr5WWZVzp6KupwPi7D5Jon5EbamnBK
   OrFZeLjyHv1SzWwkp2aBTtrQS5QUKPFIWK8C3CcZAYdv6xd2yuVi4gves
   Q==;
X-CSE-ConnectionGUID: 9remJQcoQ9KJwSwa85YXuA==
X-CSE-MsgGUID: amBBlAx6Q8i3hh1NfNQ1EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80146650"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80146650"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:40:35 -0700
X-CSE-ConnectionGUID: N+h68RMFSIWGPKHyvwlvEA==
X-CSE-MsgGUID: aFTXQAufQSuOslCzBirO/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="235924035"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:40:34 -0700
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
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
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v10 22/25] x86/virt/tdx: Reject updates during compatibility-sensitive operations
Date: Wed, 20 May 2026 06:38:25 -0700
Message-ID: <20260520133909.409394-23-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260520133909.409394-1-chao.gao@intel.com>
References: <20260520133909.409394-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A TDX module erratum can cause TD state corruption if a module update races
with a compatibility-sensitive operation. For example, if an update races
with TD build, the TD measurement hash may be corrupted, which can later
cause attestation failure.

Handle this by requesting the TDX module to detect such races during
TDH.SYS.SHUTDOWN and reject the update when one is found. Report the
failure to userspace as -EBUSY so the update can be retried.

The downside is that module updates can be blocked indefinitely if
compatibility-sensitive operations do not quiesce. In that case,
userspace must resolve the conflict and retry the update.

Do not pre-check whether the TDX module supports this race-detection
capability. If it does not, rely on the TDX module to reject module
shutdown.

== Alternatives ==

Two alternatives were considered and rejected [1]:

  a. Fail TD build when the race occurs. This would complicate KVM error
     handling and risk KVM uABI instability.

  b. Allow the issue to leak through. This would make the problem harder to
     detect and recover from.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Link: https://lore.kernel.org/linux-coco/aQIbM5m09G0FYTzE@google.com/ # [1]
---
v10:
 - Don't add a "dead" TDX_FEATURE0 bit [Sashiko]
 - s/BIT/BIT_ULL
---
 arch/x86/include/asm/tdx.h            |  5 +++--
 arch/x86/virt/vmx/tdx/tdx.c           | 30 ++++++++++++++++++++++++---
 drivers/virt/coco/tdx-host/tdx-host.c |  2 ++
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 5d750fe53669..282cb0e08b8e 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -29,8 +29,9 @@
 /*
  * TDX module SEAMCALL leaf function error codes
  */
-#define TDX_SUCCESS		0ULL
-#define TDX_RND_NO_ENTROPY	0x8000020300000000ULL
+#define TDX_SUCCESS			0ULL
+#define TDX_RND_NO_ENTROPY		0x8000020300000000ULL
+#define TDX_UPDATE_COMPAT_SENSITIVE	0x8000051200000000ULL
 
 /* Bit definitions of TDX_FEATURES0 metadata field */
 #define TDX_FEATURES0_NO_RBP_MOD	BIT_ULL(18)
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 55670365a388..0c5660c9ab45 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1274,11 +1274,14 @@ static __init int tdx_enable(void)
 }
 subsys_initcall(tdx_enable);
 
+#define TDX_SYS_SHUTDOWN_AVOID_COMPAT_SENSITIVE BIT_ULL(16)
+
 int tdx_module_shutdown(void)
 {
 	struct tdx_sys_info_handoff handoff = {};
 	struct tdx_module_args args = {};
 	int ret, cpu;
+	u64 err;
 
 	ret = get_tdx_sys_info_handoff(&handoff);
 	WARN_ON_ONCE(ret);
@@ -1288,9 +1291,30 @@ int tdx_module_shutdown(void)
 	 * module can produce and most likely supported by newer modules.
 	 */
 	args.rcx = handoff.module_hv;
-	ret = seamcall_prerr(TDH_SYS_SHUTDOWN, &args);
-	if (ret)
-		return ret;
+
+	/*
+	 * This flag tells the TDX module to reject shutdown if it races
+	 * with a "sensitive" ongoing operation. That eliminates exposure
+	 * to a TDX erratum which can corrupt TDX guest states.
+	 *
+	 * This flag is not supported by all TDX modules and may cause
+	 * the shutdown (and subsequent update procedure) to fail.
+	 */
+	args.rcx |= TDX_SYS_SHUTDOWN_AVOID_COMPAT_SENSITIVE;
+
+	err = seamcall(TDH_SYS_SHUTDOWN, &args);
+
+	/*
+	 * The shutdown ran into a "sensitive" ongoing operation. Signal
+	 * to userspace that it can retry.
+	 */
+	if ((err & TDX_SEAMCALL_STATUS_MASK) == TDX_UPDATE_COMPAT_SENSITIVE)
+		return -EBUSY;
+
+	if (err) {
+		seamcall_err(TDH_SYS_SHUTDOWN, err, &args);
+		return -EIO;
+	}
 
 	/*
 	 * Clear global and per-CPU initialization flags so the new module
diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
index b32ab595047f..291464490fe0 100644
--- a/drivers/virt/coco/tdx-host/tdx-host.c
+++ b/drivers/virt/coco/tdx-host/tdx-host.c
@@ -145,6 +145,8 @@ static enum fw_upload_err tdx_fw_write(struct fw_upload *fwl, const u8 *data,
 	case 0:
 		*written = data_len;
 		return FW_UPLOAD_ERR_NONE;
+	case -EBUSY:
+		return FW_UPLOAD_ERR_BUSY;
 	default:
 		return FW_UPLOAD_ERR_FW_INVALID;
 	}
-- 
2.52.0

