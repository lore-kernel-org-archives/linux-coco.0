Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE0D303
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:58 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-24736790966so213052a91.2
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942738; x=1684534738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnnJUnDn5Gg0VxA4G2224aJuFesVpwMyXWuJ35Yh1EA=;
        b=qN2qG27GHv+d9gUwWztkTi8p+g3aaC2rFXOZGwLc8eAMBqzRu7eT8kWoOJLWLTW0Eo
         Z5lYOlCFWymONdQ75UX7d1w0T/hT7irv6Jb4eLBvu7abb5vVm52aXVMSJ1GMw0Dbzqsr
         +1z7/IHpZr9TOWWv65z2G7cezkDsdmOF3T3T+GedPiWIaC/Kuy6PLSFoobdSxJzll2MD
         g1noklYQNjPoDJtmIYCLWo0ww78Wd6QJJJ0qNcx7/a9E59ARcqxtApq0JG/1pIkk/aOb
         ezm4wy13mbTPlO+a9FFwfpQuhkNR1dmeg9ddTlU2Pq0Tpw9j5c0vXUUJGHEIdY9VbyGW
         1hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942738; x=1684534738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnnJUnDn5Gg0VxA4G2224aJuFesVpwMyXWuJ35Yh1EA=;
        b=BqH3hXW4WfreFcIRmGtoovvYmO5NADd2BY5BzzsdbGakf+HidSFqlJNcxCni6xKMbJ
         7dI6ucMabXVtRhhBNajfYZVuqgs7LDvFlfChFNC1XLYtlJEN4ChbG1M8VfDi5F3syCv1
         irujsM1ZlGDKGdDf6ddPCUKjrrnmwiDpY/7yy3ntuFtjNUI9V1rO0pmwcNtOOrvOpx5E
         fAXenuyRkioAngBV2sM78P9QSz69RpDAH5QHHqSo5MbkbyOaK6PflQ4N+vpKWdfcnbWt
         bPtVF5EDZSOT0JJdOurqjIAJCGhYXxvE1EvXAViqSjWwqokRv4+vYa2IlDGt6QKrMQ9m
         KpKA==
X-Gm-Message-State: AAQBX9e/q2E3UGkOBayku0knKVxdeV6BpLEzNqAglTmJqglSSGX1A5Vu
	YfSQgaf/SIIsCU5S99YZnmTR3A==
X-Google-Smtp-Source: AKy350aHmxw5PVAlBIl9T883RKpr61ycrn0Nkrml8nQtl+RbpvzosCcY4lybRtm63StCXT7HS5Gtsg==
X-Received: by 2002:a17:90b:38c6:b0:237:c209:5b14 with SMTP id nn6-20020a17090b38c600b00237c2095b14mr3820467pjb.22.1681942738315;
        Wed, 19 Apr 2023 15:18:58 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:58 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
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
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 40/48] RISC-V: COVE: Add COVH invalidate, validate, promote, demote and remove APIs.
Date: Wed, 19 Apr 2023 15:17:08 -0700
Message-Id: <20230419221716.3603068-41-atishp@rivosinc.com>
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

SBI_EXT_COVH_TVM_INVALIDATE_PAGES: Invalidates the pages in the specified
range of guest physical address space. The host can now work upon the
range without TVM's interaction. Any access from TVM to the range will
result in a page-fault which will be reported to the host.

SBI_EXT_COVH_TVM_VALIDATE_PAGES: Marks the invalidated pages in the
specified range of guest physical address space as present and TVM
can now access the pages.

SBI_EXT_COVH_TVM_PROMOTE_PAGES: Promotes a set of contiguous mappings
to the requested page size. This is mainly to support huge-pages.

SBI_EXT_COVH_TVM_DEMOTE_PAGES: Demotes a huge page mapping to a set
of contiguous mappings at the target size.

SBI_EXT_COVH_TVM_REMOVE_PAGES: Removes mappings from a TVM. The range
to be unmapped must already have been invalidated and fenced, and must
lie within a removable region of guest physical address space.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove_sbi.h | 16 +++++++
 arch/riscv/include/asm/sbi.h          |  5 +++
 arch/riscv/kvm/cove_sbi.c             | 65 +++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove_sbi.h b/arch/riscv/include/asm/kvm_cove_sbi.h
index 0759f70..b554a8d 100644
--- a/arch/riscv/include/asm/kvm_cove_sbi.h
+++ b/arch/riscv/include/asm/kvm_cove_sbi.h
@@ -59,6 +59,22 @@ int sbi_covh_create_tvm_vcpu(unsigned long tvmid, unsigned long tvm_vcpuid,
 
 int sbi_covh_run_tvm_vcpu(unsigned long tvmid, unsigned long tvm_vcpuid);
 
+int sbi_covh_tvm_invalidate_pages(unsigned long tvmid,
+			     unsigned long tvm_base_page_addr,
+			     unsigned long len);
+int sbi_covh_tvm_validate_pages(unsigned long tvmid,
+			       unsigned long tvm_base_page_addr,
+			       unsigned long len);
+int sbi_covh_tvm_promote_page(unsigned long tvmid,
+			      unsigned long tvm_base_page_addr,
+			      enum sbi_cove_page_type ptype);
+int sbi_covh_tvm_demote_page(unsigned long tvmid,
+			     unsigned long tvm_base_page_addr,
+			     enum sbi_cove_page_type ptype);
+int sbi_covh_tvm_remove_pages(unsigned long tvmid,
+			      unsigned long tvm_base_page_addr,
+			      unsigned long len);
+
 /* Functions related to CoVE Interrupt Management(COVI) Extension */
 int sbi_covi_tvm_aia_init(unsigned long tvm_gid, struct sbi_cove_tvm_aia_params *tvm_aia_params);
 int sbi_covi_set_vcpu_imsic_addr(unsigned long tvm_gid, unsigned long vcpu_id,
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index e02ee75..03b0cc8 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -369,6 +369,11 @@ enum sbi_ext_covh_fid {
 	SBI_EXT_COVH_TVM_CREATE_VCPU,
 	SBI_EXT_COVH_TVM_VCPU_RUN,
 	SBI_EXT_COVH_TVM_INITIATE_FENCE,
+	SBI_EXT_COVH_TVM_INVALIDATE_PAGES,
+	SBI_EXT_COVH_TVM_VALIDATE_PAGES,
+	SBI_EXT_COVH_TVM_PROMOTE_PAGE,
+	SBI_EXT_COVH_TVM_DEMOTE_PAGE,
+	SBI_EXT_COVH_TVM_REMOVE_PAGES,
 };
 
 enum sbi_ext_covi_fid {
diff --git a/arch/riscv/kvm/cove_sbi.c b/arch/riscv/kvm/cove_sbi.c
index a8901ac..01dc260 100644
--- a/arch/riscv/kvm/cove_sbi.c
+++ b/arch/riscv/kvm/cove_sbi.c
@@ -405,3 +405,68 @@ int sbi_covh_run_tvm_vcpu(unsigned long tvmid, unsigned long vcpuid)
 
 	return 0;
 }
+
+int sbi_covh_tvm_invalidate_pages(unsigned long tvmid,
+			     unsigned long tvm_base_page_addr,
+			     unsigned long len)
+{
+	struct sbiret ret = sbi_ecall(SBI_EXT_COVH,
+				      SBI_EXT_COVH_TVM_INVALIDATE_PAGES, tvmid,
+				      tvm_base_page_addr, len, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tvm_validate_pages(unsigned long tvmid,
+			       unsigned long tvm_base_page_addr,
+			       unsigned long len)
+{
+	struct sbiret ret = sbi_ecall(SBI_EXT_COVH,
+				      SBI_EXT_COVH_TVM_VALIDATE_PAGES, tvmid,
+				      tvm_base_page_addr, len, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tvm_promote_page(unsigned long tvmid,
+			      unsigned long tvm_base_page_addr,
+			      enum sbi_cove_page_type ptype)
+{
+	struct sbiret ret = sbi_ecall(SBI_EXT_COVH,
+				      SBI_EXT_COVH_TVM_PROMOTE_PAGE, tvmid,
+				      tvm_base_page_addr, ptype, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tvm_demote_page(unsigned long tvmid,
+			     unsigned long tvm_base_page_addr,
+			     enum sbi_cove_page_type ptype)
+{
+	struct sbiret ret = sbi_ecall(SBI_EXT_COVH,
+				      SBI_EXT_COVH_TVM_DEMOTE_PAGE, tvmid,
+				      tvm_base_page_addr, ptype, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tvm_remove_pages(unsigned long tvmid,
+			      unsigned long tvm_base_page_addr,
+			      unsigned long len)
+{
+	struct sbiret ret = sbi_ecall(SBI_EXT_COVH,
+				      SBI_EXT_COVH_TVM_REMOVE_PAGES, tvmid,
+				      tvm_base_page_addr, len, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
-- 
2.25.1

