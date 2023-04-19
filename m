Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43734D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:24:21 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1a526aa3dd5so5221835ad.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943061; x=1684535061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joeGaZNojBtAEH48oFyXyXsTdXyxZ+syATM0NtCwkJg=;
        b=Hy5Vjaj1GFlfqXFgFU4Wk7wYhL+AdW+GISShF7pbpQzBCAzoyX06mKj9riDONUvoTu
         KJygh5nscsoyPvItPChqrHSXQPxDp5bYRAnKsEvFqcmijRhCw38xeSwetTsF9AvkbUYf
         hVmE7FSAH4Q4wrzRD6pw23VK9AaSnKgovUSlZ9QXs++6xGQZcPVEtNzbYKNpDmb7ydxL
         pihm7AbjTblUz+nkMI32xYxKW27gseqDrV0RGKN4T43bczPSmCXLp3fRh/utmO9YHtoB
         Sey/VFplr9PE2lySTaLRpT3t0lbZnm/yfBcOsJhGI8vtN1zAVWuoZu9OzywwnPC3RL4n
         V1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943061; x=1684535061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joeGaZNojBtAEH48oFyXyXsTdXyxZ+syATM0NtCwkJg=;
        b=WOAnQbfROFfPqvnpSaLjXXexD0IoO30wc1nw9CtZ7T068rKTj8Sjkssvl9GEdIvDaP
         jRlJq1+At3v2qWCjfHUkCUjCjapyyDQwlYyxefBnV8bJhu1ySEUUJFACFJAPJDQDQVAf
         k3ps0RtPswVnLLKZW0gke9hlxhnzzJtzBZ8+/wXczaZEVm+5wN5Roubrd2UwvvIdU4Pq
         DEDz/dIyLCz9ncV2wSBT6TuoSPulphypt3Q1vzgp/XQmtcYGJaGCzjLPWyIp9laPMdnN
         E+mTrf69lwbM9A9Q6R5Ssk1Dro+AwVWmXM54EnZlHcCDmaRGqBzSGcIuummNM60rMpSi
         o+WQ==
X-Gm-Message-State: AAQBX9fOEDkAIwi+xT7oSxiOKb/hgI+qyH3rnvn56XZanhRXxZackbMI
	Fw9qeUciP/IbN+qDrJ+m/gwtdg==
X-Google-Smtp-Source: AKy350bpDV/yb/MMXonhLvjhCzwnd1ozKuOFojavKdcbbpka5zKY4L/5Rw/zrIiOtje9GuJuXPaRMw==
X-Received: by 2002:a17:902:7891:b0:1a1:bf22:2b6e with SMTP id q17-20020a170902789100b001a1bf222b6emr6634040pll.43.1681943060762;
        Wed, 19 Apr 2023 15:24:20 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:20 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
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
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 10/10] riscv: cove: Don't emit interrupt_map for pci devices in fdt.
Date: Wed, 19 Apr 2023 15:23:50 -0700
Message-Id: <20230419222350.3604274-11-atishp@rivosinc.com>
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

CoVE VMs don't support pin based interrupts yet as APLIC isn't
supported.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 riscv/fdt.c                  |  2 +-
 riscv/include/kvm/kvm-arch.h |  2 +-
 riscv/pci.c                  | 83 +++++++++++++++++++-----------------
 3 files changed, 46 insertions(+), 41 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index a7d32b3..115ae17 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -232,7 +232,7 @@ static int setup_fdt(struct kvm *kvm)
 	}
 
 	/* PCI host controller */
-	pci__generate_fdt_nodes(fdt);
+	pci__generate_fdt_nodes(fdt, kvm);
 
 	_FDT(fdt_end_node(fdt));
 
diff --git a/riscv/include/kvm/kvm-arch.h b/riscv/include/kvm/kvm-arch.h
index 08ac54a..9f6967f 100644
--- a/riscv/include/kvm/kvm-arch.h
+++ b/riscv/include/kvm/kvm-arch.h
@@ -104,7 +104,7 @@ void aia__create(struct kvm *kvm);
 
 void plic__create(struct kvm *kvm);
 
-void pci__generate_fdt_nodes(void *fdt);
+void pci__generate_fdt_nodes(void *fdt, struct kvm *kvm);
 
 int riscv__add_irqfd(struct kvm *kvm, unsigned int gsi, int trigger_fd,
 		     int resample_fd);
diff --git a/riscv/pci.c b/riscv/pci.c
index 9760ca3..31ea286 100644
--- a/riscv/pci.c
+++ b/riscv/pci.c
@@ -17,7 +17,7 @@ struct of_interrupt_map_entry {
 	u32				irqchip_sense;
 } __attribute__((packed));
 
-void pci__generate_fdt_nodes(void *fdt)
+void pci__generate_fdt_nodes(void *fdt, struct kvm *kvm)
 {
 	struct device_header *dev_hdr;
 	struct of_interrupt_map_entry irq_map[OF_PCI_IRQ_MAP_MAX];
@@ -67,51 +67,56 @@ void pci__generate_fdt_nodes(void *fdt)
 	_FDT(fdt_property(fdt, "reg", &cfg_reg_prop, sizeof(cfg_reg_prop)));
 	_FDT(fdt_property(fdt, "ranges", ranges, sizeof(ranges)));
 
-	/* Generate the interrupt map ... */
-	dev_hdr = device__first_dev(DEVICE_BUS_PCI);
-	while (dev_hdr && nentries < ARRAY_SIZE(irq_map)) {
-		struct of_interrupt_map_entry *entry;
-		struct pci_device_header *pci_hdr = dev_hdr->data;
-		u8 dev_num = dev_hdr->dev_num;
-		u8 pin = pci_hdr->irq_pin;
-		u8 irq = pci_hdr->irq_line;
+	/* CoVE VMs do not support pin based interrupts yet as APLIC isn't
+	 * supported.
+	 */
+	if (!kvm->cfg.arch.cove_vm) {
+		/* Generate the interrupt map ... */
+		dev_hdr = device__first_dev(DEVICE_BUS_PCI);
+		while (dev_hdr && nentries < ARRAY_SIZE(irq_map)) {
+			struct of_interrupt_map_entry *entry;
+			struct pci_device_header *pci_hdr = dev_hdr->data;
+			u8 dev_num = dev_hdr->dev_num;
+			u8 pin = pci_hdr->irq_pin;
+			u8 irq = pci_hdr->irq_line;
 
-		entry = ((void *)irq_map) + (nsize * nentries);
-		*entry = (struct of_interrupt_map_entry) {
-			.pci_irq_mask = {
-				.pci_addr = {
-					.hi	= cpu_to_fdt32(of_pci_b_ddddd(dev_num)),
-					.mid	= 0,
-					.lo	= 0,
+			entry = ((void *)irq_map) + (nsize * nentries);
+			*entry = (struct of_interrupt_map_entry) {
+				.pci_irq_mask = {
+					.pci_addr = {
+						.hi	= cpu_to_fdt32(of_pci_b_ddddd(dev_num)),
+						.mid	= 0,
+						.lo	= 0,
+					},
+					.pci_pin	= cpu_to_fdt32(pin),
 				},
-				.pci_pin	= cpu_to_fdt32(pin),
-			},
-			.irqchip_phandle	= cpu_to_fdt32(riscv_irqchip_phandle),
-			.irqchip_line		= cpu_to_fdt32(irq),
-		};
+				.irqchip_phandle	= cpu_to_fdt32(riscv_irqchip_phandle),
+				.irqchip_line		= cpu_to_fdt32(irq),
+			};
 
-		if (riscv_irqchip_line_sensing)
-			entry->irqchip_sense = cpu_to_fdt32(IRQ_TYPE_LEVEL_HIGH);
+			if (riscv_irqchip_line_sensing)
+				entry->irqchip_sense = cpu_to_fdt32(IRQ_TYPE_LEVEL_HIGH);
 
-		nentries++;
-		dev_hdr = device__next_dev(dev_hdr);
-	}
+			nentries++;
+			dev_hdr = device__next_dev(dev_hdr);
+		}
 
-	_FDT(fdt_property(fdt, "interrupt-map", irq_map, nsize * nentries));
+		_FDT(fdt_property(fdt, "interrupt-map", irq_map, nsize * nentries));
 
-	/* ... and the corresponding mask. */
-	if (nentries) {
-		struct of_pci_irq_mask irq_mask = {
-			.pci_addr = {
-				.hi	= cpu_to_fdt32(of_pci_b_ddddd(-1)),
-				.mid	= 0,
-				.lo	= 0,
-			},
-			.pci_pin	= cpu_to_fdt32(7),
-		};
+		/* ... and the corresponding mask. */
+		if (nentries) {
+			struct of_pci_irq_mask irq_mask = {
+				.pci_addr = {
+					.hi	= cpu_to_fdt32(of_pci_b_ddddd(-1)),
+					.mid	= 0,
+					.lo	= 0,
+				},
+				.pci_pin	= cpu_to_fdt32(7),
+			};
 
-		_FDT(fdt_property(fdt, "interrupt-map-mask", &irq_mask,
-				  sizeof(irq_mask)));
+			_FDT(fdt_property(fdt, "interrupt-map-mask", &irq_mask,
+					  sizeof(irq_mask)));
+		}
 	}
 
 	/* Set MSI parent if available */
-- 
2.25.1

