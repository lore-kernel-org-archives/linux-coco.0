Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72DB2FB3
	for <linux-coco@lists.linux.dev>; Thu, 22 Jul 2021 11:52:55 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2b1ea.dip0.t-ipconnect.de [79.242.177.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id A478F55F;
	Thu, 22 Jul 2021 13:52:53 +0200 (CEST)
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
Subject: [PATCH v2 3/4] KVM: SVM: Add support for Hypervisor Feature support MSR protocol
Date: Thu, 22 Jul 2021 13:52:44 +0200
Message-Id: <20210722115245.16084-4-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722115245.16084-1-joro@8bytes.org>
References: <20210722115245.16084-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brijesh Singh <brijesh.singh@amd.com>

Version 2 of the GHCB specification introduced advertisement of
supported Hypervisor SEV features. This request is required to support
a the GHCB version 2 protocol.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/sev-common.h |  4 ++++
 arch/x86/include/uapi/asm/svm.h   |  1 +
 arch/x86/kvm/svm/sev.c            | 21 +++++++++++++++++++++
 arch/x86/kvm/svm/svm.h            |  1 +
 4 files changed, 27 insertions(+)

diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
index 04470aab421b..ad7448b5c74d 100644
--- a/arch/x86/include/asm/sev-common.h
+++ b/arch/x86/include/asm/sev-common.h
@@ -64,6 +64,10 @@
 #define GHCB_MSR_HV_FT_REQ			0x080
 #define GHCB_MSR_HV_FT_RESP			0x081
 
+/* GHCB Hypervisor Feature Request/Response */
+#define GHCB_MSR_HV_FT_REQ			0x080
+#define GHCB_MSR_HV_FT_RESP			0x081
+
 #define GHCB_MSR_TERM_REQ		0x100
 #define GHCB_MSR_TERM_REASON_SET_POS	12
 #define GHCB_MSR_TERM_REASON_SET_MASK	0xf
diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
index efa969325ede..fbb6f8d27a80 100644
--- a/arch/x86/include/uapi/asm/svm.h
+++ b/arch/x86/include/uapi/asm/svm.h
@@ -108,6 +108,7 @@
 #define SVM_VMGEXIT_AP_JUMP_TABLE		0x80000005
 #define SVM_VMGEXIT_SET_AP_JUMP_TABLE		0
 #define SVM_VMGEXIT_GET_AP_JUMP_TABLE		1
+#define SVM_VMGEXIT_HV_FT			0x8000fffd
 #define SVM_VMGEXIT_UNSUPPORTED_EVENT		0x8000ffff
 
 /* Exit code reserved for hypervisor/software use */
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a32ef011025f..4565c360d87d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2180,6 +2180,7 @@ static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
 	case SVM_VMGEXIT_AP_HLT_LOOP:
 	case SVM_VMGEXIT_AP_JUMP_TABLE:
 	case SVM_VMGEXIT_UNSUPPORTED_EVENT:
+	case SVM_VMGEXIT_HV_FT:
 		break;
 	default:
 		goto vmgexit_err;
@@ -2361,6 +2362,16 @@ static void set_ghcb_msr_ap_rst_resp(struct vcpu_svm *svm, u64 value)
 	svm->vmcb->control.ghcb_gpa = GHCB_MSR_AP_RESET_HOLD_RESP | (value << GHCB_DATA_LOW);
 }
 
+static void set_ghcb_msr_hv_feat_resp(struct vcpu_svm *svm, u64 value)
+{
+	u64 msr;
+
+	msr  = GHCB_MSR_HV_FT_RESP;
+	msr |= (value << GHCB_DATA_LOW);
+
+	svm->vmcb->control.ghcb_gpa = msr;
+}
+
 static void set_ghcb_msr(struct vcpu_svm *svm, u64 value)
 {
 	svm->vmcb->control.ghcb_gpa = value;
@@ -2425,6 +2436,10 @@ static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
 
 		break;
 	}
+	case GHCB_MSR_HV_FT_REQ: {
+		set_ghcb_msr_hv_feat_resp(svm, GHCB_HV_FT_SUPPORTED);
+		break;
+	}
 	case GHCB_MSR_TERM_REQ: {
 		u64 reason_set, reason_code;
 
@@ -2537,6 +2552,12 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
 		ret = 1;
 		break;
 	}
+	case SVM_VMGEXIT_HV_FT: {
+		ghcb_set_sw_exit_info_2(ghcb, GHCB_HV_FT_SUPPORTED);
+
+		ret = 1;
+		break;
+	}
 	case SVM_VMGEXIT_UNSUPPORTED_EVENT:
 		vcpu_unimpl(vcpu,
 			    "vmgexit: unsupported event - exit_info_1=%#llx, exit_info_2=%#llx\n",
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 7e2090752d8f..9cafeba3340e 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -550,6 +550,7 @@ void svm_vcpu_unblocking(struct kvm_vcpu *vcpu);
 #define GHCB_VERSION_MAX	1ULL
 #define GHCB_VERSION_MIN	1ULL
 
+#define GHCB_HV_FT_SUPPORTED	0
 
 extern unsigned int max_sev_asid;
 
-- 
2.31.1

