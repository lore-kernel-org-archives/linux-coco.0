Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013821;
	b=V5UxxBAqDF+NYbz1ctUgFtPZjFwizsXNgfmIrT+wU/lejc8qljh3Je3CE05ZPEmGiASB
	 p6LsTbWMNhbJZYAfM3DOcFLT40c0F4kiy6SUdqzSKyAz/AwuCCqI0jHWR02SfsKGNKH+E
	 vVrAKfwQJrt0mBQjYzDneeVJNbae/c6BVxlcCIKdoUGDnbEzDaaIiSLBZW8RoS5ljmjx4
	 I8yMcb1oh1E9wcRS6dWId+wiPE6hcQlqgSQC4FENWGXi/i4jlNLqLxgECJ9/Lq5KtErhX
	 fwnrcqUnDTaKHcBvKpmZDnQSobOiuZZHNoWRHsr60AhvWly186iwM2q2/WhVAbVIW5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NkHFqvFUiAfPwzGNvVdLDGTDUaLNG4S8G8Zms7Ox124=;
	b=vflQZHUNskEOkp6QIYoxurtOtqXQ6ad68irhM6hQp9nZgr9bXYtTZU/dkI7ihWzUDS/3
	 yu1Qh1Yb5mxZ9Mm/Nb/1c2b03j4G3zqfqxZ7FEuiDCmDzbsML/AtGZ15fAz0kgZF6TKDH
	 QEzII2DoSONQGanEjtSpmUU9Ivg4vBiQDr//EvLE1jVYhIFoIcok4AD8vBfxO/geVkYOW
	 s498wBDaYk2xflqLl81iMxJWiUj3rrwHT1O6gcs80EPg2P0rRkw+GG1/CtJ/2//nw419k
	 kHC6ubpGS/HutiKre+PJ8JL/vt6nds0psqD4OuIGKUii5Rz+4TWhAr2IfJxg7YQEgxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gL188Gzx;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68C60A2611
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 11:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A68C60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gL188Gzx
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df8fe8513so2686349f8f.0
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 04:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013820; x=1793618620; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkHFqvFUiAfPwzGNvVdLDGTDUaLNG4S8G8Zms7Ox124=;
        b=gL188GzxhmQkDeHyTwfJCuyL7hSPMvDlQqDJ1sPZg1OWgLe9bBTu0tdAtMCIEBfbHr
         fIwpuMNJT3GP2WbXYXoZabYlnVrZ0iiXpPaF+BeolSc+5jCiJOKT2R6lZYFcxKzk68Wk
         sct9rCYweomJKDnc2+xabFMfHdiUq9H331pIKIQFlIY1kRXtWAO6SMgFaIPHDrV9flxa
         Wc6596QhRg38bux7NuwT596C45vu+s3ad83Hb+SrJqmk4TnHqND14+x/84SvCrwb9SSp
         svHxrhmU7nmjCorbcO8O+eSN+5lHTpYbK2Yk+d5VCiODVYmDIG+de0WZC2tuZqX37Yjr
         ASvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013820; x=1793618620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NkHFqvFUiAfPwzGNvVdLDGTDUaLNG4S8G8Zms7Ox124=;
        b=iEK1RrbcXRMtf/vV5cJz42P72iwHBXahp6dxqGQnktlT2IoxeJGTEpJCaLRX2y2sqw
         +8SeDN8hzLuoY0c5P1e0y1RfOBIQTmEiQb3hC8BkqC2VIxDaE39tw7gWWqIC7BzWBodz
         KK6i8ZyEKUsbN4S66HEqOGBiI9GwmlqX9Z1JTtmOmBEgUajw0nFoZd8onaeVqMCFtPbT
         QED3bksl2rcFv9zUYwyN5YAjBxa8NOTXNMK8f7Hwq/0+H2TWlEv2xrhWIPYAhb2WDyui
         gZMx6Idxd+B+dRsmrCM7Hvu/iRUjQWmswvoUe+BaZ17vbcB3qsZL3g9KYNalbEABKydN
         KraQ==
X-Forwarded-Encrypted: i=1; AKwUvBxL8ZHKz2KnOYu3xHEfQ9Aeg3TxP+q92gB6+yTopxA4E79YomIY7SjPPc/ix1QUO538L5zfFvtDX4S4@lists.linux.dev
X-Gm-Message-State: AFq9FYJyH3VUuycA41iDA4e6rZQi+XqSBAmMAe3H6M9mMip0QebeUYlX
	0aZKQz8qXBZPxDxZdpdTUD/BGhs38DQx66y2iOuNyVC8ckTljY5CLxNYmRe7+w==
X-Gm-Gg: AYBFou1X+0yQnoyHv1NnOEkPNP3yzCeY62ObIAkejBI7FcPqehOdXWt4K4EUQh3b/xs
	ULvb48XKNxX7lxGxsFcgXxSrq2nYjEnBqCCCsOYeQB3t5jjEX4/yXZ9kU1lwXU9UQcwEudbn4rs
	46ch63TmcVwOL11Y8FDbL7SaYkj48RSUFkcTpB6xRYn93WRp1TYHgsD9ug1gReIXVPOvHuDFRtq
	FhiL39hsHE5v7FNpCJfDsk8CBn/kIagw5zKlH5sXHxwkqkxR+ETX46auDbiG9Dj9+QA6X+N/yu9
	91CaHKzRZLTZMTl+6Ul27aLtyv9NyNM2riuNz8YAA7Y05IGW/I/YncfdyK6uptg+iNmqxWXszIT
	2eWXDZCGNs2geTW2N6/OHaEK8+v/oWO/oVyvrcWd/NAAc2QdwH+hSPYKjyBj2TyQI3OnZA2xPoC
	pFgQImSdiCBnGiPqvF5JbEcdXePCJRZyGYWhQF47kj0weO/7xM7COPbOPhgOg0uS/ZmluZC2rrf
	unfRwXau7GUGyvD7rpV2j97U78LvUvX8rSPpn5lUKZIximFuNESDmVnHcEMtCZrgQubDN75cCZ8
	ZTTIXDjFONkhenj/1WHAPne2dMNGqrQdcf3JBHE=
X-Received: by 2002:a5d:4383:0:b0:48d:fd53:828d with SMTP id ffacd0b85a97d-48e3eb8a1b6mr7627995f8f.30.1793013819697;
        Mon, 26 Oct 2026 04:23:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:39 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 26 Oct 2026 11:23:35 +0000
Subject: [PATCH v3 3/4] serial: sh-sci: Skip TDxE clear when hardware
 clears it automatically
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-g2ul_sci-v3-3-b3097163edd5@bp.renesas.com>
References: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
In-Reply-To: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, Au Dang <au.dang.jx@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=3620;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=KB+kE1+shxRd3dGwjTbXEQz+rrpnAjxkBvUYxhCqGQ4=;
 b=FyiJOLjQsEgh7hED9u6Vg84+oXVavAcckL1O3uxMZb2M4M6TLvy0YXizK/YFDsHSZWWowmR4Z
 eVo9V5O27wgD36iRG5CapP2RVofAO2y0Su45I6MBJOB4ez2CMGOmxRx
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Au Dang <au.dang.jx@renesas.com>

On some SCI variants, the TDxE (Transmit Data Empty) flag in SCxSR is
cleared by hardware when data is written to TDR. Clearing it again from
software via clear_SCxSR() generates a spurious TXI interrupt, causing
the last character to be transmitted twice.

Add a tdxe_auto_clear flag to struct sci_of_data, propagate it to struct
sci_port as has_tdxe_auto_clear, and skip the clear_SCxSR() call in
sci_transmit_chars() and sci_poll_put_char() when it is set. Enable the
flag for the PORT_SCI (of_sci_sci) variant.

Signed-off-by: Au Dang <au.dang.jx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added missing has_tdxe_auto_clear init in scix_early_console_setup().
v1->v2:
 * Updated commit header and description.
 * Replaced the PORT_SCI check with a has_tdxe_auto_clear flag in
   struct sci_port, set from the new tdxe_auto_clear field in
   struct sci_of_data.
---
 drivers/tty/serial/sh-sci-common.h | 2 ++
 drivers/tty/serial/sh-sci.c        | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 273856fbc20b..b75e5e1d3075 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -108,6 +108,7 @@ struct sci_of_data {
 	const struct sci_port_ops *ops;
 	unsigned short regtype;
 	unsigned short type;
+	bool tdxe_auto_clear;
 };
 
 struct sci_port {
@@ -163,6 +164,7 @@ struct sci_port {
 	bool has_rtscts;
 	bool autorts;
 	bool tx_occurred;
+	bool has_tdxe_auto_clear;
 };
 
 #define to_sci_port(uart) container_of((uart), struct sci_port, port)
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 6df25fef5a5f..1a4d9467d2be 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -913,7 +913,8 @@ static void sci_poll_put_char(struct uart_port *port, unsigned char c)
 	} while (!(status & SCxSR_TDxE(port)));
 
 	sci_serial_out(port, SCxTDR, c);
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
+	if (!s->has_tdxe_auto_clear)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
 }
 #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
 	  CONFIG_SERIAL_SH_SCI_EARLYCON */
@@ -1063,7 +1064,8 @@ static void sci_transmit_chars(struct uart_port *port)
 		port->icount.tx++;
 	} while (--count > 0);
 
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
+	if (!s->has_tdxe_auto_clear)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
@@ -3664,6 +3666,7 @@ static const struct sci_of_data of_sci_sci = {
 	.ops = &sci_port_ops,
 	.uart_ops = &sci_uart_ops,
 	.params = &sci_port_params[SCIx_SCI_REGTYPE],
+	.tdxe_auto_clear = true,
 };
 
 static const struct of_device_id of_sci_match[] __maybe_unused = {
@@ -3802,6 +3805,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 	sp->ops = data->ops;
 	sp->port.ops = data->uart_ops;
 	sp->params = data->params;
+	sp->has_tdxe_auto_clear = data->tdxe_auto_clear;
 
 	sp->has_rtscts = of_property_read_bool(np, "uart-has-rtscts");
 
@@ -4088,6 +4092,7 @@ int __init scix_early_console_setup(struct earlycon_device *device,
 	sci_ports[0].params = data->params;
 	sci_ports[0].ops = data->ops;
 	sci_ports[0].port.ops = data->uart_ops;
+	sci_ports[0].has_tdxe_auto_clear = data->tdxe_auto_clear;
 	sci_uart_earlycon = true;
 	regs = sci_ports[0].params->common_regs;
 

-- 
2.43.0

