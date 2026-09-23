Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAAB3DCDB1
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 23:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207467; cv=none; b=XSDquHSzEJeYRvqyIvzBlZmDZc5weGZ3Q6mOfh8UtfBbq/ZZFyRkKRnpCEePHlmhJVs7aQxYPKxsMiqU+7HpQEt3RS9AHuOqNM3PrYGwv7fdbv69bCUsnhim9zWaoLQet+kjffCloX3wp1t0yeWxBYEhYbtiYi7Ra56HdFxlfY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207467; c=relaxed/simple;
	bh=VgbmQzkSocoxdOZDZi/gjzkF9LcNvq+8MxsAhKJwtGw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ooJHzl7ZSfzYmY5xfeoSX56ThPn70/WdDB5b1nsKx8nE3SYV457Wcvsp0RT67DBrryhtkL6tkI2IlmkNNugS6I3p6OGladO1o29n3Allo/IfHSJHB1gA1yFq3XV/U7Jm68BPsPd9MpsLEiObT93sPD7Ydj36Kupfnrcr8CEA4vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BcONbFhK; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BcONbFhK"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8710450f731so988991b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 16:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790207466; x=1790812266; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZL0v8EpU+Yx8SlmaaQwfQoS5AEmcrF7Pnr1vJ2jpOzg=;
        b=BcONbFhKyy9A4UY/PtiLnCGWX39QCPFQYsnAGnQCus4Ca8zp+46nfrk09QIZqKebqs
         8oTBRbYutT2THgPQcqIF8xniUfNVJhP4VZEZfLLcb5eLJrWdsR69f/JROejq27uZ7Ekz
         Eg9aWsuOrd025ynE9GF19c2D8f2HYX96XeM/sJfu9wbCH7s8jH9k3+i1fqbZgayG/yCZ
         JusyaAEKROG24ZVbGCpvgT8ytqtRCqntr+5m2MESxdd0n1ZE1WpWHU1tBOMbso3vHWZY
         fS1sCl/nxt3jbrB9RD8tM1qTkZrEwKaRJ5fSAj6V4ZwxKVIWm3l57iPh3STw9ZYFAJhp
         kRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790207466; x=1790812266;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZL0v8EpU+Yx8SlmaaQwfQoS5AEmcrF7Pnr1vJ2jpOzg=;
        b=L8JYO6j3MM6vTl+h20lEbDs8Os/dCLsFTP1WD2t2q4WCGTxPVtsL4Lp9jeZ02pwUAv
         V7Vwifn/YLer6noronsLqAvJ+g4mfnGNwHP1C/x0OTu6+XQy2sFujXvN0AE5YuC9HaQk
         lcIYDmPA8CuK/8fjt4m4KRPgdsrMx2q2mpLfvAdZ2lwSSqN3CJURwsYp11jGrfdDDES5
         k2O0wGl4GoQm11vdxryEWzVorjcuiVsl9as/i03bTWmOKCDAorpoSKeVsxdOhl+kOwRu
         IZyCl8swW0dlpIBzPkKK4/LTv49H61r4Ew650UZJYeyROMcjtQn+xYiOSrCqc8ykj1wA
         zezQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxj12jGoArWfPBegr4wICUILiG6fJ7K36pdsH1vKS4bRluc7Ffqo6R36YB4eTNMquZb71R7ugriXMv@lists.linux.dev
X-Gm-Message-State: AFuF++mW1ZF2D3HDvf6dRepP9XGJvMLrA+wfXWxrVbrh17sO/EA4EBFB
	K4yRyoNHvuxrZ22pSyQ6UuR2Vb6rs/ALC3GpQnKyq9Abd34/2c4ZTqzWQDBqgFvuBfCsdBxAM2N
	5mBgW0Q==
X-Received: from pfbfr11.prod.google.com ([2002:a05:6a00:810b:b0:87b:c228:1bd6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d81:b0:3cc:b26a:7686
 with SMTP id adf61e73a8af0-3de0e713696mr681743637.6.1790207465622; Wed, 23
 Sep 2026 16:51:05 -0700 (PDT)
Date: Wed, 23 Sep 2026 16:51:04 -0700
In-Reply-To: <8c9922a47e3044683322a5a8755fccca1a1a129a.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260923163315.1580860-1-seanjc@google.com> <8c9922a47e3044683322a5a8755fccca1a1a129a.camel@intel.com>
Message-ID: <arRl6HECqNVOL_cH@google.com>
Subject: Re: [PATCH] KVM: TDX: Synthesize SHUTDOWN instead of returning -EIO
 on unhandled EPT violation
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "kas@kernel.org" <kas@kernel.org>, 
	"jthoughton@google.com" <jthoughton@google.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026, Rick P Edgecombe wrote:
> On Wed, 2026-09-23 at 09:33 -0700, Sean Christopherson wrote:
> > Synthesize a triple fault, i.e. exit to userspace with KVM_EXIT_SHUTDOW=
N,
> > instead of returning -EIO from KVM_RUN if KVM encounters an EPT Violati=
on
> > due to a guest access to a pending page.=C2=A0 Returning -EIO implies K=
VM is
> > buggy, and most VMMs will respond by completely terminating the VM, ver=
sus
> > rebooting the VM in response to KVM_EXIT_SHUTDOWN.=C2=A0 I.e. give the =
VMM the
> > option of trying to keep the VM (from the end user's perspective) alive=
.
>=20
> Why not just return KVM_EXIT_SHUTDOWN directly when the pending ept viola=
tion is
> detected? The synthetic triple fault makes it harder to trace what is hap=
pening.
> I guess there is some centralization, but harder to trace.

Because it didn't even cross my mind that that's on option.  :-)  This woul=
d be
a great opportunity to do some centralization, e.g. do the below, and then =
use
kvm_prepare_shutdown_exit() for this case as well.

diff --git arch/x86/kvm/svm/svm.c arch/x86/kvm/svm/svm.c
index f5aa3d7d3a10..34e5bc283479 100644
--- arch/x86/kvm/svm/svm.c
+++ arch/x86/kvm/svm/svm.c
@@ -2164,7 +2164,6 @@ static int mc_interception(struct kvm_vcpu *vcpu)
=20
 static int shutdown_interception(struct kvm_vcpu *vcpu)
 {
-       struct kvm_run *kvm_run =3D vcpu->run;
        struct vcpu_svm *svm =3D to_svm(vcpu);
=20
=20
@@ -2188,7 +2187,7 @@ static int shutdown_interception(struct kvm_vcpu *vcp=
u)
                kvm_vcpu_reset(vcpu, true);
        }
=20
-       kvm_run->exit_reason =3D KVM_EXIT_SHUTDOWN;
+       kvm_prepare_shutdown_exit(vcpu);
        return 0;
 }
=20
diff --git arch/x86/kvm/vmx/tdx.c arch/x86/kvm/vmx/tdx.c
index 7173ef3fc398..0faa7cfd0433 100644
--- arch/x86/kvm/vmx/tdx.c
+++ arch/x86/kvm/vmx/tdx.c
@@ -2091,8 +2091,7 @@ int tdx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t=
 fastpath)
=20
        switch (exit_reason.basic) {
        case EXIT_REASON_TRIPLE_FAULT:
-               vcpu->run->exit_reason =3D KVM_EXIT_SHUTDOWN;
-               vcpu->mmio_needed =3D 0;
+               kvm_prepare_shutdown_exit(vcpu);
                return 0;
        case EXIT_REASON_EXCEPTION_NMI:
                return tdx_handle_exception_nmi(vcpu);
diff --git arch/x86/kvm/vmx/vmx.c arch/x86/kvm/vmx/vmx.c
index e8af5e57e1cc..5411eb7f3f26 100644
--- arch/x86/kvm/vmx/vmx.c
+++ arch/x86/kvm/vmx/vmx.c
@@ -5587,8 +5587,7 @@ static __always_inline int handle_external_interrupt(=
struct kvm_vcpu *vcpu)
=20
 static int handle_triple_fault(struct kvm_vcpu *vcpu)
 {
-       vcpu->run->exit_reason =3D KVM_EXIT_SHUTDOWN;
-       vcpu->mmio_needed =3D 0;
+       kvm_prepare_shutdown_exit(vcpu);
        return 0;
 }
=20
diff --git arch/x86/kvm/x86.c arch/x86/kvm/x86.c
index 1705e7be46ec..e433aa7ee603 100644
--- arch/x86/kvm/x86.c
+++ arch/x86/kvm/x86.c
@@ -8082,8 +8082,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
                                kvm_nested_call(triple_fault)(vcpu);
=20
                        if (kvm_check_request(KVM_REQ_TRIPLE_FAULT, vcpu)) =
{
-                               vcpu->run->exit_reason =3D KVM_EXIT_SHUTDOW=
N;
-                               vcpu->mmio_needed =3D 0;
+                               kvm_prepare_shutdown_exit(vcpu);
                                r =3D 0;
                                goto out;
                        }
diff --git include/linux/kvm_host.h include/linux/kvm_host.h
index 284fc7d68c60..d133ad33776b 100644
--- include/linux/kvm_host.h
+++ include/linux/kvm_host.h
@@ -2523,6 +2523,12 @@ static inline void kvm_account_pgtable_pages(void *v=
irt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
=20
+static inline void kvm_prepare_shutdown_exit(struct kvm_vcpu *vcpu)
+{
+       vcpu->run->exit_reason =3D KVM_EXIT_SHUTDOWN;
+       vcpu->mmio_needed =3D false;
+}
+
 static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
                                                 gpa_t gpa, gpa_t size,
                                                 bool is_write, bool is_exe=
c,

