Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6AE412BF2
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223120; cv=none; b=Tp1WLrIKopARHp3Z4FSjOMqjZ14EtPS+Vf1C+TQ5D/xdv6uDiiU+vxubWm4uiWaY+slF4IC1oG5zUdHfPXA5DnFICtoJQXfEqp8XKemI91ndObeUXd7ih/7jR9xYX3S969IJ9o+H9lqMgVpqU9OW0dkr/2smvSDZE12HxsvUulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223120; c=relaxed/simple;
	bh=KxGOgO/oHuKBzXRk20V8hJ+nLCjV1WKJz0A4Gosb6W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hq3UnMAyJ8l056Sw9YZKza/oBev/B19U8R+UZDLyE3I2w/3cAA67jiW6odud/MKs6w+HWuwT3gZKJ++qqJ+5SUC8wCOS0+pNJPLaNbDWRdo06ATkKHUt2VF9fh1iPN4uXwgEtQv+VYf+3yd3+fcM3aRBcOw7N8tGEUZu5TtPXDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYeAbULP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYeAbULP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223118; x=1821759118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KxGOgO/oHuKBzXRk20V8hJ+nLCjV1WKJz0A4Gosb6W4=;
  b=LYeAbULPYONfuLs+GSanCALrQOYkrCe7r/Aiec/wxNPfpawBf3TUCY9n
   IATxMhp8I6GvpRLtHnq8dnh1MFVAehFFYv9Mfz7280amQJgRaZ1Mnr56v
   uQxEAKhvkiRDZxj9agc4un+CYNqCUtBfwPvb9UqUH+dV+wRYXViC1krNj
   IR1OzgJwt/g0t9Rh7KftJ9LgxKRCcHtFScZYwZ9x8n73QOPi2g3JvfOJC
   YlDFIDBfNYOXhnulb8CtVQEz+BX8bpCrPKnkgm2JFBhfGcKyxF0raDNnu
   GmWVvwxHNIyfDC4zafL6GXwiVj9PHEwTLgamC6DHHC50U5170Kme7TnT4
   w==;
X-CSE-ConnectionGUID: b1EUE7ACQCyZ/5qHuI8s1A==
X-CSE-MsgGUID: n/rIiUuRT2CDsDvc6aS1gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002580"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002580"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:57 -0700
X-CSE-ConnectionGUID: SJ7MdlvOSkCH8/zje2YpIQ==
X-CSE-MsgGUID: NGj2BS5pS9afVwhmjQdi7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009495"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:53 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@intel.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	jgg@nvidia.com,
	nicolinc@nvidia.com,
	aik@amd.com,
	aneesh.kumar@kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	yilun.xu@linux.intel.com,
	chao.gao@intel.com,
	vishal.l.verma@intel.com,
	xiaoyao.li@intel.com,
	kevin.tian@intel.com,
	chao.p.peng@intel.com
Subject: [RFC PATCH 14/15] x86/tdx: Add TDG.DMAR.ACCEPT module call wrapper for TDX Connect
Date: Thu, 24 Sep 2026 12:10:31 +0800
Message-ID: <20260924041032.1096569-15-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TDG.DMAR.ACCEPT updates the PASID table entry of the TDI as present to
allow DMA access to the TD private memory.

For TDG.DMAR.ACCEPT, the R8-R15 input registers are reserved and must
be zero. Use a zero-initialized argument structure with __tdcall_saved()
so the complete TDCALL input register set is loaded with the required
values.

Translate TDX module return codes into Linux errno values.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 arch/x86/coco/tdx/tdx_connect.c   | 28 ++++++++++++++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |  1 +
 arch/x86/include/asm/tdx.h        |  1 +
 3 files changed, 30 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx_connect.c b/arch/x86/coco/tdx/tdx_connect.c
index 3ef10b1df401..a03b1da9a52a 100644
--- a/arch/x86/coco/tdx/tdx_connect.c
+++ b/arch/x86/coco/tdx/tdx_connect.c
@@ -136,3 +136,31 @@ int tdx_mcall_tdi_start(u64 func_id, u64 exp_bind_session)
 	return tdx_mcall_tdi_to_errno(ret);
 }
 EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_tdi_start, "tdx-guest");
+
+/**
+ * tdx_mcall_dmar_accept() - Accept PASID table entry of a TDI instance
+ * @func_id: Function identifier specifying the TDI instance
+ * @target: DMAR target, 0 for non-partitioned TD or L1, 1-3 for L2 VM1-VM3,
+ *          other value reserved
+ *
+ * Update the PASID table entry of the TDI to mark the DMA Remapping (DMAR)
+ * state as present, allowing DMA access to the TD private memory.
+ *
+ * Return 0 on success, -ENXIO for invalid operands, -EBUSY for busy operation,
+ * -ENODEV for TDI not present or invalid metadata, or -EIO on other TDCALL failures.
+ */
+int tdx_mcall_dmar_accept(u64 func_id, u64 target)
+{
+	struct tdx_module_args args = {
+		.rcx = func_id,
+		.rdx = target,
+	};
+	u64 ret;
+
+	ret = __tdcall_saved(TDG_DMAR_ACCEPT, &args);
+	if (!ret)
+		return 0;
+
+	return tdx_mcall_tdi_to_errno(ret);
+}
+EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_dmar_accept, "tdx-guest");
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index 90f2842f4253..01387f6b24b3 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -22,6 +22,7 @@
 #define TDG_VM_WR			8
 #define TDG_TDI_READ			67
 #define TDG_TDI_START			68
+#define TDG_DMAR_ACCEPT			70
 #define TDG_MMIO_ACCEPT			71
 
 /* TDX TD attributes */
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 787b3039ef5a..118cc58cc909 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -157,6 +157,7 @@ u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector);
 int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *value);
 int tdx_mcall_mmio_accept(u64 func_id, u64 index, u32 pg_offset, u32 page_cnt, phys_addr_t gpa);
 int tdx_mcall_tdi_start(u64 func_id, u64 exp_bind_session);
+int tdx_mcall_dmar_accept(u64 func_id, u64 target);
 #endif
 
 void __init tdx_dump_attributes(u64 td_attr);
-- 
2.52.0

