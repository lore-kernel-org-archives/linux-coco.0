Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5667D299950
	for <linux-coco@lists.linux.dev>; Sat, 14 Feb 2026 01:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032439; cv=none; b=JfjOlZt5peMzmN+YDkO/YdxYo4CmOwFxxFdKzgyR6OMEcRvApTquwzBd1GIA7Ld/23bKTJkWhQuxnf0McxPjR2oAD3AHplDu/5Zw34hqUAbHOsxrSL4nAaOQic8TjxO3cjfQXwpbEmBNRJKcMePZpVHuzu/uiN/QeuKPXmuQDbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032439; c=relaxed/simple;
	bh=KxQaeOFTUwNddWWAwysEkVI+6gLN8UxXhcnpjxklb+A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aHVOrvztQl3sAKnUEBFCUZnXt1fvFgkjjA05Xh/k56d3jis62zXcg8b79c9IG8P1Tpz4Cnefaj+17ugdrI0F2rN81w1ubnZpKJifj7d6lnL41ClAPUXbN+bARlh9gs6RZ11RmDVlb6NAmwGSc/BdzVtIWGGOJiXGXuIKI3fg3OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sVWV8HPD; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sVWV8HPD"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354c7febaefso4909514a91.3
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 17:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771032435; x=1771637235; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ncRTKT34NsAmZ158dpqAeNu/HepDjS+oL5Xbl/IP/0E=;
        b=sVWV8HPD0Po3YD+/6/oW9CmLSz5tv2GhhGPmyqhXHWShJRI/ubw+eVrfugR01w/GUf
         HZGpKqq4ZiLXHDEq58AB6wHeOjB1PBTgnomUbMsh6zdJA9gosyliPe5Synq2z49k9lhq
         pqUTix/hslwcqCU0F40lT0NDh4q6MiPIQJkaL5D9PEYpP/7iUuQYiX20Hl6tUEjxNpLW
         6DghtivuAMDmIheltiu6MwYSMfZFFCor9s4+UrhEn7d9JHz4WPDlsXwV3tSpmw5q/LQg
         9iwxGxGR3dWLyPvaFfmwpfPjrX6JWgi9xYAofR39ZDsVYhK4Ab+jMh3Yo0FJR+8Cy5lK
         vLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771032435; x=1771637235;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncRTKT34NsAmZ158dpqAeNu/HepDjS+oL5Xbl/IP/0E=;
        b=GO+5OEQ962tcczuDSth9mw7xE2n+rw6x5pfaFbGNbapcU5j4bB7RSwb8urHmOSBbE/
         tCpgJ9879sLuWe1mi6kHs7uSjoLWbEcJw1MAvlwrGe7Kq+Ag3SECfIdVoPa7KZQzNA8y
         pHl9/ssisFcEdGCSqDDWsGPoPohlPiKekm0bA4fDfK2XQhWvHbJmMhERSvYFYxR2pBcS
         QFmUx+N0rwTsB1GCBhhh8sKkXYN9pltbnE0EoihxQHukpRpzNFjI0FqnHoEY2JHbnX6V
         pgO3f358+3yZPMCUnkG2uJhUls9ztVK2MpxjkCxi9qurUA+CK/hZaUMiEEd4Jl9JMTEb
         i4hw==
X-Forwarded-Encrypted: i=1; AJvYcCUcRcknpN7WXcy3xRYb3KjFk+OcogszYYUWumttSBxMfZNu552XqVSHRfGjVSbJoNYhKrbkStDK0tEm@lists.linux.dev
X-Gm-Message-State: AOJu0YzynnP1tdHSITpkmcaXkkS5AimwbUxEfy0msSw9P/Gnr+nWSnEv
	ooklYDSPJEWHUmGHuJzCTjUZ2+OS3JDdkWnEWz88czBRU7R2d5fe2EZRGhHkBRCO4jPI1wDQ8aZ
	eL+81+w==
X-Received: from pjl16.prod.google.com ([2002:a17:90b:2f90:b0:353:28:3531])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5105:b0:33b:be31:8194
 with SMTP id 98e67ed59e1d1-356aad80906mr3557884a91.34.1771032434676; Fri, 13
 Feb 2026 17:27:14 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 17:26:51 -0800
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260214012702.2368778-6-seanjc@google.com>
Subject: [PATCH v3 05/16] x86/virt: Force-clear X86_FEATURE_VMX if configuring
 root VMCS fails
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

If allocating and configuring a root VMCS fails, clear X86_FEATURE_VMX in
all CPUs so that KVM doesn't need to manually check root_vmcs.  As added
bonuses, clearing VMX will reflect that VMX is unusable in /proc/cpuinfo,
and will avoid a futile auto-probe of kvm-intel.ko.

WARN if allocating a root VMCS page fails, e.g. to help users figure out
why VMX is broken in the unlikely scenario something goes sideways during
boot (and because the allocation should succeed unless there's a kernel
bug).  Tweak KVM's error message to suggest checking kernel logs if VMX is
unsupported (in addition to checking BIOS).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c |  7 ++++---
 arch/x86/virt/hw.c     | 14 ++++++++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index abd4830f71d8..e767835a4f3a 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2927,14 +2927,15 @@ static bool __kvm_is_vmx_supported(void)
 		return false;
 	}
 
-	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
-	    !this_cpu_has(X86_FEATURE_VMX)) {
+	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL)) {
 		pr_err("VMX not enabled (by BIOS) in MSR_IA32_FEAT_CTL on CPU %d\n", cpu);
 		return false;
 	}
 
-	if (!per_cpu(root_vmcs, cpu))
+	if (!this_cpu_has(X86_FEATURE_VMX)) {
+		pr_err("VMX not fully enabled on CPU %d.  Check kernel logs and/or BIOS\n", cpu);
 		return false;
+	}
 
 	return true;
 }
diff --git a/arch/x86/virt/hw.c b/arch/x86/virt/hw.c
index 56972f594d90..40495872fdfb 100644
--- a/arch/x86/virt/hw.c
+++ b/arch/x86/virt/hw.c
@@ -28,7 +28,7 @@ static __init void x86_vmx_exit(void)
 	}
 }
 
-static __init int x86_vmx_init(void)
+static __init int __x86_vmx_init(void)
 {
 	u64 basic_msr;
 	u32 rev_id;
@@ -56,7 +56,7 @@ static __init int x86_vmx_init(void)
 		struct vmcs *vmcs;
 
 		page = __alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
-		if (!page) {
+		if (WARN_ON_ONCE(!page)) {
 			x86_vmx_exit();
 			return -ENOMEM;
 		}
@@ -68,6 +68,16 @@ static __init int x86_vmx_init(void)
 
 	return 0;
 }
+
+static __init int x86_vmx_init(void)
+{
+	int r;
+
+	r = __x86_vmx_init();
+	if (r)
+		setup_clear_cpu_cap(X86_FEATURE_VMX);
+	return r;
+}
 #else
 static __init int x86_vmx_init(void) { return -EOPNOTSUPP; }
 #endif
-- 
2.53.0.310.g728cabbaf7-goog

