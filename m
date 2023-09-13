Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977311DDFB
	for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 10:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694602148; x=1726138148;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0ipY0xZJYgdQ7/oanIvGLJbsO2u+4QkUIghXmzX8/8w=;
  b=baTt97SrJMcWx6FmzKv01Zshf2CiJ22uLuceew4qrZDPuXJ04QBaJHme
   Ky4lVRwUuXtz4LfDQyJrTi9icJg7dqHfRJwdzY8P/wjGCQOXpCfe0cMMF
   iR0VWrCunuxb0HtJY9mx7gW7Mom9bojQH/bnWUvCfB3IUyNJYpp2Msu3s
   bh9EjkbLPgRv4iMNKzCWHQCkEu44/JeAS9MzPJ8JtmOw8SqwEO0a4hCsg
   ckc3EGcbxtO6s3JeFIb0B4/TPvpeHIN9qNYtGGUy9ZqAvZ3cI7zWzASh7
   NAVehuXS8b2yVRgr0frg+IBFHjEyUiMOdHqjbFQCJaRdTpuiY5MwFYOrg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464994924"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="464994924"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 03:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737451848"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="737451848"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 03:49:06 -0700
From: isaku.yamahata@intel.com
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: isaku.yamahata@intel.com,
	isaku.yamahata@gmail.com,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	erdemaktas@google.com,
	Sagi Shahar <sagis@google.com>,
	David Matlack <dmatlack@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	chen.bo@intel.com,
	linux-coco@lists.linux.dev,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Yuan Yao <yuan.yao@linux.intel.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Quentin Perret <qperret@google.com>,
	wei.w.wang@intel.com,
	Fuad Tabba <tabba@google.com>
Subject: [RFC PATCH 0/6] KVM: gmem: Implement error_remove_page
Date: Wed, 13 Sep 2023 03:48:49 -0700
Message-Id: <cover.1694599703.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

This patch series is to share my progress on the KVM gmem error_remove_page task.
Although I'm still working on test cases, I don't want to hold the patches
locally until I finish test cases.

- Update error_remove_page method.  Unmap gfn on poisoned pages.  Pass related
  arguments.  Unfortunately, the error_remove_page callback is passed struct
  page.  So the callback can't know about the actual poisoned address and range.
  The memory poisoning would be based on cache line size, though.
- Add a new flag to KVM_EXIT_MEMORY_FAULT to indicate the page is poisoned.
- Add check in faultin_pfn_private.  When the page is poisoned,
  KVM_EXIT_MEMORY_FAULT(HWPOISON).
- Only test case for ioctl(FIBMAP).  Test cases are TODO.

TODOs
- Implement test cases to inject HWPOISON or MCE by hwpoison
  (/sys/kernel/debug/hwpoison/corrupt-pfn) or MCE injection
  (/sys/kernel/debug/mce-inject).
- Update qemu to handle KVM_EXIT_MEMORY_FAULT(HWPOISON)
- Update TDX KVM to handle it and Add test cases for TDX.
- Try to inject HWPOISON as soon as the poison is detected.

Isaku Yamahata (6):
  KVM: guest_memfd: Add config to show the capability to handle error
    page
  KVM: guestmem_fd: Make error_remove_page callback to unmap guest
    memory
  KVM: guest_memfd, x86: MEMORY_FAULT exit with hw poisoned page
  KVM: guest_memfd: Implemnet bmap inode operation
  KVM: selftests: Add selftest for guest_memfd() fibmap
  KVM: X86: Allow KVM gmem hwpoison test cases

 arch/x86/kvm/Kconfig                          |  2 +
 arch/x86/kvm/mmu/mmu.c                        | 21 +++--
 include/linux/kvm_host.h                      |  2 +
 include/uapi/linux/kvm.h                      |  3 +-
 .../testing/selftests/kvm/guest_memfd_test.c  | 45 ++++++++++
 virt/kvm/Kconfig                              |  7 ++
 virt/kvm/guest_mem.c                          | 82 +++++++++++++++----
 7 files changed, 139 insertions(+), 23 deletions(-)


base-commit: a5accd8596fa84b9fe00076444b5ef628d2351b9
-- 
2.25.1

