Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593DAD300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:05 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1a68d61579bso4143895ad.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942685; x=1684534685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojiAvkB2QjgGX0WuePfTk5AH+Ftof3ihRnPYCRhXfys=;
        b=GI5HHNoDfnv7Xt2dXdQVsSPXXrf8xeXQpNWlFXZorCsInUO+7v9NY0aJ61Wq3Jrs8E
         kGQwH76ph9khKWrUeXzvPLglMXDgMZIIY54cSF/xDKTI2B+6z40RBNIFJsJyIqLBi2Tp
         /4IjX7V/Nl9JV0ZKRW6w1rRtjDB7U9hS1o72B3bA9f1kQsnaasLnan0u04D8EJ66o/lT
         QRUjYtEUOZzmooLboK7oxd2ALtGFHtLnXQq0cGS3gCSZ9ykQyEYPx3B41T0RJmlLxBu3
         0pGJgbLQ8aYagsnC8EaV+V6QeE9vVfhTJFm18qhaheSKMiu2Zw5f5PQymgLHdTXWDrLv
         QNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942685; x=1684534685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojiAvkB2QjgGX0WuePfTk5AH+Ftof3ihRnPYCRhXfys=;
        b=iq9IPtKKt3b+yAVhdgMGB8l/GXn0VjMDwMUfRr5I/nwKl8PjWwN0sDDS/Ggg//1Ksh
         ZnJO/kQVBMZQeLLpZfB0FoQujYw8E8PgVtkohRFIQu+LECoxya7l//Kf5k6AaPXrkc2r
         FK3blg24Owbdzn7ra9WLE1WsZZK6vz5nJLgZEjJC1ELhpWfuYirj48BbHt0Bjp/Va85x
         kmkOVoahVL9Y4UfD31/9aQruj7QmTTQEVfGiV+7G+WtaKWvsrGbevXdAEbbR5yVDnRJf
         MDG5gvTSN83fmrkLnesmCJxcyZ9sdv4hViuz153QwlHpFPzE8dT5Y1XGKg7+ch29L3Ua
         aQcw==
X-Gm-Message-State: AAQBX9dOwtYfris19W2Hkj6aLvqvcgwqMN5H0rijV826tUb45ojGMyQe
	3UyfTt9wMxXnOfJKfUCDyIjNkw==
X-Google-Smtp-Source: AKy350aUmxK/wzp1xvJIpKWslK3gwGr/UxzJX5snN5ZgZlPl8MyALzkERpVzHjZpOuQ6botaKIIVqg==
X-Received: by 2002:a17:903:22c1:b0:1a1:c3eb:afd with SMTP id y1-20020a17090322c100b001a1c3eb0afdmr7315223plg.65.1681942684832;
        Wed, 19 Apr 2023 15:18:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:04 -0700 (PDT)
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
Subject: [RFC 16/48] RISC-V: KVM: Skip most VCPU requests for TVMs
Date: Wed, 19 Apr 2023 15:16:44 -0700
Message-Id: <20230419221716.3603068-17-atishp@rivosinc.com>
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

Currently, KVM manages TLB shootdown, hgatp updates and
fence.i through vcpu requests.

TLB shootdown for the TVMs happens in co-ordination with TSM.
The fence.i & hgatp updates are directly managed by the TSM.
There is no need to issue these requests directly for TVMs.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c53bf98..3b600c6 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -22,6 +22,7 @@
 #include <asm/kvm_nacl.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
+#include <asm/kvm_cove.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
@@ -1078,6 +1079,15 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 		if (kvm_check_request(KVM_REQ_VCPU_RESET, vcpu))
 			kvm_riscv_reset_vcpu(vcpu);
 
+		if (is_cove_vcpu(vcpu)) {
+			/*
+			 * KVM doesn't need to do anything special here
+			 * as the TSM is expected track the tlb version and issue
+			 * hfence when vcpu is scheduled again.
+			 */
+			return;
+		}
+
 		if (kvm_check_request(KVM_REQ_UPDATE_HGATP, vcpu))
 			kvm_riscv_gstage_update_hgatp(vcpu);
 
-- 
2.25.1

