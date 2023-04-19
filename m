Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E309D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:34 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-63b73203e0aso2785822b3a.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942713; x=1684534713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzHgRd9E4939KzL4yVjhGODBFacgyWrf3hGucLzcUO8=;
        b=5j01fN0ij/sx5aznVSQ+84ebob97Uk9ftFvgEXxpPwjhV5dco0Y79w6bw9ez6K4LUG
         x4ifblG/7m++Uyimmc36fD0O2cl/AoZnom3oZdZMqItGTqYdBH4OIN/teuA3aWTggftI
         cpfXd7inCZOHfFSvtG6jQH1j/NF3x6zzJYA/BAWcjUuRPw/Oif2Cfb9K4X/RvX3EuV6I
         rB2tIUmFeiD583OWXUG9/aKVA+9N3U2MddLb8BWDGvrP++iluedDlml9YMOSTGq8prU7
         8uZJLu/6wc33TCPOi7KP6620z50VzFYs35XGvSNltrv2JUItl6JoRg3XUUwIodj1A03e
         LxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942713; x=1684534713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzHgRd9E4939KzL4yVjhGODBFacgyWrf3hGucLzcUO8=;
        b=leqFi+JS6MEgmMzPyGjPXTtPZJLIM9bj4FpdNNplRPygTAyqo256XQ5SMqiedmIgRX
         vYE6o7WoJbuc3yz6u93D/aYjqOklxiSqVq/WyDqC6JcyV85BVh6j+pyc4GZsakYCt0lK
         tS4eue0QkD5va8MbE6HA1ejWOLS/qFNebLNgtyJ2YZUM7AzrP771OKIxNd306qhMDHJa
         7RNNQKkZSSMZAU6rpo9fO7MSNfgZDyXE6a1SWWP/0rHwaHVNNTyHrO6vhLRjOu/1sDxV
         ORnyZ6mexNGjKq4iIHSZ6Wh0ltvB5NcCfirGsaWYLQGSThF0kobvSsRuCSHdqTS4BMC3
         IWvQ==
X-Gm-Message-State: AAQBX9cf6hJd+qy04lywur6UUl7FSspb4nHtVZ8YHBVx/HNWoUr5mlEP
	TjcVB3ijTQpbOoDkGSzmyMtCng==
X-Google-Smtp-Source: AKy350Zeg7WcBlbIeS4PGWBrU+nA6D3ZQw2RQUdtMzrRIbcOBcnB4FvzAieagBSVaRSEerSYF/00HQ==
X-Received: by 2002:a17:903:25d1:b0:1a6:3e45:8df with SMTP id jc17-20020a17090325d100b001a63e4508dfmr3379688plb.33.1681942713552;
        Wed, 19 Apr 2023 15:18:33 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:33 -0700 (PDT)
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
Subject: [RFC 29/48] RISC-V: KVM: Skip AIA CSR updates for TVMs
Date: Wed, 19 Apr 2023 15:16:57 -0700
Message-Id: <20230419221716.3603068-30-atishp@rivosinc.com>
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

For TVMs, the host must not support AIA CSR emulation. In addition to
that, during vcpu load/put the CSR updates are not necessary as the CSR
state must not be visible to the host.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/aia.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 71216e1..e3da661 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -15,6 +15,7 @@
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 #include <asm/hwcap.h>
+#include <asm/kvm_cove.h>
 
 struct aia_hgei_control {
 	raw_spinlock_t lock;
@@ -134,7 +135,7 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
-	if (!kvm_riscv_aia_available())
+	if (!kvm_riscv_aia_available() || is_cove_vcpu(vcpu))
 		return;
 
 	csr_write(CSR_VSISELECT, csr->vsiselect);
@@ -152,7 +153,7 @@ void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
-	if (!kvm_riscv_aia_available())
+	if (!kvm_riscv_aia_available() || is_cove_vcpu(vcpu))
 		return;
 
 	csr->vsiselect = csr_read(CSR_VSISELECT);
@@ -370,6 +371,10 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 	if (!kvm_riscv_aia_available())
 		return KVM_INSN_ILLEGAL_TRAP;
 
+	/* TVMs do not support AIA emulation */
+	if (is_cove_vcpu(vcpu))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
 	/* First try to emulate in kernel space */
 	isel = csr_read(CSR_VSISELECT) & ISELECT_MASK;
 	if (isel >= ISELECT_IPRIO0 && isel <= ISELECT_IPRIO15)
@@ -529,6 +534,9 @@ void kvm_riscv_aia_enable(void)
 	if (!kvm_riscv_aia_available())
 		return;
 
+	if (unlikely(kvm_riscv_cove_enabled()))
+		goto enable_gext;
+
 	aia_set_hvictl(false);
 	csr_write(CSR_HVIPRIO1, 0x0);
 	csr_write(CSR_HVIPRIO2, 0x0);
@@ -539,6 +547,7 @@ void kvm_riscv_aia_enable(void)
 	csr_write(CSR_HVIPRIO2H, 0x0);
 #endif
 
+enable_gext:
 	/* Enable per-CPU SGEI interrupt */
 	enable_percpu_irq(hgei_parent_irq,
 			  irq_get_trigger_type(hgei_parent_irq));
@@ -559,7 +568,9 @@ void kvm_riscv_aia_disable(void)
 	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
 	disable_percpu_irq(hgei_parent_irq);
 
-	aia_set_hvictl(false);
+	/* The host is not allowed modify hvictl for TVMs */
+	if (!unlikely(kvm_riscv_cove_enabled()))
+		aia_set_hvictl(false);
 
 	raw_spin_lock_irqsave(&hgctrl->lock, flags);
 
-- 
2.25.1

