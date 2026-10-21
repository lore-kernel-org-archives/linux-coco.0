Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588400;
	b=ncvJxHxy4rZdj/4mmVNKfIDYISqBPNcSAJb/TB55VmqugMke1sKKsWKB4TNSIn8KpQSj
	 JXRNElipXyri5ZYxRQwy8UH0gVO6UkFmufO2KABDi8NsEh7RAK6lzIrZy4mOhS5rxi097
	 aWtPYOa0qmN3sQ3Qx1qpwwbLGTTRI2UhLjV/q/k1BllhgY/qzIH53DpknelLCCCOHbRH2
	 WPw8nhrPDTmMaAQ10Kg+PnJsc5MJb233ShbMLVxsdtuaikv1XiGNhbhzgAJ7ukHwvF50r
	 eDo896gv2PSOslPy60ZE/ERmr89DhIy4+B+kyQ2wRl4bOMLKwXS9wG2Sxn8dso/bWBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XhDg8QClMZJOayDv8bj/xO5vbSdeZvK1hnpn/RI7Gj0=;
	b=oNUISFODif4UvgEE98fAToHz6RQb5LGLU4cnbUTDlquP1eNF01IeU1GHvmh81QBN62rJ
	 wKvC09Mhx4y4qpKvKLNdJGdOmSxwNb/vuFuEs0hAxGDyzkWHI4ZkEYTACWdW8tcSf3vwo
	 AvHTXb9t64oSlsFxao0HEQ1zGD0Nz6cpeOn9ElTsGtpQxQ+16nrmaCGZvjDqJg7mUZiPR
	 yD72heSqlXv69TxlWNBaqikEvqAjKVaaxCITV4JvOBszVW9Gfu6ybO8uVTZkrMbAIveNo
	 Qja/IYZhDCuF6KMSWnlgoVWD12MUBNJtKzbVSsmVR3KsJMkKmq4ASPmYhGDavQrZ/kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XApD2qMH;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D30F606A322
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 13:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D30F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XApD2qMH
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so483406f8f.2
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588398; x=1793193198; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhDg8QClMZJOayDv8bj/xO5vbSdeZvK1hnpn/RI7Gj0=;
        b=XApD2qMHMLAOP4FVhU9HB6PSV7aOhZuloHT+HA8awk/nXSFJ9yrQwO6PqKZsqc/VHy
         KdtFEe/uZM/cNmqWpNh1dayqep2Qj1TfrzUOReyarQevX3VSzqDZZRmgcx5A/fHcv1Yq
         6ZpT158OoTKaAHQ5uXEnz1UlJRzwNqUJ3Ho3WCV9iAegOHQBMDiz+Yu76VP5GJLQkRw3
         LQKuc7b5HRb/bLlwqjvvF6tawrqVYKA4XVezbD8RH/YAJde7u9VppqnhEY+1/oiHRP/d
         ITcn6PYQIpeNF213IS33y97kyuNg789nJekyOJkvMPDpUnwktDU6KkQN0/eLspbzv/vD
         Ersg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588398; x=1793193198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhDg8QClMZJOayDv8bj/xO5vbSdeZvK1hnpn/RI7Gj0=;
        b=Gu3yBFkT++nQHsMnBom5K+pr4ekhGcuH1adgUgpkG6TFUF8rWZ8K9RbC0O+Hts+qf0
         va50jhwm+ko4WSJRG16cU3ln3O7l/XkRsrMNJxPkD6Gnb18UOxgDEHuborFPpXvvE9QM
         pwCjf4MqsNrC1q6WsN9MNZeoOPJ1wF+LT+EqKld2gjNV2RL1xyInZpDBFpF1xmS62HED
         /Zey9/3rj9PJ+GPwkfbR33L9vbudHCMl7xdM2p+k3Y+uguPJhoWPXsVmE3moapa1U2i3
         KZp84eEeAvWPPI5LFk5H7XXpeGTTZ+cEwL+nkOw8+X/wDAKz7kORCIFYEpV/zakZOVCK
         MUTA==
X-Forwarded-Encrypted: i=1; AKwUvBy4aJ+Wj1MQmpa3wo1okKs5bDGqEHprMyc02Yb+fDZcqIfoNhssBOvIh6egJyL7BlU+Yu84DFKNJiq2@lists.linux.dev
X-Gm-Message-State: AFq9FYLAPtmE3j5RVZdo8Xxcb/4nB67cDN51zeVESZZy4icMLCOpNdBQ
	AFTzOpR6U7mIZjCKFBPEC+Ihh8m/ptpSo1BjaRJcmXn0YtbeuRIJ7OcP
X-Gm-Gg: AYBFou3pDy+MCwrt+8efSBgaqcj5cMTq9NfF1GoGInybmGlwWAIr+JsBFQiO2WtBYCn
	R9rtz5yxQT47HjUYeF8TFJDfDBKJM/qqrFAowIv9h8NBaziJS3d5m3ZlTSSz3AL70nX3VQdiDUL
	Vo31LYBn3vGJC/7LgVr2vyvU4eQ5yF6GROvioCjh/z1GqqGB7Hn7HXcuCjDKrMg2QSfYianX4Vc
	9Fsr7spbZFvmQdU58BEEXaNMxn4UXOnUv0LCXEJTsljrScoPYimz1kX/5XO1Vpgu6o/lOmJ+Zrq
	G9GcYaZTbkyLOaEErfxQCk+Pp6aOaB97l8fgzHq3KTXCh6aLONzrgzXJ2NKAPS9k2MZdxKFD9ii
	7KsCFbCk99f4AYiWyDyQvaYWmTZe+OH/knmgg/0dJ4fVLP7epDJIy30FXa6jp6xf6rsJdHJ5fWx
	yF0KdJaanICGwP1Fax/N2C0NzDRnZo2s6JR3pz+QuU+oeEYvKeBSTD70Gf3CRYrYN3sFM8WoWjs
	3SPlFyCO9h3fMaaSzxemCiJUsOm7WwvhUVDPONt0i+yfzYJRpZ4Ug+t2E4hCJBBLhFwxu6araRJ
	Iuj7RilvUMYIW2js
X-Received: by 2002:a05:6000:178d:b0:48e:b8f:f7d9 with SMTP id ffacd0b85a97d-48e2644eba3mr4823249f8f.6.1792588397791;
        Wed, 21 Oct 2026 06:13:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:17 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 21 Oct 2026 14:13:13 +0100
Subject: [PATCH v2 1/4] serial: sh-sci: Drop TE disable at end of
 transmission on SCI
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
Message-Id: <20261021-g2ul_sci-v2-1-b4e038220018@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=1377;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=3weoth6w6Xdl5b6WOfiDQxw3Mye7WCDgh2tqKrLoXnc=;
 b=pfNldyHMgPcqhzkFa1o+cms2Op0v6z0MqVAr8fWkcLhT21/2XnwoWjrKs6qWVj5+gpFwTXWbJ
 sRDd6avqjMtA8nT5XfTmxuB80Ps12Jq+DvQdSjgwz9YuPZJv0R/r4sM
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Commit f06c2a9000eb ("tty: serial: sh-sci: Fix end of transmission on
SCI") made sci_transmit_chars() clear SCSCR.TE and return early on
PORT_SCI once the transmit FIFO is empty.

The hardware manual does not describe disabling the transmitter to end
a transmission, so this special case has no basis in the documented
programming sequence. Remove it and let SCI follow the same path as the
other port types. A plain revert no longer applies because the driver
now uses a kfifo, so the code is removed by hand.

Fixes: f06c2a9000eb ("tty: serial: sh-sci: Fix end of transmission on SCI")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index bd58bbfa65aa..9eb297dbc901 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1036,13 +1036,6 @@ static void sci_transmit_chars(struct uart_port *port)
 			c = port->x_char;
 			port->x_char = 0;
 		} else if (stopped || !kfifo_get(&tport->xmit_fifo, &c)) {
-			if (s->type == PORT_SCI &&
-			    kfifo_is_empty(&tport->xmit_fifo)) {
-				ctrl = sci_serial_in(port, SCSCR);
-				ctrl &= ~SCSCR_TE;
-				sci_serial_out(port, SCSCR, ctrl);
-				return;
-			}
 			break;
 		}
 

-- 
2.43.0

