Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3F1B599
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173861; cv=none; b=kOHLD+j085GahoPUR2Zz/HrnJOzjXZj6W4EjaYQIpzCaRiKZe8e3aJr8ot33PJ/ufM0to328ui03N6Jy1SqWxSyUVKFTEt2Ih+4mK29ACXRP9EramDjIN1Arq1H9SNGa+ZIRIryIrICMKUW+amWBTTdLWFlRGQVOGa701bObmXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173861; c=relaxed/simple;
	bh=uh321KuZzkIr6bov6gkL2gVcZHrVCSYkUtEmo3DNyRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eAzlXBRv/ca2/7K/Xd/Qaa2QYePWyhMqOKZKMiUGj1SYoDRA6CQN2lPUSULLn3QyiyNHI0kYggG8QywN3GlOrldbjO5rTCGrinm3w4s8Qb7q6hOuCTc2tz48InIQe8v/ZVRNRwTq9QWV7GctZBl5vcufpUkEqI2smJIQWsuryZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cW2O8NeV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cW2O8NeV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33e6aca1ca9so4346672f8f.2
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173854; x=1710778654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwrPOtCFWcQDMfUXPx+XS96HNczA3gaW/2MdY2qxab4=;
        b=cW2O8NeVTM/H7n4AVzesz1345jDCs+bKkL+yLAcmhWgBM0l2YsaSqRKuZhKLLQHu5i
         tw4O7QfHbnJWv6dbdGl2qsCNFPVajki3oXIyLtRdjSd4GaZMnal67AgdhCnAfowMjI62
         VHwIFYEy3pjc7/wEFlmws6cKQ/kXNkHcdhjZ2RslNKg9xuFkt7EA1lEBTuCMaJ8+HGHx
         lYaerC4WS2nuChNpj7d1yET3siL3rJpnVFu3fMhUqF/jXZrm4ja+Med/hsBr5ys+/yJV
         yMMbaVczFlEWLaX+GDY/c+dHUvb43gHjbYb+PaKaXxxyKnt7Ub9HHFgqkBPOa4dbD2Jc
         yHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173854; x=1710778654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwrPOtCFWcQDMfUXPx+XS96HNczA3gaW/2MdY2qxab4=;
        b=mZl/MrN2h+boCGgZY+fKiMoglRdDClbSsACpdAT7VRok0sM6wJusO/eXBIhSEa5JI6
         WVvDq1NGSAqymiXz5POtd2QsEvjVPN54EoOM9EAleboWo7g6MfCQvPS1oLso+P0Jf3Qp
         QoYmhFPYyKuxECYAgjTi75gputUJzGW9O+Zvvd5bxtq/HHWzBlzGw+C4zXunZTEdx41i
         JpWJWT9ywR++GEjajFNJsV9cKmcXv0XLc7hrT0KmIFwi9SdpVC8XYIbyG/NMsmqwMG6u
         WHMZer6yLpGHyUn6n+vjL/y+Hxzls+hJN+kaeHtpMIoMC+LAlm+hmNTipThL3+jn4rxO
         iQ9g==
X-Forwarded-Encrypted: i=1; AJvYcCVboPsL+CCXvxiywv0HJWoolUHbyZwEhzia5TGvufcm9uoY8dBpy9h2bgARyNuUXP6Kl5p9vmzjRYed6EfsZKUPpn3dBlefXvOkSw==
X-Gm-Message-State: AOJu0YyzIVBhHS2gqW2HFV7zczboYoADRdokSqR2zMFz9+7HokrF5FhN
	OKk2U7Z9iwcbEwqVGXTpOh16s2xOIZhDBcnaPMqJehicuKv654Pe
X-Google-Smtp-Source: AGHT+IH2ferHpfaCLktwprSAlut0kfkjOaWyxqFOcoy+lU0gHOdVqoYzZnhz4uQfv99VU6U5lBGYiQ==
X-Received: by 2002:a5d:45ce:0:b0:33d:3abb:6db4 with SMTP id b14-20020a5d45ce000000b0033d3abb6db4mr4095738wrs.69.1710173853730;
        Mon, 11 Mar 2024 09:17:33 -0700 (PDT)
Received: from vasant-suse.suse.cz ([2001:9e8:ab47:8200:c3b9:43af:f8e1:76f9])
        by smtp.gmail.com with ESMTPSA id ba14-20020a0560001c0e00b0033e96fe9479sm2823815wrb.89.2024.03.11.09.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:17:33 -0700 (PDT)
From: Vasant Karasulli <vsntk18@gmail.com>
To: x86@kernel.org
Cc: joro@8bytes.org,
	cfir@google.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	ebiederm@xmission.com,
	erdemaktas@google.com,
	hpa@zytor.com,
	jgross@suse.com,
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
	Joerg Roedel <jroedel@suse.de>,
	Vasant Karasulli <vkarasulli@suse.de>
Subject: [PATCH v4 1/9] x86/kexec/64: Disable kexec when SEV-ES is active
Date: Mon, 11 Mar 2024 17:17:19 +0100
Message-Id: <20240311161727.14916-2-vsntk18@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240311161727.14916-1-vsntk18@gmail.com>
References: <20240311161727.14916-1-vsntk18@gmail.com>
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

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Vasant Karasulli <vkarasulli@suse.de>
---
 arch/x86/kernel/machine_kexec_64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index bc0a5348b4a6..3671ea1a5045 100644
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

