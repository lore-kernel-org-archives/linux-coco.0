Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEE625BABF
	for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702652; cv=none; b=MO9d+g3lBKl/F/Gb3vQwGP6ZFSZpDpx+9jyx6NqeKveyq7sHIKCYhEtcA93JtvK0R5/bOJgasPxHom9UwbWRVOil2+9o7Q3fVT0U+vw6kJTeYhytfCpRhTXZl6B7+47A7F8Qg3nGgSdv+xo9DAIwgtDGYAEdAYuhjmw/UXXs7Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702652; c=relaxed/simple;
	bh=LKmYCLsgh14jgzOXslw0xBpZ4YsbedeRx4QFVUEXTz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzeqKqWv4SyFCT81LMCcOndNI1r1Zv9Yl4A0pr97zJGTcJGm65ydmdxzPMW/Zau7tQKCeU9tQWd7q2mRgCLmMBKRZMg5H3BG8+Tk63mVVIZyV734ZTAZNVo6JMJmpcDFpoApg+y6Agth9gIxkDz1KAcLFgTDvIJRfh+gvByhHvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01DC21762;
	Tue, 11 Mar 2025 07:17:41 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E7A03F694;
	Tue, 11 Mar 2025 07:17:28 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: lpieralisi@kernel.org,
	robin.murphy@arm.com,
	aneesh.kumar@kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linux-pci@vger.kernel.org,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v2 06/11] samples/devsec: Introduce a PCI device-security
Date: Tue, 11 Mar 2025 14:17:08 +0000
Message-ID: <20250311141712.145625-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <174107249038.1288555.12362100502109498455.stgit@dwillia2-xfh.jf.intel.com>
References: <174107249038.1288555.12362100502109498455.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

I have been playing with this, and these changes kind of makes it work on arm64
and hopefully for others with CONFIG_PCI_DOMAINS_GENERIC.

The first patch is a build failure fix for my toolchain.

[RFC PATCH 0/3] samples: devsec: Add support for PCI_DOMAINS_GENERIC

# insmod devsec_common.ko
# insmod devsec_bus.ko
# insmod devsec_tsm.ko
# dmesg
[ 7817.297135] devsec_bus devsec_bus: PCI host bridge to bus 0001:00
[ 7817.297251] pci_bus 0001:00: root bus resource [bus 00-01]
[ 7817.297374] pci_bus 0001:00: root bus resource [mem 0xfffffff000000000-0xffffffffffffffff 64bit]
[ 7817.297653] pci 0001:00:00.0: [8086:7075] type 01 class 0x060400 PCIe Root Port
[ 7817.297856] pci 0001:00:00.0: PCI bridge to [bus 00]
[ 7817.297986] pci 0001:00:00.0:   bridge window [io  0x0000-0x0fff]
[ 7817.298115] pci 0001:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[ 7817.298267] pci 0001:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[ 7817.304866] pci 0001:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[ 7817.305464] pci 0001:01:00.0: [8086:ffff] type 00 class 0x000000 PCIe Endpoint
[ 7817.305664] pci 0001:01:00.0: BAR 0 [mem 0x00000000-0x001fffff]
[ 7817.312503] pci 0001:01:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
[ 7817.312714] pci_bus 0001:01: busn_res: [bus 01] end is updated to 01
# cd /sys/bus/pci/devices/0001\:01\:00.0/
# cat tsm/connect
0
# echo 1 > tsm/connect
# cat authenticated
1
# echo 0 > tsm/connect
# cat authenticated
0



Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-coco@lists.linux.dev

Suzuki K Poulose (3):
  pci: ide: Fix build failure
  pci: generic-domains: Add helpers to alloc/free dynamic bus numbers
  samples: devsec: Add support for PCI_DOMAINS_GENERIC

 drivers/pci/ide.c       |  5 +++--
 drivers/pci/pci.c       | 16 ++++++++++++++--
 include/linux/pci.h     |  3 +++
 samples/Kconfig         |  1 -
 samples/devsec/bus.c    | 32 +++++++++++++++++++++-----------
 samples/devsec/common.c |  2 +-
 samples/devsec/devsec.h |  2 +-
 7 files changed, 43 insertions(+), 18 deletions(-)

-- 
2.43.0

