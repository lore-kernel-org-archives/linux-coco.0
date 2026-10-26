Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013823;
	b=L9e5Kqns3D9XH6W/umw3ie4nFjexCdLTRu1ea84tsPu45mjeGhXv6rQr6dmrF8oRpWPq
	 aEC3ZWUE+vfAcLGdf1XnE6tXDCSg9tV5q85Ic1zWvo0gXcy73XX8TKzpb5muHgtdmaB+f
	 DWAzey5ArP4AGmN3zsCPcqbrcmgsTSnTBGrBD0Soa4YxqLgXxcVLHYwfw4KomKZFOM+0T
	 nji2Kw3PjitWEEi+RnJNbzHltaYY5qNeAkzGtEsBciV/lv1FLDMy9BVZQO+CsADHPIW9D
	 49nxnV7Pt5oO8I5tRQkLhTEl33/09kxTxBvqPB39kk+Unlw8a1YZpuV1i1Rbd09Q92w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZVnVrRYLB+qKKrukA39OJ5KX7KFcwt/Dh/drOtJ/Eyo=;
	b=mphs6jh0STiZ3LxhJnsBMa4oclZwEFMTgWcuRK3drAbOEuKVJZhgzF6kfxnYdC3KCix6
	 7M1v9NstDtIttAXikLhvVSFEJNdqenwgiwZgEP3n7DYzaPj/p6WuXHIRTuJQoEE0DEty7
	 1ToRl6FsXzecqUEfPkdtT3h5FRd6ksxFVKtXDKKfSNFPpvoNXXZ3hgV/nrk57W6VdSDIH
	 DEh1F79WZVsKZxwUMWebV/DjX/wPHNmHcWEeYI2XOgEra2uro860RuvO+YigZNqP/NqYS
	 W6MQ4sYMEOW0Tv8fz+TZp+kCvL5dmS/xZjFSjhxPtHyexD0Dz3U/eu3snecbVcGuFeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="a4PZ/hTL";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EAE60A2631
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 11:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EAE60A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a4PZ/hTL
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1674903f8f.3
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013821; x=1793618621; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVnVrRYLB+qKKrukA39OJ5KX7KFcwt/Dh/drOtJ/Eyo=;
        b=a4PZ/hTLsqrYHwM6R2khy5VyIT/ppza8lBYKxD/YVH8ikAGjEBFw48i3p1z/PqXCMB
         dy69yXLNssQKgytXZ8b0b3chYNDIKD8VGN5DnoXIk3C7tAoiap1DPq8Ie4zVc0b2x+ju
         Ohi16RnJGDiXr5gtgNCshJKW0g5AVyBqt6aWqntlR0cQij7Y3icvP+vMcf9nJYA9uQAO
         QXLkArP5cDqT6PEZbmCMhQsaB0rU33GGf6Xn2y/udU7HWGESp0/mNRDCUNCK/NZhLL9A
         GYOSypW3iBvy2zm9675FltClCVEO7gva+NK6v2N9Gufp40D0fdcr39X/4sNA5Oj93zS9
         TrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013821; x=1793618621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVnVrRYLB+qKKrukA39OJ5KX7KFcwt/Dh/drOtJ/Eyo=;
        b=XFqxFeld7+HYl4fs4vAK7ZinUplkgrFI2mSnQ96zLEPno0jVghES1+5QasX1lZuG3L
         j7yPgGqsFHoCTKd2GT2y4iJxYXh9Zbj/A1O5mEyO1WXPlIFvxhyfcwnp5RTx5YSWnfX9
         hngIQK0CFyXv3LUpyhXBL7dSR/94t7ozwy32+nCqszBPesAIqkVVAut8zDhIwXF+vua9
         L4XSZBujFOKS7hIpLaDdFcVJ8vG3S+VPlfVLpCLBqEhnBBWFLo44EHYeyBrvP1rBEVer
         pFJMjBR8xse5i9Yn+mMebanBKJHR/FAtRwqc0k2yWqOGzf0YeMJ1l8XXGvnzsnsFnZWu
         fl2A==
X-Forwarded-Encrypted: i=1; AKwUvBx0dZ4ci0GkJm3ivI4Ui8kPM6FxB6GFYPogZaI9+VNIdwa9qbuLE1uJOMRAVsq9W0f7dBNTCiW3X2yT@lists.linux.dev
X-Gm-Message-State: AFq9FYLkasW/oWdzJiNXE32pUHAzPQw8XJLN7eTh+qby2M4bycOJol/p
	df4leQhO5MgIrQWhCbmKhc8KslQS8NrYmCTgchs0RFC8ZkvJSTnbRBzF+C4bDA==
X-Gm-Gg: AYBFou3hvcosgDLsErjwdHj7NM2b2NWxkWDQ9+fcgrCnXZ3pEhjB43ZM+xpAmkfZc3V
	zdf9RyVM6MY/XRpIKIQqh2iGG+olfcDv2A0xfdA3Fy3szn4d+Oq7zKNdpylaX5kmDCMcIIjUd3X
	d5IAUGy6i1y9sPtgb/FqUahSYy5/U+gUu+uK9CRbGgNsSbiUEnxhDm4qkI4JGoA7TAqqiparuDm
	k9DQzzhmLoKWiEBSpDKFHIMUcExI3haVkjfoggvnWwI5NNlvnlLHO1IGLGJFjO8/izxSb5xk9/G
	y3z+VDaueLHuRLjVCkNBC5oox+UyzCGcqMFl7cYtTuP1lOE7iEY+4K2kgslHrgQgIhx9N4EVjar
	JYe7btD6MryGfU7i4llUFY3FoBdsMVI974Esyw5c1YbKFaPmQk5CA+v8+N9amZYLcrmyKnO/lHC
	Dy2rEm4uhf9sxXk1YFn/Nm+jkvS0MEt36iQpQFzgb3HoO/s9esQ+7zb+VHH/OnR3X8RsGIlW5tv
	B1h+sYDOEH4EmzVPd6Enjj4M5zifsg0uwrkp9237bVsWq4Aun2EYiAh+wtRI/VKVVvna8LcUoij
	U3ELhlTR43z1DJHS2KSKk+alSqAVTXmW0L9WcGc=
X-Received: by 2002:a05:6000:2408:b0:48d:f5e7:bb77 with SMTP id ffacd0b85a97d-48e3eab5a61mr14950329f8f.0.1793013820776;
        Mon, 26 Oct 2026 04:23:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:40 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 26 Oct 2026 11:23:36 +0000
Subject: [PATCH v3 4/4] serial: sh-sci: Toggle TE when restoring SCSCR in
 console write on SCI
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
Message-Id: <20261026-g2ul_sci-v3-4-b3097163edd5@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=2314;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=05m98a4wCXyibckYyionDlpRiTiYXuxhqxZ1PhGSbGg=;
 b=bKAOy583UIZlEm+R8TR5tzfEPZMqzZolU5PmQM9oM2xSnSvxn5og0ZRbtXW+xozXhpatxmnaV
 xcrrVCu8raAAVgRgpEfD7LcDkqXrqE9q9R84hWIaIqRheB6OTl6ciuw
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Au Dang <au.dang.jx@renesas.com>

When SCI0 (PORT_SCI) is the system console on RZ/G2UL, the board can
hang at the serial console output stage during boot.

ftrace shows the following sequence:

1. sci_transmit_chars() is draining the TX kfifo through TXI
   interrupts with SCSCR=0xf0 (TE=1, TIE=1, RE=1, RIE=1).

2. serial_console_write() runs in the middle of that drain. It saves
   SCSCR=0xf0, switches to polling by writing SCSCR=0x30 (TE=1, TIE=0)
   and outputs the characters with sci_poll_put_char().

3. It then restores SCSCR=0xf0 in a single write. TE is 1 both before
   and after, so there is no TE transition.

4. sci_start_tx() is then called repeatedly with SCSCR unchanged, but
   no TXI is ever raised again, so the drain never resumes and the
   console hangs.

The RZ/G2UL User's Manual (section 23.3.6, "SCI Initialization") notes
that changing SCR.TE from 1 to 0 or from 0 to 1 while SCR.TIE is 1
generates a TXI interrupt request. Without a TE transition, the TXI
that would restart the drain is never generated.

For PORT_SCI, restore SCSCR in two steps: first with TE cleared, then
with the full saved value. This forces the TE 1->0->1 transition while
TIE is being re-enabled, so TXI fires and the interrupted drain
resumes.

Signed-off-by: Au Dang <au.dang.jx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Replaced to_sci_port(port)->type with sci_port->type in
   serial_console_write().
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1a4d9467d2be..35a2f721bf56 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3456,10 +3456,14 @@ static void serial_console_write(struct console *co, const char *s,
 		cpu_relax();
 
 	/* restore the SCSCR */
-	if (sci_port->ops->finish_console_write)
+	if (sci_port->ops->finish_console_write) {
 		sci_port->ops->finish_console_write(port, ctrl);
-	else
+	} else {
+		if (sci_port->type == PORT_SCI)
+			sci_port->ops->write_reg(port, regs->control, ctrl & ~SCSCR_TE);
+
 		sci_port->ops->write_reg(port, regs->control, ctrl);
+	}
 
 	if (locked)
 		uart_port_unlock_irqrestore(port, flags);

-- 
2.43.0

