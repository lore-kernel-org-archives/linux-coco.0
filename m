Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5401A38CA
	for <linux-coco@lists.linux.dev>; Tue, 30 Jul 2024 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722352282; cv=none; b=TQ+81pIPBFU19pRcbrI3VYfvZAo7LEtbS1MVaLUDIzHusLNNMEeOY8cmnE4RTcaL9qoTzzaQL3wsOAmYPDw1Dry0i5twuLju9L8THUZFDOPHzs3Ei9UHdW/g7UXRNiTYb9XlZ2nGQnTrjaVMK98B8htklb4PAyKPAtQbcJ72K24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722352282; c=relaxed/simple;
	bh=q1u9cBAQf118n8QkMELTzcehqSgbHJIyyYMno5NoJ6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aVy/VyU2fGBcFr9WkqfQnrAmgEa7TMiphKUkcfDo72nRN0zTYWvq+C/4UNQ8v99P6GF0TfnOXXpqvfNxAxTa+BAhYIkcQwI2ElzCyYwpiin5VM9aRLdf07suIoqRdUPXzF3LCosHPJDbXE9Z79qKFQLzCvxbzZ/w9rV4PS35yY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QK4eFo1g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QK4eFo1g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E212C4AF0A;
	Tue, 30 Jul 2024 15:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722352282;
	bh=q1u9cBAQf118n8QkMELTzcehqSgbHJIyyYMno5NoJ6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QK4eFo1ga0PVBFcccBHLFdQIv8yE8NPmlndZAiVs1idctgwjSKhMAtKKlN1DPzKWx
	 h6rCOFG278v4GJ7Bth1a1f7eR0LKDggYsjJ4kkI3L6kjdL/Wa19P2Y7L0CKAMsXL1n
	 g8Z60kQX9+mDWRz8pOBtauJ+WtTe34vszJG30EKNqDxGjjOp7jQQcTS/QgX3zA9b6F
	 vajnJcra8ugAoTPdfNQmkfAGpgmWf3SWI5GoZ2yYhRD5IdvlOSoE062uShQtdjSegN
	 pJnMxTK6UeQrtFER7/kLYvHJZJwBkcsVTV0VbM8SpsKsDbeO+ozpKVSKtfD0ONa44c
	 EbE0qQFjrfvRA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	linux-coco@lists.linux.dev
Subject: [PATCH 1/6] firmware/smccc: Call arch-specific hook on discovering KVM services
Date: Tue, 30 Jul 2024 16:11:07 +0100
Message-Id: <20240730151113.1497-2-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240730151113.1497-1-will@kernel.org>
References: <20240730151113.1497-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marc Zyngier <maz@kernel.org>

arm64 will soon require its own callback to initialise services
that are only available on this architecture. Introduce a hook
that can be overloaded by the architecture.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm/include/asm/hypervisor.h   | 2 ++
 arch/arm64/include/asm/hypervisor.h | 4 ++++
 drivers/firmware/smccc/kvm_guest.c  | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/arch/arm/include/asm/hypervisor.h b/arch/arm/include/asm/hypervisor.h
index bd61502b9715..8a648e506540 100644
--- a/arch/arm/include/asm/hypervisor.h
+++ b/arch/arm/include/asm/hypervisor.h
@@ -7,4 +7,6 @@
 void kvm_init_hyp_services(void);
 bool kvm_arm_hyp_service_available(u32 func_id);
 
+static inline void kvm_arch_init_hyp_services(void) { };
+
 #endif
diff --git a/arch/arm64/include/asm/hypervisor.h b/arch/arm64/include/asm/hypervisor.h
index 0ae427f352c8..8cab2ab535b7 100644
--- a/arch/arm64/include/asm/hypervisor.h
+++ b/arch/arm64/include/asm/hypervisor.h
@@ -7,4 +7,8 @@
 void kvm_init_hyp_services(void);
 bool kvm_arm_hyp_service_available(u32 func_id);
 
+static inline void kvm_arch_init_hyp_services(void)
+{
+};
+
 #endif
diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
index 89a68e7eeaa6..f3319be20b36 100644
--- a/drivers/firmware/smccc/kvm_guest.c
+++ b/drivers/firmware/smccc/kvm_guest.c
@@ -39,6 +39,8 @@ void __init kvm_init_hyp_services(void)
 
 	pr_info("hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 0x%08lx)\n",
 		 res.a3, res.a2, res.a1, res.a0);
+
+	kvm_arch_init_hyp_services();
 }
 
 bool kvm_arm_hyp_service_available(u32 func_id)
-- 
2.46.0.rc1.232.g9752f9e123-goog

