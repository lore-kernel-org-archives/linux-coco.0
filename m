Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEB3D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:24:10 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-63b67a26069so510013b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943050; x=1684535050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqxJzuQg4YHoKMLWmjQ5z9IqDd25T8M3gtHVASWlMsA=;
        b=CdFLGUbJVpNnlbN6H0RysN3QwK8Q22dGILzUyKn1eed3BCAW6+MEMsBRDq2/F3MfEN
         8F/42PROs9h1k2Q7VrH4EPO6wp5xxtsziRkW162nuTlbeuaKnWv/CAiPccnTCWWIYPQk
         oJLjTPMoTHn4eG+8ibMKGv7GyStv5zxs81LmeyyaemazO9r8w0RuVqYmdLVQ/35zsHF4
         Epuj0d4WbFCdWHPxERyyC/wFKBbzXDxx2K1QzNu3em+Y/D7eT+3ZwnJpBriORGuqa1bG
         mG11CSzZymcMK9J81Dm4lnZ1qJfC6fNYaISOIHAhx4fE/+Qh3aPrGDxSYFrQFc63TMHE
         cEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943050; x=1684535050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqxJzuQg4YHoKMLWmjQ5z9IqDd25T8M3gtHVASWlMsA=;
        b=COnD5YZU/7e46j2hQd/rkTmpihyV5Vah1fh6MXQJwQFExfDkEpEAI7J9uezWwVORET
         85jpIs1+Qf+P7tAfiCOjnwrX1JBjIqfhUXDoP515N82BnkKmqQMbJMdYfefhCt89VP93
         GXwPzZwj3gSNP/Yp4d4pBrYtilDFl/8HUeuGmPHeGdlkn0G7kkIsHR3O0rG9qevjXBzr
         gQ7L5U1RhVa3aFUASBg05o2baxTxjpVUteuCL7GokW4xknVwkOb8aq/nuDAJyfolwNxD
         Ca5tms1yONsoD/GsQWJRkfJlKI1AGx9XMOMhftMkZI1IKuGKRWCE0elagRGBsVudUj/f
         h7eQ==
X-Gm-Message-State: AAQBX9fA33n7f9g+PR6mQOeFEUGdCCmXTFI3eHbRj6f3It6rgbsSx9bz
	KJIgi15pEbVnxdwz5QWdJaJMSw==
X-Google-Smtp-Source: AKy350Y1oJzpFyEWrofUoiBPrqInLwUP0IdbCjWNBlR0+a+fpEuwpi5wATQkdQOE2P7s+B2OF642XA==
X-Received: by 2002:a17:902:db08:b0:1a6:8405:f709 with SMTP id m8-20020a170902db0800b001a68405f709mr8145477plx.20.1681943049834;
        Wed, 19 Apr 2023 15:24:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:09 -0700 (PDT)
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
Subject: [RFC kvmtool 04/10] riscv: Invoke measure region for VM images
Date: Wed, 19 Apr 2023 15:23:44 -0700
Message-Id: <20230419222350.3604274-5-atishp@rivosinc.com>
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

The DT, initrd and kernel images needs to be measured before a CoVE VM
can be started to validate its authenticity.

Hookup the measure region API for these three components.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/fdt.c | 3 +++
 riscv/kvm.c | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 61a28bb..07ec336 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -254,6 +254,9 @@ static int setup_fdt(struct kvm *kvm)
 
 	if (kvm->cfg.arch.dump_dtb_filename)
 		dump_fdt(kvm->cfg.arch.dump_dtb_filename, fdt_dest);
+
+	kvm_cove_measure_region(kvm, (unsigned long)fdt_dest,
+				kvm->arch.dtb_guest_start, FDT_MAX_SIZE);
 	return 0;
 }
 late_init(setup_fdt);
diff --git a/riscv/kvm.c b/riscv/kvm.c
index 99b253e..d59e8bc 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -148,6 +148,8 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 	pr_debug("Loaded kernel to 0x%llx (%zd bytes)",
 		 kvm->arch.kern_guest_start, file_size);
 
+	kvm_cove_measure_region(kvm, (unsigned long)pos, kvm->arch.kern_guest_start,
+			       file_size);
 	/* Place FDT just after kernel at FDT_ALIGN address */
 	pos = kernel_end + FDT_ALIGN;
 	guest_addr = ALIGN(host_to_guest_flat(kvm, pos), FDT_ALIGN);
@@ -188,6 +190,8 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 		pr_debug("Loaded initrd to 0x%llx (%llu bytes)",
 			 kvm->arch.initrd_guest_start,
 			 kvm->arch.initrd_size);
+		kvm_cove_measure_region(kvm, (unsigned long)pos, initrd_start,
+				       file_size);
 	} else {
 		kvm->arch.initrd_size = 0;
 	}
-- 
2.25.1

