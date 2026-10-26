Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013818;
	b=tOasbKtbeawBlvnTpuYanSI1vutn8gKKVwAO0/AJSZ+GIIa2FkUTeCE2WDQyXjJY11jz
	 SghgHbgUUQgGzbnJKjVarKJnroRqIqjHGdSSWX9zNqyN3+ZelRy87SfzUzP0D9kXQo4Pm
	 gk1nXxG0ymW7pNdBejPsDY2Zwc4hkPf4Vcjh2AP3zJEi3kBbuoyUE38u7gPVydqegddg+
	 H9CUfiY9Wbz14GHDH20oHfestYAWx3KY4lPaTVnbYbNCKrHODyNbf9J+WX8gCsFF2q7Q/
	 neXG65I9wFw9Tn3fZvW7k/SYNDC7HL1bB02md/T+MigQwvF2/FKpkVFnxa1JuZQE0vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ABdqyAeHZvZveh3ZqFvCBY4Fgn7+If+125igGtBDhBw=;
	b=zqWLG8QYHyZ12DMGNO7rGPQCia/sTiDiQBmd0jvOWKcwwzjova/X63XkhHAPX3aNYt3Z
	 BCKd5Ry3wbE8w1oMVk9LtGrLUgAgkghqP0Dc9rG6fyYiYJAt/ErzZY0E4eY/8Qg/l3LUr
	 baqWUqJyuMrWVy9UXWK8EvVJ2qqo4ytTbmxXFZENlFFM4pMOiIoO3m3LjbFYoW1S5J3yN
	 z+rAy6STQvHxommAIlQv2xoMQ5E3cLsFEIKEJ1H6DBJebxi5bBemEpZ4+0Z/sesjlpg2E
	 AE91xD3kTu66x4xbRbywWS8nPxhbwm2AbUEHxuu/DZQaRGazbXzGWk1pC/v2PSUN3yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jrG2EVdN;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35481606A31E
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 11:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35481606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jrG2EVdN
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so17437595e9.3
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 04:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013817; x=1793618617; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ABdqyAeHZvZveh3ZqFvCBY4Fgn7+If+125igGtBDhBw=;
        b=jrG2EVdNxIcvHdagXSOm2hhT7hlpxgGsrMCK+SE9r7Dz5R1/ZFIwww76oxYri3dr/D
         Hmuz49FrGxejT4D0cX0qd5rx+LQI6N6tNF2pv6fpM3MTY1gpawoXq5QQMUcbYe+P/0ML
         Ix4A7JFkD8cNRGnYHxYWYx9FVrZtA6JjbuP5Th9pqUBl8AbjY3gXCuaSFuFlbtmYya/S
         JPTwXHc2G/4bE3Y1Us3kd2VBIIawgIyFDi10MGS9fpFqnwZ/IJBFY8urq/aVBuBMrmmP
         bQ91qhvsvpRsW5V6NRH9vctSYL4gu88jrGfwU0U43/1Nrig8XjirhGTUXo32lb957Kyo
         MNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013817; x=1793618617;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ABdqyAeHZvZveh3ZqFvCBY4Fgn7+If+125igGtBDhBw=;
        b=fiYmCIvnMcgDesvNk0f5kwKEF/f4ya3hGJkJnh5c84x/r0DBM17KT5USaOWa0VX115
         FsSgWG3OwkJPITUMowoUWWXcI3qtlAv+/i0aF1E4OaLONmUH+ssxGKP1bqYyDf7hz7tE
         tjvrpp77f1x+WETCaPphCqZFJN1Q76VAnVTlGZN0B9GEROCcSH7TY07RuMaV2feLo6sW
         MpJyYS1xReboTzrqd/58a01V8wOouBTndew7lV8PMYwDzBVVtxRrf8IIluyXjfYKfrSD
         S829otouu2uk35sU4hUYXp3VUmTGetEdk7S8nAJ3cTt3s7c9rc3GF3Ww6qpj8j2b5oRh
         y51w==
X-Forwarded-Encrypted: i=1; AKwUvBw9Q6E7fl96+TJnexWlhXSpIeqRwPgo/huN6qeCScJddv8yJ8rWOPsWVtrwqxOm8fEhqSWfmzJMSWch@lists.linux.dev
X-Gm-Message-State: AFq9FYKjdtPNA0xA+jrhYlAWd+dEyfJ/2kUkHCCCxcWmsLbHmL+IFCgS
	YlW0BmEmwGunkwxJwDL21CjeQnIo1h7QtiwZTjkxRzwpJbMASQr925W/XJTWcw==
X-Gm-Gg: AYBFou3PwEE0Tke8mzB5vBelR0xOgQOZYq9roT8UrLI5fD5hV4npetLQfcZz2uNprlF
	OroZVJFDJ/1Z9TjXEBvy2qOfWqIR8Rd3G5SY28S4/FXnii5IMDvaAW8q/K1AthDprJZPQ69K6FR
	YIp9SkMvcjWG60pPFqlHKy5jFpS1rlTnpwZBLH1c2glxINFrkrBAyl+eatafcmi05kapP66e2yZ
	LKIALG7lMfIqCEmONWI8gEVM37pcPDOTSM+qLYzXia2+ph+7FFdslZ3yn9qWe7i//qOanKgEhAT
	1AnK/r03TMkdj/FSbT7nLcBMo1XSrG6914pvtQVg/lv7Slgjjxl/H7VC952KS6iDbkNfRlG9qkk
	xh30JDvWFXl81276NmSR52e8zhkY/LcMWcQjNp2hfrMIgSC9mjQvhCh7eNdDfqQYBb9qN269caO
	1x2Wi4is/UR+rZZZ51aGJGMHzHddUvH0KRM0XiiBMVVlsnycWT77pQC7VCT8Ay08GTixNOn2dhU
	wK2UCojActs8DH4n3QARCKO1ykXKJEny4K30GCeKlh82L6nts5ONjNCLgNOi/88FA43Xyl6ZUcP
	TLOBvgmQQgMGw00CQw==
X-Received: by 2002:a05:600c:6098:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a35acc431dmr111151135e9.30.1793013816492;
        Mon, 26 Oct 2026 04:23:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:36 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/4] Fix transmit handling on SCI/RSCI ports
Date: Mon, 26 Oct 2026 11:23:32 +0000
Message-Id: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIADQ432oC/2WO2wrCMBBEf6Xk2YTNplef/A8Radq1TdG2JDaop
 f9uWgQFH88wc5iZObKGHNtHM7PkjTNDH0DtIla1Zd8QN3VghoCpBATe4HQ9u8pwHTiFlMpEJyz
 UR0sX89hUx1Pg1rj7YJ+b2cs1/UhkITOQqhBxpnLIueTadJOoSye610GPwlJPLlA13Nhq8vizR
 vm94JED1zGByhEBZP63XpblDbRAkubjAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, Au Dang <au.dang.jx@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=3074;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=zW64mN/4d2OmJaD7t1D7UB4oZpTj3P+t9X3dcAB7rtU=;
 b=gOp99iXwRCnJN0msXpKCv/GRpEYHrf7Os4oduYopAncMX/9qUjdeKcRQHas85XQ62sv8Yls1h
 dADbeEyGwleAPP1Llu7XjfmkxHVqzQXltxEDw0YYs68pre99kVhVnLC
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Hi All,

This series fixes several transmit problems on the SCI (PORT_SCI) and
RSCI ports of the sh-sci driver, seen on Renesas RZ SoCs:

 - Patch 1 removes the code that disables TE at the end of a
   transmission on SCI, which the hardware manual does not describe.
 - Patch 2 stops the TEI handler from turning the transmitter off
   while the xmit kfifo still holds data, which could stall or lose
   output. It also covers the TE handling that patch 1 no longer does
   in sci_transmit_chars().
 - Patch 3 skips the software clear of the TDxE flag on SCI, since
   hardware clears it on a TDR write and the extra clear caused a
   spurious TXI and a duplicated last character.
 - Patch 4 forces a TE toggle when restoring SCSCR in the console
   write path on SCI, so the TXI that restarts an interrupted drain is
   generated. Without it the RZ/G2UL console can hang during boot.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v3:
 * Updated commit description for patch#2
 * When the port is stopped with data still queued, the transmit_chars()
   paths (sci_transmit_chars() and rsci_transmit_chars()) now also swap
   TIE for TEIE, as they already did for an empty kfifo. Without this, TIE
   would keep firing with nothing the driver is allowed to send, and TEI
   would never be raised to complete the transmission.
 * Replaced sci_tx_interrupt() with port's transmit_chars() to avoid
   lock drop race in sci_tx_end_interrupt() before TX handoff.
 * Added missing has_tdxe_auto_clear init in scix_early_console_setup().
 * Replaced to_sci_port(port)->type with sci_port->type in
   serial_console_write().
- Link to v2: https://lore.kernel.org/r/20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com
Changes in v2:
 * Updated commit header and description for patch#2 and #3.
 * Take the port lock before reading the control register, so the
   read-modify-write in sci_tx_end_interrupt() is protected.
 * Extended the pending-data check in sci_tx_end_interrupt() to cover
   x_char and a stopped port, not only a non-empty xmit kfifo.
 * Replaced the PORT_SCI check with a has_tdxe_auto_clear flag in
   struct sci_port, set from the new tdxe_auto_clear field in
   struct sci_of_data.
- Link to v1: https://lore.kernel.org/r/20261019170139.473808-1-biju.das.jz@bp.renesas.com

---
Au Dang (2):
      serial: sh-sci: Skip TDxE clear when hardware clears it automatically
      serial: sh-sci: Toggle TE when restoring SCSCR in console write on SCI

Biju Das (2):
      serial: sh-sci: Drop TE disable at end of transmission on SCI
      serial: sh-sci: Keep TX enabled on TEI while data is pending

 drivers/tty/serial/rsci.c          |  4 ++-
 drivers/tty/serial/sh-sci-common.h |  4 +++
 drivers/tty/serial/sh-sci.c        | 71 ++++++++++++++++++++++++++------------
 3 files changed, 56 insertions(+), 23 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261020-g2ul_sci-b610606ea5b5

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

