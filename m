Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7961DD300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:24:12 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a66911f5faso4727295ad.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943052; x=1684535052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E81F/sZHqFlmC4PTTDxmyvFtDAnkdcxCBJVjUmPx/Qw=;
        b=h8qvhmk4lDaY4kQIaAqeKrnT156suhglOdhOFhlubu1kF8monJSVNUgUE+j1dG31u3
         2u4SpVYqZ4tfegebKpsL38KKycJWXvEDDTgK8UNr6JRmWeQLZM10VY51+CKxQiNgddvl
         jVlFZj35wrKDUORGT0J+qOCCKpjlGHzbKe/sGfoeSgQinTk47q9jptfvuPOOM2rG+CYr
         zwGu3oFCrdRFjF7E7+wb2JbG1bH3s5tlAZXNHsT/M1j9N2DMFEV+pbXVFPMwgsNs8Fq+
         +9F3bZPSaGt+4fI+77DT77iqb04ZT/uOhlexxfDhgZPl/024tDlCe5TFxeig37XFSsp8
         WtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943052; x=1684535052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E81F/sZHqFlmC4PTTDxmyvFtDAnkdcxCBJVjUmPx/Qw=;
        b=M7twPmkU70oeoqvqnXXMGOdgJWLXqTEuXraf+AeO/YjMmMN+OyhNpse6lyNmSUy83q
         H0OQe2sk+PEqx3XSUX7NprhFKoohKNVH1wlEaDFhnVTqFcxTQoRzCZ1buxZ5y7SJicW9
         gEANWLrzjmbdj2zdDX49/86VaYfPlB5BrH1pdF2nwnptYxviTOTa7LxYfuMPKLdD2prM
         z5L+Ij/RI71I+7CgHULIcTHM8tdrmNmBLE53ZKgX7rr/M7aaube5VVywYsXmivbE1L8T
         F75jIErci1zbedQLSAoAYf4NY4ei9ax0CTtn/Bv1AvWhZLVQVwg2iSJH4xbZCchItFp+
         TYeQ==
X-Gm-Message-State: AAQBX9cGS+hFxYmk9lZgNroBiclf/MBu1DsH/8tXLMMCviuxxe9vxduZ
	25k6kW8OuAxj3SfPRwoqUUgCRQ==
X-Google-Smtp-Source: AKy350ZDizFV7lhpli0WrCYYrT6iDsFp55kYpsDPb3wO0+TsDTvsM5wAJ/jQ030A1Tz0V9swMbp+9w==
X-Received: by 2002:a17:902:da8a:b0:1a6:97fd:29e7 with SMTP id j10-20020a170902da8a00b001a697fd29e7mr8449012plx.27.1681943051998;
        Wed, 19 Apr 2023 15:24:11 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:11 -0700 (PDT)
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
Subject: [RFC kvmtool 05/10] riscv: Do not create APLIC for TVMs
Date: Wed, 19 Apr 2023 15:23:45 -0700
Message-Id: <20230419222350.3604274-6-atishp@rivosinc.com>
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

The CoVE VMs do not support wired interrupts. Thus no need of APLIC at
this point.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/aia.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/riscv/aia.c b/riscv/aia.c
index 8c85b3f..a3b8618 100644
--- a/riscv/aia.c
+++ b/riscv/aia.c
@@ -143,6 +143,11 @@ static int aia__init(struct kvm *kvm)
 		.attr	= KVM_DEV_RISCV_AIA_CTRL_INIT,
 	};
 
+
+	/* CoVE VM only supports hardware with physical guest interrupt file */
+	if (kvm->cfg.arch.cove_vm)
+		aia_mode = KVM_DEV_RISCV_AIA_MODE_HWACCEL;
+
 	/* Setup global device attribute variables */
 	aia_mode_attr.addr = (u64)(unsigned long)&aia_mode;
 	aia_nr_ids_attr.addr = (u64)(unsigned long)&aia_nr_ids;
@@ -160,10 +165,7 @@ static int aia__init(struct kvm *kvm)
 	ret = ioctl(aia_fd, KVM_GET_DEVICE_ATTR, &aia_nr_ids_attr);
 	if (ret)
 		return ret;
-	aia_nr_sources = irq__get_nr_allocated_lines();
-	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_nr_sources_attr);
-	if (ret)
-		return ret;
+
 	aia_hart_bits = fls_long(kvm->nrcpus);
 	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_hart_bits_attr);
 	if (ret)
@@ -172,12 +174,21 @@ static int aia__init(struct kvm *kvm)
 	/* Save number of HARTs for FDT generation */
 	aia_nr_harts = kvm->nrcpus;
 
-	/* Set AIA device addresses */
-	aia_addr = AIA_APLIC_ADDR(aia_nr_harts);
-	aia_addr_attr.attr = KVM_DEV_RISCV_AIA_ADDR_APLIC;
-	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_addr_attr);
-	if (ret)
-		return ret;
+	/* CoVE VMs do not support APLIC yet */
+	if (!kvm->cfg.arch.cove_vm) {
+		aia_nr_sources = irq__get_nr_allocated_lines();
+		ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_nr_sources_attr);
+		if (ret)
+			return ret;
+
+		/* Set AIA device addresses */
+		aia_addr = AIA_APLIC_ADDR(aia_nr_harts);
+		aia_addr_attr.attr = KVM_DEV_RISCV_AIA_ADDR_APLIC;
+		ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_addr_attr);
+		if (ret)
+			return ret;
+	}
+
 	for (i = 0; i < kvm->nrcpus; i++) {
 		aia_addr = AIA_IMSIC_ADDR(i);
 		aia_addr_attr.attr = KVM_DEV_RISCV_AIA_ADDR_IMSIC(i);
-- 
2.25.1

