Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB285233729
	for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686176; cv=none; b=bFiJ4y109xzzLsjiI7talYWE2Jajy+kpqLj5ER4vDo11HHJup6bidtSqu0bsnmXbYJANDZN5UszgTJEI7OwDlpDDhv5IcMN8/kZnrcFwEY2UjG0axTnJB6VUhI7sOVbsFGXrCeu8hJfj+uKypKGwTcNywx7H1zatYgYup5XJp64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686176; c=relaxed/simple;
	bh=7ofinKFlIYAPL0uFGFVvSScK4HwNUlqf6CGOFX+txk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=RJ/t9pEdFe3vZuhdr4YVPv0cTDD3Em2FHCCcy6SM+7rkr3R0wO5GakLyArnaYxHXbOmURm3GeaGPEqVG9UgQnE0jxwECbI2aZ0aYpAzcdsr7C8zPAKEU/AHuoGPWBB7D3yzg7MASmtms8khtaMRUWOjtkjkcrhfrQCA7tpkUZjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TZJGjvDo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TZJGjvDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741686174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Hg6I6nIDb7vIFIV7ygI8oxn0FMZLdQaKjCFJAirlRo=;
	b=TZJGjvDo5ZXoufPxReXh7s10S7A+NCgiNL6BesFiyw/5EvrLFbw0IkA2q3aKM0qw1rmHK/
	PQ/nkX7lHnzRUPcT+keyOx7OLRC5TWVZmkXCrzcRkB5hAocw4YtUGJqUOL42iV7hlsNXJI
	RUxTlgGoWw1rAGKLJB5Z4z070NYqGqk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-r0F0V4kYN7GCjnGhRbf3sQ-1; Tue, 11 Mar 2025 05:42:52 -0400
X-MC-Unique: r0F0V4kYN7GCjnGhRbf3sQ-1
X-Mimecast-MFC-AGG-ID: r0F0V4kYN7GCjnGhRbf3sQ_1741686171
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac254e4b515so454714266b.0
        for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 02:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686171; x=1742290971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Hg6I6nIDb7vIFIV7ygI8oxn0FMZLdQaKjCFJAirlRo=;
        b=uHwyB3Dp3+pR88GW1t0AeW5i3dvT0OTLAmGxz6fjEp/4NwpT4tWxLSwqR3d0Sdik8+
         LBpPMQvYMkIZtWcD4HoAPPscdC26TDOaM5HSP1eZDpgSTINQf5/Bsqajj0VN4bqzTkBy
         UBYqgJOSnpwenbRV85UNg7xnULJ092zKrC3HtqQOGbU28aJ0THoATOIqlT7F5W5DBD7y
         DHH+kAMjfo6WdDHGxriYLfoP1ZUPkz+jeJS/64Ck7TMeF3NxmOF1XicbZ6who79acVcA
         7QB7YXZ4ue0CEIxTliPDl46Mmr2kWRnKfzhTsCc+drvXIkRmlJ2EcZ9ACcLKwicuTtjk
         5ybQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIHMLmhUoZxkM0yuPTK/B8jGYpGntz+STph7/tm3FAcMWwaHYlx1Hh21wm/XVeVd6xtOD70yIfnnO0@lists.linux.dev
X-Gm-Message-State: AOJu0YwboE++og2NFgAeA9n69JUZ4/mh9DI1vc9W8kPMB0ggtvwq5KKI
	LvLv+QoeXl/L4nqzX63fTL8O9U0fO81CEeroBFnO+VmdeXgVX5wtNcCAm8fmL14jBulC4S5UTlq
	0dn32uZ6/7LDpwOxAHI9TCRqIgywhv75A0mtsz12j1OA8HRJArz3hLTxB4/s=
X-Gm-Gg: ASbGncvHPCGXoSoyKna+PRe/i3INTqG10KCO2aUghdjNthi9nrPVOjnJMfmLtpjaOD8
	zoyqxJUbKkmj68SNlGOGrAxMoxmelmNJujH6Di1K7Kqv7TkG5Cft5A3MkDqXrAmbazx6LpL9LVG
	YgcdytqgPpR7msdhYbrjXDY1STiupQn3DqIHpvNXC7oAsXNpWxkz2ifoS+gg95pqKwI+yL1g48H
	mLhUErzmWsYVjW2SX1/cjpb2KuZ+fIDrNdquAUpYn2xd4/mU8VtJeQPgetn8oz9U6Zrl3cSdaoS
	3sGrbAeaiSIlEDWav5XSrZmrZGc/qqZzoDSLClvZ07YXHndXfJOpxq0xVNiy1YEJWNvHQZhO
X-Received: by 2002:a17:907:a310:b0:ac2:6fc6:b93d with SMTP id a640c23a62f3a-ac2ba473173mr370177366b.1.1741686171315;
        Tue, 11 Mar 2025 02:42:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkmP0r13TRekW78HkAFefp5cjLkHl6Mq2Ghd/8jrWtGCOF1SbwGI8W62TAbwjYfxllk7Faww==
X-Received: by 2002:a17:907:a310:b0:ac2:6fc6:b93d with SMTP id a640c23a62f3a-ac2ba473173mr370172766b.1.1741686170721;
        Tue, 11 Mar 2025 02:42:50 -0700 (PDT)
Received: from localhost.localdomain (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239485bf3sm903753666b.63.2025.03.11.02.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:42:49 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	linux-integrity@vger.kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	linux-coco@lists.linux.dev,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Joerg Roedel <jroedel@suse.de>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 4/4] x86/sev: register tpm-svsm platform device
Date: Tue, 11 Mar 2025 10:42:25 +0100
Message-ID: <20250311094225.35129-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311094225.35129-1-sgarzare@redhat.com>
References: <20250311094225.35129-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HBhIMHVeY-32IFtMJfOh9caokBz3_T7GbOdMP_mYpMk_1741686171
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
index 2166bdff88b7..a2383457889e 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2664,6 +2664,11 @@ static struct platform_device sev_guest_device = {
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
@@ -2672,6 +2677,9 @@ static int __init snp_init_platform_device(void)
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

