Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A51DA21
	for <linux-coco@lists.linux.dev>; Wed, 12 Feb 2025 00:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739318904; cv=none; b=FtjSmzUI7h6k5nozoZcPaz1gWyysqGVBAY7o4jN7909u7y1nZgNFghCvGxDDAfHBZV6hcQj9hVH4T9HueeMgwrv3WdGmFxCyH7LHgp/atwHUVJSeYboHucDuObPN9bsph9D48rNjla7BfLACl7SJXLu3/W1mc8Wq4yT6/FFs2uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739318904; c=relaxed/simple;
	bh=Ry//zRj6xrQGvb+QLd5PGQ2AmxS5vbX9LInUxHl69YU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SFbBXCzDf+kJ5C0oPahxLAor4fL/zutY5lFEtec1tSh0jgyWf/EAD5aWcTZ+LFf+uvpxDMgzSfiUBU1e+ZNRs3zmAzAYJbinKkDw76XyUfJSXp/ordSlg6O0/kvg0g8BZGp+WJt/Shystg8Rbz1JvLjF4EV4kXfrhkeD6Xi5pKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=14Qh0nV0; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="14Qh0nV0"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so12138516a91.2
        for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 16:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739318903; x=1739923703; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qWVkozr8oT2oqbRq082DQxpQr7C1Te5FFbGPk2fd3qk=;
        b=14Qh0nV0/OYb/pNWuPrekH7/0UtWc/gpDaAWh+LCF/xUh7Vuu4zMaOaTr9abDGuboS
         dxX/1h7x9hBCoNuGlEmHG+i9oZJkkbq8VrDP73MXd6JjMiDPKZBC1gWRHCOG1Hmi4FHl
         29JfoBDV1o51pLn6ONvYAx/u04oJJA8FhqIbt/jsGlX1zlzSssRi0VrMTA7jdyBuu+P4
         Q1FjPXoufwBMuYmpN28qtfzcODbEy/4OqhRiHMx5XCwjhfHHA4HnvtRGfCxUjyb/rd2V
         83Zue/M3dYgtu6m2maZvwEdiOycYrCVKaOO6jLEBhXJ5l+5baf6zd5GHZqXUJ2cD/taG
         4nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739318903; x=1739923703;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWVkozr8oT2oqbRq082DQxpQr7C1Te5FFbGPk2fd3qk=;
        b=amUSyDviUyMvwoII0zd+9evIv39g7Nb4UyKWdPlF1RhxsE9rRguBuqpOSq+W3rpXhx
         nBTUadehIyghlbXsZo+c/AywoGkKkxScGyw4PMyGKCsI8ES7OnzePO7NEeLykedjGMAo
         eDAkjd2Ixm4IuG8IFLOoIJhvEKOBM7zvgXhB5g7n6cAR3eldvTZJf2eHOcs/dwbcJn5s
         skQXL67UCoAOgZfL0H8o+38Yw+2ldVUIgsbdR1023tEWNIjDStcZnz3GLD94jdm2ho1u
         Zn0JTq45Ey9EU6rUiJ4+Wk6nkFzZmOH77dKoWyB2WcP5tzGrea/IQY7yfXWM8NkpCfP7
         Rrog==
X-Forwarded-Encrypted: i=1; AJvYcCWUz/YiXThRTcn0oPJjo3Z5RlT1BqcJKo/o5zmtTtRux/7k9S0wyp/z9OrVLTbpOe0oaAKJi05H/Mr7@lists.linux.dev
X-Gm-Message-State: AOJu0YwuXxKytIcLzePvYj3N0LOr7+Y+IYu8T6aqAmmjgSYnodyA5zBg
	4J3FnU7Np8ExFSRjLb+5vBA5na/ZdAf7Ai3tS5NMs2oWnTnNWkynKU5bgyrTkFXiGqTNtsR4mN0
	inBcSzpWulejByvNeGQ==
X-Google-Smtp-Source: AGHT+IEEYDooFC6yZwCAZXg+Qe55IRgCOFsgi1vdwniEiq9a0JjJhwh4h37DZWM3PfdySr35aQ8I4TeUG3Jg4tag
X-Received: from pjbpv10.prod.google.com ([2002:a17:90b:3c8a:b0:2f2:ea3f:34c3])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:51c6:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2fbf5c6abf5mr1891723a91.33.1739318902913;
 Tue, 11 Feb 2025 16:08:22 -0800 (PST)
Date: Wed, 12 Feb 2025 00:07:47 +0000
In-Reply-To: <20250212000747.3403836-1-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250212000747.3403836-1-vannapurve@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250212000747.3403836-5-vannapurve@google.com>
Subject: [PATCH V4 4/4] x86/tdx: Remove TDX specific idle routine
From: Vishal Annapurve <vannapurve@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, kirill@shutemov.name, dave.hansen@linux.intel.com, 
	linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"

With explicit dependency on CONFIG_PARAVIRT and TDX specific
halt()/safe_halt() routines in place, default_idle() is safe to execute for
TDX VMs. Remove TDX specific idle routine override which is now
redundant.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
---
 arch/x86/coco/tdx/tdx.c    | 2 +-
 arch/x86/include/asm/tdx.h | 2 --
 arch/x86/kernel/process.c  | 3 ---
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 54baf93d9218..3578f7f7a502 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -407,7 +407,7 @@ static int handle_halt(struct ve_info *ve)
 	return ve_instr_len(ve);
 }
 
-void __cpuidle tdx_halt(void)
+static void __cpuidle tdx_halt(void)
 {
 	const bool irq_disabled = false;
 
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 393ee2dfaab1..6769d1da4c80 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -58,8 +58,6 @@ void tdx_get_ve_info(struct ve_info *ve);
 
 bool tdx_handle_virt_exception(struct pt_regs *regs, struct ve_info *ve);
 
-void tdx_halt(void);
-
 bool tdx_early_handle_ve(struct pt_regs *regs);
 
 int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport);
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index d11956a178df..9b21989c283b 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -932,9 +932,6 @@ void __init select_idle_routine(void)
 	if (prefer_mwait_c1_over_halt()) {
 		pr_info("using mwait in idle threads\n");
 		static_call_update(x86_idle, mwait_idle);
-	} else if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
-		pr_info("using TDX aware idle routine\n");
-		static_call_update(x86_idle, tdx_halt);
 	} else {
 		static_call_update(x86_idle, default_idle);
 	}
-- 
2.48.1.502.g6dc24dfdaf-goog

