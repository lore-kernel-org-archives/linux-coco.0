Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268B7D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:24:14 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b4a64c72bso368521b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943053; x=1684535053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2k6fZhtBjuovD0xJN9/3Mss7sJpSj6M+Lhg1puIM9yQ=;
        b=frHFpOgJMj3IyT+0l6lF4ggQqLWSqJ+R5Lwl83JFjnZ1FgOj+RCeflj5OiteP2veXj
         hs8UabqlFhDeAfeVOqN8nsOlJjF/2yPcJvsYdreBOn4W0VsT07xnNPxxC9wRqCbEDrEI
         ZWpU6jo5/ivGxGl/5WlSrPuw4s+yWAlTdUEKKQGRxh6JkIhcKHr1ykdZxEako+r8BVLI
         Iia+UAGrprs58WkfVvjD7u2w/7WcLDjo2lLLRaRlMw3OivWlNDMPp50fyu9RdhML7Hv4
         wHYTWA+nkcv0sFjdO1RQEsLbEgouvwKngVct5OCtGdc8SgVKzfHhIkTKi03d/OSMpN46
         dypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943053; x=1684535053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2k6fZhtBjuovD0xJN9/3Mss7sJpSj6M+Lhg1puIM9yQ=;
        b=Td4fghaifrN8fl2JA0uIrAD0g6DSqF2ewIPa8Nb19v/kjH+5RiUxc7UvuyjiyOyJAS
         3Zii9U/kp03ZlFKT5DGq29DLDtDp45ffyITeUe1jzX9iPwNMobGG6sorUlDurGOBx4Uf
         HNEfjEMvcw+cvAI4gzrD0a7dwVx9qg/1GBCtyovWhfYuLYHMjPFkBf4hoKFzmfJMU5T0
         cr82gJ6G0yN78mwuN+HvO0OA8dkBmh1WjfJuMz50lxnxEQx2/CMctX0mZKU0FIzotFK5
         bR38s5PL2H6v6RNWSnB0SBqiHBeVjLLWhRDd6hXb0siYrAIsYalbLDT7duygE3uVDgyN
         cHyA==
X-Gm-Message-State: AAQBX9cz3TQxG1OCg9OtTaHWfeE8DH1hOjdUqYOlpeJ+yk/IJyLR+Mn+
	8IFKIkfaaV17a42rFoHDE5qbhA==
X-Google-Smtp-Source: AKy350a+wtlv0SH4nHUTs3X+REynERjZtWfA6CRUt3D8Ejpa/aSb6HljJIxaa3PlyPoDKWKx8hTZ+g==
X-Received: by 2002:a17:903:8c6:b0:1a0:42d4:e38a with SMTP id lk6-20020a17090308c600b001a042d4e38amr7048884plb.11.1681943053760;
        Wed, 19 Apr 2023 15:24:13 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:13 -0700 (PDT)
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
Subject: [RFC kvmtool 06/10] riscv: Change initrd alignment to a page size
Date: Wed, 19 Apr 2023 15:23:46 -0700
Message-Id: <20230419222350.3604274-7-atishp@rivosinc.com>
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

Currently, the initrd image is aligned to 8. This is problematic for
CoVE where the image is expected to be aligned at page granularity level.

Thus, align it to 4k. This can be done only if user requested a TVM.
However, initrd usually much bigger (in MBs at least). Thus, aligning
to a page for everything should not matter much.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/riscv/kvm.c b/riscv/kvm.c
index d59e8bc..5f9b0d5 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -113,7 +113,7 @@ void kvm__arch_init(struct kvm *kvm)
 }
 
 #define FDT_ALIGN	SZ_4M
-#define INITRD_ALIGN	8
+#define INITRD_ALIGN	SZ_4K
 bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 				 const char *kernel_cmdline)
 {
-- 
2.25.1

