Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F6E270575
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 17:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769190152; cv=none; b=oNGqTbGY5IF5fBGEmorVSiVf0ohohbz8Z2LKqK1i1g6OZfDle6W+cUWIcUPtdmkGlvmNT84Hr3sgWfHug041S8rQLUjZj4A8ROtsIi5ddPVHVVqu9iY0YFuSONcSNRugIuylMWnJjZ6yJpOrixKEhrbYZPHJ5bm7U6JQ2/hXUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769190152; c=relaxed/simple;
	bh=pDqjwTznlf7G4jbZbCDrzV5uUZT9Xe21g8FzhaPSO/8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XtZ2oZeUTZSJ0bLWYrsVKk+C4MhR5z6jr+EZdIgytgHpAMOHxb6C221JrvzL/+vN6iy4czFrjrH27qOI0zA/yHi3BY6AKSCSYF2cZaDEARrtbj1wLeywnE2C73mMcWOmHL3y0wChCgxJ+rCTJzAlfoNyNCe6H80pk1IJDoykSUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t9dOEido; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t9dOEido"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a77040ede0so23072125ad.2
        for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 09:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769190151; x=1769794951; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xslJk3NRPMAES7JTcVbRena/Yn0EFJt/rU4p/+v3QFA=;
        b=t9dOEido2l17z5kA8+N32W3Lx1N3qx/kfWstxwxjFLdQYcgvkLntnLxW2rcgrXSGJR
         n8xwHja70bdmiLqb5pc3WieOBOpcMYknrMUUbD+j7FNnTYavKv3nQ491wZr1/GPncsus
         2lnX1nkggo0Xur8vnsj/WEdK33WwbZXhjo5DebfaEvos5qV6LJ2Z6RwF2axKN7i2k3Xw
         E4vYVKbxKg+s27IjXWkABW3evVP0omTSClu100rJ54Ba5hX6mHb/ko49HXVrjPqP0rS6
         6ZjRnHbPhH3f2AIsq4ZZthgxLdONEUL1SUSOLxvsPfvZwXgqOetdDa9oCf4+TlI4awRw
         54nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769190151; x=1769794951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xslJk3NRPMAES7JTcVbRena/Yn0EFJt/rU4p/+v3QFA=;
        b=o4sF6P5C3QC4ERuyBG0WHP4hfFXoKc63NoPn6bWZwOURIn+DkeutRbSpr7LwypQaL0
         O/uG8S2EDYBeA7t6fq4kOtJvaeCJreZlYmIYCGYQYTn1okYvrltscPQF6Q+eZst/c2/L
         JMlrNOgRjfZ2cs9cOS55J4NhpUSzrwgHYux2K4MHp+UmlQB7YmeULsqtvt7RjhBCr6Dr
         IGo+Ysuzj4tGCkzq+c5hH3Yhr5Yfkg9O171hlNaZmmPFPVcbltL6f/YTYLwcMB3a/o6m
         sn/eBc/TlszYPCY5htd82JocsMKPsm9fGYJJX8FS7VIc87nfLbv3Wq51zoepI+EAmiOT
         FK3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTKO+cA4AdBlPxE3dTeLTtCrdPRSPV1JC/vR7HljwpRwpLYX941Sh+jfY0HWuBmHv0TxPbKiT1ywD/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9sxjOKWXH3k+kVC8BHyFKxgxpm2taElyFapRlEd5+Ji6aq0ng
	Y9dhqA2azfMKkPYzy7wX2VcbhkLSQ2w9fC0N0NqWn4VuVQLa8vJvZtYvUOSXol3CWFT/SSMfYBv
	O419HxQ==
X-Received: from plhx14.prod.google.com ([2002:a17:903:2c0e:b0:29f:23e4:703d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecd1:b0:297:f0a8:e84c
 with SMTP id d9443c01a7336-2a7fe75c2c5mr32609105ad.52.1769190150888; Fri, 23
 Jan 2026 09:42:30 -0800 (PST)
Date: Fri, 23 Jan 2026 09:42:29 -0800
In-Reply-To: <20260115225238.2837449-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260115225238.2837449-1-sagis@google.com>
Message-ID: <aXOzBXt4UOuP1Hh7@google.com>
Subject: Re: [PATCH v2] KVM: TDX: Allow userspace to return errors to guest
 for MAPGPA
From: Sean Christopherson <seanjc@google.com>
To: Sagi Shahar <sagis@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Vishal Annapurve <vannapurve@google.com>, Michael Roth <michael.roth@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

+Mike and Tom

On Thu, Jan 15, 2026, Sagi Shahar wrote:
> From: Vishal Annapurve <vannapurve@google.com>
> 
> MAPGPA request from TDX VMs gets split into chunks by KVM using a loop
> of userspace exits until the complete range is handled.
> 
> In some cases userspace VMM might decide to break the MAPGPA operation
> and continue it later. For example: in the case of intrahost migration
> userspace might decide to continue the MAPGPA operation after the
> migration is completed.
> 
> Allow userspace to signal to TDX guests that the MAPGPA operation should
> be retried the next time the guest is scheduled.
> 
> This is potentially a breaking change since if userspace sets
> hypercall.ret to a value other than EBUSY or EINVAL an EINVAL error code
> will be returned to userspace. As of now QEMU never sets hypercall.ret
> to a non-zero value after handling KVM_EXIT_HYPERCALL so this change
> should be safe.
> 
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> ---
>  arch/x86/kvm/vmx/tdx.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 2d7a4d52ccfb..9bd4ffbdfecf 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1189,7 +1189,13 @@ static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
>  	struct vcpu_tdx *tdx = to_tdx(vcpu);
>  
>  	if (vcpu->run->hypercall.ret) {
> -		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
> +		if (vcpu->run->hypercall.ret == EAGAIN)
> +			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> +		else if (vcpu->run->hypercall.ret == EINVAL)
> +			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
> +		else
> +			return -EINVAL;
> +

Because no good deed goes unpunished, please update the KVM_CAP_EXIT_HYPERCALL
section in Documentation/virt/kvm/api.rst.

We also need to give snp_complete_psc_msr() and snp_complete_one_psc() similar
treatment (and update docs accordingly, too).  AFAICT, SNP doesn't have a "retry"
error code, so I think all we can do is restrict userspace to EAGAIN and EINVAL?
(Restricting SNP guests to EINVAL seems like it would create unnecessary pain for
userspace)

E.g. something like this?

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index f9aad5c1447e..14ad4daefaf7 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3732,9 +3732,13 @@ static int snp_rmptable_psmash(kvm_pfn_t pfn)
 
 static int snp_complete_psc_msr(struct kvm_vcpu *vcpu)
 {
+       u64 hypercall_ret = READ_ONCE(vcpu->run->hypercall.ret);
        struct vcpu_svm *svm = to_svm(vcpu);
 
-       if (vcpu->run->hypercall.ret)
+       if (!kvm_is_valid_map_gpa_range_ret(hypercall_ret))
+               return -EINVAL;
+
+       if (hypercall_ret)
                set_ghcb_msr(svm, GHCB_MSR_PSC_RESP_ERROR);
        else
                set_ghcb_msr(svm, GHCB_MSR_PSC_RESP);
@@ -3825,10 +3829,14 @@ static void __snp_complete_one_psc(struct vcpu_svm *svm)
 
 static int snp_complete_one_psc(struct kvm_vcpu *vcpu)
 {
+       u64 hypercall_ret = READ_ONCE(vcpu->run->hypercall.ret);
        struct vcpu_svm *svm = to_svm(vcpu);
        struct psc_buffer *psc = svm->sev_es.ghcb_sa;
 
-       if (vcpu->run->hypercall.ret) {
+       if (!kvm_is_valid_map_gpa_range_ret(hypercall_ret))
+               return -EINVAL;
+
+       if (hypercall_ret) {
                snp_complete_psc(svm, VMGEXIT_PSC_ERROR_GENERIC);
                return 1; /* resume guest */
        }
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2d7a4d52ccfb..4aa1edfef698 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1186,10 +1186,19 @@ static void __tdx_map_gpa(struct vcpu_tdx *tdx);
 
 static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
 {
+       u64 hypercall_ret = READ_ONCE(vcpu->run->hypercall.ret);
        struct vcpu_tdx *tdx = to_tdx(vcpu);
 
-       if (vcpu->run->hypercall.ret) {
-               tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
+       if (hypercall_ret) {
+               if (hypercall_ret == EAGAIN) {
+                       tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
+               } else if (vcpu->run->hypercall.ret == EINVAL) {
+                       tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
+               } else {
+                       WARN_ON_ONCE(kvm_is_valid_map_gpa_range_ret(hypercall_ret));
+                       return -EINVAL;
+               }
+
                tdx->vp_enter_args.r11 = tdx->map_gpa_next;
                return 1;
        }
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index fdab0ad49098..5c2c1924addf 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -706,6 +706,13 @@ int kvm_sev_es_string_io(struct kvm_vcpu *vcpu, unsigned int size,
                         unsigned int port, void *data,  unsigned int count,
                         int in);
 
+static inline bool kvm_is_valid_map_gpa_range_ret(u64 hypercall_ret)
+{
+       return !hypercall_ret ||
+              hypercall_ret == EINVAL ||
+              hypercall_ret == EAGAIN;
+}
+
 static inline bool user_exit_on_hypercall(struct kvm *kvm, unsigned long hc_nr)
 {
        return kvm->arch.hypercall_exit_enabled & BIT(hc_nr);
