Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524145;
	b=zdnDeJoil84wkKoWkk2gsEqrCmNb+SMM7CzZw5jIeXgJTBw/ULui5FwBbefL6pDNScu2
	 jG5B6X/Mx1waokNFTTyrHWE1fKvpk4Lf09SYnUfPSJhPRGkXN4wyUUCwB/7J+iSvbMs0p
	 34ndL45cbHrUCdkRikBUL5JRlxdfq1vqnZMQNXXOYbyb8nza2ElhnmMN93kgFfYgGDLVQ
	 EJXULHtmEmyotKHUlT6pzc6jmFH7gO0S0htVPLvJvyibotTIpkuNq5VDW4oPWq4fKq9pF
	 KIwCb7x2rtxUFRV4nawntt5w1VGmuZf2QtreR4qdWkp4GVA3WtihEhl5o0ftZSxJjiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524145;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Zv+4EZiS26DlNQvyzNgd6gBATMlT9+EPJ9YBCykQ2Tc=;
	b=tHFS3vjArrPVt7kzjsf6uA08hOQgayrHYPAQukERc5qSBQ0Iuqs65uaqmJfyZTEez4CU
	 WIIPK0BM13jAtMTflfoOtAj7cPui2O1gL8r9sOkG5wqrQMMFLCN+2p3w2X1eKc5op7UTs
	 n7ZbLDRVRC/QoEKnEe12xfgwFe+36bPyaC2BUublrC2pO/hgFrxJwZcGSahfYV8fevQGL
	 LUWAHL0N8y2KyEpiZHbwov3+zy5ocfQGSlHOaLtXsux+uL6GQALMsdn6sIr6s2mPadgUR
	 vaqqlWas/dTV6IF5+tFcANDDiOX5IL3qI2PTd+/9VMDGKD7JdrlnOkzc+HX0WNh7n8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=TDnxcTga;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB49D606A31E
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 12:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB49D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=TDnxcTga
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6A8E91F953;
	Tue, 24 Nov 2026 13:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795524134;
	bh=Zv+4EZiS26DlNQvyzNgd6gBATMlT9+EPJ9YBCykQ2Tc=; h=From:To:Subject;
	b=TDnxcTga3xZelYo8999jovrWI15ICGB01YV4Jxpapnz2pw+JaGX7Ibjm7zpAPg8dB
	 7OgyRpVvV3ONvCRWn/pp+RQvrUdTbDxxPsW56Xw5piqvnxAl2b9eP+a2sIa6sNKVqa
	 GrbSWo8/CPX7a0nhlV/fzHSXq82p0HM7OCcw5QYfZNSfBur4ABIAc0L71bX2MP7Aag
	 jz0mQugUIJjgEPlDIakozpAnXqRoI1Xb9J6cMNFpJkDZtcUp2xrS47inSfjEh916Rg
	 msmie2oRTj6ser5VKD7+eqa8XmLbKLzMJ3x5jF0ODR4XpluuxDY5sYkF8ZXylH1chz
	 EzRudXy8FoD3A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: ti: Add tdx vendor prefix to display overlays
Date: Tue, 24 Nov 2026 13:42:03 +0100
Message-ID: <20261124124207.199382-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
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

Add a "tdx" vendor prefix to the Toradex display accessory overlays of
the Verdin AM62 and Aquila AM69, and a "-v1"/"-v2" suffix to the
Capacitive Touch Display 10.1" LVDS ones.

The overlay names are the Toradex product names of the accessories, and
a product name is unique only together with its vendor. After a long
discussion with the NXP i.MX maintainer on the Apalis iMX6 overlays [1],
we agreed to add the "tdx" vendor prefix, the same way third-party
accessories on Toradex boards already carry theirs, e.g. "rpi" in
k3-am625-verdin-rpi-display-2-7in.dtso. The Toradex display overlays in
the NXP i.MX directories already use the new names.

The same accessories are used across Toradex SoMs from different SoC
vendors, so renaming the existing overlays is the best way to give
users a consistent experience: one accessory has one name, whatever
the SoM, and the vendor prefix leaves no doubt about the product
supported by the overlay file.

[1] https://lore.kernel.org/all/20261026111149.GA46946@francesco-nb/

Francesco Dolcini (2):
  arm64: dts: ti: k3-am62-verdin: Add tdx vendor prefix to display
    overlays
  arm64: dts: ti: k3-am69-aquila: Add tdx vendor prefix to display
    overlays

 arch/arm64/boot/dts/ti/Makefile               | 120 +++++++++---------
 ...e-tdx-panel-cap-touch-10inch-lvds-v1.dtso} |   0
 ...e-tdx-panel-cap-touch-10inch-lvds-v2.dtso} |   0
 ...o-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |   0
 ...o-lvds-tdx-panel-cap-touch-10inch-v2.dtso} |   0
 ...erdin-tdx-panel-cap-touch-10inch-dsi.dtso} |   0
 ...n-tdx-panel-cap-touch-10inch-lvds-v1.dtso} |   0
 ...n-tdx-panel-cap-touch-10inch-lvds-v2.dtso} |   0
 ...verdin-tdx-panel-cap-touch-7inch-dsi.dtso} |   0
 ...apter-tdx-panel-cap-touch-10inch-dsi.dtso} |   0
 ...dapter-tdx-panel-cap-touch-7inch-dsi.dtso} |   0
 ...o-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |   0
 ...o-lvds-tdx-panel-cap-touch-10inch-v2.dtso} |   0
 ...quila-tdx-panel-cap-touch-10inch-dsi.dtso} |   0
 ...aquila-tdx-panel-cap-touch-7inch-dsi.dtso} |   0
 15 files changed, 60 insertions(+), 60 deletions(-)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso => k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso => k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso => k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso => k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso => k3-am625-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso => k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso => k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso => k3-am625-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso => k3-am69-aquila-adapter-tdx-panel-cap-touch-10inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso => k3-am69-aquila-adapter-tdx-panel-cap-touch-7inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso => k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso => k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso => k3-am69-aquila-tdx-panel-cap-touch-10inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso => k3-am69-aquila-tdx-panel-cap-touch-7inch-dsi.dtso} (100%)

-- 
2.47.3

