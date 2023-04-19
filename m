Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48643D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:52 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1a526aa3dd5so5182835ad.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942732; x=1684534732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wZ38NgXR92ZnL3KCz4X1T1orXD86k7gku+jH9LYvlc=;
        b=QmuuVYt46KpS/zYYMAaGwSu/4ogHzgebSuHz2Y3KqaXaWYNGDgVkh+TM+9F0z1UKqq
         yLwfXsEjIj5AyyA1hGl2bhxYnaVMKxeSrJ8kwz/jbSGPSXzXJrYc1cZLmnuKcOHvK/NO
         W+UYzU5cNYXd7iKLqbolbPZxHkvQvk9pg5qltXG2gdevWPNka1SD3vMUG51IVWwpm1Is
         pQl00SUeHSzQxwfQfWPPzCjONURk75DuuPNE8FRa7jDR7RGmxRIpfU2bo0VrGWZ8ZwD3
         0HsjPnYDT4F6NmAip4Qb5wSlSawzKk38AMTj8xzmlCbhjRiSI7AJ2N04QWgrNDK8/C2A
         ee7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942732; x=1684534732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wZ38NgXR92ZnL3KCz4X1T1orXD86k7gku+jH9LYvlc=;
        b=lj9QGVOLcgWFIVmZvSQjRyzJKtZCAOKUAyOC1WpU9MLtdySEl6Vq+COP+YMN3dS/iV
         ifqs40z+9DWcW75OIR2HhQwFoHjL5MqwiOAX2+4xfTK1NvEqtxLQ+zSk/biX64yx2k/o
         Yh3sa0Pd4HuA/LbU7JoUnGvo9BWbgsJD+WgZDd+LMdyDnPS09ZgX6eDE6BsFYsXL4QCE
         yDK7WaJTH4GrEims0ULTdgt717MRFDDiTnB3uwGmnvl0HabwpVnGVhqOtV6vcN/U+3cL
         hA/Bt01ZtMWWc56iZMSvKNpYkjk9b3nGpKbJZKFSSi3dGAOfF22HNhlrLOGcmQ0aLf2K
         MM4w==
X-Gm-Message-State: AAQBX9dkozORDsMV8LFK17fn20ko4HrOa88VeRXMdH05MJNOxIb8nNS8
	6+D/I8qW19Ja9Ao0UDL/u1F8/g==
X-Google-Smtp-Source: AKy350YlbYAHX3czmRaEVnTcNdf891KQxoyoTa0cHJBez0RPMbydsH+Ponf0TcKud2fsWou26F4oLw==
X-Received: by 2002:a17:903:2281:b0:1a6:3737:750d with SMTP id b1-20020a170903228100b001a63737750dmr7538499plh.17.1681942731698;
        Wed, 19 Apr 2023 15:18:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:51 -0700 (PDT)
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
Subject: [RFC 37/48] RISC-V: Add COVG SBI extension definitions
Date: Wed, 19 Apr 2023 15:17:05 -0700
Message-Id: <20230419221716.3603068-38-atishp@rivosinc.com>
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

CoVE specification defines a separate SBI extension known as CoVG
for the guest side interface. Add the definitions for that extension.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index bbea922..e02ee75 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -34,6 +34,7 @@ enum sbi_ext_id {
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_COVH = 0x434F5648,
 	SBI_EXT_COVI = 0x434F5649,
+	SBI_EXT_COVG = 0x434F5647,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -439,6 +440,16 @@ struct sbi_cove_tvm_aia_params {
 	uint32_t guests_per_hart;
 };
 
+/* SBI COVG extension data structures */
+enum sbi_ext_covg_fid {
+	SBI_EXT_COVG_ADD_MMIO_REGION,
+	SBI_EXT_COVG_REMOVE_MMIO_REGION,
+	SBI_EXT_COVG_SHARE_MEMORY,
+	SBI_EXT_COVG_UNSHARE_MEMORY,
+	SBI_EXT_COVG_ALLOW_EXT_INTERRUPT,
+	SBI_EXT_COVG_DENY_EXT_INTERRUPT,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.25.1

