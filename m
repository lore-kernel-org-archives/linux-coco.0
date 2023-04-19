Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56D2D304
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:17:47 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1a6817adde4so5423945ad.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942667; x=1684534667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xru1T6bsi1+3ZKp8XjmLeeEUO6sc9QurHQCwhhM84HA=;
        b=fB9b4YMtcQOYrcKj9/GWzeONjcxKP2oeywQTvv9jgtHPhKMG6piGSirEiNQPiRUSw/
         TNDD98EsCQRHJb8o4KR/40iwkDz2iCL9O1Q5D4OApUqfzyyueF2pWWXu9oUBTr1sBd7r
         qN8+st+530NNWaQglZ+vx32ZFpdd6jtoI22iSuSF0a+tcpVy60XJq7vb5hms8XM51miU
         EUekIXnr0Cbflr87WbR+EkVxvu0imyYB9o1bwvrkRw5vQJ9T+Gvh04UNMDx3e/rdtmef
         Rhm+A3oBDjRklFUpsePBjaVMWeVQWCFlRT5JvPLYOIPW/X1HEUctXf38yhKlTJ/Aw1FH
         TvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942667; x=1684534667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xru1T6bsi1+3ZKp8XjmLeeEUO6sc9QurHQCwhhM84HA=;
        b=frRMpOIZC6dq0U+Hk1UEb3WmbIjv3SJKPgCuikufy8HdPbSS31WpqqGTLYpaLKucP/
         3gJr2LOQ6S/UO327NBPEG+CWQO43/60W0qZz2VY2447w+sDYzz/2xTBGAXV6Fnn2ukge
         hZiEQ6eqW4q2iZo+N4wZbhI5qxk6sl2mtduiR4Jv4Mz7jVK83AQalI1ebosS0kUtX9fl
         Zrgv+BFGwVAUeHwJ3/6MsB9CG4EcNVfWCJ15BIxYwSss9YRtanjpX2fnyivzWwXYPlFU
         QQ+r3CspgyrFsTeEa81AwzEeWulWw3Pzm0QONyh631GUQTzGloGvdEI2WwPjoJnBoFDv
         A9VQ==
X-Gm-Message-State: AAQBX9cXlDRZWNGrExFE/zuYy+pymD/sF1tzLDTneHhmM0UW6nucJgAF
	2c6qgetx5NxUcT3jg0HCGOC65w==
X-Google-Smtp-Source: AKy350Ze6w+VITNJKc37wiOWND61z06Oiijk/jlDr4gywczSxyZvsezIoz1E2Y/uHqG7LrTSWYdlBg==
X-Received: by 2002:a17:902:f682:b0:1a1:f5dd:2dce with SMTP id l2-20020a170902f68200b001a1f5dd2dcemr8068605plg.6.1681942667389;
        Wed, 19 Apr 2023 15:17:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:47 -0700 (PDT)
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
Subject: [RFC 08/48] RISC-V: KVM: Add UABI to support static memory region attestation
Date: Wed, 19 Apr 2023 15:16:36 -0700
Message-Id: <20230419221716.3603068-9-atishp@rivosinc.com>
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

To initialize a TVM, a TSM must ensure that all the static memory regions
that contain the device tree, the kernel image or initrd for the TVM
attested. Some of these information is not usually present with the host
and only VMM is aware of these.

Introduce an new ioctl which is part of the uABI to support this.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 12 ++++++++++++
 include/uapi/linux/kvm.h          |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 11440df..ac3def0 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -98,6 +98,18 @@ struct kvm_riscv_timer {
 	__u64 state;
 };
 
+/* Memory region details of a CoVE guest that is measured at boot time */
+struct kvm_riscv_cove_measure_region {
+	/* Address of the user space where the VM code/data resides */
+	unsigned long userspace_addr;
+
+	/* The guest physical address where VM code/data should be mapped */
+	unsigned long gpa;
+
+	/* Size of the region */
+	unsigned long size;
+};
+
 /*
  * ISA extension IDs specific to KVM. This is not the same as the host ISA
  * extension IDs as that is internal to the host and should not be exposed
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index a55a6a5..84a73b5 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1552,6 +1552,8 @@ struct kvm_s390_ucas_mapping {
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
+#define KVM_RISCV_COVE_MEASURE_REGION  _IOR(KVMIO, 0xb5, struct kvm_riscv_cove_measure_region)
+
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
 
-- 
2.25.1

