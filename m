Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2166D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:24:04 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-517c840f181so185721a12.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943044; x=1684535044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXsqDGUR1sIAzl083YrDdeF8Dcz5MG5TcoJ+FCFYQPE=;
        b=ohOEHO7BV/FHEqjDiY6pG/sbPPkvlHxUUXDxUV7dZqgZIIWVcpKe0qvs+coh7D9ZRh
         B9hkxCLFKh8o9nAC2rlRn7bMm1mBtWYtjnNK9pkEtJDD583cXnspj2Ze6kFtPx4sD05T
         M0i9ezLAErgLCl4r/YZAwl7ub1kBW72A2bCM2VN+GllxhNlhbw4174U5Fs0Rqs8lwuLx
         6dFmv6DPhfk7Q0h+47Fu4cY06lgOcb8Yfc8WZoxCPJavUfQg727zdhXtl53U+ZG5ga3H
         Ua4k+o9Cp2yjV6jziSpH7zmCITKPG2JXN/AwelqUy5IqPzKZ18t594Y0qlAjZCJGwgwu
         OUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943044; x=1684535044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXsqDGUR1sIAzl083YrDdeF8Dcz5MG5TcoJ+FCFYQPE=;
        b=DzTmNBKVXeSWaSxWzjKXf+Qj0RkY3uFIAe88ZG96mLWhLqeCLaRsof+Dyoc0dY7MMo
         wJX4V86E8QFS8iRIuRvNFupFMKQgkL0uCMal2GmjmdH/osTItMOlPbBNPCFW1ifoHobt
         61r5IXUBtZqGnUQoEdUjS/gBKI8+QDQZL5gXbBHswHnXqkhfDdqAczA2K5vY79wq5sNS
         iOm5uNCZFqe90LDJEd/8YUZr7rdzBGcJ1MOJFnjSt6T0UXCUB8jmWzHUDiS7iofA9QJY
         6J2Vzg/bhPPMvsnpx6RbtO0xv19tRmxKg7+ElmpVAwn6e4IalZamPf8zb00Ok6Lj4OV1
         z7kQ==
X-Gm-Message-State: AAQBX9cW1NrDrBsEywOrb0U9b8klN1hbQijpoRYLLLhnR9IurxFMhmlD
	nN3vJ3q7kWagT9AVhzbQOIpJUw==
X-Google-Smtp-Source: AKy350ZHJJEltFWMtiEqeoirE/coBcaQIIAAD+T2dcklEUVhjT2GbyU5FBvkRUpdkDap1R/DwivJLA==
X-Received: by 2002:a17:90a:be01:b0:247:1e30:5880 with SMTP id a1-20020a17090abe0100b002471e305880mr3727645pjs.38.1681943044256;
        Wed, 19 Apr 2023 15:24:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:04 -0700 (PDT)
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
Subject: [RFC kvmtool 01/10] riscv: Add a CoVE VM type.
Date: Wed, 19 Apr 2023 15:23:41 -0700
Message-Id: <20230419222350.3604274-2-atishp@rivosinc.com>
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

The KVM needs to distinguish if an user wants to create a CoVE VM instead
of a traditional VM. Define a RISC-V specific CoVE VM type that can be
passed as a VM type.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index ba4c4b0..000d2b9 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -911,6 +911,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
 #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
 	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
+
+#define KVM_VM_TYPE_RISCV_COVE  (1UL << 9)
 /*
  * ioctls for /dev/kvm fds:
  */
-- 
2.25.1

