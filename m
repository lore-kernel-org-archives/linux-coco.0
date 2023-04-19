Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AB5D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:47 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-63d4595d60fso2915965b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942727; x=1684534727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF8Qn0Z7zg/7RPDtBuNuOPN3zeJXhr/Jx4YP7Fj6yI4=;
        b=G/Fug0YDh/vT2gLC0JnMu9cK8/lm7JaHRK8wavACXkcusYj2LIYmBRBKMqHOqlZK+w
         4X0VmEj6BTotc/ZSwQ/hqCf5XFjDLPfMNoRWYQ9eoQMvSpOlejZpx2S6qdCGkDr0mV1j
         tz/t8nrgfTSM3p2DcPJ6IP/ULX8p9u8n4bLZ8UppcJfyijITcktTN9QxUA/PYL/GUGR2
         g1Dwy3qOR6S1EA5f1HDfH1/Z8AcgmbMd6OoD3Rpin7C3Tw7AepN0itfwNNwkxK4BS08T
         wI5vk6637oOkFsektud4GizoiS09rEJkFLg8xFSYn4+9QqroF/v5cNomyMNwCRJWPRAY
         /ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942727; x=1684534727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PF8Qn0Z7zg/7RPDtBuNuOPN3zeJXhr/Jx4YP7Fj6yI4=;
        b=SzGH06MxuZazHDLXKh9WsTn7OTrKSu+IHsGMJe9rtFpDd8PCQbIEe1KFtzyOLvbZyS
         3sMKj6sPvGUnzT/mIxGeQ/1FDsSIm6dufqb7xuF306LBE2nnBEGjOIEaygLdcLYap4Rf
         hhmtL673WDcHkqaovtATvzmh7ZUflkjmyFQEajLS5AOuS9S+H1HnFwd0wPOJTbmFn8YW
         MKYnNCmhll6wJm5O++FQ8t3BYso0N8n4Y0jGg7sjC2tqcBLFZ73DbUUBCM7cjYkhQz7N
         zQe6tIJvyHSi2NYdW7l7gKMa4iPFFQDa4FoxVpe6JBh+I999n+h0qu3UtiA/t0Qf0vIu
         R4ew==
X-Gm-Message-State: AAQBX9dqCSjp2/6kxN1rFEXll4apzH73sp2/2EsELEeKktlhC0LBSQI6
	NlNvsS4P3j1rpau+obw6FVYDzQ==
X-Google-Smtp-Source: AKy350Zh1JoIu/w89g7BU4hvCJLzB5n1X2PHzMgJ8jQn7nK1FJDYYuKYpLhfuRupPsetmV7URaqafw==
X-Received: by 2002:a17:902:ea03:b0:19b:64bb:d546 with SMTP id s3-20020a170902ea0300b0019b64bbd546mr4360345plg.18.1681942727339;
        Wed, 19 Apr 2023 15:18:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:47 -0700 (PDT)
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
Subject: [RFC 35/48] RISC-V: KVM: Add TVM init/destroy calls
Date: Wed, 19 Apr 2023 15:17:03 -0700
Message-Id: <20230419221716.3603068-36-atishp@rivosinc.com>
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

A TVM can only be created upon explicit request from the VMM via
the vm type if CoVE SBI extensions must supported by the TSM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 1b59a8f..8a1460d 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -42,6 +42,19 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		return r;
 	}
 
+	if (unlikely(type == KVM_VM_TYPE_RISCV_COVE)) {
+		if (!kvm_riscv_cove_enabled()) {
+			kvm_err("Unable to init CoVE VM because cove is not enabled\n");
+			return -EPERM;
+		}
+
+		r = kvm_riscv_cove_vm_init(kvm);
+		if (r)
+			return r;
+		kvm->arch.vm_type = type;
+		kvm_info("Trusted VM instance init successful\n");
+	}
+
 	kvm_riscv_aia_init_vm(kvm);
 
 	kvm_riscv_guest_timer_init(kvm);
@@ -54,6 +67,9 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_destroy_vcpus(kvm);
 
 	kvm_riscv_aia_destroy_vm(kvm);
+
+	if (unlikely(is_cove_vm(kvm)))
+		kvm_riscv_cove_vm_destroy(kvm);
 }
 
 int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,
-- 
2.25.1

