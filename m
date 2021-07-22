Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747442FB6
	for <linux-coco@lists.linux.dev>; Thu, 22 Jul 2021 11:52:56 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2b1ea.dip0.t-ipconnect.de [79.242.177.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id 0F2D95D1;
	Thu, 22 Jul 2021 13:52:54 +0200 (CEST)
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
Subject: [PATCH v2 4/4] KVM: SVM: Increase supported GHCB protocol version
Date: Thu, 22 Jul 2021 13:52:45 +0200
Message-Id: <20210722115245.16084-5-joro@8bytes.org>
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

Now that KVM has basic support for version 2 of the GHCB specification,
bump the maximum supported protocol version. The SNP specific functions
are still missing, but those are only required when the Hypervisor
supports running SNP guests.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kvm/svm/svm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 9cafeba3340e..84580dc90c97 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -547,7 +547,7 @@ void svm_vcpu_unblocking(struct kvm_vcpu *vcpu);
 
 /* sev.c */
 
-#define GHCB_VERSION_MAX	1ULL
+#define GHCB_VERSION_MAX	2ULL
 #define GHCB_VERSION_MIN	1ULL
 
 #define GHCB_HV_FT_SUPPORTED	0
-- 
2.31.1

