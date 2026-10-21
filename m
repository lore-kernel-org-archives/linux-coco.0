Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588401;
	b=r5zhiktTscW8mMc0S8cCA5HMG1BQDBCLXSrC2Yx6QJHOO5k3Gh57dPl1nNfoj0VAhvYy
	 E7pbY22qVuXPZyMqGYxxknSKapXfQL0j98wLNOu+AzZkVCbDE2MSxeKYHUrf/qkwXJviz
	 /bxcTzCQTPSIdJlPEn8TgjGK7j7tXeoZfy1BJkDCXHb4eo+oy0kN2VB6GSRUe5m3h7FHD
	 hJBrSsjD5QHp3tzGC1gJ7b/ZdoqwvZWOIWEMQREW1wTp5fDXTiN7U/OriFVTf4maBz8ey
	 38kWiyiJg4uuhtelkKj3K65z95ZvG9vxnQ8o951YzgWjkqRIyaNYAzXYYFNQdQLdIPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=292nn4bD9cz6vKfwxdJIYuZQqNn1YltUeNe0zaIQXIg=;
	b=mJvBCfglnhIHDby9O8xRAPvFNm7NKAg/K6WU+xR4uI9/wm+xkRXaruQBi407uDF4Bpmf
	 i16JOCaz7xltUrT3Z4qkMj4B5z6gcVYC2kQTUL3b6cLuFH0EeIA9NtfqoaeyEo71ciSqu
	 RUKvTHA9JOEsYsBq/1cza/nXf6cpKiSOy0OO+all0RXyXcDK4piFS2TesEE/9PaABm2H2
	 rhJbp3qsowZ3rErCcJKXAjp/8onjcMUCMkLg4J2fRPRwcsQCbKJ0e47nDxE5DHfI2ccwZ
	 Gaww8SEaoLUfkGB4SZbJpkICSRrGF+pYkbJ1tvovfsj89AqqzQrjb24/t0SfgPDRyyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p1C+CWhD;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F275E60A2607
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 13:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F275E60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p1C+CWhD
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso587321f8f.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588399; x=1793193199; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=292nn4bD9cz6vKfwxdJIYuZQqNn1YltUeNe0zaIQXIg=;
        b=p1C+CWhD9F0yMzdKxr1eHPo5qL9LXP9wj5ZTXK1AC2Nd4/swGbk5KT26TVbiNbxKX0
         Ny4/k6gp5kW24uGCMYvzA5u0d3Cd0uHycRPdZpcHa3jbXzVjUibfJ/KNtwB8Y4ZRjJCu
         vFyA1qMToIR0BMVqJCK+TLMksWziRCbBB8ksQIdE3Y6HzGiqilvYz230YJpbSswMc7VU
         j5O2EJxI0FjNW6KoB0EsqS0QZkivJXB2T6mVp4iSfIeIQ38Zy0ndgy48lUVsnN/Aqy6X
         Dhww2V+7VzqcILxP7v2BfaNjsQ96YHCcFLo+nYRduh1PZjLZ6NOHCdmLCOgQXJ+GHVCK
         mGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588399; x=1793193199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=292nn4bD9cz6vKfwxdJIYuZQqNn1YltUeNe0zaIQXIg=;
        b=Bd4kfyI+lTujpC2S8DTbte4iAy3HsM1Yo7YR+TKMP5N7A4cUxubi1Gdq+5DEFMa84N
         aj+ZYEY1GXg9r8zSR3TxVyaAPCUYJpHQZvdbBzG/9n3BLY7WAoXDucvy8ik+9+7C/ZRQ
         k+DrgzS73NtpOeHvDMZ2IHAlChhl3umQIo/kDxgHST3nLJnP2CR3X0Gwi/ESMYUXuMbW
         czkaDi2bndXMcoSDlyGuwtO6JZt5Cluqi56Zrnwbkz/oG19Enc1lsjbQTJyRKbw1JXln
         5UDNzdAXCXZlKkkf37ooV743sWvVjgvhNiN0xW8mcFJAoLU7IuhLGANIEnGESMc4Mcf+
         UIRw==
X-Forwarded-Encrypted: i=1; AKwUvBy6NFlk9IfHRVGKMuElP8uXQBkheD23V2JHUCo/hp7EqBNUhiexMWq04VmwEeK9BGg3dKCj/t6GcGAx@lists.linux.dev
X-Gm-Message-State: AFq9FYJGL+EAz7eVq6pBwIdn9cycWtELXLsEAkoO9eHSK0uck6isrAyt
	F46F7vBZjLKD20Lc+tOkVEhNHf+Pg9TzBWNU1qClG5HKbGVU6cUYjVW2
X-Gm-Gg: AYBFou0+mZiOEgMAUtnwq7nyZu5KntcJQcNFrVHL3IGRIIqSMIWy616zcu0dkbWJ49Z
	PfwmjurKaRbwsA5Qwf5Av5LOC41k+pp3jCioV5Mxe27yXVM7wYabF4k5UTvxkDNV/s/SsZlZPg0
	KvCgOurKcLugxEP+zudMtGwgzSGG4KfMLx559ZcjOR6ra1MTUi2Zn+Cpfx2uNEl7/ywHx/kcYZ5
	OAyT5vJ/LWzztQ8lUy6onR/cGlFdrx1VNjCD5LxUb/3WMgmxBTiMIB6MduFrOwxefvdOedNld23
	laVIUiEA6F/SWEvvU0hFgqBN6wHzrPFkF8Yevl8ok1+EZf7QR3ASlH/wMDq6LxVtYW8GbjjMIGI
	0B44jq8+fFmsy9g4MwZ1hIptRngEzVW1F6mN3aMfQ5XYNeOA5HxVEgs5yea6/XH6XknfaUK2PPb
	ct0hkUmGDtGiDdE1AbP8WAJjOtkQibX9TwiDzVAcv1nLVhDAfFwXipKpk5NeW3ryfDf8NH6J122
	bPwJVfykLw3wq61I6dzxLfvuQl42+Kc4i2oKhdrlW68N/OVuD/kVGHCdTUb01CwjmdPZ0R78z0z
	gnW24EEN4Sz4XyIU
X-Received: by 2002:a05:600d:82c1:b0:4a1:cdab:f5c4 with SMTP id 5b1f17b1804b1-4a1fdd24674mr41785685e9.5.1792588399034;
        Wed, 21 Oct 2026 06:13:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:18 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 21 Oct 2026 14:13:14 +0100
Subject: [PATCH v2 2/4] serial: sh-sci: Keep TX enabled on TEI while data
 is pending
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
Message-Id: <20261021-g2ul_sci-v2-2-b4e038220018@bp.renesas.com>
References: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
In-Reply-To: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=4482;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=wf7d22n14z+6F4u/wCQpq1DvU71Byp9AVSJ1tL9JEOE=;
 b=3DOA93pFE4K6cXhopLwouumZlWA6bnQJ1hSGxktN3UZJKfjNgafV0q7xDKtLCmS9dl8I2yZJU
 l4btajxbEBlB8KGTpE5QoEvIERyfrHWYwz/D/jc4J96vrEZQwRfwEza
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

sci_tx_end_interrupt() handles the transmit-end interrupt (TEI) on
SCI and RSCI ports by clearing TE and TEIE, which turns the
transmitter off. It does this unconditionally, even if the xmit kfifo
was refilled, or an x_char was queued, after the last byte was written
to the data register and before TEI fired. The pending data is then not
sent until the transmitter is re-enabled, so output stalls or is lost.

Check for pending data (x_char, or a non-empty xmit kfifo on a port
that is not stopped) before shutting the transmitter down. If there is
any, clear TEIE, set TIE and hand over to sci_tx_interrupt() so
transmission continues normally. The existing TE/TEIE teardown path
only runs once nothing is left to send.

To keep the handler independent of the register layout, add tie and
teie masks to struct sci_port_params_bits and populate them for the
SCI, SCIF and RSCI variants.

Fixes: d61ae331d6f3 ("tty: serial: sh-sci: Add support for tx end interrupt handling")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit header and description.
 * Take the port lock before reading the control register, so the
   read-modify-write in sci_tx_end_interrupt() is protected.
 * Extended the pending-data check in sci_tx_end_interrupt() to cover
   x_char and a stopped port, not only a non-empty xmit kfifo.
---
 drivers/tty/serial/rsci.c          |  2 ++
 drivers/tty/serial/sh-sci-common.h |  2 ++
 drivers/tty/serial/sh-sci.c        | 22 ++++++++++++++++++----
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 40db9daa4272..52638db7bbeb 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -627,6 +627,8 @@ static const struct sci_port_params_bits rsci_port_param_bits = {
 	.rxtx_enable = CCR0_RE | CCR0_TE,
 	.te_clear = CCR0_TE | CCR0_TEIE,
 	.poll_sent_bits = CSR_TDRE | CSR_TEND,
+	.tie = CCR0_TIE,
+	.teie = CCR0_TEIE,
 };
 
 static const struct sci_port_params rsci_rzg3e_port_params = {
diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 01ff9fced803..273856fbc20b 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -56,6 +56,8 @@ struct sci_port_params_bits {
 	unsigned int rxtx_enable;
 	unsigned int te_clear;
 	unsigned int poll_sent_bits;
+	unsigned int tie;
+	unsigned int teie;
 };
 
 struct sci_common_regs {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 9eb297dbc901..58120b523ca1 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -261,13 +261,17 @@ static bool sci_uart_earlycon_dev_probing;
 static const struct sci_port_params_bits sci_sci_port_params_bits = {
 	.rxtx_enable = SCSCR_RE | SCSCR_TE,
 	.te_clear = SCSCR_TE | SCSCR_TEIE,
-	.poll_sent_bits = SCI_TDRE | SCI_TEND
+	.poll_sent_bits = SCI_TDRE | SCI_TEND,
+	.tie = SCSCR_TIE,
+	.teie = SCSCR_TEIE
 };
 
 static const struct sci_port_params_bits sci_scif_port_params_bits = {
 	.rxtx_enable = SCSCR_RE | SCSCR_TE,
 	.te_clear = SCSCR_TE | SCSCR_TEIE,
-	.poll_sent_bits = SCIF_TDFE | SCIF_TEND
+	.poll_sent_bits = SCIF_TDFE | SCIF_TEND,
+	.tie = SCSCR_TIE,
+	.teie = SCSCR_TEIE
 };
 
 static const struct sci_common_regs sci_common_regs = {
@@ -2012,6 +2016,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct sci_port *s = to_sci_port(port);
+	struct tty_port *tport = &port->state->port;
 	const struct sci_common_regs *regs = s->params->common_regs;
 	unsigned long flags;
 	u32 ctrl;
@@ -2020,8 +2025,17 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 		return sci_tx_interrupt(irq, ptr);
 
 	uart_port_lock_irqsave(port, &flags);
-	ctrl = s->ops->read_reg(port, regs->control) &
-		~(s->params->param_bits->te_clear);
+	ctrl = s->ops->read_reg(port, regs->control);
+	if (port->x_char || (!kfifo_is_empty(&tport->xmit_fifo) &&
+			     !uart_tx_stopped(port))) {
+		ctrl &= ~(s->params->param_bits->teie);
+		ctrl |= s->params->param_bits->tie;
+		s->ops->write_reg(port, regs->control, ctrl);
+		uart_port_unlock_irqrestore(port, flags);
+		return sci_tx_interrupt(irq, ptr);
+	}
+
+	ctrl &= ~(s->params->param_bits->te_clear);
 	s->ops->write_reg(port, regs->control, ctrl);
 	uart_port_unlock_irqrestore(port, flags);
 

-- 
2.43.0

