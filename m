Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256E368294
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 00:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773189251; cv=none; b=WQoGYp7ngC+mDjs0jcbl10qQGANuypwW1wG9YTuwsnOq4Yi8O15n1t7+C8v1aAKo6+B03LzWJV/9L6rX/3kUn0MnmKjIEpHd+1WfGdZ4U5PMJOugkBiLGRdE/d0R6VSS3YbOoF9vULaSqX4MTo/FaryjZGTpAKYNx85gLrwKFK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773189251; c=relaxed/simple;
	bh=7Om9PaNSbH3o9snTxwvrRdRO+tJyXxxbS8Gn1LzLrWA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k1WQWr4+GnjD9Of1/vpm22PBdcIufN+RzACuIQWq5E4QUkkKLzs1c4TQ2FQ8DuK4lUJpueLCe+pbDs/FtGkRDCI0UxcVuucHcNq7Q0RzR5T2NjSsVk2JY6EITnXLuhazpJFc1Y+u2J63VIWHBKdXNzoP67i/VIithZwymz0468w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pzz6N5tT; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pzz6N5tT"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82983c9d78aso18812003b3a.2
        for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 17:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773189247; x=1773794047; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=r+juLCyU3+NAIYivhdo5Xlsn2qwlsyffxNBIS7NuIQ8=;
        b=pzz6N5tT1/Px3HEpJmURx8WBKR+Qvr4HvV8j3jkaEsR/pAJoC/toRfX0vMMwLonwcV
         OGCIDXiitsMhIsgWrKH5GuSOTstT5Eg+c3UkGwf3+CiAUu1mWFVejjH84NuCC3gk/Yny
         guQz070Oy/DlemelR+tPMdwRoPtbxCgsR8YcR497aB8pxkeOMDLRUrONCZcqU4WH9ZEA
         3HZOrIYX2yfl31BDhX1/dOPyXk2Zf5ejCwKHcCAmrPtXVgjxrmxdGc47dOSvh5KQ12kk
         vbPszPeV4roqa2A9wt//vPct4yJafMm9acFb6vnQfSZxjJla4O4VO4422nIA+kCMgo5D
         t1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773189247; x=1773794047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+juLCyU3+NAIYivhdo5Xlsn2qwlsyffxNBIS7NuIQ8=;
        b=RAYjZBCNb6ooijw6k4QbvDjBL3eQfdcH97Wx/piHlZZb3jlgfsOrIfIF7RPuF3/JmI
         wgxfyzCJMBEnEzrKRqescOwGzGMVSTcEG4YxM12HuPtFSi230SxuuMXOv9wufPt3tcZ2
         wR6x6zKC5pEsqBEM3T2LpFJFDgPeHG8oblXlcKvTwa9ewCdAtNXrMpJDEgUCRQMHcmeI
         EUmCAyxNXgMeQvUNcoa63h21eQ1V1iEaZKMSzTPxi9X5Dj3Mra9gl0BHwdmKGn2JEtls
         6gUR4bBdbtbLQwgO+kT3TOqjBq+VuuSZQ/QLPweobwAHudOy2IxXv9XDeGsF47525V+O
         8Ciw==
X-Forwarded-Encrypted: i=1; AJvYcCVTbEU/ab2JLh//H5P048WoU/+VRWYE8GmIuizBSplR3d0di4d87Yi2DV31D/5XBRV+xvCsqvnDTgpS@lists.linux.dev
X-Gm-Message-State: AOJu0YxLIeRe21P3bezoNugMeQJ7Iqh27tsghxMEi36M9jU+xG9WF/Ob
	rsXXtua6SUMh4gfue5Kummd6kdo+yTcVDQJ+2OA/SY9uSYPeFn2Wg+SzF7KQg76+0ydGlDN4/Ty
	WtCDiqA==
X-Received: from pfkq5.prod.google.com ([2002:a05:6a00:845:b0:829:72ec:561c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:13a5:b0:824:b1bb:f6b5
 with SMTP id d2e1a72fcca58-829f71bcb9fmr777882b3a.63.1773189246869; Tue, 10
 Mar 2026 17:34:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Mar 2026 17:33:46 -0700
In-Reply-To: <20260311003346.2626238-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260311003346.2626238-8-seanjc@google.com>
Subject: [PATCH 7/7] *** DO NOT MERGE *** KVM: x86: Pretend that APX is
 supported on 64-bit kernels
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index cff9023f12c7..3d9c8cc9d515 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -190,6 +190,27 @@ enum kvm_reg {
 	VCPU_REGS_R13 = __VCPU_REGS_R13,
 	VCPU_REGS_R14 = __VCPU_REGS_R14,
 	VCPU_REGS_R15 = __VCPU_REGS_R15,
+#define CONFIG_X86_APX
+
+#endif
+
+#ifdef CONFIG_X86_APX
+	VCPU_REG_R16 = VCPU_REGS_R15 + 1,
+	VCPU_REG_R17,
+	VCPU_REG_R18,
+	VCPU_REG_R19,
+	VCPU_REG_R20,
+	VCPU_REG_R21,
+	VCPU_REG_R22,
+	VCPU_REG_R23,
+	VCPU_REG_R24,
+	VCPU_REG_R25,
+	VCPU_REG_R26,
+	VCPU_REG_R27,
+	VCPU_REG_R28,
+	VCPU_REG_R29,
+	VCPU_REG_R30,
+	VCPU_REG_R31,
 #endif
 	NR_VCPU_GENERAL_PURPOSE_REGS,
 
-- 
2.53.0.473.g4a7958ca14-goog

