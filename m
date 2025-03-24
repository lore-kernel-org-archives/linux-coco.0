Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF0F25DD03
	for <linux-coco@lists.linux.dev>; Mon, 24 Mar 2025 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742813243; cv=none; b=uGmukLGY5/WDIU9cPLLvY1mP+sexuLDOMqAUi/ROsJRmk4Gr7anZ9XiXVM/OL0krsIP+mjt5ULlIQzKQGhhb6tCetM7h/g6JYCcp9DFRBpgSA+U08p3U7X2WwVWbr+qnq6ELw0+Si9DqH3vORUit6gDJvFaWjuKNHgfxUFUAwVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742813243; c=relaxed/simple;
	bh=9z0RxKjeC8RwUmLb5SarlKv6HJUVpqk+rJh1s528L40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=I+sWCfBLt7k7EDu/3sBheTyTP5GTQoYiGdD0Tf6D89dGUT/48xi6lv4qPl2HgXlAvFy8pr3uuI635TsSU8k5KKO9G5o3qs11TAMalSxYdFp0vDlOYM6LAQaW2U5pMZPqBfmQGHH7GwTVmmukrK0gzmWddn0ABUQoxcvuVjgT64U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gnh2g8bt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gnh2g8bt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742813241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ILxEYoeVE+MpXO0Glj+Y1U0EAxeFxdsejgciRSsrwF8=;
	b=gnh2g8btUvah4/AcnWeRTsKU6eAXWLcAzey8/0IU1oMHzsfxGa8sv+M4EvDKGFxoZ0iubj
	dgY5JdbKVc2Vw/uRNMT+zXuT/PCfxbvh6WIFDcm4+0e2tBbAe7yOavMvrZj+z92TonokNp
	A6JwFeO43NbMuW9LugQNIzJl7yEgbdo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-vuf-_ZQRMTCJ4wXGmGuDTw-1; Mon, 24 Mar 2025 06:47:18 -0400
X-MC-Unique: vuf-_ZQRMTCJ4wXGmGuDTw-1
X-Mimecast-MFC-AGG-ID: vuf-_ZQRMTCJ4wXGmGuDTw_1742813237
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d51bd9b41so25044525e9.3
        for <linux-coco@lists.linux.dev>; Mon, 24 Mar 2025 03:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742813237; x=1743418037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILxEYoeVE+MpXO0Glj+Y1U0EAxeFxdsejgciRSsrwF8=;
        b=dHZvzjZtsECW0JfMJJee/gYQ2QRrEH2HZA4h11xgGe7vfqy0NnZh2QH89ZgkDcfHgj
         VICHI5m9H/kbIPACLwahHJqBlo6J7+RKJzLvbGUITdhHkmTkvYl4HDHFVHhyZKEoCv/0
         RkbHUGkDn73r4fsqxx1eMEwVjz1lPQqbd/Tckg0WjZNLT9DsPssyRvbPEAh4kXEDP2NO
         vOTJ+q1W+sYDRvJd/mBjNuWedxRtxjl3h3QICofjsckrSi8LNUvexr8uNqI8ZQOBLq7X
         iXrCj7ZH05wFzAnrZbZaA6QXjrGjf0hISZtUtb7yUc0LrbsoNQeEL5uwjchoOtzVlZDh
         bwxA==
X-Forwarded-Encrypted: i=1; AJvYcCXZFjeLxYNfcWijfyVOnM0i8oP9iTBePYGo0f6N8yBxBYJGdfaLnovpMCzgKoB3IRcW7XQfYxvOExU6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm4sh/x1KFafU257r6qVFbW17EeY8Ofjrj8PNr/n8WG6dLzN2L
	mc0gAoE6S4qDRZSjuPf8W3+DG0xEbV/fdnoK7ARApseIDjGiPF1T8LDAVFbGcZ5XuIGc7gupjiJ
	RCvQYoGkhPjud/d8Wm0/h0OEZy7VI9MmUuLgvxmGFE1WHgdJLyusg+J+vwxo=
X-Gm-Gg: ASbGncubO8bsH54iKbwQCXbIxS6uqieL+ex3SIVfmzlPggPGzRG+9hFyRte0xRdqbtv
	lqALpd+SJPSwB8gRyK3lZDOq4Ns0ixZeGkpEP8gxeOLU/vT+KB+hJE0sE4JbhS47W4F0LcO7VTs
	Hp0BUdS5nx10X8PUVkKr3ya+TdgWHBWzm8yHc1ZcKT+FVApuyCVfChNZvrGxTqK5C+mBa0rpDyp
	6oAJCp1lu36xTtPLdAcrpBLe9ofNELEfpKBAZ4e6Sqhko97J0/a9Zk7Z4ilGXfOyCUKWeKHkF5M
	PVWpt2cArK+0aGJh5K1jktpUEhQtMuspAHyI6CmVw2k+VIxg7co57XmRX+Cg+OjgYA==
X-Received: by 2002:a05:600c:1d9f:b0:43d:83a:417d with SMTP id 5b1f17b1804b1-43d509ec5d7mr113154505e9.12.1742813236965;
        Mon, 24 Mar 2025 03:47:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWZa9wuN2PTDGpTipt3fq+aoFWpOBqvRgoGNR3/VEGSUJWm0DGpVCjLokA7c7167YRmdsfkw==
X-Received: by 2002:a05:600c:1d9f:b0:43d:83a:417d with SMTP id 5b1f17b1804b1-43d509ec5d7mr113154055e9.12.1742813236335;
        Mon, 24 Mar 2025 03:47:16 -0700 (PDT)
Received: from stex1.redhat.com (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9e96bsm118452815e9.25.2025.03.24.03.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:47:15 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-coco@lists.linux.dev,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	linux-integrity@vger.kernel.org,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v4 4/4] x86/sev: register tpm-svsm platform device
Date: Mon, 24 Mar 2025 11:46:49 +0100
Message-ID: <20250324104653.138663-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324104653.138663-1-sgarzare@redhat.com>
References: <20250324104653.138663-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s37egHc26zJSzjHxwdzj9jNj8PmCnqlXIYCDkjNbitU_1742813237
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Stefano Garzarella <sgarzare@redhat.com>

SNP platform can provide a vTPM device emulated by SVSM.

The "tpm-svsm" device can be handled by the platform driver added
by the previous commit in drivers/char/tpm/tpm_svsm.c

Register the device unconditionally. The support check (e.g. SVSM, cmd)
is in snp_svsm_vtpm_probe(), keeping all logic in one place.
This function is called during the driver's probe along with other
setup tasks like memory allocation.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v4:
- explained better why we register it anyway in the commit message
---
 arch/x86/coco/sev/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 034aab7e76d2..0abcac87af89 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2692,6 +2692,11 @@ static struct platform_device sev_guest_device = {
 	.id		= -1,
 };
 
+static struct platform_device tpm_svsm_device = {
+	.name		= "tpm-svsm",
+	.id		= -1,
+};
+
 static int __init snp_init_platform_device(void)
 {
 	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
@@ -2700,6 +2705,9 @@ static int __init snp_init_platform_device(void)
 	if (platform_device_register(&sev_guest_device))
 		return -ENODEV;
 
+	if (platform_device_register(&tpm_svsm_device))
+		return -ENODEV;
+
 	pr_info("SNP guest platform device initialized.\n");
 	return 0;
 }
-- 
2.49.0

