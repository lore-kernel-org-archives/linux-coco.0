Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C58ED303
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:17:34 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1a516fb6523so5305075ad.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942654; x=1684534654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TviUiXCC6v39lMS4rfPLGE9Pfx0aaxYAF0PLkJZJ+44=;
        b=fw3FXTdDZVAQaqNcpqxhJ5jCbeJxZbbRCeUP7dUA0xboMzGhByaEInJPZwYw9bXQXk
         ARHWS0qP1pZrTXclentFqb6h5U2ua9sUZm6vZcXmwvDFczjrVihV2Nra1Jc2/WF5XyU2
         0JadbkEFEI0//guHLR6qxF3JNYLlwaQIZD991cfubV5PenBiFCNtb6hgKaPgRSq66vCg
         e+VFqjLE6civs190GuIRI3K+ZsW+0KEkHzSOhGggkx8qfJ2wZO5KlkmScX+zwalNjqk6
         RuMOo25mdsFietap8z25HKARP1geAiwoigenSaj60oBOp8w+6PxBWZ/NPdxHu1rx5LuB
         U5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942654; x=1684534654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TviUiXCC6v39lMS4rfPLGE9Pfx0aaxYAF0PLkJZJ+44=;
        b=VJG5RhYTbolXeRYsI4m3m2PUStlDxwca9YmDWJ2kovB2zds+Vf1/OftMC6zHn8sSbH
         iJw3RLZN2jwt3fEOsPaO55NwIRfZ6VLp2KKIHQZtIzFsSBmCScHaaJQPIXR8VNIGtk2r
         44Blmzl8sIRhl+dAK+gdRjbW3csnNliLCEpiCilvq/+7Ra+AeRZzzPrfIijM1EimrPyk
         Sb0ONfizY4wpsQzmmnsCKhqIf+XR6CyNdms+Yc/vo/Bbx9MMHvHVkko1TZuPMIF06KtQ
         uTVsJLjQjjTU5gUwcOIQB7HGUppHDe3jjYKXL5GgwarSpaZGAZPxMPHE0RZhpIOnpnXU
         BUQQ==
X-Gm-Message-State: AAQBX9cCKL0rWIfq/PCwOVG1hY6cAEoOwnJgPAGvUGbJnyvoXoexYW2S
	+fDOmaW33Tv6M1Reflh1zSpn/Q==
X-Google-Smtp-Source: AKy350bx72vsD2gx/qhvw+4gm1lk9ECFZlAAwd4+tDv5bxVSjJh5w7Co6h0FkmAoPJamfBpYhAs0yQ==
X-Received: by 2002:a17:902:e80a:b0:1a1:cc5a:b04 with SMTP id u10-20020a170902e80a00b001a1cc5a0b04mr8122719plg.3.1681942654045;
        Wed, 19 Apr 2023 15:17:34 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:33 -0700 (PDT)
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
Subject: [RFC 02/48] RISC-V: KVM: Improve KVM error reporting to the user space
Date: Wed, 19 Apr 2023 15:16:30 -0700
Message-Id: <20230419221716.3603068-3-atishp@rivosinc.com>
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

This patch adds RISC-V specific cause for ioctl run failure.
For now, it will be used for the below two cases:

1. Insufficient IMSIC files if VM is configured to run in HWACCEL mode
2. TSM is unable to run run_vcpu SBI call for TVMs

KVM also uses a custom scause bit(48) to distinguish this case
from regular vcpu exit causes.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h      | 2 ++
 arch/riscv/include/uapi/asm/kvm.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3176355..e78503a 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -96,6 +96,8 @@
 #define EXC_VIRTUAL_INST_FAULT		22
 #define EXC_STORE_GUEST_PAGE_FAULT	23
 
+#define EXC_CUSTOM_KVM_COVE_RUN_FAIL	48
+
 /* PMP configuration */
 #define PMP_R			0x01
 #define PMP_W			0x02
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b41d0e7..11440df 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -245,6 +245,10 @@ enum KVM_RISCV_SBI_EXT_ID {
 /* One single KVM irqchip, ie. the AIA */
 #define KVM_NR_IRQCHIPS			1
 
+/* run->fail_entry.hardware_entry_failure_reason codes. */
+#define KVM_EXIT_FAIL_ENTRY_IMSIC_FILE_UNAVAILABLE (1ULL << 0)
+#define KVM_EXIT_FAIL_ENTRY_COVE_RUN_VCPU          (1ULL << 1)
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
-- 
2.25.1

