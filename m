Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA525A655
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982465; cv=none; b=jk1VLQG/Xac68G/o7oWWva+vUZhbrMxXt4hOu+TQVsyBhPxPwIEdEkh3K6g7Om+Qv25/n0HdHuYsJsvW+D0GuwBL6zGoPTAJfeO1682kemdP+EmH1nF8TMPX84TyolX4KJhs/kUglmehefxCSNL1u4Lh2Q4B8F7hKFnbZmYCSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982465; c=relaxed/simple;
	bh=7lRp2eCkoo+DRHWUNEDaUBTQXTHdWU47sEkYGqsesug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SDKqANXTz8xg/2mzNr3YMxxGw4uN3Ev4bwvOpDcaCBqQlHsddH/Xn9GWpR2WIAFyjvhp0xGpIj05P/pX2DzGUNwKKvC0TuySrRMk0Qmfe9PaHRWYPSmy23CSrNMW0atRAVFAekubim90bWSg1WDnbiyq72rKNzOFR/IoW3cG2ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DwZ1eeua; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DwZ1eeua"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-358f8b01604so2567641a91.3
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982464; x=1772587264; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gV7BZ60qmf3JAsxc6wDH0RQvnfJYSY1NcM7wseiHg1Y=;
        b=DwZ1eeuaZ+wgj8X6XkQKxBUKpuXwfWhNhgI9kXsURu8qkJeU8Jh5xqeZ75GRvbkwBw
         hN4VAZzJvpAC+i6VluUog3Sypv5intiFhSunFM3rwBuAeK7dJe7AfDdjp82fv0HxfwYy
         URB+gw+2C0faQtKC2hKsNeRS7zrwBT2crEpOFhjCZZFqGpaUYyY1kpqVWa1ys99RweNI
         CIM6yjLOOYL3j/ptkguT2BI4/VNGFDq+OlZB35O8vhDuaomf8d+2SKXorvP+7BXPj9FK
         9dM0Tdn2LFRA5OFtWnAygRBoYooQSr38Ydm3jcHvBI2fEuAbuFmRq+xn3f4UmAxL2bVp
         JmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982464; x=1772587264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gV7BZ60qmf3JAsxc6wDH0RQvnfJYSY1NcM7wseiHg1Y=;
        b=EYgNvhjE3s7gpSsh2HggvLKaBQAX8KnTOdB3N0gQ3pIpModt/WS5RPBDlcfDHxN2K/
         zx+yJOOa4G/V8ik18YcygxLhytYRsYXEClR5A4XCT0A2eA4GPghNgVjzXrdMoQ/iiLWn
         gUznop/DUcw1r+mK3F1EOk27XAZX2QXBKbi+YoFBoK9s97UmJ5iq4T4sn2XL08vqRzJh
         UqWcvTRoapb0WQsxroLgnRn9MeEqsTHc5eIlQYpC2DBBj/CkZadUwqEVz2opcuoLBm1F
         pfAaHd8KwlBTGAk9NSQCKZmNb8uBYi/x/rsrPCJ4c0oMiGowrTrVBsLHyRC6EJsDpen5
         SW2A==
X-Forwarded-Encrypted: i=1; AJvYcCWrgt+U0t5uUICd0mNVV1YH+uCfvvERzwMyFo6Qf7KSKEqMlAwOJu52hrmQ9slwB+iIBK8wQqFhRDS2@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv91nwmD9xM4ijVai9v4ZcmgBIE/fx5dyTEa1ctzfazj7NinV6
	X8dRqZEDP5b+SWd3bAN4YpQW3GTm2dVZpuF8bPLJRIhjg4BI+iCyo0FtKY0KxeQvg2CFV4HZ2As
	LJAbR7A==
X-Received: from pjal2.prod.google.com ([2002:a17:90a:1502:b0:34a:bebf:c162])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5285:b0:354:c629:efaf
 with SMTP id 98e67ed59e1d1-3590f26515dmr508907a91.35.1771982463612; Tue, 24
 Feb 2026 17:21:03 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:41 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-7-seanjc@google.com>
Subject: [PATCH 06/14] KVM: x86: Move MMIO write tracing into vcpu_mmio_write()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Move the invocation of MMIO write tracepoint into vcpu_mmio_write() and
drop its largely-useless wrapper to cull pointless code and to make the
code symmetrical with respect to vcpu_mmio_read().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5fde5bb010e7..7abd6f93c386 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7769,11 +7769,14 @@ static void kvm_init_msr_lists(void)
 }
 
 static int vcpu_mmio_write(struct kvm_vcpu *vcpu, gpa_t addr, int len,
-			   const void *v)
+			   void *__v)
 {
+	const void *v = __v;
 	int handled = 0;
 	int n;
 
+	trace_kvm_mmio(KVM_TRACE_MMIO_WRITE, len, addr, __v);
+
 	do {
 		n = min(len, 8);
 		if (!(lapic_in_kernel(vcpu) &&
@@ -8131,12 +8134,6 @@ static int write_emulate(struct kvm_vcpu *vcpu, gpa_t gpa,
 	return emulator_write_phys(vcpu, gpa, val, bytes);
 }
 
-static int write_mmio(struct kvm_vcpu *vcpu, gpa_t gpa, int bytes, void *val)
-{
-	trace_kvm_mmio(KVM_TRACE_MMIO_WRITE, bytes, gpa, val);
-	return vcpu_mmio_write(vcpu, gpa, bytes, val);
-}
-
 static const struct read_write_emulator_ops read_emultor = {
 	.read_write_emulate = read_emulate,
 	.read_write_mmio = vcpu_mmio_read,
@@ -8144,7 +8141,7 @@ static const struct read_write_emulator_ops read_emultor = {
 
 static const struct read_write_emulator_ops write_emultor = {
 	.read_write_emulate = write_emulate,
-	.read_write_mmio = write_mmio,
+	.read_write_mmio = vcpu_mmio_write,
 	.write = true,
 };
 
-- 
2.53.0.414.gf7e9f6c205-goog

