Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0158E165F05
	for <linux-coco@lists.linux.dev>; Fri, 30 Aug 2024 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022916; cv=none; b=alh76lmUPNGqEZajDDitb/1TolrL+jgyElD3oCqSjxYmbVbL3MtIIL7L9yTetw2KvvAlwnDhvG6VEVFzWKmqXRQ8TiU3wHW0ePJ+NB4+jb71HRZWsOycvWFXKR9LCWgtE58im9Ev8AGajlbvbnYMovHNSgvbGvFMalLIJFZdzsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022916; c=relaxed/simple;
	bh=3Tru4jKUQbVLC3D60kddNg+aeoixf2lyO+9iCXRWS+g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Prf3Qi+Al8D4kCNQEL7DFrDx/HyGqlb3SwlB8NKof+DmvwFx4ofSNL5+fsipOm+vkz7Vp5Zz6WCjveIhINmlovmyG8EY4+wFzZ8z1Lrr264T+TE6nlhgSk4ChnYWgQITyBFmrjuy63f+/ZXW/qJb3CRKsN7IiwrzS6fXxSBXzg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZK9k1LlG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZK9k1LlG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92BD1C4CEC2;
	Fri, 30 Aug 2024 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725022915;
	bh=3Tru4jKUQbVLC3D60kddNg+aeoixf2lyO+9iCXRWS+g=;
	h=From:To:Cc:Subject:Date:From;
	b=ZK9k1LlGNQRd22SfJAhrhwSFOm0PTbInSidL3tk/ZCTIMKQoZ1sDZR52ZfVGPZrkK
	 P5TmANTalXS1R9p1AkjJzlCMRhNdauUejueWNKKdRt6jdtDigHFesRtXwLfP+O/qWr
	 4a+A4UsU7B3s2nOwbX6yGi5Mynp/JqUKjpDBGvCkC6ZTiEy1kHAAP3gKvuuuGFP7Gn
	 O0WvhrhX/JYAsA1QmNrrgylKbakyQKRRYgkhZHaY/oafWt8n++0IXec0wT888AMsJ1
	 v7mf0cQfj7pHVU+d+yaFeh1FSOKFmPznc7W1Bw/+aUOjZrnPXv5gKK3g8rPr4+Su9j
	 r9LL5/fe6g9VA==
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
Subject: [PATCH v2 0/7] Support for running as a pKVM protected guest
Date: Fri, 30 Aug 2024 14:01:43 +0100
Message-Id: <20240830130150.8568-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is version two of the series previously posted here:

  https://lore.kernel.org/r/20240730151113.1497-1-will@kernel.org

Changes since v1:
  * New patch allocating additional hypercalls for future pKVM usage

It looks like the CCA series is now using some of the pieces here [1],
so it would be great to merge this with an Ack from the kvmarm
maintainers.

Cheers,

Will

[1] https://lore.kernel.org/r/20240819131924.372366-1-steven.price@arm.com

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

Will Deacon (6):
  drivers/virt: pkvm: Add initial support for running as a protected
    guest
  arm64: mm: Add top-level dispatcher for internal mem_encrypt API
  drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls
  arm64: mm: Add confidential computing hook to ioremap_prot()
  drivers/virt: pkvm: Intercept ioremap using pKVM MMIO_GUARD hypercall
  arm64: smccc: Reserve block of KVM "vendor" services for pKVM
    hypercalls

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
 include/linux/arm-smccc.h                     |  88 ++++++++++++
 17 files changed, 437 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/include/asm/mem_encrypt.h
 create mode 100644 arch/arm64/mm/mem_encrypt.c
 create mode 100644 drivers/virt/coco/pkvm-guest/Kconfig
 create mode 100644 drivers/virt/coco/pkvm-guest/Makefile
 create mode 100644 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c

-- 
2.46.0.469.g59c65b2a67-goog

