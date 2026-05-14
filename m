Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055483A0E8A;
	Thu, 14 May 2026 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751645; cv=none; b=KxXDUP0R1SzjvotqjjTaJJZBoazA0+wf2IdT7KprImuXIFzPExt/WkLhIrMjCsSqKKcD5GaVFhpuM8DliM1f8n3arw4J443su765EVyONkQ7QMjBregZ9wMgWubo84N+XCrzk+6Y6xV3mKnQcxf6GihyxCFvzTid1xUB8FAEu+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751645; c=relaxed/simple;
	bh=e8wmx6mCu40tXgHwdlK2Aqk7hbkeqgCMsK8w1i8eRvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iu8WIpHWSWvb6Vf66w1ayL3LO2OJ4AtNFxAXPE2LVFsgvdWmYXSXENvBt8ZpyrGBDQnLG0qkYY4AdR60+ANsp75ufDPJuH5rLEuc7E+7yatamiA8ICbTVfhgddJSJ1pfsZrnOjXUs4T3QV93+VJVNAUxiz2VTYiyv3IN4026H9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkf/wJlc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkf/wJlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58BEC2BCB3;
	Thu, 14 May 2026 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778751644;
	bh=e8wmx6mCu40tXgHwdlK2Aqk7hbkeqgCMsK8w1i8eRvI=;
	h=From:To:Cc:Subject:Date:From;
	b=jkf/wJlcbOh+keKTg0DD76tTmtaN0MLAAPrvStt2rFZL9aHEiesUzcwgJU+tzS9zr
	 g5LbVSyfQBUFFv/ybgGhK/Ds+jFOYRM6cnZmtFCUxk8ztIeB9qAI7BFBmjjwuY1wDw
	 7yPj4yM57CUBVk0APUAtB2lcCzgPvfTUB6LmXjDF2MFGHrVdfxk5en9dIN8YXj4Ga6
	 g4pVhAyBtmP+cAXdaoWnnnq7tvH0LhvX3AcCv0TJ89MlwB/ITdGByCe+0EgelEMs29
	 ZurbSb5IzI61PTMP0E5SxGiolP0S1PuIhnwgfjcVkOg/F4LkD62ScR54ZnLY2M41aW
	 lLOxrpzEn5gXg==
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
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: [PATCH v5 0/3] Switch Arm CCA to use an auxiliary device instead of a platform device
Date: Thu, 14 May 2026 15:10:27 +0530
Message-ID: <20260514094030.42495-1-aneesh.kumar@kernel.org>
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

The general feedback was that a platform device should not be used when
there is no underlying platform resource to represent. The existing CCA
support uses a platform device solely to anchor the TSM interface in the
device hierarchy, which is not an appropriate use of a platform device.
Use an auxiliary device instead to track CCA support.

The TSM framework uses the device abstraction to provide cross-architecture
TSM and TEE I/O functionality, including enumerating available platform TEE
I/O capabilities and provisioning connections between the platform TSM and
device DSMs.

For the CCA platform, the resulting device hierarchy appears as follows.
Note that the auxiliary device is still parented by the arm-smccc platform
device, so the sysfs path remains under /devices/platform/arm-smccc/:

$ cd /sys/class/tsm/
$ ls -al
total 0
drwxr-xr-x    2 root     root             0 Jan  1 00:02 .
drwxr-xr-x   23 root     root             0 Jan  1 00:00 ..
lrwxrwxrwx    1 root     root             0 Jan  1 00:03 tsm0 -> ../../devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0/tsm/tsm0
$

Changes from v4:
https://lore.kernel.org/all/20260427061615.905018-1-aneesh.kumar@kernel.org
* Add /sys/firmware/cca/realm_guest for detecting realm guest
* Convert smccc-trng to auxiliary device from platform device

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

Aneesh Kumar K.V (Arm) (3):
  firmware: smccc: coco: Manage arm-smccc platform device and CCA
    auxiliary drivers
  hwrng: arm_smccc_trng: Register as an auxiliary device
  coco: guest: arm64: Replace dummy CCA device with sysfs ABI

 Documentation/ABI/testing/sysfs-firmware-cca  | 10 ++++
 arch/arm64/include/asm/rsi.h                  |  2 +-
 arch/arm64/kernel/rsi.c                       | 39 ++++++++----
 drivers/char/hw_random/arm_smccc_trng.c       | 25 ++++----
 drivers/firmware/smccc/Kconfig                |  1 +
 drivers/firmware/smccc/Makefile               |  1 +
 drivers/firmware/smccc/rmm.c                  | 24 ++++++++
 drivers/firmware/smccc/rmm.h                  | 17 ++++++
 drivers/firmware/smccc/smccc.c                | 29 +++++++--
 drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
 drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
 .../{arm-cca-guest.c => arm-cca.c}            | 59 +++++++++----------
 12 files changed, 153 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
 create mode 100644 drivers/firmware/smccc/rmm.c
 create mode 100644 drivers/firmware/smccc/rmm.h
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (84%)

-- 
2.43.0

