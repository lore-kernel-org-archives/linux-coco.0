Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1AB35E525
	for <linux-coco@lists.linux.dev>; Thu, 12 Feb 2026 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906984; cv=none; b=LPW8m7T9JyAvxHjWJ5P6/4iDcBJtgMAL+k7qvss4PYl3ETL/rK4EgvSQqo8oWwBwhSreP4DnM1sksgGMlOAt4BI0fa6exBQ0C1fMLsIhhE+bvRrlxf+x7sh7geln2IcQvqj4tfLnmwBjnoY4fADZXOJOk4tyrsYkFVx9Rcl6gtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906984; c=relaxed/simple;
	bh=2r9cr97Tz+Lrh0Y6z+9TxiztwOUTNH85MXSvARaFdJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MsV/Mp3rxcDq/iIiHhf+AWWt8UA93IRr4LJgmk2UvjECVW0ixjYALpy0aL5+6KiWL25rQAxWipx+tpHuWHm7G5e435kfDXkQ2BTyXrkkBOYR5YH6Qk4hCa2eO1A26y7cpmHC6ijcfSbmEFubqFL0DNpKozQddg5IphnzRVoleCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqBAa99I; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqBAa99I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770906980; x=1802442980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2r9cr97Tz+Lrh0Y6z+9TxiztwOUTNH85MXSvARaFdJ4=;
  b=SqBAa99InhzuVWvvN1U9voWr/VilMrlp7c8mYYaJrrliB6VHIEcUvh27
   g7wApvKAD+ekjk8YXdpsVp/Casa+UgmmC4KmzJoRdfBQVNk4uCld0wSIb
   noNwqJ4MSAi8SZaWwlmS/AOj9B0oF8tk+rbSMZN700czAAy66xu92SXN3
   GXtior/Jpn86a97zD1/j3ocxNoBmSbT2D0NbPW9HgZnC+ZJ9GchQ/VGRs
   CjVYmyHDhxL1eKijNraCwSW0LDJLMcytHIfEeICVHyZSzpqXdo+45sECV
   P9TKqaGeGq5GQwbnmW7K1xWVsowcTmrgcXzbx6iMiY36VI43e3z9SR5T7
   Q==;
X-CSE-ConnectionGUID: +3SSB19sRwuRh/Fv7iFdJw==
X-CSE-MsgGUID: 1iledo7UT0KR4di0PgllaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89662803"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="89662803"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:36:19 -0800
X-CSE-ConnectionGUID: iJAbKIW8SUCP2gFxTqOqjA==
X-CSE-MsgGUID: oqOvKpn7TnC7HTe1PpBS1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211428240"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:36:18 -0800
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	x86@kernel.org
Cc: reinette.chatre@intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	dan.j.williams@intel.com,
	yilun.xu@linux.intel.com,
	sagis@google.com,
	vannapurve@google.com,
	paulmck@kernel.org,
	nik.borisov@suse.com,
	zhenzhong.duan@intel.com,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	vishal.l.verma@intel.com,
	binbin.wu@linux.intel.com,
	tony.lindgren@linux.intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 08/24] x86/virt/seamldr: Block TDX Module updates if any CPU is offline
Date: Thu, 12 Feb 2026 06:35:11 -0800
Message-ID: <20260212143606.534586-9-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212143606.534586-1-chao.gao@intel.com>
References: <20260212143606.534586-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

P-SEAMLDR requires every CPU to call SEAMLDR.INSTALL during updates. So,
every CPU should be online during updates.

Check if all CPUs are online and abort the update if any CPU is offline at
the very beginning. Without this check, P-SEAMLDR will report failure at a
later phase where the old TDX module is gone and TDs have to be killed.

Hold cpus_read_lock to avoid races between CPU hotplug and TDX Module
updates.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 4d40b08f9bed..694243f1f220 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -6,6 +6,8 @@
  */
 #define pr_fmt(fmt)	"seamldr: " fmt
 
+#include <linux/cpuhplock.h>
+#include <linux/cpumask.h>
 #include <linux/mm.h>
 #include <linux/spinlock.h>
 
@@ -53,6 +55,12 @@ int seamldr_install_module(const u8 *data, u32 size)
 	if (WARN_ON_ONCE(!is_vmalloc_addr(data)))
 		return -EINVAL;
 
+	guard(cpus_read_lock)();
+	if (!cpumask_equal(cpu_online_mask, cpu_present_mask)) {
+		pr_err("Cannot update the TDX Module if any CPU is offline\n");
+		return -EBUSY;
+	}
+
 	/* TODO: Update TDX Module here */
 	return 0;
 }
-- 
2.47.3

