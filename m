Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F7AD303
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:17:32 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1a9253d4551so4761385ad.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942652; x=1684534652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mljZsiO5QRb1GQDkLUDPFjVfkuRVaSDyhp9y+byMdss=;
        b=rSiuLSw6DyvgYFbph9bmFmqDG3DBHXwiC4IjLHTdoeoNqI3Zj5mvjcgftruD3sRQcL
         WxDYcG6ScHPYH/tsYrRzbCoTKzHkW8KNXh7K15sX/3vd0JxNdmgwDLmJ5Gbl1ptnc8kV
         B413qUWKvROFulz1VG3quMom7gr4KDz5SG6hA7i1NB7suVliV8jg80Ei4eKibGK25dVw
         IUKYu3sVmnUrAoFcDhoqyEJFPDZqPR+RsU7ZbMNTfRONc8CY2sotnhibyQDIiJL6WP4d
         uPsZMJmzwj1MOrHzXnjW7uCJa6/KKt6iVnYO2QkJX8Ox8I1aJyUyI4qshbT0yxib1Rsh
         ovBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942652; x=1684534652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mljZsiO5QRb1GQDkLUDPFjVfkuRVaSDyhp9y+byMdss=;
        b=c+g6pT9Igf1wXsib48dTkFRQq61XFuwDLgF7cHqyfMRXeMSrkzOqVEH8lrrjFhGC9N
         Ly/+yMgfZtZN3F8zyXQfGbq/lw/01IWCdvZFCYzEoPWD+XjsKOSEwfayX8hGIqs3Swpl
         HmpvQydWGpiJdNueLCUckx6TPBISGpnoKIlLk0+iNotm9xY25U0cIVhZ2nP6HhYmyLwY
         FPlo1JWR/DHJj2FLTHNaFcfGuUweSXomzcLsZ9M6jtp63a4y/+s7oDfl/OJl7Hr5tcNK
         ETtrDtqHb4gmhNAsgjuoQdjNBNhaZMi11olelNZCHmnnCscnuV40CzceGieGOq10HRFV
         3KwQ==
X-Gm-Message-State: AAQBX9cRA2+v+xWS72sBiygdYDLYfuIY+XsvVNn85IQfgmsgXEAYGdER
	/V7zKr46OwUHw1F/dghtsiiQaw==
X-Google-Smtp-Source: AKy350YAUHKVoqLB+lNg1GyvGR/YhY1dexLjtDy2z84R1FBjB72vycA1EeypPas5l/++BhN5lcYzyg==
X-Received: by 2002:a17:902:e74c:b0:1a6:4200:bef4 with SMTP id p12-20020a170902e74c00b001a64200bef4mr7961111plf.56.1681942651818;
        Wed, 19 Apr 2023 15:17:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:31 -0700 (PDT)
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
Subject: [RFC 01/48] mm/vmalloc: Introduce arch hooks to notify ioremap/unmap changes
Date: Wed, 19 Apr 2023 15:16:29 -0700
Message-Id: <20230419221716.3603068-2-atishp@rivosinc.com>
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

In virtualization, the guest may need notify the host about the ioremap
regions. This is a common usecase in confidential computing where the
host only provides MMIO emulation for the regions specified by the guest.

Add a pair if arch specific callbacks to track the ioremapped regions.

This patch is based on pkvm patches. A generic arch config can be added
similar to pkvm if this is going to be the final solution. The device
authorization/filtering approach is very different from this and we
may prefer that one as it provides more flexibility in terms of which
devices are allowed for the confidential guests.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 mm/vmalloc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bef6cf2..023630e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -304,6 +304,14 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
 	return err;
 }
 
+__weak void ioremap_phys_range_hook(phys_addr_t phys_addr, size_t size, pgprot_t prot)
+{
+}
+
+__weak void iounmap_phys_range_hook(phys_addr_t phys_addr, size_t size)
+{
+}
+
 int ioremap_page_range(unsigned long addr, unsigned long end,
 		phys_addr_t phys_addr, pgprot_t prot)
 {
@@ -315,6 +323,10 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
 	if (!err)
 		kmsan_ioremap_page_range(addr, end, phys_addr, prot,
 					 ioremap_max_page_shift);
+
+	if (!err)
+		ioremap_phys_range_hook(phys_addr, end - addr, prot);
+
 	return err;
 }
 
@@ -2772,6 +2784,10 @@ void vunmap(const void *addr)
 				addr);
 		return;
 	}
+
+	if (vm->flags & VM_IOREMAP)
+		iounmap_phys_range_hook(vm->phys_addr, get_vm_area_size(vm));
+
 	kfree(vm);
 }
 EXPORT_SYMBOL(vunmap);
-- 
2.25.1

