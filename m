Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F49E43E9E0;
	Fri,  4 Sep 2026 09:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515418; cv=none; b=CTjuKQugY3FUMv8PJi+xmkTqRE8DXH8885aZpsj/ivhfw7NEzqKm4Aobz/NjvBJBFIErKZQKGYIq6DTZ4KShGlzCIbnCRSKLLTtRPw57E/8shI2nNn4FOa8C4HFMdU8TIcuCjzaCfjMnsEzmxpYeV6PzA5DD25G23rAuYtTjSZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515418; c=relaxed/simple;
	bh=4AWLRwWWDLwU3KrI/9WXiviT9ra+wAs4RsjHG5zi6xM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFJyOEb7AERi7o7t0KeroS0Kz9offc119KAL5dwOn7CeFPA8lKrs/g0bNCbA3MNlI8FkDCTjYygvhDaJljqPifQ6l7y0Vt0RTmh/a4QkvSX2PHHHSJXXLpYhyUueeaEsW5jx1NRMGO+DMTAp0LfXT6EAhjAUdTi3btdEy6XleKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCmh5U2G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCmh5U2G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A29F1F00A3D;
	Fri,  4 Sep 2026 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788515417;
	bh=JgdXBDDgWhINzJnCEwyOSF2W+5SgQKNfmGsCa9IDw3U=;
	h=From:To:Cc:Subject:Date;
	b=lCmh5U2GNlU+1TWW+D2Dhf3P6Hm7OvYcOwlSqO1Gg8o+a//8+vsSE+0vqH77Bd/N3
	 0qPr9rURmz98lSin+21Lz9N9t3Z/cy0G8AA/LEtGKBFOnm7OINSwgf/SOVIXhkkzsP
	 9Le/9+8TB3rtx1iL0OBeorUuvjQUPHTxcPIxIUv68KT++WA/VSCxWX8IKBIs68HtFi
	 nv0G+xnLDDYA/BcJ1g8aqL2qgS5k6x5x0cVisa2h4UpMvGSTlFKkXnAExIOZ0ufQkH
	 VeruVVxNdvh09krhwbJw0YMD5Qn9E0NUFsylArzuDkPD69HbuYbC0IfJV8iRln5Pl7
	 ovtjLaJB4G+qQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v10 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
Date: Fri,  4 Sep 2026 15:19:53 +0530
Message-ID: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
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

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>

Aneesh Kumar K.V (Arm) (7):
  firmware: smccc: Add an Arm SMCCC bus
  firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
  firmware: arm_rmm: Move RSI support out of arch/arm64
  arm64: realm: Move Realm memory encryption ops to RSI code
  virt: coco: arm-cca-guest: Rename TSM report source file
  firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC
    device
  coco: guest: arm64: Replace dummy CCA device with sysfs ABI

 Documentation/ABI/testing/sysfs-firmware-cca  |  10 ++
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
 .../kernel => drivers/firmware/arm_rmm}/rsi.c |  78 +++++++--
 drivers/firmware/smccc/Makefile               |   2 +-
 drivers/firmware/smccc/bus.c                  | 151 ++++++++++++++++++
 drivers/firmware/smccc/smccc.c                |  67 ++++++--
 drivers/virt/coco/arm-cca-guest/Kconfig       |   3 +-
 drivers/virt/coco/arm-cca-guest/Makefile      |   2 +
 .../arm-cca-guest/{arm-cca-guest.c => main.c} |  55 +++----
 .../linux/arm-rsi-cmds.h                      |  76 ++++++++-
 include/linux/arm-smccc-bus.h                 |  48 ++++++
 .../linux/arm-smccc-rsi.h                     |   6 +-
 include/linux/device-id/arm_smccc.h           |  15 ++
 include/linux/mod_devicetable.h               |   1 +
 scripts/mod/devicetable-offsets.c             |   3 +
 scripts/mod/file2alias.c                      |   8 +
 31 files changed, 518 insertions(+), 189 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
 delete mode 100644 arch/arm64/include/asm/rsi.h
 create mode 100644 drivers/firmware/arm_rmm/Kconfig
 create mode 100644 drivers/firmware/arm_rmm/Makefile
 rename {arch/arm64/kernel => drivers/firmware/arm_rmm}/rsi.c (70%)
 create mode 100644 drivers/firmware/smccc/bus.c
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} (82%)
 rename arch/arm64/include/asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h (69%)
 create mode 100644 include/linux/arm-smccc-bus.h
 rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)
 create mode 100644 include/linux/device-id/arm_smccc.h


base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
-- 
2.43.0

