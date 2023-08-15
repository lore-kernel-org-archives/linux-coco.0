Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7156A134CE
	for <linux-coco@lists.linux.dev>; Tue, 15 Aug 2023 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692119950; x=1723655950;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uyYQyYO29xSOQittSYVaOb6LhfmfeTlwG0zG2837vUA=;
  b=OAnJ+0lINHcBBnzsUdS5HobsZqUvx7LT5Bt1owuDfEvlEohUe46peNkP
   dQ1q1o2kudvl3HFQmvVYNp8EBgMmyZUzMo7vbGT+E1zjupLZV9FoyvvcM
   zbvaagCptoOf1V2PyGdcVWXJDEfzo3bISSiprXqundgAA3Gwbfj4NvxwM
   bFg8TY+4Jf+AuDtWiZPzeXguxNsIH+DQsKtf9q0HNv3yPzoQJGhik11DX
   tvCp1qEb1q5zwEakUaXY0+MHJ55UL9UCUZsKDUeDmlTNltv3G8IPaEJRq
   rWaMBdoeRrA8yw9qcjTG20ECxm1smirD/WVf+YAhWeipJcOclKS8F7XOv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362488583"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="362488583"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 10:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848148964"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="848148964"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 10:19:03 -0700
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
Subject: [PATCH 0/8] KVM: gmem: Adding hooks for SEV and TDX
Date: Tue, 15 Aug 2023 10:18:47 -0700
Message-Id: <cover.1692119201.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

This patch series for KVM guest memfd is to have common code base for SEV and
TDX.  Several minor fixes.  Based on this patch series, TDX KVM can defer page
clearing without mmu lock.

Isaku Yamahata (6):
  KVM: gmem: Make kvm_gmem_bind return EBADF on wrong fd
  KVM: gmem: removed duplicated kvm_gmem_init()
  KVM: gmem: Fix kvm_gmem_issue_arch_invalidate()
  KVM: gmem: protect kvm_mmu_invalidate_end()
  KVM: gmem: Avoid race with kvm_gmem_release and mmu notifier
  RFC: KVM: gmem: Guarantee the order of destruction

Michael Roth (2):
  KVM: gmem, x86: Add gmem hook for initializing private memory
  KVM: gmem, x86: Add gmem hook for invalidating private memory

 arch/x86/include/asm/kvm-x86-ops.h |  2 ++
 arch/x86/include/asm/kvm_host.h    |  4 +++
 arch/x86/kvm/mmu/mmu.c             | 12 ++++++--
 arch/x86/kvm/x86.c                 |  6 ++++
 include/linux/kvm_host.h           | 27 ++++++++++++++++++
 virt/kvm/guest_mem.c               | 46 ++++++++++++++++++++++++++++--
 virt/kvm/kvm_main.c                | 46 ++++++++++++++++++++++++++++--
 7 files changed, 136 insertions(+), 7 deletions(-)


base-commit: 89b6a7b873d72280e85976bbb8fe4998b2ababa8
-- 
2.25.1

