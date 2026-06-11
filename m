Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE8D3F6C50;
	Thu, 11 Jun 2026 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781183086; cv=none; b=doZCn4DQ1UGpijILZoy9JARkssIwtMLcU4cBZFdrY//dRR0IIhDB8zyJnVvUpV4NrsKTgaaiIDap8GIXP2lC91u0xsuCoj0x9cKz5erdtPHsmyEc+91U2oY/GJcnSk0R9RxS89kgfGLN0q3cjGUvluHtfb0tdqFtCeLG+9lGVQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781183086; c=relaxed/simple;
	bh=B8lNUN1QJax/e/4DWyb7GJ58zc2HwTGZrEqdltjkODo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rh4HT9Gri+xK48nCvQnf+6KNGIc7sd+IkOYGxVro7zkCsdJIbZjYLN8fd9WlSWTTL9+HIPmP6OH1SOu+dovsyVyRRBjB9LwtLqjFfpAWelY5eHJCmzi5ZHALawLnef+48Kxfso91tXZ9w2PSHWMssT/CrCiJygnaMaJ3Vz4yM9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJVIwv4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJVIwv4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800091F00893;
	Thu, 11 Jun 2026 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781183082;
	bh=SdrD0Q6znMCV7nKzA94nPcfBUYTqnnmeF4rDluH+aFw=;
	h=From:To:Cc:Subject:Date;
	b=ZJVIwv4GBTyk4xKs51XmDOQg2fybtiTFunmO7XCQO4/FgkGeCBm+HNZAQorij5s+U
	 zt5AlNXIK429U0l0DgXPV2Xs6XYxI7wQ0ELWRWOqB9Dq/dwmTMDoGmzyj301XUpjfi
	 UBA09UZeUV8imJGOIsR8SErTW7j7ml5DiHZgrL6k/IW9VCx/0qLOZzyCy4ZKwMzDf/
	 K5gry18FVCWaiknjtzwcwpjD/K4xa2Z9xtCqwVl0h+dCxmc5lAf5fNbWYgbJ84gFrS
	 aKdZd3+hHu762r6VfJZXVU9kRWTMk2lwbKbCMU3jLdE3uGQqmOd9ln9wPpVdC0KyM4
	 OYm6FP53YBvoQ==
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
Subject: [PATCH v7 0/6] Switch Arm SMCCC firmware services to an SMCCC bus
Date: Thu, 11 Jun 2026 18:34:23 +0530
Message-ID: <20260611130429.295516-1-aneesh.kumar@kernel.org>
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

Changes since v6:
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

Aneesh Kumar K.V (Arm) (6):
  firmware: smccc: Add an Arm SMCCC bus
  firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
  firmware: smccc: Move RSI definitions to include/linux
  virt: coco: arm-cca-guest: Rename TSM report source file
  firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC
    device
  coco: guest: arm64: Replace dummy CCA device with sysfs ABI

 Documentation/ABI/testing/sysfs-firmware-cca  |  10 ++
 arch/arm64/include/asm/archrandom.h           |   2 +-
 arch/arm64/include/asm/rsi.h                  |   2 -
 arch/arm64/include/asm/rsi_cmds.h             |  74 +-------
 arch/arm64/kernel/rsi.c                       |  39 +++--
 drivers/char/hw_random/arm_smccc_trng.c       |  32 ++--
 drivers/firmware/smccc/Makefile               |   2 +-
 drivers/firmware/smccc/bus.c                  | 164 ++++++++++++++++++
 drivers/firmware/smccc/smccc.c                |  65 ++++++-
 drivers/virt/coco/arm-cca-guest/Kconfig       |   1 +
 drivers/virt/coco/arm-cca-guest/Makefile      |   2 +
 .../{arm-cca-guest.c => arm-cca.c}            |  62 +++----
 drivers/virt/coco/arm-cca-guest/rsi.h         |  84 +++++++++
 include/linux/arm-smccc-bus.h                 |  49 ++++++
 .../linux/arm-smccc-rsi.h                     |   8 +-
 include/linux/mod_devicetable.h               |  13 ++
 scripts/mod/devicetable-offsets.c             |   3 +
 scripts/mod/file2alias.c                      |   8 +
 18 files changed, 480 insertions(+), 140 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
 create mode 100644 drivers/firmware/smccc/bus.c
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (85%)
 create mode 100644 drivers/virt/coco/arm-cca-guest/rsi.h
 create mode 100644 include/linux/arm-smccc-bus.h
 rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (97%)


base-commit: ddd664bbff63e09e7a7f9acae9c43605d4cf185f
-- 
2.43.0

