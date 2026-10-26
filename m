Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013820;
	b=KFp9vM+54pau9MCmxUr7A0GBaUyhpTw+hHDvjNX/ZOgvUasHhxjOvnWku8OzrXerzcII
	 gAuowJisbSABZinkKHb55WN+PZr5H622XvzqwGfM5W74+XdmEQeZRPlN7DpVt7MQtfy7s
	 tLqVk/91CawTTystAFqRnWOJyk4mRfce45XrGM7C2rc8gWIwlZgdEsL210ASo/RZ6iTy8
	 b4zM5xiTxv1nzCAm9NyGd3Mz3afW98SIo3vR4FRWypZ5VHPFWEbikutWWuWOoigjQPXn8
	 Xcq5m3+ZQgGU4ZNEakLW5nluWzJvV5j0MpwlSjSTjnfqtyQAYMNpE3sYbzAYZOx0XrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=91CxdySFaB5DrN/6er6Cmr6Afr/bZ+u4IgV5MCTNg5A=;
	b=0qiFvhkuZIan7hNc7VDnHlkIyhWDpsMP52cGvf2AWN8IhXKqhRUCaCvD0k6blncUe6nb
	 ZWJDAAOIi/yKyea4bKKaUc1qORCOrdQGr0i601oK5vSsWuLNADkxX+AHwQnakjgtCaGgl
	 TKbMTREZui3ExPJ8/jkJOdB58qzyTgCP3+/wv4eFK95Nt3DIKM9aHVnHhVbm5DPn0ufAu
	 Uca9ozPkQKmJZKKtDmCnme02wJysJ0mqh+DCGReEqW31XlhLgAIA/3Bw+stGeqSN8vUDk
	 3rpZ8uooxW85zhS/D/d3FKmNVJcefs6tBQOTU0oCw35AGL0XkHiV98Od+IUEv55D0qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TyUj+5BA;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7CC60A2611
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 11:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B7CC60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TyUj+5BA
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1952941f8f.1
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013819; x=1793618619; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91CxdySFaB5DrN/6er6Cmr6Afr/bZ+u4IgV5MCTNg5A=;
        b=TyUj+5BA56M8/4PLi4R6A7jX8f2De9lq7Rh7T9B7dIuFbg4IDV7Ibsj8muDaFQgUQI
         oaDJyarplAQKK9Lg1iI5tafojGxRBnBwdts+UxCNDJs87fQUWRz8JZiFWRCQQocvDR4I
         u9MekYVYd7UC8gHO+zaFmk8BmLGffk995kCNX0ppSyDIBA17ULSyKskMhrsD8rVlGOhR
         8sLUZIBjdE55cNxEM9ChKzRXox3g81OIZKa0n27Za0+n0gs1pW91QagPoXXtol8LD+JN
         96/fA5m1s5JkrGqI69n/JAOJBfeo7ghKRGF2UZ3hVVDqpcEgDSf8gk883lPh9NFIusRC
         gAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013819; x=1793618619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=91CxdySFaB5DrN/6er6Cmr6Afr/bZ+u4IgV5MCTNg5A=;
        b=kn4LrGAozFVxIU72R1hBXzuFu7vw9G3OwguOOOzpg/Sm9uKsc1LTFIORWDuKty81Ds
         rZHTaWEkbt2KwB2Rao6++H05PbpjflbqHa1n21lEDJEYEUYrMBP0766clAGgsGO/cbrH
         V7t6Yeb4dha0ThbuSHEtO6gtRmIG24SsS4LLMnPDFzq/Qe1+/wAVdpcTps/5/UlnxoIh
         NnCDAh6m9VkZYokdOJ4pdiSXINFmkMUT/oc4VWUuRR6+aoEUB1TSmqs14RyD5m4IIiT7
         Dpd+mVUwpNBlbeETaudullzon0PZOPk39NFgvOVWIKOja+i2p0KxrnL5K7RAD7HE0DZ6
         oYZA==
X-Forwarded-Encrypted: i=1; AKwUvBxSeC84Mae66GDiyXKqrolsEIt3Jb3qY2cg7f/2D37pahBwnVDy457MLQ7GkJdLKBzJ4lTUspC0NGSz@lists.linux.dev
X-Gm-Message-State: AFq9FYJmJJNe4lrPPXkCTonf5IOoJW63hEakdWwhpmfYdh895JKM+BwA
	Fdi9JSc1SiUANOGgUbPkCFhrWcUXNyB3ZA/WRVaw19b6D8Pbop9Jw2PEf3xu1A==
X-Gm-Gg: AYBFou1dpu/S3Psnt1MIgcy44CyI08UelAQ2go8QyvF5/HoNbJ77LNF2KKFY5Akla50
	vU1LrDcNFEQ/3FWVluiqos5SYinReagQQNrEtkL7WmUnSp7bpJa+3IloMphqw8dN8mMHBO9oAJX
	ZGcmNGVzy16XNdUEvDgXPf3XcDMbSDt5dVAbs6Yr4p8d0WHK3Yldgx+oGX47ScY8pPRMpjxaWVu
	lWxgr17Yi7ZCCyp6OLg7q/idCZVUJEYc0TjV4Dw3V+/o1sR7obobLpGZRD2+H628gEKrVO85+Hc
	wUtiA2evEeR9ryYQWC1uXZIVueeRPPTDl/m8Pc/J5gH3kk9Lcukgkx8iOo/MwbbYPiTRrs6bD9O
	VlotWLXvF81r47DDYO0t+FA+JcMafQsYx5ar7T5suWTfnv5VSN8NiKILjRLRIZRCgVVK2Kg/HgZ
	oZdAr6Zg4ALQWkI9/NGOklf1n7sCMLcJOG1yyUODNkxyzd3x2T0UsYemMNl0PE+68+8sYIr9wPK
	BNxk1sKyKcYGL4ZTUfL0RZewsn9GnPkQOHq6EibLGAqKskzEXO7RSo23GUZBPlo5LbfYOylEHAQ
	F+3Ss4gClV4oPqDLjA==
X-Received: by 2002:a05:6000:2999:20b0:48e:d57:9bad with SMTP id ffacd0b85a97d-48e3eb4593amr8523490f8f.3.1793013818741;
        Mon, 26 Oct 2026 04:23:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:38 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 26 Oct 2026 11:23:34 +0000
Subject: [PATCH v3 2/4] serial: sh-sci: Keep TX enabled on TEI while data
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
Message-Id: <20261026-g2ul_sci-v3-2-b3097163edd5@bp.renesas.com>
References: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
In-Reply-To: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=6886;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=qboa2rwoVt+GqKOS/MAhP42f7309eks4Yo8BKQfQrOI=;
 b=z2Hmp1XHW0PLOLrHLhw+d3/pu5mIslrFsUqLU733cT5JadIPoyW3PDYEpzDLi112BpgJaLQA8
 eF/KVqFvXmNDe1mXlYfXOeqb8UYBj6gn5gD1HJP5WA5h+GV6a6aP5Dn
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
any, clear TEIE, set TIE and hand over to the port's transmit_chars()
op so transmission continues normally. The existing TE/TEIE teardown
path only runs once nothing is left to send.

When the port is stopped with data still queued, the transmit_chars()
paths (sci_transmit_chars() and rsci_transmit_chars()) now also swap
TIE for TEIE, as they already did for an empty kfifo. Without this, TIE
would keep firing with nothing the driver is allowed to send, and TEI
would never be raised to complete the transmission.

To keep the handler independent of the register layout, add tie and
teie masks to struct sci_port_params_bits and populate them for the
SCI, SCIF and RSCI variants.

Fixes: d61ae331d6f3 ("tty: serial: sh-sci: Add support for tx end interrupt handling")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit description
 * When the port is stopped with data still queued, the transmit_chars()
   paths (sci_transmit_chars() and rsci_transmit_chars()) now also swap
   TIE for TEIE, as they already did for an empty kfifo. Without this, TIE
   would keep firing with nothing the driver is allowed to send, and TEI
   would never be raised to complete the transmission.
 * Replaced sci_tx_interrupt() with port's transmit_chars() to avoid
   lock drop race in sci_tx_end_interrupt() before TX handoff.
v1->v2:
 * Updated commit header and description.
 * Take the port lock before reading the control register, so the
   read-modify-write in sci_tx_end_interrupt() is protected.
 * Extended the pending-data check in sci_tx_end_interrupt() to cover
   x_char and a stopped port, not only a non-empty xmit kfifo.
---
 drivers/tty/serial/rsci.c          |  4 +++-
 drivers/tty/serial/sh-sci-common.h |  2 ++
 drivers/tty/serial/sh-sci.c        | 47 +++++++++++++++++++++++++++++---------
 3 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 40db9daa4272..0391111db8ae 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -465,7 +465,7 @@ static void rsci_transmit_chars(struct uart_port *port)
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 
-	if (kfifo_is_empty(&tport->xmit_fifo)) {
+	if (kfifo_is_empty(&tport->xmit_fifo) || stopped) {
 		ctrl = rsci_serial_in(port, CCR0);
 		ctrl &= ~CCR0_TIE;
 		ctrl |= CCR0_TEIE;
@@ -627,6 +627,8 @@ static const struct sci_port_params_bits rsci_port_param_bits = {
 	.rxtx_enable = CCR0_RE | CCR0_TE,
 	.te_clear = CCR0_TE | CCR0_TEIE,
 	.poll_sent_bits = CSR_TDRE | CSR_TEND,
+	.tie = CCR0_TIE,
+	.teie = CCR0_TEIE
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
index 9eb297dbc901..6df25fef5a5f 100644
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
@@ -1007,6 +1011,20 @@ static int sci_rxfill(struct uart_port *port)
  *                   the interrupt related routines                       *
  * ********************************************************************** */
 
+static void sci_clr_tie_set_teie(struct uart_port *port)
+{
+	struct sci_port *s = to_sci_port(port);
+	unsigned short ctrl;
+
+	if (s->type != PORT_SCI)
+		return;
+
+	ctrl = sci_serial_in(port, SCSCR);
+	ctrl &= ~SCSCR_TIE;
+	ctrl |= SCSCR_TEIE;
+	sci_serial_out(port, SCSCR, ctrl);
+}
+
 static void sci_transmit_chars(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
@@ -1050,14 +1068,10 @@ static void sci_transmit_chars(struct uart_port *port)
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 	if (kfifo_is_empty(&tport->xmit_fifo)) {
-		if (s->type == PORT_SCI) {
-			ctrl = sci_serial_in(port, SCSCR);
-			ctrl &= ~SCSCR_TIE;
-			ctrl |= SCSCR_TEIE;
-			sci_serial_out(port, SCSCR, ctrl);
-		}
-
+		sci_clr_tie_set_teie(port);
 		sci_stop_tx(port);
+	} else if (stopped) {
+		sci_clr_tie_set_teie(port);
 	}
 }
 
@@ -2012,6 +2026,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct sci_port *s = to_sci_port(port);
+	struct tty_port *tport = &port->state->port;
 	const struct sci_common_regs *regs = s->params->common_regs;
 	unsigned long flags;
 	u32 ctrl;
@@ -2020,8 +2035,18 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
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
+		s->ops->transmit_chars(port);
+		uart_port_unlock_irqrestore(port, flags);
+		return IRQ_HANDLED;
+	}
+
+	ctrl &= ~(s->params->param_bits->te_clear);
 	s->ops->write_reg(port, regs->control, ctrl);
 	uart_port_unlock_irqrestore(port, flags);
 

-- 
2.43.0

