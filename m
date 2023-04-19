Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31752D304
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:17:50 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a66b9bd893so4663995ad.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942669; x=1684534669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T59m5JAZKpRDJgvlPNnQtLbeFsduDf6TBzeyZHAxXV0=;
        b=qjxNMIrl8HnhfIp/ecw72oYKFII9UTAwql/uMAHKk/FXlEBEiMQ66OH7eiwjlGKtCq
         fOjlVW3CuH2HqfOiNP9XRTFCzDI4+lJmQdsac4GSSp3r+OkcygCfPaztbk/heRGDIhKM
         pnYeif4EQ7Prrd5kCwoWu5m8+1XOIOkSJ78OzpuHzmCbajgIzTGS3QZn2FEzSLBwhiSb
         6w7a2QMSx0oX83P6+RuntF3wYcXCE4rbF3duzd0QwdejxuKey4lt6WjYMDej+sLNVh9T
         6z0R8DizcoQpeT/MVd47bfnzAc938aOKta+516VE8cUvwIwwgAey2BJajvvIriSfLlPU
         8bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942669; x=1684534669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T59m5JAZKpRDJgvlPNnQtLbeFsduDf6TBzeyZHAxXV0=;
        b=kqqLsTNZYcCtGrgaOiG0/rf6+zTMjfCUTJBcJGCz8k9VZcYhJ1W4CPVtI5WXOgjVlo
         QqB4sfStBNoycLfh/3k8Akvydl79v6wYow2pploUM30WkcTZeeDGbNlnklEDMYDygKx2
         w8aJUcjjqcz3RmAQrUUcnxzWZpoIQ3dkwSKHY3SNw1WitMuYfv3TsPebfwCd908YTePr
         a9emUgjIZwK3HB9DeqLREjTdIVZWNDAQS7LnfHB8AG8JWgl0azYtj3U3BiWA3sN7sZ21
         rHTNfeyVP/EmwpDQCu23R7gxHyMhT17ReDt6UwF1ihTh7oPd9bqM9713l7q0PSlqSscM
         F9Xw==
X-Gm-Message-State: AAQBX9fZqc/zxzzH6LfzaCDlxN9Q20UeQg3Km9oIEV0BZGBo/KVkm1WV
	4a1wewrxjiLFZDRck4CgZGAOTQ==
X-Google-Smtp-Source: AKy350a2O0VHJD6AXYzabb4g8786HYDihr3e7/POpprE3Ii6IVd/H8nE9VOR2CTMJgAkkR7C+O0Rjg==
X-Received: by 2002:a17:902:aa4a:b0:1a1:f0cb:1055 with SMTP id c10-20020a170902aa4a00b001a1f0cb1055mr6242462plr.28.1681942669632;
        Wed, 19 Apr 2023 15:17:49 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:49 -0700 (PDT)
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
Subject: [RFC 09/48] RISC-V: KVM: Add CoVE related nacl helpers
Date: Wed, 19 Apr 2023 15:16:37 -0700
Message-Id: <20230419221716.3603068-10-atishp@rivosinc.com>
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

The NACL SBI extension allows the scratch area to be customizable
per SBI extension. As per the COVH SBI extension, the scratch
area stores the guest gpr state.

Add some helpers to read/write gprs easily.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove_sbi.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove_sbi.h b/arch/riscv/include/asm/kvm_cove_sbi.h
index 24562df..df7d88c 100644
--- a/arch/riscv/include/asm/kvm_cove_sbi.h
+++ b/arch/riscv/include/asm/kvm_cove_sbi.h
@@ -17,6 +17,21 @@
 #include <asm/csr.h>
 #include <asm/sbi.h>
 
+#include <asm/asm-offsets.h>
+
+/**
+ * CoVE SBI extensions defines the NACL scratch memory.
+ * uint64_t gprs[32]
+ * uint64_t reserved[224]
+ */
+#define get_scratch_gpr_offset(goffset) (goffset - KVM_ARCH_GUEST_ZERO)
+
+#define nacl_shmem_gpr_write_cove(__s, __g, __o) \
+	nacl_shmem_scratch_write_long(__s, get_scratch_gpr_offset(__g), __o)
+
+#define nacl_shmem_gpr_read_cove(__s, __g) \
+	nacl_shmem_scratch_read_long(__s, get_scratch_gpr_offset(__g))
+
 int sbi_covh_tsm_get_info(struct sbi_cove_tsm_info *tinfo_addr);
 int sbi_covh_tvm_initiate_fence(unsigned long tvmid);
 int sbi_covh_tsm_initiate_fence(void);
-- 
2.25.1

