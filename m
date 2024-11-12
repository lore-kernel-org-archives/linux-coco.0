Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEB521D211
	for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 23:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731453789; cv=none; b=EzmE/t/weafExFleAjawdDi4aB+g+Gq1cbXrR4NIitXCTFZ9qg99ykIqSuKjIKYMnwQjzvaxExwtX3IW3cgipGVIWx8FtXDUOiA1RXCgxiF+tM/yj5yb/v8b9/reEaCj0ivlrwWaZLzziyNfLvOYfSbO58lvAsG9oMTHPKCTQ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731453789; c=relaxed/simple;
	bh=fkSYYUFFU2dhT6w7OYZJxAhhsJkywG0c349xGH09+og=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DmrguSG0ubcc+fsFcuCk611bcHgVi5iozuMCQ66yePCnP/PY4XR4KTs6q+tQEYVspGekC7tiaIBabkb7TrgZy7F6/9ljty+2C2rBaOi5XVbw/01sqVKhrjDluPO9ceMuaXcbxeoF5vxtAgveAEN2Wl9nGejn6O+ZVCeDZ4exAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yJmtVGD2; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yJmtVGD2"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ea33aad097so2476827b3.0
        for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 15:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731453787; x=1732058587; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=waco7iVOB4xSaLUY84IKzzTbmzK38z3CV8Wi2DuMfOk=;
        b=yJmtVGD2o5dJNzjdqwH7MZ3DifzXd9BO9QMNBk6VKI6DauTs84rAarQCKE1ioDJd4T
         0jDzbdB/gPIGj5EJGonGCMw9gJ0zGqOqcd2PS7ahTItAO0fMOnkZY92/G0FqA+KOLEEj
         p47sQg4p1Wpx9eQvMEcCjueLx/aQcr/C0zHEnI+5MZZ26EAtkPuS/pW8ZsViRoyqC0WS
         /FaJljqb1FlwD+aF3b9kGEoJMCT5zph/BsGhyxkEOzAaawB7HH3/lAlMgs6TJX4Uu+T3
         2u763f5Rr53LDuWHtWTvKnZfllIqCFQ3T7bglLSHNxnBpWwUR+LM73It9hrHPFN5Bagb
         wJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731453787; x=1732058587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waco7iVOB4xSaLUY84IKzzTbmzK38z3CV8Wi2DuMfOk=;
        b=Dl9/Ak8zGefEy2PwcM7tcqBRai40mFKel+J24Um31JdoouT953JKNXk6AkUvduAIbE
         F5VdaKR1p/XHYv5JPxWknexgiXtawa9/M4KnB1cpxg1d4Zoc2MrO+9guNnw9USp6MbQV
         M5qeamVUVDrceiqZ8t2fnA+CQmfy3SB+NXLjEJo3MuQrQWLujEVGzYF1vUPQ7mTSueVV
         h7Fir27CE5eyVcsG5B2GVzZRllpq9TgyGPy7yRg4jCPzA2hopSD4bP+Sd4s7uc4D2u0r
         OI5DyqgtNcZ4oy9Bhh9yhwjAMoYRLjI6Y5EQWNSoG83ZQ1+r/lPlp50eEDVtmVxq6e78
         DsTA==
X-Gm-Message-State: AOJu0Yy8PzKpiUa4xUlJ6Zl16Kg2wsAb9FuByx8lVSGYAIoh1tKtlz8A
	vFy4HrNQAl0S7go1Bz0jo1HL1PqapdLxZ6rYkVe7879UyZjPol54R1Pow4G/yLWFdw2QxhbwYA4
	PXfD5VEkTs0v6QyT60cp4zA==
X-Google-Smtp-Source: AGHT+IE0qPNehuCJmgZ3Y9jGmKLJIF83WkMtt6X+ytxPHivZrMnOcg1sXwjkCfj06PlKJC8uXCRQCyOSugbOqkdYyw==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a25:d04c:0:b0:e2e:317a:d599 with SMTP
 id 3f1490d57ef6-e337fdb51ccmr99338276.2.1731453787171; Tue, 12 Nov 2024
 15:23:07 -0800 (PST)
Date: Tue, 12 Nov 2024 23:22:42 +0000
In-Reply-To: <20241112232253.3379178-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241112232253.3379178-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112232253.3379178-4-dionnaglaze@google.com>
Subject: [PATCH v6 3/8] firmware_loader: Move module refcounts to allow unloading
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Michael Roth <michael.roth@amd.com>, Alexey Kardashevskiy <aik@amd.com>, 
	Russ Weight <russell.h.weight@intel.com>
Content-Type: text/plain; charset="UTF-8"

If a kernel module registers a firmware upload API ops set, then it's
unable to be moved due to effectively a cyclic reference that the module
depends on the upload which depends on the module.

Instead, only require the try_module_get when an upload is requested to
disallow unloading a module only while the upload is in progress.

Fixes: 97730bbb242c ("firmware_loader: Add firmware-upload support")

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

Tested-by: Ashish Kalra <ashish.kalra@amd.com>
Reviewed-by: Russ Weight <russ.weight@linux.dev>
Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 drivers/base/firmware_loader/sysfs_upload.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
index 829270067d163..7d9c6aef7720a 100644
--- a/drivers/base/firmware_loader/sysfs_upload.c
+++ b/drivers/base/firmware_loader/sysfs_upload.c
@@ -204,6 +204,7 @@ static void fw_upload_main(struct work_struct *work)
 		fwlp->ops->cleanup(fwl);
 
 putdev_exit:
+	module_put(fwlp->module);
 	put_device(fw_dev->parent);
 
 	/*
@@ -239,6 +240,9 @@ int fw_upload_start(struct fw_sysfs *fw_sysfs)
 	}
 
 	fwlp = fw_sysfs->fw_upload_priv;
+	if (!try_module_get(fwlp->module)) /* released in fw_upload_main */
+		return -EFAULT;
+
 	mutex_lock(&fwlp->lock);
 
 	/* Do not interfere with an on-going fw_upload */
@@ -310,13 +314,10 @@ firmware_upload_register(struct module *module, struct device *parent,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (!try_module_get(module))
-		return ERR_PTR(-EFAULT);
-
 	fw_upload = kzalloc(sizeof(*fw_upload), GFP_KERNEL);
 	if (!fw_upload) {
 		ret = -ENOMEM;
-		goto exit_module_put;
+		goto exit_err;
 	}
 
 	fw_upload_priv = kzalloc(sizeof(*fw_upload_priv), GFP_KERNEL);
@@ -358,7 +359,7 @@ firmware_upload_register(struct module *module, struct device *parent,
 	if (ret) {
 		dev_err(fw_dev, "%s: device_register failed\n", __func__);
 		put_device(fw_dev);
-		goto exit_module_put;
+		goto exit_err;
 	}
 
 	return fw_upload;
@@ -372,8 +373,7 @@ firmware_upload_register(struct module *module, struct device *parent,
 free_fw_upload:
 	kfree(fw_upload);
 
-exit_module_put:
-	module_put(module);
+exit_err:
 
 	return ERR_PTR(ret);
 }
@@ -387,7 +387,6 @@ void firmware_upload_unregister(struct fw_upload *fw_upload)
 {
 	struct fw_sysfs *fw_sysfs = fw_upload->priv;
 	struct fw_upload_priv *fw_upload_priv = fw_sysfs->fw_upload_priv;
-	struct module *module = fw_upload_priv->module;
 
 	mutex_lock(&fw_upload_priv->lock);
 	if (fw_upload_priv->progress == FW_UPLOAD_PROG_IDLE) {
@@ -403,6 +402,5 @@ void firmware_upload_unregister(struct fw_upload *fw_upload)
 
 unregister:
 	device_unregister(&fw_sysfs->dev);
-	module_put(module);
 }
 EXPORT_SYMBOL_GPL(firmware_upload_unregister);
-- 
2.47.0.277.g8800431eea-goog

