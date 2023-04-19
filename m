Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46BD300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:45 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1a682eee3baso4404945ad.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942725; x=1684534725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V944izAfHfvPXt2SodYy8axfAv3FUhh/YjA49qCII3Y=;
        b=WToiBYM90+kXSHR4f4lcMC2do7CnNE609AkBJ9ILRsQSAqLQhvGE4fka9RZc7XkmOV
         nVSgbPgR0g26+R9aOz7prZ0ZYw39dV9KxvmHBGDvRgR8MR74QfL1ZHIt8XSWqAKcLN8r
         0f6Tq006zXgK2g4OuuillctnBCZLY1xVWuRZMqYQdfd3ybKvutxZLqu19QqqHmXC8ODS
         KoYa4jRQnyk9O92MghnQdSKIAU/AWL4fTpgXKATBvPLDFP59BwJ0oeGTqTbRTShwnDj2
         1+Ojob0S1CfD+/Tznk4BIbXVZIp9qmP+FcBhkm6vxxe63VSq5U1n2NJ31boDb5/Auf9y
         qI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942725; x=1684534725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V944izAfHfvPXt2SodYy8axfAv3FUhh/YjA49qCII3Y=;
        b=A0lQezfBa+HuADJ1CUdUXOrepBz9w7UUv9MKH2+iZtrqgCWpCXUPee0LEb5L7jWcRL
         fEsDP/0MUH0v1sLptqM1SSLvaZJnCRYBSG21F5Hh+ehWV85gUTXJEJSxY0GxqqpuR8ji
         PFbCxmz5T1RtgXb9zjIceVDEkK5Qi79hAxCZg+i42c/3svlrQJQvvmz6B4nWF7t/SVnb
         6mzgjnuqt8oJ4yBa6GLJXMDbLfYWyir14eGtSup0oEEJmZOzX/nXzDCh+l2SChSaU1KA
         PobzBCzUlotyBNIKC8w51oK19Q3wTohg3xk16w+TvAajep2rK3z5nqn3GIH29d0OBM8Z
         wpuQ==
X-Gm-Message-State: AAQBX9eQldjCkV+zd6kdmy0VWky1I894pgNo+ltgv68HN+tp5Oxa4NTY
	/dL68VP6/kJF6xP8/ajMHwjL5g==
X-Google-Smtp-Source: AKy350Z1qByMTGJhiqV3zdWqTg/zhHnUn1VfTimSG0DF0as79Rscca2Gz4ZKZ2NL/Pi2zbK61ibEFw==
X-Received: by 2002:a17:903:2409:b0:19e:839e:49d8 with SMTP id e9-20020a170903240900b0019e839e49d8mr6224177plo.59.1681942725072;
        Wed, 19 Apr 2023 15:18:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:44 -0700 (PDT)
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
Subject: [RFC 34/48] RISC-V: KVM: Initialize CoVE
Date: Wed, 19 Apr 2023 15:17:02 -0700
Message-Id: <20230419221716.3603068-35-atishp@rivosinc.com>
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

CoVE initialization depends on few underlying conditions that differs
from normal VMs.

1. RFENCE extension is no longer mandatory as TEEH APIs has its own set
of fence APIs.
2. SBI NACL is mandatory for TEE VMs to share memory between the host
and the TSM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 842b78d..a059414 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -102,15 +102,12 @@ static int __init riscv_kvm_init(void)
 		return -ENODEV;
 	}
 
-	if (sbi_probe_extension(SBI_EXT_RFENCE) <= 0) {
-		kvm_info("require SBI RFENCE extension\n");
-		return -ENODEV;
-	}
-
 	rc = kvm_riscv_nacl_init();
 	if (rc && rc != -ENODEV)
 		return rc;
 
+	kvm_riscv_cove_init();
+
 	kvm_riscv_gstage_mode_detect();
 
 	kvm_riscv_gstage_vmid_detect();
@@ -121,6 +118,15 @@ static int __init riscv_kvm_init(void)
 		return rc;
 	}
 
+	/* TVM don't need RFENCE extension as hardware imsic support is mandatory for TVMs
+	 * TODO: This check should happen later if HW_ACCEL mode is not set as RFENCE
+	 * should only be mandatory in that case.
+	 */
+	if (!kvm_riscv_cove_enabled() && sbi_probe_extension(SBI_EXT_RFENCE) <= 0) {
+		kvm_info("require SBI RFENCE extension\n");
+		return -ENODEV;
+	}
+
 	kvm_info("hypervisor extension available\n");
 
 	if (kvm_riscv_nacl_available()) {
-- 
2.25.1

