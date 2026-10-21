Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588403;
	b=3whpuFdomfsBs7snmL/iAfwEk/T7lO+8yfaFPRCuwaI8fjUQF6PS0G+2qfsPMxBIiqmT
	 XaxMneONevN34uXUyRQdYh7uwQG4EJvF5n3xphNvBaK8mdgZ+zD1NLrYHshKVnwfbZ7LK
	 Ut04nnwEziR54o38mzDhpANyi4qCjDtJoKtddlhlzg9rauJSudIyqCHl4dTc4ZHHCNUSp
	 WpOGR06ERY0GGgLLITtyL4lP+cskEfrs31zdHj88ykDwpq01n0/Tq9NdfL9LwkX52uZE0
	 tjzqWQhnP8JkCELQDyl63IfMdnR74dyglkDzCIctX5bf44yO0wrCJhPBl/Ic+fwjXEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=N5RE4VrUqgRrVxPGuEVRRhHI7VFdRUfeZKkkzZJ3khE=;
	b=Ck0gIM1UuQzyKl/Cf35hZQFoZPHtSOYos0W3zU9bkZf6csyQep/SEQqKVfRHK5XaU1PF
	 0yndoqWjFlNlGVoKfKmyiKO8iPYSXybNi7ENyIp3o27zbcSZz5fidQ69HQooQkALfl8fA
	 ZmerrhSzx/f6UDI6Jl0lKO86K/ao/Tpn6+j2xic53GgXpOD3FfEcD0p9WO5gm4hJQGu4G
	 johAGpX6FKZ9NQ1aMr+khwjTMJFdw2oBOqI6EK3mAxTFbExZO1C5V7jrAfRgjLi+D3xOx
	 pGkLYJJ5a0Q6iheXnst0EnGzPAWHdblibzzfr5rxTegOxrgVgwcObGP/rp3+f3I4Zfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lzLrjemw;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02265606A329
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 13:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02265606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lzLrjemw
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso5837475e9.3
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588401; x=1793193201; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5RE4VrUqgRrVxPGuEVRRhHI7VFdRUfeZKkkzZJ3khE=;
        b=lzLrjemw3Eljk2eo3/nZlbOD4PFE9ED/Uul54sFdeWQDfhXmeAiJceO9Cotpu1ZoV2
         XLsc9UHB5J78olwYLtxfhPDiMXQd5BPopl1cjZu1YTWUuONFyJvUlQ3TdNNUZ2ysKoel
         IFNgWyRwnDhM7TGhSqqafXQD2JV658m4ZAl9iAsZ3zhg57wlYDIsFvL2K0Cx/b02R/jZ
         1C9yMls36KvTTxUvCWlBfnSjy4f4/+OHrvID7fAfidxA18llUh/7jUwdrA4USNh9sTHZ
         PNHMDLmPFv9a7YdYXU4t7LkCg9YQg35bFUYIyz/obNvot1pRYvQOgiCBZ39xGHfQEXLR
         xePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588401; x=1793193201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5RE4VrUqgRrVxPGuEVRRhHI7VFdRUfeZKkkzZJ3khE=;
        b=S+RPAYksXl4Zez2tAdfJch7/nkVCEXj7MMwApwjj6st+AvkocA0WZy2UoYM0G0Uczf
         7uu+xsgHuFhHDfs23SFSILOke20iCM9jcNl/+F51S+l+km+v/hcjRhiI36Z4pkt99vF6
         kt08s46ysIZ6YChQ/scF3edXA96LYVlsBaKrjn7Y4DLF+Tma/sBYG3OT6TXMd9PdtbBt
         2SWNrzgfGDLI9WlPXFPAAtwHHvwEP5H4kyTZTmke5CCOodbz0OwnfolFs3ysxBRU3l24
         By1+rjHqJRyGVpKSGlCOFrSKqENxvssdmwrXYc2BlPvUAjhTLQr62ht/aGI7+bxqpxaN
         wKbg==
X-Forwarded-Encrypted: i=1; AKwUvByW6BoVgC7tS03XUTaKJCAbbKeuWKEW8y6mIcyFUTvbRrqUoFyKcm/KggTUOxbiOHGRN0TmQJHk3AHi@lists.linux.dev
X-Gm-Message-State: AFq9FYKrDE/LyhzG/eqRtdHVgzLCezpDoZ0VlcVX37rNlUTYXppgg+H3
	XC+2oT7q2eqI/cdHaGd0qlMZsnXPqFcPzpEzdSzapg5D6BQ3l6goBwtw
X-Gm-Gg: AYBFou0c0RlEVTXxPOWCCKpcn6qvRhX5HGy8FwNL4FXQF/5o+p/qu20HEh22sK3krOR
	CdDT4WtsNsyTY+s5IdlvFwEXOiGopSzETmbPYYDh9yPrUOTPMPLU63Tlv4IlM56j5liIf9t7ao9
	UyiR5b5Q46Gac8toApogNkrnR8OwYuxfDPnAH4ik7QIcVGOYUeiq6/QVOAwVEcExngqikGHwG9G
	yTVdgiDTVMIIisPdLsL5mopoGDdUkKM1ZdmJpcb7+WPp6Avcmg2ohGyBED/fbuMsmkB1HLO//MH
	PR1ubIGgZqaatBMB3EciXKb9JA6H3gfTskKWZgvQFbAVV4KdVcKWYzwwPkpR9nRP4c5HeKoBW+j
	5OwDWMVVxvSwE48O6Z3vHX9EC5sUA5UzQYYKmXRNa9Gm1A1/8MAJRza3GYqAkSumKAceuM/RF3T
	lMUu31r2ppentYo8dXdwr2mOVyjDiKYlIAqfV5J5J+fkFz8GtrNzs/0nqDEzmVGuZwzT5Pu6cKH
	M4u5RIk4vc798lmqR672bFOFJ8s674phDQJet5fAzBLPYJ0G5Wmj1ffSotRRulU+vXzKJOldwOo
	aRYJ3tyczBv0N07s
X-Received: by 2002:a05:600c:6385:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a1fdb0d18amr43127735e9.21.1792588401415;
        Wed, 21 Oct 2026 06:13:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:20 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 21 Oct 2026 14:13:16 +0100
Subject: [PATCH v2 4/4] serial: sh-sci: Toggle TE when restoring SCSCR in
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
Message-Id: <20261021-g2ul_sci-v2-4-b4e038220018@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=2226;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=eBrM0bnW7fIX8UCFI1hlYQ/wtkJYAm4pg8SckFVkEUs=;
 b=exl2dPJM3XU3wI5tFcxqpq6psM/OOHvMBfuNGCmAkHHVsJCMgohqkx0TMdcopVTGQWyvYfu0t
 KyfEFkkCt8LDahY+xr6F+zNevV3lVMvOV6VbljzJgEP0kTpOCw/fEYj
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
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index aa179c787487..993f330e6881 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3445,10 +3445,14 @@ static void serial_console_write(struct console *co, const char *s,
 		cpu_relax();
 
 	/* restore the SCSCR */
-	if (sci_port->ops->finish_console_write)
+	if (sci_port->ops->finish_console_write) {
 		sci_port->ops->finish_console_write(port, ctrl);
-	else
+	} else {
+		if (to_sci_port(port)->type == PORT_SCI)
+			sci_port->ops->write_reg(port, regs->control, ctrl & ~SCSCR_TE);
+
 		sci_port->ops->write_reg(port, regs->control, ctrl);
+	}
 
 	if (locked)
 		uart_port_unlock_irqrestore(port, flags);

-- 
2.43.0

