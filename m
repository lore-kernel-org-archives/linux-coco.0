Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1325C2376F7
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 02:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622800; cv=none; b=C+uzRMsRNX1s7UgC5imurbcWsPqkri9p9ntAlGBup8BbFVfxxUWcIpIsXZ45fkTGmeX/xmKWu+ZBCZUAegRMhyGkUCCilPNMgJUe8kis/MWkWkQggRoAeidhPyP2+NTNAp18efFIGOg6auv44IxYhAGFYLmJf/Rpge0kc6L6FW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622800; c=relaxed/simple;
	bh=XdZRYBlPZyw/8jtawHaf0Gd25EjncrTXZSrOsMRCotM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KXuLOdOwmGeRorbpGC3lBCVLlGjxs8E74ZSZIqrCNEYhhA3ZgItlsItj/8zE+lrAOEHm9N3XoJxCkwp7iwX/8SQI5XIPiNLLElMPnSd+3l3lkKhow0dSO6SmsrAuS4Nq61IvphlfKXz19lfTf/7zgBVc39zq7tnoHUpzev4W/60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QjIpHkgw; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QjIpHkgw"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fe8de1297eso1024213a91.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 18:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622798; x=1741227598; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LZJJLySVHQgVgABAB7C0XZjDtBlLYwz9ES+Z1vP/8LE=;
        b=QjIpHkgw87BxocL59P0Zu94gvh6sjru72BoqJ/slPGb/IDg19f/tSMe12kZZdxiXCw
         OcY73Y7yxtd9e6j94w/x6YM3RjaDV1eM45cP204sGKJe/eEJpv+W+XU1D9fWZlKraVo6
         OvEG/OZsX0TyR5bljacTB95rfpL6W2RY9YuvGtkbCqieGkS0/U/ah6DR41XGwyyxUwpJ
         cOZleMpI0rAyi9T51iyQx+l6/o8gabd01t99I0nSthttkloIVlWTs6kScOoVjJjo3nNK
         4sJUJk8+gKp4c9/k6UJYsBZ2hv0PAvvI0wbJzkIbnNcT3uqX2S895vOi45bAC99pNLBJ
         3Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622798; x=1741227598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZJJLySVHQgVgABAB7C0XZjDtBlLYwz9ES+Z1vP/8LE=;
        b=pODVvkcAja0U0Oe8BYOce3GbmBPDk51C+akmzZux0QXOconB/YvdzmPpP5TRJpbcDq
         ZQpuefJxVncEg2G2RblZNp6B5KSHGSDwvySsEQXj/O+DFNXP3xgeeCgNu5cL6rLfA/8O
         BfAjp/3BKfOo7NKqUS1w5CiCKtiX3N+WJdFX/avsjbwYKvt/ca20TeOyEEk84FUAwFl1
         M7nDPuCIfk5aym7zW9io0lg/nCBGb5ukvgrDceOj+JSzZ9St3I+2kZfhfxbWiGWV6vo5
         ti9h2xWwTGf9KZky40kVdxneALGcgj0YLbjsV6T//zRXZpYAH6Tn5x9jmMxKCpaCi1+o
         3tZg==
X-Forwarded-Encrypted: i=1; AJvYcCWbIVvDPziut+F8ykQQ+W98uDWLzXmH02BUV5UqtgS7FE0pWOuvw05e/hmJIxrXTKnggQD1IqLr48GG@lists.linux.dev
X-Gm-Message-State: AOJu0YxH0XaH/9FJMdg8aB+bbtRn16pYhpGSvCUm7neyS1YqZhXYMYUF
	8IFdElYVwVLwZjVEexh4hyWmaJxnvScNQf7cpxs/ubA2qHVSZViNsSAd0z5eKS0+jROlTYOAWOA
	Ecg==
X-Google-Smtp-Source: AGHT+IGhmfOgzOy0w88MLax4aQJq7WSM6/RTmeD/HK48z8QB3SAzs8w4kTiAhr4wwBRMQkXZhflq/qsZ2GU=
X-Received: from pjtq6.prod.google.com ([2002:a17:90a:c106:b0:2fc:11a0:c53f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:570c:b0:2fa:2c61:3e5a
 with SMTP id 98e67ed59e1d1-2fea12c36b0mr2515446a91.10.1740622798574; Wed, 26
 Feb 2025 18:19:58 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:48 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-33-seanjc@google.com>
Subject: [PATCH v2 32/38] x86/tsc: Rejects attempts to override TSC
 calibration with lesser routine
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

When registering a TSC frequency calibration routine, sanity check that
the incoming routine is as robust as the outgoing routine, and reject the
incoming routine if the sanity check fails.

Because native calibration routines only mark the TSC frequency as known
and reliable when they actually run, the effective progression of
capabilities is: None (native) => Known and maybe Reliable (PV) =>
Known and Reliable (CoCo).  Violating that progression for a PV override
is relatively benign, but messing up the progression when CoCo is
involved is more problematic, as it likely means a trusted source of
information (hardware/firmware) is being discarded in favor of a less
trusted source (hypervisor).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index be58df4fef66..ebcfaf7dcd38 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1309,8 +1309,13 @@ void tsc_register_calibration_routines(unsigned long (*calibrate_tsc)(void),
 
 	if (properties & TSC_FREQUENCY_KNOWN)
 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ)))
+		return;
+
 	if (properties & TSC_RELIABLE)
 		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_RELIABLE)))
+		return;
 
 	x86_platform.calibrate_tsc = calibrate_tsc;
 	if (calibrate_cpu)
-- 
2.48.1.711.g2feabab25a-goog

