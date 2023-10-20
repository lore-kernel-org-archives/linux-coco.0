Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC07C377
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 01:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYu3yG9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697764587; x=1729300587;
  h=subject:from:to:cc:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hiHinDXkbtgILpqX4ry34DWzM1JI1SB5votyccaPDW4=;
  b=fYu3yG9DqB/dfiIK+K0jQdWX+Q/Ao5bYaAGrAKCtGpX/JLs3sc2DsVfK
   jRzTGeujgx9bR7VHVbIC8/sS+ptrPlStA6HMaLHuhKJP2Kywc0bNJZprk
   VR8s4/hwW+m4FPmjeP9mqt+Clv/EklSF4jgnC4PVpxBlvwEzSGGL87BpA
   F+xpfsl0Ld+zf6G5H0WcnJ+lgGetmMbb6hz1Dupfnc6SNs5Q3hk4Z8Pgp
   hInClw8paakAeTdDZ6ltwtgqIv/LfQo1ynPyHQb/XBsUPjzgh7Nx9oa0A
   9YVPctl2wYMtMs9zB4O1h9MdFo5AI7tqGhwv06j73qz3USZ6j7xchfDo4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452886009"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="452886009"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 18:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733793429"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="733793429"
Received: from hilldani-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.27.118])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 18:16:26 -0700
Subject: [PATCH v7 0/7] configfs-tsm: Attestation Report ABI
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Erdem Aktas <erdemaktas@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Peter Gonda <pgonda@google.com>,
 Borislav Petkov <bp@alien8.de>, Dionna Amalie Glaze <dionnaglaze@google.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@rivosinc.com>,
 Dionna Glaze <dionnaglaze@google.com>, Pankaj Gupta <pankaj.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexey Kardashevskiy <aik@amd.com>, Andrew Morton <akpm@linux-foundation.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 dave.hansen@linux.intel.com, x86@kernel.org
Date: Thu, 19 Oct 2023 18:16:25 -0700
Message-ID: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Changes since v6 [1]:
- s/sev-guest/sev_guest/ in Documentation (Alexey)
- s/tdx-guest/tdx_guest/ in Documentation (Alexey)
- Check for ops registration in tsm_report_read() (Alexey)
- Reorder declaration of tsm_report_extra_attr and
  tsm_report_extra_bin_attrs to make it clear they are supersets of
  their "non-extra" versions (Alexey)
- s/ext/extra/ (Alexey)
- Move tsm_report_group declaration closer to its usage (Alexey)
- Convert from int to unsigned int (multiple locations) (Alexey)
- Drop device.h include (Alexey)
- Move SNP_REPORT_INVALID_{PARAM,KEY} definitions to sev_ret_code values
  (Alexey)
- Use guid_is_null() and explicit offset and length checks to detect
  empty entries (Alexey)
- Replace magic number 64 with a new "SNP_REPORT_USER_DATA_SIZE" name
  (Alexey)
- Add warning message for suspicious cases where the certificate table
  appears malformed (Alexey)

[1]: http://lore.kernel.org/r/169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com

---

Merge notes: The feedback has reached a point where the big picture
changes have been made and the last round was into more form and style
cleanups. As for merging I leave it for Dave and Boris to comment. I
am open to sending a pull request, just let me know.

Much thanks to Alexey and Peter for verifying that the certificate table
is being correctly conveyed through the @auxblob attribute, and for all
the review from everyone. I smoke tested these again after the cleanups.

---

Dan Williams (6):
      virt: sevguest: Fix passing a stack buffer as a scatterlist target
      virt: coco: Add a coco/Makefile and coco/Kconfig
      configfs-tsm: Introduce a shared ABI for attestation reports
      virt: sevguest: Prep for kernel internal get_ext_report()
      mm/slab: Add __free() support for kvfree
      virt: sevguest: Add TSM_REPORTS support for SNP_GET_EXT_REPORT

Kuppuswamy Sathyanarayanan (1):
      virt: tdx-guest: Add Quote generation support using TSM_REPORTS


 Documentation/ABI/testing/configfs-tsm  |   82 ++++++
 MAINTAINERS                             |    8 +
 arch/x86/coco/tdx/tdx.c                 |   21 ++
 arch/x86/include/asm/shared/tdx.h       |    1 
 arch/x86/include/asm/tdx.h              |    2 
 drivers/virt/Kconfig                    |    6 
 drivers/virt/Makefile                   |    4 
 drivers/virt/coco/Kconfig               |   14 +
 drivers/virt/coco/Makefile              |    8 +
 drivers/virt/coco/sev-guest/Kconfig     |    1 
 drivers/virt/coco/sev-guest/sev-guest.c |  214 ++++++++++++++--
 drivers/virt/coco/tdx-guest/Kconfig     |    1 
 drivers/virt/coco/tdx-guest/tdx-guest.c |  229 +++++++++++++++++
 drivers/virt/coco/tsm.c                 |  425 +++++++++++++++++++++++++++++++
 include/linux/slab.h                    |    2 
 include/linux/tsm.h                     |   69 +++++
 include/uapi/linux/psp-sev.h            |    1 
 include/uapi/linux/sev-guest.h          |    4 
 18 files changed, 1055 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-tsm
 create mode 100644 drivers/virt/coco/Kconfig
 create mode 100644 drivers/virt/coco/Makefile
 create mode 100644 drivers/virt/coco/tsm.c
 create mode 100644 include/linux/tsm.h

base-commit: 6465e260f48790807eef06b583b38ca9789b6072
