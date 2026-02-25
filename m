Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394FF2797AC
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982474; cv=none; b=ZW3LZqbAV5Y6kPB14SbNuWYhSA55wcFl7JL4qjkT6V4NZlNXIm+doBL1+Sfm/FefdPTyfWcUlp27bTjvuIEWsm3yAhhT0StQZOh94vNfSuhv9VgS8/F8aVF3oNPsed2KXp6b5DR/I1UA5jjRQX/Its/n9jYAqyvOcf/tpi+9a+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982474; c=relaxed/simple;
	bh=8BpbiNXkNmG68PauqKn1vI4bfavvNUcZL8H/4h/xCDU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a8PI9qSg6khHs5W0IfaXbRXdgXz1+1IWeolevKZ1TYC5TfArx0wT81t20Qw1b7QRpEdWiuy+SrEoKK3aS/wCF5fUs6/GVoJFx51to1O8QE81cVJUuMQ8IFxZLPYcX6gVQ6uibs+73UFmEffskVO1YedW7YfrNCNN7KOnQs8G0Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kgfdkJEY; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kgfdkJEY"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-358f8b01604so2568001a91.3
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982471; x=1772587271; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=NC+PweffU72Wb4W/8tySGqQ5rYKiIvlwoGA5HRqPPw0=;
        b=kgfdkJEYvh5o1c9ScAunue9wIkgsh5Hp8eE+BkWIxgPyaLU9gmzCJgzOV2Ah212VkP
         HF6hoph61xpadPeXqyNKhku864wc50yFTq4zp01x1OTKbp21hocfDQArbIEHWyniJTOJ
         /wAs0CeXALfrBoqAkONT5DTMZOJl8wBg/zWrKDgRTmRF49fwQjQ3JnOWEekXTrPx+Z+w
         Rt5NwA5sSdXMIy4/h4SIEElGYxM2vmZ0u0Vv96sN6AZiutvRqxdkQYpV2pZX7rn26+AL
         Qatx52RVPTiabTb6eyNDoVXfTHDduzhkvuYjsXNgUst00mUzgExWMcHsA7AsHFR6dn82
         EoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982471; x=1772587271;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC+PweffU72Wb4W/8tySGqQ5rYKiIvlwoGA5HRqPPw0=;
        b=WR2eeWgS8FE24h0V219r6XRjEUcCr3E4PGMam0uUp8/tg5KPqE16ubclup2UJ6xr1N
         8L4dZt2Y3cCxffUKsfK6f1n5w8/u7B+N7sAxrKSc2Qq+/rj31nL1Opa+Rjh22vHEgEBZ
         rIFdm+adtxBMegxVoGS77kTMIxQcrMgKQjpNlOB0WoKKnJInUs1QZhch+sAYy503vNL+
         ak/WL2PCUDTxGOJGI9McDPKlr+A5GXACMiJ9XxNojmIDx3IJsxEd1Jywi8ZQRjFZTRC7
         wM4/v7xrJSS8JJ8RNYwbc6j4fZMHeqdRsCTbToD8suFrSbdYdihNmYVaoWexA5mwRnwm
         aKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZCioAYzK619GXPHyjlbv+lGvEW8IsgXs9RAzxU+VpBh+prfpAYu6mPlNlSj6Lav7mpwl1Iobil20v@lists.linux.dev
X-Gm-Message-State: AOJu0YzixgosAP69I1yXPbrbc3OTjVmGZHbZ57+CFK9aTDdRL/lY02Z+
	AQuzqFLorwsm4MhwDRf9gxgsYHCYtovmleqMwHhTp7Hfyml4HypWW6LFu841b3Q49PDne9r522h
	4Ua3e9g==
X-Received: from pjbev14.prod.google.com ([2002:a17:90a:eace:b0:356:3104:ed7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ec5:b0:343:7714:4ca8
 with SMTP id 98e67ed59e1d1-3590f08c0e8mr548523a91.15.1771982471453; Tue, 24
 Feb 2026 17:21:11 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:45 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-11-seanjc@google.com>
Subject: [PATCH 10/14] KVM: x86: Bury emulator read/write ops in emulator_{read,write}_emulated()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Now that SEV-ES invokes vcpu_mmio_{read,write}() directly, bury the
read vs. write emulator ops in the dedicated emulator callbacks so that
they are colocated with their usage, and to make it harder for
non-emulator code to use hooks that are intended for the emulator.

Opportunistically rename the structures to get rid of the long-standing
"emultor" typo.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 022e953906f7..5fb5259c208f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8134,17 +8134,6 @@ static int write_emulate(struct kvm_vcpu *vcpu, gpa_t gpa,
 	return emulator_write_phys(vcpu, gpa, val, bytes);
 }
 
-static const struct read_write_emulator_ops read_emultor = {
-	.read_write_emulate = read_emulate,
-	.read_write_mmio = vcpu_mmio_read,
-};
-
-static const struct read_write_emulator_ops write_emultor = {
-	.read_write_emulate = write_emulate,
-	.read_write_mmio = vcpu_mmio_write,
-	.write = true,
-};
-
 static int emulator_read_write_onepage(unsigned long addr, void *val,
 				       unsigned int bytes,
 				       struct x86_exception *exception,
@@ -8295,8 +8284,13 @@ static int emulator_read_emulated(struct x86_emulate_ctxt *ctxt,
 				  unsigned int bytes,
 				  struct x86_exception *exception)
 {
-	return emulator_read_write(ctxt, addr, val, bytes,
-				   exception, &read_emultor);
+	static const struct read_write_emulator_ops ops = {
+		.read_write_emulate = read_emulate,
+		.read_write_mmio = vcpu_mmio_read,
+		.write = false,
+	};
+
+	return emulator_read_write(ctxt, addr, val, bytes, exception, &ops);
 }
 
 static int emulator_write_emulated(struct x86_emulate_ctxt *ctxt,
@@ -8305,8 +8299,13 @@ static int emulator_write_emulated(struct x86_emulate_ctxt *ctxt,
 			    unsigned int bytes,
 			    struct x86_exception *exception)
 {
-	return emulator_read_write(ctxt, addr, (void *)val, bytes,
-				   exception, &write_emultor);
+	static const struct read_write_emulator_ops ops = {
+		.read_write_emulate = write_emulate,
+		.read_write_mmio = vcpu_mmio_write,
+		.write = true,
+	};
+
+	return emulator_read_write(ctxt, addr, (void *)val, bytes, exception, &ops);
 }
 
 #define emulator_try_cmpxchg_user(t, ptr, old, new) \
-- 
2.53.0.414.gf7e9f6c205-goog

