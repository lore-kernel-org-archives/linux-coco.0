Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF2366DAE
	for <linux-coco@lists.linux.dev>; Wed, 18 Mar 2026 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860533; cv=none; b=PR+Ra8sD9SEgnktPV0JyJAcUyH60RQIK/16NVqc1qf4izYiHJBsNT+a43mcDDZQWxN52GxAuPx2ed0GeXqAgEcNvnEwWt8hVcYgpddgzBMqiue7TfMiE8vo5G57p+eG+U7v09+o5AFbq7GyfJQevTzidcLWCQb3ZU2u1x7efMZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860533; c=relaxed/simple;
	bh=z+2sf/5km6HTWQdHuHjaRmn83kq0xn9ypsPl2UqNUbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uvqsGOxQSWvsxHKvn4iwEt5LIun+fhqLdRf2jZdBje3IqPihRvmKxRwAeCDHf8f/WfLZiwnrJnqPD9TKU1bJfaR3KPgq9tsUb/OfF3g842caukYUw2HB1LmMwBmQe9VEl2QD6DXNdr8SM0DThiM8NqPIVCKRwR+HXhggqSMYVDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f5UAM3Yc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f5UAM3Yc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48539d21b76so1477955e9.1
        for <linux-coco@lists.linux.dev>; Wed, 18 Mar 2026 12:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773860531; x=1774465331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pIf+VLPRohGstCaliNQzf45fwV/wxcML8JuOKn3Xfg=;
        b=f5UAM3YcKzqAWMK90WfSJIbOh4Vp1Wx0c3GVi6yW00KO2wtYOnhU/GR35Pw/4lOgMn
         ZYVSnkiRvZV+xUR2p2onHXKDwi64at4+jRMFGRSQ9VT1tX5VtspMUB2OJbpaTMDVc782
         EUluQyYm1nF9+Y7/Xebo40QeZ2EFYRjQ7q8ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860531; x=1774465331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pIf+VLPRohGstCaliNQzf45fwV/wxcML8JuOKn3Xfg=;
        b=X+KbdRUW/FORx86DUueXhCe76OK+docfyFEbtKFFfnNLTi0ZHRy2jU6KifMnNWBCWI
         0Ms1QEH1hEyr4MoMTTaSvCZPCtWdPTnUOlUuQsU7AdUo8mBM0+KHIeiKXVMauazkw2xE
         JJci9ioMHA2XFGKTnuOrDUz2tDqubvwjpAWkXyfkOVxzwv2dyJZEXT0r0+e2FxhO/ZRE
         SNfuaOb79vrLZFhLCZ+aX5I51jjcaRIEcKUJpPPd+wlagq2g0BhtICboyspBPJg3tbeN
         Sp84oA5Xl8LJY2h/hc9KciZZc/dMs33OHg9jIxJaN7RZN++7rgLv7OkqbkovQJtL2WTb
         4N5w==
X-Forwarded-Encrypted: i=1; AJvYcCWS5CdodEauzFqBl/CSLZU+taCH/i9S6m4u0UQhZK4eB+lIt6d9sgR+tjTPp4ch03scp2RR2AGJsIVr@lists.linux.dev
X-Gm-Message-State: AOJu0YzmNTAFox5E4mAEU6W1fMRG4rpqrbXoOY3hYVpRNxzjH1t9wfG/
	KYJMbOBQsH744xiQMDvr+RQghIEDT/klSXbsy5vuo0e/USgTk83wHtPTLEPqfGJKAg==
X-Gm-Gg: ATEYQzzsiBithXqTVLvGFb7Gu5EFI56WQAaYLaP+T3jaO8uzek842NAu1jyky3cDopm
	e6YQYfMBAA7iM0eVGxo15xuogfni7cJQ2PLrNZMEc7cNrQPrSmLwliZhyr3uxECtMNyawSCtnHh
	aoKNsEZeBJJThMjLISUh6MIvVQoyHut1MdDGP2ZYanIyZIfwb/0AAH+mIY2nIrkr1ow9hfpyIK+
	YNBSb4chj+lhzgWvk349WG4lrIBq5ZPVMuS6em3mF1wjiZi+JNG5UgjDp5WLzKS7CCXTCOSKqNO
	bfQifWuPDwdhMD7/SwVID+reYLxxfoshnswAY/MywGGZRE+5f6BCDfS8L+A6htBzRrZF2pDNJEA
	FQ13MJ6rqEJ2Eyo6ioJ13LJtxcqLB31WhCZBtx00yJ/Ztdc4YNVHiKwzPQH5iIa/wzegLo54XJW
	POsi/6tTH3F0PUZ+NQhaJwcSVXcKwTDNfN3Vd+PQkuQGRY2rBQHRyaXiXFNvNDamNzjltiu7d42
	QmU4ImIdx9o
X-Received: by 2002:a05:600c:8b65:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-486f44607e8mr76256695e9.33.1773860530585;
        Wed, 18 Mar 2026 12:02:10 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (202.88.205.35.bc.googleusercontent.com. [35.205.88.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c35057sm8461275e9.5.2026.03.18.12.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:02:10 -0700 (PDT)
From: Dmytro Maluka <dmaluka@chromium.org>
To: kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>
Cc: Dmytro Maluka <dmaluka@chromium.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	linux-coco@lists.linux.dev (open list:X86 TRUST DOMAIN EXTENSIONS (TDX))
Subject: [PATCH] KVM: TDX: Fix APIC MSR ranges in tdx_has_emulated_msr()
Date: Wed, 18 Mar 2026 19:01:03 +0000
Message-ID: <20260318190111.1041924-1-dmaluka@chromium.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note: compile-tested only. Bug found by code inspection.

X2APIC_MSR(APIC_xxx + APIC_ISR_NR) is incorrect, since APIC_ISR_NR is
0x8, not 0x80, so shifting it in X2APIC_MSR() results in losing those
lower bits, making it simply equal to X2APIC_MSR(APIC_xxx), i.e. making
the entire range consist of APIC_xxx only. So adding APIC_ISR_NR needs
to be outside X2APIC_MSR().

Additionally, since "..." ranges are inclusive, need to subtract 1.

Fixes: dd50294f3e3c ("KVM: TDX: Implement callbacks for MSR operations")
Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 arch/x86/kvm/vmx/tdx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c5065f84b78b..466a7de660c2 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2136,9 +2136,9 @@ bool tdx_has_emulated_msr(u32 index)
 		case X2APIC_MSR(APIC_TASKPRI):
 		case X2APIC_MSR(APIC_PROCPRI):
 		case X2APIC_MSR(APIC_EOI):
-		case X2APIC_MSR(APIC_ISR) ... X2APIC_MSR(APIC_ISR + APIC_ISR_NR):
-		case X2APIC_MSR(APIC_TMR) ... X2APIC_MSR(APIC_TMR + APIC_ISR_NR):
-		case X2APIC_MSR(APIC_IRR) ... X2APIC_MSR(APIC_IRR + APIC_ISR_NR):
+		case X2APIC_MSR(APIC_ISR) ... X2APIC_MSR(APIC_ISR) + APIC_ISR_NR - 1:
+		case X2APIC_MSR(APIC_TMR) ... X2APIC_MSR(APIC_TMR) + APIC_ISR_NR - 1:
+		case X2APIC_MSR(APIC_IRR) ... X2APIC_MSR(APIC_IRR) + APIC_ISR_NR - 1:
 			return false;
 		default:
 			return true;
-- 
2.53.0.851.ga537e3e6e9-goog

