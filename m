Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FE421D22B
	for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 23:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731453793; cv=none; b=cCFLPQORibo8YjVxuU60wyzYyPzIoQ/Ksgpb1lqdj/12VNzYoUqm+Ew8z8jIwa6Gx/W8+cY820NsT/rFFZWC/JINwDINSEp+qxpBM/CB7/zkoWX3Zmsku+ZTIrpczHBZuKpCHaH5/1jHxb8L4qGMRP0/BNhcIsuHkBB6Ls/uSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731453793; c=relaxed/simple;
	bh=1hS42kMCXh2fd2/NsPf3DiCppJSEIF2GD7L2ejW+7Kw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FRq99uHG+96jSo3Wv8wsj9NKL1YHGn579fM8od4njylJbV8OZXhKPyWG2n9Y47Gnj1paAGOt9vsIBkaOyMshT8HPokEl0ugf5tjX8sjURgnPYyCTH7+pxhaJ0CVvKocqt5qU9i52EWmkq9XOhDLIrjKnKk3KH/gNnSHI3Pa3gT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mEBOls0f; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mEBOls0f"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e292dbfd834so10213625276.3
        for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 15:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731453790; x=1732058590; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JK/GSTSvm9liRNiU4g1TG7hfg4UB9r2AkllQ23c8pWk=;
        b=mEBOls0fj+eLVjHVzi0GT9odtyT0R6hW36AJceakGsPunR8kWOrVWUyAdxJNcIJsWv
         9FHYW+EVOgDxpkwSZrVNLZFSD+spwxooEdolXnmTyZFEvkPVQ44gUeWeya4/76q3Rk9S
         U+zN9Ifm+iGuuZUp8ibY+E7pDYuhqSaQ138BtAgXy4AOQJkqvrvmTIa5MxnPXTqn2jk5
         rBpsQxKV0vSC8XVvboZeVOwAkUnIv2ONu89xp/ZzIOIYBPopuqIfon8YzJP8dL/C9E4q
         tPR67Ah5mXRiRlb984Sn6R0xQvsuGbnC/Y18xuSktzk8lCMJEuNDOM3qnAgNPg2rCKgm
         IJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731453790; x=1732058590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JK/GSTSvm9liRNiU4g1TG7hfg4UB9r2AkllQ23c8pWk=;
        b=KZdqOec9QRiQB7tVvT+BW0tEwRIgiv75iwjV7k5+vEqt+Wdx+mkfPPrn9WUo7roWL7
         v9ESFxHz3oxcP2UEEs8SQZQ8sYRzBT7jHGoOXwSzyLcRu85WGkZp69WbzddR+A8C3Roi
         oVMDPWwbIL3A3yb93bhDKQqDXRwLxoMMmrodgBdjvxm6BKbGTG/mjBIiGwLJakWgEoHd
         1yqwBXD8OFBmJyFr5HanAb7TZ0FhqRzxWlN9uSaSfWAFg7hWLnTdbFTPOIlSmoFQtdj2
         8bhq+jqOQnrNula7+xyz0u5xCSMxXjXVc7e9Mlod9jF/nU6VdpWJKBegb/TIrTi6A+Ou
         C+SQ==
X-Gm-Message-State: AOJu0YyaYDIaP34fkRlwuSpK7oJbca4QpDL3+sBQlXfyEpT85YTccE3H
	CGd2g0TMKfPBMkBhM+reZ7EyZRnoGFiDfWNKyXfM6N1NuGJs7+1C+leBsIAdYfDJA7ShAdQrqgV
	UeIb/RHUlX2KR/nZojqNrIg==
X-Google-Smtp-Source: AGHT+IHGhhefKoRV5e5OubSGAwAM0UWk5yFk6qkA96dyKOOGAJu9z6Gb09Ycpw7kFzXXPso5tbzga53kt7B3No4ObA==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a25:a22a:0:b0:e30:b93a:b3e4 with SMTP
 id 3f1490d57ef6-e337f85f1c8mr43720276.4.1731453790070; Tue, 12 Nov 2024
 15:23:10 -0800 (PST)
Date: Tue, 12 Nov 2024 23:22:43 +0000
In-Reply-To: <20241112232253.3379178-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241112232253.3379178-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112232253.3379178-5-dionnaglaze@google.com>
Subject: [PATCH v6 4/8] crypto: ccp: Fix uapi definitions of PSP errors
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Brijesh Singh <brijesh.singh@amd.com>
Cc: linux-coco@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, John Allen <john.allen@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, stable@vger.kernel.org, 
	Dionna Glaze <dionnaglaze@google.com>, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Alexey Kardashevskiy <aik@amd.com>

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

