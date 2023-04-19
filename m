Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36CCD300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:17:38 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso188707a12.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942658; x=1684534658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ur77tHINwX+qbUdlSGnRNMwUnwDaAVVcewhgSBhFUx0=;
        b=c18b6HjhB6xZTijYQX2nimbdoBlIXr9qBNm2sHraX79sumJ2mnHyyAF4iUwGRyqfEL
         BhG5ZneVkTF9bRo5tCCiGvsNVcpWUKCNmPy0vd1ZqJvuNoQxq1qR6f9cnB7vi+C19Hpt
         5xUpfFR1k+6B8FbGHFbFXaZtvW/H2sqgRRevhtG9hluShqAQzpot/WQd/qsXuDNgOnpx
         pk3tmGjn1iUOEgqZ0Ek3rQdbQ5Ky98ttJ9TAom0YVfPe7HTavUoUAmMw/LDuEdRosyc4
         CHRnQ9rCEYyXJCmVNUHBEGkpIQ2ljog3inmdpJcdTAOUNGgtwJP32aGziItUDdOFTV+8
         kKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942658; x=1684534658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ur77tHINwX+qbUdlSGnRNMwUnwDaAVVcewhgSBhFUx0=;
        b=EQ6Nuagm9cf9GqY0+HEUubNeJyqhgKqG0cj8VAKP76eOgbZpLXjBIUlCQwd1cbhHhS
         s43XUjWq50J11x4gdsTbrrBTXE8T1KKQN6p+I8VD/TZplsaiFBgLoKka7KLf1QOVoRm0
         qt0Qnw5VLjI+zMcFU8pbxucTWnTQZijeCsu83inB+EcVbF5TSz0ZpDrVmd9Hajgsjumx
         2Oeh0IN4tZAdbZ4fA4/ihPmssVpi2Yr2E+YYG4heF39NrzNAoz2OEVE7F62oJNaulEQ7
         LQu/iJoMFieWmoIPRodByD2S4kPOYE+orMSRA0pbjwo0ggdl3LLEITMHs+BSc2xqo+HM
         pazA==
X-Gm-Message-State: AAQBX9cAP05oKdh91UzzODXHnUbu7PjqwoXIq0/9wsaE3/p0WhjUz23c
	SaTUM1h95mJ04nC1uVwA4Ml3og==
X-Google-Smtp-Source: AKy350ZqgGYrfhLdHBkYHvd+cLv1LSY5KY8FQdwstau4aKvHx0NnJWKbJ8fq3mAaGG3s8B2dSOXS2Q==
X-Received: by 2002:a17:903:1210:b0:1a6:4a64:4d27 with SMTP id l16-20020a170903121000b001a64a644d27mr7782580plh.40.1681942658444;
        Wed, 19 Apr 2023 15:17:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:38 -0700 (PDT)
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
Subject: [RFC 04/48] RISC-V: KVM: Add a helper function to get pgd size
Date: Wed, 19 Apr 2023 15:16:32 -0700
Message-Id: <20230419221716.3603068-5-atishp@rivosinc.com>
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

The cove support will require to find out the pgd size to be used for
the gstage page table directory. Export the value via an additional
helper.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/mmu.c              | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 8714325..63c46af 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -313,6 +313,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
 void __init kvm_riscv_gstage_mode_detect(void);
 unsigned long __init kvm_riscv_gstage_mode(void);
 int kvm_riscv_gstage_gpa_bits(void);
+unsigned long kvm_riscv_gstage_pgd_size(void);
 
 void __init kvm_riscv_gstage_vmid_detect(void);
 unsigned long kvm_riscv_gstage_vmid_bits(void);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f0fff56..6b037f7 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -797,3 +797,8 @@ int kvm_riscv_gstage_gpa_bits(void)
 {
 	return gstage_gpa_bits;
 }
+
+unsigned long kvm_riscv_gstage_pgd_size(void)
+{
+	return gstage_pgd_size;
+}
-- 
2.25.1

