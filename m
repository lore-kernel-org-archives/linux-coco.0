Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFD1D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:11 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1a67bcde3a7so5056785ad.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942691; x=1684534691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EN7cfqRTuUxE4NYFTrE6RcyXhfZTP+XO506Z7P5jnSo=;
        b=2HntuY5n1tLM4pNJa7nz4osjLmrd+gHhTujKcUSE8JGJeCF47AW9Dyj0rRPbdS8CKR
         ec8mdHxJp3zhFL+VPoHjKpwqqItbmuGrX1ePOLL/H/CjhizNW48AJx/+m0SEc6hw+lrg
         4TAnXTUfT+76XBgFTJYmo+eDlVergYm7g4UDIIG8q8towz6RIKhd0qUN5gI1M3MPJ6Yf
         v6+fwgTgJxyGyevBN2wreiHgOozsBMp0FBa2pY9PJ2gXBMvj4I9WYLUgQzPavzY4XGMn
         BfwkMktMwYiFO0NHEmqBJ8uwsXt7UjR2yMhk7oglZtm60MHD5OqGzZFoQLQcULwN1VOW
         9p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942691; x=1684534691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN7cfqRTuUxE4NYFTrE6RcyXhfZTP+XO506Z7P5jnSo=;
        b=ZfKZ5COh/YAfwaj+17jUHhx1gwVZfxvmPqZU20RMIiyIh+UGktI8qjBI6wicbU5PDj
         9lAP7O0Pwlp2lLS8F7BSHBqZ56J/LVw4ZHTxBoiPfy+ngTf4b7jXzXAG4UcA1AOsSnMk
         9aHUwO6CXUBUE/INpy/pTqmCcIJjpX9ff0faykcvSqNtjn4qcFmx2OOcK4jDjPHH+uma
         YcZfpM/evcAqYq1JE0MaZFBGPSiaMRl3o+9t/yUUzh/LtJqIt1pIhPSyYyttBVbHap/z
         PUDfu/oR3Mm6NqkKVtMg9myJ7P1eF/cohgq66+frbJwF2WvnwjDNQAoy95QSwMHQNZIY
         X97w==
X-Gm-Message-State: AAQBX9eYpuXP6dqU8ngCZGl0XWgsyynXC6lzMDUFZxBrPBi/OJG/eMzr
	ofz+332mDprOzROJAisbUkB7nA==
X-Google-Smtp-Source: AKy350ZYsA8lzJG7NSbCoTlmBQanAcDJyPETNQetpvDDQv9McJwUAM0nHCIZ5qbS6IwUoaXgRnH5YQ==
X-Received: by 2002:a17:902:8b8a:b0:1a6:dfb3:5f4b with SMTP id ay10-20020a1709028b8a00b001a6dfb35f4bmr5466195plb.55.1681942691242;
        Wed, 19 Apr 2023 15:18:11 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:11 -0700 (PDT)
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
Subject: [RFC 19/48] RISC-V: KVM: Register memory regions as confidential for TVMs
Date: Wed, 19 Apr 2023 15:16:47 -0700
Message-Id: <20230419221716.3603068-20-atishp@rivosinc.com>
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

The entire DRAM region of a TVM running in CoVE must be confidential by
default. If a TVM wishes to share any sub-region, the TVM has to
request it explicitly with memory share APIs.

Mark the memory region as confidential during vm create itself.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/mmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 4b0f09e..63889d9 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -499,6 +499,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 
 	mmap_read_lock(current->mm);
 
+	if (is_cove_vm(kvm)) {
+		ret = kvm_riscv_cove_vm_add_memreg(kvm, base_gpa, size);
+		if (ret)
+			return ret;
+	}
 	/*
 	 * A memory region could potentially cover multiple VMAs, and
 	 * any holes between them, so iterate over all of them to find
-- 
2.25.1

