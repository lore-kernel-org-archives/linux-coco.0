Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9B3B841F
	for <linux-coco@lists.linux.dev>; Wed, 16 Sep 2026 05:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535161; cv=none; b=nf5JQh/8G1ntTfJXsemprSB1ROXqxbS5/kqpZMHqY8TI11UKWBw05FmHL1MoxArBQOh9yBhJV45Ngfqh1QYtbWFtb5KIWWQtVE4zOxAgU75n+r3AqNGoyoSOybKES2q/6GVboIn4p4ybfcxJtatnTctq4BIrRzfY1XkpgI6hmw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535161; c=relaxed/simple;
	bh=LWc2s4qZvBb3TJVfltvRwFaklDcNXyLXGRlUr4C/OwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E10AucuZfy4arc1aZn0dGV0j9IS968P6eCl7Q8zIcXIk2dwxBFMZddKmCQ4+aKGtUGnz14pFNwd9u9g30EB9aj85cVnZDqtoGzd/9HowxHMWSv5/i4dXVkhsagF9CEuIP4uTUrBNkbe/rSYIqx/bzVDdcDcGKG/n49wrMFOOC+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dPD93Rny; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dPD93Rny"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-39de8addbe4so1133365a91.3
        for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 22:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535158; x=1790139958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6awU6L1NSAdZve1Go4DAFmiBVEoVbQdcfNtuUS9ma4s=;
        b=aeKyGquJmZ1Yx+QwuIeB2rHI+mCSv7ONuuS9GUdq4FAzTgcZ/BIXZAxr/HoPBZ0xxW
         GT7njS+7UKTbrC5Jbgc0KsyfZo3QPZtIK1HCDDSxaCoPtEPegkD/Z5e7jEkYf0JK25KR
         r96IlvRiSrssbn0ecKi65poz00Rb2iWSWBNx7cqdjc2KvuVa9VMHr6G6FZdeVQsGAuUQ
         rgY7GPFBRc0Iim+TqVMleSECeaX0IgFi1O4WyChMyRfK7ewrvmvXAcerzRGp3mif6F7N
         d1taLc87hBt9fh3cfexEizHGvygJHrO4iB2CrOGDhpTvrNaSh7Bb7utmMQaRRVZfR3hL
         QQVg==
X-Forwarded-Encrypted: i=1; AKwUvBy15zUQ85VBEB5s7FrX42kVFqEUSrXNr+A8D/tqYqA2tz7uxLdO/ncheJ9KKY9hqBXuK/UhOegp+QU5@lists.linux.dev
X-Gm-Message-State: AFuF++loZrVBGZen9uN2htgnGT1h6FdJn1ypRwZ9v3IZM2irHvSq72WN
	CbNhQtS13+z4ydiaisH37WUp4uGUhF490oRzZPMl3xJ11+zcOzupnJbB/d7uAeijNpu2dW3Qz5f
	DEhsXSJh9Tn5H40d3afY91YWSXRSxoI4F+q1ZvfJRPGP+joZfUmUEZDinM6ieeuT4VihEvqKL6y
	hCvbA3dq910d4oi6lO8qQ3qIgXC8HAM2WEBeyf/XvKNc1FvxEszcxq3GzeQDjMOrK0QjT6ZZA82
	YNeNJE23KXahQ==
X-Gm-Gg: AYBFou2pcnjzpDfogfiSlCeZY3LPTgltCuYeuCoUn2ZBQUm7TkG4FcxCj6O8NwbftHi
	VDGrFJeGJKN1lE6fcRz369zp3H8QoCATG/iDXum5cfAkxhDEd+N+ECYc/0dxHE1h+pE6AJoOQbv
	vDShaGp1mbvTLWAY4R8gbD3kK/kwaefGMXdsKbij3p79viYmCvq2soriGpQn+4JT7heI17NBpxZ
	22vlZUSo5mSS1ZC50q6LZt9rfjs8Z4HBpYZ1iN4+kCZtpmoMKbVW+SxUTGDwCndgF/vxNIs996k
	alQiPC2mXdKJ0lvYwax0O3r1tUq0ux54ABhM1HVy7gq4nprQbR3mOrBKULUXY/u2m70DXG+H9YB
	It9sspfC1MZpHFyGybSm2URIiIz7vFWz209dEhwMf/6R8qU3y+K7WvS/9Wp+Rw/YsWU06RKHIOs
	Qwl4JPRFC8hRM9lW4/7vATZLcpoZjbjDvL
X-Received: by 2002:a17:90b:510a:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39e1e23d5efmr3075190a91.2.1789535157977;
        Tue, 15 Sep 2026 22:05:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e1b7c98c2sm781597a91.8.2026.09.15.22.05.55
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:05:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso6614754a12.1
        for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 22:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789535154; x=1790139954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6awU6L1NSAdZve1Go4DAFmiBVEoVbQdcfNtuUS9ma4s=;
        b=dPD93RnyE2TqJFhUlaPOvucotk8/sQ5vvRFmWqez7oSHkJ2/x9Tkoyh78HpSYZTpwu
         zFngGIByfNPrGIaj2/ATrQH+WterfV/6EaPmEX26zN+UglYa9kWqXA5NYf59KWcZmkqA
         cijvmbAgvNBjlAm5YH03c4o2Cif4lDsa1uiY4=
X-Forwarded-Encrypted: i=1; AKwUvBzM68AbzwUjqpWbVJ+uv/I+7FhlEhg6tsRs2ildMK7mYcDO4i7yKNhYxvf6LzSNuJ7aWNsZ0J236XQR@lists.linux.dev
X-Received: by 2002:a05:6a20:4388:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3dd5f57bbfamr2773506637.17.1789535154009;
        Tue, 15 Sep 2026 22:05:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:4388:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3dd5f57bbfamr2773437637.17.1789535153567;
        Tue, 15 Sep 2026 22:05:53 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm3951386eec.15.2026.09.15.22.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:05:52 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Bo Gan <bo.gan@broadcom.com>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 1/2] percpu: Use X86_MEM_ENCRYPT for decrypted per-CPU data
Date: Wed, 16 Sep 2026 01:05:39 -0400
Message-ID: <07cdda86e2c60b27a18023e2e5fae339b78db0ab.1789488039.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789488039.git.zack.rusin@broadcom.com>
References: <cover.1789488039.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Decrypted per-CPU data is gated by AMD_MEM_ENCRYPT. With
INTEL_TDX_GUEST=y and AMD_MEM_ENCRYPT=n it falls back to ordinary
per-CPU storage, so converting a variable to shared memory can expose
unrelated data on the same page.

Gate the declarations and linker section on X86_MEM_ENCRYPT, which both
AMD_MEM_ENCRYPT and INTEL_TDX_GUEST select. Existing AMD configurations
are unchanged.

Keep the decrypted subsection page-aligned at both ends. The per-CPU
template and each allocated per-CPU unit are also page-aligned, so page
conversion cannot expose ordinary per-CPU data. TDX-only configurations
may need additional space for this alignment and isolation.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 include/asm-generic/vmlinux.lds.h | 2 +-
 include/linux/percpu-defs.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index b2988aa12f66..1448e791773e 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -1013,7 +1013,7 @@
  * Note: We use a separate section so that only this section gets
  * decrypted to avoid exposing more than we wish.
  */
-#ifdef CONFIG_AMD_MEM_ENCRYPT
+#ifdef CONFIG_X86_MEM_ENCRYPT
 #define PERCPU_DECRYPTED_SECTION					\
 	. = ALIGN(PAGE_SIZE);						\
 	*(.data..percpu..decrypted)					\
diff --git a/include/linux/percpu-defs.h b/include/linux/percpu-defs.h
index dbe3267a0a13..54ce1442d918 100644
--- a/include/linux/percpu-defs.h
+++ b/include/linux/percpu-defs.h
@@ -172,7 +172,7 @@
  * Declaration/definition used for per-CPU variables that should be accessed
  * as decrypted when memory encryption is enabled in the guest.
  */
-#ifdef CONFIG_AMD_MEM_ENCRYPT
+#ifdef CONFIG_X86_MEM_ENCRYPT
 #define DECLARE_PER_CPU_DECRYPTED(type, name)				\
 	DECLARE_PER_CPU_SECTION(type, name, "..decrypted")
 
-- 
2.53.0

