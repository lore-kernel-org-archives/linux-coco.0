Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58975D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:36 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-63b4dfead1bso376264b3a.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942716; x=1684534716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1210zPiD8zHFMhzBINzpx5nEW8Eoe5MAD0zhuCIRKc=;
        b=ANhU+J8nQWq2obESgBEJE0X9NLT82kBUBDzc1BRbSeZ1EgPeiOl0GddoyWaEPDRU8N
         vnwjEIo0UjaS9xezvAc/UGttMWlJo7ew/iqSZCawFdCpXkbeL6whYMnxnv1UE0Mkzjl9
         zxU19X9QWwNQwOpt5WP+CxQUT1ZA3xUcznURR03bnG+WcdbBRPDMOVkCCCi+rkT0f8qL
         85oGYhbbNz2xb1HJWq0YwM9QGXFDFKbWMgSuumHQ7xfEhCPnY/6ETL+ra68ruaG7yl2u
         qOhetkOJdoWKqEsNNxd/aiUVnUUF2SqhhyrAmB8w+eSk+hd8cQeWPbuaUf1XaZLgT9mw
         WXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942716; x=1684534716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1210zPiD8zHFMhzBINzpx5nEW8Eoe5MAD0zhuCIRKc=;
        b=eqZabWdjqAJAoemGq81h/6GQjdXTricR+lIFSAUmUYd/S0ZG/pZyZPaBlm6Q4KRa7W
         gQKp5J18MmNx6WTbSjcotF4W2R+2M9+c9BHrRsRrYhWcUqNt7DJGNKuqOIv7jnQKi9Nx
         XXsMVIWCScm9ZBFfzFZoV//wd5rsssALgzNhdiK4Z732/wPJYHj/6qitLJcALV7fXZEN
         qHy59pWeAoCuEyaavcaFB+S4D27E+enFepdxcwXjnR6nUQbJTXZQ8elN3zYQ6t7X4YHt
         QzwoEsVrbHXCCcR2xOkvm3Vk28F631HbsZjvrXNQRK0Z5muILArLKRonH/IUr95WuYib
         4sWw==
X-Gm-Message-State: AAQBX9fq06QKuQUoDeaEp2RVoUx2xq+MKOvUlG2vgmAAyQEsXJuHRMc/
	rKl0Vhtzn7zg5skXXNj1Ufq43A==
X-Google-Smtp-Source: AKy350YnFYoQc/AGMgRzA7K3To1EBVIiHBUS1P/8MWh29k47wvhKo2iefk2kUhAwoVQIoToGy+/bcA==
X-Received: by 2002:a17:903:1c4:b0:1a1:ee8c:eeba with SMTP id e4-20020a17090301c400b001a1ee8ceebamr7881066plh.59.1681942715856;
        Wed, 19 Apr 2023 15:18:35 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:35 -0700 (PDT)
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
Subject: [RFC 30/48] RISC-V: KVM: Perform limited operations in hardware enable/disable
Date: Wed, 19 Apr 2023 15:16:58 -0700
Message-Id: <20230419221716.3603068-31-atishp@rivosinc.com>
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

Hardware enable/disable path only need to perform AIA/NACL enable/disable
for TVMs. All other operations i.e. interrupt/exception delegation,
counter access must be provided by the TSM as host doesn't have control
of these operations for a TVM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 45ee62d..842b78d 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -13,6 +13,7 @@
 #include <asm/hwcap.h>
 #include <asm/kvm_nacl.h>
 #include <asm/sbi.h>
+#include <asm/kvm_cove.h>
 
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
@@ -29,6 +30,15 @@ int kvm_arch_hardware_enable(void)
 	if (rc)
 		return rc;
 
+	/*
+	 * We just need to invoke aia enable for CoVE if host is in VS mode
+	 * However, if the host is running in HS mode, we need to initialize
+	 * other CSRs as well for legacy VMs.
+	 * TODO: Handle host in HS mode use case.
+	 */
+	if (unlikely(kvm_riscv_cove_enabled()))
+		goto enable_aia;
+
 	hedeleg = 0;
 	hedeleg |= (1UL << EXC_INST_MISALIGNED);
 	hedeleg |= (1UL << EXC_BREAKPOINT);
@@ -49,6 +59,7 @@ int kvm_arch_hardware_enable(void)
 
 	csr_write(CSR_HVIP, 0);
 
+enable_aia:
 	kvm_riscv_aia_enable();
 
 	return 0;
@@ -58,6 +69,8 @@ void kvm_arch_hardware_disable(void)
 {
 	kvm_riscv_aia_disable();
 
+	if (unlikely(kvm_riscv_cove_enabled()))
+		goto disable_nacl;
 	/*
 	 * After clearing the hideleg CSR, the host kernel will receive
 	 * spurious interrupts if hvip CSR has pending interrupts and the
@@ -69,6 +82,7 @@ void kvm_arch_hardware_disable(void)
 	csr_write(CSR_HEDELEG, 0);
 	csr_write(CSR_HIDELEG, 0);
 
+disable_nacl:
 	kvm_riscv_nacl_disable();
 }
 
-- 
2.25.1

