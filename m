Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7041E1A18
	for <linux-coco@lists.linux.dev>; Mon, 31 Mar 2025 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417569; cv=none; b=Ba1RdRSaJqfHKLp4cHJRe55cxuKk4x3hWahiuCIxOc9xWWVpSGjd70cXv8KYgiHljVXHGP8pBG/dmlVEgi09ENHGviG7HaREQRkAwmy1DdLh6kiJDOJ8oNanZUrTBGyAdigtYOSDA3aiAxWb/KozW4t/2zJrKZY8FEIEDiYoT5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417569; c=relaxed/simple;
	bh=VSwSVqTTPnbOpmlHq9MOfH3OWqH+XBMIsW4BP4w9E5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=SKE7X6LpIeZ9tn1e7lqs2ThDaDifOL1ZqMqhxfVELhlfhIebT34FZq1BKy3AnIwCvTS4rTjMCgEoS4LdlbUaXSOMO2GAkSwljWfC6956jjTGH6sNEM8nTDwTGOw3rxEkaRYi4LXK/Res2fuiUUQQSRI/v65E2XAzCzkETmyTiMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fvQnmC5X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fvQnmC5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743417566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4fxR3joWDLb15zwEwdHZI3rgw4qmSYJti26bFJQ+VcA=;
	b=fvQnmC5XRAaCmxACp9PCSO5gQJNYFK5zvlHIKksmD54/QCYf4lbQufBEEoUDRceydozhQ3
	BgIAS8C0fAhP+q9gtUkyT3Wl1Z1nEkv4tKb2SeMdDLX8jjakRAw57SoLq4wBkrbD0lbTXR
	P0Uxv2SFXHZA9FYcIsZ60gsNZo0C5SU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-ZADikWlRNraeoEng_b_TFg-1; Mon, 31 Mar 2025 06:39:24 -0400
X-MC-Unique: ZADikWlRNraeoEng_b_TFg-1
X-Mimecast-MFC-AGG-ID: ZADikWlRNraeoEng_b_TFg_1743417564
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ea256f039so3125435e9.0
        for <linux-coco@lists.linux.dev>; Mon, 31 Mar 2025 03:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417563; x=1744022363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fxR3joWDLb15zwEwdHZI3rgw4qmSYJti26bFJQ+VcA=;
        b=quurEP3iSUFBRw9PsCoGu5w/1F156ksZxRnAOoBgrw7xC5HHBDGe6xSfVva/fU22zp
         Fzf/M0ANQjWa21TXckHAny2Vvgf6uYLNdGWa165uD+TINElseMj2MdsOTBC0H32dx5P6
         AnXQhZhFuc1V5TERq5itk94LwOPTZxGfOLvZO9P2qsvgWLwEFPW99ovlTGVDmELEDUNW
         4B2TV8R1by5CQOfzONcmbMMtPS0gtxL1Cl7qPhA60A28xPVLWvIUgZoemVMiZvi5TRId
         q46jZUyRLuJOMgTVnN2ar+fAOS3gVt7gk84JCpBFOwfGn+AUbqWLF3SU/i+qaSo4Q2tX
         NQZg==
X-Forwarded-Encrypted: i=1; AJvYcCWxfY7bbAc/T3CC6v+YcRcWmPQPoa5OiqsxbKxZtMjUlr+IEqmAlgFvXiKJxNr6cCEqjnHwzHSwXATq@lists.linux.dev
X-Gm-Message-State: AOJu0YyB6iIgH9F4rOj8tsbNfwxMnZ3xQpWz6XXH9/yy735f7i5bbfDG
	/xsyXku0dFcmD1nn3Vi9ameHSwHw5STf36p3gkS0ISIa93z4coLaQLmU0r1ol6DaNafS9Go8GoK
	kzgs0fD8okJ8JpirK1UlbSzzqiyDRjZRNkgbuJYRXL9uIYCjULErDbUpslAA=
X-Gm-Gg: ASbGnctAgZizE2tXcmNSIpleoApIhH3O/8Mn+lcZYA3y9z1GY2+WJ/z5dLHQ8OEu2t+
	0byX8N9i3q/iSs6MM7r+CrY52y31Pv2qwWQb4SiVGCsBdvd6jlxhwAu4Q+0fdrc35zXzXZKJdQh
	MrwedKEUMsizZ/kX0YiulaJjGlDzXGEV4CVl90EbikL7WiOBtb3/ZSZsZ3WwvGq3JHI5+u8FQzY
	a6RV/5OUoKgtKa/6ckBZtp2TmqNDI+PaFE3Osp1e6u+Mr49xcjKlKYFqiSYLiJDN2aFvGDAWzLQ
	+e1iBTxrBzFwh2LezbtvvA9aPEmxsbIUi5LBxFkcD4F/eGfqFiYW5+fKXdz+Hn8izg==
X-Received: by 2002:a05:600c:1d83:b0:43c:f64c:447f with SMTP id 5b1f17b1804b1-43db62bf772mr81331165e9.29.1743417563541;
        Mon, 31 Mar 2025 03:39:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSEY2IAvMlONrWW/ecIZqpU4KW8seEtaraLsrYv8QTUi3aO8abB8sFiMZjGmzhLkOrU2UPdg==
X-Received: by 2002:a05:600c:1d83:b0:43c:f64c:447f with SMTP id 5b1f17b1804b1-43db62bf772mr81330855e9.29.1743417563067;
        Mon, 31 Mar 2025 03:39:23 -0700 (PDT)
Received: from stex1.redhat.com (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66363fsm11273542f8f.36.2025.03.31.03.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:39:22 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	linux-coco@lists.linux.dev,
	Dov Murik <dovmurik@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <jroedel@suse.de>,
	x86@kernel.org,
	Dionna Glaze <dionnaglaze@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 4/4] x86/sev: register tpm-svsm platform device
Date: Mon, 31 Mar 2025 12:38:57 +0200
Message-ID: <20250331103900.92701-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331103900.92701-1-sgarzare@redhat.com>
References: <20250331103900.92701-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rXpqZTxHTCKKpabc0wwcyFO4ZICphFY40qBvko7IGO8_1743417564
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
index efb43c9d3d30..acbd9bc526b1 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2689,6 +2689,11 @@ static struct platform_device sev_guest_device = {
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
@@ -2697,6 +2702,9 @@ static int __init snp_init_platform_device(void)
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

