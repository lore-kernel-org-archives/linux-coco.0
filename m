Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8154BD300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:24:19 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-517c57386f6so199810a12.2
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943059; x=1684535059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92JmYNvjI4h3x1v84zDdO04a6NNcBv03E/psDBTJE8A=;
        b=nUPF7sXfdzfSW6QquvIfaq4GAfSYyZeAk0mT1xklq8pqmC8JoWNIvCjy+zgsODVUHq
         O1IjPJuK8sxnkfCXOFdrW+u9RpzMDpy7y7UdhAG0oCuYW3dH8GSGsOh9ODDRIxw2eaFz
         bkM34qwDSq7IzfX047RwYqZPP8OQknDg9R1karBknWrofSn/KUs6wUf/rHdpra1bOATf
         rzsEvtKv0XMZjsFArXphtLo3X7lGUkjGEGkW6yljl786vgCvygViLOvHooAc3u8hDTWy
         WbwJ4EH+yr+KTGNMLcFTkEfYKE8eHBN2A40w7EVpD08O7tCunWfP2Fwi90JATCfWffYG
         bUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943059; x=1684535059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92JmYNvjI4h3x1v84zDdO04a6NNcBv03E/psDBTJE8A=;
        b=beJ09aNxyJqQSWpFO0dsghfNXB+lhcMoqOZDjBCCh33q6pztSDHW3/0vKZdOqtho1v
         YU4MMe6dNrgd4Due+95aGmBRC8wJwKowddYvWPv5yCcQtGY5RuLeI6oUHNaDc1c9oT20
         RSRcuQ+Y6Df1bn61tUY1KoPhdBZLFnlfBWloTlz2Ltkx+MizZMm4mLZrGPx0Hmj7iNQy
         Tuu+H0B0p9V9+IcJz5OHWpLUeTusy7qhw3MQ8Oz21WN53HOm745/J9f+H0+c6Km3X/9O
         XGzgOLKbkVit5mHLKFgoGQhzgQGzCTourTVIZxyFtt0ZGEHBgw2sm0qVfL3bYRS7ov84
         R8QQ==
X-Gm-Message-State: AAQBX9fh5kh1/5yxRT1A82jLTfZIDHjOfzIOnWsyyoIBHPTGWdSWlvBE
	OojPuo7wf07dzDRbuO88symSNA==
X-Google-Smtp-Source: AKy350Z85naSstLXZzvY5D57utZL9LkLhfRNOpeuO+9VtZ6rJWlxmJ/TTxgn/rQUXeeW25YB/WTEcw==
X-Received: by 2002:a17:90a:cf81:b0:247:1f35:3314 with SMTP id i1-20020a17090acf8100b002471f353314mr3406729pju.48.1681943059019;
        Wed, 19 Apr 2023 15:24:19 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:18 -0700 (PDT)
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
Subject: [RFC kvmtool 09/10] riscv: Don't emit MMIO devices for CoVE VM.
Date: Wed, 19 Apr 2023 15:23:49 -0700
Message-Id: <20230419222350.3604274-10-atishp@rivosinc.com>
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

The CoVE VMs do not support MMIO devices yet. Do not emit
MMIO device nodes for CoVE VMs.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 riscv/fdt.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 07ec336..a7d32b3 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -210,22 +210,25 @@ static int setup_fdt(struct kvm *kvm)
 			       riscv_irqchip_phandle));
 	_FDT(fdt_property(fdt, "ranges", NULL, 0));
 
-	/* Virtio MMIO devices */
-	dev_hdr = device__first_dev(DEVICE_BUS_MMIO);
-	while (dev_hdr) {
-		generate_mmio_fdt_nodes = dev_hdr->data;
-		generate_mmio_fdt_nodes(fdt, dev_hdr,
-					riscv__generate_irq_prop);
-		dev_hdr = device__next_dev(dev_hdr);
-	}
+	/* CoVE VMs do not support MMIO devices yet */
+	if (!kvm->cfg.arch.cove_vm) {
+		/* Virtio MMIO devices */
+		dev_hdr = device__first_dev(DEVICE_BUS_MMIO);
+		while (dev_hdr) {
+			generate_mmio_fdt_nodes = dev_hdr->data;
+			generate_mmio_fdt_nodes(fdt, dev_hdr,
+						riscv__generate_irq_prop);
+			dev_hdr = device__next_dev(dev_hdr);
+		}
 
-	/* IOPORT devices */
-	dev_hdr = device__first_dev(DEVICE_BUS_IOPORT);
-	while (dev_hdr) {
-		generate_mmio_fdt_nodes = dev_hdr->data;
-		generate_mmio_fdt_nodes(fdt, dev_hdr,
-					riscv__generate_irq_prop);
-		dev_hdr = device__next_dev(dev_hdr);
+		/* IOPORT devices */
+		dev_hdr = device__first_dev(DEVICE_BUS_IOPORT);
+		while (dev_hdr) {
+			generate_mmio_fdt_nodes = dev_hdr->data;
+			generate_mmio_fdt_nodes(fdt, dev_hdr,
+						riscv__generate_irq_prop);
+			dev_hdr = device__next_dev(dev_hdr);
+		}
 	}
 
 	/* PCI host controller */
-- 
2.25.1

