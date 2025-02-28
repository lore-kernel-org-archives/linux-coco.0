Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B571F4CAD
	for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 17:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740762497; cv=none; b=pdzyXBqmN1lh4ilKasP/q0jIr58DLd3bC/DTTHc4FVHJ8d6UARMYpUk5XGGHM9sLLL/QKssYPMDpgcaWTQ/UQY1HitLCQLy+euF9+1FiELRuMkr5u+TIbonJRI5bFbrimmbgSpAo/Y1/8nm3U1HYDUJ6IpPT+eKJqbaYLXcIa3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740762497; c=relaxed/simple;
	bh=qJd0Z4j/r1sbdRqfPYytxXq2rpI9PhS6oCSmMOfbFOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=lxl7hmBqsDUQr2HAFYk/kdEDBF6gfypL1mn7eIhBjRJyHdnZGu1HdtEavCq57zWEHZvNPSP30+5SWo6CELT1fGX1a8A1wX2Wbl5Nf2JR7PM6+5vRkgkx60Dnc8+ZMj1kxmcMOkRnLgpR+OHLjpSxVURgjaOlvQ5smakZfavhUAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HFccmuOQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HFccmuOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740762495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dnSy+8VlJ8fotBQ+d996WFV/2A3QtkEvLLAc1C6w9D0=;
	b=HFccmuOQiFd1s1pjUlDUc4laOv+tVM0JpDq7drv8lsuUt1KYdjFHbI8RuKhmjch+kPmIFU
	VJ6EbuuaHMVsHn4FPoUzpyarVNkK0Of6r3mXGKzMcqaQILfZ11jbjeTWkaQJ5Mcqy2/Q1W
	fPfJysrJXAVlG8SVjAxsZyvldUQCFXc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-Gxs2t4xpMlaePWI1iNUd4Q-1; Fri, 28 Feb 2025 12:08:13 -0500
X-MC-Unique: Gxs2t4xpMlaePWI1iNUd4Q-1
X-Mimecast-MFC-AGG-ID: Gxs2t4xpMlaePWI1iNUd4Q_1740762492
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-390e003c1easo1172578f8f.1
        for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 09:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740762492; x=1741367292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnSy+8VlJ8fotBQ+d996WFV/2A3QtkEvLLAc1C6w9D0=;
        b=TVaYDlHBRPrQ6H/E704gU4ps2Pp5Pn3JQ3oGtJrNySp4jVQCr6ulRItj5KCxkElJBa
         raCwyoUyqtm1KVtkm2RJR0aOPsbQ5Elw5cjfch2zO2PsIn9IB4fyPtQ6+Gs7nY9f5Ops
         PQyBdJisAnVFli+gTqGM89zsOli4zz491jC6CDZBr+B1gsOuLRtBpEercd5GvNSkppe6
         sAIILWX8Fbrj5E2aZ4zpt2j/JNvJcLS/gcYhALySiekmbGzgmGzP0/0Nalxu1jA5BBqE
         EQ5AxFEfmKSziO1UUzW5mpWQ6WnX8+POV4DwEin8Kz2QqPefMFmYDnWbh/c+m8l0iHIi
         Qgew==
X-Forwarded-Encrypted: i=1; AJvYcCUDgLHLVECt2bvlUlur7Hpevgm24AE96znbgQmng/7XL3mDwzM9axMaBo3m4GPm5IW3L5iPmlIQkSpM@lists.linux.dev
X-Gm-Message-State: AOJu0Yzibh4W5UwWa7If933XtSNe8vjDGidY78xvYRYdWexL82cIVZ3P
	emf6IwOkzYC7inoxiwhaDNZmmXLWJj0lz6bu7Kl4zh9m1L7kA9eP6WtetMgj3EYfP2zR4G/t0Xh
	uxtYxO8wX/Ts+nQoUmzokXZZrclLDiBizYwhmPOi84fnkwHKKZyKyseW+L7M=
X-Gm-Gg: ASbGncvUCLlJLmVexiC0vWpNihbcWecVDhFOE5cCIrUIIIjYnW6kIw0wR6oJMagfBuB
	j/ZYvhHdIohgjq8QH4O9Z+oTbzMYODT09xHKoi+r3ZG5BXi6DLxv4/jFxaISNO3dBlEhakU56gT
	EU9t7vsXxLTEpIkzhGBaTNe+CLGw7d8cgVEdpObTJQK9AFvdZkNPaIYZeoDOg8O8x5bC4mRkGUZ
	GRo+M6ffXgpsFTqb5a+BSIi2ykmg+GGTo72gNxGFFjrHf+ZFmNsfXE5IReQ6XDC49l/uSqgMixD
	nWHFlhczLZ6hSbHwBPl6
X-Received: by 2002:a5d:5847:0:b0:38d:e3da:8b4f with SMTP id ffacd0b85a97d-390ebf7f818mr3864162f8f.0.1740762492226;
        Fri, 28 Feb 2025 09:08:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzR5hk357PFuAqN46Kj8Gt6yD0kfZMjS/ZQgfr804lPGex0gArLFn/VwUHjTCi7DihJcYMUQ==
X-Received: by 2002:a5d:5847:0:b0:38d:e3da:8b4f with SMTP id ffacd0b85a97d-390ebf7f818mr3864097f8f.0.1740762491681;
        Fri, 28 Feb 2025 09:08:11 -0800 (PST)
Received: from stex1.redhat.com ([5.179.147.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7d69sm5912302f8f.60.2025.02.28.09.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 09:08:07 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	x86@kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	linux-coco@lists.linux.dev,
	Dionna Glaze <dionnaglaze@google.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Ingo Molnar <mingo@redhat.com>,
	Joerg Roedel <jroedel@suse.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [RFC PATCH v2 6/6] x86/sev: register tpm-svsm platform device
Date: Fri, 28 Feb 2025 18:07:20 +0100
Message-ID: <20250228170720.144739-7-sgarzare@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228170720.144739-1-sgarzare@redhat.com>
References: <20250228170720.144739-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 23v5KT1d6Xcrmpn0KD4LTux73mcIJ-s-T0C149hYRm4_1740762492
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

SNP platform can provide a vTPM device emulated by SVSM.

The "tpm-svsm" device can be handled by the platform driver added
by the previous commit in drivers/char/tpm/tpm_svsm.c

The driver will call snp_svsm_vtpm_probe() to check if SVSM is
present and if it's support the vTPM protocol.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 arch/x86/coco/sev/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 4158e447d645..7e91fae7d43a 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2680,6 +2680,11 @@ static struct platform_device sev_guest_device = {
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
@@ -2688,6 +2693,9 @@ static int __init snp_init_platform_device(void)
 	if (platform_device_register(&sev_guest_device))
 		return -ENODEV;
 
+	if (platform_device_register(&tpm_svsm_device))
+		return -ENODEV;
+
 	pr_info("SNP guest platform device initialized.\n");
 	return 0;
 }
-- 
2.48.1

