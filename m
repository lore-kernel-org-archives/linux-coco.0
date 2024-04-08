Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303FD28DD1
	for <linux-coco@lists.linux.dev>; Mon,  8 Apr 2024 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562067; cv=none; b=elEc/8Uyd0QCKJn54mtsKthwb2DYMr0VfrsMyuJ1RaOLpZiVDpkC4sDZ7AKNz77YoqxaQWgVDHvM9R5YSJUBEIBXy6O7+DPNb3kZbFsrYiGCxwc0qadiP4tDuEPUJmRGU7wA9kUDbWtYu4EDHFv7kdxXivokTnh6Hp6NiJ2saC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562067; c=relaxed/simple;
	bh=deFR0EbFGoz01sPfPnM8bTuqp1Yx689MWIkLggdnTCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MTksWwnUJw36mX+wtwChowq61WZqZdQsWDZtpdRD4QhUvX2KouGbYW/++RXWvTSF8/aOauE7pe3EyB56SANxKd5+janp+m8eaWuT5oiOeZwVrXfWXvONuetCljmetJrAPLgkmsf7683L4u5rcnsnQs+awMzZKbhy0JmHFWUFUX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fw90IYxu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fw90IYxu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4166ccac75cso5042495e9.0
        for <linux-coco@lists.linux.dev>; Mon, 08 Apr 2024 00:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712562063; x=1713166863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UC5Sjs0y+1l0bqhsbHpWK9vOawmeA7/6gd6QlKv6W8=;
        b=fw90IYxut3lU0YR2rS7Ap+V+VnleunHKnTNju0Kn/LYx3MAP7mYl53peDsvyIfiQAw
         FyQp0OfnQ9Mr2SJn0Y4TSAuPcCnhCLkweJxpdbcIJTxk7fwMOC2rWbMmsepGejqs5o6g
         iD7Vz4b6zejh4W0j8o73QrkOCt+8XmiqABheS6XrF4bVj/a2wQ8V7hCQtcQyhA+Gf8LD
         8Iw1id7SXHEE4P3/cZlDcFIXd+sKHucaYDdz5FzfY9w5keBhljgJt/l0XNsXWnt4L8n2
         WFk6uKpglCl/P/siK8v7kEWQfLLqSyg+dAblFyDRXGuqzld5RpTidAp4zf7JsRJ2Njp0
         zB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562063; x=1713166863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UC5Sjs0y+1l0bqhsbHpWK9vOawmeA7/6gd6QlKv6W8=;
        b=Dfjgasz7aNyGZYp4EC9JsMwq50bu+iK+WH00nOiCNRHEDVpBTS0UxZPqp0KIDLMKj9
         ckRwh9eoXYSvUda+EcywFLsG7Sb+60bX1OMema5quDoFkNHflwColz45FjbLnzXasgnZ
         zGyxLITtI2Ezxj/LmNoAZk4T1ypMP13fHJh17Mx4F1pZ+WTgqz+9b/hKu3fkJGk87QMA
         4GieH6KK036zo/A6WnNlWyRHI2eGm//+IShhDY1DTB7ZmGaU3b5Ot9VI8veXAd9T4Ycw
         qj0sszttXZJAjyevZd/WCA847c0Kc9lh/BE5syyZECRHhW5r2B0j4db5oNNUuwRFYek7
         eJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9ST0cdNVV7W2SOfZ7E3V7SqeRUoHcb3kzknW/oqjPDVMLN1YtSzVVUaDf8w1qJZrHyzLUQmkUb+MaZaAGFyU6EQilSSI6xPNqVw==
X-Gm-Message-State: AOJu0YwifYzUhmHPpBwPZ4UL4XxNvatAWRcha7EXWXS5kp7vrMyaycod
	cObdyuW/r+U31C0sosruGsJRcgKJ3EAkU/JyXSk607JnFBDTCarX
X-Google-Smtp-Source: AGHT+IEA4rqVnV0zCmstOW3Lm+tswAKk7lUuBX8iEtTS9cgrpMZ4GU/tM2sKL8kd/pn/zpEd0eSv3A==
X-Received: by 2002:a05:600c:470b:b0:416:6a7a:8528 with SMTP id v11-20020a05600c470b00b004166a7a8528mr1630488wmo.39.1712562063310;
        Mon, 08 Apr 2024 00:41:03 -0700 (PDT)
Received: from vasant-suse.suse.cz ([2001:9e8:ab70:9c00:7f0b:c18e:56a6:4f2])
        by smtp.gmail.com with ESMTPSA id j3-20020adfff83000000b00341e2146b53sm8271413wrr.106.2024.04.08.00.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:41:02 -0700 (PDT)
From: vsntk18@gmail.com
To: x86@kernel.org
Cc: cfir@google.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	ebiederm@xmission.com,
	erdemaktas@google.com,
	hpa@zytor.com,
	jgross@suse.com,
	jroedel@suse.de,
	jslaby@suse.cz,
	keescook@chromium.org,
	kexec@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luto@kernel.org,
	martin.b.radev@gmail.com,
	mhiramat@kernel.org,
	mstunes@vmware.com,
	nivedita@alum.mit.edu,
	peterz@infradead.org,
	rientjes@google.com,
	seanjc@google.com,
	stable@vger.kernel.org,
	thomas.lendacky@amd.com,
	virtualization@lists.linux-foundation.org,
	vkarasulli@suse.de,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	Borislav.Petkov@amd.com,
	Dhaval.Giani@amd.com
Subject: [PATCH v5 01/10] x86/kexec/64: Disable kexec when SEV-ES is active
Date: Mon,  8 Apr 2024 09:40:40 +0200
Message-Id: <20240408074049.7049-2-vsntk18@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240408074049.7049-1-vsntk18@gmail.com>
References: <20240408074049.7049-1-vsntk18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

SEV-ES needs special handling to support kexec. Disable it when SEV-ES
is active until support is implemented.

Cc: stable@vger.kernel.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Vasant Karasulli <vkarasulli@suse.de>
---
 arch/x86/kernel/machine_kexec_64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index b180d8e497c3..4696e149d70d 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -267,11 +267,22 @@ static void load_segments(void)
 		);
 }

+static bool machine_kexec_supported(void)
+{
+	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT))
+		return false;
+
+	return true;
+}
+
 int machine_kexec_prepare(struct kimage *image)
 {
 	unsigned long start_pgtable;
 	int result;

+	if (!machine_kexec_supported())
+		return -ENOSYS;
+
 	/* Calculate the offsets */
 	start_pgtable = page_to_pfn(image->control_code_page) << PAGE_SHIFT;

--
2.34.1

