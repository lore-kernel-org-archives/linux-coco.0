Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD28D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:24:06 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a6862e47b1so5552125ad.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943046; x=1684535046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDYPek2GW62ZjpMwmsxfE9d0xDPaKHdBMm+cEZKc8s8=;
        b=gbm655ZKGYsSplRJThxaUIliJsDtxxCNHAd8Jsh9rquTj5wgjudHgZwJA550iZsQk9
         VB0SQu2x2QDE7zie14SgvIe7dnOfITMaMnMjD/onrUT0al1gT1sDadgULueeivhnEmTD
         JNLdLb2hMXSDd97f9GLtgcoOoiKtiFWFueifxdMTSbyKE0Z6Gv5tcQoRd/Nk8sLhR8hd
         DGNAlG+7Czxou3KoS1S39Pu0wydKlsp73goQ0cZbb90x0/1svTeMdjxcJ4JUnBS4z1ue
         xceJZmumlSVFCncTt6FuOgv+xYSVDvprfYgxAUggRJ/YOlKDghslSrOk6KKM64ujkV1m
         0exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943046; x=1684535046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDYPek2GW62ZjpMwmsxfE9d0xDPaKHdBMm+cEZKc8s8=;
        b=Ay45EBe4m+pOODNcYgTVoyuTvmSCSmH52W+p+RS6/l1ILqAjliQ7fNDEteT3pN7M1z
         rL+c4JJOly8+v8YYPQLDNiR3gmEAogGI68CPEMZPk7Kn5wLUoRP0GHOO2PtRKjPbDaX/
         Q3Dc69KldMrLNiN13z6a8FDyig0Q85tNql9KTbUYVBgNY5sDxPYsx9ut8lBnWulpcEWn
         C276cfd6qmYSMasjVy3sl5qaqOOVl2ADJy1dkG62o2Vr8P4/Dr0STjd48u0u+uqUWlU4
         G0KGsfVXmiv7ZTrdxjWZA68QzKNm8ynhcUl6jrkyA4SLuCOw/+PHqTx9fsrUZaKkgS6r
         ZFbA==
X-Gm-Message-State: AAQBX9e0tQk4gN0L3BWswuY/Qkpq6Q7jJldNaPknZUTdtYKU014kdXx2
	M57mLzckGD8ToiygcIykldS9nw==
X-Google-Smtp-Source: AKy350ZvU/B8LPyorDIQytWlfNOBgumMg9x+NGoZu6TjngTCY2lrTTdfxOrkdp5JkE0zcFgeJL83hQ==
X-Received: by 2002:a17:903:120e:b0:1a6:c12d:9020 with SMTP id l14-20020a170903120e00b001a6c12d9020mr7842484plh.24.1681943046020;
        Wed, 19 Apr 2023 15:24:06 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:05 -0700 (PDT)
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
Subject: [RFC kvmtool 02/10] riscv: Define a command line option for CoVE VM
Date: Wed, 19 Apr 2023 15:23:42 -0700
Message-Id: <20230419222350.3604274-3-atishp@rivosinc.com>
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

The user should be able configure the VMM to instantiate a CoVE VM via
a command line. Add the new option cove-vm.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/include/kvm/kvm-config-arch.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index aed4fbf..01276ea 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -10,6 +10,7 @@ struct kvm_config_arch {
 	u64		custom_mimpid;
 	bool		ext_disabled[KVM_RISCV_ISA_EXT_MAX];
 	bool		sbi_ext_disabled[KVM_RISCV_SBI_EXT_MAX];
+	bool		cove_vm;
 };
 
 #define OPT_ARCH_RUN(pfx, cfg)						\
@@ -66,6 +67,7 @@ struct kvm_config_arch {
 		    "Disable SBI Experimental Extensions"),		\
 	OPT_BOOLEAN('\0', "disable-sbi-vendor",				\
 		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_VENDOR],	\
-		    "Disable SBI Vendor Extensions"),
+		    "Disable SBI Vendor Extensions"),			\
+	OPT_BOOLEAN('\0', "cove-vm", &(cfg)->cove_vm, "CoVE VM"),
 
 #endif /* KVM__KVM_CONFIG_ARCH_H */
-- 
2.25.1

