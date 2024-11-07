Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E115219CB4
	for <linux-coco@lists.linux.dev>; Thu,  7 Nov 2024 23:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731022130; cv=none; b=iVg84RsIIb2UOWW1EXvjx6cXYf3mHsxfNP+FZgf3dC7v8SYoVMnuSSKrwyxPuo2mO+2qXOWwyUNQ1UCA0rQ4bc0XeATmkXjy9P0o1tlJWkVew6C1rws/w22l5ys2nTWkilSWrvrDwYnGU6UnVkNM15E/FVeP4hUK/P61XMRmxns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731022130; c=relaxed/simple;
	bh=ayby78yQOyjOz6ls+yE5cxTfghhQvc3yyzZlL7gs+bU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y/Xjc3Aa6EdvKlMckJ5SPWAIQMMHCV8Ke9CCeUjuZ5zttjB7W34vhSiNwIht/uZlva3ZteRfRukk9Me5fP+2fd7P0AwgsKtrhZwGybj9FbWhGOGZqIOjDIDOXAqeGU9owSZqTezK/K0s72Epj21DbtCNIkQFG1CF2OWD7lx8iW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=auWftEj1; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="auWftEj1"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ea9618de40so27304377b3.3
        for <linux-coco@lists.linux.dev>; Thu, 07 Nov 2024 15:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731022126; x=1731626926; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WmL++hD8fgHMSusvyHDFwqq57StgWysj/njcEHmccMk=;
        b=auWftEj1lb9q0hKVNKq/RroH7B/8JCgW3EtBYQlAgR1gpQN80rJlsOnE1dZGARswMr
         MEhGI0OXbVTwYg4iiNuhVMnXeytC5QvzKWMLI9aqPiEGEU3Fgbgm94ID2clwvRx1c0hm
         vSGfezOFEFmu+8Q92Or1u82tg97qo47g66SC+ga1NLfPjQuMPdVNGDMnKu1s6cNV7bYf
         E0qTl4MFivC8EX8EoUpN1gJ8l5MNmmT6XPV/PthFsoYcSTkeb/xvs4F62NVXdLSG4ogV
         16wTHiWxhhtetvuuaA6EQQxguTtJ/bWYmjgVUAIncV3EJze9zW0sD7aRneWqgwrTLM74
         HzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731022126; x=1731626926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WmL++hD8fgHMSusvyHDFwqq57StgWysj/njcEHmccMk=;
        b=CT24oeAM1nl6urwYJYbdKAOQu5qWc/7Bb3N4N2fyGSyDqxYejLnKpur9GsC6pMsKSO
         eJPlYEFqfrYBjkJsqwKyJ+qkt4DUPHod5JqMBZddlv2cnK+DoaUp6SxToCigNJKterKR
         pSwaBN1UyzGrLXQ7986r8mUU39d62SHudSleeKXTh5tmuFGB6y9G73tyuU8UAxMk0zyi
         NtDd9LtRTyqX3m9OZqpJKF7yNBocNoU+wD0z5pYr3pNqCq5hTc1lTUv8JERf/buv9x0N
         ASjl6C9REDhLWLuWSL9W1PzbnKWc+is0a1nTH1WHUR93vm7B8qzi3K5pJ8sanSF+6bOp
         gjpw==
X-Gm-Message-State: AOJu0YysGAcPU73g4eJAte5/IaA6ApSuBAouWzJqsTc+dxFpLAXUqgFn
	F0HTB78nFVOHRkrVMforVOX6WKEIVFlGOv1zeRApV8O8GDg0TWhGRy5RhT6xApYdFvbzruwNGKC
	fzoEQ8ZNbOkBIBS2HBQ8LvQ==
X-Google-Smtp-Source: AGHT+IHZp/clRKmQZ8fJk7ELtkAKGCrs2CU91VNe+31QXmURSkfx5SINiU/puhbXGTHvPt4yQyv2DjU9QK+SpStkvA==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a05:690c:7307:b0:6ea:3c62:17c1 with
 SMTP id 00721157ae682-6eaddd75f83mr94917b3.1.1731022126529; Thu, 07 Nov 2024
 15:28:46 -0800 (PST)
Date: Thu,  7 Nov 2024 23:24:42 +0000
In-Reply-To: <20241107232457.4059785-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241107232457.4059785-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107232457.4059785-3-dionnaglaze@google.com>
Subject: [PATCH v5 02/10] KVM: SVM: Fix snp_context_create error reporting
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, stable@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Failure to allocate should not return -ENOTTY.
Command failure has multiple possible error modes.

Fixes: 136d8bc931c8 ("KVM: SEV: Add KVM_SEV_SNP_LAUNCH_START command")

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

Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 arch/x86/kvm/svm/sev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 357906375ec59..d0e0152aefb32 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2171,7 +2171,7 @@ static void *snp_context_create(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	/* Allocate memory for context page */
 	context = snp_alloc_firmware_page(GFP_KERNEL_ACCOUNT);
 	if (!context)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	data.address = __psp_pa(context);
 	rc = __sev_issue_cmd(argp->sev_fd, SEV_CMD_SNP_GCTX_CREATE, &data, &argp->error);
@@ -2179,7 +2179,7 @@ static void *snp_context_create(struct kvm *kvm, struct kvm_sev_cmd *argp)
 		pr_warn("Failed to create SEV-SNP context, rc %d fw_error %d",
 			rc, argp->error);
 		snp_free_firmware_page(context);
-		return NULL;
+		return ERR_PTR(rc);
 	}
 
 	return context;
@@ -2227,8 +2227,8 @@ static int snp_launch_start(struct kvm *kvm, struct kvm_sev_cmd *argp)
 		return -EINVAL;
 
 	sev->snp_context = snp_context_create(kvm, argp);
-	if (!sev->snp_context)
-		return -ENOTTY;
+	if (IS_ERR(sev->snp_context))
+		return PTR_ERR(sev->snp_context);
 
 	start.gctx_paddr = __psp_pa(sev->snp_context);
 	start.policy = params.policy;
-- 
2.47.0.277.g8800431eea-goog

