Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BDE2882B6
	for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 18:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248118; cv=none; b=fCVewjSVm6yQiY9L5aJU9XJsjjIZs6uYu1WYKWhyRaWR9W1hFGjhCH+YeNxKAEl6liAxQ1XhsCodv5pouHh15sqHECJsqiRKO14foieI8ESZtjHXfxH3O+vk68VFIS8qixVCTSZmctY0KHqTJZyt0lI1Cr7gvQrJCeb5I4e7EHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248118; c=relaxed/simple;
	bh=2O407uN7TPj25b78VqtGudUAcYRMX6ZZFh6qGZMf62g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t/tFWYVRDE5hlGzed/rSpGCTAYClJ7Is1w5AUTjXk9ucGzLqb+b5KN7iwB/sUfVIsEF8zDMH2hG14BIpKUb1TCf1u0EHz6tX5Qdv+c3h7wS0C5GhrrYeS2dJSiopvsEBilm+Rl27NlQXWYVYL+bncmyWGPv8Vb06+MZ7GUqX7IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zel4RpEi; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zel4RpEi"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73bfc657aefso118408b3a.1
        for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747248116; x=1747852916; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QvCauuU2L9CGciSBd5j7n776p/pTGMk1tOvrluwsTQo=;
        b=Zel4RpEiv/K2rAzlIz/cHk0uet04QDkxRslqRjNlDDEQA6O4NlZaJ7RVp0XQqj2qU5
         ZGGgJkcpZQ2jbnYUeucKDFUkuZvg3oumhUMjTR8wk/GPs92R+mfR8SVk+1xnlwyoZkJp
         SvcJKkfejuMTy+MzL9S2goCsmjQIKYER83dbFQeO2rU0z6jHWZbLWlOKAe+ghmqOO+hK
         HjcpQ62+A8KzmH6JcyConLeA/5ADHNntWwz50MtC+uEg+I+0ONuL4YR4E4NxX5kBdEq+
         w1bwDiji9WedBRApxHmPQbZaVN8aJKPmZxTeWNxioCU1DTnJaFfmJ/XKNY4R108DGND9
         E2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248116; x=1747852916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvCauuU2L9CGciSBd5j7n776p/pTGMk1tOvrluwsTQo=;
        b=a8y4XClk2DzALnYFyPeXaJFoXHGI8zMaLlYnblf2M1gHWxFlFdlhpeqA+MD6+uFVF1
         TARPaHsmnqK/SeEvSlIIKbfBh0DWIopOYQPQKZVVEqVUvGttwOI9nCSGUxTO1EQhLvmd
         q5PLJ5NNr0JmeOexUZVKMO8f8ANmjrjruuQfpxGIepYmpoDVKWD2+8C1i/whm1SEqC2O
         gh+WOLUjdmIj6xsJcWurdi1FCWrIaHrquRMKzD4LPoR80tslZoOZRhnGir/iAIrRDSoD
         XK3M2maiqOEEwxsBBZNdtkHxjyKktneVYIGdNH5AbDHHW+rc3Or9qdT2QFLQYnf1bzTB
         l5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCW+nDwy0l5AOdxszNPILSUE4F1sNksbqfFsyj7aYkUa14/G59LA+t6MLIv5/UMCNb8m+BbDXuChJ7Ea@lists.linux.dev
X-Gm-Message-State: AOJu0YxYqojLvTXTSH8MJ8lyiWmGk0aDal/5LpPVU4+MFZYRekt/WdiR
	vAnjG8VjQqDVTWEMpSR/ZdqMYQ6fUE6GpeIP6mLQ+b9r7V0xVDHTLVM85fP0A8A9syvgfosGfDX
	TkvdqMlL1HX8Q8A+/L7hpCg==
X-Google-Smtp-Source: AGHT+IHAyCtpbaFX2wLqdc+E6NWHdYXGqYB3sKBEGQUjo89w5UgIHgCaHe6vWLT29dng2koFOR7LeCkZ+D5XCeyATw==
X-Received: from pgc11.prod.google.com ([2002:a05:6a02:2f8b:b0:b14:df7a:ff1])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:62cc:b0:215:d4be:b0b1 with SMTP id adf61e73a8af0-215ff194479mr8038203637.32.1747248115718;
 Wed, 14 May 2025 11:41:55 -0700 (PDT)
Date: Wed, 14 May 2025 18:41:35 +0000
In-Reply-To: <20250514184136.238446-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250514184136.238446-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250514184136.238446-3-dionnaglaze@google.com>
Subject: [PATCH v4 2/2] kvm: sev: If ccp is busy, report busy to guest
From: Dionna Glaze <dionnaglaze@google.com>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>
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
index febf4b45fddf..c1bd82c26a11 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4061,6 +4061,11 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
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
2.49.0.1045.g170613ef41-goog

