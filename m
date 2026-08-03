Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA70A409108
	for <linux-coco@lists.linux.dev>; Mon,  3 Aug 2026 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761918; cv=none; b=lvrsQCgY9sS81rq5G45akYyGZL9kn9N6PDuXxJDHStvxEgNMGd2C84jXhXiRpuSzVesdhCK5cdHIBieOpIqJUQPhZIUJUUdFDRt11zOREgtt2LSgDl0KNH/4oTvvgr2KIFghiE+s9CpJnxcf8lmh8kJAryxuQ5/VoLD5Ze+g4Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761918; c=relaxed/simple;
	bh=4ZQ8yeV5Z5uhSZgSGD6YjBN550s0HeYJfH1YIWfAkoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMjQzSTxI+jeEzoH8+LYDeVqD/NyBt6xBsFuRkpMyoo/ewPFPizBaw791Weh/RZNEX+KORHFeodfT6V5xnGTFIfFKzp/e4TFi935Gabf0CPBMW9ULe1WwuBZRVKHY4N/S1nhSK+p2ZBZHBImHsN+gsvuTXdkuYGKlo8/V33vQeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.fritz.box (p200300f6af4fc500dcfec4a187edd2e0.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:dcfe:c4a1:87ed:d2e0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 43E37203F0A;
	Mon,  3 Aug 2026 14:58:29 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Tom Lendacky <thomas.lendacky@amd.com>,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: [PATCH 0/3 v2] x86/sev: Report MSR_AMD64_SEV in SYSFS
Date: Mon,  3 Aug 2026 14:58:24 +0200
Message-ID: <20260803125827.718024-1-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <joerg.roedel@amd.com>

Hi,

Here is an updated version of my original patch to report
MSR_AMD64_SEV in SYSFS. The intention is to give user-space tooling a
way to access the MSR value without needing to expose all MSRs via
the msr.ko module.

The patches here are updated to address a Sashiko comment asking why
SEV_STATUS is only reported for SEV-SNP guests. The sev_status file is
now created for SEV and SEV-ES guests as well.

Please review.

Thanks,

	Joerg

Joerg Roedel (3):
  x86/coco: Add CC_ATTR_GUEST_SEV
  x86/sev: Create /sys/devices/system/cpu/sev/ for all SEV guests
  x86/coco/sev: Make SEV_STATUS available via SYSFS

 .../ABI/testing/sysfs-devices-system-cpu      |  9 +++--
 arch/x86/coco/core.c                          |  3 ++
 arch/x86/coco/sev/core.c                      | 33 ++++++++++++++++---
 include/linux/cc_platform.h                   |  9 +++++
 4 files changed, 47 insertions(+), 7 deletions(-)

-- 
2.53.0

