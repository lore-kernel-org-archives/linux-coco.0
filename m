Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D16165F05
	for <linux-coco@lists.linux.dev>; Fri, 30 Aug 2024 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022918; cv=none; b=fjttPe7Vyz7kUrRCYLXrn4vUUuB1JG/TPLGcO4y4l+6/pvv62iT9bmuKkDtxZjkGN8gIWBKWG0CiSeEfA9Re1FZKuO8q1x+A3fl0VaZanE0zMI4pw20ZQQhwa2J3w6rw86P3opSgxhULlkW0Nwcfyv0JTcAjPG+Wl5KpvIMWdJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022918; c=relaxed/simple;
	bh=A+3W/LHx+l+LB0DUctIiW8vpIgMQ4ADYQ24vstES/1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u1qQuKzb4DCfyS3KqUJHeIMxUBdmSUU22gUrJS38n2ghSgLPbrHK2Ar3z9RgJwsjaKebZE9vYMl40AdHibGoBbGVilW0bQuUmSx3UhOYOSk8DCd4iz8mwsSvP+bcAmVwCiSOP6kDtwAFPGXC/hQTj3cyGDxXWYuKEdviC9gJYwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXzcZLQ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXzcZLQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B81C4CEC9;
	Fri, 30 Aug 2024 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725022917;
	bh=A+3W/LHx+l+LB0DUctIiW8vpIgMQ4ADYQ24vstES/1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jXzcZLQ4FATCLyGSVz4aePHhhgBTP/jIdSrJF+DjEMXKFsf+ks5MLKwCOgbazI6XY
	 bRM8Cmpnz04fGEtkgIFzrZAn6hiaqLIRf1knmeKWTvA1KO81l7VJ11mrGVF+f6AcFX
	 CTAlBTNTE2gF8WVZQrxNl+ONABzCYq3rqcp4ikisklBs4Z0kO4T+iLMACEO1clyawP
	 hhRrK3nuGEhm5BCfy1wTnxDhmbfqT+px50tcmuYW+aAhGClbyImWa2jKNrgYW6JOxJ
	 CiX9q4AmFFM2cM0nOYv4dfAESWp0xkWDH3dviUDPcHFhJkkB9c3pvGwUuywNhlXixd
	 V6XDGeJeG5yOA==
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
Subject: [PATCH v2 1/7] firmware/smccc: Call arch-specific hook on discovering KVM services
Date: Fri, 30 Aug 2024 14:01:44 +0100
Message-Id: <20240830130150.8568-2-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240830130150.8568-1-will@kernel.org>
References: <20240830130150.8568-1-will@kernel.org>
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
2.46.0.469.g59c65b2a67-goog

