Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99322E41D
	for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686165; cv=none; b=CNC6yPNfgUOs1GtRi2MoNmLTcabH3cATZk/NC+bZ/85R458TQKE8335tOEh7T+qwLGBVIG+7HPSLYzhLX20hrHV+rKRvSyyPJqFsd1vQ0URdaqx9pTWAkirefLhYJjW6XZTtOR6z9OLKJYkkjIF//8CkPWriuod0DJyAEp5GRZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686165; c=relaxed/simple;
	bh=s48TuCB7hx4s0XQbfy+bStqom7rSsuzABfR49ZEXiRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=LSKfvjNgbtVcgPhAokRU8vWFF4EbTp2cPM82/EaPBQrPeYJ5/kXcdVf4UwOKmz+NXOT6UlEGfPxwWNMcW9FIFiTFm/dYQ936f6Xpkv1L4/i7wB4u8WNKbVqk4YGSydSWTARR8Ay4FLNKkuC9Z8timz4hl1N9llQ6/CkjPRba3B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Micx7+nO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Micx7+nO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741686160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWbgBYfOGia6Jpo6dySuLR4cc3OA1mqpDszmSXqcblw=;
	b=Micx7+nOZMR/RihdQbdwbOMC2FMCwiWY7eVY9OMFtWOFblIg13BzsGgILTCu1Qlgjoz/F7
	2h1r/+WR3eKHv9iLZmU4jGTcpsRpWJjdyPCYlaji0JLzh8ArIWcGIaRzM2bk8xEl2nvlRx
	3mBKQEkkJqaCq7XTrb77c3MnFM0VkY8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-9YgqQ6YtO3anOdyUW5w5rg-1; Tue, 11 Mar 2025 05:42:39 -0400
X-MC-Unique: 9YgqQ6YtO3anOdyUW5w5rg-1
X-Mimecast-MFC-AGG-ID: 9YgqQ6YtO3anOdyUW5w5rg_1741686158
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d9e4d33f04so5127193a12.0
        for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 02:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686158; x=1742290958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWbgBYfOGia6Jpo6dySuLR4cc3OA1mqpDszmSXqcblw=;
        b=p6H6tr549STCm48gGiJ8M2t8OFpkZLBtPR8gvlQxOm/NHFJwzd0f/wVQGUnuZkMC5W
         6/8WafacL9c9YbmXKetSiY/eMj36AClRWwZl1U2aSqDmd+NKRW8TNrDTyO1cd12Va5dX
         GhyM0iooEotCjClc4aFsrJlfT59K3cIG+4bpIvlU36Q+P4WX5/bk4W7nMXDSlBUlBd5q
         RKAOcF5OGqmrrHplus8ZV06cNqlx6K6iHfLbzwbzOiWUvQPa9BPLpH/Wen/l64Os0s0/
         KyPV1MukKhHn9n+bwGe/bwIkztRgF1NsrmC4836M4IxfMOXojSYOtlCShfGclKi1OBmj
         2EkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW41Eidcw1vfd1gTlTcgsT+0NpG1reRo6mKvtWNA6sEkopiez6s0Q3Lac7EPv+UMo3WJTRdbhUEP8V4@lists.linux.dev
X-Gm-Message-State: AOJu0YxCB6pmRYJav/l4I8T4YtqLi23CXOm98NzCtGI9oVwhmF1s3Abd
	1NQWW/HJhldOh06K+Z1VRDK2Za0fTbvzLM8gBJani0RWk3/ZxVqRuYHG+SMdgJRwF3/avE1fh1j
	0aIqdM1WCvsnVxLQVa++aF7pYVFn4d3Spb2Vz2LeAdNbPnFSGM4mtZ/ZINx0=
X-Gm-Gg: ASbGncusKN6JALFIr8NczjmW/lLIOiysEezZNLke0z951FDxXKAROfkifzVl/BTkDeg
	XbP6jjob8Md9clY4X2+okO9Xr8cDt7v3sJ4+NUVNsgeTAdqiDGF6Gcc7sEEjnoo2BsToAgSe2Zr
	YBjL6q9hryu5BVO+zWqfGgS17bEHh7ZB88Eu7tDK086o5YPhwIqwqR39W5dDsaQJRj65E1yiAeX
	lPYUFpUKlRxYtg8qVtD1Pt/UAfMvi40c7IVIYvwRHg7utohGy5f7aA1ZY9uOKri2qUVdSV2xEAb
	DOJtBdnMQ7L6ERU7+6PHKKbsCKfXjvute2TD5/94ij7HZeI2w76BqrwPstbsvxO7pqF4fNIx
X-Received: by 2002:a05:6402:254a:b0:5e6:1602:bfbb with SMTP id 4fb4d7f45d1cf-5e75f984412mr3427194a12.27.1741686158201;
        Tue, 11 Mar 2025 02:42:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPkM6rVc1QOWMePtECn1wZste/fTBV6MwarFwJ8JBd8XyGWLzR60WZC4WklV0jI8qfpX5GoA==
X-Received: by 2002:a05:6402:254a:b0:5e6:1602:bfbb with SMTP id 4fb4d7f45d1cf-5e75f984412mr3427137a12.27.1741686157633;
        Tue, 11 Mar 2025 02:42:37 -0700 (PDT)
Received: from localhost.localdomain (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7472169sm8085277a12.24.2025.03.11.02.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:42:36 -0700 (PDT)
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
Subject: [PATCH v3 1/4] x86/sev: add SVSM vTPM probe/send_command functions
Date: Tue, 11 Mar 2025 10:42:22 +0100
Message-ID: <20250311094225.35129-2-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: qGQlsYzozI62ssAh_pz6doz1U_ivMudcbG_87-peblw_1741686158
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add two new functions to probe and send commands to the SVSM vTPM.
They leverage the two calls defined by the AMD SVSM specification [1]
for the vTPM protocol: SVSM_VTPM_QUERY and SVSM_VTPM_CMD.

Expose these functions to be used by other modules such as a tpm
driver.

[1] "Secure VM Service Module for SEV-SNP Guests"
    Publication # 58019 Revision: 1.00

Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v3:
- removed link to the spec because those URLs are unstable [Borislav]
- squashed "x86/sev: add SVSM call macros for the vTPM protocol" patch
  in this one [Borislav]
- slimmed down snp_svsm_vtpm_probe() [Borislav]
- removed features check and any print related [Tom]
---
 arch/x86/include/asm/sev.h |  7 +++++++
 arch/x86/coco/sev/core.c   | 31 +++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index ba7999f66abe..09471d058ce5 100644
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
@@ -481,6 +485,9 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
 int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
 			   struct snp_guest_request_ioctl *rio);
 
+bool snp_svsm_vtpm_probe(void);
+int snp_svsm_vtpm_send_command(u8 *buffer);
+
 void __init snp_secure_tsc_prepare(void);
 void __init snp_secure_tsc_init(void);
 
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 96c7bc698e6b..2166bdff88b7 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2628,6 +2628,37 @@ static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_dat
 	return ret;
 }
 
+bool snp_svsm_vtpm_probe(void)
+{
+	struct svsm_call call = {};
+
+	/* The vTPM device is available only if a SVSM is present */
+	if (!snp_vmpl)
+		return false;
+
+	call.caa = svsm_get_caa();
+	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
+
+	if (svsm_perform_call_protocol(&call))
+		return false;
+
+	/* Check platform commands contains TPM_SEND_COMMAND - platform command 8 */
+	return (call.rcx_out & BIT_ULL(8)) == BIT_ULL(8);
+}
+EXPORT_SYMBOL_GPL(snp_svsm_vtpm_probe);
+
+int snp_svsm_vtpm_send_command(u8 *buffer)
+{
+	struct svsm_call call = {};
+
+	call.caa = svsm_get_caa();
+	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_CMD);
+	call.rcx = __pa(buffer);
+
+	return svsm_perform_call_protocol(&call);
+}
+EXPORT_SYMBOL_GPL(snp_svsm_vtpm_send_command);
+
 static struct platform_device sev_guest_device = {
 	.name		= "sev-guest",
 	.id		= -1,
-- 
2.48.1

