Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEF121C18A
	for <linux-coco@lists.linux.dev>; Thu,  7 Nov 2024 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731022142; cv=none; b=kBlI5qZaoWdXMmAB0XZoBeWfajmqqEquke3RwIgEpUdoB0QLAx3zYJaPwC//3LacABLdE3LcXp+vErID+AZJoqHovRaTi2hxuu311tEkVBtzd3Xah1XyZNiq0Xs3HZjRjv2RK9x1/W4VWE8DE0weRigd/plm7zet6bGUOTd/GlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731022142; c=relaxed/simple;
	bh=6WWSW1vJ35TJDlbJJB5qq6nYTs9fwiNRbSVBdPgx3NQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t2bncRw7crBGKqjXaxI7u5n14Ger3m9IWm6Papf40Rd++Fwv9LdHhWQ2A94nhHKGcBttL1Ih7WFdCVdgh9TGooLP+2kSxWYk3x6ArqPuRjgQ0KXn2TXrmEGmNS3H++nvHH/T11dTxfB7ObLtliFry8EE5+k3uOCbjB7odx6pD5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YhWKO9RX; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YhWKO9RX"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-71e64cbb445so1374149b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 07 Nov 2024 15:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731022140; x=1731626940; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd/jtJnQGf9IB3+kXNQoV6T2je6UfO6DAehiOVa2s+o=;
        b=YhWKO9RXJXW9p+CCGgJ0v7dwQ+QHT6niASDGjQFkRqg+T71wBGp2VKX66i2WW1StyF
         8G0lc1wtuWxvYNcqqu88xkO6CYuDg+s7RjgB2qDYBZr+vTViK31diPhiFWTdGPp8Eikl
         1N2V0SE11SlWKx9s6VHA/otFudtnmtKOV2lMBhO4+cx7LGGxMZLsOsHeZ9KUfFAR4lS1
         fsCvaqweV9zr9XqT9jlM5B7SZ/MNUoaBZYscAmvcEw9uxjJYeMVgOb+seAXQonAGs/cr
         d4QHkjCXQjx197tr7tX0slY+nS0kn9CfoRm/F61bVcC3BrGude7eMr3G6HKcgHCG3wa0
         5jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731022140; x=1731626940;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd/jtJnQGf9IB3+kXNQoV6T2je6UfO6DAehiOVa2s+o=;
        b=CbR5hcwg/IfefgmMEfRYKmVZUnALeZR3w2mgp/MdCokIm7LKEPdN5sg2Qgq1NrkoHb
         jrfR3zpxZPYdKtlH6QlqZdQCla1XxS9D9JF2CvYUMU7CFOYrwgItc9Hz+Rl3r1GAlQKY
         hwBIEnG0y85Xm3gwlO/c4uCquiJVjYy+I8zNnBuuhekIbDRH5TLxtas3RubUEsrJPQAf
         1vpy3lknXT22tlimI1ZxYe4nglNhqbyn3iSi4JzU8aqiMex9AM3NvPpHMx1CKyhwenra
         nv2EzR4Sba31yqgVyj7m46BTjZpbBWx/1UjOhHVevGx3btJjCV+kFXIcpk/ypFzwIQbC
         +7hg==
X-Gm-Message-State: AOJu0Ywx32em4zuMuwsBuprZhilYr0tNv4xCtOOEIY0OV9hv8E5xihVt
	q8Iib3Ia+Fm8B66x5+XH+OP9gGzxdkxR5bwvhJrZIeaC8vFaguWhR3UqDtskHKRjgBWLkh+k/zC
	cOPktSLWjcHNy3vvqLtzP1g==
X-Google-Smtp-Source: AGHT+IG3FN+utE5DtZk1yqn4OdrPXgq7d6fljLLlDC+Gkt63/91sIHkgMPRqozoEz65kcTQskewlqi/wialMoW0yqA==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a62:b401:0:b0:71e:5f55:86f1 with SMTP
 id d2e1a72fcca58-724133cd470mr5045b3a.5.1731022140524; Thu, 07 Nov 2024
 15:29:00 -0800 (PST)
Date: Thu,  7 Nov 2024 23:24:48 +0000
In-Reply-To: <20241107232457.4059785-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241107232457.4059785-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107232457.4059785-9-dionnaglaze@google.com>
Subject: [PATCH v5 08/10] KVM: SVM: move sev_issue_cmd_external_user to new API
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Michael Roth <michael.roth@amd.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tianfei zhang <tianfei.zhang@intel.com>, Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org, 
	linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ccp now prefers all calls from external drivers to dominate all calls
into the driver on behalf of a user with a successful
sev_check_external_user call.

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
 arch/x86/kvm/svm/sev.c       | 18 +++++++++++++++---
 drivers/crypto/ccp/sev-dev.c | 12 ------------
 include/linux/psp-sev.h      | 27 ---------------------------
 3 files changed, 15 insertions(+), 42 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index d0e0152aefb32..cea41b8cdabe4 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -528,21 +528,33 @@ static int sev_bind_asid(struct kvm *kvm, unsigned int handle, int *error)
 	return ret;
 }
 
-static int __sev_issue_cmd(int fd, int id, void *data, int *error)
+static int sev_check_external_user(int fd)
 {
 	struct fd f;
-	int ret;
+	int ret = 0;
 
 	f = fdget(fd);
 	if (!fd_file(f))
 		return -EBADF;
 
-	ret = sev_issue_cmd_external_user(fd_file(f), id, data, error);
+	if (!file_is_sev(fd_file(f)))
+		ret = -EBADF;
 
 	fdput(f);
 	return ret;
 }
 
+static int __sev_issue_cmd(int fd, int id, void *data, int *error)
+{
+	int ret;
+
+	ret = sev_check_external_user(fd);
+	if (ret)
+		return ret;
+
+	return sev_do_cmd(id, data, error);
+}
+
 static int sev_issue_cmd(struct kvm *kvm, int id, void *data, int *error)
 {
 	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index f92e6a222da8a..67f6425b7ed07 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -2493,18 +2493,6 @@ bool file_is_sev(struct file *p)
 }
 EXPORT_SYMBOL_GPL(file_is_sev);
 
-int sev_issue_cmd_external_user(struct file *filep, unsigned int cmd,
-				void *data, int *error)
-{
-	int rc = file_is_sev(filep) ? 0 : -EBADF;
-
-	if (rc)
-		return rc;
-
-	return sev_do_cmd(cmd, data, error);
-}
-EXPORT_SYMBOL_GPL(sev_issue_cmd_external_user);
-
 void sev_pci_init(void)
 {
 	struct sev_device *sev = psp_master->sev_data;
diff --git a/include/linux/psp-sev.h b/include/linux/psp-sev.h
index ed85c0cfcfcbe..b4164d3600702 100644
--- a/include/linux/psp-sev.h
+++ b/include/linux/psp-sev.h
@@ -860,30 +860,6 @@ int sev_platform_init(struct sev_platform_init_args *args);
  */
 int sev_platform_status(struct sev_user_data_status *status, int *error);
 
-/**
- * sev_issue_cmd_external_user - issue SEV command by other driver with a file
- * handle.
- *
- * This function can be used by other drivers to issue a SEV command on
- * behalf of userspace. The caller must pass a valid SEV file descriptor
- * so that we know that it has access to SEV device.
- *
- * @filep - SEV device file pointer
- * @cmd - command to issue
- * @data - command buffer
- * @error: SEV command return code
- *
- * Returns:
- * 0 if the SEV successfully processed the command
- * -%ENODEV    if the SEV device is not available
- * -%ENOTSUPP  if the SEV does not support SEV
- * -%ETIMEDOUT if the SEV command timed out
- * -%EIO       if the SEV returned a non-zero return code
- * -%EBADF     if the file pointer is bad or does not grant access
- */
-int sev_issue_cmd_external_user(struct file *filep, unsigned int id,
-				void *data, int *error);
-
 /**
  * file_is_sev - returns whether a file pointer is for the SEV device
  *
@@ -1043,9 +1019,6 @@ sev_guest_activate(struct sev_data_activate *data, int *error) { return -ENODEV;
 
 static inline int sev_guest_df_flush(int *error) { return -ENODEV; }
 
-static inline int
-sev_issue_cmd_external_user(struct file *filep, unsigned int id, void *data, int *error) { return -ENODEV; }
-
 static inline bool file_is_sev(struct file *filep) { return false; }
 
 static inline void *psp_copy_user_blob(u64 __user uaddr, u32 len) { return ERR_PTR(-EINVAL); }
-- 
2.47.0.277.g8800431eea-goog

