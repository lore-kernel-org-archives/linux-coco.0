Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09FF277806
	for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 17:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740762462; cv=none; b=amEf6gf2fXlyBeA5HZ5r79OBYKwZKu2JCcaiqH3iRUOymKbFl4Nyvxsk69U/6mO/dDwy0w+mrR1KkOFbdydrojs/rbowUYraHLlSF1ybdrylG4g6uuJ/rMolOs+BPM+mTX8go485k+TkITOGgkOWNIOpQQWWdFdlesye0UVZqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740762462; c=relaxed/simple;
	bh=aEEZifLiGL53ScaXp+CXWqgBL/vGbd9gqxOvNaB+tFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=A90CdyJISwniJb0kyJ8dtUHrnwlPyGeH72NZkmp5WHOVs5ewipbbsTsxKefMrP1Z1C7ZmlaSKEU46POPiJtV4eon0ghwDdXvGg1tYoGShrLZ1mu74ITuKQI8vmrj6W2tvO9WAep6GtvqLHKm+YVuXPGBIpjPZpeGYIX7VVFMg3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BzePlc1I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BzePlc1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740762459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qecp1vaZHwIDMhKlcuRnrXpf0LcVGcRS2iGT3pazr30=;
	b=BzePlc1IVnpZoZDkYAv/d4P9HFbIRfM6qRqC/OrFAPpVmI+uc9lZT76y1qlcnT8xMfzyBl
	4FcAZCD0Yp+aiBvU6LXk1XBqPxBae/tAgdF/YyzvVCeD8NkUqh/mYtoGtRwt0rGKeiIZi8
	xKGsx67cxdPExlFNHoiq+AabrdKBgH8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-Rwz5QJUtMOqhJzX0el7xwg-1; Fri, 28 Feb 2025 12:07:36 -0500
X-MC-Unique: Rwz5QJUtMOqhJzX0el7xwg-1
X-Mimecast-MFC-AGG-ID: Rwz5QJUtMOqhJzX0el7xwg_1740762455
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-390ee05e2ceso601167f8f.3
        for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 09:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740762455; x=1741367255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qecp1vaZHwIDMhKlcuRnrXpf0LcVGcRS2iGT3pazr30=;
        b=cbO4yK42H0sO1id4DFR+H6uX05fe1coA9Vz8qOPUlhNGvizVtxf+lW+HdbVQUy7PU3
         XNCmkoap+6bXCh+me/dwp/KPrcUx8CKxDEBlH8UD9HX6uFvcM5iPC4d333xDaoPUxAAM
         n3qOeajdrjweBnVdaoi0Y8HacxQulKFUf/Tus5r7mcDFJDfH8e3wVxp94HDK9WMrQwdk
         qh+JmWTCSXrshBwqK3cZxghPBAPZwT96SGwJjH++HxfqD+mW1j6Inz3ztsFVBgw7kzQz
         lA0bxB/Z9qZwmRO9SXXP0EmMcn2BJa7JDqm7WjU+/Yzrj+Mqp7YbuVTJ4kZC4F6kwqZu
         fBmA==
X-Forwarded-Encrypted: i=1; AJvYcCVtg2y8yDjA9TB1IDtdvROYb/UM2fgmYlf75xi9YAVqI10zKv3Jyij0VauRHxHIRtQx0DrB9Ob+8WVp@lists.linux.dev
X-Gm-Message-State: AOJu0YxO7us1SKqrqWUvoFtyDmgxOVLwKGMvLwZsFCl/kJpVyEAjsOhP
	2Ae291RQx/BIP5npUwFTlzPK1XqkJPd9OIr2ZVZHNDRbe1xmubU9lGzegSSQImiAPu3njoejgSw
	3IKXywgUl/LFRC7AQu4YCHslfqP4eRqFJHs8hnXTwNkQYgsydQISx1FleblE=
X-Gm-Gg: ASbGncvR1RBXMKi1MFunS8LYweMODFiUw5Hgt25cKHc4eFHSgWRibdYw3QW1vXiTeZP
	VW4X3obRFxSnco/flIWqV5kETwXW/IZ10IgTn6ZHDAjW6k3atZ4BF5ypy4soqWRkg4WaBv/uoYU
	PZ/L9nTJeZcggtyiaUlMkjd90yInmpgGl6sWmoCG1IciMKJw6xM/XUb/ZI8JQ1KeX3no1vD4CLH
	AskezXZ4EXH5z0ZBG0+4vPqkh0b3O0diBKkAzu4ruTrqKIF8EdQQwhbP3XtXLlxhKPjiLdB196L
	fpajqsLk78ttBQvzIeUm
X-Received: by 2002:a05:6000:2cd:b0:390:ebfb:ab62 with SMTP id ffacd0b85a97d-390ec7ca2cdmr2939260f8f.4.1740762454675;
        Fri, 28 Feb 2025 09:07:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYTdPfOuJtFP7Q89g8LktQNvlTWyj6T8itcLSVDjI66N081G17gpijbMoIoSAJ3qAUH7gyfA==
X-Received: by 2002:a05:6000:2cd:b0:390:ebfb:ab62 with SMTP id ffacd0b85a97d-390ec7ca2cdmr2939200f8f.4.1740762453994;
        Fri, 28 Feb 2025 09:07:33 -0800 (PST)
Received: from stex1.redhat.com ([5.179.147.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a7473sm5847556f8f.38.2025.02.28.09.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 09:07:29 -0800 (PST)
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
Subject: [RFC PATCH v2 1/6] x86/sev: add SVSM call macros for the vTPM protocol
Date: Fri, 28 Feb 2025 18:07:15 +0100
Message-ID: <20250228170720.144739-2-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: w6Kz-700Ta5bjz_181yHcqXm5swZRazCZmEGEtnVObQ_1740762455
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add macros for SVSM_VTPM_QUERY and SVSM_VTPM_CMD calls as defined
in the "Secure VM Service Module for SEV-SNP Guests"
Publication # 58019 Revision: 1.00

Link: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 arch/x86/include/asm/sev.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 1581246491b5..f6ebf4492606 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -384,6 +384,10 @@ struct svsm_call {
 #define SVSM_ATTEST_SERVICES		0
 #define SVSM_ATTEST_SINGLE_SERVICE	1
 
+#define SVSM_VTPM_CALL(x)		((2ULL << 32) | (x))
+#define SVSM_VTPM_QUERY			0
+#define SVSM_VTPM_CMD			1
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 
 extern u8 snp_vmpl;
-- 
2.48.1

