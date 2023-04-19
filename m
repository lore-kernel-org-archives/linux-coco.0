Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4395D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:24:17 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a682eee3baso4437595ad.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943057; x=1684535057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iv3jO/UplLaGK+gTx4v9j9xexh60oYjru3uhX3LfGtA=;
        b=KlF0beSBSA6VLstvFDlAYMs9lpg8gvRR8zucHEopsyriEw6o1h2sLsqbVwcFiW8cZ2
         ykz4DGeTyhjIF7TUhCvkjoQIqDlNYfhLHbuIW6A6Nze2qZg8Mjs4XhacrR2YEsP5YvVC
         RlKM3D/qrtizTZ3hrz+4hH+4HBcHwt4wDVgzIrtDMMjRIhDdPS70B4ffIp/QcNwVpgLh
         l3tvN+FDLmm6WxBLSXFEB5UUmHWn5q2p7Y1BPq6qQBjKBoxl/p2sw2H5TvKzZwP4jWXj
         /BG7zkngU3fOCCHkdBXlJJfXlhrBn1uWDICB+9I2KRJvOa60PVK4lOGzawO9HJcdv8/2
         2Ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943057; x=1684535057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iv3jO/UplLaGK+gTx4v9j9xexh60oYjru3uhX3LfGtA=;
        b=lFK6EuixtiLag5bVtaGPobqjSc1vggMd7ZmRXi+DZT2kdFrV/ISJjDw00DoUhaEN0i
         X6BO9pNkIEu9mJ0J4qDmDbrK/Fh0Asgca9BSh3Hm91nlJV+N71/VzkurOR7i5e8X9G1I
         VOO2Yjp+BpShRJTtBcveQ5eWGzA53oQESZMBbF/B4HurEYbvDB900Sdcr3H8wxba5QFs
         B2L88t+Mexl7bgCegnlEAOQwHPbRTYshwZ/Nf2m+kBEHzgt6B6z0oVHuU0FDF7cgxgB5
         bzCzeL7EGlTj+FHbCSfVbB0+LeFqaBB9nTr86u4T0c2gzBg+VE1Jz6FYsRiIBixeBD6s
         /7yg==
X-Gm-Message-State: AAQBX9d5uf7IxoqB++2slH5BiigzAYqq2/xARFlM7y+V+9KKIc6lM2H8
	YM4F8zrpzAtDXuuLOO0IXe0N9Q==
X-Google-Smtp-Source: AKy350YmjLuFNHpdbGKVUxtLnNGDTOqZujizSNNxdVNVjL7P36ZiZ6Z6Phv1PaiPaoxLg0i7OBeTQw==
X-Received: by 2002:a17:902:d505:b0:19d:778:ff5 with SMTP id b5-20020a170902d50500b0019d07780ff5mr7467330plg.15.1681943057246;
        Wed, 19 Apr 2023 15:24:17 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:17 -0700 (PDT)
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
Subject: [RFC kvmtool 08/10] riscv: virtio: Enforce VIRTIO_F_ACCESS_PLATFORM feature flag.
Date: Wed, 19 Apr 2023 15:23:48 -0700
Message-Id: <20230419222350.3604274-9-atishp@rivosinc.com>
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

VIRTIO_F_ACCESS_PLATFORM feature tells the guest that device will
be using DMA for transfers. This forces the guest to use DMA API
to allow the host to successfully access guest memory as needed.

This is needed for CoVE VMs.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 riscv/kvm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/riscv/kvm.c b/riscv/kvm.c
index e728790..aebb6bd 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -7,6 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/kvm.h>
 #include <linux/sizes.h>
+#include <linux/virtio_config.h>
 
 struct kvm_ext kvm_req_ext[] = {
 	{ DEFINE_KVM_EXT(KVM_CAP_ONE_REG) },
@@ -224,5 +225,14 @@ int kvm__arch_setup_firmware(struct kvm *kvm)
 
 u64 kvm__arch_get_virtio_host_features(struct kvm *kvm)
 {
-	return 0;
+	u64 features = 0;
+
+	/* CoVE VMs mandate VIRTIO_F_ACCESS_PLATFORM feature to force use of
+	 * SWIOTLB bounce buffers through DMA API. Without this device probe
+	 * will fail for CoVE VMs.
+	 */
+	if (kvm->cfg.arch.cove_vm)
+		features |= (1ULL << VIRTIO_F_ACCESS_PLATFORM);
+
+	return features;
 }
-- 
2.25.1

