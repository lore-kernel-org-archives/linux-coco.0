Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E6337FF47
	for <linux-coco@lists.linux.dev>; Mon,  9 Feb 2026 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651493; cv=none; b=oriWOH7KYRAFxcLVhvuSkdRGTqidMOMgYBJkl9GHZ7srQAFR6UxzpIjGXyXKZK7/3qesSx4PR8Pb1ZBSMMz7FSP11X+GLgKzyon6MDt2gPEn5XJHBRFOTXYL1Y5rr21JVtiDwSrXicEkCcvbTMATmxbjBm704eT+W+wjIKCMDco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651493; c=relaxed/simple;
	bh=iaj2yH89Vn8424NatbEPy5zTcXkE8fBUuo+9v66/cM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L07C0vhZw7+yZ36kj15uxjXPQje8meUpXRiOnJVCl/jtD5BazzHQNz2Se3J4IYw86PoOFmHHPmfxGk1x790iR4Y19aXBIr1ViJWqVd7xLf3jtvzGgYBdP5h2Nkq/Q2vXNCzdfUhX4JPSo//a6o415C1qlG7trlClwB05vvGIcB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=qE61MjCh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="qE61MjCh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so5393295e9.2
        for <linux-coco@lists.linux.dev>; Mon, 09 Feb 2026 07:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651491; x=1771256291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jk99TzIHNfOaBko9b1E43IwPHNs+vzenJUms8qd4tnM=;
        b=qE61MjChsFynqI5Ok+1DMBxnCL8AsHH+C9E8XBPhySW8y+K0A3cvyzmQymDxlTRD1z
         J7ORQWpbT02aotPpUBa0oxbcdIpaNqr8xb9PoR70I2RuVKEx7biMWeQdnBeKeQMmaqjp
         O9rQ3IIrPQTvrMQJW4JA07nbdAD2KkyVAIsoGFEOx1wYyRUHDmbqlpDXkeyCLEgYQO5Z
         poBuB1jn7hV4IcIEXCAev6hRVwI299+qNDm1XKKAXfM54CMo97OFnJZZrNZS9rw4wJ6x
         xuV+pYESAp4z+17p8IVn8qfeNvvnkZUjrSEl8qGGQFyXpauxMjlsIYVK4WNANSVU3YyQ
         kufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651491; x=1771256291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jk99TzIHNfOaBko9b1E43IwPHNs+vzenJUms8qd4tnM=;
        b=LogKSBbD2BlkBuhyTM/WSqiOKcQGLVSNrENbxF1NvBbGJE1hayMjBMrFvPY0O44u+e
         i9xkHs961+caBvMKMKyp5kW1nOZVGgiI9gFAEEeeGZrsZ8q3gGZf41sQTA5isl1b326j
         A4g/eIJ2vY6Vt+15uR1k5sO+r6Nkey5LdizxzkmlPcDMpWdiJFFYz1FSBEfa5k2mRxU9
         fPJppCN+6S+1SWutAej3C6NLdByUuF/ZHl812SGs79mawfAZr6GRyR8H2cduNrVHQkDC
         U8sVnwL47BaNXdXy7mzgkVM6UF0iP/1VoSEQwI7YU8Sd6ial3jjqDZWhsx6GOVUACGgA
         z+JA==
X-Forwarded-Encrypted: i=1; AJvYcCW7g3no0ADk6oRfM1I5zAcvPOYaH6utlCXrWiya7k3WG400rveXmIPBPYJmexx7vaxXKfuezrhHuTON@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3EZO4AXMrYpAJh6O2Udv8Lp981dSNlmjcXKYcIpy61LgaDyWT
	kK4kZxQwcc04auFtG5zInWYB25EhTIGeScBGdSei2TL7D43zCPV2lcSgESUm2PPkgwc=
X-Gm-Gg: AZuq6aIpN32DOhRxdI7TaUsx67TnN0cr7zRbcYivwgBxWfyXaHKcKnDIJqJGfAM3lXi
	MsDvIIbeYOIomxV/j9WvFqSfsUmNgcCkSMf2g0ZfMHnVJGmf9wTSwfTbIDpVHmCl29Ts9SekkvV
	ajyp7TKaybksvpPbRCnIjpoqeZylRkZKZX4YYzqpOf4QxuqBBolW4OI43BetXsUvUkbaX1om2VD
	hHkOwJxQl78kMOASVT5vAPiffsQG09w1P1+h0M/rR1Y6Yc/U+xbPmPwDz5YhWerLgwOSoocVDuW
	RC8PyzDyGsVsvTKrqFwfoNw1KRXeCPkSfQgRsti/nfuwqofq7UU1xpGo2D5hWhxB/ouOj+QLLLq
	LXuc5LUyML6huL/kFRsDLyNYbULw9zkhJ27u3PlT305nYyclRuJBQSPJspXcmmJE5oIBEAJy3jl
	sdJw==
X-Received: by 2002:a05:600c:6592:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-483209c6dd4mr181313355e9.34.1770651491431;
        Mon, 09 Feb 2026 07:38:11 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm11560760f8f.20.2026.02.09.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:38:11 -0800 (PST)
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
Subject: [PATCH 1/5] dma-mapping: avoid random addr value print out on error path
Date: Mon,  9 Feb 2026 16:38:05 +0100
Message-ID: <20260209153809.250835-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260209153809.250835-1-jiri@resnulli.us>
References: <20260209153809.250835-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

dma_addr is unitialized in dma_direct_map_phys() when swiotlb is forced
and DMA_ATTR_MMIO is set which leads to random value print out in
warning. Fix that by just returning DMA_MAPPING_ERROR.

Fixes: e53d29f957b3 ("dma-mapping: convert dma_direct_*map_page to be phys_addr_t based")
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 kernel/dma/direct.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index da2fadf45bcd..62f0d9d0ba02 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -88,7 +88,7 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 
 	if (is_swiotlb_force_bounce(dev)) {
 		if (attrs & DMA_ATTR_MMIO)
-			goto err_overflow;
+			return DMA_MAPPING_ERROR;
 
 		return swiotlb_map(dev, phys, size, dir, attrs);
 	}
-- 
2.51.1

