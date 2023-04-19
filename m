Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922FED300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:09 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-63b60366047so357095b3a.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942689; x=1684534689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbUa6ryrerMYndbR89JSXBoBIycYIOI5MWjMv8QTenY=;
        b=EpHc5rfijGiS9cvhe3gxGYJxsSuAlVbG/pIJOuFJNosZx/VFQeVfm0eSrlDMuReSFj
         7ypZdw3QjuxdW55Zh8SHxl8sc3yXVSNROJW2fjaa+26b7equVpWpnxFDYreqHSbXDwun
         vUfn3kQvN844BJ2Z55UTjnK33zctXOKmEJb38uE3yoQBIsr74T/OcqMWb3KweGfTU4Yi
         yYPd+HV7CeU/AvlBhTKuqFAlbX3z2KwharbhJqAcrRnAlg1XHGRRtMmnLgMuCDk8ejGu
         HvdE2AEcRzhomKSg5akQJMWerijQ4tiFWsNpofhgVRA19F6Cu15/PaXEiC7xDxP0NCRj
         VY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942689; x=1684534689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbUa6ryrerMYndbR89JSXBoBIycYIOI5MWjMv8QTenY=;
        b=YZrUWRu+jXI9xkZXPNt1IyfS2R12NMrjrltk0e6P7vj3rt8g2Z0XpI9NOlYzIqJGBE
         pe45iXFoz5jpD+LjT9El5spj83sGACukUVNbaVPvcI4LsDl7wPbFv/9RkDIsadWrAWvK
         lwPIpXUm5ZGhS5NU2LMmQK2yiZjasq6aGppNFcv3FY6hgGZlOmkZfrfyx7a7DQ0H0NZF
         yGMNyqSsysGef8AFmNwfKYp+BhFBY5lRm/jTm8QjRhlb3t2Bw8xiYTiOjmxaAp2DmVJ5
         uc7uCeExVdVl6gkNlIThWPa5RfvbwKNmcSBIFgWqurZXGzNfIKW+js3SzcCktmquuhQa
         Jg0g==
X-Gm-Message-State: AAQBX9czavuGO33CbO/v3K8ad2n30otwMpUR5u7j+LmztN9YWKsLYire
	YHe/J6sEkd3vGLDCghK8hpWWWQ==
X-Google-Smtp-Source: AKy350bOrY/ltn4aOC/irJe3I2c3DHWQXEGnacE0hKIRD44viSqKcVds6P+5HuawRV2gn0DMpSc7nw==
X-Received: by 2002:a17:902:e80c:b0:1a8:32e:3256 with SMTP id u12-20020a170902e80c00b001a8032e3256mr6684314plg.35.1681942689090;
        Wed, 19 Apr 2023 15:18:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:08 -0700 (PDT)
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
Subject: [RFC 18/48] RISC-V: KVM: Skip TLB management for TVMs
Date: Wed, 19 Apr 2023 15:16:46 -0700
Message-Id: <20230419221716.3603068-19-atishp@rivosinc.com>
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

TSM manages the tlb entries for the TVMs. Thus, host can ignore
all the hfence requests or tlb updates for confidential guests.
Most of the hfence requests happen through vcpu requests which
are skipped for TVMs. Thus, we just need to take care of the
invocation from tlb management here.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/tlb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index dff37b57..b007c02 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -15,6 +15,7 @@
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
 #include <asm/kvm_nacl.h>
+#include <asm/kvm_cove.h>
 
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
@@ -72,6 +73,14 @@ void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
 
 void kvm_riscv_local_hfence_gvma_all(void)
 {
+	/* For TVMs, TSM will take care of hfence.
+	 * TODO: We can't skip unconditionally if cove is enabled
+	 * as the host may be running in HS-mode and need to issue hfence
+	 * for legacy VMs.
+	 */
+	if (kvm_riscv_cove_enabled())
+		return;
+
 	asm volatile(HFENCE_GVMA(zero, zero) : : : "memory");
 }
 
@@ -160,7 +169,7 @@ void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
 {
 	unsigned long vmid;
 
-	if (!kvm_riscv_gstage_vmid_bits() ||
+	if (is_cove_vcpu(vcpu) || !kvm_riscv_gstage_vmid_bits() ||
 	    vcpu->arch.last_exit_cpu == vcpu->cpu)
 		return;
 
-- 
2.25.1

