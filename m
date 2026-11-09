Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239891;
	b=TzqGO8A8bLi4vVH0X0sVx/McV8i0hihHVGN4rDVrpSZfOKenisx7b+Z4A+1zGxHZv6vN
	 GWg9EzwOLKYFw4J4y+zxinHdJ1phmLNbdyYbhJl3gRUzj6JeLwTjAp3kGjvF0E34+2H0f
	 3trkwqwWc3MJV8p9kzu5MUyop1zW8vDA4x0/uOF+uygmN4+WNQTYJ0Y+8WZ18RDHQyx5G
	 TBJwmWVuQ95YYa3tVnCD6Ii1ad+aitmP1xLNJ1ZBR297NFKCHQpKvaKytijJZwP0Y6Oi6
	 a6ym2NGzbe36lHDrDdNVtYXANnkfMl9uL4YwMBHEv3DjXxU8qgHwimnPc4PVopr8ldg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239891;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D500kmfJ3Qu7r4nWafyRLbfBk9Mhl+ZKg9JhUW5WufE=;
	b=XldM0+TbS7qOkniDPTRq4cAbGSWreie5aT1AUORdZLU6jsn2QTv1aqSzXbYmkCkqCd4s
	 ctiD6RKXbs2kxpfF6ioeouiLgBz/WLgU7E5hWbFMPNXHr8be4q+M4x/Om2rUjKAEOvE41
	 y2FUHpf7PBOS5Y5LyKGJwXdb7Pyb6jNa711xeIvAglRokgJfb/YGRRNOVeTmo263HaxK4
	 zbSh6E48pzEbTT/0C08j0pZlkqmFlA2xiPZQwTn1CdDnACinV3s3bJ0cwHnq0IC6dGKJZ
	 90AAiBdvXv+meppCYluENMgtj8Zp3TMlhfMTZRDkCKN74eDy3aR9zfcxFaTPtFH1Z+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=EuBpogJC;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC0606A321;
	Mon,  9 Nov 2026 15:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2EC0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=EuBpogJC
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 861742666C;
	Mon,  9 Nov 2026 16:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794239882;
	bh=D500kmfJ3Qu7r4nWafyRLbfBk9Mhl+ZKg9JhUW5WufE=; h=From:To:Subject;
	b=EuBpogJC9ohUxTmXRjz/d+pgykISbVewiEtm1BEIwUdZlbcqJHhYFiOMswEF0KU4+
	 6EJYcWFvl4zk2iUmdLan+w+ABfuUgHn431PExA9sDDgJPLYD42pfx1Er3YIUoKNhd0
	 +mn0U/jfB6joTMUF7s+9bGY1uCWoZ93oMRob82NNLraTOCAKCkYKWEZTN5XG6qTERt
	 exjZwmDFvVxV7/8VDOe+F7aRbgv2u7sqzj2QV3fzsQ/migOcgHztq0aBIM8F4vphVl
	 TmtgIxhcemdiT7BrgizRtv6rg2ocjDuaEUc8pvn4lOUfPF6pubnF4Um0RSi7xMS/po
	 ZC8KKPibeLGAA==
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
Subject: [PATCH v2 4/8] ARM: dts: imx6ull-colibri: Align backlight brightness levels with Colibri iMX7
Date: Mon,  9 Nov 2026 16:57:44 +0100
Message-ID: <20261109155751.475875-5-francesco@dolcini.it>
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

The LED driver of the Toradex 7" parallel displays turns the backlight
off below roughly 15% PWM duty cycle, with the current brightness levels
only the three highest ones produce a visible image.

Use the same brightness levels as on the Colibri iMX7, which is used with
the same displays, keeping the default brightness at about the same
value.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: no changes
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index 1eb1cf2d7395..dd2dc23f0cf1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -14,8 +14,8 @@ aliases {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
 		enable-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_bl_on>;
-- 
2.47.3

