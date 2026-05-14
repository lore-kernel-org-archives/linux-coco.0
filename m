Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613263D1702
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795644; cv=none; b=V41quDwIB4F5lh7DC3GWvlA98rYpBTUHuQT+Wnib2Azty+RfnajFH/xNfYG07RhHFsDsHbiWYYGJWdpYbrmBxQ/MPiQD6wPEP6ru2X2sTfKI4/t6F5VH77sAGKGOlgsp8RQPuM1Y+YDFRxe03YBgGKH5WG1DXD57LAIuYE0LQc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795644; c=relaxed/simple;
	bh=LgzQvsxxX3nzX18piIgpsaez26+Gbcq9HNZDoLa+NpM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pwtnbKZlqGDpDtGrn2hEKty85lLLdzFrAOjWtEHYokNm+7EPfip/ICYPWc/sBwr88thwzZQ5bsTAtpxzlD+gGSUC4LKkdctQSiT3dPslAT4Y4efd7ujRt9y+hS0SjAKx+/xbUANXkFVIxb505gmuCJFbHtmdFpmM9I836Hzdizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nmO/AvKk; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nmO/AvKk"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c82751074c8so7451791a12.0
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795642; x=1779400442; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AuBt9TLpeBgSZbTV0sAjcKLbSpi+4/r6Mj25KjhoAAo=;
        b=nmO/AvKkI7WvbybBB5ArbXPhZQ9SdE2sBOsmFj0EAP11jrQcF8hQ2QuYFbp05FmVc2
         YW4p0vK/UbX21CFD3XrUryjW87GzWneC5EMMST+yYiAFU4BQryXEAkEhkFckm3MshPYn
         wPgfAdPE2SZtF6Gnuup0c6LO7yov4N5j6AXNXaY5U5EERb9zANXRO1AypdbS4qLT7MiS
         jUlBxWvjY5X732BXlpvn9CFpzruBBa0vECTGSMqa6zznGq9HAAB9sTLfXcMGiXjyVeI9
         cCv1u14VgbDhemVxqmUcSAa4027A5zKoAmbDrf81jS9w7P2cj/IHQW5aCgYYmOkcjy9X
         wB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795642; x=1779400442;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuBt9TLpeBgSZbTV0sAjcKLbSpi+4/r6Mj25KjhoAAo=;
        b=tXtMaLL/aLIKhP4o+oCZxbjt4DdJQN2fb+Mj0oKD2duUi9WGNHlRr5YB7XSGemEv84
         maWbSTf5RQmsKJ9AGZyrEa9AluDRUzCmGk+K3criHwggowEOsd7KkMHajbhwY/i3JBmt
         LoS1ikhNpAIOzfBXpB0jHSemTiBEO9RF5rm/yPqgRa9CVOg8WxQJtM2h0EhpTm1b2ix9
         5wzxMePCmYjlgS/oC4hW9XyXbaHGOoCUAdjprlHt1F+CkliTMCqgbDYqmoD+1dzbXhPo
         4/5jx49x9HwjlXsyWNfdtSfvOEzV6lVuaMMWzwS9ysPcUd6tCdlj+koTqSufIlC+EJf9
         JCbw==
X-Forwarded-Encrypted: i=1; AFNElJ8b/AYsmHGOlcCdn9K5XsJ/HQX9j/MPsiwGGs0RMC4WRASCsCYvdrZmSctFIqlThHDdWM0Vv6j4ZlDq@lists.linux.dev
X-Gm-Message-State: AOJu0YyU38MsWCN5DnFH99potzXzBYbYBIoM0UPt7Nzz3be3Fq/h7YVg
	E/876ZKUb04KOgls+7GLHn5CHjREp9htq+mhfe/QsaEBTFvAyLcykyXUNReQsZAXeZqSR885qBq
	hYFdI6g==
X-Received: from pfhh12.prod.google.com ([2002:a05:6a00:230c:b0:838:1469:2431])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:198f:b0:82c:20ba:1570
 with SMTP id d2e1a72fcca58-83f33d9828dmr1291294b3a.29.1778795641340; Thu, 14
 May 2026 14:54:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:44 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-5-seanjc@google.com>
Subject: [PATCH v2 04/15] KVM: VMX: Read 32-bit GPR values for ENCLS
 instructions outside of 64-bit mode
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

When getting register values for ENCLS emulation, use kvm_register_read()
instead of kvm_<reg>_read() so that bits 63:32 of the register are dropped
if the guest is in 32-bit mode.

Note, the misleading/surprising behavior of kvm_<reg>_read() being "raw"
variants under the hood will be addressed once all non-benign bugs are
fixed.

Fixes: 70210c044b4e ("KVM: VMX: Add SGX ENCLS[ECREATE] handler to enforce CPUID restrictions")
Fixes: b6f084ca5538 ("KVM: VMX: Add ENCLS[EINIT] handler to support SGX Launch Control (LC)")
Acked-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/sgx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/sgx.c b/arch/x86/kvm/vmx/sgx.c
index df1d0cf76947..4c61fc33f764 100644
--- a/arch/x86/kvm/vmx/sgx.c
+++ b/arch/x86/kvm/vmx/sgx.c
@@ -225,8 +225,8 @@ static int handle_encls_ecreate(struct kvm_vcpu *vcpu)
 	struct x86_exception ex;
 	int r;
 
-	if (sgx_get_encls_gva(vcpu, kvm_rbx_read(vcpu), 32, 32, &pageinfo_gva) ||
-	    sgx_get_encls_gva(vcpu, kvm_rcx_read(vcpu), 4096, 4096, &secs_gva))
+	if (sgx_get_encls_gva(vcpu, kvm_register_read(vcpu, VCPU_REGS_RBX), 32, 32, &pageinfo_gva) ||
+	    sgx_get_encls_gva(vcpu, kvm_register_read(vcpu, VCPU_REGS_RCX), 4096, 4096, &secs_gva))
 		return 1;
 
 	/*
@@ -302,9 +302,9 @@ static int handle_encls_einit(struct kvm_vcpu *vcpu)
 	gpa_t sig_gpa, secs_gpa, token_gpa;
 	int ret, trapnr;
 
-	if (sgx_get_encls_gva(vcpu, kvm_rbx_read(vcpu), 1808, 4096, &sig_gva) ||
-	    sgx_get_encls_gva(vcpu, kvm_rcx_read(vcpu), 4096, 4096, &secs_gva) ||
-	    sgx_get_encls_gva(vcpu, kvm_rdx_read(vcpu), 304, 512, &token_gva))
+	if (sgx_get_encls_gva(vcpu, kvm_register_read(vcpu, VCPU_REGS_RBX), 1808, 4096, &sig_gva) ||
+	    sgx_get_encls_gva(vcpu, kvm_register_read(vcpu, VCPU_REGS_RCX), 4096, 4096, &secs_gva) ||
+	    sgx_get_encls_gva(vcpu, kvm_register_read(vcpu, VCPU_REGS_RDX), 304, 512, &token_gva))
 		return 1;
 
 	/*
-- 
2.54.0.563.g4f69b47b94-goog

