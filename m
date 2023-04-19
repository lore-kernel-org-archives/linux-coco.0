Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE1D303
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:43 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-51b6d0b9430so211555a12.2
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942723; x=1684534723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQCEa95xde61G0+g1spWAS5gSK9slN4MB0K1b9QrdE8=;
        b=Ynw03ruOG3PNfgG00HUUd7HJCh15VY3aEZKHBX+JvWIZqAaPdtZJFMNC9sQ+7tdyNf
         gQij1krIXgqHn6c3FKneR90d+ObOiz01SLEvx89Co8mtqMDidl42AKlK9b8IeRrjhkVj
         wFMRWmBw0WyiUKSEW2tAX/U5AjDnycCzdvc7/5XQe2CDXdqSpATkNcRDmxBB2iAZSbfO
         Qe8Etb6nnDF5lWA9UfVwL0EYoHqQHL5jKdNdyJEbe8jXSsaw1PcWzy6qONpwtJLTmV1a
         iWDDSsLQLNxRbxPSgzzxgbkJX9sxpOs3jDYDbGE18ziPonHZ9Lw5ZRGoMLwBsGOpngcC
         aTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942723; x=1684534723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQCEa95xde61G0+g1spWAS5gSK9slN4MB0K1b9QrdE8=;
        b=OOPJJIjC3ZFEzx5LFR0i1K9DrjDotPo6fCfS5eVorhNqDAJAObC6hLO9ZHNwCVB/xO
         75pRs5DBohr1wZb1D+ZhygjCkCUblWLPMmdigrCw1L266zGsHdh/d58QtBmXogcJ3Z1m
         Myq6ZAOMj8tpuBLGFqRnF/yrowJfRIP+hQXHoiS5pcPNsDvSXKZKRXw7KM6xa4SST5Ao
         LFMjg2KxTnvQjjhad81Hsq8dogiIXSCByfzrjPhE2DgWudRbLwFMUGHXHvtxIriK7uLQ
         SvmX62kCofBtu/hNHKJ7prtpgYHEYRTiyTVlo6C/jZg55wrs25IEIYpxa7x2Ee3QDkGR
         a2Bg==
X-Gm-Message-State: AAQBX9eph+RAWUT2XDUMgzp9p7u2VDmPF+PvyDxViAxE6rbmyVE5dfc8
	GVRZu4ycdYIBtWQ5UjowlNnYV1PzsquAYrWJToQ=
X-Google-Smtp-Source: AKy350a8Ym8XHInuF0mFeXBc2+oA8kajjJCNeYyHi0F4HD8cqx1mngs6rpkeTwZ7fiAYwBWCbSvEDg==
X-Received: by 2002:a17:902:ba89:b0:1a9:2693:2e29 with SMTP id k9-20020a170902ba8900b001a926932e29mr1536823pls.42.1681942722916;
        Wed, 19 Apr 2023 15:18:42 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:42 -0700 (PDT)
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
Subject: [RFC 33/48] RISC-V: KVM: Hookup TVM VCPU init/destroy
Date: Wed, 19 Apr 2023 15:17:01 -0700
Message-Id: <20230419221716.3603068-34-atishp@rivosinc.com>
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

The TVM VCPU create function requires the vcpu id which is generated
after the arch_create_vcpu returns. Thus, TVM vcpu init can not be
invoked from the arch_create_vcpu. Invoke it in post create for now.
However, post create doesn't return any error which is problematic
as vcpu creation can fail from TSM side.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 65f87e1..005c7c9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -218,6 +218,17 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 {
+	int rc;
+	/*
+	 * TODO: Ideally it should be invoked in vcpu_create. but vcpu_idx
+	 * is allocated after returning create_vcpu. Find a better place to do it
+	 */
+	if (unlikely(is_cove_vcpu(vcpu))) {
+		rc = kvm_riscv_cove_vcpu_init(vcpu);
+		if (rc)
+			pr_err("%s: cove vcpu init failed %d\n", __func__, rc);
+	}
+
 	/**
 	 * vcpu with id 0 is the designated boot cpu.
 	 * Keep all vcpus with non-zero id in power-off state so that
@@ -237,6 +248,9 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_pmu_deinit(vcpu);
 
+	if (unlikely(is_cove_vcpu(vcpu)))
+		kvm_riscv_cove_vcpu_destroy(vcpu);
+
 	/* Free unused pages pre-allocated for G-stage page table mappings */
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
 }
-- 
2.25.1

