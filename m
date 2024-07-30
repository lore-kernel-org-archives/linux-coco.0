Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C51A38C1
	for <linux-coco@lists.linux.dev>; Tue, 30 Jul 2024 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722352281; cv=none; b=ErfQd8R0ADx+gjO8qTpj7DzrCLWx/cqwxPLqDeEMCueVKPtFeB96cYQIKpME7bNdAO7Hh22dlb//AkpU3s7oSe28JxadVmMGHaPspalMzF6dk5FRvkh/d7RNbQnu0Zq2W811LVzp570m/KeGT6cXwR7q0XIWEBj9tan97okw5po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722352281; c=relaxed/simple;
	bh=TPq7dUWy/hGjHKJL8srilmGJ0OyLZJ4HqT4NvHIPfa8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qxRawLMSbh0ns++AwKJwmL3GwRENBe+QvRNEn2bsy5nosYKAtGoYtCeFIQw3IQMOlLhh5tfQRaqDmyvzY3U/D0n00ol3p/AAkwcZbwj60bDmbOtdvG5+rwo885GlNVCy9/uSK1pczU22lpLgytAJ9RuCu76nHqDiCGgIaYAGdjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDp+qhjC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDp+qhjC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD25C32782;
	Tue, 30 Jul 2024 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722352279;
	bh=TPq7dUWy/hGjHKJL8srilmGJ0OyLZJ4HqT4NvHIPfa8=;
	h=From:To:Cc:Subject:Date:From;
	b=KDp+qhjC0irf4m02DKVGpspLLB6MD8U+NQjo9jEGMrHpsLzCr9AwxucJyzdSlJCr5
	 rFEqOjjwfIDtJ4jDfgllUXbUnfk3zZxhuOK2cC4FChDpc7hKMyJLrgnb2PHf1VwaOM
	 47lfFXv6J6woKv2HBtLy0tVabi/2ggNoP4DSLqhiBLaT+DmJOklHMcdrgD6Hg8Ue19
	 ygQ6k9r3TvjyhM4/5HrCBl4iU4wLRIK6kFNl1hQfJqIyYdwchuM73UNUnRw2/zuEdx
	 6sn+6TaXMDrL+GU5mSLn53SAZF6mJsnHtxNQMMqNY9+Gz2CiWOpl5Hx1UFsQv1h1se
	 SovPyWj7mvD8Q==
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
Subject: [PATCH 0/6] Support for running as a pKVM protected guest
Date: Tue, 30 Jul 2024 16:11:06 +0100
Message-Id: <20240730151113.1497-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Since the patches for running as a CCA guest were posted already at [1],
I figured it was worth posting the equivalent pKVM changes needed to run
as a protected guest under an Android host kernel. In particular, I've
tried to structure the code so that the CCA patches can use the same
hooks. I'd welcome feedback from the CCA developers (i.e. Steven and
Suzuki) as to whether this is sufficient.

There are also some pKVM-specific details which are worth discussion:

  * I've kept the code compatible with Android, so these patches allow
    an upstream kernel to run as a protected guest on a production
    (unlocked) Android device. This seemed like a good property for v1,
    but I'm happy to break compatibility if folks prefer a cleaner
    interface (e.g. using consecutive hypercall numbers).

  * I've included only the hypercalls that are necessary for a
    functioning guest. Android has some others, but I'd prefer to land
    the host support upstream before we expose optional interfaces as
    ABI.

  * For now, the stage-2 page size cannot be larger than the guest
    stage-1 page size otherwise the guest will fail to boot.

  * I don't forcefully configure SWIOTLB, as we rely on Restricted DMA
    pools (CONFIG_DMA_RESTRICTED_POOL) for devices that need it.

I also pushed a branch at [2] based on -rc1.

Cheers,

Will

[1] https://lore.kernel.org/r/20240701095505.165383-1-steven.price@arm.com
[2] git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/protected-guest

Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Suzuki Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>
Cc: linux-coco@lists.linux.dev

--->8

Marc Zyngier (1):
  firmware/smccc: Call arch-specific hook on discovering KVM services

Will Deacon (5):
  drivers/virt: pkvm: Add initial support for running as a protected
    guest
  arm64: mm: Add top-level dispatcher for internal mem_encrypt API
  drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls
  arm64: mm: Add confidential computing hook to ioremap_prot()
  drivers/virt: pkvm: Intercept ioremap using pKVM MMIO_GUARD hypercall

 Documentation/virt/kvm/arm/hypercalls.rst     |  98 ++++++++++++++
 arch/arm/include/asm/hypervisor.h             |   2 +
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/hypervisor.h           |  11 ++
 arch/arm64/include/asm/io.h                   |   4 +
 arch/arm64/include/asm/mem_encrypt.h          |  15 +++
 arch/arm64/include/asm/set_memory.h           |   1 +
 arch/arm64/mm/Makefile                        |   2 +-
 arch/arm64/mm/ioremap.c                       |  23 +++-
 arch/arm64/mm/mem_encrypt.c                   |  50 +++++++
 drivers/firmware/smccc/kvm_guest.c            |   2 +
 drivers/virt/coco/Kconfig                     |   2 +
 drivers/virt/coco/Makefile                    |   1 +
 drivers/virt/coco/pkvm-guest/Kconfig          |  10 ++
 drivers/virt/coco/pkvm-guest/Makefile         |   2 +
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 127 ++++++++++++++++++
 include/linux/arm-smccc.h                     |  28 ++++
 17 files changed, 377 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/include/asm/mem_encrypt.h
 create mode 100644 arch/arm64/mm/mem_encrypt.c
 create mode 100644 drivers/virt/coco/pkvm-guest/Kconfig
 create mode 100644 drivers/virt/coco/pkvm-guest/Makefile
 create mode 100644 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c

-- 
2.46.0.rc1.232.g9752f9e123-goog

