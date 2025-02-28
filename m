Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B22777FB
	for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740762467; cv=none; b=CiukZ0ZDGJiXfEOBUwOz5sGSBTIcnhq19AZvldxb+hHIicUOTj2FxW5ctfBibdtdxo3WBE3N/Cxv/hY5pJpBl907chO0KpxsI11IzBRhMeqPnoIlh1i/aFegiI4P6v3Mv5bV0DkMDIKj6dpSU2wiPEQ0AbFGxKqOSht8UVVqsio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740762467; c=relaxed/simple;
	bh=isgbJApTlCyBGPxQFjLRsJbEwGToiMAg7wsViEvYcmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Oy3LajNKmYu//RjN/nMlc8dJove3a8DnVYZzrNg2pwbHlnRoXIwzojVaPp+Q4hIrK+fUSuXZmnAvmlnpj2HHV+JJs6q2+XUlw5DjW9O/g43WjMnOvaDkAVEQIDIDNdV6bbaONBdWuDa6pj5Fox3TUr2hj7Oya0LON5PwI4XDCuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RFm+wqxz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RFm+wqxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740762464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7eRRsXwQ9b5BVtkXOCbQvcRoNNZrcFjbeyN4c0+Tojs=;
	b=RFm+wqxzk57tJkiWAhRC+oAdYyIQNcUa6YLxQ1B7KqbZzIPKjnvTY71FQ6tGM2ad+36ein
	qR/wWSCjbi2qH22vnjC9gzLQzdXMmB4CLlD7jNW8e9RzB6VGb5icvu5zSfZWfeZLVc9LYm
	u3nTi5f9CypAdwQ5l5/J5MSGlW88Rbo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-g3qbgzJ-Oc6PN5krlIolhg-1; Fri, 28 Feb 2025 12:07:43 -0500
X-MC-Unique: g3qbgzJ-Oc6PN5krlIolhg-1
X-Mimecast-MFC-AGG-ID: g3qbgzJ-Oc6PN5krlIolhg_1740762462
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-438da39bb69so16984835e9.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 09:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740762462; x=1741367262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eRRsXwQ9b5BVtkXOCbQvcRoNNZrcFjbeyN4c0+Tojs=;
        b=FDtCY8EfU+cmSDxVEV4WuANQmZ8e+GNRqjb6sncthop7ps/GW4xNsjN99bALLzocSn
         EiauhXKkEVNc9jR7PFr4xqcIPYu1xlIF6Sw44TLSmmqG6gdSEc+Hh6SOkawZ+YlJYFxa
         /bXK6uQUZDdmxZm38cSEy+o4h7k909U+6at+9XWssYWlrgj0fvS+T/lk5HbKlZazB9bY
         FfRTNRyBiF76bKNi8pHJjdNJTRg7lDgxUzm9ruQ+FSHsG3OQnt/EeXsMQPsXuU+GB1rh
         THAvby7IIOY6PsSpB5iWy6qhpfmPsi+0n7dKfNvi92JW4NhDJWG8+l/0zm1YmDk1lOpG
         YWKw==
X-Forwarded-Encrypted: i=1; AJvYcCUKlZAl1xS+HcNv+82J4LyBgtwtPSBwx1z+RvbKhqjZaOlfbThIOQRpeljy/Hzgp3+W6svS6CLHiLDB@lists.linux.dev
X-Gm-Message-State: AOJu0YziT4DiUruJl+VJ6yo7dk7cDzbZmhNwcfRxzciO2Jsg/GM9CCgt
	uLQT5XkzJy6iEeDrfae6N5Om/U28NvPIKdOeqxoYMkfchxHsrf71OBFxLGkX6HxwGBs1Ygo0pwO
	g6F1KPFmltbHFx+Lhubnm2N45krunX8QF5ah+gKPdBBOWfgwn7F3Mds7iW0w=
X-Gm-Gg: ASbGncupyR6l8G2U6BUZ/rLMpKS50M/Qs2vyXkZWIEllSPfL4BQ8i6nAkXH0b3SvVwl
	jQl4tdNhhmw2blrP9pTegyCa4EroODmpnbiAQ2Q12Q8O+xWETwgTiR5zABgFS5CVj6qxHk9iG9E
	SMg+/hraWx+nI1G3+zG6+WpzZQhXHalJOxE2FDC0ckcf87V6gfWsvU4Ggh3dEvZfcWQe9NMjSjP
	CXZXti92bttHsSspGYI+kcBZFVCXSOEn8fRdn3bGGcvNev+qpqzGdwL8W2qSsruhRt8dxAyg9Gn
	I+CYcyXIXQE3Qh5bgtKx
X-Received: by 2002:a5d:64cf:0:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-390eca53071mr3032884f8f.42.1740762461814;
        Fri, 28 Feb 2025 09:07:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUfCkTRPfiaBO1sKSMwjiWtyLlnIdvMfWDewKknFvnz/aj1uQU6OJDIxFqKk7dZj8v3YEtog==
X-Received: by 2002:a5d:64cf:0:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-390eca53071mr3032826f8f.42.1740762461199;
        Fri, 28 Feb 2025 09:07:41 -0800 (PST)
Received: from stex1.redhat.com ([5.179.147.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a28bcfdsm62305695e9.40.2025.02.28.09.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 09:07:38 -0800 (PST)
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
Subject: [RFC PATCH v2 2/6] x86/sev: add SVSM vTPM probe/send_command functions
Date: Fri, 28 Feb 2025 18:07:16 +0100
Message-ID: <20250228170720.144739-3-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: kdcordCYdBQDiLdTg6XT5OA76PcUCYBs6mv_lLZSmtU_1740762462
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add two new functions to probe and send commands to the SVSM vTPM.
They leverage the two calls defined by the AMD SVSM specification
for the vTPM protocol: SVSM_VTPM_QUERY and SVSM_VTPM_CMD.

Expose these functions to be used by other modules such as a tpm
driver.

Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
James, Claudio are you fine with the Cdb, Sob?
The code is pretty much similar to what was in the initial RFC, but I
changed the context for that I reset the author but added C-o-b.
Please, let me know if this is okay or if I need to do anything
else (reset the author, etc.)
---
 arch/x86/include/asm/sev.h |  3 +++
 arch/x86/coco/sev/core.c   | 47 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index f6ebf4492606..e379bcdddf07 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -485,6 +485,9 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
 int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
 			   struct snp_guest_request_ioctl *rio);
 
+bool snp_svsm_vtpm_probe(void);
+int snp_svsm_vtpm_send_command(u8 *buffer);
+
 void __init snp_secure_tsc_prepare(void);
 void __init snp_secure_tsc_init(void);
 
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 82492efc5d94..4158e447d645 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2628,6 +2628,53 @@ static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_dat
 	return ret;
 }
 
+bool snp_svsm_vtpm_probe(void)
+{
+	struct svsm_call call = {};
+	u64 send_cmd_mask = 0;
+	u64 platform_cmds;
+	u64 features;
+	int ret;
+
+	/* The vTPM device is available only if we have a SVSM */
+	if (!snp_vmpl)
+		return false;
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
+	/* No feature supported, it should be zero */
+	if (features)
+		pr_warn("SNP SVSM vTPM unsupported features: 0x%llx\n",
+			features);
+
+	/* TPM_SEND_COMMAND - platform command 8 */
+	send_cmd_mask = 1 << 8;
+
+	return (platform_cmds & send_cmd_mask) == send_cmd_mask;
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

