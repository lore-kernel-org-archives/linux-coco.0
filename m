Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1981B6CE1
	for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841293; cv=none; b=U1QCHDUhuu65t2lwRpDDroVt+gYSFQfWANtDCFqovMDecDOmCW8RfEBnSfXt20nJB9hB6CtDGP7S7TyHBbztgtlr4jFffXmUNh6w4w6YU9JAm7FFLu9lQe9E0MyTlvYNzYH3Ea0d9D1pCI2TKHwuOF2oXf66+yXItqhAFeXfzNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841293; c=relaxed/simple;
	bh=hKVfthvsa17ETqwzM+IPunkLwW1BQ0tuuiDhl+vst78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=WGEl+ILjMeq16xeYuDoMmCg9Ru/qn5dk1oRf7RJwqi0WJi0ov/RBDa85qMAI5k/QN0br9ARx19wPxEpDLFr2YJ9Cz3aEXL9w+80Wort2+0oZHaauxZIN7mCpGdDMoWGu06suIYmAog8dRm5IMbPWcxeYSCtx0dL8gSNNDXp5oBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Van+s1NP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Van+s1NP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733841291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kkig53CpkMCs8xZ5GQefN+G8yQyR6/dGUcen+HDOvno=;
	b=Van+s1NPnaa0QYtfkZOdJ9mTqohjI/6m7C/dte403uLpCbG8h0tUwszEZcuEmJoIm/aS25
	9VWt0xqtRu1YBFWEHueZld2keecCMlK5ikrMquBCkKz1LCjbpRIJ+JxCrUcKdOuzjRbSHi
	19y4w6MGzFYxs5DDNatNC1i2cbPA9tg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-XBvXIaU1Ma2CqFGcLQZTVA-1; Tue, 10 Dec 2024 09:34:50 -0500
X-MC-Unique: XBvXIaU1Ma2CqFGcLQZTVA-1
X-Mimecast-MFC-AGG-ID: XBvXIaU1Ma2CqFGcLQZTVA
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8f8f69fb5so56826376d6.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 06:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841288; x=1734446088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkig53CpkMCs8xZ5GQefN+G8yQyR6/dGUcen+HDOvno=;
        b=LGbKOhoed1xqvJn3G9OKYvMqWhqfsqrU4kPF32jzKpKXrnwXFMXPXG1jdpZH4AAbIG
         yEFNbtF5Zh8IZX9YsE1sxIw+Vn3C35N3KEWG/Ecq0ZpaPq/3888z66DYnD9c6YRfQXU3
         +WUkYA43u0q3Tz41qKqVaZ80dGGH4sqD9q2iP1T8Lm3rvZY2AoCBwJt1uAzpnTIbytPP
         OsTGXHMWGr4KAzrdtqIEE0doq5W6FyxnxToqeM1CXSDT30JMZuTrAk3DKYbs/rQhxA+n
         eMLuD/pYkKCGf7/HfllaoaUArtJ/Qh4Xxq6MSHGK6v96RXDVmJ7NUNDz8tnU18Oz2ava
         1agw==
X-Gm-Message-State: AOJu0Yw7pExTHMN2HQpTRAIMqh4GL22MZGr4lh1HYK8DQnLqU42K2yCB
	2MZC47rxOBi8BtfJKvTs3fEQcAW+R8wFcj4bPxajc/+rZFhqcHRa3cLAYV+lFlq8zAUgUKyjRiF
	JN0GN0vgKd1DHNUujlowaba0glseXCKz2oVzGMfDw3SXhIpOJ9zOt8a571j4yMoUZzus87go979
	EzGKmWYLz1U7j3nTPyCTK0Bi4pkYpf2VvXK0RKxiEEqoo=
X-Gm-Gg: ASbGncuedEwMgiymBI7WcYXYqCOMGwVQw/GHV/yQR34GqHxV2AI7mXm+327yTRuHHUL
	ucvxdEwNqjbIZ1u4rhrUZ4h1POm/401vX++Ok6Y1CWOeOviQNxE8MBhSfbzctADV3U78M//IjQi
	/O059MMuBNP2uIMVoTEtCSr7lprtogZwGoIHtSjFLlYLsATwf5Xo58iwbN0gE/Jajj5WLMb1i95
	mphCmJHYn6leqvr6ke9i9KexlWUreMBIz0rJTWZ30TJInBHmbjFfJkLwB5BfM6o6wddbJylC8ev
	F9rECTG0VBoZqeojiwgR82+xNQm86nk=
X-Received: by 2002:a05:6214:5087:b0:6d8:f50e:8036 with SMTP id 6a1803df08f44-6d9213ba859mr65685896d6.20.1733841288430;
        Tue, 10 Dec 2024 06:34:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSop28FY6IektnPFRQjQ8gA1PitVY9Yf0WUJf69W1zgtjztC/5xoivV4T26/rVtmO6MIg6TA==
X-Received: by 2002:a05:6214:5087:b0:6d8:f50e:8036 with SMTP id 6a1803df08f44-6d9213ba859mr65685226d6.20.1733841287948;
        Tue, 10 Dec 2024 06:34:47 -0800 (PST)
Received: from step1.redhat.com (host-87-12-25-244.business.telecomitalia.it. [87.12.25.244])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8dac1434esm60163516d6.124.2024.12.10.06.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:34:46 -0800 (PST)
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
Subject: [PATCH 2/3] x86/sev: add SVSM call macros for the vTPM protocol
Date: Tue, 10 Dec 2024 15:34:22 +0100
Message-ID: <20241210143423.101774-3-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: yj9w_BGp9koZoQbFSwv05Gr3S4axcE8g5eXtjFmLza8_1733841290
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
index 91f08af31078..97dcc8d938a6 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -365,6 +365,10 @@ struct svsm_call {
 #define SVSM_ATTEST_SERVICES		0
 #define SVSM_ATTEST_SINGLE_SERVICE	1
 
+#define SVSM_VTPM_CALL(x)		((2ULL << 32) | (x))
+#define SVSM_VTPM_QUERY			0
+#define SVSM_VTPM_CMD			1
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 
 extern u8 snp_vmpl;
-- 
2.47.1

