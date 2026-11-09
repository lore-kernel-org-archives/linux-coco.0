Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239890;
	b=XJZFXR18yUYFSVKM7kGUbsHuGXuOquymYzrwXk7hplXVP+/fsk4m3ETRKaRtUw2OWw+a
	 7e6Bt+4+eNxPvSBKfgr2Y2ZX2DDLEQRBsx7trQorJ6XBPVwpXR/HWBiT65YFOzvfxT5Cn
	 yuU2ziRwOvyDCQRC/YrsOooBDrSPEYDF+CvmWa9iz/3rl+IeoBG1p9tYoLOlxvAwEqhVA
	 jIYW0T6MHxfNqVADH/Y4W9fBFZvUVMX8j4NOkABizbdFLLnYDjLS7G8Oo/YY4PKvxMVg9
	 +auk21YSZuzhyIXARC3rd+eQgOKa1j82e87/U9SVNPk19KqJCPdzQ2RjjSFLl9/9Brw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239890;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BuAz2H6S6BQoz6NjweVUggSmY7ai2732ogYbCwWyPfE=;
	b=EHb2B/E7KU+4Nq5R+ylS7dCV9uCrW1JfTjntQpq+rLWKXBDgwqzcCMOqXJbor/O3s6u7
	 8x9qanqWL9CxMm2lMW+6YfbI48qBq/lHAa65SecAiyFoU9OwoQZXMilrGWMZ9DvS319Qv
	 40PXSQykr9QhHQO7OuLZJhs/9C63ESl27hvtubNx2bL/5tZsXor2kMW8u4yGURHDfwl7k
	 z3t+tfqte/aOMbgr7Xk20ND5wKu1VSkYIyqT90wpBmXj9ehiadEK0Mki7GjoKKLAfr2xV
	 9uM/5XTMC0LvDKYzUAK1P3RThPSV6+CuPnta5J1hMMoI+a8PGwyINQUPPhDOS6meGVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=rsXCNE0r;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B38606A331;
	Mon,  9 Nov 2026 15:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B38606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=rsXCNE0r
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id A922026667;
	Mon,  9 Nov 2026 16:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794239881;
	bh=BuAz2H6S6BQoz6NjweVUggSmY7ai2732ogYbCwWyPfE=; h=From:To:Subject;
	b=rsXCNE0rkdnKoDDFlEX/4Yu7l9U/tawRTDXC6I2kIqgu8i7sT06EySLR9Wwd+tlEr
	 14xfo1tUmy/vsrbHq0qdkQ+iWv6+4VhzENcYW0uUVdpxP7E1ZA5OD5NWA/9WhQSpeV
	 MyUvaTFPZTC75BDiO9YJjYgduSdyRbZ7zsB4xjPHQRhP8qRzM46LTZg0dyuJOdzu3K
	 NaLYUfKETuaSCqj4N46fPhWJyNbDfIEH6QiXOVUl+74I9/7wzxWAM14R916nYqlFop
	 1UWJph9fZkDeN/ezH9Q+BvGj/rHQ8HgH650kp2WPZ7f14byXq53m3vTSJtHV0P4VVN
	 ZnYZpWIeCw5Ow==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 3/8] ARM: dts: imx7d-colibri-emmc: Add tdx vendor prefix to display overlays
Date: Mon,  9 Nov 2026 16:57:43 +0100
Message-ID: <20261109155751.475875-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109155751.475875-1-francesco@dolcini.it>
References: <20261109155751.475875-1-francesco@dolcini.it>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Toradex Capacitive Touch Display 7" Parallel and Resistive Touch
Display 7" Parallel are Toradex accessories, and the overlay names are
their product names. A product name is unique only within its vendor:
"panel-cap-touch-7inch-parallel" on its own reads as a generic panel
description and could just as well name another vendor's display.

Prefix the accessory with its vendor, "tdx", as is already done for
third-party accessories on Toradex boards, e.g. "rpi" in
k3-am625-verdin-rpi-display-2-7in.dtso. The combined DTBs are renamed
accordingly.

Link: https://lore.kernel.org/all/20261026111149.GA46946@francesco-nb/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: new patch
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 30 +++++++++----------
 ...p-touch-7inch-parallel-touch-adapter.dtso} |  0
 ...c-tdx-panel-cap-touch-7inch-parallel.dtso} |  0
 ...c-tdx-panel-res-touch-7inch-parallel.dtso} |  0
 4 files changed, 15 insertions(+), 15 deletions(-)
 rename arch/arm/boot/dts/nxp/imx/{imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso => imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso} (100%)
 rename arch/arm/boot/dts/nxp/imx/{imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso => imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso} (100%)
 rename arch/arm/boot/dts/nxp/imx/{imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso => imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtso} (100%)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index f22abbd01434..c05cc9ff782d 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -424,21 +424,21 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ulz-14x14-evk.dtb \
 	imx6ulz-bsh-smm-m2.dtb
 
-imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
+imx7d-colibri-emmc-aster-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
-	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
+	imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo
 
-imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
+imx7d-colibri-emmc-iris-v2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-iris-v2.dtb \
-	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
+	imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo
 
-imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
+imx7d-colibri-emmc-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
 	imx7d-colibri-emmc-eval-v3.dtb \
-	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
+	imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
-imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
+imx7d-colibri-emmc-eval-v3-tdx-panel-res-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-eval-v3.dtb \
-	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo
+	imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtbo
 
 imx7d-colibri-emmc-aster-vga-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
@@ -460,20 +460,20 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-cl-som-imx7.dtb \
 	imx7d-colibri-aster.dtb \
 	imx7d-colibri-emmc-aster.dtb \
-	imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-aster-vga.dtb \
 	imx7d-colibri-emmc-iris.dtb \
 	imx7d-colibri-emmc-iris-vga.dtb \
 	imx7d-colibri-emmc-iris-v2.dtb \
-	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-iris-v2-vga.dtb \
 	imx7d-colibri-emmc-eval-v3.dtb \
-	imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
-	imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx7d-colibri-emmc-eval-v3-tdx-panel-res-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-eval-v3-vga.dtb \
-	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
-	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
-	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo \
+	imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo \
+	imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtbo \
 	imx7d-colibri-emmc-vga.dtbo \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-colibri-iris.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
similarity index 100%
rename from arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
rename to arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
similarity index 100%
rename from arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
rename to arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtso
similarity index 100%
rename from arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
rename to arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtso
-- 
2.47.3

