Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53017F3
	for <linux-coco@lists.linux.dev>; Fri, 13 Oct 2023 02:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkoJgS8M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697163245; x=1728699245;
  h=subject:from:to:cc:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eR8njpBZOIz/eVQlrrWh0FhwRqAJHhpUezQi+XrT1nY=;
  b=gkoJgS8Mj+MxHz2cKInfsTQ6kmgOXWo6GcZri3VY4nnMBA7CNFOgED3m
   C+ZNifBPPV7vWdQ7pyMkzo9P4N9jPN9NXsgXc5ZCD4/IHId0H6+pX4zCi
   B6S2QzRp9WlzBc2/2cyKw4m3XmLdw2m44xxQzmm21EkjlQ3zpLIdrB0l8
   UUh6G/tbgwde38HgKSIDG59UqVpyjCzKhpgcx0gu5d03JU5XJKss+NAVE
   0fBLnMiexC7trzskb0yvpxHsr1sloWA9sutq8lGqnrKr3pqsM+dAfOSd7
   v9kEIIzLT6mDE4TnF8HgiAyAqAMLw6mB7xSaietDAssOMlKEMGAaKqe2Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387940524"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="387940524"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820390798"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="820390798"
Received: from jamieko-mobl1.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.108.60])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:13:55 -0700
Subject: [PATCH v6 0/7] configfs-tsm: Attestation Report ABI
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Erdem Aktas <erdemaktas@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Peter Gonda <pgonda@google.com>,
 Borislav Petkov <bp@alien8.de>, Dionna Amalie Glaze <dionnaglaze@google.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@rivosinc.com>,
 Dionna Glaze <dionnaglaze@google.com>, Pankaj Gupta <pankaj.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 sathyanarayanan.kuppuswamy@linux.intel.com, dave.hansen@linux.intel.com,
 bp@alien8.de
Date: Thu, 12 Oct 2023 19:13:54 -0700
Message-ID: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Changes since v5 [1]:
- Dump the raw cert_table via a new @auxblob attribute rather than
  concatenate the certificate data. (Dionna and Tom)
- Fix usage of guard(), drop erroneous copy-pasted mutex_unlock().
  (Tom)

[1]: http://lore.kernel.org/r/169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com

---

Merge notes: I am looking for Dave or Boris to pick this up, I believe
all outstanding comments have been resolved and this has now been
smoke-tested on AMD and Intel platforms (both v5 and v6).

---

An attestation report is signed evidence of how a Trusted Virtual
Machine (TVM) was launched and its current state. A verifying party uses
the report to make judgements of the confidentiality and integrity of
that execution environment. Upon successful attestation the verifying
party may, for example, proceed to deploy secrets to the TVM to carry
out a workload. Multiple confidential computing platforms share this
similar flow.
 
The approach of adding adding new char devs and new ioctls, for what
amounts to the same logical functionality with minor formatting
differences across vendors [2], is untenable. Common concepts and the
community benefit from common infrastructure. 
 
Use configfs for this facility for maintainability compared to ioctl(),
and for its scalability compared to sysfs. Atomicity can be enforced at
item creation time, and a conflict detection mechanism is included for
scenarios where multiple threads may share a single configuration
instance.
 
[2]: http://lore.kernel.org/r/cover.1684048511.git.sathyanarayanan.kuppuswamy@linux.intel.com


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
 drivers/virt/coco/sev-guest/sev-guest.c |  212 ++++++++++++++--
 drivers/virt/coco/tdx-guest/Kconfig     |    1 
 drivers/virt/coco/tdx-guest/tdx-guest.c |  229 +++++++++++++++++
 drivers/virt/coco/tsm.c                 |  423 +++++++++++++++++++++++++++++++
 include/linux/slab.h                    |    2 
 include/linux/tsm.h                     |   68 +++++
 16 files changed, 1046 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-tsm
 create mode 100644 drivers/virt/coco/Kconfig
 create mode 100644 drivers/virt/coco/Makefile
 create mode 100644 drivers/virt/coco/tsm.c
 create mode 100644 include/linux/tsm.h

base-commit: 6465e260f48790807eef06b583b38ca9789b6072
