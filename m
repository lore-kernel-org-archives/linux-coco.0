Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E931C6FF3
	for <linux-coco@lists.linux.dev>; Thu,  5 Jun 2025 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135781; cv=none; b=V0vd5ihmmWPH4+eRDFfro7gjwoLL8tW8PmrCiJ4fUtRGlWXunjuvo1VxzDdL3i3G5dcSFttLbSvJ4JAuVnaeaUbUn0JHdAh/wK1MGLvpt7fQzCU8tOU7k8Q36vfLZpuFV7QDKg+CC1ZcrUuYQI80i0wX8AFavCk4R6m51yOPa+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135781; c=relaxed/simple;
	bh=3jeQmiKt06GXrIHfpjh0oQlnOaSY9Kr4rz+umFvQdDA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LRaQoZJ/CKkFq26VYx404jy/xn48Ww8BHio5ay3X7F3I+//jVQ2K8ditRtBWU/Hs808RBu5ftdEOKAW4ciT+gM8tJ4paRbQ6NHr6YT7YLKsjc9o7S2Rfo7VTM/2wp4YqL9SY+OaJwbLtSIzNJ5geLdm+Mzsgbd+gVI6HITiW37Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VtmECPVR; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VtmECPVR"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-747cebffd4eso938093b3a.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Jun 2025 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749135779; x=1749740579; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xzwm5+cjAdLoNMVYNUU/eCk5jF9CVdW14YhkjiBUlxs=;
        b=VtmECPVRX+OchYTW5noQ46Km068KCe92uSduPQA2bnSbpjr/bav3eaBzu8TRKuJ4rU
         uWGs6RcoPGEqvIBdYTdxT0NWeP+M8m8mINz7oCbFY5+CQHKS7jWXZEKrvuK1gf8MoF8M
         gLRu8aueFrNRE6swINRtSCqheGiW31kPxWhEDo7iQiPA4sekPrX4HnviuxrRYLSWmenW
         ybsmxdKscvLCwrgjbT0w6KWTXHljAfdlbgz/rh5tt+TnvZMIMDkRRua7Y7DGZUHzTa0s
         srACnqGD/v2fjPISZkypVkO7mHgNQ/u3uUdjSaiRXr0u0iIRoiGNJDgWYdIXIhks90Sw
         1Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135779; x=1749740579;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xzwm5+cjAdLoNMVYNUU/eCk5jF9CVdW14YhkjiBUlxs=;
        b=nNXEwOLtjCwm7QPRrFAtRXauJtfkD/sAU3BdfN9FNhXwLPVY/7v4wSJ3spQeUec8ha
         IPAPyeLz03tThPZn0eMRjz/M5C89NSPzhcfA9vuakkYhmRnKsiLn5chsqev/KT2Ynnko
         EbDWxRVbJIgIVhj7fuvhxsjgz/T15ynadF5iXXIhY9GFqXg9GGRG5UZjK0GcZOSvM280
         YMV3F2l0G6qCaQ7M70NGUde64I6YqGqVOUYaZaxtAMm2jb1/lU2KlJj4q9vBO8xrb9Tc
         J1/mif7tIh3TSOKJPb6u2eJ9Y8+jROr7f2b0ptK6QkHS53qm8Q74RT6ZtLBMaFj9fYHx
         MOKw==
X-Gm-Message-State: AOJu0YwMJ+mZbTD17Rz5ziJAKnjsTNRwoQ3VbYVzx9aOWI4zoF2TNLmv
	ut+WSt/KfP5kFI4MI4PzWad4pulArM4CndTLyQ4+RQVlxrRFJJAXjKCjcEFG8jCACk1KVGqqiaG
	4nOe4SjAAotFUvPGf6/nezfOjhQ==
X-Google-Smtp-Source: AGHT+IHb5hKDUYrgVOzSrfCbbqZtDuSQIRve0rxtHVkUEsiBbiESd9WvsZr9lyVAILAcpiMtqMiFe+S0tlpgh2kuCw==
X-Received: from pfvx14.prod.google.com ([2002:a05:6a00:270e:b0:747:9faf:ed39])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:b53:b0:747:ee09:1fb4 with SMTP id d2e1a72fcca58-74827f09679mr61292b3a.15.1749135779455;
 Thu, 05 Jun 2025 08:02:59 -0700 (PDT)
Date: Thu,  5 Jun 2025 15:02:36 +0000
In-Reply-To: <20250605150236.3775954-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250605150236.3775954-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250605150236.3775954-3-dionnaglaze@google.com>
Subject: [PATCH v6 2/2] kvm: sev: If ccp is busy, report busy to guest
From: Dionna Glaze <dionnaglaze@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Lendacky <Thomas.Lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

The ccp driver can be overloaded even with guest request rate limits.
The return value of -EBUSY means that there is no firmware error to
report back to user space, so the guest VM would see this as
exitinfo2 = 0. The false success can trick the guest to update its
message sequence number when it shouldn't have.

Instead, when ccp returns -EBUSY, that is reported to userspace as the
throttling return value.

Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: Peter Gonda <pgonda@google.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Sean Christopherson <seanjc@google.com>

Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 arch/x86/kvm/svm/sev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index e45f0cfae2bd..0ceb7e83a98d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4060,6 +4060,11 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
 	 * the PSP is dead and commands are timing out.
 	 */
 	ret = sev_issue_cmd(kvm, SEV_CMD_SNP_GUEST_REQUEST, &data, &fw_err);
+	if (ret == -EBUSY) {
+		svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, fw_err));
+		ret = 1;
+		goto out_unlock;
+	}
 	if (ret && !fw_err)
 		goto out_unlock;
 
-- 
2.50.0.rc0.642.g800a2b2222-goog

