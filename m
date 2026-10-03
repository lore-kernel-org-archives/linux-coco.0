Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27FE39D6E7
	for <linux-coco@lists.linux.dev>; Sat,  3 Oct 2026 22:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066812; cv=none; b=iJyL7Yi4FXO2rKum9ctEm0pvYkiMPomCLV5KgiuT7+ycGJY3lHSY6ETd480AZSopO6+vJJuZqXY5qGwEsM0JSnR5FFEzEHRhHUGQnJoQ3B2ReMLQSeufT+i23iepmkGHiMQYeeThrb59XvoyYGLPR7UjLec6luX3Cbp5umDLCVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066812; c=relaxed/simple;
	bh=B+AzlxaEDOIbUR2XgxY3SS/3ebqvCC16gLh4COnivCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XffGa2COkYtYM7fzftUr3Tf+8ey6CVtz67eAp6vhTvI6oV02TJwTxdKIwozI9vmWaru0i/cidwjOk8Kg8sOKirR3S2ta8cJMeG2Gd9bF0a3VqjjaSoNn40i350GNgiiFjHK65rqMdGhh4gWpMS4S6/hHuoNvrHwu1/WPD+bLU20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/fCL1W+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/fCL1W+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso508608f8f.0
        for <linux-coco@lists.linux.dev>; Sat, 03 Oct 2026 15:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791066809; x=1791671609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KOWsHQRSHb+0OiLgXs2lkzN27RX1yq7wkT9nw+eMr9Q=;
        b=f/fCL1W+9U+5DCzHL2a8S/M7tvzzFw2INp05e5niPUgz288PijwoBBxy+gBAGaY5xI
         ZCPjQzRu7Wih40g0AsJK9Z2DgQbdQi5NEeEJhkadCF8A2cNPb2uujl+U5R3YNmBEKA/0
         x4TxY39gYHBx12xH+FM9lUjIgIiaekhH0ilK0hTNAqAhvOeFO+9uzCktzRVaS0I4uCFP
         T3qyrctrECNOI+HRrrUg3YnIv70e7SPeyPgMy6sE1INh5GrjNcOjza5OCyko21/IOgGC
         xotIXMC4CIB+ySNcfPSPaIQtRFuz+c7eTnNuc/zzLEYqknSLGHfWH2qM3SyE8uXKFrGj
         3xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791066809; x=1791671609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOWsHQRSHb+0OiLgXs2lkzN27RX1yq7wkT9nw+eMr9Q=;
        b=VC8BbeINTSw3VdawU1hPw8mrzbHrz44lR9I6vDulpkl+uM93AatosjgpR9iwmscdTT
         okvozx+KpaE92YtgrvTR2deTnPqg065DUkRN2OoPZMqF7dTwY4J5T2pq+1XyjP+MhwWB
         QZr8fVdZlO/PY9ifX+1AfJmIShb8ixciihIwrKS1xrQYEgp6XKA/zLB39hkKkaaiubRG
         8G54cbr0kwo1ETZZaXDDZnlUE2UV1AHjGfeYAjOtoFE90guCbI7veL3oIUai+JcZPZrx
         eMJnFB36M6+L8RJS96fYJFfLtIQdB//6EjlOlAOWLNU2nlfh9jwxTAQ6PGb7Ch4ldzsN
         oIrw==
X-Gm-Message-State: AFq9FYJCGVeroBWCfT6tKh9Ja3c5XRoTj/BEubI8S2qBeGxqSpevPgJM
	MOy3ZM3vhz7d+SniH55piVVGeb+1Fd81O4CHEW4ONKMyuXcgMzguJ1/A
X-Gm-Gg: AYBFou2Oooi9JYm2uM5D2W19NVwNTOuWI2LEueX4FVB9x5KfZYdsC/KTq7R9UV8OTXi
	dTaABgt51DCOPBHL0BsYVH2ys0NofsIrqN9C2ERHxhAF4zj5rS3cZXAe5J/IuFW+ynSVVEdsVoO
	kWlFHz9liJKllhVPUImOVCIH1ET+lPTfr9pYTO0U/dBAxDBipO63/ybYsiSb1rXWvZymXRGrlgj
	x91PIoaj+aq6BNo638FidfE/2zGtOCwDg74AgT3syVuQpobxpX/7O2gTSahod64mUW6NIyvho9U
	L2h+8dyQoTZ4OV3NWJXeaLPIF3RVqz7v5DNB2yS2Iy0FPkb24zlVRnza6vh9Obps8J/Ig9JjmSO
	sKOTmUEeboss9edbPOp94hL3c2YxoyTiKsdlfqBO85javWNDxBzDf0FyEm1h2thOf8Uvg1OQVGb
	XlKaAyPFIVQs2LIgto2S+/TyXigcewxPDOOObi/KxjLsxt2yJI8dQmvcZYK96G/I5fmwN1Jy3s5
	hNOgh4Tlpmr0aZdoLpwRlxjbQZ/bGnGv+X00lXrX3hZbXxcn6WuJ1zcS//6ExuRNJRIfe9EfA==
X-Received: by 2002:a5d:5f91:0:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48c47fe4ee6mr5052425f8f.31.1791066808651;
        Sat, 03 Oct 2026 15:33:28 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd7a:9200:44fb:d9e0:fc9a:51c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c5270569fsm1886371f8f.5.2026.10.03.15.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:33:28 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Kiryl Shutsemau <kas@kernel.org>,
	Chao Gao <chao.gao@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-coco@lists.linux.dev,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH] coco/tdx-host: add Kconfig description
Date: Sun,  4 Oct 2026 00:32:37 +0200
Message-ID: <20261003223237.513456-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.55.0
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

"make menuconfig" doesn't let switch from =m to =y either.

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
 drivers/virt/coco/tdx-host/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/tdx-host/Kconfig b/drivers/virt/coco/tdx-host/Kconfig
index 57d0c01a4357..5a13ec6f51e8 100644
--- a/drivers/virt/coco/tdx-host/Kconfig
+++ b/drivers/virt/coco/tdx-host/Kconfig
@@ -1,6 +1,10 @@
 config TDX_HOST_SERVICES
-	tristate
+	tristate "TDX host user interface driver"
 	depends on INTEL_TDX_HOST
 	select FW_LOADER
 	select FW_UPLOAD
 	default m
+	help
+	  See INTEL_TDX_HOST for details.
+
+	  If unsure, say N.
-- 
2.55.0

