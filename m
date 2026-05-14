Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109F33D0C03
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795641; cv=none; b=hlbKmnv5SXHgbAzJbGZpYOHbpWONrDJFQPfBzO0mA8ZpI7/QK9ZBDSAQXepWaDtBlWWT7fR64Iv1xnJaPE9I9YeBmdD/4TPyHG+vfOjGSHg6kBk9FlFpT2kFoaf+e10b0EX6ZqQ3/143DysyWHENyNSf1pXE5qhLB5L6BnWKfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795641; c=relaxed/simple;
	bh=GvpQ3pTchK+W71vrs1lzAcwN2FhY6JiRsu+aYrsO2y8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G5u9cSH5zadzDKnI9N+8aZXFJ1IrgleyOvzPlrd/BSXWpJZlAbYi2vkYp4wKxNlIacLiUDvp6w6MEMaxqTTX0U7Wa4AoCfVQD+mH1/3Ss3S5Cbdf1RNOl3NNM9bB7LY6HQZmL6uz820tN1GctgAjcLdegpHYiD5CrrDHIBE3Rjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GNEC/K6y; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GNEC/K6y"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso90656145ad.3
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795639; x=1779400439; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=g2qOpbXP0VS/5/XuoZ/aUTxf2CmnbBXQvkx3/ML8B9c=;
        b=GNEC/K6yEfNfmdrDcD9TVo60mOJ7c13NA+3Wu783Db8EcE0Ir2VYvyY+e5IsmAgrxm
         s4wOrythLujyIJ06G8eWzRoyr83xzNSacF/y48xEtPrVIaudtG5TmDSP0VEO0Y3q4imf
         uO5KhALMdkQKOvkEpCqeaV6+SyWuoE7OiqsMmdlxv59qLclZRg1tdQ3qYoJM5MhMGGEP
         GOdfXGaHIQ3lfDJkH5twrKuSulgW2Ai2QYSCDiC6ewdz1S5XUb2DNJZ3kcfGXKOtfWvo
         48UGpmpyu+5b5Q02VFz+7beM3ytmB0VqNC1lU0r9VFPvFIl1+vpnDKm6b4EvAZqbtXh2
         UsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795639; x=1779400439;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2qOpbXP0VS/5/XuoZ/aUTxf2CmnbBXQvkx3/ML8B9c=;
        b=OlouVdcsl/NIPFJig/7YqHP5z4VQOvg6RWx+YqnkxOtA65TYrtauRrZlEIay21mcls
         YVDeFK3bqKDJwFS7TiJV8oudxusEabjN7AROnhcfw6N789X+2w8Rw4cF0lhkYX5c6qUG
         u0JVaWIIB2cFCJC5mlN+L8Qgb9NuotD1Mk7rHwYINttrpOB5nuOA/6l68GQdnouS0qx2
         agX2VJyShLK0f64MIznBGIPuIc8uBaZeqAsYh7nSHOMJUzIgkUxTQY6QLSGJHePJyf22
         +Rnc4O+TEtgMyfJEd8ldlwSflQJEIsNe2gfH+oUQarRDEGm+UHcjosM/hR8Qo370Ad4j
         3WvA==
X-Forwarded-Encrypted: i=1; AFNElJ+WqzEtwiuRSzwkNLcd+8a04gh5lX0oj6JK2rHuM0kcEhfowjnCiTI5IWHfitb7x2VuBtA96Ep0J4w2@lists.linux.dev
X-Gm-Message-State: AOJu0YyhlQb2xKA+yO/0sT2NaGnEY/9shyuhWPE20R7EIULQ8BSzQgTz
	gF9QQdOoQbCgVj2m56RGOzjGmX5Uyj/mE5ZM1sYohgCcgANgTjHuai0tSYnAX97Y551dR+niCcX
	VRz5PFA==
X-Received: from pldt9.prod.google.com ([2002:a17:903:40c9:b0:2b4:62bc:c2a9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1ae7:b0:2b2:49a7:a5bc
 with SMTP id d9443c01a7336-2bd7e9e5458mr11350815ad.39.1778795639070; Thu, 14
 May 2026 14:53:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:42 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-3-seanjc@google.com>
Subject: [PATCH v2 02/15] KVM: x86/xen: Bug the VM if 32-bit KVM observes a
 64-bit mode hypercall
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Kai Huang <kai.huang@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Bug the VM if 32-bit KVM attempts to handle a 64-bit hypercall, primarily
so that a future change to set "input" in mode-specific code doesn't
trigger a false positive warn=>error:

  arch/x86/kvm/xen.c:1687:6: error: variable 'input' is used uninitialized
                                    whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
   1687 |         if (!longmode) {
        |             ^~~~~~~~~
  arch/x86/kvm/xen.c:1708:31: note: uninitialized use occurs here
   1708 |         trace_kvm_xen_hypercall(cpl, input, params[0], params[1], params[2],
        |                                      ^~~~~
  x86/kvm/xen.c:1687:2: note: remove the 'if' if its condition is always true
   1687 |         if (!longmode) {
        |         ^~~~~~~~~~~~~~
  arch/x86/kvm/xen.c:1677:11: note: initialize the variable 'input' to silence this warning
   1677 |         u64 input, params[6], r = -ENOSYS;
        |                  ^
  1 error generated.

Note, params[] also has the same flaw, but -Wsometimes-uninitialized
doesn't seem to be enforced for arrays, presumably because it's difficult
to avoid false positives on specific entries.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/xen.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 91fd3673c09a..6d9be74bb673 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -1694,16 +1694,19 @@ int kvm_xen_hypercall(struct kvm_vcpu *vcpu)
 		params[4] = (u32)kvm_rdi_read(vcpu);
 		params[5] = (u32)kvm_rbp_read(vcpu);
 	}
-#ifdef CONFIG_X86_64
 	else {
+#ifdef CONFIG_X86_64
 		params[0] = (u64)kvm_rdi_read(vcpu);
 		params[1] = (u64)kvm_rsi_read(vcpu);
 		params[2] = (u64)kvm_rdx_read(vcpu);
 		params[3] = (u64)kvm_r10_read(vcpu);
 		params[4] = (u64)kvm_r8_read(vcpu);
 		params[5] = (u64)kvm_r9_read(vcpu);
-	}
+#else
+		KVM_BUG_ON(1, vcpu->kvm);
+		return -EIO;
 #endif
+	}
 	cpl = kvm_x86_call(get_cpl)(vcpu);
 	trace_kvm_xen_hypercall(cpl, input, params[0], params[1], params[2],
 				params[3], params[4], params[5]);
-- 
2.54.0.563.g4f69b47b94-goog

