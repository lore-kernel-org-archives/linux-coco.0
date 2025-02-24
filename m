Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BCB1A9B58
	for <linux-coco@lists.linux.dev>; Mon, 24 Feb 2025 03:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740367324; cv=none; b=BJaL1JMrx2YfDZuCuFTmLmP7uPfwrI/kxgfzZX6gze2IsqFp0cMjX0bqIzu/EHnlHlgvCZirH91ZH85/cZf2rSjqEB0qmgBz+VkblvB03l6t1oF8MTxcbBSr5jeTK5iGA7cixOBYmmNkEksV2AVBE7xY7bdNbzsY2YBIM8atQ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740367324; c=relaxed/simple;
	bh=d0Uj/eW5auCeTrt67O6QsIjiCKxsA548qeiiLvbRFeY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sxJxMKqzwpZS7NiFKM+Ufgsm4lzYfuLurM9oPkz5zT4NIoXhB9yKhxCzOThRHhyaaixpLpIlVG3zLOWIunC8n5OYCrPwoBGk3Va3SjSGDWCDuY/eTtFxVHcZtai/mg6P3wwXukxqXCpcRaqHBxtXgbPm1tiyacBWAeDFCQZeiRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RA0fvHFO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RA0fvHFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740367323; x=1771903323;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=d0Uj/eW5auCeTrt67O6QsIjiCKxsA548qeiiLvbRFeY=;
  b=RA0fvHFObAMZJsq/jivdxKAG6g0ZNPIwd7scNEjrfT9Fhp6Uwpf5Qsb/
   0+QhFhaNuhhnXQh/LWaOn/AkrHr3wxXA7Ix91WpTmquO7wrMoCOQndfzD
   ANkFxvfJHA9P4qVNN+1PtEU4azVomlzQQMC1FtjNP7SaQPiPsDI7m2syB
   C4L4MGWHQp1aOYur3AaJbki92483Omcj8eaFtHMEatWZrJfDNksOUz2ok
   Ib0QWYICc8UltzR6P2RjqbvFTGePTvQFx1lv7qLcD6FsGMFMiI5TeAKe4
   bx10RBxxGikUa+LZZvpbmsgmjWPkzQsDLzK53kQt3tjDr66mdTLHLbS6V
   A==;
X-CSE-ConnectionGUID: 7s/hoHWgTM+Yjo1In5hsMA==
X-CSE-MsgGUID: vWbywLK8R1COK98Af3r4iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="28706901"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="28706901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 19:21:56 -0800
X-CSE-ConnectionGUID: ORB4cfTHRMiHsybMA70dhA==
X-CSE-MsgGUID: C3G79V4qTKWklxNS/o3dMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116441899"
Received: from shanagud-mobl.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.117.251])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 19:21:13 -0800
From: Cedric Xing <cedric.xing@intel.com>
Subject: [PATCH v2 0/4] tsm: Unified Measurement Register ABI for TVMs
Date: Sun, 23 Feb 2025 21:20:11 -0600
Message-Id: <20250223-tdx-rtmr-v2-0-f2d85b0a5f94@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvlu2cC/0XMQQrCMBCF4auUWRtJxiQlrryHdCHtaAdsK5MQK
 iV3NxbB5f94fBtEEqYI52YDocyRl7kGHhrox9v8IMVDbUCNTqMOKg2rkjSJQudsG7xvjfVQ7y+
 hO687de1qjxzTIu9dzua7/hCDfyQbpVVogxt6G8ic8MJzouexXyboSikfgXKOdKAAAAA=
To: Dan Williams <dan.j.williams@intel.com>, 
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
 Dionna Amalie Glaze <dionnaglaze@google.com>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Dan Middleton <dan.middleton@linux.intel.com>, 
 Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: b4 0.13.0

NOTE: This patch series introduces the Measurement Register (MR) ABI, and
is a continuation of the RFC series on the same topic [1].

This patch series adds a unified interface to the TSM core, allowing TVM
(TEE VM) guest drivers to expose measurement registers (MRs) as attributes
(files) in sysfs. With this interface, applications can read and write
(extend) MRs like regular files, enabling usages like configuration
verification (e.g., verifying a TVM's configuration against digests stored
in static/immutable MRs like MRCONFIGID on TDX or HOSTDATA on SEV) and
runtime measurements (e.g., extending the measurement of a container image
to an RTMR before running it).

Patches included in this series:

- Patch 1 adds TSM APIs for TVM guest drivers to register/expose MRs
  through sysfs.
- Patch 2 provides a sample module demonstrating the usage of the new TSM
  APIs.
- The remaining patches update the TDX guest driver to expose TDX MRs
  through the new TSM APIs.

[1]: https://lore.kernel.org/linux-coco/20241210-tsm-rtmr-v3-0-5997d4dbda73@intel.com/

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
Changes in v2:
- Added TSM_MR_MAXBANKS Kconfig option
- Updated Kconfig dependency for TSM_REPORTS
- Updated comments in include/linux/tsm.h
- Updated drivers/virt/coco/tsm-mr.c to use `IS_BUILTIN()` for determining
  if static buffer addresses can be converted to GPAs by `virt_to_phys()`
- Renamed function `tdx_mcall_rtmr_extend()` -> `tdx_mcall_extend_rtmr()`
- Link to v1: https://lore.kernel.org/r/20250212-tdx-rtmr-v1-0-9795dc49e132@intel.com

---
Cedric Xing (4):
      tsm: Add TVM Measurement Register support
      tsm: Add TSM measurement sample code
      x86/tdx: Add tdx_mcall_extend_rtmr() interface
      x86/tdx: Expose TDX MRs through TSM sysfs interface

 Documentation/ABI/testing/sysfs-kernel-tsm |  20 ++
 MAINTAINERS                                |   3 +-
 arch/x86/coco/tdx/tdx.c                    |  36 +++
 arch/x86/include/asm/shared/tdx.h          |   1 +
 arch/x86/include/asm/tdx.h                 |   2 +
 drivers/virt/coco/Kconfig                  |  17 +-
 drivers/virt/coco/Makefile                 |   2 +
 drivers/virt/coco/tdx-guest/Kconfig        |  24 +-
 drivers/virt/coco/tdx-guest/tdx-guest.c    | 115 +++++++++
 drivers/virt/coco/{tsm.c => tsm-core.c}    |   6 +-
 drivers/virt/coco/tsm-mr.c                 | 383 +++++++++++++++++++++++++++++
 include/linux/tsm.h                        |  65 +++++
 samples/Kconfig                            |  13 +
 samples/Makefile                           |   1 +
 samples/tsm/Makefile                       |   2 +
 samples/tsm/tsm_mr_sample.c                | 107 ++++++++
 16 files changed, 789 insertions(+), 8 deletions(-)
---
base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
change-id: 20250209-tdx-rtmr-255479667146

Best regards,
-- 
Cedric Xing <cedric.xing@intel.com>

