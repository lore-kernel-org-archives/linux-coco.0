Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC08E3A3E9A
	for <linux-coco@lists.linux.dev>; Tue,  7 Apr 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553982; cv=none; b=J8Hvf6mAq1FLERbir9CVxVqnC3oEcTZB6HZB6zaQswVf0+OGmvxFarxuqZJvUPhf3TieQlcO1Ktzz+JhLcusPKtDX2CQhGTCM7qYjcQqg0Au1qIvTonFYoEeOi9LVKsichF8LFk4XztksVej6AimuAGJSxLiSvqAcrGTx0S3XWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553982; c=relaxed/simple;
	bh=310agd/8XO4BgwQg8W/cFgXuQDf81Aa7ia7xyYtrlGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDB+MODCmLKTLSSiFL14PVCG3BI7tdbg0r4EYWFOue8/JA4eWjCVp1nJyCXwwgx6g+5vR6lJ43CRnyfTV0sXnF2tvlyonq1Z6l/afAQ2OneSoPgDfBp/aL52uRg8ofAdIV9Ycmm3Ett2w90ZHvZ67WG0pFbvWROenwBpY+KNnZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=KRHcJZN+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="KRHcJZN+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso4381871f8f.0
        for <linux-coco@lists.linux.dev>; Tue, 07 Apr 2026 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775553979; x=1776158779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4JppuW+8jHhiWrz5kQ42R8XjkKGXIqfSYDySDPjjqyw=;
        b=KRHcJZN+/wyBzy8fvhWynoxmE97sqWGaE4bHWWRyzTw4lOgvUirsYXSUkAq+qN1hkn
         R5OjLfaOhpsLvX/Gg9QXHB8R6WLPD381gaXiSgBbk0szbo3YK6QPhW8cSyIb3LovmW4T
         O8Qfen/iDm5uAuE3wT4gLEvaIXrmcQpK4COb64aLcE77/n0JtV+UViGwL61CwVHW5NWJ
         uEN5wNnTG/0YcT4y5K5acS5DpSCLvxf2BsALL/IcmCUkqOAbIW5U9a17vLc5S0n7fKp8
         f+Jfb5YXuSkvoLZZh4co4P5SB7ORkzFIGyXrAkes2/9gqmGjLI2vggcrz6iwZt+adzsu
         e7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553979; x=1776158779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JppuW+8jHhiWrz5kQ42R8XjkKGXIqfSYDySDPjjqyw=;
        b=YeE2udgDTOpJ9i2zmLpVZiR1z9LODcEN1LDsvkkW49Pmv8Z/oSUWerMG2CaJHA2kCn
         n7xa3ZGA4VH5IuAwXSw78TQPx2L97XdUxkPqT6mcQBKyp5FGE53PFSZFgbD4CUCeMXXi
         FsiJMQMbQDqzc0vTNIe5ybeawDae+MrqJZAtxd5QE/d214C9WGinOoSPCNuUmk4tuPKf
         Ohwrtt/1S/XRTc+xSxiqR3Us4bCspx+CFAs81vvX2xPj1lR6gqhG9/qbTqYO4yXv1XKO
         z7pX6f136HwLqNOmq9P+ZtL8Kqgko+uOn+42JZgvE+JLKfAiigHF0rIDFJLemPDqLK5Z
         B0oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf6EzQgx+i0sijtU+/hw7JGs+ca/6PgHOoWXjkTz/ZEC4swMQGt8R3i/lKpAqYMrzJl5cwLl5wmMY8@lists.linux.dev
X-Gm-Message-State: AOJu0YwihAU3IQVgp/K7c1pq71Pdi8IPBFK8yewhYqjGGauFaRcC4inF
	YQ2tnkZK4fczrISCs5/SeNCfJhqmuB0k9xeUhmRVXOPPNyu0hq5dOA2HW2UCj/4kb/w=
X-Gm-Gg: AeBDieupUHU5ebCJ06uK5J0ZFG0s+LktYaFbswAV32PmXOcAzix0HXN1JU1xoUmGTEC
	gyv3Eh1QmwtSu+4y7HuOtchegisBkhHnukwFoLGraqcH81dRk6UMAIBG7g2qPpypkER7yI9hSYh
	UvL86KdlBI8fBV400J0EdYfHKjcBrL960N7ltTfV0qxJfEowEAboh6VXREZhWyLEqsn5N2d7I/d
	hQ8Z9no+6iriF44eKCg1YTMLuR099Qz9t+66DL0nVjUlrnkMPziBl2p9lohmwfr8Q+MUdPxw+Vt
	mYD7fGki7hzfgnDHYkawNizmrMXT6XvxrMQj/bU/XMXrccgE4LNRHH1DsNzQTvDQyfPSgvt53+E
	Qnn3hEwzH+OHCpSs2D4+HPX0xqULuDt8VOnw3xpUgZ/+hYb+r+tFHHIC/GJecn0ecxH4JGN5xfF
	pNoWJ2BxCdPzjqHw==
X-Received: by 2002:a05:600c:6098:b0:488:9fb7:376d with SMTP id 5b1f17b1804b1-4889fb73b1amr196429615e9.28.1775553978818;
        Tue, 07 Apr 2026 02:26:18 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm268832955e9.10.2026.04.07.02.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:26:18 -0700 (PDT)
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
Subject: [PATCH v2] dma-buf: heaps: system: document system_cc_shared heap
Date: Tue,  7 Apr 2026 11:26:17 +0200
Message-ID: <20260407092617.635223-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Document the system_cc_shared dma-buf heap that was introduced
recently. Describe its purpose, availability conditions and
relation to confidential computing VMs.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
Reviewed-by: T.J.Mercier <tjmercier@google.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 05445c83b79a..f56b743cdb36 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -16,6 +16,13 @@ following heaps:
 
  - The ``system`` heap allocates virtually contiguous, cacheable, buffers.
 
+ - The ``system_cc_shared`` heap allocates virtually contiguous, cacheable,
+   buffers using shared (decrypted) memory. It is only present on
+   confidential computing (CoCo) VMs where memory encryption is active
+   (e.g., AMD SEV, Intel TDX). The allocated pages have the encryption
+   bit cleared, making them accessible for device DMA without TDISP
+   support. On non-CoCo VM configurations, this heap is not registered.
+
  - The ``default_cma_region`` heap allocates physically contiguous,
    cacheable, buffers. Only present if a CMA region is present. Such a
    region is usually created either through the kernel commandline
-- 
2.51.1

