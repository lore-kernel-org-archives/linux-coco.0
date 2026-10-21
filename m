Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588402;
	b=1BRXUN92s/aMsO9gstXOpLwPis/6WKtljuJ1XJUSDSQ3hI9f8TeBdf6NB2PiyH8pCl0r
	 QD1d/7vatEKINIDjImI9Q8cLbSVFBKCezYzLAjyqrVGJGh1g3IrTtvp2Wql5LlW7xv4tf
	 WhPCw3yifFfCCmx0Z45PMiqFAswyGZamRiwFyF3uWwOWACXFrvV12rj2p+EvtdOquzipF
	 prWozCMFxrDcbDw1ZUhDuQ1ccxLsLwAx+YuJeqZ4wSXIszpgzTl3HzZFU2hLxDSkYwMHM
	 d5/m3OzxJ30qEG6WCFRYsHLus/hA4tycXo7EzbO0pjwjCuCDW7xkqAHo0oX7N2GqCNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jjB3f6EHxvEifNSTVNnEiGYNsGRnur8C2W5GETve/jo=;
	b=0g4gGtHwzEfwqXK8sFN03bKbQwS2ExlJ+mwgv0n6ojavcPGS/4VtUxHNKnw7hfJ5NjJL
	 Mu+3D6ZzRwpI6GqYYkdy9G3f+bgQ5hILtBDAIRPBcMDsDnEjk1hopeUCVoDLaIhxpIy+X
	 LJZSnSKqmTjCWEEjDHwU+IlVfF8wNecWq4tAQJlAsu/eXliln8ZQdah7QXSZjpy3R6h99
	 vsqzgFbd8aZw4MfPmNNMQZ5HqsDQMrZoERX5jkQI+qWAYrLDsizo0CXw9bzvZtYHEATIT
	 xw6aQYeJ778l0xNgcfqkNRxwM6L8YAx+ZRCdnwZvpU4VkTlUZta5dTon+KGoGOoUcDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dWU+Ahq1;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8121606A328
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 13:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8121606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dWU+Ahq1
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso492192f8f.1
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588400; x=1793193200; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjB3f6EHxvEifNSTVNnEiGYNsGRnur8C2W5GETve/jo=;
        b=dWU+Ahq1HBSSz4TtbUi7hk221KXPCNXYjuCFq8DExUx7ggV4gGNTegEsvt8jjmf4zq
         bZjAuCI1YZC3iIb0RMfF6DgktWdA2r4i5OZKDnrmTIVSFht/wKvieBmHMElk3L6OAcU7
         r7OFfxImXC7UttqNAj3kQIAeCla7efQQnM1nNaeeAl3J4LBD4APRTowWSNK3XYOPPgKE
         GeLEFMBK49JTjhQCHgPltgo9g678ztpMuZHmZDiBz6PPt1iF2S88QrUZLSHWNS2ZY6yX
         YAwrzb1ELqZa95pNaDqxBNhhQhPapOv7t7MwcomT9fMRYBxjoCvNHc3UQmVz0zq+mz7q
         TVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588400; x=1793193200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjB3f6EHxvEifNSTVNnEiGYNsGRnur8C2W5GETve/jo=;
        b=yRkyBPTjhuv1LKIVRrNUc98zAp2MOANH35Kd4driq95kmrDAOJoCvtiVBiHVQKcLuA
         bk+uxbUXcAS8nGZztrXBP5qHsfGdLvbbsRBCPsHOLHOq4ftxu547TjM9PwcYIaOydtoJ
         IIm3znJ9IN6Isuu29kLx0hajApU+DvzwBvfo6jBEn0hTogX/XmVwr+0P/DoIH1yMDmkM
         uzTvevfq1zv2hF8lKHmrwVQIZ1sJAakbxfjURP8QVeS9jMEqjBO48+C9SIKMpIdiXCpa
         K+GCKMesDZ6uNlX36F8IFph+G4pjZrRedSr/uhK+h/RwnAkwqqq/Xst0WwHy36D/HkPi
         gqeA==
X-Forwarded-Encrypted: i=1; AKwUvBy2YwOV6AVZWrIh9mqRwjsRj7v/Qij4Zi6LmVobZXjzl/7PZsFErXJ5E+r9vNMTE05JNJWEi1/iHYIO@lists.linux.dev
X-Gm-Message-State: AFq9FYK2JH57y9SU0BE0TlfcjO4Y9DhcPkB5RtcPyEVqxRaWpwmEjMUH
	vy6q0LbbCmFchas7LCDEfHfCRPgk9squIftlW9yQllY0Uwk2+4QLtWoD
X-Gm-Gg: AYBFou2iblvrcHfP0C2s51aEcHlCKwJVZyb0Rx+2R44zAlyiNS+jXDGUFlA2CfFnZ/9
	kRsVq1P2d6PwOPQ1IBNciRKUmoqn0HqMlC/iimeb6EPm+b8vQWYV6oeWwydN+fbfrP05PRy/KFT
	bcY1NdnIWNTgaRY4q0ABmUa4Qyk5ir+OTDuJcvvecmrhV7HtpZ+yxJUNbEI7O7S9ucxJawmbVUQ
	vWWCHIwVaFnndiLccEmCH8IBjRRG+8tMyeEdQ4snDupO+7vIM3rRi6H1lla5ODytQTm5+477Mn9
	nHupZIfyrXwPriEJCQCQ0StR9abpSWrOZBFF1hwmehBsU21Uf5sNTli/yMxMIFYp+067QeFZYHy
	4UO1D/K/XbrM4xHVQedoiTn149cx0Ttq2rTfGNsJsmfgLi+XldepS1Uy74eflzll0/QZr6Lq2K+
	R5728HFoqjY70tOy9zmviIQhN6LGDQNM1bcHhMhHpLaxLv50aiI6g2pXZe21mor4iomlErpKY8t
	Vrv0R4fYeWJkPZcXuKIuuiEKdajHsccK2H0jGR2LP2sUVd9YeJQGrvvxQGPc7/mCa48a1EhUAbF
	cGJOsijpClxbfsR7
X-Received: by 2002:a05:6000:e92:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e2650e9cbmr2759721f8f.51.1792588400117;
        Wed, 21 Oct 2026 06:13:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:19 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 21 Oct 2026 14:13:15 +0100
Subject: [PATCH v2 3/4] serial: sh-sci: Skip TDxE clear when hardware
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
Message-Id: <20261021-g2ul_sci-v2-3-b4e038220018@bp.renesas.com>
References: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
In-Reply-To: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, Au Dang <au.dang.jx@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=3193;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Y/PdxtI6+N01gYP5oufNYPKYCuexWL5hMhFV0qDpjvA=;
 b=APrCXhR4oqewtSnvMx0iGzGwgxblBK8Do39a7KN/jeZD1h2Lu5Sj5M3XY/G4IVSMwI4oxn7mm
 lLbvQmqn8VAAvzmmaUE/GFw0YCQyGw+YB/RbWbUY3e/AmTZxZPuZiD2
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
v1->v2:
 * Updated commit header and description.
 * Replaced the PORT_SCI check with a has_tdxe_auto_clear flag in
   struct sci_port, set from the new tdxe_auto_clear field in
   struct sci_of_data.
---
 drivers/tty/serial/sh-sci-common.h | 2 ++
 drivers/tty/serial/sh-sci.c        | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

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
index 58120b523ca1..aa179c787487 100644
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
@@ -1049,7 +1050,8 @@ static void sci_transmit_chars(struct uart_port *port)
 		port->icount.tx++;
 	} while (--count > 0);
 
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
+	if (!s->has_tdxe_auto_clear)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
@@ -3653,6 +3655,7 @@ static const struct sci_of_data of_sci_sci = {
 	.ops = &sci_port_ops,
 	.uart_ops = &sci_uart_ops,
 	.params = &sci_port_params[SCIx_SCI_REGTYPE],
+	.tdxe_auto_clear = true,
 };
 
 static const struct of_device_id of_sci_match[] __maybe_unused = {
@@ -3791,6 +3794,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 	sp->ops = data->ops;
 	sp->port.ops = data->uart_ops;
 	sp->params = data->params;
+	sp->has_tdxe_auto_clear = data->tdxe_auto_clear;
 
 	sp->has_rtscts = of_property_read_bool(np, "uart-has-rtscts");
 

-- 
2.43.0

