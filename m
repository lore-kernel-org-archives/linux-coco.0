Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CB24BC15
	for <linux-coco@lists.linux.dev>; Thu,  3 Apr 2025 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675011; cv=none; b=FnmcgaRVwmHLbS+XDguxvD/uJsS40c6QOQSEzLvIz88L6EbGMIc8UfK1D8q2YWQ7fzqN2L4SJn5F9QA1/mnm9tPv6p+kVYlc0JvoFhY8k/q2W77q4tqfSnEdimJpekexhw+d7bX/b6F5WZas5w5ysaqUrn7fPHMxMr9YEQ+KRqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675011; c=relaxed/simple;
	bh=95AbKM5/KwL2zVTjvGMvU2UbnZhLAbo6VoxnM/Vc07I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=LHAxnKQ2HPXeUArNfKC3ldkAk49WVSfQWpJs2jRwO1m0p9vTyyttTjvpt7Uf124Zgou2YrA0FeJGEKqHCJPoU8AaKyiyemDlGRezwtVSTE0YfJh9pX9QfDxABfIwZZVokxqMQk9V+y8K4x/YVvXJBFg66X4kqDTQLNL3LBSLi3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YwTJW6Ax; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YwTJW6Ax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743675008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qB/CtSEwcy7NwseWKn2u4Fr2QuPsDAEv+lGIosiLsww=;
	b=YwTJW6Ax5i6tRUBZaa+XGVJqzcgD+dNj8v4qHf9kj6vK2k8ET4Mvq4/puPe2Etp82Rnfl0
	pYKkMYK7grMw6GG9rmg226iN5STusNATVxdRDMSbVtKCQbiz4CKn8N36JKUTS9SeqrcTnv
	ScsyFrHdU/Alv+f2ZhoBkRf1j+8Onzg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-nURZ5GWcOMSHA9XThoDBDw-1; Thu, 03 Apr 2025 06:10:07 -0400
X-MC-Unique: nURZ5GWcOMSHA9XThoDBDw-1
X-Mimecast-MFC-AGG-ID: nURZ5GWcOMSHA9XThoDBDw_1743675006
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d733063cdso5568415e9.0
        for <linux-coco@lists.linux.dev>; Thu, 03 Apr 2025 03:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743675006; x=1744279806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB/CtSEwcy7NwseWKn2u4Fr2QuPsDAEv+lGIosiLsww=;
        b=Z79NkdlY91HaP4//wmfUXPRhafN7EqA/Ywlyp5Ox4OFGVRRG+tnrFXeUnjvs3vqDJU
         k+ctq5LcISjHJf4J2wm0gMMaSqaoEaXVKuhqzmR/+OvzeUYuIWn03m7IGS5fhvblj6Lp
         CsczPmjRpfZb5SEg1iWseCeLJaocjffI4+63c8Iz5XfdXYYiRxhhWnV5UiDgxb7dhPHm
         zB53bUUut7bbWqqN0tZ7VlSxX0/XVauiDSUdsk1MreyT6h8/7jF0+gK5zqdxA9hEsam6
         EJqkpxY0KvojFXwmrb8+zq7K3ov+LWI5RBH7sb71W5iDnaTFkaDfyjtQ80L2W/gQ4awv
         NOZg==
X-Forwarded-Encrypted: i=1; AJvYcCVHnj4aGDPJw3e+K9ZI3hfIK4kR+wttsFrNRQpIAPQMMQIrC02Zi+sVZ13RHQ3tkW3ItJzjSKyiFT7l@lists.linux.dev
X-Gm-Message-State: AOJu0YwjuPXmOitw+U5H13BdUn+iZraSb/DRe454WZ84Q9ZbbonfID/I
	2U3UkFlSJI3uGbDUpSMiKQepa7zN9D/4cG72mq2NL/n5Hv5PSr5eDBIUeTa94z9L9AqJVolPzQE
	MjAPbsMIlAoNe6utShzDRICCHOm2RysisRZIKlptK+ipU7yMDpPgbi6DAD1E=
X-Gm-Gg: ASbGncuxj9ss0+6g6FIPokuL8FdEmJrKD3QmB8ffr+RcvPsuzm17CRnFGP3LRVoyvge
	AJb5eKHbcZJxSXtyP4qql8KHL99PyKl5EAo5UA1dgL1s7Uf0ayktsY+KHiXOFxy6qBEN3EWyvf1
	Ma/KM+qnQv+JwuzHXqWrVkhvzccCAetXaAFOeKJppABVKwcuzFc851b1o9/8t2KMidWg6AGwJyX
	rbwhmmgDfQz9nFBh+vBD3nbVKvUhxUBHVn+Nq/+P4W6ARd0KKQA2qmDJvkSgVQhJnTU4smHhTuL
	kEkwvePVBReEnUseS4fjNtH2hZuFXZt2BFEfY2HOMoFWd5lASINXsMJnbmmE
X-Received: by 2002:a05:6000:144d:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-39c297e3f7amr4552181f8f.43.1743675006286;
        Thu, 03 Apr 2025 03:10:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECepLnUWcbOzJjNcNGIqxQwtp6LRHNvjNkwMgWLkILIn8YR8+ktWlYOnrFo0WoqQvUci03UA==
X-Received: by 2002:a05:6000:144d:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-39c297e3f7amr4552121f8f.43.1743675005738;
        Thu, 03 Apr 2025 03:10:05 -0700 (PDT)
Received: from stex1.redhat.com (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36691b3sm13702755e9.34.2025.04.03.03.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:10:04 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-coco@lists.linux.dev,
	linux-integrity@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Joerg Roedel <jroedel@suse.de>,
	Dionna Glaze <dionnaglaze@google.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-kernel@vger.kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
Date: Thu,  3 Apr 2025 12:09:42 +0200
Message-ID: <20250403100943.120738-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403100943.120738-1-sgarzare@redhat.com>
References: <20250403100943.120738-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VHGuXtMrZLtDP2IIIjzOPKv2OUlVkMqEJZWch30YJVg_1743675006
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

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v6:
- added Tom's R-b
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

