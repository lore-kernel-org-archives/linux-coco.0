Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922476;
	b=Q8Z25qkFpVywZfSs+LZiRcwUUheSN3UJccwlNBq58XPGrSkP+IEy0AjyXf3Hya7CHULK
	 csl+iYa7ey9JStywxB6hLO8+jnfWbWhTcxvKDD0j3LJmExPXEf24P9iTkP8cZP5ZEkxSW
	 Jptpvv1dJuTYclbYeKoqFHIeKgVTgLt1hVViH9fK9M1xwtIWnUSuAy4HCb8dulWlObPzI
	 vfOI4Wlm/+YlQ4bNOvrXuUsk7aW8kFaFKY/bFwCSJpuNGg8beDP4gmeEInmQpTPMrqkP9
	 gZGLiSWGNN5MzdpTlpyfiYlvHgz35EpuM6fKE0Gtsl+y51O8Q66k/gb7nL2T4JLALCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=uBiUoB1GQ4LQL/nXuU6yhE6GYWmPG/iDNPjaG+VzZl8=;
	b=5Z3/7j5Jpjkhrk1nNm462U3+SwrQwdy8sqv6vFag93V5H0A5VTxK4zydlVpV8rnqs6pl
	 lXkE4zPbrA2VXXvu+qwmtn0TKI/cjEPg/Fjp+MUFOH4OJr2kvBr5cW39CoGAl13+OyEe7
	 Ky7v+aZlIr5FPY5OU2k0RGAuvJppldkUm55Bkaz7JqYwEJqSLMH0PO/YU5dJOaDSDUH9j
	 Tk+s78DeYev3Rn2L8nmH05yyNdTgc81cfkaQVvtURGQpYgagbe5iUTQG63+orGayNe4WP
	 idnSE5z07Bwq5YJM0RSLDfIsUmCEFEtp1YZER4pXeLuOsGAR2/gCEjFJNeMrdMCm7og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qM8kxyJj;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BFD6082BF9
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54BFD6082BF9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qM8kxyJj
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso56943a91.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922476; x=1794527276; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBiUoB1GQ4LQL/nXuU6yhE6GYWmPG/iDNPjaG+VzZl8=;
        b=qM8kxyJjQrXHcsx2L/ACTcChpf4kdVy1KuMqxSqQut3wGldxhyuDI5q1ra78kMf+JX
         hxCm++f9c9rBTgtcLJ20xRQMCh0OVllXiJVT5R4tJvDs/9sblz+uz2LcbRfUo00a33xv
         UOnriXdhBKD+2YpQ60DMY3dSgKB2qHMuz3R2NAbkjPic68bBPHtWMLCF/y7+CSlRStQB
         KI5+Nf2HtVaXPtveJidn3froCrlzTO4zdPqxvcQI/YK0WHd5fA3W8C9yAmQrd1J5TN+1
         yS8DR8meYrIy6kjj0ky8Wt714FxpgZ79CLZYGOiyYLEIsKA81s/UF1i7D56Puzh5D5V1
         ILZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922476; x=1794527276;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBiUoB1GQ4LQL/nXuU6yhE6GYWmPG/iDNPjaG+VzZl8=;
        b=Uh1XgYlqzu80OFHAwTeAPhasKL1hv1Bbw4URS8bm2tpcztruV7oaCbXeCI7+gDN6kz
         AOIojebIGQ3gsNEOCvTXBwvz3ySkQB1Y5tLrXLnkoc58cv8w0rK4FfB0H9FZ8onte74N
         xci4BbgZPy1Vyi6zgVNHOWrMbuUrB7Zjsz7ATdILrBQUqcb1/0q9sm14/J9e97m7OaQX
         b+7mY/vI2JgFvr9rheZu+tEcXhiK1SzFw+O7j3wBgGQ89wcIRg2NO8XIckf1sIgF3fZN
         QcJER5s66C6bTJsnKNtOV/VBN23bcF7KPqAspXygl2AaZ/P1FZ4Tyaw8o/vn5HEkyOl9
         YTBg==
X-Forwarded-Encrypted: i=1; AKwUvBwoJkwMQTdaj8rxLJBkQuwuXPNKSfpNkCfT7CN9YB+ovpqKX8BMKUvnOOgDltHCh5NrQ0nNJwSpdzte@lists.linux.dev
X-Gm-Message-State: APuU4Z+wQHdV6H9pi1wDCmHlJ3GLWV7nXklu292ASTbxW9P4jrOSlFbJ
	90LMoRKGk4Xtg59/64wFJ7skACV3+lD3dS59/4oiMlmUnt2W5ev6X8CEhzEJoumWQfDTbj65BZR
	DwDp50w==
X-Received: from pgly13.prod.google.com ([2002:a63:180d:0:b0:cd6:1e1f:43b])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5390:b0:3a4:8c41:fab6
 with SMTP id 98e67ed59e1d1-3b0db700909mr672764a91.46.1793922475543; Thu, 05
 Nov 2026 15:47:55 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:58 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=3040;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=zQXICDUfkyOEjaQ9E9JzE6XP0PgFJvrAcKjCLLRv2PE=; b=++6VzU7tL+aM9iRm8j00/5V85eUN0JZ0BcvHYqocl+buUFvfNvnydmWJLpoiJC7HCuRMpkMxR
 x50Ds50F24LDNDjtcclc41/SVXvHrQHGmmELVCo9jjrlTVl90UlLMh6
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-14-2024e8fa517a@google.com>
Subject: [PATCH v16 14/20] KVM: selftests: Set entry point for TDX guest code
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Since the rip register is inaccessible for TDX VMs, we need a different
way to set the guest entry point for TDX VMs. This is done by writing
the guest code address to a predefined location in the guest memory and
loading it into rip as part of the TDX boot code.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h |  1 +
 tools/testing/selftests/kvm/lib/x86/processor.c        | 10 +++++++---
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c     | 10 ++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 9d951f67b3b5..1cc876891589 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -72,5 +72,6 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
 void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 void tdx_vcpu_init(struct kvm_vcpu *vcpu);
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 110d23e50bcc..11db6a3b0366 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -853,9 +853,13 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 {
 	struct kvm_regs regs;
 
-	vcpu_regs_get(vcpu, &regs);
-	regs.rip = (unsigned long) guest_code;
-	vcpu_regs_set(vcpu, &regs);
+	if (is_tdx_vm(vcpu->vm)) {
+		tdx_vcpu_set_entry_point(vcpu, guest_code);
+	} else {
+		vcpu_regs_get(vcpu, &regs);
+		regs.rip = (unsigned long)guest_code;
+		vcpu_regs_set(vcpu, &regs);
+	}
 }
 
 struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 84127618f05c..324f3c41aa61 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -118,6 +118,16 @@ void tdx_vcpu_init(struct kvm_vcpu *vcpu)
 	tdx_vcpu_load_boot_parameters(vcpu);
 }
 
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
+{
+	struct td_boot_parameters *params =
+		addr_gpa2hva(vcpu->vm, TD_BOOT_PARAMETERS_GPA);
+	struct td_per_vcpu_parameters *vcpu_params =
+		&params->per_vcpu[vcpu->id];
+
+	vcpu_params->guest_code = (u64)guest_code;
+}
+
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.56.0.455.g6c5a503b38-goog

