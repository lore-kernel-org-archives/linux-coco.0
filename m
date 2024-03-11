Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A0547F6B
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173789; cv=none; b=HD9VAuO/DFvDE4H7MfOQPkbZB0yRpvnhQf8PcnyZdh4/CnD4QxmLeN29q4ky3WM+dcppwfR6CytFtz3cpsYjkhr+rOzftMk0L9qcUocVShtNbUimRiRnO4E/URd6nQbcoTPXfNPJM7lfVxMs4HpeFDoBmDROrSYwcOyMo/DCQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173789; c=relaxed/simple;
	bh=cstlKRvM05MrUPSFlewFMd/M+rP+hCvOX7Gg5ABuAzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HsGC5TfAE49U39WOK0rzYXJlPe7vNFqw3iJ7QXbgGZpnudIsGSyN5Qaour3hO6MMHroCs03bpV4DFcCKGx9tgUOWY2BBAkrygkKP73eal18c7bMROKwmLyGywJGkvQ/wKNjB4c44sUHFc7fWmOIvG2z1VpWmd6Q25lAHTbxCrP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2xdiTRk; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2xdiTRk"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6381df003so3973543b3a.0
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173786; x=1710778586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=20D2eiTsOiNhaoi07FGlR5nvSdDOWzq78s+lkcJ88X8=;
        b=U2xdiTRkLr6evOsHFT7/RVkdsZwHKjHlnCjfNa0SuTVeaC44qeo8GcIVZdgWUwiApY
         kbDX6hKQwF/r3Rf4caIescnUfLxGpt8QP05dY3Q+dX5Tq/h8bDHmW7dr6LQh4Y5B87Yu
         OUYr83mhdavYRQcKXZVchQ0+W1PYmZ4ELAk4ckxkn6jkAkT0KqNLQ9oDwRXOP7hBMVD/
         9RpGfqMdwaXScnT3q9ydOdonUgVhLVzbHt3uFpPK0RVHH4a+S1nVz2Lu9wP0GKnqJXbT
         U19zH8tD5xH6XvXd1/SXnNgY5wIac03As1QIW86HkvYV1dLhRMXvn8TDA+X0HYBl5i88
         eApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173786; x=1710778586;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20D2eiTsOiNhaoi07FGlR5nvSdDOWzq78s+lkcJ88X8=;
        b=EB5UQg82dB6mJxItk3yqx5iiaXlvXT02USc4wmzuC9+fSHzGopzeRJ98OZDIFNfJWL
         YBPQZdF9osXc0iFTQfdZVxPaNJH1lQ2w/FIK9r5pISzfoYRkP28dnLqTfkZy2WdIKAUa
         oX+dN8tE8OJGEpC/PlNrSxEHw/kK8KaZUz8hw0QFWBOz7f+tX3AP2S7Wohv86h7JPHFd
         CGgQVKeKmeo3IBLEO9R1K8iwSNPlbpCnQ/zccNYimlsfb1WHJseewLpAjbyY32yl+xf8
         chXfIBt6hQzE/7rs0YBX5qclM1GyAH/whGyq6Cq8aOYsqqg0dCAyZPG5EZZqYeYSYW4W
         R3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCW4KpWaZdsg9f/9SvhkNvOUQi7HMIRgObrZUby1Rm9H+CLKR9PU6z0Ntq22aW1MtPZQhiJrdSPkpAidefEJ+nIE+g0DPVZ6r0PNaw==
X-Gm-Message-State: AOJu0YxPgf6chf+m7RzvdaM6z8iQpC6h78qGN9caF5eR2W1UC7VFEimW
	UD+hBuzi60Z6hU6RCMi5SkUzDuEJ/snsH61cEfVA3LQbWVUyUFNW
X-Google-Smtp-Source: AGHT+IF2vJXDdryaGDs2gPPRjXGG1CLRR5XsIg4I5zQeUv325kQS7/K0YCP4qVPoBcCJWSpTKF6eUg==
X-Received: by 2002:a05:6a20:9f06:b0:1a2:ba3f:e530 with SMTP id mk6-20020a056a209f0600b001a2ba3fe530mr8003138pzb.50.1710173785444;
        Mon, 11 Mar 2024 09:16:25 -0700 (PDT)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id m22-20020a056a00081600b006e52ce4ee2fsm4576325pfk.20.2024.03.11.09.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:16:25 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: rick.p.edgecombe@intel.com,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	gregkh@linuxfoundation.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: sathyanarayanan.kuppuswamy@linux.intel.com,
	elena.reshetova@intel.com
Subject: [PATCH v2 1/5] Drivers: hv: vmbus: Leak pages if set_memory_encrypted() fails
Date: Mon, 11 Mar 2024 09:15:54 -0700
Message-Id: <20240311161558.1310-2-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240311161558.1310-1-mhklinux@outlook.com>
References: <20240311161558.1310-1-mhklinux@outlook.com>
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rick Edgecombe <rick.p.edgecombe@intel.com>

In CoCo VMs it is possible for the untrusted host to cause
set_memory_encrypted() or set_memory_decrypted() to fail such that an
error is returned and the resulting memory is shared. Callers need to
take care to handle these errors to avoid returning decrypted (shared)
memory to the page allocator, which could lead to functional or security
issues.

VMBus code could free decrypted pages if set_memory_encrypted()/decrypted()
fails. Leak the pages if this happens.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/hv/connection.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index 3cabeeabb1ca..f001ae880e1d 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -237,8 +237,17 @@ int vmbus_connect(void)
 				vmbus_connection.monitor_pages[0], 1);
 	ret |= set_memory_decrypted((unsigned long)
 				vmbus_connection.monitor_pages[1], 1);
-	if (ret)
+	if (ret) {
+		/*
+		 * If set_memory_decrypted() fails, the encryption state
+		 * of the memory is unknown. So leak the memory instead
+		 * of risking returning decrypted memory to the free list.
+		 * For simplicity, always handle both pages the same.
+		 */
+		vmbus_connection.monitor_pages[0] = NULL;
+		vmbus_connection.monitor_pages[1] = NULL;
 		goto cleanup;
+	}
 
 	/*
 	 * Set_memory_decrypted() will change the memory contents if
@@ -337,13 +346,19 @@ void vmbus_disconnect(void)
 		vmbus_connection.int_page = NULL;
 	}
 
-	set_memory_encrypted((unsigned long)vmbus_connection.monitor_pages[0], 1);
-	set_memory_encrypted((unsigned long)vmbus_connection.monitor_pages[1], 1);
+	if (vmbus_connection.monitor_pages[0]) {
+		if (!set_memory_encrypted(
+			(unsigned long)vmbus_connection.monitor_pages[0], 1))
+			hv_free_hyperv_page(vmbus_connection.monitor_pages[0]);
+		vmbus_connection.monitor_pages[0] = NULL;
+	}
 
-	hv_free_hyperv_page(vmbus_connection.monitor_pages[0]);
-	hv_free_hyperv_page(vmbus_connection.monitor_pages[1]);
-	vmbus_connection.monitor_pages[0] = NULL;
-	vmbus_connection.monitor_pages[1] = NULL;
+	if (vmbus_connection.monitor_pages[1]) {
+		if (!set_memory_encrypted(
+			(unsigned long)vmbus_connection.monitor_pages[1], 1))
+			hv_free_hyperv_page(vmbus_connection.monitor_pages[1]);
+		vmbus_connection.monitor_pages[1] = NULL;
+	}
 }
 
 /*
-- 
2.25.1

