Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B4D37FF50
	for <linux-coco@lists.linux.dev>; Mon,  9 Feb 2026 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651493; cv=none; b=EDJnD0D46D9EqNxF6uAfURCY81T/89rI/ms/n+3ZndZ7g/CPDhXOKsh1jlXV6cw1cxSdtmQbWu40XsS8KnvtMD3Oz5dVB3ga2qtv3yQnG9KnWS9bPsbukMSFNCH+UXEQ3jxpyKwi9gwrg2L9NWCPqZKxua8ad4hDGeLNeRlrzPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651493; c=relaxed/simple;
	bh=ls9T1LlIM3oO6+LZXE2PlgRVjxyYDS9g9pq/cPHMgtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r7/l0YfZVNaHNYmLF8jf5qPrqSIgilxMCeHA6ZtMt69SV8XHsUOogvcgt9iuK1jDE/2lLJtET/q645LNjpmieLXKqqaCclZM2i42Ypp5Wcd9wi+mg2dNZKdRgz838GWZyl89fGa5k8C1fkN4zn6ELZKmSl4G/IY3ZhcdAizsfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=CLgqw1E2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="CLgqw1E2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so13019035e9.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Feb 2026 07:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651490; x=1771256290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BiucukKgd6A5IEwlte0sQaw8GOuaez4s0BdPuzMpI0U=;
        b=CLgqw1E2CVxbmeFJeAsMZWgwxAveYW2GR/7KiUHgopx2yrRhyjdksUwR9CAs0sdYGu
         tGlmk7rwU5ybXCayh1LTShgLMr3Ze595x2rylA1ADeMXuV1ozvpqQpGjizkt9ueaa/bh
         EwmJvUn3too5SXdCyI/VNkpTuyRjR3HY459YEEKr0oQZfzcWnraIeOBbs9JsnObHesiZ
         1YA1oSK+OH+cSsL564isQ3SIvr0y3dm3Fpi4g4hvlI1uNxK6cKei5BCwMnA0xTVbedGh
         Uuo839+UCcMaMN+x+I86nSrWYgl+kvxwQeZdoTkReHDKuUgH6IpdaQiQr8xo3/+7jGrQ
         UcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651490; x=1771256290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiucukKgd6A5IEwlte0sQaw8GOuaez4s0BdPuzMpI0U=;
        b=OnNgAonHuUE+WlnSsrfzYGZNH+kc3rpxkO9vu6+1M+Ar7Mkql3SpQLpL7xdU3WnmqA
         hX/b0KxRGFA3tKCNPVtuFVCQuCX8bfrZeLB76/3e/NsaoFfqxC4IRUWmgCAbA6ZQCQ/A
         b+j0G5iVg5Ekk0PTFf1eq7k4e4ffZk2TSZg1i+NUj8TRb61p21/8McEnJx4XoOF7kPw9
         gRt1mqicP/ukoyBoHPzbVkyBmMrvYOB89tBMmliTkd4zntIQNd7BuiNosWuEGvuhCJre
         /vVbhgb/QJxjnrVOlx6j/HAAP0F/2ROZe7Uz/PgnAzaYozhZib0f1sx67t/VEa+qYazJ
         LT3A==
X-Forwarded-Encrypted: i=1; AJvYcCUjEvg9H+8rd9akhAMqCqMctOFZlY1eXjk8z6IX5m4Sdms7eCsyjb8QBAbRg5/FzuPF/24ilTPv4AND@lists.linux.dev
X-Gm-Message-State: AOJu0YwREFXPGYk9SslWV8vWnquvIYRvEkTP8iZPViJbcjI5Y7sJPRA0
	hwsJUHNr/Bv4Lg3qS5772BqEPKZIWmqOS6r17LutVQHlMZyuLRVsrZ/fRj1TaA+zNh8=
X-Gm-Gg: AZuq6aJqq45AVXGo+QCqMc1D0eyYa+96PwU1OjaOG2g75utK215njDX0RhXLFeiKGON
	eLxdVqfvnifhEaC6BIcK9QM6G2YRmaTBZutr7JhhfUfbysDw2oalDXjXavpL8py5zfpox1yfHWn
	TZKectk+vAxbd9RCCue3/ZUH0zL1W2UI+dKxWmcYYuJI9v5cBz/Ylgh07fYhFiOKwG8iQrWVMGP
	XiPMtqvoWRQgbDu9uLu5Q6zXPUDoXdqjDqIgpKVZxJ1IA1/hjwvXVW+XHH8ECcM3nvktCrWfwz5
	FW8VZSxorQqjQSPOxHf9RL7DF3zevOwnFjpelso3m1KI1F9t9d4nCrx0vaj6BMPYIyF34rYnlPF
	cX3WgFresh92AvZ3Y0kozMMvcaxgw9UZL9Hebn7FYg+Q8Acs655S4ngP4vWvh17yUXxzovYLUYW
	ii1Q+xJzuwfgbr
X-Received: by 2002:a05:600c:621a:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-4832097e2b0mr178535855e9.27.1770651490292;
        Mon, 09 Feb 2026 07:38:10 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d8341csm329338275e9.13.2026.02.09.07.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:38:09 -0800 (PST)
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
Subject: [PATCH 0/5] dma-buf: heaps: system: add an option to allocate explicitly decrypted memory
Date: Mon,  9 Feb 2026 16:38:04 +0100
Message-ID: <20260209153809.250835-1-jiri@resnulli.us>
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
run with encrypted/protected memory which creates a challenge
for devices that do not support DMA to it (no TDISP support).

For kernel-only DMA operations, swiotlb bounce buffering provides a
transparent solution by copying data through decrypted memory.
However, the only way to get this memory into userspace is via the DMA
API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
the use of the memory to a single DMA device, and is incompatible with
pin_user_pages().

These limitations are particularly problematic for the RDMA subsystem
which makes heavy use of pin_user_pages() and expects flexible memory
usage between many different DMA devices.

This patch series enables userspace to explicitly request decrypted
(shared) memory allocations from the dma-buf system heap.
Userspace can mmap this memory and pass the dma-buf fd to other
existing importers such as RDMA or DRM devices to access the
memory. The DMA API is improved to allow the dma heap exporter to DMA
map the shared memory to each importing device.

Jiri Pirko (5):
  dma-mapping: avoid random addr value print out on error path
  dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
  dma-buf: heaps: use designated initializer for exp_info
  dma-buf: heaps: allow heap to specify valid heap flags
  dma-buf: heaps: system: add an option to allocate explicitly decrypted
    memory

 drivers/dma-buf/dma-heap.c          |  5 +-
 drivers/dma-buf/heaps/cma_heap.c    |  7 ++-
 drivers/dma-buf/heaps/system_heap.c | 96 ++++++++++++++++++++++++++---
 include/linux/dma-heap.h            |  3 +
 include/linux/dma-mapping.h         |  7 +++
 include/trace/events/dma.h          |  3 +-
 include/uapi/linux/dma-heap.h       | 12 +++-
 kernel/dma/direct.h                 | 14 ++++-
 8 files changed, 128 insertions(+), 19 deletions(-)

-- 
2.51.1

