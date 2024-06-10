Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3006C7A705
	for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718014888; cv=none; b=XSmLaaYv6vKK5m1RY291R+BnpyNW3JODOwSrT7oxArYaFmyUBxR5KDa3O2iyWHjjE1go78zhxiLUOvT94g9dOZgDc5T2uDi3wcIVRobGx3TylcQoq3EqP16cGW/GsDa9MFPHLxZvSXqcFpiY8rsGsCizmkmRpoI93R43jeirpC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718014888; c=relaxed/simple;
	bh=B2wImS6jYkVNxmJNAz/7Rmlae+jcWsMN5Euy7uX8VsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TZLL7lZn2Vl+Pt/Jwmiu6INtBMasAykZHMoAobFCNpyb0hRB5nBLSjuO0fmA6WhUubR2PiKlvCkzjbFnFeW+09l88XMWtrARyQI2vcgNDT/1tsgQ7U4NCWri6rIfvZm9YKiOXa4e+pEvy9UUwu2YWmBhzpDOJIi8haPOpg50bm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTNm0mEA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTNm0mEA"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a68b41ef3f6so462291066b.1
        for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 03:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718014885; x=1718619685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEfSemHRxgSOfPiZYMvW6KyDv2YGLxFXvDUpF+fStco=;
        b=LTNm0mEA+F+H3irOUdyzZWl1wCa7VJzkttGoIc2OpBDLQod4GMxg7Hlh/PXt69xeI1
         XD9OPzQCdDS7HGpD1WU2IxvME0FD+gSau1+HjgwnB8tvJ0yt9O/9zobAPPBjmnSWgDYD
         UaWCPxGTenqKsITHwURHlBqu1j1LQ85tvtkllGk4PhUISGk4n6kncZARivI+5tt4vt9Q
         JfO7xWFUq32wtQOH6fRXJzvT1tskcjuExhDY+aoiNKya41rBo1Ztw8KcU6XKnmwXftQa
         VR9B5bykHCFFsAl1KTHj+Ep3WcDyyeHRYF4yTkXzSW9LmPDAaw4cb7mAFva14xwl4e86
         rFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718014885; x=1718619685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEfSemHRxgSOfPiZYMvW6KyDv2YGLxFXvDUpF+fStco=;
        b=DxBOJiOof3Dpm3Chfso/UdR/bhLS+uZCVVUq0h3xKPrR773DV+QZkOmR29GiuFS70e
         2RgvY6PwIB3rQ+lp1yN+cEf425C8lmcUANn9tpeAMnKS9nhnQxG5dSOaR0w2g40fMqMA
         cPphAfeGhkqtgLHMyWWm+9YL9z8VZTYcjgw13TxJJBC752fZjM+oS0psLid6QQUqrwUC
         MiC6jYoxV0878Gd+iiP6cWWMfjm7U5u536PEd9hL0OWsnWHv9b73pqOKJGgWNxoLkae/
         Ki3rUK+HNh2uu9YgCXzG5ymDIQDzZandxHTyIDaRBGbDFCWe08dWH5zipB7zHC8lFk8a
         T1FA==
X-Forwarded-Encrypted: i=1; AJvYcCU3IHG46m3myClAvYG79SEO/+fwlkgHqphCVMOc33f8sFnTa+PkyY35feDNb7Qddj89QZW4PAdTR31h9p0P0uVcMeP9e9B3VmuMaA==
X-Gm-Message-State: AOJu0YwTPcyGtNcHnmwFApCP9LcK9dBkzuyOMpVQVuEyKSLEMapz9s9o
	Rca/Gr0+tXVqxKKjiAdZvfnN0yhieLxFlXxWIJLXgTXwsFEFjnYA
X-Google-Smtp-Source: AGHT+IG1u2X9S9HjwLyvUzoKmM04a54bnBw7Lz54/NkJdSpdqT0nvOtendvNpOdVPb71wHGOXHjzEw==
X-Received: by 2002:a17:906:3289:b0:a69:1a11:d396 with SMTP id a640c23a62f3a-a6cdc0e252amr568492666b.71.1718014885293;
        Mon, 10 Jun 2024 03:21:25 -0700 (PDT)
Received: from vasant-suse.fritz.box ([2001:9e8:ab68:af00:6f43:17ee:43bd:e0a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0d7b35d5sm290887766b.192.2024.06.10.03.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:21:24 -0700 (PDT)
From: vsntk18@gmail.com
To: vsntk18@gmail.com
Cc: x86@kernel.org,
	Borislav.Petkov@amd.com,
	Dhaval.Giani@amd.com,
	ashish.kalra@amd.com,
	cfir@google.com,
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
	michael.roth@amd.com,
	mstunes@vmware.com,
	nivedita@alum.mit.edu,
	peterz@infradead.org,
	rientjes@google.com,
	seanjc@google.com,
	stable@vger.kernel.org,
	thomas.lendacky@amd.com,
	virtualization@lists.linux-foundation.org,
	vkarasulli@suse.de
Subject: [PATCH v6 01/10] x86/kexec/64: Disable kexec when SEV-ES is active
Date: Mon, 10 Jun 2024 12:21:04 +0200
Message-Id: <20240610102113.20969-2-vsntk18@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610102113.20969-1-vsntk18@gmail.com>
References: <20240610102113.20969-1-vsntk18@gmail.com>
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
index cc0f7f70b17b..1dfb47df5c01 100644
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

