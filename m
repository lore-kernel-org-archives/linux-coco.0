Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402CA354F6
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 05:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JasnlYDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697002033; x=1728538033;
  h=subject:from:to:cc:date:message-id:mime-version:
   content-transfer-encoding;
  bh=560pGsYKJbvAEvqowrxNgbku4MlJdhEpxMlsLFOh914=;
  b=JasnlYDsw0PKQKnd/U0yTu5NGQ83MrLmp8KefpUeMReiznPEjw9KW+Dr
   FkitdGSIZvszFe3P9NiMAXgNZdwlV9Wa0tmdXA6WB/uprmooWN98LK2+e
   th1SguQ8JSoUEFEWgdXwQQGTz/MnquaSgM61Jk5LRU8AQZY3FulIZOzZW
   /WiruruYZd2cTcSBFfdCPv66TZ63OK3eCU5GKa+0JAFN0E3ELJHzued7g
   SBl62Dkz6Inf41JqDPZeQSBoysjqJInhhGS5nZOPiTHk/hIw9WkvVpVd9
   D/gnO7qDWEf3kRme1v3QQJIyV5mtkv72fpFdFWIKDdkB4btFZaXklAMJx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="415627449"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="415627449"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 22:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="757409252"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="757409252"
Received: from mghorpad-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.251.2.142])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 22:27:11 -0700
Subject: [PATCH v5 0/7] configfs-tsm: Attestation Report ABI
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
Date: Tue, 10 Oct 2023 22:27:10 -0700
Message-ID: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Changes since v4 [1]:
- Fix a stack buffer vs scatterlist bug in sev-guest (Peter)
- Test on AMD hardware, thanks Peter for the help!
- Fix size of @len in __read_report() (Sathya)
- Clarify the NULL @buf case in __read_report() (Sathya)
- Fix kdoc for 'struct tsm_report' (Sathya)
- Add kdoc for 'struct tsm_ops' (Sathya)
- Initialize @certs_size to zero in sev_report_new() (Dan, smatch)
- Add links to documentation for the attestation report formats
- Drop conversion of sev-guest get_report(), just use get_ext_report()
  exclusively
- Add is_vmpck_empty() and exitinfo2 init in set_report_new() similar to
  the ioctl() path

[1]: http://lore.kernel.org/r/169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com

---

Merge notes: I am looking for Dave or Boris to pick this up, I believe
all outstanding comments have been resolved and this has now been
smoke-tested on AMD and Intel platforms.

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


 Documentation/ABI/testing/configfs-tsm  |   76 ++++++
 MAINTAINERS                             |    8 +
 arch/x86/coco/tdx/tdx.c                 |   21 ++
 arch/x86/include/asm/shared/tdx.h       |    1 
 arch/x86/include/asm/tdx.h              |    2 
 drivers/virt/Kconfig                    |    6 
 drivers/virt/Makefile                   |    4 
 drivers/virt/coco/Kconfig               |   14 +
 drivers/virt/coco/Makefile              |    8 +
 drivers/virt/coco/sev-guest/Kconfig     |    1 
 drivers/virt/coco/sev-guest/sev-guest.c |  218 ++++++++++++++--
 drivers/virt/coco/tdx-guest/Kconfig     |    1 
 drivers/virt/coco/tdx-guest/tdx-guest.c |  229 +++++++++++++++++
 drivers/virt/coco/tsm.c                 |  416 +++++++++++++++++++++++++++++++
 include/linux/slab.h                    |    2 
 include/linux/tsm.h                     |   68 +++++
 16 files changed, 1039 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-tsm
 create mode 100644 drivers/virt/coco/Kconfig
 create mode 100644 drivers/virt/coco/Makefile
 create mode 100644 drivers/virt/coco/tsm.c
 create mode 100644 include/linux/tsm.h

base-commit: 6465e260f48790807eef06b583b38ca9789b6072
