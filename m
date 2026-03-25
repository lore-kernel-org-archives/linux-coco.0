Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B3431D372
	for <linux-coco@lists.linux.dev>; Wed, 25 Mar 2026 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466638; cv=none; b=p0gpOm1+39+ttOJD6OwqkZ/vXps9PAgysxwyKX2md3FQQGpd02Cbei5SunXp7HFz3viZmi7wtKUoesrPd8bWdvbcRdKMM2cf1+NpoeITT2WmXIIE3hoNwH7k63O793n7WJMq82aSabTZa7XYKl81ubk2t1H38qkb9mUPsxESUfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466638; c=relaxed/simple;
	bh=5zxzl6uudo5fm3rD4gIEZz87DRY+U9FKt25ekqymGSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cum7gtkGjBabfobCt2etpkACI/k0zabUREsx3t5UltulSseXE9sepwM3qllRyjWisDS4BPtw0Di4OTgMjBm+Ezn1FK+F0hjV4XorS/CEtdfVYvtodesnHeGMFAajD+Ixe0kxHYkfSPjB8OB3ECaNioLYWx65lBEENXcEzy1bNJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=hNZ1fLNc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="hNZ1fLNc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486ff201041so1976415e9.1
        for <linux-coco@lists.linux.dev>; Wed, 25 Mar 2026 12:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1774466634; x=1775071434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9oYYl5Ubh4Ping1zst+E8em20zAUpauFfgriVu6hpE=;
        b=hNZ1fLNctWXVp2z9G5UhDmM+HsCoGwiHDGxJe2l80wDd9MkfQBtI/ZIHI/+Q4Gs52Y
         gs5sUwW4+flZdC68EExBdKTjmPWAHu8lVAr801DMJt7JwJ8atbcGCFOxS3Htk6W5W+zI
         srFM6tHBO+G5+pm0QOtK9xQ7IaV11jFe6vJKFcOg1RB7BRGmEoUAWVG7gTP7jopBz5VE
         WVewew6B3AsOH5Dv3ZtajahSEttLkNcmMWO3+ixzvtfMTT9TCsJKy/+trYTumjCi/9J6
         ObNTF08euxWqomo4BbUbH2839wjFFlqm2xI0juTDKH2UMNOKB+Kp1TDAuzpFIhMWzaSV
         E6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466634; x=1775071434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9oYYl5Ubh4Ping1zst+E8em20zAUpauFfgriVu6hpE=;
        b=gC5mHVQcyWvBab/YbinXI6zeNC6gC1NHC2FTg6x0QuBkJLQJNYP+g/beUTRe/JnXvU
         Hzs8i6k0HJSw6BXSydBuEoZBiiXC5M9+xljth6r/ijfoswX4Pui9K2bfqcEtSx3XVMgW
         S5Zdy3iSpCjOL5FprL067WxUw5lIVaLdhP3GQCWQg8EdZ+0zqmAtJNOJZNPRJ1tpafey
         tGrUJXWnkSIOhvuj5LwblkIfmBfGVh4PdrWhIemAcLn9fPMQ/AwB9cCmPA46g0CgNpNH
         jnCzNHImx3DyxcIx1dhJCjmwm3Bwjcn7i1xm2a4qFDDMNjDYZftD+IGfhcynMmhpX/1e
         RU5A==
X-Forwarded-Encrypted: i=1; AJvYcCUfWxNc4fqDt9MEioZc1icEnY+cQn9hteMtolg8am6zfMB39Os619bjN1hJeEZTwZkkTm7/4z5VeOQe@lists.linux.dev
X-Gm-Message-State: AOJu0YxAlFqqAjaMqF9vf+oT/6nBLUrBc5wX/KZ6rFHRr3OTRF6sXodI
	6TbH2Iw+dEDr1yb0yQyMh4hm/ZqSu6piedpqckYnfrsn6fh8pos0oEeSP3UtFNW3Lu8=
X-Gm-Gg: ATEYQzzLIG+DSAlRHfApfyIXUocrCPK9lI6jXMzlSiZ4YL6EDH8hhxeuLQGUuitjGhY
	ieLpKE/kmPRBVE/ufpefH0RNZl3JYIbL95BZxLvr4nabr+3BauL+hbDhyZomIWByPkYFBnKm0HF
	GWTs+e4lpUj12lV8dur43H+QHZi2jmagPrmLtCf6YwwfkEjYtkRZKGhRSNjJEeu7FPgnk3cXLLV
	SY7wj+O2iteoC3kN+C8WK3ZwIQRuJRcXpwOOxYAZFQBFaIpLBjni+RPmbinFtBrQXZk4G2IP19N
	WzwA93bNugeRJVDzqbQqEzTWrzWUa69rhZq+hhh2RdTNb5I1u5LbZuFqjZ7PJIN1yzl8rEiFe9K
	1rQI8nhhhtLPXyEko0hOCeyAPRAXNDja2haqZMytNFFKMp/w7GpxgGEOcs6JiEvaiHh1DoruKO3
	mMBvhtkq6DFc4gEScD5mwgrQGsNqFZ
X-Received: by 2002:a05:600c:1f12:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-4871605686dmr70437725e9.27.1774466633448;
        Wed, 25 Mar 2026 12:23:53 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7111sm1855634f8f.37.2026.03.25.12.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:23:53 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	sean.anderson@linux.dev,
	ptesarik@suse.com,
	catalin.marinas@arm.com,
	aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate explicitly shared/decrypted memory
Date: Wed, 25 Mar 2026 20:23:50 +0100
Message-ID: <20260325192352.437608-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
run with private/encrypted memory which creates a challenge
for devices that do not support DMA to it (no TDISP support).

For kernel-only DMA operations, swiotlb bounce buffering provides a
transparent solution by copying data through shared memory.
However, the only way to get this memory into userspace is via the DMA
API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
the use of the memory to a single DMA device, and is incompatible with
pin_user_pages().

These limitations are particularly problematic for the RDMA subsystem
which makes heavy use of pin_user_pages() and expects flexible memory
usage between many different DMA devices.

This patch series enables userspace to explicitly request shared
(decrypted) memory allocations from new dma-buf system_cc_shared heap.
Userspace can mmap this memory and pass the dma-buf fd to other
existing importers such as RDMA or DRM devices to access the
memory. The DMA API is improved to allow the dma heap exporter to DMA
map the shared memory to each importing device.

Based on dma-mapping-for-next e7442a68cd1ee797b585f045d348781e9c0dde0d

Jiri Pirko (2):
  dma-mapping: introduce DMA_ATTR_CC_SHARED for shared memory
  dma-buf: heaps: system: add system_cc_shared heap for explicitly
    shared memory

 drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
 include/linux/dma-mapping.h         |  10 +++
 include/trace/events/dma.h          |   3 +-
 kernel/dma/direct.h                 |  14 +++-
 kernel/dma/mapping.c                |  13 +++-
 5 files changed, 132 insertions(+), 11 deletions(-)

-- 
2.51.1

