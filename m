Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5922370
	for <linux-coco@lists.linux.dev>; Thu, 22 Jul 2021 11:52:55 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2b1ea.dip0.t-ipconnect.de [79.242.177.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id 9DE482E3;
	Thu, 22 Jul 2021 13:52:52 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v2 0/4] KVM: SVM: Add initial GHCB protocol version 2 support
Date: Thu, 22 Jul 2021 13:52:41 +0200
Message-Id: <20210722115245.16084-1-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

Hi,

here is a small set of patches which I took from the pending SEV-SNP
patch-sets to enable basic support for GHCB protocol version 2.

When SEV-SNP is not supported, only two new MSR protocol VMGEXIT calls
need to be supported:

	- MSR-based AP-reset-hold
	- MSR-based HV-feature-request

These calls are implemented by here and then the protocol is lifted to
version 2.

This is submitted separately because the MSR-based AP-reset-hold call
is required to support kexec/kdump in SEV-ES guests.

Regards,

	Joerg

Changes v1->v2:

	- Rebased to v5.14-rc2
	- Addressed Sean's review comments from the SNP patch-set.

Brijesh Singh (2):
  KVM: SVM: Add support for Hypervisor Feature support MSR protocol
  KVM: SVM: Increase supported GHCB protocol version

Joerg Roedel (1):
  KVM: SVM: Get rid of *ghcb_msr_bits() functions

Tom Lendacky (1):
  KVM: SVM: Add support to handle AP reset MSR protocol

 arch/x86/include/asm/kvm_host.h   |  10 ++-
 arch/x86/include/asm/sev-common.h |  14 ++++
 arch/x86/include/asm/svm.h        |   1 -
 arch/x86/include/uapi/asm/svm.h   |   1 +
 arch/x86/kvm/svm/sev.c            | 107 ++++++++++++++++++++----------
 arch/x86/kvm/svm/svm.h            |   3 +-
 arch/x86/kvm/x86.c                |   5 +-
 7 files changed, 103 insertions(+), 38 deletions(-)


base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
-- 
2.31.1

