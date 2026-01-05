Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57C2D9494
	for <linux-coco@lists.linux.dev>; Mon,  5 Jan 2026 07:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599036; cv=none; b=FL2Rbn42C5pbv9GYN7l5KOlBr2c/YaRSbfmwrtodzRSJ+X3BdybxDYlEi5o3T8F7WA2MvK80wL7KP6olaqvVU37p4CLe55S4CZzR40QtK0unvCiXBTHZFPIzAJMjVeeRAHSSeMVE6Yz0OLPcR0wtsl7aE8/KjsxUiGrl7ddgvbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599036; c=relaxed/simple;
	bh=wdW74S61SCgSttb2rGhh+LvM7ykrIQN7oR9lhODs13E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sitS/Nsh5sdiStYjm0WHNLzdT7nFKp45T0uaQslMLe1hjYU9Q9Spq5Pnn/XK7E3FvCgfL5NKsG8+DFffTSqlAqe778S5rYqFqUUBhf9n6NJ5trHaByqbLk07pJpO3qqOuIo3qSuJhcjNbn1sdjc1JfvWW2X2HDcdpHOswohj/Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2+GSLNl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2+GSLNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767599035; x=1799135035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wdW74S61SCgSttb2rGhh+LvM7ykrIQN7oR9lhODs13E=;
  b=g2+GSLNlbZI9YUWIcn63dp9TpH1TD7+PN0nmWww43HaYSHSragwps9XU
   3kGwMzaLO/VxNT9RZG29A7ovDePWP8U3lTpk1fYXAp3zIYBOThM+mTM1O
   5V4VL0IOOBi9ETi3aGmTt8tyXuS+QRZZXY+PzVxV8DVjyNh5+D7dDY6Hd
   YsUYTPZ8yR7na36uUW26Xxc8QjKajv11y5nB+GW4kafNOKlnZnj/IzUXK
   E94WI1fuf3cpbpFkWiVsi0m05Qc5GIze2Pm/i5xmMDUzRjBngpHzyR2wA
   Up3Vdm08+MJ+AV/9l2H33ZO0Xu5LntSzcAiGN+fhu5Jkd0We3Sq/Vkzf+
   Q==;
X-CSE-ConnectionGUID: Ovu9ctsnS5y89cmKOEiwdQ==
X-CSE-MsgGUID: UR63nLzvTdO6QcvhaZ/CNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69012563"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="69012563"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 23:43:53 -0800
X-CSE-ConnectionGUID: tt/4A70hToWxwApQ7pPziQ==
X-CSE-MsgGUID: J6naa9QWTcez840mWTp/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="239799056"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 23:43:53 -0800
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [PATCH v2 1/3] x86/virt/tdx: Retrieve TDX Module version
Date: Sun,  4 Jan 2026 23:43:44 -0800
Message-ID: <20260105074350.98564-2-chao.gao@intel.com>
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

Each TDX Module is associated with a version in the x.y.z format, where x
represents the major version, y the minor version, and z the update
version. Knowing the running TDX Module version is valuable for bug
reporting and debugging.

Retrieve the TDX Module version using the existing metadata reading
interface, in preparation for exposing it to userspace via sysfs.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
v2:
 - Remove all descriptions about autogeneration (Rick)
 - TDH.SYS.RDALL isn't worth the code churn. So, stick with TDH.SYS.RD
 (Dave/Yilun)

 arch/x86/include/asm/tdx_global_metadata.h  |  7 +++++++
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/x86/include/asm/tdx_global_metadata.h b/arch/x86/include/asm/tdx_global_metadata.h
index 060a2ad744bf..40689c8dc67e 100644
--- a/arch/x86/include/asm/tdx_global_metadata.h
+++ b/arch/x86/include/asm/tdx_global_metadata.h
@@ -5,6 +5,12 @@
 
 #include <linux/types.h>
 
+struct tdx_sys_info_version {
+	u16 minor_version;
+	u16 major_version;
+	u16 update_version;
+};
+
 struct tdx_sys_info_features {
 	u64 tdx_features0;
 };
@@ -35,6 +41,7 @@ struct tdx_sys_info_td_conf {
 };
 
 struct tdx_sys_info {
+	struct tdx_sys_info_version version;
 	struct tdx_sys_info_features features;
 	struct tdx_sys_info_tdmr tdmr;
 	struct tdx_sys_info_td_ctrl td_ctrl;
diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
index 360963bc9328..85ab17b36c81 100644
--- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
+++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
@@ -7,6 +7,21 @@
  * Include this file to other C file instead.
  */
 
+static __init int get_tdx_sys_info_version(struct tdx_sys_info_version *sysinfo_version)
+{
+	int ret = 0;
+	u64 val;
+
+	if (!ret && !(ret = read_sys_metadata_field(0x0800000100000003, &val)))
+		sysinfo_version->minor_version = val;
+	if (!ret && !(ret = read_sys_metadata_field(0x0800000100000004, &val)))
+		sysinfo_version->major_version = val;
+	if (!ret && !(ret = read_sys_metadata_field(0x0800000100000005, &val)))
+		sysinfo_version->update_version = val;
+
+	return ret;
+}
+
 static __init int get_tdx_sys_info_features(struct tdx_sys_info_features *sysinfo_features)
 {
 	int ret = 0;
@@ -89,6 +104,7 @@ static __init int get_tdx_sys_info(struct tdx_sys_info *sysinfo)
 {
 	int ret = 0;
 
+	ret = ret ?: get_tdx_sys_info_version(&sysinfo->version);
 	ret = ret ?: get_tdx_sys_info_features(&sysinfo->features);
 	ret = ret ?: get_tdx_sys_info_tdmr(&sysinfo->tdmr);
 	ret = ret ?: get_tdx_sys_info_td_ctrl(&sysinfo->td_ctrl);
-- 
2.47.3

