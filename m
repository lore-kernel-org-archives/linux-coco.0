Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BC5364E88
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 22:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772749626; cv=none; b=DkcC3AwaYsC/WJUbhs7ce5FrByvjXPptZZtszKKF+YAgYsh/Tnd1Z9LXZ20HfWkV1oldeuGTaeAE1rNq2VebcjZDrTWCcjCvfXRbBDfQgiVLBNGvutZbdkBxFLZ6C/YiHi3UMGwhBAMvQbhX2yLklBIrHvlsDvkBmSXouIrXKUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772749626; c=relaxed/simple;
	bh=QYpfE9Bp+VZ43WxgiWmgZ8DPxnJQhn/XjQ9FpmT4AHA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pkm47WlpXm028gcPtN7fom3RMYMJjWNYOcKdp2SpKEyNp3oLSUJDoq8L+WMf5J6dmwizHu41fZYytcwev1YyaaHw31DalbeOyYPlHwiGO3LAcYIa4VPAwUBWnTIy6XAvY1V2ZCSYZ8gV6pfTx4KwQ0IBR+FOi03BEaN65VPk1D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ueK0Dfv; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ueK0Dfv"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-679c5ed0942so101543631eaf.1
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 14:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772749621; x=1773354421; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwFpu8D3VQ5vH2ngB7YkgvdL0e7mIaS+4lfFZO8V8nI=;
        b=3ueK0Dfvd5Fau21Z+3kRXiBkcJhoyrRHfJ49fkuqBKI7RDGgodhxY1aSDKwGwsxyNb
         anJodzK/I2zIi6vJe0eOi5TQl7FrF9OSoWwbEIAxfJIbF6fKiJ5yHfvS2ks4jGJ22GDN
         NL8Qby39OyfWuDDWTpQTchDNoBuXl57w2xMrQCZvrVpeokpwb1Xn+sqSv6l8BhWlCUEk
         lTcWTgL/+qQFqKWZZLIDdIHB6NBWbOrJGdkDm7I+ymPwhNY1pJi/7/Byz7jTaVGl+DfU
         cBR812WmospmYplDjlSZRab4KnD/ftJBzLs9AvmAax1lrKRNIdM74hO3B0zcPXJmpKgg
         tuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749621; x=1773354421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwFpu8D3VQ5vH2ngB7YkgvdL0e7mIaS+4lfFZO8V8nI=;
        b=Me+0MUazpYWu8qCJMN66iwupJoAr7FWviov063WzGkABsSq2WLILsnPlt37yUHIp5W
         sQJ9c+xuMAE4riYDCdxAzeaBeC1MOL3ffLGGlrXh8bbGDkohrfkmgffVVX1YjA7iaqKF
         jwcTkcZRHsEwfW/9q3qfcR2mfUSISWeDMXD9cq3BzHdkAxHlYlb0quqmyoGaK96/UI7H
         5V8RKovONpdM5RUqx0XRQ0KAv67hslnM5zuwMZqI9SX6P6onY+16IE/HI/h5rBRBOtnK
         sRtJ+XLKnm594QziLYrOH0k354W5GfsGoIIw2GQMfIL/T7WLtKHh5RfeTZG3+HtHJFfr
         fCFA==
X-Forwarded-Encrypted: i=1; AJvYcCXjfLHzG2EnLxCpg6RqzxxB42F0CMWvvAVbNtDqqsWZGj9V3Z5cp4XfWbXtx32WCPI3woYfcNp7J5ez@lists.linux.dev
X-Gm-Message-State: AOJu0YybCobz+V6U2SE9pKeAqdyorM8Q8lxCwNxPTjdHL+Dr5WHfV/JQ
	WEfi9GvOTQE/jN1jD9lhpHoClIptsVOIKNKZ23Sl4Y6TpYh/juVLh8gQ0RKAtNg91HyIV+qCLqB
	Lmw==
X-Received: from jagg2-n2.prod.google.com ([2002:a05:6638:c702:20b0:5ce:ce5a:92a8])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:179b:b0:67a:4fe9:a4b0
 with SMTP id 006d021491bc7-67b9bc6ad75mr110144eaf.15.1772749620561; Thu, 05
 Mar 2026 14:27:00 -0800 (PST)
Date: Thu,  5 Mar 2026 22:26:27 +0000
In-Reply-To: <20260305222627.4193305-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260305222627.4193305-1-sagis@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260305222627.4193305-3-sagis@google.com>
Subject: [PATCH v4 2/2] KVM: SEV: Restrict userspace return codes for KVM_HC_MAP_GPA_RANGE
From: Sagi Shahar <sagis@google.com>
To: Vishal Annapurve <vannapurve@google.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Michael Roth <michael.roth@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Sagi Shahar <sagis@google.com>
Content-Type: text/plain; charset="UTF-8"

To align with the updated TDX api that allows userspace to request
that guests retry MAP_GPA operations, make sure that userspace is only
returning EINVAL or EAGAIN as possible error codes.

Reviewed-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
---
 arch/x86/kvm/svm/sev.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 3f9c1aa39a0a..04076262f087 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3718,9 +3718,13 @@ static int snp_rmptable_psmash(kvm_pfn_t pfn)
 
 static int snp_complete_psc_msr(struct kvm_vcpu *vcpu)
 {
+	u64 hypercall_ret = READ_ONCE(vcpu->run->hypercall.ret);
 	struct vcpu_svm *svm = to_svm(vcpu);
 
-	if (vcpu->run->hypercall.ret)
+	if (!kvm_is_valid_map_gpa_range_ret(hypercall_ret))
+		return -EINVAL;
+
+	if (hypercall_ret)
 		set_ghcb_msr(svm, GHCB_MSR_PSC_RESP_ERROR);
 	else
 		set_ghcb_msr(svm, GHCB_MSR_PSC_RESP);
@@ -3811,10 +3815,14 @@ static void __snp_complete_one_psc(struct vcpu_svm *svm)
 
 static int snp_complete_one_psc(struct kvm_vcpu *vcpu)
 {
+	u64 hypercall_ret = READ_ONCE(vcpu->run->hypercall.ret);
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct psc_buffer *psc = svm->sev_es.ghcb_sa;
 
-	if (vcpu->run->hypercall.ret) {
+	if (!kvm_is_valid_map_gpa_range_ret(hypercall_ret))
+		return -EINVAL;
+
+	if (hypercall_ret) {
 		snp_complete_psc(svm, VMGEXIT_PSC_ERROR_GENERIC);
 		return 1; /* resume guest */
 	}
-- 
2.53.0.473.g4a7958ca14-goog

