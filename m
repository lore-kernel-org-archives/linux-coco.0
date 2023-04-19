Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C89ED303
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:17:36 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1a516fb6523so5305435ad.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942656; x=1684534656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQ+Q1EB8U9VN9DkQE/7ZRwGYKH2CHxTB2A2ZNISqIdY=;
        b=M7pMYKMh2fzPlQxiN+Er+1mRXb5xsvVBR/kCf0Xc6I4eRmeu17ZWxN3F+8Uh4bOfYt
         pLsryNkeitFt3/g2LwdIO4gRgf1eK0d0zd3qJJmJH0/Ytd9PXb2f4ZIv2vw9qF7rcmT+
         +/5fNVmr7py0CepFxvid91vQee8LTDJ1trxwVh1r+SZa6D1ybCiNK5WtQpwcXBYzwzon
         14Dk5NjS3zvhDHWUiYkgfDVG/0CawxYwCekaOcRjbz+KKATicit8f2wKNBE+FUv2M2pL
         VFRS7BwOkXZ7Z6aFPV2U5r0uWlcE+ptOAW8XtsMKVeJj+vK+/KtMoB1U0hUKE2I995ZX
         1ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942656; x=1684534656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ+Q1EB8U9VN9DkQE/7ZRwGYKH2CHxTB2A2ZNISqIdY=;
        b=A33FMhT2l/uyabraVzX5li2E8RL3Ziq/7Vvfu1FUXsr+KSUr17FrV0hhAkF+55Uk1K
         OCz0z+1cyknU7KVuvlGMyFdLd+euihi2NIhmgAk6ug5LDvAOdfaVaDdp/EtstB7MEmqi
         a/D0K7cQA+7vyCRpU4rkj7jpKx/iAczLhQ4OxJXsTf9Z+AR8S1c0+DiFTGGqa6gd8/Ax
         6QAcpnuH1lhUfjRlx0BKegbgEnkvoeTBs98CgcJbXbzGUrLOezFfNOQOqElBw+jlat7U
         h2sa3ljgoQyx+orU0NZ7oWcxe3HcY6QvbyVp5gTKq7OzLQLXoQ107nh2CdrmMeKGaw02
         qt8A==
X-Gm-Message-State: AAQBX9edEDZx1QDBPL0nktS1Z3FGMBoFZk/UzHTdLUzntODEx37YnbkA
	yI9Y94zDAL1OgrlQYzb8HXCyTg==
X-Google-Smtp-Source: AKy350ZJUiSSYrDjl7yi3RGe7KkMi+TjKSL1H9rjEJIsWoSyzpH0Qljb3g4DlHLMrKbT1BFQ8UiTyA==
X-Received: by 2002:a17:902:6bc1:b0:1a6:81fc:b585 with SMTP id m1-20020a1709026bc100b001a681fcb585mr6201339plt.41.1681942656169;
        Wed, 19 Apr 2023 15:17:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:35 -0700 (PDT)
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
Subject: [RFC 03/48] RISC-V: KVM: Invoke aia_update with preempt disabled/irq enabled
Date: Wed, 19 Apr 2023 15:16:31 -0700
Message-Id: <20230419221716.3603068-4-atishp@rivosinc.com>
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

Some of the aia_update operations required to invoke IPIs that
needs interrupts to be enabled. Currently, entire aia_update
is being called from irqs disabled context while only preemption
disable is necessary.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e65852d..c53bf98 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1247,15 +1247,16 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		kvm_riscv_check_vcpu_requests(vcpu);
 
-		local_irq_disable();
-
 		/* Update AIA HW state before entering guest */
+		preempt_disable();
 		ret = kvm_riscv_vcpu_aia_update(vcpu);
 		if (ret <= 0) {
-			local_irq_enable();
+			preempt_enable();
 			continue;
 		}
+		preempt_enable();
 
+		local_irq_disable();
 		/*
 		 * Ensure we set mode to IN_GUEST_MODE after we disable
 		 * interrupts and before the final VCPU requests check.
-- 
2.25.1

