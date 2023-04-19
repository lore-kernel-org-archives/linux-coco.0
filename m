Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B39D304
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:17:54 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1a66888cb89so4501945ad.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942674; x=1684534674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwIdkHCarryXV50I6knz0ZklcYwS0nTZYHahvAAioGA=;
        b=JAfyJwlLZTLpeO+0a9mP+Qz17gHyrei/u3hvU+Y1oEWg9aDIafnfffPw2WLQocmCE5
         thEwftksAEQCxymE79XbmXlY3CV86W6kKDPWDlsoieUM1U98liDXsdwKh0TtzMRMco/6
         2qgFOkWb8NmcTouc/FLGToAZLWlsyjEWM3W1S9eitYQ6PZtGjRV1E0Bh4dYyak7MqlLF
         NqImRVNGkomVidir55QeblFMKk81mgA2duY/+3llfMenErvbAqjZMXeQVvmExrFa536W
         fZATF/TIP+lPFweeamhhj205CiSSkghmiFgf4j0xA47+WlMqYFC57GJCbBbKkv5f7DR4
         f0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942674; x=1684534674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwIdkHCarryXV50I6knz0ZklcYwS0nTZYHahvAAioGA=;
        b=NrCVFMagchadoProXZECXWWrUPFaYa/zvwb3TVOpkPp2g+aAgMblWnozPAFj3Agu1N
         TUukDYGa9PYb3juvusWy6dYukwjbPvO6O4QAKM+0zm8LPziuiSNV0E/mJRg4q2PFFza/
         mqFNzRef5Y7/7/uS2q+JqbfX0XrwVxFbDJxwKi4ReoRBWoGclTbybgeWQ6CkscU/W/ax
         u1p3K2qmDLhoDa6tuge5PqdxipW7WfpHcxcmRXMOKu9DgHWMB1csmTGS3WTtBdUHIdSl
         IwPNG/suk0M/gWDsMx7/TE5sdfwKoBvxAEU1L6MNlVMOa/0J++5BDp0hKXjJ4jOXrtFO
         Tkag==
X-Gm-Message-State: AAQBX9eURja9kDMBVteoBum+ib9kCVwmCs3w9XOogFYvL4V5SrkChWp7
	5fP4VPQCx5FNWOMq/ToBBVdxJg==
X-Google-Smtp-Source: AKy350aOeQnqsiOOnUYsijZU0I/0P7RvEF6TJy/X0/H7ROAFo8Dof2s5JoE26B/8+FVZEZPKo3gc/w==
X-Received: by 2002:a17:902:ce88:b0:1a1:f5dd:2dd5 with SMTP id f8-20020a170902ce8800b001a1f5dd2dd5mr8081414plg.13.1681942674035;
        Wed, 19 Apr 2023 15:17:54 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:53 -0700 (PDT)
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
Subject: [RFC 11/48] RISC-V: KVM: Use the new VM IOCTL for measuring pages
Date: Wed, 19 Apr 2023 15:16:39 -0700
Message-Id: <20230419221716.3603068-12-atishp@rivosinc.com>
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

The newly introduced VM IOCTL allow the VMM to measure the pages used
to load the blobs. Hookup the VM ioctl.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 29d3221..1b59a8f 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
+#include <asm/kvm_cove.h>
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS()
@@ -209,5 +210,20 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 long kvm_arch_vm_ioctl(struct file *filp,
 		       unsigned int ioctl, unsigned long arg)
 {
-	return -EINVAL;
+	struct kvm *kvm = filp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct kvm_riscv_cove_measure_region mr;
+
+	switch (ioctl) {
+	case KVM_RISCV_COVE_MEASURE_REGION:
+		if (!is_cove_vm(kvm))
+			return -EINVAL;
+		if (copy_from_user(&mr, argp, sizeof(mr)))
+			return -EFAULT;
+
+		return kvm_riscv_cove_vm_measure_pages(kvm, &mr);
+	default:
+		return -EINVAL;
+	}
+
 }
-- 
2.25.1

