Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6816A21F4B5
	for <linux-coco@lists.linux.dev>; Thu,  7 Nov 2024 23:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731022145; cv=none; b=hwUGMwqSLSpkNuUhoB++2Kh1ZbmLi2WyV6+TEeMRKmYZBHnEO2Nsf+K8xuyWc+ttCVpLd21KgjHF4jbNAASR1vfSiAMH10bFUYYi0bjCe/A5/S3qmw8abJdM2nQlXhyR41EUUGQ2pLvfdb/KqfLRIAH0m0EqiF3Z2HRNW+doXwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731022145; c=relaxed/simple;
	bh=1I6XFvUtmCom2RZyjUxF7YPvoFnwsK/7UmqVzImMUPU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S2eYhUJTd5ddp5GfTzZ4dBznXuxG9MgYK1jutqkTGI1/z+ZMkFsLisx7BPFBqbCKB0Rmw6xCIHrMJgkFie+oUGqJ4WI7nSamCn86Splf1uzJ3UZx/Z1F2SDfqzqZmacY+7ysHSuhRfL1kWI6xBJorL9IHMSuD4ECdiOHsUX1aqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zrfCuqRl; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zrfCuqRl"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-20c77c8352dso12805315ad.1
        for <linux-coco@lists.linux.dev>; Thu, 07 Nov 2024 15:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731022143; x=1731626943; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qcg1fuqFpd6J4LqEu191n3/4PbMXxCo3T2JUFbEGZc=;
        b=zrfCuqRl5FrVtMFVM7YnbVaR1ZsG/6GZdR7tr1QJG3EGyFdgVl+9M12zTXtCA/Twto
         TVFkoc85EUaDWex4KGF/Ay3v85poKCNddt0UkbIsaptQEplDKX+W6GNHoyYmbn8/qcM+
         PzGXJA5a0iAwczmyUQLpc06igZ+s8BdOmbJUinSGoxJgbnERE+cnib9NOhV6fXT4epDJ
         34Zl1CGjr86I9NKLbOUODynJkM921+UUTQVr4EAXBE0koSQeBtviStRd1AXlWdAnlGra
         xwwvulU+dp2cjWQ8FyRpQiQ81Qp7ozJaSRAxZ/9R/UbWybA5DM6skRK5i7JNT5laiRbq
         1fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731022143; x=1731626943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qcg1fuqFpd6J4LqEu191n3/4PbMXxCo3T2JUFbEGZc=;
        b=ObJFaqpCmvC8a+fN5aurtaN8raLF96//31RxqxhaMZW/aQeGLcIaDZfNX9EAhNEteE
         XuiCHX+Dn7qG73hABnnv1lNlEz8Fg6RV+ucOrZP41bTBayZtvhg2HJo/iYKgjBf/MIZB
         Ow16qChKGSjEM0RCxsAiP07Q0j3i6d+HtEi7NHLIi4Zpb9gvWWBjaQ+Dupu/3OTYVItD
         InIcM6L/5Hjt5deBJATksqX+k6BOXdnb2hLgKpSvkyYPczok57NX3UG/0srzpTVLKBTL
         bvj7/5C5tb43eHneGNyKKO33VwmR8XouDafBXCsPDiIUGdoYdMWGBTxeuMDgvmg723RF
         xQxQ==
X-Gm-Message-State: AOJu0Yw+G196P2CJ00OKHmXIw/G55bCLVe52G0ZB/tBvYWUELDZlNuvu
	PhJMohMM1PypaY224nATnCwJo9YRdwtmyUuKe6F1V8MiPSg4OWCH1/Y0gIeH1jOeBIdUM3b5+iT
	FXLO4FbrdeHt0HTygKR5xAg==
X-Google-Smtp-Source: AGHT+IGwHbIEmNZ/RBKktF+iIBZkwlEOgQl3w9w6Ss/EO+FVqyDtTE308o2deCvUylBHP84P1pav03ZGURiZtPBoiw==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a17:902:6b48:b0:211:4a37:bfed with
 SMTP id d9443c01a7336-211834f5ea4mr13955ad.4.1731022142705; Thu, 07 Nov 2024
 15:29:02 -0800 (PST)
Date: Thu,  7 Nov 2024 23:24:49 +0000
In-Reply-To: <20241107232457.4059785-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241107232457.4059785-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107232457.4059785-10-dionnaglaze@google.com>
Subject: [PATCH v5 09/10] KVM: SVM: Use new ccp GCTX API
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Michael Roth <michael.roth@amd.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Guest context pages should be near 1-to-1 with allocated ASIDs. With the
GCTX API, the ccp driver is better able to associate guest context pages
with the ASID that is/will be bound to it.

This is important to the firmware hotloading implementation to not
corrupt any running VM's guest context page before userspace commits a
new firmware.

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
 arch/x86/kvm/svm/sev.c | 74 ++++++++++++------------------------------
 1 file changed, 20 insertions(+), 54 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index cea41b8cdabe4..d7cef84750b33 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -89,7 +89,7 @@ static unsigned int nr_asids;
 static unsigned long *sev_asid_bitmap;
 static unsigned long *sev_reclaim_asid_bitmap;
 
-static int snp_decommission_context(struct kvm *kvm);
+static int kvm_decommission_snp_context(struct kvm *kvm);
 
 struct enc_region {
 	struct list_head list;
@@ -2168,51 +2168,12 @@ int sev_dev_get_attr(u32 group, u64 attr, u64 *val)
 	}
 }
 
-/*
- * The guest context contains all the information, keys and metadata
- * associated with the guest that the firmware tracks to implement SEV
- * and SNP features. The firmware stores the guest context in hypervisor
- * provide page via the SNP_GCTX_CREATE command.
- */
-static void *snp_context_create(struct kvm *kvm, struct kvm_sev_cmd *argp)
-{
-	struct sev_data_snp_addr data = {};
-	void *context;
-	int rc;
-
-	/* Allocate memory for context page */
-	context = snp_alloc_firmware_page(GFP_KERNEL_ACCOUNT);
-	if (!context)
-		return ERR_PTR(-ENOMEM);
-
-	data.address = __psp_pa(context);
-	rc = __sev_issue_cmd(argp->sev_fd, SEV_CMD_SNP_GCTX_CREATE, &data, &argp->error);
-	if (rc) {
-		pr_warn("Failed to create SEV-SNP context, rc %d fw_error %d",
-			rc, argp->error);
-		snp_free_firmware_page(context);
-		return ERR_PTR(rc);
-	}
-
-	return context;
-}
-
-static int snp_bind_asid(struct kvm *kvm, int *error)
-{
-	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
-	struct sev_data_snp_activate data = {0};
-
-	data.gctx_paddr = __psp_pa(sev->snp_context);
-	data.asid = sev_get_asid(kvm);
-	return sev_issue_cmd(kvm, SEV_CMD_SNP_ACTIVATE, &data, error);
-}
-
 static int snp_launch_start(struct kvm *kvm, struct kvm_sev_cmd *argp)
 {
 	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
 	struct sev_data_snp_launch_start start = {0};
 	struct kvm_sev_snp_launch_start params;
-	int rc;
+	int rc, asid;
 
 	if (!sev_snp_guest(kvm))
 		return -ENOTTY;
@@ -2238,14 +2199,19 @@ static int snp_launch_start(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	if (params.policy & SNP_POLICY_MASK_SINGLE_SOCKET)
 		return -EINVAL;
 
-	sev->snp_context = snp_context_create(kvm, argp);
+	rc = sev_check_external_user(argp->sev_fd);
+	if (rc)
+		return rc;
+
+	asid = sev_get_asid(kvm);
+	sev->snp_context = sev_snp_create_context(asid, &argp->error);
 	if (IS_ERR(sev->snp_context))
 		return PTR_ERR(sev->snp_context);
 
 	start.gctx_paddr = __psp_pa(sev->snp_context);
 	start.policy = params.policy;
 	memcpy(start.gosvw, params.gosvw, sizeof(params.gosvw));
-	rc = __sev_issue_cmd(argp->sev_fd, SEV_CMD_SNP_LAUNCH_START, &start, &argp->error);
+	rc = sev_do_cmd(SEV_CMD_SNP_LAUNCH_START, &start, &argp->error);
 	if (rc) {
 		pr_debug("%s: SEV_CMD_SNP_LAUNCH_START firmware command failed, rc %d\n",
 			 __func__, rc);
@@ -2253,7 +2219,7 @@ static int snp_launch_start(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	}
 
 	sev->fd = argp->sev_fd;
-	rc = snp_bind_asid(kvm, &argp->error);
+	rc = sev_snp_activate_asid(asid, &argp->error);
 	if (rc) {
 		pr_debug("%s: Failed to bind ASID to SEV-SNP context, rc %d\n",
 			 __func__, rc);
@@ -2263,7 +2229,7 @@ static int snp_launch_start(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	return 0;
 
 e_free_context:
-	snp_decommission_context(kvm);
+	kvm_decommission_snp_context(kvm);
 
 	return rc;
 }
@@ -2874,26 +2840,26 @@ int sev_vm_copy_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 	return ret;
 }
 
-static int snp_decommission_context(struct kvm *kvm)
+static int kvm_decommission_snp_context(struct kvm *kvm)
 {
 	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
-	struct sev_data_snp_addr data = {};
-	int ret;
+	int ret, error;
 
 	/* If context is not created then do nothing */
 	if (!sev->snp_context)
 		return 0;
 
-	/* Do the decommision, which will unbind the ASID from the SNP context */
-	data.address = __sme_pa(sev->snp_context);
+	/*
+	 * Do the decommision, which will unbind the ASID from the SNP context
+	 * and free the context page.
+	 */
 	down_write(&sev_deactivate_lock);
-	ret = sev_do_cmd(SEV_CMD_SNP_DECOMMISSION, &data, NULL);
+	ret = sev_snp_guest_decommission(sev->asid, &error);
 	up_write(&sev_deactivate_lock);
 
-	if (WARN_ONCE(ret, "Failed to release guest context, ret %d", ret))
+	if (WARN_ONCE(ret, "Failed to release guest context, ret %d fw err %d", ret, error))
 		return ret;
 
-	snp_free_firmware_page(sev->snp_context);
 	sev->snp_context = NULL;
 
 	return 0;
@@ -2947,7 +2913,7 @@ void sev_vm_destroy(struct kvm *kvm)
 		 * Decomission handles unbinding of the ASID. If it fails for
 		 * some unexpected reason, just leak the ASID.
 		 */
-		if (snp_decommission_context(kvm))
+		if (kvm_decommission_snp_context(kvm))
 			return;
 	} else {
 		sev_unbind_asid(kvm, sev->handle);
-- 
2.47.0.277.g8800431eea-goog

