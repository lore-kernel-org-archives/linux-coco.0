Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1339D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:19:14 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1a6715ee82fso5271465ad.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942754; x=1684534754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fg2apWNkO7XMTsfLYU3rTZlWorsx4wHesUuN9ZGrN4=;
        b=g8HGuVmDd6hY+lMcoFR1p/zerf1IBaVcRH5kNxjG8cnb+FPy7JiKlP8xFMLawWOJHX
         8MxTVIaCIdLr6Ccp55qIHAejxBF5J0nZ/QJIh66AwlqKb1gy2DUEWlLH+BzQR5o+T67+
         kKooYcWWcij0NvxWxb05YPJbKR63uF1OQBv02Tg7GGtGx4ZWKWirSARZVPhbGcCUYnPY
         6NUmTXcNFvsNN28a27iL5OcLCC76rPHgwAm1ISi/TugfdDtHR47w4bW7o0MafWBEn9ey
         E/SyyfLa4ioudzzGIw9EwQwg7+Rg1abk6H2BVftGz286pLz6P5MCHu2QYJA07cO/VmFG
         Q9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942754; x=1684534754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fg2apWNkO7XMTsfLYU3rTZlWorsx4wHesUuN9ZGrN4=;
        b=QCWvgyxzg58wa3sbT2+0P1xGXwiErW0fuA4WSdlWZkWdJ9hgH1h5ptmc2b1nnqJwgo
         mOghPT5XVsv6EZSvfaFGJLjJ4uYlPrEpPawA2Gq0lc4Tb/oDzDjwfwBTnx20soxNlYCj
         SMB1GMexYDYEW6lS/hGpycYhrKWhSfLyliDYr9d5XZwnPi5FcRjirY1hvyLzKXALpcaS
         py5MNDB4TD8KzExgXzXMymq7GdwRC7UwZPe06g7RdAysJQ0IB5fB6hsb2EUTeTIDX/gu
         I5vvTf88MUiAq6G4vNEIsG20pE6gFlSVxzveGQHFXY3PGjK8rKcqkYDMz8gW3MJjyE0Q
         Nkbg==
X-Gm-Message-State: AAQBX9fM9zNgHDz9swsNmPcS0sdW7kWtP7HmwQrl+d+g/uwLOEAcfkg/
	K3e+z5Wh8PTsx+gRdV7Ph45ODA==
X-Google-Smtp-Source: AKy350bcbgE/EJ3Ej08OUUDHS562dStL1nY59dRLyQva3UBkO8qD2X/slMFNk57ZH7aSQKcUf51qPw==
X-Received: by 2002:a17:902:a504:b0:1a1:be45:9857 with SMTP id s4-20020a170902a50400b001a1be459857mr6646673plq.1.1681942754165;
        Wed, 19 Apr 2023 15:19:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:13 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 47/48] RISC-V: Add shared bounce buffer to support DBCN for CoVE Guest.
Date: Wed, 19 Apr 2023 15:17:15 -0700
Message-Id: <20230419221716.3603068-48-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

Early console buffer needs to be shared with the host for CoVE Guest.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/tty/serial/earlycon-riscv-sbi.c | 51 ++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
index 311a4f8..9033cca 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -9,6 +9,14 @@
 #include <linux/init.h>
 #include <linux/serial_core.h>
 #include <asm/sbi.h>
+#include <asm/cove.h>
+#include <asm/covg_sbi.h>
+#include <linux/memblock.h>
+
+#ifdef CONFIG_RISCV_COVE_GUEST
+#define DBCN_BOUNCE_BUF_SIZE (PAGE_SIZE)
+static char dbcn_buf[DBCN_BOUNCE_BUF_SIZE] __aligned(PAGE_SIZE);
+#endif
 
 #ifdef CONFIG_RISCV_SBI_V01
 static void sbi_putc(struct uart_port *port, unsigned char c)
@@ -24,6 +32,33 @@ static void sbi_0_1_console_write(struct console *con,
 }
 #endif
 
+#ifdef CONFIG_RISCV_COVE_GUEST
+static void sbi_dbcn_console_write_cove(struct console *con, const char *s,
+					unsigned int n)
+{
+	phys_addr_t pa = __pa(dbcn_buf);
+	unsigned int off = 0;
+
+	while (off < n) {
+		const unsigned int rem = n - off;
+		const unsigned int size =
+			rem > DBCN_BOUNCE_BUF_SIZE ? DBCN_BOUNCE_BUF_SIZE : rem;
+
+		memcpy(dbcn_buf, &s[off], size);
+
+		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+#ifdef CONFIG_32BIT
+			  size, pa, (u64)pa >> 32,
+#else
+			  size, pa, 0,
+#endif
+			  0, 0, 0);
+
+		off += size;
+	}
+}
+#endif
+
 static void sbi_dbcn_console_write(struct console *con,
 				   const char *s, unsigned n)
 {
@@ -45,14 +80,26 @@ static int __init early_sbi_setup(struct earlycon_device *device,
 
 	/* TODO: Check for SBI debug console (DBCN) extension */
 	if ((sbi_spec_version >= sbi_mk_version(1, 0)) &&
-	    (sbi_probe_extension(SBI_EXT_DBCN) > 0))
+	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+#ifdef CONFIG_RISCV_COVE_GUEST
+		if (is_cove_guest()) {
+			ret = sbi_covg_share_memory(__pa(dbcn_buf),
+						    DBCN_BOUNCE_BUF_SIZE);
+			if (ret)
+				return ret;
+
+			device->con->write = sbi_dbcn_console_write_cove;
+			return 0;
+		}
+#endif
 		device->con->write = sbi_dbcn_console_write;
-	else
+	} else {
 #ifdef CONFIG_RISCV_SBI_V01
 		device->con->write = sbi_0_1_console_write;
 #else
 		ret = -ENODEV;
 #endif
+	}
 
 	return ret;
 }
-- 
2.25.1

