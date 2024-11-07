Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F5221C170
	for <linux-coco@lists.linux.dev>; Thu,  7 Nov 2024 23:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731022140; cv=none; b=gRkKOPpDy8xDj2FjM8g4PTU0+aP2vgrP42v6HMOvRKSBYbW8Wm4rzr/JGsaZ1KBxrQ0rMPPo0hhzK3VMJGMAv8vWAHDGKKZkGZf8p4Aunv1+JXjGMv413CdajK8XRAi4TxGG1qQVh0iU/WQjdNgOOFDivXrH1gnuhOF24aIeXAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731022140; c=relaxed/simple;
	bh=GeMVM4Ec+fn//3H9389VcZZMcj62SCQA+XOQ+JtdlTk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bfpZuDRbvc+paFlAEyFgZBW8yr9CmD19vSwd6C6qM+wPDG6BxkwPsQdcjBJTO0TJqETOMTIR6d51kFXL7Bv5W2qakIfFDSC23i/EIU7TXL7syfr8goofxCgshtwkkRcIh4aqY3q5NmehjJN3e3PnvA0xZGbaF+NqsbcJ5NdcJhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DN3Xpvay; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DN3Xpvay"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e355f1ff4bso34039777b3.2
        for <linux-coco@lists.linux.dev>; Thu, 07 Nov 2024 15:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731022138; x=1731626938; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/mtW86B3DSmlFKT0lotGzdj7a1N3s2uwCyGHDKQX9vU=;
        b=DN3XpvayInQECHzpM6ajK/jX7rC7B70m17SSh4VR293a9xQ21gK6OofZ0KzBdAmb0N
         ZPQym5J9gdJn9Ylg2pCAQ91vJLfcaUr/8Ntw5UwS/YjIY2WAtcaKEmbq2izwDVkXh/Gw
         95KKoQZyJnvenZww1G712yNrrToDtHXsdPF+2CAoJF3wmr6OrNOpO/Q9OVvc3XYtDJay
         4DXoHgY8uT66m0hmyuYPNks8pnfvGqe1Lt3j/exmxkQ1ItRReeiGDCKfNDSmHMwWtFXl
         V++ENDQA/qS0oTRifk6EASSbwLQZz6ixMHT6DsJPGZlGJI19uxb4sOl+eQHudRKS5+ZM
         Xr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731022138; x=1731626938;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/mtW86B3DSmlFKT0lotGzdj7a1N3s2uwCyGHDKQX9vU=;
        b=G2X3nMWVp+mats061db71fshYVR9ULDDB6gvikfvR40vASUHJISDsZBE7/OGs1YvGF
         MZA4hVLJHvTM6aenSWiJEtqsvjZqkCBUNUFCQ7TwQlfoNHQw5Nn9U2pg2cGI09ohKxUi
         5YIS8Ib1hXe/E6Y4kltDii3Bh+JgAggu9u01yN0rv9ok8EvNEPL3U1yjVe5EK7exeLA+
         /qR8FcQtGjRzmXNIkYCADph9SDjxvKtc1RmQ76UwSiKevnJD0sf2AYUioNJaPMnR8w7E
         oXZXSrirTIIkKmE0rlUxIWcNeigq7XX1qlgGNV+EDtuNYSu0nEmmGDNG2FeZ+xF0umex
         QTqQ==
X-Gm-Message-State: AOJu0YwvLuvsoONCy1K/g2ZLHA9652xWCWGscOA6rXBE4xmPrLC8iXq5
	W2AjLK2NEwyEJtXKovWpu5HGyHo6BoUQ62ltkurKDm5LS2VfQ3KJtNYJjO+2lTYA1R1YUNtQe21
	Nb4jMcJQ6/W9mQPkmexMoNA==
X-Google-Smtp-Source: AGHT+IHrNNzZrarS/YQjs+xV1rDR0GePDAFsw74nsrSHNCOrLqUNJv5SPe4CSAD/IfeNYkWr5gdo2XMmDenU30uPTw==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a05:690c:3501:b0:62c:f976:a763 with
 SMTP id 00721157ae682-6eaddd8b094mr187867b3.1.1731022138141; Thu, 07 Nov 2024
 15:28:58 -0800 (PST)
Date: Thu,  7 Nov 2024 23:24:47 +0000
In-Reply-To: <20241107232457.4059785-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241107232457.4059785-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107232457.4059785-8-dionnaglaze@google.com>
Subject: [PATCH v5 07/10] crypto: ccp: Add preferred access checking method
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Michael Roth <michael.roth@amd.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

sev_issue_cmd_external_user is the only function that checks permissions
before performing its task. With the new GCTX API, it's important to
establish permission once and have that determination dominate later API
uses. This is implicitly how ccp has been used by dominating uses of
sev_do_cmd by a successful sev_issue_cmd_external_user call.

Consider sev_issue_cmd_external_user deprecated by
checking if a held file descriptor passes file_is_sev, similar to the
file_is_kvm function.

This also fixes the header comment that the bad file error code is
-%EINVAL when in fact it is -%EBADF.

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

Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 drivers/crypto/ccp/sev-dev.c | 13 +++++++++++--
 include/linux/psp-sev.h      | 11 ++++++++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index 498ec8a0deeca..f92e6a222da8a 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/file.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/kthread.h>
@@ -2486,11 +2487,19 @@ static struct notifier_block snp_panic_notifier = {
 	.notifier_call = snp_shutdown_on_panic,
 };
 
+bool file_is_sev(struct file *p)
+{
+	return p && p->f_op == &sev_fops;
+}
+EXPORT_SYMBOL_GPL(file_is_sev);
+
 int sev_issue_cmd_external_user(struct file *filep, unsigned int cmd,
 				void *data, int *error)
 {
-	if (!filep || filep->f_op != &sev_fops)
-		return -EBADF;
+	int rc = file_is_sev(filep) ? 0 : -EBADF;
+
+	if (rc)
+		return rc;
 
 	return sev_do_cmd(cmd, data, error);
 }
diff --git a/include/linux/psp-sev.h b/include/linux/psp-sev.h
index b91cbdc208f49..ed85c0cfcfcbe 100644
--- a/include/linux/psp-sev.h
+++ b/include/linux/psp-sev.h
@@ -879,11 +879,18 @@ int sev_platform_status(struct sev_user_data_status *status, int *error);
  * -%ENOTSUPP  if the SEV does not support SEV
  * -%ETIMEDOUT if the SEV command timed out
  * -%EIO       if the SEV returned a non-zero return code
- * -%EINVAL    if the SEV file descriptor is not valid
+ * -%EBADF     if the file pointer is bad or does not grant access
  */
 int sev_issue_cmd_external_user(struct file *filep, unsigned int id,
 				void *data, int *error);
 
+/**
+ * file_is_sev - returns whether a file pointer is for the SEV device
+ *
+ * @filep - SEV device file pointer
+ */
+bool file_is_sev(struct file *filep);
+
 /**
  * sev_guest_deactivate - perform SEV DEACTIVATE command
  *
@@ -1039,6 +1046,8 @@ static inline int sev_guest_df_flush(int *error) { return -ENODEV; }
 static inline int
 sev_issue_cmd_external_user(struct file *filep, unsigned int id, void *data, int *error) { return -ENODEV; }
 
+static inline bool file_is_sev(struct file *filep) { return false; }
+
 static inline void *psp_copy_user_blob(u64 __user uaddr, u32 len) { return ERR_PTR(-EINVAL); }
 
 static inline void *snp_alloc_firmware_page(gfp_t mask)
-- 
2.47.0.277.g8800431eea-goog

