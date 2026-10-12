Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2BB488D92
	for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827697; cv=none; b=SRJVmPIkGQMcxWY/i0pgCBi48yXZHBXKkfYFcFDYkV9+QwyNHjknaU4lcJREWdivmiQdJMjy6aFwlvZvzCPIdDyEzuQtCEvEAqYJFa5/9Oaap+VwnGivyURdahgvye57521He1kjgTu2PSsz0kzisk07b9MD9LCeTSCVHBPjQ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827697; c=relaxed/simple;
	bh=FWRRxx6zY6F2irCAkFFw/Nvcl0T4Mr3IRI0IXDHJ8xU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h2FyR6hSwnLYUUgm/lsgFthv+X/6eKhi5kzkt68v60UNl+MRdE0WzphtRHWBMkf2eXnGmGNNuHNXXQ+yKgM5ZdKH+2QCr4Ulud7gx6RtSTmJx5sDr1cc3eQIRE/m7ShnUbeefSzM2t8YptT094KjoNlw/QasTe0zBwXs62qyjug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrWDo0XS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrWDo0XS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso28357355e9.0
        for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827694; x=1792432494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ypEpjY8mvLe8TMwZ/eo1EKEIbLHoE0Uzn9acxsMI+c=;
        b=MrWDo0XSzrBtZ3TJDCbv+50Q9oxG0Jd3wDvlwJ1LxKaIc9axgfxS0dJZrSw8K6hUST
         X+ft+U7m61a8QSIDllE2DJYU06kCmqqcHUg8SSRDsXebJ5527VhEJGXOOuUWxJ8Lp9Gj
         w5w/Qv2AD8ENvrMh1e5fpBYi+Jx3sFH2i02lqYPRhn4NcNDTi8fK0kuDh6dI/HU9HRHA
         9AENw+EdRkRfqE+/4PbknILQmOr4MDO9wgrbrOIAfOkRcGQ5sVTUXjAWRQbNi5L4hiDK
         z3vad5UautDGyZspo5wNgEOa0pSBFk6u6pDNQQUI5S1pRqiBJDuVBIx5RTgdoKN5GQJB
         0Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827694; x=1792432494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ypEpjY8mvLe8TMwZ/eo1EKEIbLHoE0Uzn9acxsMI+c=;
        b=P6cMRcghBit04W9AyPggoa3ekIQUGpOg77XA3aO9+kByIKjvQewM5iEateKpDvxoJD
         MbgsjMiWgmKoX6vKjeG69TV4jQrHWnNbXwS/RBFcWsTrzN/xXnksX0Yll5Q/seXYOPnS
         /rx/e3LBYs4Ytkg+tscqO+bp1hbwDDyNexvoKBhrZCsp3i7btD+6DztfIuNR0tm8Kll/
         E0Xo1MuptuiwCFTNbruyAuRlHDZGQLPFKue8rbm9lGNaOd1EUIFBMHYOV5/ooYKI6lok
         e5O+b4GBqEqrdaSZ83SC5cQ2gSL8YykeQD4am0FmfZwEtFwAfUnDTwY8KSYOS6ifUmcq
         nc0w==
X-Gm-Message-State: AFq9FYKKNATONHNW8aC3/oDbvav+19oOAwIQorBwulz9o/LD7zp8aMvf
	9jqpS2+YxaswKep8konQL/mtZIxyrPPLezNP5KsAXBZnkU7QQQ1b2/+0
X-Gm-Gg: AYBFou0l5HKB4qM9gV2anhJbYnukWqNCsr82Z4F49D61K34r1OY6IrNcW5nYXzEovpM
	pz8Aj7VDhQiwAepN/5n0HDpeqYxuCophxuaitke5u6EXXMZPGf8+vdIE5MJvOWLeU/JXJ7icCJC
	stEEy++nNjt4McC4GvJlkD2u25kW/uDTfegc/OAennDDjXOhfca02ewWymszuSX3e3pA4wKIxol
	U2HfVdri74Lq7iE81HPXYJ+e2q0I4syFBlBAcA0aiaO2e/BE1+qb/xibzh9vFSuCnsjAU9ICM36
	F2I8qf/qsfsjSTRxRLur6cuC6u2JXF2tvXZqdIK8fZvRdpSH31ODtNme7ltUax0MQkJ0hgMCKcC
	avy9gKFeRHGAL0SLMo6TNUC53h+pjrE/Xty++lyXGdMUKDKHpXvSbhRCWkWowahrm9bn6q9Z+wB
	qpaWgANrjvM0lu9UBdJkVSK35UWbQIhMhhXq4K9gBrmav8eSI3ywYbq/7EhZOcjUy46tNm+ZE3r
	jN4YktZ6nAn1n1o3h27nyWYFro1NwhzZJNdBhNGHcJ/7lmbtCLCkM6WYmcp4zDpCF63PXSu
X-Received: by 2002:a05:600d:644f:20b0:4a1:88da:800f with SMTP id 5b1f17b1804b1-4a18dcc1377mr159038565e9.9.1791827694338;
        Mon, 12 Oct 2026 10:54:54 -0700 (PDT)
Received: from voyt-laptop-dell ([2a00:fbc:ef3c:5801:aaab:bea6:6711:8153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc7299sm518416f8f.53.2026.10.12.10.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:54:53 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Kiryl Shutsemau <kas@kernel.org>,
	Chao Gao <chao.gao@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-coco@lists.linux.dev,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v2] coco/tdx-host: add Kconfig description
Date: Mon, 12 Oct 2026 19:53:48 +0200
Message-ID: <20261012175348.1256363-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the issue when the driver always gets compiled as a module.
How to reproduce the issue:
	make mrproper
	make defconfig
	./scripts/config \
	  -e CMA \
	  -e ALLOC \
	  -e KVM \
	  -e KVM_INTEL \
	  -e KVM_INTEL_TDX \
	  -e INTEL_TDX_HOST \
	  -e TDX_HOST_SERVICES \
	  --refresh
	make olddefconfig
	make mod2yesconfig
	grep '=m$' .config

	returns only this driver as module:
	  CONFIG_TDX_HOST_SERVICES=m

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
v2:
 * changed per Kiryl's suggestion:
   https://lore.kernel.org/lkml/aszHlWi_aLIh8r9F@thinkstation/
v1:
 *https://lore.kernel.org/lkml/20261003223237.513456-1-voytikd@gmail.com/
---
---
 drivers/virt/coco/tdx-host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/tdx-host/Kconfig b/drivers/virt/coco/tdx-host/Kconfig
index 57d0c01a4357..fe018e00822b 100644
--- a/drivers/virt/coco/tdx-host/Kconfig
+++ b/drivers/virt/coco/tdx-host/Kconfig
@@ -3,4 +3,4 @@ config TDX_HOST_SERVICES
 	depends on INTEL_TDX_HOST
 	select FW_LOADER
 	select FW_UPLOAD
-	default m
+	default KVM_INTEL
-- 
2.56.0

