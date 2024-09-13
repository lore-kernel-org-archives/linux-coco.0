Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE4D7F9
	for <linux-coco@lists.linux.dev>; Fri, 13 Sep 2024 00:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187157; cv=none; b=mcgNT5sEmpoA5vhAxmnuazLuZob6mHso0DJPVrbljko29dm6uS8+NbYLawmVa8TzVtY9UdaP4fXYEvgVBb91Ic5T9aHqKO/k7VkZ34W8DJbToMw+MZDw6fpy3Zbj6nJiTLp8DFpmGJ6jzodWQ0CecJ+jkRB8+NlaQMfvDQQCoZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187157; c=relaxed/simple;
	bh=7i4/iuSEYlj3G9SZEbswUqLoQtCPz9lwjwTG+V72Sow=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=Nn+P0NkWfJ9UrnzYwYp4Tcuvg7n9g+O2I0baPKeSoYllgrvp1N8RhoZyoUy8vqz9kRcDB8HWuoLBGMsJmVkjLFTpukZUWIa2LFE57ZNkIZZHzIr1aAYeFPHdyGjnUj+/iGkS3EMGD744qviTRw/hI2ZEOFr8ZWui5UNSTiZ6ygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMXJwx2o; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMXJwx2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726187155; x=1757723155;
  h=subject:from:to:cc:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7i4/iuSEYlj3G9SZEbswUqLoQtCPz9lwjwTG+V72Sow=;
  b=mMXJwx2ox87psASFwWuIawwBUIt20Pmg3yajsBnMaCn9UzwRqWcScFpz
   wL+BwD66+wzqtHy0L7lHwt6Xac5/HWL7V8rCJ/h8jQLUhxJJXy9aY1rDj
   Xl+WfR1sjCLm9qcX5+UUpPuhCbGthA4Y2CwLfm2XeDCGzvYGQUAGV24P/
   0x+W082t5yGYkYw+g0i1crgbDnq+zE58yG8ZmdZ5o7NprBBi1JtlOZEgY
   r7GMgsDieBkubOwjCFL1hLxagfh6Twp+JUrg8KFZpn6XvcZGY0zngOsru
   47/jEwH0Ssvx+LMJhxKpDGgey/RzoAonk13gPtRDtRhjhEt2gDM2rE+BA
   g==;
X-CSE-ConnectionGUID: x2pOtv9hRj22cK14SdAgKA==
X-CSE-MsgGUID: rqo7lHNoS1u2eOU40q2LFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25172938"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="25172938"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 17:25:55 -0700
X-CSE-ConnectionGUID: rIUvdCsATL64W43gwacX9A==
X-CSE-MsgGUID: 2FFEkiR5SIC3zh/RtAFBhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="98577377"
Received: from inaky-mobl1.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.125.108.106])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 17:25:54 -0700
Subject: [PATCH 0/4] configfs-tsm-report: TCB Stability
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Kai Huang <kai.huang@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Borislav Petkov \(AMD\)" <bp@alien8.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@rivosinc.com>,
 Wu Hao <hao.wu@intel.com>, Michael Roth <michael.roth@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Yilun Xu <yilun.xu@intel.com>,
 Alexey Kardashevskiy <aik@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 elena.reshetova@intel.com, pgonda@google.com
Date: Thu, 12 Sep 2024 17:25:52 -0700
Message-ID: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

As detailed in patch4, the TDX Module update capability has raised the
question  "what is the kernel's responsibility for mitigating 'surprise'
updates to a confidential VM's launch attestation?".

The approach taken in this patch set is to move it from an implicit
policy of the platform technology and hosting provider to an explicit
policy selected by the confidential VM kernel. Specifically, add
enumeration and choice so that the problem can be discussed in terms of
a TCB stability policy.

See patch4 for more details. Patches 1-3 are preparatory work for
building new guest-side "tsm" functionality.

This is untested for now, the initial focus for review is arriving at a
cross-vendor consensus view of the "surprise update" problem. Then
follow-up with finalizing the low-level details.

Note this is v6.13 material at the earliest, i.e. not for the imminent
merge window.

---

Dan Williams (4):
      configfs-tsm: Namespace TSM report symbols
      coco/guest: Move shared guest CC infrastructure to drivers/virt/coco/guest/
      x86/tdx: Introduce guest global metadata retrieval infrastructure
      configfs-tsm-report: Introduce TCB stability enumeration and watchdog


 Documentation/ABI/testing/configfs-tsm-report |   41 +++++++++
 MAINTAINERS                                   |    4 -
 arch/x86/coco/tdx/tdx.c                       |   39 ++++++++
 arch/x86/include/asm/shared/tdx.h             |    9 ++
 drivers/virt/coco/Kconfig                     |    6 -
 drivers/virt/coco/Makefile                    |    2 
 drivers/virt/coco/guest/Kconfig               |   72 ++++++++++++++++
 drivers/virt/coco/guest/Makefile              |    4 +
 drivers/virt/coco/guest/report.c              |  115 ++++++++++++++++++++++---
 drivers/virt/coco/guest/watchdog.c            |   59 +++++++++++++
 drivers/virt/coco/guest/watchdog.h            |   40 +++++++++
 drivers/virt/coco/sev-guest/sev-guest.c       |   12 +--
 drivers/virt/coco/tdx-guest/tdx-guest.c       |   15 ++-
 include/linux/tsm.h                           |   29 ++++--
 14 files changed, 403 insertions(+), 44 deletions(-)
 rename Documentation/ABI/testing/{configfs-tsm => configfs-tsm-report} (75%)
 create mode 100644 drivers/virt/coco/guest/Kconfig
 create mode 100644 drivers/virt/coco/guest/Makefile
 rename drivers/virt/coco/{tsm.c => guest/report.c} (79%)
 create mode 100644 drivers/virt/coco/guest/watchdog.c
 create mode 100644 drivers/virt/coco/guest/watchdog.h

base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
