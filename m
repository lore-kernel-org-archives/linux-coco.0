Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879FF10EE
	for <linux-coco@lists.linux.dev>; Wed, 28 Jun 2023 22:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687992216; x=1719528216;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x+1cfc/xmoFxBnLLgTcKrep1dUoeoXKUxnolji14RNc=;
  b=FhmK+ztw4r56nwm7rjgllJcZ++3l3uJEFP4MUpiH1qeU2UT7gMJzKOpx
   mrxAflI4GRPS6oNVfFA09AnubpWveI9D424f0dyQgWU0rnHxpvaxj4Eqg
   O2iglsGYRg8I9ATRO3nhzYP+Ak/EgVzexoOXwUUxP5KGXO+Fivg0BP6gW
   RRE+dUqR+2xYQVJZl3o5/QtsANl/9NqnIk/EoY9LXqYkNUfbluhBy4nrl
   cvSexXMnCkjIcElqRFPWTCmZx8h5kA/MM5Oq9UwT6QgI52Oj6iq//V6Tx
   QLuX2P2QqzoVVJE798pbEgdpfuH4ukz1pMnvzcSsk4wL+EB6QLylRlo6B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="392699112"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="392699112"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830299976"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="830299976"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:43:19 -0700
From: isaku.yamahata@intel.com
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: isaku.yamahata@intel.com,
	isaku.yamahata@gmail.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	erdemaktas@google.com,
	Sean Christopherson <seanjc@google.com>,
	Sagi Shahar <sagis@google.com>,
	David Matlack <dmatlack@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	chen.bo@intel.com,
	linux-coco@lists.linux.dev,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Michael Roth <michael.roth@amd.com>,
	Yuan Yao <yuan.yao@linux.intel.com>
Subject: [RFC PATCH v3 00/11] KVM: guest memory: Misc enhacnement
Date: Wed, 28 Jun 2023 15:42:59 -0700
Message-Id: <cover.1687991811.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

Hello. I've updated the patch series based on the feedback. Here are the
discussion points.

- 06/11 KVM: x86: Introduce PFERR_GUEST_ENC_MASK to indicate fault is private
  Michael has his own opinion on how to indicate private fault.

- 09/11 KVM: Add new members to struct kvm_gfn_range to operate on

- 10/11 KVM: x86: Add gmem hook for initializing private memory
  SNP needs the callback. TDX won't use this one.

- 11/11 KVM: x86: Add gmem hook for invalidating private memory
  SNP needs the callback. TDX doesn't use this one at the moment, but would
  use it.
  
- VM type:
  I didn't rename KVM_X86_PROTECTED_VM to KVM_X86_SW_PROTECTED_VM  in this patch
  series.  It's easy to rename it if desired.

Thanks,

This is an RFC patch series based on KVM gmem [1] and [2] for the common use of
TDX and SEV-SNP.

[1] KVM gmem patches
https://github.com/sean-jc/linux/tree/x86/kvm_gmem_solo

[2] Add AMD Secure Nested Paging (SEV-SNP) Hypervisor Support
https://lore.kernel.org/lkml/20230612042559.375660-1-michael.roth@amd.com/

---
v3:
- Imported common patches from Michael Roth which can be useful for both SNP
  and TDX.  And reorder patches.
- Update struct kvm_gfn_range to drop flag, and add add only_private, and
  only_shared
- Update kvm_arch_set_memory_attributes() and added a x86 vendor callback for
  it.

v2:
https://lore.kernel.org/all/cover.1687474039.git.isaku.yamahata@intel.com/

v1:
https://lore.kernel.org/all/cover.1686858861.git.isaku.yamahata@intel.com/

Brijesh Singh (1):
  KVM: x86: Export the kvm_zap_gfn_range() for the SNP use

Isaku Yamahata (8):
  KVM: selftests: Fix test_add_overlapping_private_memory_regions()
  KVM: selftests: Fix guest_memfd()
  KVM: selftests: x86: typo in private_mem_conversions_test.c
  KVM: x86: Add is_vm_type_supported callback
  KVM: x86/mmu: Pass around full 64-bit error code for the KVM page
    fault
  KVM: x86: Introduce PFERR_GUEST_ENC_MASK to indicate fault is private
  KVM: Fix set_mem_attr ioctl when error case
  KVM: Add new members to struct kvm_gfn_range to operate on

Michael Roth (2):
  KVM: x86: Add gmem hook for initializing private memory
  KVM: x86: Add gmem hook for invalidating private memory

 arch/x86/include/asm/kvm-x86-ops.h            |  4 ++
 arch/x86/include/asm/kvm_host.h               | 12 +++++
 arch/x86/include/uapi/asm/kvm.h               |  1 +
 arch/x86/kvm/mmu.h                            |  2 -
 arch/x86/kvm/mmu/mmu.c                        | 51 ++++++++++++++-----
 arch/x86/kvm/mmu/mmu_internal.h               | 20 ++++++--
 arch/x86/kvm/mmu/mmutrace.h                   |  2 +-
 arch/x86/kvm/mmu/paging_tmpl.h                |  2 +-
 arch/x86/kvm/svm/svm.c                        |  7 +++
 arch/x86/kvm/vmx/vmx.c                        |  6 +++
 arch/x86/kvm/x86.c                            | 16 +++++-
 arch/x86/kvm/x86.h                            |  2 +
 include/linux/kvm_host.h                      | 16 ++++--
 .../testing/selftests/kvm/guest_memfd_test.c  |  4 +-
 .../selftests/kvm/set_memory_region_test.c    | 16 +++++-
 .../kvm/x86_64/private_mem_conversions_test.c |  2 +-
 virt/kvm/guest_mem.c                          | 50 +++++++++++++++++-
 virt/kvm/kvm_main.c                           | 24 +++++----
 18 files changed, 192 insertions(+), 45 deletions(-)


base-commit: be8abcec83c87d4e15ae04816b685fe260c4bcfd
-- 
2.25.1

