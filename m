Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F931E487
	for <linux-coco@lists.linux.dev>; Tue,  3 Mar 2026 00:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772496066; cv=none; b=i7wQFTZY/gXJkvE4m8mECtw7v6Hv3KnrZa8J3UPJkBWlRga5RygNtHogdYRskOP16NGrQb0Gc+C0QVCkrHZ3vvETT2hZeTZyqB1vQOpXyTmbUf3+MDJNBtwURXI1VCRIR5EPsa5T8n2FpiY4s3PBJL0s7sXeHMwUbS2sOMaBdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772496066; c=relaxed/simple;
	bh=o2Zu0c/3hllJMga2T4+P+5Si/OuA2BCSZAXmQcZT9J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dM+RmxuA2SfDSGm3LRcP3ju45mnS65mkE4GDN1ivrY4CU29583efzgXUonH24Ep9U4GqB7zlUxJFOOUsrxDu5QEsGvL4qGgqwXg5hsmjELPwD2YvrPVgpQ+BSOCu+QSay0Ur5hX3Lhgcoo9PEDOYRhXSITMRDucQo2p4azYgatg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQPltaAE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQPltaAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772496065; x=1804032065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o2Zu0c/3hllJMga2T4+P+5Si/OuA2BCSZAXmQcZT9J4=;
  b=ZQPltaAEfrYRSqhuYQzNbb1BeJ25Wy/cuYiYn6rBiosFrW9b5nfzNvE3
   J0LU2qnrRvc3NyY0PmRXpFBLhKisMfKqirzy154rDMEEdoyhi6fbJsX58
   cT2nqwcGHcmd8z8x/wPoIcE8WO1eBBksYAMkBO0c1/7XsOz6m8zlSm90+
   jL4JXXhsaSNdV0iDIJPZiLRc3d7lSHNn4bWcAwTFWcbY0pueNORMKNRa+
   9Q6TWk5m5BntmKQl973c6L3FS6AEiSDGIB72B7B8KMmEIAoxPCA3uLKpq
   VLpLC5zlkkSoIlgRsBuHi+ysUhC4knopUB8X23pTYYcM55l5I8Pj+Zn0p
   Q==;
X-CSE-ConnectionGUID: IBnd4NMuRXajqjWyk840Dw==
X-CSE-MsgGUID: SPGLSu/bQPqzakXXzofBvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73482960"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73482960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 16:00:58 -0800
X-CSE-ConnectionGUID: wMctE89/TmCkDvvyaCbuOw==
X-CSE-MsgGUID: n7/6zYUVSJKHn3etPd/d/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="214967112"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa006.fm.intel.com with ESMTP; 02 Mar 2026 16:00:57 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	aik@amd.com,
	aneesh.kumar@kernel.org,
	yilun.xu@linux.intel.com,
	bhelgaas@google.com,
	alistair23@gmail.com,
	lukas@wunner.de,
	jgg@nvidia.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 11/19] x86, dma: Allow accepted devices to map private memory
Date: Mon,  2 Mar 2026 16:01:59 -0800
Message-ID: <20260303000207.1836586-12-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303000207.1836586-1-dan.j.williams@intel.com>
References: <20260303000207.1836586-1-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the arrival of "accepted" devices, devices that have been enabled to
DMA to private encrypted memory, coherent DMA allocation no longer requires
page conversion. Update force_dma_unencrypted() to skip accepted devices.

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/mm/mem_encrypt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 95bae74fdab2..6d2972ff6ed8 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -20,10 +20,11 @@
 bool force_dma_unencrypted(struct device *dev)
 {
 	/*
-	 * For SEV, all DMA must be to unencrypted addresses.
+	 * Require unencrypted DMA unless the device has been "accepted",
+	 * enabled by a TSM driver to DMA to private encrypted memory.
 	 */
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
-		return true;
+		return !device_cc_accepted(dev);
 
 	/*
 	 * For SME, all DMA must be to unencrypted addresses if the
-- 
2.52.0

