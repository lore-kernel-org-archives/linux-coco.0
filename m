Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FFAD300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:19:03 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1a66888cb89so4507135ad.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942743; x=1684534743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a40XLfKnT38y+rtkL3pdG8Ux1IFfCO6rS0FTBqpEPf0=;
        b=3qxwZ1AI4VGDwq0mJs81MteY/7NGEkj+18YI44D7IRwVFmeOk/RDHZQGN6wE3U+Fah
         h7gisXIiukRhgYPfWkwf74DwoXRlOc0S4t3u5KNMCW0DvYSt6D9lgBm8X1/OboQx9bjc
         IzBdkE1rsZq0oHGxqiSUWhGy7JzHKWqkxpvHKq8QGhfZMNoiHDUHp+knL2W2J0PauRX8
         Z60xK4xlPZJK9w4CVaJLh1I3bqfv7kssfB1lBki6XAPwuKeXcckA/zvCt73aqzG97NxY
         H3VYn/a0FuKbmIi+8CNiszb6pRZFNUdKkES3iAmBw3QloUaHccRpDErn+0099zd/wFiN
         sTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942743; x=1684534743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a40XLfKnT38y+rtkL3pdG8Ux1IFfCO6rS0FTBqpEPf0=;
        b=g8fL9QIaT8UJheq2vHvzXtIRa3elKIyM67UPWo+hD3/e0GA/aPhr/s0uN3sV2D0MpT
         zYYKorZW671b9lXIFPnnZ80h99Zy8AnV64zDVLHGyeUEAgguEBtazv+opLTZqQnIHmM+
         SJXrbGkorFIE72l1OY5z2MMqS979Lpb0JdKLkhjqx/6HAmb6ekdwDkRF0DYI/P4jG+92
         wjsgQ0boBrc4fSuw6Dbd5Cwg90F+luP2OYaU3oGSKCeGkeN0athEmIRFPevzov90YxsC
         BHPc9+G8i9/Fk+8gHr7F/dOhKjuwOv2UD1575jhpy4lYoI9EBlNjoygEXmz5L7I0aWwQ
         ZNJQ==
X-Gm-Message-State: AAQBX9fBrVITgLCJY5t9HfU0G+OTWEywhTbNJpAQDuoQ3MRNS0AORKmf
	4Tij4cUZBHJ1PD9MYxYCbNT7Eg==
X-Google-Smtp-Source: AKy350YLjqHMzW16SB61ZrKO34D3/TlmDW2rBvoLEyn4qa6+KyWVGCYv7MHLqblqPruYYQP5o2V7iQ==
X-Received: by 2002:a17:902:ea0e:b0:1a1:ee8c:eef5 with SMTP id s14-20020a170902ea0e00b001a1ee8ceef5mr7846112plg.7.1681942742761;
        Wed, 19 Apr 2023 15:19:02 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:02 -0700 (PDT)
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
Subject: [RFC 42/48] RISC-V: Allow host to inject any ext interrupt id to a CoVE guest.
Date: Wed, 19 Apr 2023 15:17:10 -0700
Message-Id: <20230419221716.3603068-43-atishp@rivosinc.com>
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

Ideally, host must not inject any external interrupt until explicitly
allowed by the guest. This should be done per interrupt id but currently
adding allow-all call in init_IRQ. In future, it will be modified
to allow specific interrupts only.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/irq.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index eb9a68a..b5e0fd8 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -11,6 +11,8 @@
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <asm/sbi.h>
+#include <asm/covg_sbi.h>
+#include <asm/cove.h>
 
 static struct fwnode_handle *(*__get_intc_node)(void);
 
@@ -36,8 +38,18 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 
 void __init init_IRQ(void)
 {
+	int ret;
+
 	irqchip_init();
 	if (!handle_arch_irq)
 		panic("No interrupt controller found.");
 	sbi_ipi_init();
+
+	if (is_cove_guest()) {
+		/* FIXME: For now just allow all interrupts. */
+		ret = sbi_covg_allow_all_external_interrupt();
+
+		if (ret)
+			pr_err("Failed to allow external interrupts.\n");
+	}
 }
-- 
2.25.1

