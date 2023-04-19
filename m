Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4883ED300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:07 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1a5197f00e9so4659285ad.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942687; x=1684534687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHi27AH8EgCkCQBErjcLInO9Ogd99Uht/0Y2I/rPxr0=;
        b=YSIfA3fBHehSI9sfNw8kNY3SjYw3MKpDND587n51K3eoVf8RJTCG1iSaqqG9yfNjCx
         jwqPpoi/ITD0shW0NUnRyZli8JT8h1t3/2gNbp76WuPUO0CZ5s8zSvoyiHQFyjfIMwOE
         1ZldJnGMaXcDrIoP6ErfdR2UHM3fNFztr08TXf0xVGRFo5tk0moUvzoYm/r0hkRFoy0K
         cWLNwCIHBfTQ0bCQR3c38U1nAB1slt1q42rqYoamEUYp5QQ79+wtILJqFzbQlYA06O6P
         OEHwUmVOCGHeSnw6bqeEZSZ4KjU2xfgwWJGo24N5J96VrnqV0nME7zdNFrLcXHLPuPgD
         RkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942687; x=1684534687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHi27AH8EgCkCQBErjcLInO9Ogd99Uht/0Y2I/rPxr0=;
        b=OlyrrpxpxPcQvpATgEggAVdV5mB5Vg/AF54AmnmBIYc54YOjtvaYJWSmEC2bQwhS/m
         l4xzpVRcPoKBWML89YDrZXqcUA0TG2EmDiCZI11eaSnMjtFCh1eIHix6B5PwAEeX3a4Q
         i9MuJ7UGCxY75aBAjuE3BEhMRBVa/jyxjOd/xq2nj7L45Ut4StomM1QDiT+pNhQ7n/iJ
         RpFOFJO94fOkUAxMzPYGRucuHN2Ji5aUEmmS4pOnkl9nbU85VDK90F2hwDaH8Y7b+q4v
         lPXlQO/7By9s2t8+8d/ilD6f4jN6C7uXR+yx8l+IjzWH8zMHSeSkKgtGmoS4KXTJ1VHn
         ZUDQ==
X-Gm-Message-State: AAQBX9fQLfjY53c2+YirBiJRerCsVJXTURMI3EWP429zvnrhg7EywOFg
	FA/RcJVCGEDJW/kqvqD1WluW6w==
X-Google-Smtp-Source: AKy350a7uqnn10B5RYMJKbmqBxpZkXHpV8hWE2JbxUvi5COFiIeLm7AFkPV91DbiIrXf3nFN1rwkeg==
X-Received: by 2002:a17:902:ec8b:b0:1a9:23b7:9182 with SMTP id x11-20020a170902ec8b00b001a923b79182mr2674160plg.27.1681942686991;
        Wed, 19 Apr 2023 15:18:06 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:06 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 17/48] RISC-V : KVM: Skip vmid/hgatp management for TVMs
Date: Wed, 19 Apr 2023 15:16:45 -0700
Message-Id: <20230419221716.3603068-18-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TSM manages the vmid for the guests running in CoVE. The host
doesn't need to update vmid at all. As a result, the host doesn't
need to update the hgatp as well.

Return early for vmid/hgatp management functions for confidential
guests.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h |  2 +-
 arch/riscv/kvm/mmu.c              |  4 ++++
 arch/riscv/kvm/vcpu.c             |  2 +-
 arch/riscv/kvm/vmid.c             | 17 ++++++++++++-----
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index ca2ebe3..047e046 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -325,7 +325,7 @@ unsigned long kvm_riscv_gstage_pgd_size(void);
 void __init kvm_riscv_gstage_vmid_detect(void);
 unsigned long kvm_riscv_gstage_vmid_bits(void);
 int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
-bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
+bool kvm_riscv_gstage_vmid_ver_changed(struct kvm *kvm);
 void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1d5e4ed..4b0f09e 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -778,6 +778,10 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 	unsigned long hgatp = gstage_mode;
 	struct kvm_arch *k = &vcpu->kvm->arch;
 
+	/* COVE VCPU hgatp is managed by TSM. */
+	if (is_cove_vcpu(vcpu))
+		return;
+
 	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
 	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3b600c6..8cf462c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1288,7 +1288,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		kvm_riscv_update_hvip(vcpu);
 
 		if (ret <= 0 ||
-		    kvm_riscv_gstage_vmid_ver_changed(&vcpu->kvm->arch.vmid) ||
+		    kvm_riscv_gstage_vmid_ver_changed(vcpu->kvm) ||
 		    kvm_request_pending(vcpu) ||
 		    xfer_to_guest_mode_work_pending()) {
 			vcpu->mode = OUTSIDE_GUEST_MODE;
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index ddc9871..dc03601 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -14,6 +14,7 @@
 #include <linux/smp.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/kvm_cove.h>
 
 static unsigned long vmid_version = 1;
 static unsigned long vmid_next;
@@ -54,12 +55,13 @@ int kvm_riscv_gstage_vmid_init(struct kvm *kvm)
 	return 0;
 }
 
-bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid)
+bool kvm_riscv_gstage_vmid_ver_changed(struct kvm *kvm)
 {
-	if (!vmid_bits)
+	/* VMID version can't be changed by the host for TVMs */
+	if (!vmid_bits || is_cove_vm(kvm))
 		return false;
 
-	return unlikely(READ_ONCE(vmid->vmid_version) !=
+	return unlikely(READ_ONCE(kvm->arch.vmid.vmid_version) !=
 			READ_ONCE(vmid_version));
 }
 
@@ -72,9 +74,14 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 {
 	unsigned long i;
 	struct kvm_vcpu *v;
+	struct kvm *kvm = vcpu->kvm;
 	struct kvm_vmid *vmid = &vcpu->kvm->arch.vmid;
 
-	if (!kvm_riscv_gstage_vmid_ver_changed(vmid))
+	/* No VMID management for TVMs by the host */
+	if (is_cove_vcpu(vcpu))
+		return;
+
+	if (!kvm_riscv_gstage_vmid_ver_changed(kvm))
 		return;
 
 	spin_lock(&vmid_lock);
@@ -83,7 +90,7 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 	 * We need to re-check the vmid_version here to ensure that if
 	 * another vcpu already allocated a valid vmid for this vm.
 	 */
-	if (!kvm_riscv_gstage_vmid_ver_changed(vmid)) {
+	if (!kvm_riscv_gstage_vmid_ver_changed(kvm)) {
 		spin_unlock(&vmid_lock);
 		return;
 	}
-- 
2.25.1

