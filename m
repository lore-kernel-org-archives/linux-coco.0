Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598362DF134;
	Wed,  5 Aug 2026 06:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911599; cv=none; b=lihWYhKtfLqsmE5WqdsiGa28nCx7ujDkf/TbsjM/G7qekzHmVDxfq7deNtPID154f1zu1HIjsv7TXNH9P+xW481EUnTlQ9RXqjpRD3kLw8OuxwxZYAO3JvDgD6IW0zSYsOzwihjhCfg3cJVcKV9+cIx7J1O34/QdDjT9aqYlU78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911599; c=relaxed/simple;
	bh=bcm5oDjlP2ddk+K7GRMwiiWNNVHYwti8iy0vbamZ0KY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ffpVwj0lXpyXLZkgr4Or9hW0zMTOBfcYgu9mxmIBk4JJAsJnSWnd1qHfz0WCRmvjAVpFrU6gQ2slqt3T7y1DQaEDyrYFXY7fX27DP/IjOEhHvkjKjdzzliPmRvy1kI3HLtFyG0nE4tLkmf7mDUyKl9LFiD1z+d3JQ+EXOoasfZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbQ20T9a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbQ20T9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CF41F000E9;
	Wed,  5 Aug 2026 06:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785911598;
	bh=/tnc8Gm3ApRGsxNnIuAMb3iJjZg7VTWN5WeJ2QjX9nM=;
	h=From:To:Cc:Subject:Date;
	b=jbQ20T9aYUZriNWwUfrkHOki30R74EsSjAKbIBSGERAB2lFjdidyNgnrgrK9dJO4a
	 TduAnbaCA3sGqbk1LDEB0lvTguSRpGB1aU7Hl6Sl2KhJZcX0JXA2hlb6tYEliytrdE
	 d1WHgUhbHfahc7+iiAq9Wvns8OLPiIFfg1qQVTDrKnnrAFytnXSlfNu1i9DI2NaYoC
	 KbEUHdDDk52DC3afgEcjYTOjXoAOWgvUO30XGnrzHadTyVVSzRehjIcAW4xOQdN9kR
	 2Z0UZVxvx4t5YnMndnSMxiVqe1xBNMyuJH3WwzGEOv/l50Xu3D5hQWgw53pG4syRr2
	 m5lphkv7KG2Ug==
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
Subject: [PATCH v9 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
Date: Wed,  5 Aug 2026 12:02:48 +0530
Message-ID: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
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
helpers, name-based matching, uevent modalias generation, and a sysfs modalias
attribute. SMCCC service drivers can use MODULE_DEVICE_TABLE(arm_smccc, ...)
to emit arm_smccc:<name> aliases, allowing userspace to autoload service
drivers when the SMCCC core registers matching firmware-service devices.

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
 arch/arm64/mm/pageattr.c                      |  38 +---
 drivers/char/hw_random/arm_smccc_trng.c       |  32 ++--
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/arm_rmm/Kconfig              |  18 ++
 drivers/firmware/arm_rmm/Makefile             |   2 +
 .../kernel => drivers/firmware/arm_rmm}/rsi.c |  75 ++++++--
 drivers/firmware/smccc/Makefile               |   2 +-
 drivers/firmware/smccc/bus.c                  | 166 ++++++++++++++++++
 drivers/firmware/smccc/smccc.c                |  65 ++++++-
 drivers/virt/coco/arm-cca-guest/Kconfig       |   3 +-
 drivers/virt/coco/arm-cca-guest/Makefile      |   2 +
 .../{arm-cca-guest.c => arm-cca.c}            |  65 ++++---
 .../linux/arm-rsi-cmds.h                      |  76 +++++++-
 include/linux/arm-smccc-bus.h                 |  49 ++++++
 .../linux/arm-smccc-rsi.h                     |   8 +-
 include/linux/device-id/arm_smccc.h           |  16 ++
 include/linux/mod_devicetable.h               |   1 +
 scripts/mod/devicetable-offsets.c             |   3 +
 scripts/mod/file2alias.c                      |   8 +
 31 files changed, 541 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
 delete mode 100644 arch/arm64/include/asm/rsi.h
 create mode 100644 drivers/firmware/arm_rmm/Kconfig
 create mode 100644 drivers/firmware/arm_rmm/Makefile
 rename {arch/arm64/kernel => drivers/firmware/arm_rmm}/rsi.c (71%)
 create mode 100644 drivers/firmware/smccc/bus.c
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (82%)
 rename arch/arm64/include/asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h (69%)
 create mode 100644 include/linux/arm-smccc-bus.h
 rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (97%)
 create mode 100644 include/linux/device-id/arm_smccc.h


base-commit: df386fe6be46dce460d9366066a277ec8b45a01c
-- 
2.43.0

