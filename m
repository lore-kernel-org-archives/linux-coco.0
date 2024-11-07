Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C678D21A4B7
	for <linux-coco@lists.linux.dev>; Thu,  7 Nov 2024 23:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731022132; cv=none; b=DIWul2BlbM1ETRgZJnObNf/OCR0QzHq9apc8NyHE+SUkpVCrjmwezRrpFmlhaA03N428UNLa/bgvKydhPC4lKinzX9nw8bRuKovaiNLAOnwgIxJBlK5iAEStOAEz2sd+5NsY8x753gVwKJPQ5sDrScOr7kKIg6eBNfdtd8MC+00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731022132; c=relaxed/simple;
	bh=lRBqf5twuEZRlunb4SU7u4RsPEMFdFwbD7rStcI1GVM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VptRA9vBrJsjruACE/Ixe7BFHGR3KY8Womh5W+v44eqiVT/146xHLg3VOfk9ZqrEvEEmrwF3TPlfp9JdOBWRJWpFXvALq5oLH31Uxgc0mmSeQ5STtHY3B+bUzz53VrRNWc0T7Rp3NJklrcKnL0isyQaSbveIQd5ZnYiliPo6Tq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l+aaxxyW; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l+aaxxyW"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e2dcea0f03so1589486a91.1
        for <linux-coco@lists.linux.dev>; Thu, 07 Nov 2024 15:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731022130; x=1731626930; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R5GIXxcbWN8I/ZRWs7VNYRYcdtYl9gfySVnkJreof1o=;
        b=l+aaxxyWfpgVpYTCP3qCLrNMP8rYPLIkuNAXFk5mdQX6cVOPd6mKhIscJWDdAZs2vi
         /+pMpKqrK9OEU6K9toBc/iBOihxOqqlJpB2lLihm2Q+Ifz+o6R/mvRVX+IozclsqrAA3
         2uD+RGkn4/i8SuydaFtj3X4tyE3+8ImSpPy3yau9H3CCXO2VzblHkQoW81Ezy8w/RQBy
         +zog+KWgnRXd9dWrSulQGgIQORq5Za8JtPet8XLeQybtBLoI8IX7Uu+xgI6KaUylDpiL
         AM3DEYQ/912ZIguXqV50+C50m7vRT6m8YAMW7b2J3j7YngeaOe6EAD6VswckHk5PRx9O
         6q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731022130; x=1731626930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5GIXxcbWN8I/ZRWs7VNYRYcdtYl9gfySVnkJreof1o=;
        b=NhvbV3MGql0uCMtylnAusbJlIDxfRI2qTPmz49JYPFmJaQyamDX1+3/jG4xUBOLm98
         0imfXAf8vOWuRhoHxElkUMxa2b4wnaeLebFaNUZhCnzleqCBEMTRtDe9LoFg0M83n1FX
         hcQ96hZOVY9gQM3Z8ZmyxVwX3OYwUgZPfASrH2wq9HgWGAQCTwpEo3/5LDPwq5eSqKlb
         /KWdktVMSLZ5KzNkGIHhDv+t0ul7qGTUapmJrD5j1QOV8ZitkCB6b4YI8WEeCModZ0vt
         tle9KQxn2walf8dpuPGy+JODiCtHzbtV4FnF+nQOL1287rWiTJ5O8WeFcVDkl0p5/Wr4
         bx9w==
X-Gm-Message-State: AOJu0Yws20tgIn0IISYfvKRvMh33G9ARBByS35vKIsrhmBwSNpMr77yU
	fBSnNrTLT/FVz6fcc+qtDrW1PsO0MtE0bgyxFnDYl/AW5CxFxm2xDy/EaHaUw3vhRm8HjQVs5dT
	w5o3YnMoCPtb3KCcu0mwYnQ==
X-Google-Smtp-Source: AGHT+IEwOfZDI4F3jRslzGIEdwn06Xqt2NhOKADKScJCrSFXrWa8oRKCWk++dR3cp8p6tEK54xsId3Hhy6ePNZyFVA==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a17:90a:39c3:b0:2e0:a07d:1e61 with
 SMTP id 98e67ed59e1d1-2e9b16e7a8emr6234a91.2.1731022130343; Thu, 07 Nov 2024
 15:28:50 -0800 (PST)
Date: Thu,  7 Nov 2024 23:24:44 +0000
In-Reply-To: <20241107232457.4059785-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241107232457.4059785-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107232457.4059785-5-dionnaglaze@google.com>
Subject: [PATCH v5 04/10] crypto: ccp: Fix uapi definitions of PSP errors
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Michael Roth <michael.roth@amd.com>, 
	Brijesh Singh <brijesh.singh@amd.com>
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, John Allen <john.allen@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, stable@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Additions to the error enum after the explicit 0x27 setting for
SEV_RET_INVALID_KEY leads to incorrect value assignments.

Use explicit values to match the manufacturer specifications more
clearly.

Fixes: 3a45dc2b419e ("crypto: ccp: Define the SEV-SNP commands")

CC: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: Ashish Kalra <ashish.kalra@amd.com>
CC: Tom Lendacky <thomas.lendacky@amd.com>
CC: John Allen <john.allen@amd.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S. Miller" <davem@davemloft.net>
CC: Michael Roth <michael.roth@amd.com>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Russ Weight <russ.weight@linux.dev>
CC: Danilo Krummrich <dakr@redhat.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Tianfei zhang <tianfei.zhang@intel.com>
CC: Alexey Kardashevskiy <aik@amd.com>
CC: stable@vger.kernel.org

From: Alexey Kardashevskiy <aik@amd.com>
Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 include/uapi/linux/psp-sev.h | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/psp-sev.h b/include/uapi/linux/psp-sev.h
index 832c15d9155bd..eeb20dfb1fdaa 100644
--- a/include/uapi/linux/psp-sev.h
+++ b/include/uapi/linux/psp-sev.h
@@ -73,13 +73,20 @@ typedef enum {
 	SEV_RET_INVALID_PARAM,
 	SEV_RET_RESOURCE_LIMIT,
 	SEV_RET_SECURE_DATA_INVALID,
-	SEV_RET_INVALID_KEY = 0x27,
-	SEV_RET_INVALID_PAGE_SIZE,
-	SEV_RET_INVALID_PAGE_STATE,
-	SEV_RET_INVALID_MDATA_ENTRY,
-	SEV_RET_INVALID_PAGE_OWNER,
-	SEV_RET_INVALID_PAGE_AEAD_OFLOW,
-	SEV_RET_RMP_INIT_REQUIRED,
+	SEV_RET_INVALID_PAGE_SIZE          = 0x0019,
+	SEV_RET_INVALID_PAGE_STATE         = 0x001A,
+	SEV_RET_INVALID_MDATA_ENTRY        = 0x001B,
+	SEV_RET_INVALID_PAGE_OWNER         = 0x001C,
+	SEV_RET_AEAD_OFLOW                 = 0x001D,
+	SEV_RET_EXIT_RING_BUFFER           = 0x001F,
+	SEV_RET_RMP_INIT_REQUIRED          = 0x0020,
+	SEV_RET_BAD_SVN                    = 0x0021,
+	SEV_RET_BAD_VERSION                = 0x0022,
+	SEV_RET_SHUTDOWN_REQUIRED          = 0x0023,
+	SEV_RET_UPDATE_FAILED              = 0x0024,
+	SEV_RET_RESTORE_REQUIRED           = 0x0025,
+	SEV_RET_RMP_INITIALIZATION_FAILED  = 0x0026,
+	SEV_RET_INVALID_KEY                = 0x0027,
 	SEV_RET_MAX,
 } sev_ret_code;
 
-- 
2.47.0.277.g8800431eea-goog

