Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AA8D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:19:12 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-63b73203e0aso2788963b3a.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942752; x=1684534752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecSGlantlLzvA0G9VPQY9TXgG8EZEn7xksLEzRIVmIY=;
        b=c21zAYv4W/8efVpj9s/CrAgsnyC7GRoXBj+SQ9uvGvmMRjbXi9C/l4ApXeL/28qOSL
         J5ZZ+TVmCUP3cqWaEnHlrNG9d5s4uDtI+r8DS5GpmAI6Te5+PPhg0JPesMsJ6QkBBUKM
         i2T5E7+u0KUNpPzwSPIgIDhWBA0x55J8INy/+9T5mEzV2Ub7rIt7zSh4bB9QChjdbp48
         Ndc6bow+xP/wEEVhqSShIWQJsWlE7p19+1r0llK0omkaJDYaHRCgD+bcV/3pj1FMTVTV
         cqaMAtAzWTd3lG4iAZAgavUNbrYuLSPh85yDNfwJPgtXxhKdv5Whjg+e3B66BtLz82q2
         i0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942752; x=1684534752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecSGlantlLzvA0G9VPQY9TXgG8EZEn7xksLEzRIVmIY=;
        b=hDreycKzLbdQ1BMW8LFgwc6VGBNQGTwVu4TQtlf5xd6fNs4vagp7Ua/t17lxSQYM4e
         vG7ZBZvHGHjA9seEsfOYaxhhoHA3vy7efYd2K4akZoOgAlaKvauX1XKiJx5K6Q2Xhy6D
         aOCZzNIsgn/kJ5PMtMq9PChkNZC5DpnjF9BO68Lsug3L4Vb1/bFeMtMz+TQJNa0oNsky
         EdyIHjk4AuiIjszb6SkzCCXmqsixuSHte+FsPVXdvhM7JJ0/omZ6SiVMYdFDoXHAs50s
         EBlCjy6g5/gXAy4Ch+oheT+1yZ0nPAM2Lt2v56zZoMoAaEgRI+WkB8h7r6LJa8hdcWaU
         iBdg==
X-Gm-Message-State: AAQBX9ervytO1+ygjd0rqotbjiRj5TeZ/tlREMWBoUQLKG93nAmxVNpo
	nEIXUSDCiPDftlPBgcf3bCvMgw==
X-Google-Smtp-Source: AKy350YKfPHbIymM6qmHQFNTIkUnRhQSV2hEDBlfRu6z0TKA3ibQ947LdlZE55huq5S43nAipp/NMA==
X-Received: by 2002:a17:903:22c7:b0:1a6:3737:750c with SMTP id y7-20020a17090322c700b001a63737750cmr4095049plg.21.1681942751934;
        Wed, 19 Apr 2023 15:19:11 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
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
Subject: [RFC 46/48] riscv/virtio: Have CoVE guests enforce restricted virtio memory access.
Date: Wed, 19 Apr 2023 15:17:14 -0700
Message-Id: <20230419221716.3603068-47-atishp@rivosinc.com>
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

CoVE guest requires that virtio devices use the DMA API to allow the
hypervisor to successfully access guest memory as needed.

The VIRTIO_F_VERSION_1 and VIRTIO_F_ACCESS_PLATFORM features tell virtio
to use the DMA API. Force to check for these features to fail the device
probe if these features have not been set when running as an TEE guest.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/mm/mem_encrypt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/mm/mem_encrypt.c b/arch/riscv/mm/mem_encrypt.c
index 8207a5c..8523c50 100644
--- a/arch/riscv/mm/mem_encrypt.c
+++ b/arch/riscv/mm/mem_encrypt.c
@@ -10,6 +10,7 @@
 #include <linux/swiotlb.h>
 #include <linux/cc_platform.h>
 #include <linux/mem_encrypt.h>
+#include <linux/virtio_anchor.h>
 #include <asm/covg_sbi.h>
 
 /* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
@@ -54,4 +55,7 @@ void __init mem_encrypt_init(void)
 
 	/* Call into SWIOTLB to update the SWIOTLB DMA buffers */
 	swiotlb_update_mem_attributes();
+
+	/* Set restricted memory access for virtio. */
+	virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
 }
-- 
2.25.1

