Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0354D24CEEA
	for <linux-coco@lists.linux.dev>; Mon, 17 Nov 2025 02:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763347085; cv=none; b=uTjXB7LSXvDZNY1bEbSOuA8Uyd8smqt9JTpbD4yrt3LHa8FDYT7Tqp0TELnxDEdmUZumocC5XA0jHmX8bNMZO45VfPrcavWCD984/p2XbkhYnnZzviiTYE5xzR9SYfXnmwTCmJqa7TULWYyp+xa1lKu+swq6PZZAohtq1dQhzjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763347085; c=relaxed/simple;
	bh=Yx3UoTg77RNoOBjEMsXwi0MOi5FgyZgQj/8rtnwvRic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WF2Fdg4mbVu66iPDZL/uxjjykYRnLjPz7KnYkM5iX2VNLU0Pj3vDcrUA1zjVkaVkLH0UxGsDfieoJ5a5NC3YMD7aCLe/xLxdmwZU036OBBAhQKGydz+W4OWSUTb+Sd8F7tfNgzCg5EBNW/52narp1cFN4Ashez9UmZXotUdRARM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RghWZVTZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RghWZVTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763347083; x=1794883083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yx3UoTg77RNoOBjEMsXwi0MOi5FgyZgQj/8rtnwvRic=;
  b=RghWZVTZbTc3z+q3N3joFsWlMih1nnaG/35PqpYmpoAwZx3pMSt3d++A
   JjxjU4M/7csW/CbxpeXRoO4bn0aqDH1v5VJt2ey2SVjj4Yo7pqjQVEBYA
   Lidy7WSlBHPBrSB9ATIlY6mIii0JLnYDOeD0FZ/qQqZtyOcpkNdom5TuM
   eUm5FY7oC9dcl8KnWD3r5U9ohYefKN9wWDLhvw/6isvzVZ/FpWY6/ylyg
   UvQ/aJGn1fXvlrY3VVPUenomeZFuMveVwgiY5YNzxvwWJXdkZHnl8rnrB
   gKJyrK65QbUJbNW8MPR+3S9q25h2DX1Uo1hJ8RjD36ch+Huz7y9tBtIuj
   Q==;
X-CSE-ConnectionGUID: IiQDbW0ZSqCth1fVYgAR5A==
X-CSE-MsgGUID: hJNu5T6OQj6uBk2kXkDeew==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82729497"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="82729497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 18:38:03 -0800
X-CSE-ConnectionGUID: 2Z3gRmQjQqy8u8byQ7CWHA==
X-CSE-MsgGUID: QNCUAvsDROqJ7YmFKfb62Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="227658109"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2025 18:37:59 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: chao.gao@intel.com,
	dave.jiang@intel.com,
	baolu.lu@linux.intel.com,
	yilun.xu@linux.intel.com,
	yilun.xu@intel.com,
	zhenzhong.duan@intel.com,
	kvm@vger.kernel.org,
	rick.p.edgecombe@intel.com,
	dave.hansen@linux.intel.com,
	dan.j.williams@intel.com,
	kas@kernel.org,
	x86@kernel.org
Subject: [PATCH v1 02/26] x86/virt/tdx: Move bit definitions of TDX_FEATURES0 to public header
Date: Mon, 17 Nov 2025 10:22:46 +0800
Message-Id: <20251117022311.2443900-3-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
References: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move bit definitions of TDX_FEATURES0 to TDX core public header.

Kernel users get TDX_FEATURE0 bitmap via tdx_get_sysinfo(). It is
reasonable to also public the definitions of each bit. TDX Connect
will add new bits and check them in tdx-host module.

Take the oppotunity to change its type to BIT_ULL cause tdx_features0
is explicitly defined as 64 bit in both TDX Module Specification and
TDX core code.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/include/asm/tdx.h  | 4 ++++
 arch/x86/virt/vmx/tdx/tdx.h | 3 ---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index a149740b24e8..b6961e137450 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -146,6 +146,10 @@ static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
 #define seamcall_ret(_fn, _args)	sc_retry(__seamcall_ret, (_fn), (_args))
 #define seamcall_saved_ret(_fn, _args)	sc_retry(__seamcall_saved_ret, (_fn), (_args))
 const char *tdx_dump_mce_info(struct mce *m);
+
+/* Bit definitions of TDX_FEATURES0 metadata field */
+#define TDX_FEATURES0_NO_RBP_MOD	BIT_ULL(18)
+
 const struct tdx_sys_info *tdx_get_sysinfo(void);
 
 int tdx_guest_keyid_alloc(void);
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index dde219c823b4..4370d3d177f6 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -84,9 +84,6 @@ struct tdmr_info {
 	DECLARE_FLEX_ARRAY(struct tdmr_reserved_area, reserved_areas);
 } __packed __aligned(TDMR_INFO_ALIGNMENT);
 
-/* Bit definitions of TDX_FEATURES0 metadata field */
-#define TDX_FEATURES0_NO_RBP_MOD	BIT(18)
-
 /*
  * Do not put any hardware-defined TDX structure representations below
  * this comment!
-- 
2.25.1

