Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588399;
	b=fDsrW9w4slG3VoGNy3UocWFbJPMr9HQafzrERBYFmJSzsBU1mpEJamScVp4h0bq0f0h4
	 tP5YnXWKBSz18aBRmqSkdaaT04vqTt7ZjZuZQU1fDU6h4wVxggnkzd8ZxromZA87A9YHc
	 BSUc2ALD+58Yq7cL9DnR9zg4RqC7hiV+UmmXRkturrt+X1SCkkg2tHJ2ZLg3hxUPVbewU
	 cN3XmvUYyoVvylVp0aCP/us7rJfT4TQ8ziRGVND7WHM1/NSal8lWMep03BQsF/bil/cWB
	 HOKP3HvCgl+LFQh0X/vuVMVe9sY0vFE0F2w/WhWX1ztWILq0K6BUM5SMMxPhr6nJWaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=o6p3pCo7kCCnsjGIBt4vEqtv3jWVT9ZqbdZWvk7buQ0=;
	b=hcCnDnDpZR9o4yBEo1zWL/FbP+9dNbm/wIaYkDHHT9GyK/Rl9fkFihSQrALTQ8dRs++4
	 HnCyDbWNTTNKWvcUyJ3dHR5S1gg1Iwr+HTfnG2aWVfuVa+mhOkgQGb/YQsfLXkT6tH7EL
	 MAeO+byaHboibeGnnbqsuXwwe7IdDiU8vpAlOP/esgCP7M9pUKn8Box0sd1yT3Nys4TaB
	 waYQaA6P8JnMWT7o+KUH3ljiGzfTrT3ybTlJjQSqE6Mp0+ZkJACPGo9ASAwhbJvxgOBHs
	 pmPXW9CZP2upmDbbnS2BYiKwMd1UfKUE2sol9wafLQ0VuHSgiQX9oPw5XoOWGL7ILEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QPB7aXad;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F9606A31D
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 13:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC0F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QPB7aXad
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e0d885929so564495f8f.3
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588397; x=1793193197; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o6p3pCo7kCCnsjGIBt4vEqtv3jWVT9ZqbdZWvk7buQ0=;
        b=QPB7aXadZz2c23EYY6pPwVQofJ95IFqiygqclvmLI7N4QZwXF0hpAd1xjkWQBNx1NB
         K51jKTQZiiYoGev0Llq2gGgqhtpufBAnyRCd6cC94KxdUP9UItrANMie93gXRzAxf4CM
         VdWLZJfF/bQjV+yRUwXhAmI8r1+V8226194IGOaBXgmQmo9+XbVcRhPKQvVOlKlKEjpZ
         hXIX1DVfdeZ9m0yDWjtHzEVL8ipylLSBey/I34TpYhSlQtLYgtorSdD36IRt4QyV5vgM
         SZHCtUS/7+w88R2ZV+FKCBb2aTHFU3+WURM4BwA6+LCIaQfxn9esR/m3WiRSE8Tb527V
         ioZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588397; x=1793193197;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o6p3pCo7kCCnsjGIBt4vEqtv3jWVT9ZqbdZWvk7buQ0=;
        b=2GVZr3ZdMyiYuU8DwmSAH0rlfS9HvkjGzT79jaGPmdHx8cfL7qh7a5FRVSMRn9dWF3
         mzQQqFNmWswFyqwCt4s9+YHg6Ha0+Ma48MlVFMGEUPKiDj5R1I7FPTFhejphuNO2SET3
         k2ftbgKcagDzZ5Qepe4T5axahAJQTdSbbWa0mKFhsJVjnwuv12jq8KOJIUimd+R1SJ3W
         RuJAkuPLIb0hXSq3qkLontm/HLpXPQXvDePYtVQgjflSm6WgTXuWEGeSaSHwlk9wRyXb
         kdP/Nqo10dgjWEtoY3wY4YbwvMst7/mYeXuuBpauNPjwLQd+ZuaSLEdZg8cxVrY4FXHh
         VX/w==
X-Forwarded-Encrypted: i=1; AKwUvBxf679u67NhQnMHJ0vaJVlu/+mRZ/9LfyeTLLFDtzxdz9uHlz23ygXdx8Vn4FuBTJwe5wCQk9/Xefpc@lists.linux.dev
X-Gm-Message-State: AFq9FYKC0pCQXyPqSZFgoYHT04wGjUR4Sgc85zh3eLR1NoGswXkb/d8t
	aJUE7BBmN4um2E3Xq1PX1HB8p0+sLugS8WlDH4M1YUfX8oaohB3QgGcvJoOVlg==
X-Gm-Gg: AYBFou1aaUAveUBWWa18ezWaxFhlsK29rJEZM7C3+YY/pmkWwnIdqMxGqMMc9c8Rrjf
	qwzpg9gI+Zpdnz7VYqQQVsRESwZTgowokvmHmg7MIIhxs3XHhj/df5JuQTLqW5zOxpw4BD9r06Z
	5szqtXcFF2ppLAZusG3wf0k4yjXvhMcITj5vgjmbI1Ckuwf0uFmmiHQKZIIOe9YWKxxdLSy6Qho
	+9+Dn/qPRlBOVItUy8XUmydKurzybOTzgwi32Keg3bUEy7Dz+BbS8Q/4NN8xsPGnpg2y5pgFgj9
	OdkYyXCan3t/1tfcRpvvLafe8xBvEwvHSdDRrROL8CU5hwA11hTEuQsZw+MV026a8N5Yh3EY1F6
	fzXnThoZZjqreShBxWTT65ifwH/meVsQYmdaspkkKt3cNQa2Ztq0XldMFlLaq9e5zRFJGI6hpCW
	qG2HRSllqPkQLSeLgyCWtbPjtWntBwNfVi+f+HxMQOyC3vpBqxkOhtjWywlTSgHbsEnG2MkIYkw
	Tl6bXQWer/NN/9VaqEhyN6B3FG64yfP+JxQ4kbfYipd6SQBO2UFxEHwMZp+0pykiU3XY4RcQD+Y
	SL5tgwsTHtZ7MP1V
X-Received: by 2002:a5d:584d:0:b0:48e:28bd:e010 with SMTP id ffacd0b85a97d-48e28bde4b0mr2656500f8f.7.1792588396895;
        Wed, 21 Oct 2026 06:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:16 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/4] Fix transmit handling on SCI/RSCI ports
Date: Wed, 21 Oct 2026 14:13:12 +0100
Message-Id: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAGm62GoC/y3Myw6CMBCF4Vchs7ZNW+TmyvcwxNAywhAF0hGik
 r67lbj8Tk7+DRg9IcMp2cDjSkzTGGEOCbi+GTsU1EaDUSbXyijRmeV+ZUfCRucqxyazGcT77PF
 Grz11qaN74ufk33t51b/1H9GVLpROK3ks0lKVQgtLwyLbhuXwOdtZehyRo9z0gDqE8AUHqvtvp
 QAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, Au Dang <au.dang.jx@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=2681;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=UKJg4b3SfR4kpP4oWIhEOgnGd98EBh9C3fKOCKd2yt0=;
 b=1NJHANvhrv+QQW8+t8rXZ8HELSt/2/6SELbVExz3/VnizRqtcgP50eKAy6UNf7GUmJoRz4YZ+
 q/+dgXcBcwsClSnKfz2cjoBWXVbYCRRGKs/PsjrY89rZYZBKgXjI3nE
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

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-coco@lists.linux.dev
Cc: kvm@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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

 drivers/tty/serial/rsci.c          |  2 ++
 drivers/tty/serial/sh-sci-common.h |  4 ++++
 drivers/tty/serial/sh-sci.c        | 45 +++++++++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 15 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261020-g2ul_sci-b610606ea5b5

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

