Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDE7535FA7;
	Wed, 23 Sep 2026 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172261; cv=none; b=LX7htAX14dy19v6XVFmeS+rHRm9NKfw/pQb641+NvpP4TET59CkvDnzsxAclK+aNrk+o7d0ClTeZLCk4fggDX1/CbMu7swoRwVDlschYHrG+n9nguaFylz01MeBMPbr8WszREVoHxTYUWnMYELDtGpKzgc03q7o3QApFO6DILfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172261; c=relaxed/simple;
	bh=12uLwamnps9OLew3JhxZzPu4Oi4VZc9jYM1CuHwIJ88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JUBpRS6dQkFt10w6u5K5DjDSFJDwTDCAT9KcnByx6FunI6jtf7sVSyDCryhSvQQBMTbow5mUKHj57R2If+2QbMPg57dUDxWa6wf143aewqnL8ruFIcMiL+7wkRNDignL1kois7wz403IznTeNTUuOcrE9H5bMV7/4EGtulPaqxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hz1RDLsi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hz1RDLsi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133CF1F000FF;
	Wed, 23 Sep 2026 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172259;
	bh=t+qWydripu7ZbldctMsFQ3i/o2xxPtdloQw+yrLdtfg=;
	h=From:To:Cc:Subject:Date;
	b=hz1RDLsiIHbGIWAaUUUJPpBfF36IEzzQVcQ7jA4VrdIJtdbxietUwu7HOTo0t14KP
	 eKejVW7hmlKcJjbfIv6dbVKGpogbh+JhaJt8xuiyQwpttUYDCcsceiqk/uS3W8i1mS
	 nFpbPIk+2KdexBUxw9I29KmZX0IT5IpElIg7FNcnyHytkGAp3+7GpSH/U2LvYO8atm
	 3ZE3NsMo6YQNfzmwwrgAtRlXv8HAHvCKX7T8X0DnYs8Odvzps+SI5z1eZ4HL8ECv99
	 NzlbCnaY0ojPl3SGi8obwkLGudzE7EINKJh+PY6SkGKM47qJ9NuQ/0VpWlU+hK/6Vq
	 Em0KxYdEoFxOA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v13 0/8] Switch Arm SMCCC firmware services to an SMCCC bus
Date: Wed, 23 Sep 2026 19:33:57 +0530
Message-ID: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed here:
https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org

The earlier CCA guest support used an arm-cca-dev platform device as a pure
software anchor for the TSM class device. That platform device did not
correspond to a DT/ACPI described device, MMIO range, interrupt, or other
platform resource; it existed only to make the CCA guest driver bind and to
place the resulting TSM device in the driver model. The same pattern also
exists for smccc_trng. Creating separate platform devices for such
SMCCC-discovered features is misleading, because those features are not
independent platform devices.

This series adds an Arm SMCCC bus for services discovered through the SMCCC
firmware interface. The bus provides SMCCC device and driver registration
helpers, SMCCC function id based matching, uevent modalias generation, and
a sysfs modalias attribute. SMCCC service drivers can use
MODULE_DEVICE_TABLE(arm_smccc, ...) to emit arm_smccc:f<functionid>
aliases, allowing userspace to autoload service drivers when the SMCCC core
registers matching firmware-service devices.

The series then moves SMCCC TRNG and the Arm CCA guest RSI service off the
platform bus. When the SMCCC core discovers the corresponding firmware
service, it registers an arm-smccc device for that service. The hwrng
arm_smccc_trng driver and the Arm CCA guest TSM provider are converted to
SMCCC drivers that bind to those discovered devices.

The old arm-cca-dev platform device has also been used by userspace as a Realm
guest indicator. Removing it without a replacement would leave userspace
depending on an internal driver-binding device. This series therefore adds
/sys/firmware/cca/realm_guest as a stable, architecture-provided ABI for
detecting whether the kernel is running as an Arm CCA Realm guest, and then
removes the dummy arm-cca-dev platform-device registration.

Changes from v12:
https://lore.kernel.org/all/20260921053807.354802-1-aneesh.kumar@kernel.org
* Split patch 7 into two patches:
   "coco: guest: arm64: Remove dummy CCA platform device"
   "coco: guest: arm64: Add sysfs ABI for CCA Realm guests"
* Add the hw_random and kbuild maintainers to the Cc list.
* Add all newly added files to MAINTAINERS.
* Make cca_kobj a local variable.
* Update to_arm_smccc_device to container_of_const 

Changes from v11:
https://lore.kernel.org/all/20260914060511.277948-1-aneesh.kumar@kernel.org
* Collect Reviewed-by tags.
* Update commit messages based on feedback.
* Update the sysfs file documentation.
* Use put_device() consistently for cleanup on error.

Changes from v10:
https://lore.kernel.org/all/20260904095000.1184861-1-aneesh.kumar@kernel.org
* Collect Reviewed-by tags.
* Add the missing linux/types.h include.
* Update the arm_smccc_1_1_invoke() call to pass 0 as the input value for x1-x7.

Changes from v9:
https://lore.kernel.org/all/20260805063255.1638614-1-aneesh.kumar@kernel.org
* Rename CONFIG_ARM_RMM to CONFIG_ARM_RMM_RSI to make the Kconfig option RSI-specific.
* Update the modalias to use the SMCCC function ID.
* Don't issue SMC64 SMCCC calls on arm32.
* Drop the IDA usage.

Changes from v8:
https://lore.kernel.org/all/20260707081351.1680209-1-aneesh.kumar@kernel.org
* Rebase onto the arm64 for-next/core branch.
* Move the RSI code from arch/arm64 to drivers/firmware/arm_rmm in patch 3.
* Add a new patch to move the Realm memory-encryption operations to the RSI code.
* Drop the Reviewed-by tag from patch 3.

Changes from v7:
https://lore.kernel.org/all/20260611130429.295516-1-aneesh.kumar@kernel.org
* Rebase to latest kernel
* Add id_table check in arm_smccc_driver_register
* Add smccc device name check in arm_smccc_device_register
* Drop driver_data from struct arm_smccc_device_id

Changes from v6:
https://lore.kernel.org/all/20260527100233.428018-1-aneesh.kumar@kernel.org
* Move SMCCC bus-related code to bus.c.
* Remove CONFIG_ARM64 #ifdefs and switch device creation to use the generic function-ID support framework.
* Move version-specific checks and other conditionals to the device driver probe routines.
* Move RSI definitions to include/linux/arm-smccc-rsi.h.
* Split the file and variable renames into a separate patch.

Changes from v5:
https://lore.kernel.org/all/20260514094030.42495-1-aneesh.kumar@kernel.org
* Replace the arm-smccc platform-device plus auxiliary-child model with a
  dedicated Arm SMCCC bus.
* Add SMCCC module alias support so SMCCC service drivers can use
  MODULE_DEVICE_TABLE(arm_smccc, ...) and autoload through arm_smccc:<name>
  aliases.
* Convert smccc_trng from a platform driver to an SMCCC driver.
* Convert the Arm CCA guest TSM provider from the arm-cca-dev platform device
  to an SMCCC driver bound to the discovered RSI service.
* Add /sys/firmware/cca/realm_guest before removing the old arm-cca-dev dummy
  platform device.

Changes from v4:
https://lore.kernel.org/all/20260427061615.905018-1-aneesh.kumar@kernel.org
* Add /sys/firmware/cca/realm_guest for detecting realm guest
* Convert smccc_trng to auxiliary device from platform device

Changes from v3:
https://lore.kernel.org/all/20260309100507.2303361-1-aneesh.kumar@kernel.org
* Rebased onto the latest kernel
* Drop pr_fmt() from drivers/firmware/smccc/rmm.c

Cc: Jason Gunthorpe <jgg@nvidia.com> 
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>
Cc: Russell King <linux@armlinux.org.uk>

Aneesh Kumar K.V (Arm) (8):
  firmware: smccc: Add an Arm SMCCC bus
  firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
  firmware: arm_rmm: Move RSI support out of arch/arm64
  arm64: realm: Move Realm memory encryption ops to RSI code
  virt: coco: arm-cca-guest: Rename TSM report source file
  firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC
    device
  coco: guest: arm64: Add sysfs ABI for CCA Realm guests
  coco: guest: arm64: Remove dummy CCA platform device

 Documentation/ABI/testing/sysfs-firmware-cca  |   7 +
 MAINTAINERS                                   |   6 +
 arch/arm/include/asm/archrandom.h             |   2 +-
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/archrandom.h           |   2 +-
 arch/arm64/include/asm/io.h                   |   2 +-
 arch/arm64/include/asm/mem_encrypt.h          |   5 +-
 arch/arm64/include/asm/pgtable-prot.h         |   2 +-
 arch/arm64/include/asm/rsi.h                  |  70 --------
 arch/arm64/kernel/Makefile                    |   2 +-
 arch/arm64/kernel/setup.c                     |   2 +-
 arch/arm64/mm/init.c                          |   3 +-
 arch/arm64/mm/pageattr.c                      |  38 +----
 drivers/char/hw_random/arm_smccc_trng.c       |  32 ++--
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/arm_rmm/Kconfig              |  17 ++
 drivers/firmware/arm_rmm/Makefile             |   2 +
 .../kernel => drivers/firmware/arm_rmm}/rsi.c |  77 +++++++--
 drivers/firmware/smccc/Makefile               |   2 +-
 drivers/firmware/smccc/bus.c                  | 158 ++++++++++++++++++
 drivers/firmware/smccc/smccc.c                |  68 +++++++-
 drivers/virt/coco/arm-cca-guest/Kconfig       |   3 +-
 drivers/virt/coco/arm-cca-guest/Makefile      |   2 +
 .../arm-cca-guest/{arm-cca-guest.c => main.c} |  52 +++---
 .../linux/arm-rsi-cmds.h                      |  76 ++++++++-
 include/linux/arm-smccc-bus.h                 |  48 ++++++
 .../linux/arm-smccc-rsi.h                     |   6 +-
 include/linux/device-id/arm_smccc.h           |  19 +++
 include/linux/mod_devicetable.h               |   1 +
 scripts/mod/devicetable-offsets.c             |   3 +
 scripts/mod/file2alias.c                      |   8 +
 32 files changed, 529 insertions(+), 189 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
 delete mode 100644 arch/arm64/include/asm/rsi.h
 create mode 100644 drivers/firmware/arm_rmm/Kconfig
 create mode 100644 drivers/firmware/arm_rmm/Makefile
 rename {arch/arm64/kernel => drivers/firmware/arm_rmm}/rsi.c (71%)
 create mode 100644 drivers/firmware/smccc/bus.c
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} (82%)
 rename arch/arm64/include/asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h (69%)
 create mode 100644 include/linux/arm-smccc-bus.h
 rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)
 create mode 100644 include/linux/device-id/arm_smccc.h


base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
-- 
2.43.0

