Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E715A367F45
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 00:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773189241; cv=none; b=bfJefx9RRScxD+2HP5cLbu6X79EPZ3ejRF7l6NDCwweKtJx4pK3FBe9ec10OeqizLtbNFd1v9rkLVUDvd/ac0wX9L3uN/iwa3cQ1DAa8odi0zjwXQOCZbVqmfWHcDPHxETzd3cI6c7dF4V4e0wJ4cFlWnmMS1xKuBBDJOwghyYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773189241; c=relaxed/simple;
	bh=LACfdw/zW10Jq2WOM8fA9MujAFua+8h+3eY59ooXrwQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ldNjSZRDCLnrQw8lVX0wo705RnlvXoZjxsYud0XxFiimdtAIcXmEY27sR3P7xsxvoQX3EHmNQ5H1IoZIR/qh0PsB9LdVcpGnwGNDC+IjmerDAosPEAgEd1kqSPr5M5e68xbTjPIDCdlm8cz4+BUsy+5+bAZMR2omA2wCSH2EdpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yncFgy6t; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yncFgy6t"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35979a03106so10722698a91.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 17:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773189239; x=1773794039; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/u7P5DGbuL3/Pf42zn0rgLVQxjHAQYab6nCFQbQkuh4=;
        b=yncFgy6tB7afZ8sqAL6BAPIiEj+ub6ZwUSG+b7pZmZb41dUDc5RKirNCnsXQRz6VXf
         tfVkL5q5ahwEuDNbhk85INHlm8IqMVh/0x/InE3qsETZx/x1rzmQTG/hVYKtLF+rx6Gv
         ncqezq95i3bp6w/SPcNz5vSLtyQCoYOVtogUvcugqb9FU3mJqcMRxl56hsGR2EkcbxLZ
         swqBuCk5ypGRde3WRi4HZWD85qkwYfeWRXxGImqOAOCTY0sz6RKrErYxVfYVF6wfGnNY
         bA7GgPpA4Q3b9CuqJp4JswrF9dFKu3pqMSjRPxuHgqgMg8Kqtchukdj9vl0zy/0zWdit
         dO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773189239; x=1773794039;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/u7P5DGbuL3/Pf42zn0rgLVQxjHAQYab6nCFQbQkuh4=;
        b=Stia8wQmDhZc6oB7enHiLFO8H5qmVknrJynxFWDGXGlyffUqQMRDWshdsnLw98mH0p
         UOqRhPYoFaEqyn2QQNSfutHFgDncqCr90jQOq15Ibpw8Fi113Blv2P6gU1Mnez+HMZGj
         xNVpd8qrQ9ulZjYTdAtd4TUVIwBJ/6ePaDdc27AuGxViJDdwlGEInh/37Z7IJnOdC/3R
         2JLhcN4urwPlrlIL/2CttzlK5dxDKDJPEV668Jy1L9tAfne08HdsEr86IbQcEhpqJk34
         nvOppZCIbzWqqQrRq90ID/0HUOn5fsJVGvX1ZgXq2HFnitpM3mjh66RGuG+CJ4ah+Y1U
         vYiA==
X-Forwarded-Encrypted: i=1; AJvYcCWvpnuvvPEb5VwXDDHeXd4BvLCzG/De+aGRqx9ZgQ5GWxWAMbRDvrKx5hNX/4m2ilzMQFX3xx4QO+07@lists.linux.dev
X-Gm-Message-State: AOJu0YyP9opH6qx9dWN5YlxIMucEhjKwlLg2bBU5MuFtrQQ/WrOhVvnR
	qvSvIthzIHycdfiZjCMdbyzLYIIdRm1wP3BgNjpOhnFSeanBYjvxIdqQYqhNPommJYATUbTsaVe
	iMpFgqg==
X-Received: from pgbs189.prod.google.com ([2002:a63:5ec6:0:b0:c73:999d:a1d5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d83:b0:359:981b:5dd2
 with SMTP id 98e67ed59e1d1-35a0124d192mr631149a91.14.1773189239132; Tue, 10
 Mar 2026 17:33:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Mar 2026 17:33:42 -0700
In-Reply-To: <20260311003346.2626238-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260311003346.2626238-4-seanjc@google.com>
Subject: [PATCH 3/7] KVM: nVMX: Do a bitwise-AND of regs_avail when switching
 active VMCS
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"

When switching between vmcs01 and vmcs02, do a bitwise-AND of regs_avail
to effectively reset the mask for the new VMCS, purely to be consistent
with all other "full" writes of regs_avail.  In practice, a straight write
versus a bitwise-AND will yield the same result, as kvm_arch_vcpu_create()
marks *all* registers available (and dirty), and KVM never marks registers
unavailable unless they're lazily loaded.

This will allow adding wrapper APIs to set regs_{avail,dirty} without
having to add special handling for a nVMX use case that doesn't exist in
practice.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 942acc46f91d..af2aaef38502 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -310,7 +310,7 @@ static void vmx_switch_vmcs(struct kvm_vcpu *vcpu, struct loaded_vmcs *vmcs)
 	vmx_sync_vmcs_host_state(vmx, prev);
 	put_cpu();
 
-	vcpu->arch.regs_avail = ~VMX_REGS_LAZY_LOAD_SET;
+	vcpu->arch.regs_avail &= ~VMX_REGS_LAZY_LOAD_SET;
 
 	/*
 	 * All lazily updated registers will be reloaded from VMCS12 on both
-- 
2.53.0.473.g4a7958ca14-goog

