Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142C839C63E
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714210; cv=none; b=jQyl/BIt0SnKeZnqaBBetlfkozQb8pqocQyw7lficmm9rCQHQ7Nk/5UfuJhDit7AND/6GoydgJBDll5wOJ/ZUP0T6JU7pMwD60VFcUhszmeAtsysAECRnOFZCaWTM9YN4SwhWq2qQHRYW+1u76kC91dSl7TanPcQ8uMx1rI9kE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714210; c=relaxed/simple;
	bh=BH57nnIaE9i3N95p4Q0UsDprhOQ63o6bys4TWubRZV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fd5wIkwNm0Eu8Vl0UMCZs6u3XHMTuPZ4xk531h5y1orreuK3POOVIRnxQobqKTRfVo5lt1Hr5n9fmtGIMulAw5gUmABdDG0pdQGsGHfL0N1KSRxxM+zxemS25D8cjW/pdU4qkQINEl2l0aove8jMZfVIEOHzxq67TAFPF0ArPOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=dqxNRCRg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="dqxNRCRg"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439baf33150so3385254f8f.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 04:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772714203; x=1773319003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3f86hD8zd8MmrDtQjkoOiWVtBZ+fmRfNZDECEzXgGc=;
        b=dqxNRCRg1uKrqG11CnGStL+bH50LVC3Pvu4uzOxMFc/ElHHyp6ymPWtH/XdRV4gxEr
         nJSp85gS5Htz/M9v8PDeGdDvcGqV65tVRq+kLKCjmD+U21407nMvvcsVJQ0hQuHJa1j5
         yy7NehYrecnBdhBbW0kNliHtjmrg7oqKPZMeIw1dFrjN7IPTvVXnYNEHzck7gT5LndO6
         f3QH2i7EIJzQHwXEyh0LYzAbm/Z3/+pG8mjXAHQvbARlrsLiNx56UQebauOOlSF/dqxL
         9LR5ku4MIyPlgN4cppYaJJ4lZ4vU0z8jAoaiHQg+ltMmSzCNWV4tSu83JJppIIANuBwD
         T1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714203; x=1773319003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3f86hD8zd8MmrDtQjkoOiWVtBZ+fmRfNZDECEzXgGc=;
        b=RdBG/Jeg3+5jRdkibNmH1JnMOw21kPHsSNnW1ggBg66pL0xODcqX+240TrLRllEDtH
         +TIezLV1OwPLNSZNlAkj0njgosdgmMsawWNb14/6GFA3ijxT2w2hacD0KQCYN8m/dUly
         V/hIeYsUeFqTanQYtflXsg0CeZxzxerRHeO/Snc5PSKrUp1p36CxA7zM4S/LCw7/GTKw
         nsTVr28ur4K8NyAHe2D1Q437SOamnliwYf0UlmAfsUoQkUzUu2Op9Js+ngLZd+G1G2+Z
         hrwDaSuIZRos0SwYPEojBPUCljPPNlLAYaCTx2dU+YK56DDFa57ISCxFiTc1fV3SxnyR
         KU+w==
X-Forwarded-Encrypted: i=1; AJvYcCXoNOJ08JDvXc9xgPoc03743sspGO54UBeF5aGpkWFtA20OP0uYTGiZl+6cTWaxojTJzXQaZiQf7k3+@lists.linux.dev
X-Gm-Message-State: AOJu0YwlCN4EDs27ZvHWlWdVuppDQgUOEqszLcJicxxFiIyNlBzzMaLl
	s2COPH4IZjs+AUaky6WqRyFuRhcD8eOp3HV90UVSmTy5D4SCcO52oe5Tw187/Z6JNWQ=
X-Gm-Gg: ATEYQzzkVCM7myk+xF9hkl8UHXJMgew9GCofJBmmGS7zzTp3iaOEL17rhwCJ9MOIY8y
	Gp0RxtDbONRT1TGG1by6gSDbo80/tBrTgzXq+fHxaXlpa9pUOa5wTqyRa33tbZM5/4+yVT3UKYY
	dkQQhI+MjtuFB4XsszfflEEynHFX2rfmWI5S8hb9MepoaBa5TpTVB5RDV5v4CJEiKGAwCaGH/Ts
	SVYQq127Gyi2ZUiMhYLhp1fc3I90UMbZt1cOhZxc7++eijHJ4xKfo+SAUeLfxlXLbxUqzA30N3z
	q6HlWYFgCzkrL48s1xv8bT4g6cvZAa3s4ngEtxx9EAO5r5rGCF71hAMXnh39D4R9RFyefCPgNMh
	qLQMVdqINPX7eve/JHRPXVm1VGWX4ykNSsXUdnO4ELegIAi5/o/flqtcORGjgawTKEEfoJv6AET
	WIzMQEK9zXy5CgJA==
X-Received: by 2002:a05:6000:1845:b0:439:afc5:dd0d with SMTP id ffacd0b85a97d-439cfd76cf6mr3945058f8f.25.1772714202770;
        Thu, 05 Mar 2026 04:36:42 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439af926c53sm43701820f8f.8.2026.03.05.04.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:36:42 -0800 (PST)
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
Subject: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to allocate explicitly decrypted memory
Date: Thu,  5 Mar 2026 13:36:39 +0100
Message-ID: <20260305123641.164164-1-jiri@resnulli.us>
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

Jiri Pirko (2):
  dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
  dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
    decrypted memory

 drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
 include/linux/dma-mapping.h         |   6 ++
 include/trace/events/dma.h          |   3 +-
 kernel/dma/direct.h                 |  14 +++-
 4 files changed, 117 insertions(+), 9 deletions(-)

-- 
2.51.1

