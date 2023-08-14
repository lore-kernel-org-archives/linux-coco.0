Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6631842
	for <linux-coco@lists.linux.dev>; Mon, 14 Aug 2023 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691998991; x=1723534991;
  h=subject:from:to:cc:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TwoF5fq59lRt7vlTdgDePaChbL1k3CWvyUQLNnCPZ/s=;
  b=ctOcEDrBoxsapg1mlgiLmVhvJIgT2uuXKpWa4TQexCHMPUxR2CKg/xyF
   qbl3MEy02VL256oucUisrLoPKu9T9Mqh/BkpfIhN3dUrDj1AkbpYERo1e
   zwrSnXWFBgGbojAyr0QYatZLEsr7JQNCgW2CHJUAvfExcK/pPZE2TJ6n2
   iZNwdxbWxDol0Y8izn2jIlTFIvX9JuuhH2iziUSNJN1DaxMCing3vFMqK
   l7/AVDvgqAig09491pebhHDeSyoWlQizrzbpaKmnw7CdsShtskv3JytqH
   y9E1/8w2b5mSzFq1baiz/CcqwQ5WACaKi7cIEeNJgCNfZ+nJ45EMI6tfR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="370882721"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="370882721"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 00:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="736445226"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="736445226"
Received: from navanban-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.127.25])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 00:43:09 -0700
Subject: [PATCH v2 0/5] tsm: Attestation Report ABI
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 Samuel Ortiz <sameo@rivosinc.com>, Dionna Glaze <dionnaglaze@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Aug 2023 00:43:09 -0700
Message-ID: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Changes since v1:
- Switch from Keyring to sysfs (James)

An attestation report is signed evidence of how a Trusted Virtual
Machine (TVM) was launched and its current state. A verifying party uses
the report to make judgements of the confidentiality and integrity of
that execution environment. Upon successful attestation the verifying
party may, for example, proceed to deploy secrets to the TVM to carry
out a workload. Multiple confidential computing platforms share this
similar flow.

The approach of adding adding new char devs and new ioctls, for what
amounts to the same logical functionality with minor formatting
differences across vendors [1], is untenable. Common concepts and the
community benefit from common infrastructure.

Use sysfs for this facility for maintainability compared to ioctl(). The
expectation is that this interface is a boot time, configure once, get
report, and done flow. I.e. not something that receives ongoing
transactions at runtime. However, runtime retrieval is not precluded and
a mechanism to detect potential configuration conflicts from
multiple-threads using this interface is included.

The keyring@ list is dropped on this posting since a new key-type is no
longer being pursued.

Link: http://lore.kernel.org/r/cover.1684048511.git.sathyanarayanan.kuppuswamy@linux.intel.com

---

Dan Williams (5):
      virt: coco: Add a coco/Makefile and coco/Kconfig
      tsm: Introduce a shared ABI for attestation reports
      virt: sevguest: Prep for kernel internal {get,get_ext}_report()
      mm/slab: Add __free() support for kvfree
      virt: sevguest: Add TSM_REPORTS support for SNP_{GET,GET_EXT}_REPORT


 Documentation/ABI/testing/sysfs-class-tsm |   47 +++++
 MAINTAINERS                               |    8 +
 drivers/virt/Kconfig                      |    6 -
 drivers/virt/Makefile                     |    4 
 drivers/virt/coco/Kconfig                 |   13 +
 drivers/virt/coco/Makefile                |    8 +
 drivers/virt/coco/sev-guest/Kconfig       |    1 
 drivers/virt/coco/sev-guest/sev-guest.c   |  129 ++++++++++++-
 drivers/virt/coco/tdx-guest/Kconfig       |    1 
 drivers/virt/coco/tsm.c                   |  290 +++++++++++++++++++++++++++++
 include/linux/slab.h                      |    2 
 include/linux/tsm.h                       |   45 +++++
 12 files changed, 535 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-tsm
 create mode 100644 drivers/virt/coco/Kconfig
 create mode 100644 drivers/virt/coco/Makefile
 create mode 100644 drivers/virt/coco/tsm.c
 create mode 100644 include/linux/tsm.h

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
