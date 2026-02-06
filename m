Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FD5311C2C
	for <linux-coco@lists.linux.dev>; Fri,  6 Feb 2026 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416925; cv=none; b=rlZmvPMbLeSTH2/x+C3G/3X/CI3rckDL1gAmnlU/yZB5zHI1ZGs/VsQvCPUjWP/PrJcrcArW+YG2cnKB1MVfeVPK14sg3vI8SADBmqs9EAlbzhv0kiX0hTnEzY0InmKv+DsPS2/+VqvRcGgUhnNfTFFNfLRNq8+J+s1uD8dz3r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416925; c=relaxed/simple;
	bh=RD3ghT3BYR07kk+VT4kAGdDg0rE+/olup8G6vjo9ymA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L65FVHaoFDBofnZz4eHMgquRWanpFrLRdYcCo/sl2+p/l4F8EYkL7rtgfuKAIUFAnwJcMw7chNHHN7Mrx3uznTrcc30VPrcbaidUzlyT74KemUc6K1LLzlLYtUZSVAoRQH0fK8KhSzUDTPwI+N2Rr4tbF4d9DsuXucpm2xWectY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TMmKH7tI; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TMmKH7tI"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-6630dd039ccso10787053eaf.3
        for <linux-coco@lists.linux.dev>; Fri, 06 Feb 2026 14:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770416924; x=1771021724; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pUeR5gi86sqwVMcWfnpHhKWd8lA2xF2m2Gxy4doTFyc=;
        b=TMmKH7tI6vkSjszBS935dD1JFkIsk+Vw49rVfRWVsZAQhmPdfydMghqD+CgVNq3zcI
         GxHWOsK4FBDuNanrUxzJyONn11JrzeaROJQqx0nHWXO89/q16WYKYQECBhElRdeaFxxR
         hQpBRVMAzXOLIWIXbUERTH6Vi/iQwGhyRP8QRleIUfA91P3zALn+hYwJtBNL9aQeDd9p
         5CoLhb77K8i5nh7GAiJlv49wTguaoPWOXuwmyb6VEjhTnNnAU2i+tlZygTOHn0DPMMdR
         6Js5otQcOoUh1zrppOUsOKptquEOlMA6lWSOw/XVGSQWtJSjvPzyQVcuoRJMwiy1gxJq
         Ieog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770416924; x=1771021724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUeR5gi86sqwVMcWfnpHhKWd8lA2xF2m2Gxy4doTFyc=;
        b=RGJ+8xozbVQxvEtJkXy8M1LkNzbzH6EZDxS6K8pwHfj4FR0PV/BLwjWHsmirnM3Xdl
         cLU/wXelL11JieJGqrn9nNs45TA2cFVnRu7FePkPc51wf1AUiKDAhrLkWV+b8XrCCz9C
         fxIdoG7vybcNBUUPIitq7dDlL1Amhnl1Jihv6+Cw2Qbum8BzG4mBQ/zo2OCzOS3bhI+U
         M4dZYb76jXjZ7oGsnbHpUwgfYA6BQ1F5MWaBEeN8TFIcsPo66mjeySMzELqsfvOfwdOn
         tK2kmhW9x81ombZ5Xel8Yqs2I4ihPtltPUqL6Bapd/Ycu2wWLOPwELofDf3M8b/lkBdt
         UVcw==
X-Forwarded-Encrypted: i=1; AJvYcCWyuXR4k+YBnLqbYOOrKxwR4y6YkAElwPZWAE35nwLDt1zjF2QZgEQVGGeHL2AmlVUUdxLBnLRpIwSv@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvv+TjtEJoVMGelAcc2OZPP3M9UvUvt28vSFo3E97lng3+X16w
	ERGTm5p7pB6F7hT0mip7vVMjjHTHh4yI/RrAJVTue0HRvRwWT5ubitywakzUpRpqEaVYSRNf/7e
	FRw==
X-Received: from iobif47.prod.google.com ([2002:a05:6602:1e2f:b0:957:66a7:af96])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:81ca:b0:663:46f:603f
 with SMTP id 006d021491bc7-66d0a4782bemr1878081eaf.22.1770416923905; Fri, 06
 Feb 2026 14:28:43 -0800 (PST)
Date: Fri,  6 Feb 2026 22:28:28 +0000
In-Reply-To: <20260206222829.3758171-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260206222829.3758171-1-sagis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260206222829.3758171-2-sagis@google.com>
Subject: [PATCH v3 1/2] KVM: TDX: Allow userspace to return errors to guest
 for MAPGPA
From: Sagi Shahar <sagis@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Michael Roth <michael.roth@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Vishal Annapurve <vannapurve@google.com>, Sagi Shahar <sagis@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vishal Annapurve <vannapurve@google.com>

MAPGPA request from TDX VMs gets split into chunks by KVM using a loop
of userspace exits until the complete range is handled.

In some cases userspace VMM might decide to break the MAPGPA operation
and continue it later. For example: in the case of intrahost migration
userspace might decide to continue the MAPGPA operation after the
migration is completed.

Allow userspace to signal to TDX guests that the MAPGPA operation should
be retried the next time the guest is scheduled.

This is potentially a breaking change since if userspace sets
hypercall.ret to a value other than EBUSY or EINVAL an EINVAL error code
will be returned to userspace. As of now QEMU never sets hypercall.ret
to a non-zero value after handling KVM_EXIT_HYPERCALL so this change
should be safe.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
---
 Documentation/virt/kvm/api.rst |  3 +++
 arch/x86/kvm/vmx/tdx.c         | 15 +++++++++++++--
 arch/x86/kvm/x86.h             |  6 ++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 01a3abef8abb..9978cd9d897e 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8679,6 +8679,9 @@ block sizes is exposed in KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES as a
 
 This capability, if enabled, will cause KVM to exit to userspace
 with KVM_EXIT_HYPERCALL exit reason to process some hypercalls.
+Userspace may fail the hypercall by setting hypercall.ret to EINVAL
+or may request the hypercall to be retried the next time the guest run
+by setting hypercall.ret to EAGAIN.
 
 Calling KVM_CHECK_EXTENSION for this capability will return a bitmask
 of hypercalls that can be configured to exit to userspace.
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2d7a4d52ccfb..056a44b9d78b 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1186,10 +1186,21 @@ static void __tdx_map_gpa(struct vcpu_tdx *tdx);
 
 static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
 {
+	u64 hypercall_ret = READ_ONCE(vcpu->run->hypercall.ret);
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 
-	if (vcpu->run->hypercall.ret) {
-		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
+	if (hypercall_ret) {
+		if (hypercall_ret == EAGAIN) {
+			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
+		} else if (vcpu->run->hypercall.ret == EINVAL) {
+			tdvmcall_set_return_code(
+				vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
+		} else {
+			WARN_ON_ONCE(
+				kvm_is_valid_map_gpa_range_ret(hypercall_ret));
+			return -EINVAL;
+		}
+
 		tdx->vp_enter_args.r11 = tdx->map_gpa_next;
 		return 1;
 	}
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index fdab0ad49098..3d464d12423a 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -706,6 +706,12 @@ int kvm_sev_es_string_io(struct kvm_vcpu *vcpu, unsigned int size,
 			 unsigned int port, void *data,  unsigned int count,
 			 int in);
 
+static inline bool kvm_is_valid_map_gpa_range_ret(u64 hypercall_ret)
+{
+	return !hypercall_ret || hypercall_ret == EINVAL ||
+	       hypercall_ret == EAGAIN;
+}
+
 static inline bool user_exit_on_hypercall(struct kvm *kvm, unsigned long hc_nr)
 {
 	return kvm->arch.hypercall_exit_enabled & BIT(hc_nr);
-- 
2.53.0.rc2.204.g2597b5adb4-goog

