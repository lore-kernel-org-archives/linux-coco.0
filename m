Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8D1269D18
	for <linux-coco@lists.linux.dev>; Mon, 23 Feb 2026 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840303; cv=none; b=DBlrlK2YNesG2VmhTwW43WE9iLVkwDQPiF8hSHAnR47siE2DvjaIbctz16Qv3rgipadwCzBPio2ZfO/0/xmDXdBSZpSgqG531PFfEeO8wNzVbNgnWuaWGB9OC1q+WZsXXDR0D7AVsRZvvA8lIbuvWmb41iIEscYHo1/0HQCaCks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840303; c=relaxed/simple;
	bh=KfFRfouRKPdjO8QdYp354wLUw4VwaWEdMEKo3LWxlW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKyzQ+RgCpvAa2rOnbFz4y8MVt8468qkv5bWw4MtqN/F9pqjAVaq+xpc6za4KRcWczX+6FAK5/pBxbsuvNzPWWtpPqAfoPcJ3rKHPq3rfVVoq2TtVZnoCYIoNpygK4oKIY+LnYfa0ZA7kBlSSMW4eTaaaqFgaFN1EgsQGFzcClo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=KhMQ+SVd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="KhMQ+SVd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483703e4b08so32467705e9.1
        for <linux-coco@lists.linux.dev>; Mon, 23 Feb 2026 01:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1771840298; x=1772445098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9P/hiUK/l/iV+NBMdNBP19LQ/+lioTm29Bruktj9zQ=;
        b=KhMQ+SVdeY1LQC8J0BF84xDkvkdNdFCLKSN1fRl8on3dQdL5OdA9+wmi+ffsbXDi6U
         vrtWJGqoUc66n1LVR0FsnEEE0uCN32LjWekil9RBBNpdF4SrumPcO3uHc+vaLmdgl1HG
         ceEwfG0goL8GS6Rsq9R4rcF0npa3PQ2xZUpNS9aWUZzET7yaS5J3luur4acuAMmG9KPH
         CN46C7sgemMFC9bX0Gdd0TPjVeWyue//DaiZWhxn1ZoewmPoPEyzSmbuQhjYPVAMqnKG
         DXH7oEKEh04MTuA9DGyoEj4QdQOevTCpzJoVR9GF8mNW/m6sAbH19kFQxb5u4AZkNDB/
         YXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840298; x=1772445098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9P/hiUK/l/iV+NBMdNBP19LQ/+lioTm29Bruktj9zQ=;
        b=iMFxZMcYTkPLgbmPT3Iou7iIS0W2hpF5vb1xllkUOI1HJH9Q7jmDUU3OsYPV1kddlM
         y3oIt3ZmOGkQZCF9izG90qBJkWoe06XzSYbgaalGpwXlMM3qQPtpSBLPn388yrKkYcV7
         fF7cl0WcMegh9ZiXN5l1MIRZlsc5FTBqOTH49yWI8cGBGzbBtsR5/07T9n6GFhQiM+Ql
         yJS7MEsL3zH8UEb1T85zZx+nJAwo/5rDKx1Pv2RB7N4Jx1QCbBqNFHo9xMNowt4Ed9Fi
         8PQliXaZjSw0ck1zj4Ki9nBDcsGiAE+DshyN2+QPcGpxRM3+xGHB/Ce1/urFT5qdedOP
         ygIg==
X-Forwarded-Encrypted: i=1; AJvYcCVWtbDtPQE/2suvcLZIungTa/g0OhLHWHMdM6d3jMI9lKiu+kdRyw2dl1kNs1ChcYFQe4sBjDZsxfnK@lists.linux.dev
X-Gm-Message-State: AOJu0YzXNzefSBGwnf7K4kdD2RYn9ceWTXjvIGzz1pKFLRaSlHqeA0Yn
	5RoJ9AY3Xm83FU9VrYxJFh2FawtzlxNRub41tON6nelMuB0wbaDHn4syaucpqHlCFMM=
X-Gm-Gg: AZuq6aJ4A4SNeD6f6drjZts19X0Vt59UEkCNCqnP8vz+gUzgsCcKYRjSEus0jO+LSbv
	9J8n3Q0dMOHFPglGmV+foLGQsc2TMpnUbo3sZOZUFxV/zVRykEhxe7/uH1DhhVu1CgtqlK9da7n
	w2KH6fJa/BJV9GJvXXGibvOWvMPQzw0aXI0tAnYPUUji9rqUCWmJQ5gLB8YWqRwlG3012l2ZCP2
	eUOH/1nTdj82pOFaJ7mQ7X3S8VJUmU6oLgRTkrPaa3wUMGmZmXzNyu4ZI2zAbjj0IOR+C0Bz4SH
	Ni0kYjHZqgtdUJD8AVCFm0a2iLtz4WTUrYl1ylqsgWi19nSHvP2WtVwQD7T4zrWXo6/3iiILNfP
	OCTp0OcB/0u4MDomJqY7f33AxynV+ETrfYLP+VHC7u0babN7VrXWcg1cqYC9vFRMhYeWq+XWJr2
	GCXLRqoscKJYJ+Tw==
X-Received: by 2002:a05:600c:8b5b:b0:483:a352:b4e4 with SMTP id 5b1f17b1804b1-483a949e600mr141861245e9.6.1771840297668;
        Mon, 23 Feb 2026 01:51:37 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9caadedsm152601835e9.10.2026.02.23.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:51:37 -0800 (PST)
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
Subject: [PATCH v2 0/2] dma-buf: heaps: system: add an option to allocate explicitly decrypted memory
Date: Mon, 23 Feb 2026 10:51:34 +0100
Message-ID: <20260223095136.225277-1-jiri@resnulli.us>
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

---
v1->v2:
 patch1:
  - rebased on top of recent dma-mapping-fixes
 patch2:
  - fixed build errors on s390 by including mem_encrypt.h
  - converted system heap flag implementation to a separate heap

Based on dma-mapping-fixes HEAD d5b5e8149af0f5efed58653cbebf1cb3258ce49a

Jiri Pirko (2):
  dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
  dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
    decrypted memory

 drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
 include/linux/dma-heap.h            |   1 +
 include/linux/dma-mapping.h         |   6 ++
 include/trace/events/dma.h          |   3 +-
 include/uapi/linux/dma-heap.h       |   3 +-
 kernel/dma/direct.h                 |  14 +++-
 6 files changed, 119 insertions(+), 11 deletions(-)

-- 
2.51.1

