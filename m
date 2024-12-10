Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D221B415C
	for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841301; cv=none; b=L4IH3OZCFpGAiUDE4Be+qYveLYiAU6Yp5IOFfhoI+0AVh3/HK3BRD4mNxCLVEyHGxoPmNQUu8UGPsnYmK8/7NEBOCHSJK0qKFHolNdx9H95+mGkcDi1vGv6nwqmYVtkt4oKZGOoOZZvEHW+pNet7eaGkjAJ/NDeic8DI8hLDLPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841301; c=relaxed/simple;
	bh=I3+OgVND3ovs3EabmzXGFURX+i4WzYcd0zLU7C8kE5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ahV8P+GKBOikGMOeeDJAeshVXQcYIB0CCx25Hj0LDPloezAujosN/eeEENNOp0rEiyPVWDTVpzgoUkmS7WIUB5XBqppHVneg2Nd0xulNcFJUg2UZglE9rgIXPRRiuAxhh0ycJJi20WEO3pkdhbOghuKyTYqObAG2NX/pZz0lGWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TDjH5O6g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TDjH5O6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733841298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHZJG01hNeaIMCFXcC4aAtIq9wGcVNYKpI5sbt4iaAs=;
	b=TDjH5O6gJy06twWi4M07rOkYbJ4CCA8LwKMHAf/23rgxIfQHKkhcKRJQ01/2KlKpE43rnc
	BkKySiGhDkgdOW8b24Xtacy74OLFq1mksXaSoAYJ2P49xMuzQGVItpVUJAHYqeZEUrE/Z7
	hNyFFdwqilquh9X3p9RrZxP4jGUTDtY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-5M32nZOLMr66lDwtivtnfA-1; Tue, 10 Dec 2024 09:34:58 -0500
X-MC-Unique: 5M32nZOLMr66lDwtivtnfA-1
X-Mimecast-MFC-AGG-ID: 5M32nZOLMr66lDwtivtnfA
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-466b72ca44eso78646681cf.0
        for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 06:34:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841297; x=1734446097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHZJG01hNeaIMCFXcC4aAtIq9wGcVNYKpI5sbt4iaAs=;
        b=nHg5ClN2pvrhqB3V2YZnvYwx6KyF0Oq4vD/q/K54D89VrEv5JWpL2HiOLmaQ2FJypN
         rQIB56vxw9UJ5y+e2kUulicFp4KFG0Xjbr7509+PTReIgMqOCqkiS7DrZIkJWi9pprVB
         J1MU+x6pVkGN3OIQM5LuAr8Rg4+rV4kYmzdB4Q/rIc768JBbm0vong7r5jllmfZhXZib
         r3qEL6bV2TPi63qA+riA4UleoubgVwlKMGeFxEm1ov5QvRBpOR5hB0Jyf8yQGxFRR+QD
         awndi/p5ayPaoANys9yUQ0/BkhfadQ5VfiNvAO9OVrY0uF4FueTNqzPcEuH0P4+G2aHN
         w8RQ==
X-Gm-Message-State: AOJu0Yxziu9CIYzkoChK7lLyYCXKjfcBhK/LsKxOlG7psEH/h40Cbcg1
	oPG66wPEecsTxeRzcq79zxmxw3n02s+yTReeb0LmmeKel4wZZzGyETiCjgDc4o4VW0jNsfV6HDO
	3ScGyM+Qxi114Emr/q9Jt5TXr1nZraY5PbddMLCmh60ZpeVy72P3aEWFYagWVUA2DYkkxQbNL5G
	tdcL2dY0sQj+qPpS4LsMVLR7h+RV0sJiPmh7uXKH1EXaU=
X-Gm-Gg: ASbGnctiZNnojoP8uvHsS2AuRn5yEswX9Ax/Gap1TjwNlZMQxgYVJAg7Sn5+yoh/pHv
	uPvS6C/gc3f7Bw7H8HEn9KgEHgzrBXry1srFVTgEMJ74w1lG5kHvQgNTAplbGpVtXXr+1pe/5tG
	+qGlTS0FstC3k6j2chkDSa2LrSkWcfkdhotW44o5IMyItu89WvX74oClH+YIEXtP6KTi5S58fnn
	jAHN9l9uLBUbO7GnURqXC7R2UFg+WenrH51aZyYC666McvjH504QdF1+aQo8hetc4c/b7f3BcME
	b/19VvujgdpMa4VE/LL0ME5Es+9wkdA=
X-Received: by 2002:ac8:5fc6:0:b0:467:6505:e3c with SMTP id d75a77b69052e-4676505132dmr138668421cf.24.1733841296919;
        Tue, 10 Dec 2024 06:34:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWTua5aJb1pNQFOVrnxFBRlJAcVPzKgg25Q3AMf1JLy1jJEt2pslYht0E+7saMZCCbUW+bWQ==
X-Received: by 2002:ac8:5fc6:0:b0:467:6505:e3c with SMTP id d75a77b69052e-4676505132dmr138667721cf.24.1733841296367;
        Tue, 10 Dec 2024 06:34:56 -0800 (PST)
Received: from step1.redhat.com (host-87-12-25-244.business.telecomitalia.it. [87.12.25.244])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675d0d9039sm27218631cf.22.2024.12.10.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:34:54 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-integrity@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	x86@kernel.org,
	Joerg Roedel <jroedel@suse.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
Date: Tue, 10 Dec 2024 15:34:23 +0100
Message-ID: <20241210143423.101774-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210143423.101774-1-sgarzare@redhat.com>
References: <20241210143423.101774-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u8wdxtBPgoqcyPP_OMWk648lcSZbGhnVcos85HP7kl4_1733841297
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: James Bottomley <James.Bottomley@HansenPartnership.com>

If the SNP boot has a SVSM, probe for the vTPM device by sending a
SVSM_VTPM_QUERY call (function 8). The SVSM will return a bitmap with
the TPM_SEND_COMMAND bit set only if the vTPM is present and it is able
to handle TPM commands at runtime.

If a vTPM is found, register a platform device as "platform:tpm" so it
can be attached to the tpm_platform.c driver.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
[CC] Used SVSM_VTPM_QUERY to probe the TPM
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
[SG] Code adjusted with some changes introduced in 6.11
[SG] Used macro for SVSM_VTPM_CALL
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 arch/x86/coco/sev/core.c | 64 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index c5b0148b8c0a..ec0153fddc9e 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -21,6 +21,7 @@
 #include <linux/cpumask.h>
 #include <linux/efi.h>
 #include <linux/platform_device.h>
+#include <linux/tpm_platform.h>
 #include <linux/io.h>
 #include <linux/psp-sev.h>
 #include <linux/dmi.h>
@@ -2578,6 +2579,51 @@ static struct platform_device sev_guest_device = {
 	.id		= -1,
 };
 
+static struct platform_device tpm_device = {
+	.name		= "tpm",
+	.id		= -1,
+};
+
+static int snp_issue_svsm_vtpm_send_command(u8 *buffer)
+{
+	struct svsm_call call = {};
+
+	call.caa = svsm_get_caa();
+	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_CMD);
+	call.rcx = __pa(buffer);
+
+	return svsm_perform_call_protocol(&call);
+}
+
+static bool is_svsm_vtpm_send_command_supported(void)
+{
+	struct svsm_call call = {};
+	u64 send_cmd_mask = 0;
+	u64 platform_cmds;
+	u64 features;
+	int ret;
+
+	call.caa = svsm_get_caa();
+	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
+
+	ret = svsm_perform_call_protocol(&call);
+
+	if (ret != SVSM_SUCCESS)
+		return false;
+
+	features = call.rdx_out;
+	platform_cmds = call.rcx_out;
+
+	/* No feature supported, it must be zero */
+	if (features)
+		return false;
+
+	/* TPM_SEND_COMMAND - platform command 8 */
+	send_cmd_mask = 1 << 8;
+
+	return (platform_cmds & send_cmd_mask) == send_cmd_mask;
+}
+
 static int __init snp_init_platform_device(void)
 {
 	struct sev_guest_platform_data data;
@@ -2593,6 +2639,24 @@ static int __init snp_init_platform_device(void)
 		return -ENODEV;
 
 	pr_info("SNP guest platform device initialized.\n");
+
+	/*
+	 * The VTPM device is available only if we have a SVSM and
+	 * its VTPM supports the TPM_SEND_COMMAND platform command
+	 */
+	if (IS_ENABLED(CONFIG_TCG_PLATFORM) && snp_vmpl &&
+	    is_svsm_vtpm_send_command_supported()) {
+		struct tpm_platform_ops pops = {
+			.sendrcv = snp_issue_svsm_vtpm_send_command,
+		};
+
+		if (platform_device_add_data(&tpm_device, &pops, sizeof(pops)))
+			return -ENODEV;
+		if (platform_device_register(&tpm_device))
+			return -ENODEV;
+		pr_info("SNP SVSM VTPM platform device initialized\n");
+	}
+
 	return 0;
 }
 device_initcall(snp_init_platform_device);
-- 
2.47.1

