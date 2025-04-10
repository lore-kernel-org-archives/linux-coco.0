Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E1828CF58
	for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293106; cv=none; b=AR6DrpDRoG0tG3zOtQ7DRqUxeywqlR6V7smAVEVggJaSUtNCctWg8mXyGgJAmXQccGAdUlbz1BKt2yMXqaaRZ1G4rV4tfIlMR0p0dBeeJgJjw7HDefNDtKHcyh/f6dXiUO4zD/vQVQCftN1TEJc8HXmIeuWsQNbTOjYTPRqsRMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293106; c=relaxed/simple;
	bh=jjdOFFgqlMZcJK0ENY0EeRcZvGY/PqG+Cg3KwCJxajM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=LHnmvTbFW6eag2U+BQfdisaf67/kP6AMUXFD7lCFE2Dralk0mRHfgjIpnDsCm9U9J3ylXLYV/3qbGuTrs3ztFc+ubFOgO/YwdvzKsxryOEpt7GNZyveg1Cq6pQ/1p42I7+q/sst8dYCCoYtdZOw9xd4ClbM/H3Zf4kKU7ypRaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UgE7mi4s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgE7mi4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744293103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hirGwPCk5S8fr8wcRk+QWxpexKbLzBx8zDafwqq8PVw=;
	b=UgE7mi4sYi9s6RbaZk8WnHJLq5/Q6uyCHggQ70WlB/PUZzNsUK/HOdS6ix1o0fNbwLQTVD
	OFDDdJaoXCIBi/5EiaFnlFh0NKWSmiTBlY1d4Wiirtvg1fXAoogLu36lKrKAxv8uv17Tq8
	ejE1wjdEaoRyGrr5gbd9FeuHH69KvzQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-GIknLbLmPGCpLXBpLYvkrw-1; Thu, 10 Apr 2025 09:51:42 -0400
X-MC-Unique: GIknLbLmPGCpLXBpLYvkrw-1
X-Mimecast-MFC-AGG-ID: GIknLbLmPGCpLXBpLYvkrw_1744293101
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so7716975e9.1
        for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 06:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293101; x=1744897901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hirGwPCk5S8fr8wcRk+QWxpexKbLzBx8zDafwqq8PVw=;
        b=ngWDb2du4BH1B3iAhLX+QVI5boXBIFIVeM0x9EuI09HdvMfsHo7AxL0aGqK1CVBj05
         sJAwyqwSv/9rLKK4T/ZaHtiMRhtWzBTbN5RtMDXVmX+9i2U53u/Vw8DT4aVmwjFlon2i
         /YFSXMc9IW0CWa9eyB2pt+xHdlgBhSypcI2o5T7Pu5UID8P7M6nd0Ake4cUgrl50kY9x
         ZUGEqm1mzdW4l4UhTSOVYuCRUVAoptjMKOzlcp8FeLsV+wiVjvG+twhk3vEM7svbx0LP
         rrdViEc4BQfQj5EfUhLqCpnroSXwHrlVHUiUZSp+6xqCBtO1vZst0EtL2E4eqreqVhKJ
         ngGA==
X-Forwarded-Encrypted: i=1; AJvYcCX3YAHre3vvZIrV72FuEoSzGl2tX0U4WEpXhgitLcm81hZcs5n8t0u1/wMPgE7sdB3ZfuCSMpENZaBk@lists.linux.dev
X-Gm-Message-State: AOJu0YyLasw4fAwohpQz/0fcz8ivqDCwPvCbcK6Mnlzp8YXxZOhY9V90
	EcKSjglsAxnXntoDG5cElTlTSefJ+WVTLbgxYCB89f7uV2JSACJHdsjQ2Ingz70Jdb7h9E+MpK4
	BFdUWsC7A4Yx0KUKyFvMzpMRm1JnnFMB+hsXC/61lz1hUQCFWOeEXmpqa0l8=
X-Gm-Gg: ASbGnct9BPE5H6zL65h0SB5C09Gmhu9ny91dIdF8JcRk4JQy8Gr3gkvNUypa9ijbm+d
	5+GTz+T6Md0z2qhrvAdfkt+9k982/2YFjeYbUvSL37MNVUQ1ZEnBn/jhXcBLVWVWOmWj1wE+CSL
	8IQZxOYhJCBKCR6Vak+/33/7KB/8ovy6tuh2vFU17d6r+Z34u4JG61p/SPavHfOqTf8M3W/HxfT
	hRAqMtB/gjNyA2lFvQ/4Qrrn0kJ+JQSBCld5XsIbEfDk34YDvcVo7IVWaV2LmcWH2plewZu5Ko2
	2Ly2mchoTYN6zBpYjj2AJYIedxYjEn/X+WlliM7NLPMdghh1qDf9dmiwcmSS3A==
X-Received: by 2002:a05:600c:1e21:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-43f2fdcece5mr23351865e9.5.1744293101425;
        Thu, 10 Apr 2025 06:51:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW/+UygbSs3rimVhsZR25l1U5u5O39Yy7PeRlqUDpdrrg1Z1uyMNvSAu+c2o2wo8JQdf6sGQ==
X-Received: by 2002:a05:600c:1e21:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-43f2fdcece5mr23351565e9.5.1744293100851;
        Thu, 10 Apr 2025 06:51:40 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdfbesm4768782f8f.88.2025.04.10.06.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:51:40 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Borislav Petkov <bp@alien8.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	linux-kernel@vger.kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	linux-integrity@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	x86@kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-coco@lists.linux.dev,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v7 4/4] x86/sev: register tpm-svsm platform device
Date: Thu, 10 Apr 2025 15:51:16 +0200
Message-ID: <20250410135118.133240-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410135118.133240-1-sgarzare@redhat.com>
References: <20250410135118.133240-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JmhTCzHe0LuhJyx2lSpG8_hhRfWXn7txIAvX2t9WllE_1744293101
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Stefano Garzarella <sgarzare@redhat.com>

SNP platform can provide a vTPM device emulated by SVSM.

The "tpm-svsm" device can be handled by the platform driver added
by the previous commit in drivers/char/tpm/tpm_svsm.c

Register the platform device only when SVSM is available and it
supports vTPM commands as checked by snp_svsm_vtpm_probe().

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v7:
- added Jarkko's R-b
- call snp_svsm_vtpm_probe() before registering the device [Borislav]
- s/device/devices in pr_info [Tom]
- updated commit description
v6:
- added Tom's R-b
v4:
- explained better why we register it anyway in the commit message
---
 arch/x86/coco/sev/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 3bc5b47e7304..54272c9777cf 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2688,6 +2688,11 @@ static struct platform_device sev_guest_device = {
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
@@ -2696,7 +2701,11 @@ static int __init snp_init_platform_device(void)
 	if (platform_device_register(&sev_guest_device))
 		return -ENODEV;
 
-	pr_info("SNP guest platform device initialized.\n");
+	if (snp_svsm_vtpm_probe() &&
+	    platform_device_register(&tpm_svsm_device))
+		return -ENODEV;
+
+	pr_info("SNP guest platform devices initialized.\n");
 	return 0;
 }
 device_initcall(snp_init_platform_device);
-- 
2.49.0

