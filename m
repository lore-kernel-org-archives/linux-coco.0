Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DF93F88BA
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067290; cv=none; b=pug7YnnybSXyiHe0b6VGM1JCfSEJjrTAedoLQBiJ8a50d+GkWrL7RxPjtt1emmawmym0IfHHIwlbtxlry/O83hUg18TEYAlsYOHdP2oj9iEGuTYf90/wn2pGHm1aWBAXO2l2HgBFQyzuB2QCpNQsM7FlyGnlmbIUAL9Y0o1B9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067290; c=relaxed/simple;
	bh=he0WfZWWdERYD7ChG87MeYfoSX2HSFZ+ZmjDHyI6dIA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eokTj2wjDABRadoBI5dJo9GiBVA92IXvFN9Ah/U6dw4hax30QB3vTdZjMJsVsC9zLymIiea/iQlJEqxyv7zmZwLD1aoyQvzXTMuniuFRm8QYCLty8LLstLX9QfqBONw/vmy2xs1rlc/563gyJzYShtn2X/Qex/faOVISUsp+umE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sfw2p5Ey; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sfw2p5Ey"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ba718173d1so107097715ad.0
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 08:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780067287; x=1780672087; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=juhHvibOKBbL5R/8TYL0oDxVwG80NiQFMLoZ+aO+Nyo=;
        b=sfw2p5Ey646CVB4qw9USOb57Jt6JNxgYXlbmUcbiw678P3+HfNcrZT/r/UNpMxZ/9V
         AgxrktvHsSBLSjK/oFRShR5/VErfnzinXsBszhYwgFf7CUkx0CG1DZO8edVxbMoHZtO2
         fqWZ/xax59ihgCaLSfseugeQA2e7fAsBbn/aF/1x44PpcFICGVeVCJ9V9KUf4tC91R8r
         Mgmri8T+2G+0F2VANmtU+tacbsoVlbhwa9sdcuQ4O4Qp3etQAszqQQVeUZ33+Ucmro8u
         w+Vw4gPldF6/FAJN9YO+BYMMD37+nnuAncUpXKDyB02r0tgySv8Xh8hL28rQcpMCdQwn
         ubAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067287; x=1780672087;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juhHvibOKBbL5R/8TYL0oDxVwG80NiQFMLoZ+aO+Nyo=;
        b=EiozepoZpvKcyp70XiPlpzynoWsjqy25b4HV8aNUAYMWOZ/mbqTa8Cj7EMC13wEmnW
         +W4zPOgtGqkMT2twjEF//jJc9d3ZXe2mZS49v5EN1isOzHiasCiRIfhRpo3MDAAKUANd
         O2pOKJRBanzYrvGJUWxyFzMqvw2h6zhoey444mBJJ7qAAI+prPXFjwVEDa6q7ZuJx5er
         GzO9VhR19Mn++cQjJoSQyDocTmjBJEP4wj4WMS0ADOmcTNonAh0Gml35mPAHLzQkFXJ5
         r4tzkpQ37cYyC/DS3Tr0EmIrx/Umv1C2MlDeSjUYiOvlssl0cod8QuR1lUoGntJ8rw/+
         x+Aw==
X-Forwarded-Encrypted: i=1; AFNElJ8L3mrGgZEZg/w4V1cUiE2LmzHGaDw0kdxGl5fiXw+YqbKREd0jJkMMrSm5d/8SCtkJJ6t8WPgOThOl@lists.linux.dev
X-Gm-Message-State: AOJu0YxjtIt/jT6cHvg+XBbLoNp75YA0Z6v09vC6kAtMnbvw2RfQz++i
	p7jauLSdqvCaRl5ejyPda8b7v0a+ovIFKgBIGwrFdfDvpU07ttrqHTMWUrJbjKY+YtLjV0Iq5yG
	mfnbdmg==
X-Received: from plrf5.prod.google.com ([2002:a17:902:ab85:b0:2b0:5538:b55b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88c:b0:2bf:2188:a90f
 with SMTP id d9443c01a7336-2bf3687a3f3mr2296425ad.32.1780067286623; Fri, 29
 May 2026 08:08:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:03 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150803.714504-1-seanjc@google.com>
Subject: [PATCH v4 35/47] x86/xen/time: Mark xen_setup_vsyscall_time_info() as __init
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Annotate xen_setup_vsyscall_time_info() as being used only during kernel
initialization; it's called only by xen_time_init(), which is already
tagged __init.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 91ef83b1e540..8f4511f91d16 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -454,7 +454,7 @@ void xen_restore_time_memory_area(void)
 	xen_sched_clock_offset = xen_clocksource_read() - xen_clock_value_saved;
 }
 
-static void xen_setup_vsyscall_time_info(void)
+static void __init xen_setup_vsyscall_time_info(void)
 {
 	struct vcpu_register_time_memory_area t;
 	struct pvclock_vsyscall_time_info *ti;
-- 
2.54.0.823.g6e5bcc1fc9-goog

