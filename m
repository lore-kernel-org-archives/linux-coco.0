Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CD3D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:38 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1a6762fd23cso4485575ad.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942718; x=1684534718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2nJhanY2RyrdzmZ5jdtnkafHRmAptwnMC5XRsCTn9I=;
        b=JS7pXfcL0uZWhUdoeqJLjU0060h+zlTyFU4Xu6hWHx+bZXgxY7ubdU1X9NVau3JlX9
         +7CYbRRwlIc3Vqq9APC8BsBuJn4DTncbkzqKnldPV32jiP3HmMEO6Gpz0Jpg3E8ecp/b
         7UYaf07kCninwBHQ2YB/t4GOxc2RYZ1XD5frQZDPWtSV2zmt3BBqoNXrrBa8O/2uay1U
         9Q5+GXI2CSH6c4nCaey/IdmivSR/XDL19JFooIN8hV4UeXZUf4HW7Tq4P1XLc0glmzvp
         cJ6OAEWscVYWk70eywtGuEoxadALFsAZYFXB+jt15zlHvhhj3dquE05TC9qY1zNQuLog
         DNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942718; x=1684534718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2nJhanY2RyrdzmZ5jdtnkafHRmAptwnMC5XRsCTn9I=;
        b=hsDycTt5N9jJDjRyoDBdfrgZrvZi40JyHKm5dPeY6nIJhlFOAjhFUF4MmSisAfrJOP
         9SennALY/sw/ODA6t827iXGQvIMpG2IL8Z5gDKnwIG8OO3UUTEF2VKambH4f+rkRy7yJ
         Dzmb+IwSclmTNJykeDdsYaSln+2G/oei2d/O4KPCansT3n0SRWZmNllH5f1GTtntub2g
         bfJj33RJTic7PASAD3QaFiWbU/nEXd5V6ar6zBrxrMyPNxZ1LdbyvOpWZ4B7cqHnU4WL
         fLwxQhazthCjZYe26FmpZbAfV/zIpNZM1iikCWITb35y9TRA2stG0Zp4o7z/SA2/cze7
         30Lg==
X-Gm-Message-State: AAQBX9dWl/9N0KwRtNaIxSRGnsarvXFUf8mUVAKHcm8aqoUhMtF21tOM
	h9Yn4MfRuNHlYN9Bx9d8QJwOew==
X-Google-Smtp-Source: AKy350Z7HNgpp/rz6oeri9oovBKao1xAaHX/MXTw46NfVQFmX/yVtIUB1ewCw+YJMzwOiUfVeGRvZQ==
X-Received: by 2002:a17:902:e0d3:b0:1a2:8770:bb17 with SMTP id e19-20020a170902e0d300b001a28770bb17mr5706306pla.9.1681942717994;
        Wed, 19 Apr 2023 15:18:37 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:37 -0700 (PDT)
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
Subject: [RFC 31/48] RISC-V: KVM: Indicate no support user space emulated IRQCHIP
Date: Wed, 19 Apr 2023 15:16:59 -0700
Message-Id: <20230419221716.3603068-32-atishp@rivosinc.com>
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

The KVM_INTERRUPT IOCTL is used for the userspace emulated IRQCHIP.
The TEE use case do not support that yet. Return appropriate error
in case any VMM tries to invoke that operation.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 20d4800..65f87e1 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -716,6 +716,9 @@ long kvm_arch_vcpu_async_ioctl(struct file *filp,
 
 	if (ioctl == KVM_INTERRUPT) {
 		struct kvm_interrupt irq;
+		/* We do not support user space emulated IRQCHIP for TVMs yet */
+		if (is_cove_vcpu(vcpu))
+			return -ENXIO;
 
 		if (copy_from_user(&irq, argp, sizeof(irq)))
 			return -EFAULT;
-- 
2.25.1

