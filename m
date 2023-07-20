Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7FE1E502
	for <linux-coco@lists.linux.dev>; Thu, 20 Jul 2023 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689895994; x=1721431994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XgEvWWJfCSkaHXBU9qxLzS4Sis3yAaVmilVG11RQU2I=;
  b=Y9ugynpxKcNgAtJhsHzrrqV/+4OncjumrBzDzQY8gtG+lJyf2iedCl70
   Gjm+QFSGhUMtWLLdWSnBE7ozkqvgaxud+zm7Qii4VzzSc17JqWQKrRXO3
   c6v6zUanqyBJxtraTj1FaBkR0q3Um/n8juv3NZvVjooPTIylJAxUU8EHe
   5Ac3AiyxyojCJBABJVkgMjjffGrrBDxh2H137u+//sNwuEx+5RYjUbozI
   TT7ZRH3skRJtASoI9MAwFR0gpXxD4YNwFN0FI7lhPzMQkuYc7NXCOD2rG
   njSTmGNMeyNfQG+kXS+O7AJX9mXeDkxIyp4S9HCVN8CvtCI+qZiOKBhJs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364355910"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="364355910"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 16:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="727891782"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="727891782"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 16:33:10 -0700
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
	Yuan Yao <yuan.yao@linux.intel.com>
Subject: [RFC PATCH v4 02/10] KVM: x86/mmu: Guard against collision with KVM-defined PFERR_IMPLICIT_ACCESS
Date: Thu, 20 Jul 2023 16:32:48 -0700
Message-Id: <0d71b1cdd5d901478cbfd421b4b0071cce44e16a.1689893403.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1689893403.git.isaku.yamahata@intel.com>
References: <cover.1689893403.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sean Christopherson <seanjc@google.com>

Add an assertion in kvm_mmu_page_fault() to ensure the error code provided
by hardware doesn't conflict with KVM's software-defined IMPLICIT_ACCESS
flag.  In the unlikely scenario that future hardware starts using bit 48
for a hardware-defined flag, preserving the bit could result in KVM
incorrectly interpreting the unknown flag as KVM's IMPLICIT_ACCESS flag.

WARN so that any such conflict can be surfaced to KVM developers and
resolved, but otherwise ignore the bit as KVM can't possibly rely on a
flag it knows nothing about.

Fixes: 4f4aa80e3b88 ("KVM: X86: Handle implicit supervisor access with SMAP")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 05943ccb55a4..a9bbc20c7dfd 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5822,6 +5822,17 @@ int noinline kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 err
 	int r, emulation_type = EMULTYPE_PF;
 	bool direct = vcpu->arch.mmu->root_role.direct;
 
+	/*
+	 * IMPLICIT_ACCESS is a KVM-defined flag used to correctly perform SMAP
+	 * checks when emulating instructions that triggers implicit access.
+	 * WARN if hardware generates a fault with an error code that collides
+	 * with the KVM-defined value.  Clear the flag and continue on, i.e.
+	 * don't terminate the VM, as KVM can't possibly be relying on a flag
+	 * that KVM doesn't know about.
+	 */
+	if (WARN_ON_ONCE(error_code & PFERR_IMPLICIT_ACCESS))
+		error_code &= ~PFERR_IMPLICIT_ACCESS;
+
 	if (WARN_ON(!VALID_PAGE(vcpu->arch.mmu->root.hpa)))
 		return RET_PF_RETRY;
 
-- 
2.25.1

