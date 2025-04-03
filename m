Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDB224A05B
	for <linux-coco@lists.linux.dev>; Thu,  3 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743674999; cv=none; b=ahh3d72iMOvypZ46PNp/8JCT6onmpoPXt/61h6KF4LLpWjFwUCKSxks4rUm/Jjl0ghUP3RsQxVPoieQ+x5jfZo2fZEmLntbUWwSY/2aJe8M/5fRbdbqjip2T42FlRWESDm7v7b6U+Kd+ZdI4m9jDd6bG3gAxfKiWl2TE0F6dH6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743674999; c=relaxed/simple;
	bh=MzD9Ad6mK9r4fxgZHo9dfRHlp4OQUEWf4LOVIPBSNt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OnteZNiH54amZb1Y4wc2dzjyIAWPQCLiDZWPUth8fTUIAjtf1HmnzEEqA6Rqg/fvTkQlKltzCujYZFg8rydE8B8cJgKqGl+H0rYt8GDbA2hxikvHJuzhG2WjcmDJv3Ku44xBENmBkOYdZwh6xkFj9AbrdJcGuyrcovQrt7t6kdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lcfq1uON; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lcfq1uON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743674996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpoVdmq8NVnUnZOD3EnO3m6uLwgKHTodPmRunL4I+rs=;
	b=Lcfq1uONoBt0Mr6kv5cI7ly7nTe4CpeD2FLv1q364AxRL+lln1Ig2902Pj+s8GR2PeF+eS
	VGjoPSYHx77qpcDJxs7LK7Dsd9jJ2sB2PnUP9EvcsyYjaALgexAYVqc//TwmB/revM8B6A
	Elitr7m+62UpmOPw8BeE3VGKBBmAL1c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-uD4tEbdaOQC0fOz3FSse7Q-1; Thu, 03 Apr 2025 06:09:53 -0400
X-MC-Unique: uD4tEbdaOQC0fOz3FSse7Q-1
X-Mimecast-MFC-AGG-ID: uD4tEbdaOQC0fOz3FSse7Q_1743674992
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d22c304adso8628045e9.0
        for <linux-coco@lists.linux.dev>; Thu, 03 Apr 2025 03:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743674992; x=1744279792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpoVdmq8NVnUnZOD3EnO3m6uLwgKHTodPmRunL4I+rs=;
        b=oXk1Zmv8JplLNS/0GzkotUcoVegUmon7AOkkWFsRbjjaX7F3VgvxulE6WiNtPg0aQn
         vyFTz0+Rn2NHJ8mZm3KfHC7K5jBV9PPFn4nVVIBJGRGgTAfVEEptt/Dsf16NoxbAC6x7
         KLy1e9G/3D8Wk7sHDBQvnec/CqHgASANdAKh1Rr2fgwqFlRuNylqL54xdFf2nrX6WA4B
         fJ9mrhdpDBpylSB/+p8owaZ0c3HGvL7Sd6MkvhEPlQG7g3pixnd3nFP1H3vG7pIGvT8o
         HG8sqTKw+HuOYI+1rFcv/1eMdX8+im1U07AWuSG4qhZn1ZNH5CdcNhkyEh0D2DHh0t1S
         5l7A==
X-Forwarded-Encrypted: i=1; AJvYcCW3Po27GPI6sBiysxIugGlCyUfqDV9sUCbdb0K6xcaf83U5Nk2pRO1qjryufvNO27n2/EptGlkyfHOh@lists.linux.dev
X-Gm-Message-State: AOJu0YxSNAfo6KxuSWfjLLgM2gyRUw0NUqQxVK5SCCfcVwEHo2MusafS
	1sCpxamj/94O/LWlhw6vJ+4bjBYnFR1wcWNZ0DwW119zyA+TepvNp1I+hcTAlbdkWn5dibdw8OG
	DfJdKsDT8nvTn6elT23c/uBCrSKIqSQaQokn63pXa4i03AnMshwlonWf4lWM=
X-Gm-Gg: ASbGncug/OwfnE2p5KqloPt/Qfp7mN56MUDhqShhgOKaSBeVLTyQl4ryuCGGa9kn2t+
	K9G5inS6eajrRP0PsE7JcffgXcMvxgwLLHsjZ+t9T5COrEfWFeWR1Ovy9ff026vMwsULUGua81P
	ygGurLNYGi+Ba7s7smYy55UR2+x+Zog5ybMt3PaJgDoCNhG0E5fKesWfDeBcml0Aegog9s3j9wG
	c+BUxvjgpG0tm2tc/1APP/RyO8zMefr3X+q54LoqOG363OpNeZ2WB8Bwa6KLoyOLM0xqmC5JRWS
	uP7Dg5W3H52w0+DEMt8QmPislZV2ugNvABpFfPDHSvdB5wIctEDDHvJgwwq9
X-Received: by 2002:a05:600c:1ca3:b0:439:9737:675b with SMTP id 5b1f17b1804b1-43ebeed6dd4mr24861285e9.7.1743674991879;
        Thu, 03 Apr 2025 03:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhK91zBiijUbCC0j/FPAiwjeqLDEV12HIxEw5TJqrQUqDMe/B3PRBRIv3dfMrFpNdP4Zc8Jg==
X-Received: by 2002:a05:600c:1ca3:b0:439:9737:675b with SMTP id 5b1f17b1804b1-43ebeed6dd4mr24860915e9.7.1743674991373;
        Thu, 03 Apr 2025 03:09:51 -0700 (PDT)
Received: from stex1.redhat.com (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226f2bsm1368623f8f.96.2025.04.03.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:09:50 -0700 (PDT)
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
Subject: [PATCH v6 1/4] x86/sev: add SVSM vTPM probe/send_command functions
Date: Thu,  3 Apr 2025 12:09:39 +0200
Message-ID: <20250403100943.120738-2-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: x8Q6UySBjdho4T9CL5Hv81-dnbruLyI2GylEzGDrY2o_1743674992
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

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
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v5:
- added stubs when !CONFIG_AMD_MEM_ENCRYPT [Dionna]
- added Jarkko's R-b
v4:
- added Tom's R-b
- added functions documentation [Jarkko]
- simplified TPM_SEND_COMMAND check [Tom/Jarkko]
v3:
- removed link to the spec because those URLs are unstable [Borislav]
- squashed "x86/sev: add SVSM call macros for the vTPM protocol" patch
  in this one [Borislav]
- slimmed down snp_svsm_vtpm_probe() [Borislav]
- removed features check and any print related [Tom]
---
 arch/x86/include/asm/sev.h |  9 ++++++
 arch/x86/coco/sev/core.c   | 59 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index ba7999f66abe..ba7a0a327afb 100644
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
 
@@ -524,6 +531,8 @@ static inline struct snp_msg_desc *snp_msg_alloc(void) { return NULL; }
 static inline void snp_msg_free(struct snp_msg_desc *mdesc) { }
 static inline int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
 					 struct snp_guest_request_ioctl *rio) { return -ENODEV; }
+static inline bool snp_svsm_vtpm_probe(void) { return false; }
+static inline int snp_svsm_vtpm_send_command(u8 *buffer) { return -ENODEV; }
 static inline void __init snp_secure_tsc_prepare(void) { }
 static inline void __init snp_secure_tsc_init(void) { }
 
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index b0c1a7a57497..efb43c9d3d30 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2625,6 +2625,65 @@ static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_dat
 	return ret;
 }
 
+/**
+ * snp_svsm_vtpm_probe() - Probe if SVSM provides a vTPM device
+ *
+ * This function checks that there is SVSM and that it supports at least
+ * TPM_SEND_COMMAND which is the only request we use so far.
+ *
+ * Return: true if the platform provides a vTPM SVSM device, false otherwise.
+ */
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
+	return call.rcx_out & BIT_ULL(8);
+}
+EXPORT_SYMBOL_GPL(snp_svsm_vtpm_probe);
+
+/**
+ * snp_svsm_vtpm_send_command() - execute a vTPM operation on SVSM
+ * @buffer: A buffer used to both send the command and receive the response.
+ *
+ * This function executes a SVSM_VTPM_CMD call as defined by
+ * "Secure VM Service Module for SEV-SNP Guests" Publication # 58019 Revision: 1.00
+ *
+ * All command request/response buffers have a common structure as specified by
+ * the following table:
+ *     Byte      Size       In/Out    Description
+ *     Offset    (Bytes)
+ *     0x000     4          In        Platform command
+ *                          Out       Platform command response size
+ *
+ * Each command can build upon this common request/response structure to create
+ * a structure specific to the command.
+ * See include/linux/tpm_svsm.h for more details.
+ *
+ * Return: 0 on success, -errno on failure
+ */
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
2.49.0

