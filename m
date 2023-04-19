Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF3FD300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:24:15 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-63b70ca0a84so458587b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943055; x=1684535055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTLerH+RJ52lhodOQfma/DJulVaHZ1rN37E2HPQ1gqk=;
        b=a1bnzxGWwIOEAkq+19MIVfBP/ZCFCZqLmC1UeQSHZvEerwM1InrDlC+CNQjLasRYNY
         TG6B+BEbccXViq3GxUGM1S1bKt08GMbNh8cu2/7uvz8TADG5izCLZidY7kyXryOk8Cc+
         amepc4YX9EhmwedHzdpQaI6iQRwH2jqt2DPucE98CEAfI6Pi8SQBLcJ1U0kFZji/jcS3
         poVKHT9OeJbpVpJ3SjBehUYSR58tbT8ZMpTvtdSUCQHzPMMVlmcC1HTTyDhFywITeMq2
         sEJhC6uIWIrcV3571Eqlwgn/Fm+q+fD6bbuTOkEai1g6rHX8oYaeAhJEcO5b4iPV/t6d
         oGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943055; x=1684535055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTLerH+RJ52lhodOQfma/DJulVaHZ1rN37E2HPQ1gqk=;
        b=INiHMgDCPhNp+yUWu3mjYIwF/zuWLfDX3SUHIj+MTmjwD26Pz8FbiLsQKEF/DmrF12
         oF9EehsI7TMounDbe73dhzU6U7uS/ItQzpU8RIpX7CKCdXNHHEndcEZhfbjP6LJyhTyv
         Wuy18jVzCWYNwvlpGmoGGE1URsO8ct4s2PWwXGJZfOBx99oGpKFK38l/i1UIljMcpYWN
         YY/r5wWtzeKqX3LdzxiT4fcZWzPHJ+4qk0mH4Du3oaJfrzDB44fcMK7oB4VNF+aio98N
         HPsIDV7F3G06oy/sifDHbABykEwM8pufDtFkzlkGVlq05ccK1eMtyNklJJaqq2jzdnIh
         p6YA==
X-Gm-Message-State: AAQBX9cC+vOw26qAgK8DROlrhISvpsSvBwzFtLGm84Y/Wiwp6nh2lFWy
	PDgC/z/LdhXS5rpbjbXOK4irNg==
X-Google-Smtp-Source: AKy350biCI2sFr3cWCmld5tDykr7Z5GZPcCxF2zAi1qUg8p1jfhx7EqRslonbApZT3U9aoxz+Y7avQ==
X-Received: by 2002:a17:902:e5c7:b0:1a8:1436:c892 with SMTP id u7-20020a170902e5c700b001a81436c892mr5044406plf.14.1681943055547;
        Wed, 19 Apr 2023 15:24:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 07/10] riscv: Define riscv specific vm_type function
Date: Wed, 19 Apr 2023 15:23:47 -0700
Message-Id: <20230419222350.3604274-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V supports CoVE VMs now. It needs to setup correct VM type if the
user requests it.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/kvm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/riscv/kvm.c b/riscv/kvm.c
index 5f9b0d5..e728790 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -39,6 +39,18 @@ u64 kvm__arch_default_ram_address(void)
 	return RISCV_RAM;
 }
 
+int kvm__get_vm_type(struct kvm *kvm)
+{
+	if (kvm->cfg.arch.cove_vm) {
+		if (__riscv_xlen == 64)
+			return KVM_VM_TYPE_RISCV_COVE;
+		else
+			die("CoVE VM is not supported in RV32\n");
+	} else {
+		return KVM_VM_TYPE;
+	}
+}
+
 void kvm__arch_validate_cfg(struct kvm *kvm)
 {
 }
-- 
2.25.1

