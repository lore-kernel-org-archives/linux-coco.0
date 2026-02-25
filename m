Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079727BF6C
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982477; cv=none; b=THqbVpv0G5quWMbeUYN2IL0REAGS210RIQd9JFV0yt0b+XZFiBq/r2RlKC246oNGPoYv+rvZjMUJkKrqfyj2aonC+N5KhF1Jwno00yb4JPDQcBVMqLeID2gKO5d9E+G53HkqMuQa2O3+xE1lJWEkji/7EK24aYXLFEvn3B/nMeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982477; c=relaxed/simple;
	bh=XAkvXmxYSWcnAm2ngYtj/+yAtyCpKD+kGWhH+fNj3zE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dTY7DFC2sPo3GzhDpodN3xze03WBrXZqzbxOn7VWTNHqDu7MWPksTah5OAiBHXXG+OFgXjlZnnQdEi+C8UJ9SaTsEc1dbmXVKFg4lGn+WkV51vnB1B9uIL4ExTiqR1Fm2WekD5nBnFQnMCT2GXnD6hqyfQNFxQb6g856wQzQpjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y5jjjXjU; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y5jjjXjU"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-358f8b01604so2568080a91.3
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982473; x=1772587273; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cC3kOG4PMTKHbBJlg/C79tGxZ75SzIpZ8/Nyw/YcEt4=;
        b=Y5jjjXjUXCnPX4jegCbf+gSHVDXa0rgNNoFWigqSksoNMxuraQMd5VyRfWURhPqw3t
         opwKskfkl4P11xqYnDu+1zeVsNH/5KTTcxeGDrZKXjF1lUtaXoCJlWLqdf/yz8N7pljx
         gdZ5gZf8CW/dcggQOaV7UyASd9uFxnvC8EUH7v+leRjIlxPwmXSh4m6EBEYVuVdwAyci
         tMEVLu8jpIZk9/Sa1beT9t8YFxUlKLmkR+HxC4JTf3B9e1dSINkp8GBEBob8gZrwCSBV
         y6z0iSsQrou/9f8C7GpnbMHtHruc4T0lYZ00ucZF0BsZHLPLH9mYOY1uJFJqE9LKJ+iF
         39dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982473; x=1772587273;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cC3kOG4PMTKHbBJlg/C79tGxZ75SzIpZ8/Nyw/YcEt4=;
        b=BNG8dtCtpP3w6CK+CFE48hmkeCgzRDgeisEjCXTMGGvLn5hkdaGwB9Kb/RvIcJik20
         IEH+HOYODBnkkVJ1j7ADSVptl3aIT00TKU7AzNpdQny90FioPCMsoY4j37XWMuSWSGpl
         f5QNkJfUM/Goid/tTFUBO9YZJ9FhO2SAMYmTqiSYInl7J58b+X+5AxT0WMIFTw/RU0Ug
         3RQyfihq3eh8eIbQKi33uF2l9+XGXiExCVpOiLA7Np6jNujVCJ5dgwXhzbSpN1pt6Yu2
         mKxwberEc6akSBWJwNFTzUW3Mw7qtoAmjIk2VcEbjSTexVsqxnJwHXfd3Fpoi20RX4jQ
         UgLw==
X-Forwarded-Encrypted: i=1; AJvYcCXhjGwMw7VoQS4+xMbR3ctPdD8rPap9t+A/0aMv4PjZW7XkxaOzU5cIJexFn55bRg+m4IjKxp2Dsrm3@lists.linux.dev
X-Gm-Message-State: AOJu0YwvwWmzlp/J+Cpr4gvDkgEFZm9V4eAOTFyuNscVqf3iIBvsi0es
	1DTQzRNUvfRIhLMUNA9RXv9eqFljY+tFYV2ZnJ+FtAwB0NLzhjtxX2j96XqKe5oCzQDT+BSSulX
	gP/t/ZQ==
X-Received: from pjre10.prod.google.com ([2002:a17:90a:b38a:b0:359:41:e301])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ec5:b0:343:7714:4ca8
 with SMTP id 98e67ed59e1d1-3590f08c0e8mr548564a91.15.1771982473219; Tue, 24
 Feb 2026 17:21:13 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:46 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-12-seanjc@google.com>
Subject: [PATCH 11/14] KVM: x86: Fold emulator_write_phys() into write_emulate()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Fold emulator_write_phys() into write_emulate() to drop a superfluous
wrapper, and to provide more symmetry between the read and write paths.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 ---
 arch/x86/kvm/x86.c              | 20 +++++++-------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index ff07c45e3c73..aa030fbd669d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2097,9 +2097,6 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end);
 
 int load_pdptrs(struct kvm_vcpu *vcpu, unsigned long cr3);
 
-int emulator_write_phys(struct kvm_vcpu *vcpu, gpa_t gpa,
-			  const void *val, int bytes);
-
 extern bool tdp_enabled;
 
 u64 vcpu_tsc_khz(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5fb5259c208f..5a3ba161db7b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8102,18 +8102,6 @@ static int vcpu_mmio_gva_to_gpa(struct kvm_vcpu *vcpu, unsigned long gva,
 	return vcpu_is_mmio_gpa(vcpu, gva, *gpa, write);
 }
 
-int emulator_write_phys(struct kvm_vcpu *vcpu, gpa_t gpa,
-			const void *val, int bytes)
-{
-	int ret;
-
-	ret = kvm_vcpu_write_guest(vcpu, gpa, val, bytes);
-	if (ret < 0)
-		return 0;
-	kvm_page_track_write(vcpu, gpa, val, bytes);
-	return 1;
-}
-
 struct read_write_emulator_ops {
 	int (*read_write_emulate)(struct kvm_vcpu *vcpu, gpa_t gpa,
 				  void *val, int bytes);
@@ -8131,7 +8119,13 @@ static int read_emulate(struct kvm_vcpu *vcpu, gpa_t gpa,
 static int write_emulate(struct kvm_vcpu *vcpu, gpa_t gpa,
 			 void *val, int bytes)
 {
-	return emulator_write_phys(vcpu, gpa, val, bytes);
+	int ret;
+
+	ret = kvm_vcpu_write_guest(vcpu, gpa, val, bytes);
+	if (ret < 0)
+		return 0;
+	kvm_page_track_write(vcpu, gpa, val, bytes);
+	return 1;
 }
 
 static int emulator_read_write_onepage(unsigned long addr, void *val,
-- 
2.53.0.414.gf7e9f6c205-goog

