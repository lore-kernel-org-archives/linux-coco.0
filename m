Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB3B314A9A
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291767; cv=none; b=HcIuEaGWV5nXmoMojhCIl+SGkpDhnOhf4W7/m7A7rmIZA1C4w2dtVyI+K+szJ2wAue/7oE5+oTSkxb++6DRdJH/SEeyie1R+IzAZYiPoBYqwJq4BHCsAbsay96h4LH+gWMbWJu3HqWlwo+MqjHcx468nupJeAR1HO40uVjjsfrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291767; c=relaxed/simple;
	bh=Wf140bUYMuvWmLegSAfiHi4jwPQqHXipglSAal1VBI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6CfBJ+Ip/4m6lXGq/Cntgwk2JdabKLEkLoq1U6yIGkn+xXieLy3z36uxWRPomtRiCPnytDZ4lvlAa9fL6KERbSF8uj4MbEU4f6I4Ajms9nElwxU1DTa1BIxXRIvE6xu3kpU5TfmG3EqqdcFJWmxkQgJ/h5hYfnxOfPiJgTsbAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzaqlj1U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzaqlj1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291766; x=1789827766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wf140bUYMuvWmLegSAfiHi4jwPQqHXipglSAal1VBI8=;
  b=kzaqlj1U4wB2hX6v/dxbhzVFhTvbWoBh1eN4PJC5ibOUzz8HaOdki9Bh
   J2ef5x4ZnZsxH/i6eirEJHgIm/+O8quIVnuO2aViYG2gMg+HY4Q8Nrxcs
   ROsPsTrWS9Z4BPNEodK6oL7QngrqptR2bRtIBYykxENsOfI8KegogT9RF
   O7JO4ZBxCPRx6gRWbvxR96Wmz065JGIp5/scuJTiAPN2p7zComU2VPSY1
   eNTM3PQf3Vc7l5HlWxXrT9TbyROn54aoSCeTJnvFB5j4VtqTIVuESeBI4
   S4JjPZKFEg/5YwVD3VaIPMOfGdvHxa7GntzQ8xU0Xqhs7GeA9nt5KT570
   g==;
X-CSE-ConnectionGUID: FKzWcYYDTLeMPuVLI+qzeg==
X-CSE-MsgGUID: 1Rvg1iSDQ/e+dTjDTJIAuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60750557"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60750557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:22:39 -0700
X-CSE-ConnectionGUID: Bqy7T1DwRO20/LSQhqFzjw==
X-CSE-MsgGUID: niQdgvIcSKeCugN4xfvQ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176655044"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 07:22:39 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: xin@zytor.com,
	chao.gao@intel.com,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [RFC PATCH 17/27] iommu/vt-d: Export a helper to do function for each dmar_drhd_unit
Date: Fri, 19 Sep 2025 07:22:26 -0700
Message-ID: <20250919142237.418648-18-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919142237.418648-1-dan.j.williams@intel.com>
References: <20250919142237.418648-1-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xu Yilun <yilun.xu@linux.intel.com>

Enable the tdx-host module to get VTBAR address for every IOMMU device.
The VTBAR address is for TDX Module to identify the IOMMU device and
setup its trusted configuraion.

Suggested-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/iommu/intel/dmar.c | 16 ++++++++++++++++
 include/linux/dmar.h       |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 3ae177463774..222d66bff80a 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -2429,3 +2429,19 @@ bool dmar_platform_optin(void)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dmar_platform_optin);
+
+int do_for_each_drhd_unit(int (*fn)(struct dmar_drhd_unit *))
+{
+	struct dmar_drhd_unit *drhd;
+	int ret;
+
+	guard(rwsem_read)(&dmar_global_lock);
+
+	for_each_drhd_unit(drhd) {
+		ret = fn(drhd);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(do_for_each_drhd_unit);
diff --git a/include/linux/dmar.h b/include/linux/dmar.h
index 692b2b445761..f4ca8e0c67e5 100644
--- a/include/linux/dmar.h
+++ b/include/linux/dmar.h
@@ -86,6 +86,8 @@ extern struct list_head dmar_drhd_units;
 				dmar_rcu_check())			\
 		if (i=drhd->iommu, 0) {} else 
 
+extern int do_for_each_drhd_unit(int (*fn)(struct dmar_drhd_unit *));
+
 static inline bool dmar_rcu_check(void)
 {
 	return rwsem_is_locked(&dmar_global_lock) ||
-- 
2.51.0

