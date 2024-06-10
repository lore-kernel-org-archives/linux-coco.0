Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340217F483
	for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718014892; cv=none; b=ijT3qRJTBfYAaxApCp/AGk0YY8Z8n09MXpWMnGVEh9BAvHx101H53FpyO8LkjIWdD3Ms2VLZCAUGcSoH3xQsHmMcrlkdoAuG9K3GnNbaTxoLQqIinZJ0+76UtGs6R36uFZOQCEAVcF1NihMpDgm1d23UH+VmCkYdi2CTBgzPVVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718014892; c=relaxed/simple;
	bh=JZT+a3gMm7LX5fmthY+7RJk9xN/fuL/DRlnnw7HuKpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QD6BEG5G2bh0qmZXvxBSSLaLY4tA+uqFveIjyNPUpVeJ/BwqB2FRhgC8chLzgpryKYxtwO6OW+fVVpqBoAIukIiTv4cpJPMwtr/X8ZCds9BuqcR2Wh+3jpVZj9TiBpJBKC2CFHzLsF5XuPFASXaQ5ywT011S0cDwmRQWSZAELLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml2rQJbp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml2rQJbp"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c804e092dso2026653e87.2
        for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 03:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718014889; x=1718619689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXpLAMRWKrEJAxhlnztpKOQCT6b3mNAcjXJNnKoGzl0=;
        b=ml2rQJbpBQ0eqyqwA2XRDHqh7fgdOOiELofT58DeIH5xa15QwsT6e+csjHqAZCFnAf
         mUS6Bq5uw/SVFHyJAWn1qLkPb0XbjWV3DTMJwwykPCUFrCowcgdbzDdtcFlABFDxIFm9
         QnYik8jYzQbZQYkWHOs3B1yZBBDWdclEa+jgKFExUUYRBA0WBKCvHGJk3b7Jc1ukn9Co
         oFzSu54HNVHItFiC3orrlsXS4sPBNoz2p+Jt4FaV8C5fmm07zDvsK0ppYdSDE6iawa8+
         STNnVTVyq/a2XmlrP5o7lOlm+5vW0pLwVY7W8ARjYKhrjW2RYBI8/g6evv+Ib8ZRkCsz
         Rl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718014889; x=1718619689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXpLAMRWKrEJAxhlnztpKOQCT6b3mNAcjXJNnKoGzl0=;
        b=POCuDVtPvrJJ/ST0ToSW7I7dPAeR9jm7Kge+31+3dNKd8xVGfrkSlahW7XT1Bf6uG8
         XVD6x06gd/P4jsamY8W/45YA9BI1PEu0m44tXVweS7OmNSf2ERAaelj7mR9CVB1AdLO5
         qER4COhopZ7Bk7bK4Zs7PCHwnzhtJRkiOZe947mX7CXe39QTHGluy2VPNPWKAbfxsbbk
         FNo5U5QTympPSMvxxP5BBer//MjRc7nPTcK/Xeg61XAGM058geEp03cWeX4qfA6A84i2
         /AF4mI2m5uxF42U2sTavKtfaKvXpxptfAhYYP6nuufJ1C5Sw2duW5+CXS9bX2sP254Vr
         zMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuUgZB98G8MLNMwq9DozCsMd7r7s6K+vr5ZP/mQIh/fUJbrty7rGsvRvi1eheeseVlxCLfiOGPaYeCBrG0FTw+xqFigeF9zjhY6A==
X-Gm-Message-State: AOJu0Yzf1XnJUgTKf3DjPvNloU3aPVgUlj9h0p4JJYmRF/SUgEUh2c/F
	/HQp3Qf1gBx+aqQxnB5jrrCLSqyMrUFXFZfhHYej1EzkvFsXc665
X-Google-Smtp-Source: AGHT+IHJj4AaRNhrX7A2v/Kk6aeuS0bX16/27Qun+QcsTNsjyz064wpO/4XTT3yY1voEgsZC5VV9Fw==
X-Received: by 2002:ac2:4c82:0:b0:52c:8289:e891 with SMTP id 2adb3069b0e04-52c8289e9a0mr3434713e87.6.1718014889127;
        Mon, 10 Jun 2024 03:21:29 -0700 (PDT)
Received: from vasant-suse.fritz.box ([2001:9e8:ab68:af00:6f43:17ee:43bd:e0a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0d7b35d5sm290887766b.192.2024.06.10.03.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:21:28 -0700 (PDT)
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
Subject: [PATCH v6 03/10] x86/sev: Set GHCB data structure version
Date: Mon, 10 Jun 2024 12:21:06 +0200
Message-Id: <20240610102113.20969-4-vsntk18@gmail.com>
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

It turned out that the GHCB->protocol field does not declare the
version of the guest-hypervisor communication protocol, but rather the
version of the GHCB data structure. Reflect that in the define used to
set the protocol field.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Vasant Karasulli <vkarasulli@suse.de>
---
 arch/x86/include/asm/sev.h   | 3 +++
 arch/x86/kernel/sev-shared.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index ca20cc4e5826..963d51dcf0e6 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -19,6 +19,9 @@
 #define GHCB_PROTOCOL_MAX	2ULL
 #define GHCB_DEFAULT_USAGE	0ULL
 
+/* Version of the GHCB data structure */
+#define GHCB_VERSION		1
+
 #define	VMGEXIT()			{ asm volatile("rep; vmmcall\n\r"); }
 
 struct boot_params;
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index f5717eddf75b..f63262a9c2a5 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -264,7 +264,7 @@ static enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
 					  u64 exit_info_2)
 {
 	/* Fill in protocol and format specifiers */
-	ghcb->protocol_version = ghcb_version;
+	ghcb->protocol_version = GHCB_VERSION;
 	ghcb->ghcb_usage       = GHCB_DEFAULT_USAGE;
 
 	ghcb_set_sw_exit_code(ghcb, exit_code);
-- 
2.34.1

