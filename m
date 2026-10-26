Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013819;
	b=Gx1cXDGbVZcar4GDcUZRsjgTii6/i5ZTyn6ibOOMUD0d1MrqgpExGtbmwUZhp5S7elST
	 PwzXtl6uihiQVXoMZw2kRi5mLvvotQw4rsfGvzXY0/ksRG7m4QKvh84FpoMFM3IMLaVYb
	 wWKTqKCtc9G5G+dCEz92eCzCcTaHjZe7iCz+uvtJNoF4VPEK2LuPd+s3AZKNKFG+64o3z
	 Qq299q43RNAuuK9xoCdqOeOLKwMHJDgkLbSsH0iEG8sZQ1KEqN1OwSYzYYGaOwbGcL3Kn
	 nVaSs3vx16n/1XBY+nMOf20uHHlDheFYzQr7cv+9PU1qprHgYWfWUvIE8t8UZCOJQyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hi7Sr5AhOZnPq35jxQMZKgyIjGd6gqHdfbAHtpf8ZRc=;
	b=TtnBceg75+mqMnWPDpEmsuHHwRjVhYrQYViTICavx2H/8KQrPw5wVkM7yVvetHHLrGcx
	 S2SJxlNZniVMg1cvkmexWwkHVA32bHjsaVPCo3Sc8DC3rxxqLZyYDyzlxtcCRdiUAqs9+
	 kA5no5K3RnuUOS2PL1J6sA9fIb2BSXR8ybwTNOoebCAwHiCFi1lI2E748HwfwerBObLV0
	 A6QlQBbl0JQ4x/kmZeBBeSZPVpnKgRwrKsFODuJtRNTOXG4AwCldp58yioftyn6aTDJkc
	 2C2JKnBu9sMXe7m38bcfTpYWlHnuSLxDbE0oHgIyz5n7tgwzAU9njexV07tMMjnCszg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ZCEi1/a0";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC38606A31D
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 11:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC38606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZCEi1/a0
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so5341225e9.0
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013818; x=1793618618; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hi7Sr5AhOZnPq35jxQMZKgyIjGd6gqHdfbAHtpf8ZRc=;
        b=ZCEi1/a0ly2oyxmEqRQBTJy6zm2+VW5H5zZB9HJqGlqMDqYqKSwqpjb3108kLE2uTk
         nPxwK1WuIRb9HvVNs8b0+P2TwwcquN+A3435/sjcwbiOQKh/wW81JG3AbO0aecwaMDwh
         0heA92ZSYrLYOjfutfmZmgCmb5Di/8RJ9j7IOaroeZVNKpWCJwUdtwEFfu8aie6PpmQP
         cEJoYFFQXC47ZFBCE/jT+t2sSTnl1HM9D/vncD02bY1g/Y4MdfeYPuKYBRCT37dpDqO4
         E8Ce1GNqW66thJnGGiOIjL3MQ5mJkD/ouFRlpi9gCxj2m1O4GmuvJsHojuQyVhpP+GiU
         HAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013818; x=1793618618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hi7Sr5AhOZnPq35jxQMZKgyIjGd6gqHdfbAHtpf8ZRc=;
        b=YanGJIuQFrfqpezzo8qgVq9YfpW0LC4ImzlHKxSbOu6n/5zMKItP4/ZxltfuGvu7y5
         qX7hb+bcsnjNF+ueE2q3xQSFUR3Xhkgwp5E6t9jFCngNgviuCFafbyGVhVLEXpwRLELQ
         VVUghuZtMpNCyv1v3H5wFqERR6rW90H5YZDu7gLirQkAekmpKnqDZFQvL1//IQMPACZj
         FnI+FjoJwsz9VYgyqBJJ+1b0/m0NfdADzsCrXIVRghnsZ+mJ48f5dRP+FILBMcx0AvS/
         h7KOIMpwkGa+edm9sa5FbL/0cjrURopa++DMheuwjBB82NpO/7XDsWdF3ygk9VvxPntL
         /pSQ==
X-Forwarded-Encrypted: i=1; AKwUvByB3Bl4Vj7nU8of0Ut7yemhgTyNrw1VwkBbnAhfAU33qY2GRKcC3C348yPnpP2EtD2s9ThnLKwbJUMW@lists.linux.dev
X-Gm-Message-State: AFq9FYKW4jsCd1DZ+I119uIYlQp7X4Fx/4w/dYtK/dL/xWhzxI6+KUg0
	15R1zHph9AOPfaHIfn02WWkWdLynyv9qP7/PuM/A3nyV0h+n5sPHnUWRfqQUjQ==
X-Gm-Gg: AYBFou0VxxNseLk6iXKiaf+Xm4a5qnrFC2pGD69kDvtxwGWLRFfGDWL2mVDpzF4s2wy
	dJQM1bmHVxeI6gFBXb5FThAdYSt0RM93wQg1Ycq0iRpXv/yit89eLkqNUl+Yygvzcu2kUFb1BfP
	lV9xXjhavxLb8DSZBcuKYub15eGYQUwQ6tm0YQJi/K85tfLd4JZcjH+x0XSQIaXk3UKOL+NdXt6
	sZUUzCmHlWXxlv+9tgObqCoE7GER/MHEb/tvrReSDUvg3G1ulkskKdRwJJZOJ+Aoadp6+4ramYl
	xDpJCNY59kNLhq4sN3rjif98kmo4z+nLg9+jnFT2G8hIVRGvCJDRpJq8P0obRX6uSGahTHHxkC3
	5k2UwB9PfueNhQOSsf77ezf8ftIT/Kg5MopKqDlDYaudshQQ6UW10wCfKe/MI3faKrESjqXnXAh
	BOm+0r28MU0AHZNxC8Q8Kso1bnlyDnmXu9vNG4zCamoV8Y62Kqzrk6SbTaY2KTRH0jEQFYRi5ow
	+QANwOGp6cievNXcelyk/V17nSuHN1LI2Ch6roVAPaNnEd4zL3ydK7aeCibRlqeDxoDnDFEJWIq
	7abpLWO8axlUjpSGICE=
X-Received: by 2002:a05:600c:80ca:b0:4a2:5ef:1400 with SMTP id 5b1f17b1804b1-4a35ac9a7a3mr79652025e9.12.1793013817664;
        Mon, 26 Oct 2026 04:23:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:37 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 26 Oct 2026 11:23:33 +0000
Subject: [PATCH v3 1/4] serial: sh-sci: Drop TE disable at end of
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
Message-Id: <20261026-g2ul_sci-v3-1-b3097163edd5@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=1401;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Ii4p8OHUuRr+409dJC7XNZ8wHyl0UhxZWbqcu7AjCfM=;
 b=QPOwAoyUkoWS9Bqp2w2X70DfqejfizPDZXdsQkJEafZxIQD29eClU0HtB39i56Y/RJtVqGMco
 7idJP3hdNJxB+CdRDa70bI2O2JYk8pvtPqPW2OopCkZ4Ge+olw0piyX
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
v2->v3:
 * No change.
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

