Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A3C48BD39
	for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 16:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723900; cv=none; b=PtBoBUWpA1WdfUcbN3OketXcaCoLNGArwhbSIPqQH4p/mdilzdPxnT5l26eDpluxKbS6oGTe7dUtT69yLM2BMUi+7Et/2jA39R8ZzBJCgHjt0GaROYQ2XIrnQ3PVAMxhvHfu6YwrNw7k6nuwmytQUj1fQpnwTJeAguXB+uTRoC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723900; c=relaxed/simple;
	bh=jVDZ6RnPX9na/oXpRc2RUSVKCpg/b4zH+emyqfa+r6Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VJTjuAml55P6xZ4llmbIbfWumk+bC5Cy3V3j7s2TmgeuqYV9DvGsjeL+ohRyWnOoeMowhXnMmY/NfvEjoa6BA3Xm54DBOGf7NbXHkWn9NeVfNrKM6LVbx7/BvB2K1pUMRV0SV4vObkDzl2HqDlfd3Bm/SSR3eZOmEWufUAssQYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wag8JI8q; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wag8JI8q"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so15800175ad.3
        for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786723894; x=1787328694; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=npuY0OiAv0Qcgrb1+8fGuXoJuldQQTrhGouNj7zkH78=;
        b=Wag8JI8qpJCzuRHYY9fQx68zqeRoauGDKJV8/bhELoZjUmDuKDiTP32lwoY4IBB5DR
         QR1DVS+7NmmapU2du9JrtrGrY/2g1jMPa5pTHx5hM1TigDVLtLJI1oXS7Rz0cinbqJVJ
         rfEEHVcF5HcKpgMk1GADJ7JCIfIm+/kNKZ/3i7/rLGSaLlqC07PQHmt1u5Vg9Bwkw1rt
         WZnTNQ9sNaw7e7LUM96RfZc4fbSTSLnDYf2DBLBz/LEQZFOkBzIYNEGYjUCWvi55jBn9
         zqKXtQL4JYCAQ6Vqc8auxytTCpv3eR7JX3kZh5yWZXJDUz20RNr0NZKLhNQ5sACvANqO
         rHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786723894; x=1787328694;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=npuY0OiAv0Qcgrb1+8fGuXoJuldQQTrhGouNj7zkH78=;
        b=EfKolaiDnWi5Ei/lYH1MemBEVi8ycTsRgUJEchZWQ2UWrS2WTjgqQfgQSfG79Xs2H4
         Snxu1XYdRa9iHcn06iSrPcaIBbKDh33FB41PuBsDe7gM0N5EMjK7v8s5PSpGGZRVGq1L
         OgK+g6Ua/gX4LmlyRt98yCqk5zuTu0fd31cqykxmYi9imj7C2QAcIv1Z7DFQTfphRwlt
         0k3isljqTS2CunBciYjN4kSye5IvnteKukvu9+JY1iz0qX86vDzFePhJHhfFvv7Ts7q7
         /+AKTOgBn9yCbEfxLuxHXXyin19AZzVdnhdfuE+AvVf9qDt6aJcD3cWgd/aKMrNvhVST
         t2GA==
X-Forwarded-Encrypted: i=1; AHgh+RomN/tGsoYXbtIt3Lzsajw+vo4W/N8DGzKQE5QN//yt0aosBd13qr9zd0BcilAx9qvhvVT5zfDnRF95@lists.linux.dev
X-Gm-Message-State: AOJu0Yzik0wuYtYOKLUjmYDVdC2M7GYrAS7KFZmUxPgM9Fnjod+Rq1Pm
	iLxCGUssJOpb9nF0yfzqYKkTslWR4CnmJ3BEd/tr7p1dqLQXlBFqGN+rHTJ0Qb+aRdXZDE05/kU
	7jPYZ+g==
X-Received: from plou15.prod.google.com ([2002:a17:903:1aef:b0:2d1:1cee:1618])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce86:b0:2c8:f34c:82c0
 with SMTP id d9443c01a7336-2d3b0aeeb6cmr71992085ad.2.1786723893656; Fri, 14
 Aug 2026 09:11:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 14 Aug 2026 09:11:28 -0700
In-Reply-To: <20260814161129.2177118-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814161129.2177118-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260814161129.2177118-3-seanjc@google.com>
Subject: [PATCH 2/3] KVM: VMX: Disallowing using to_vmx() in common VT code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Poison to_vmx() in main.c and posted_intr.c so that attempting to interpret
the vCPU as a VMX vCPU will fail at compile time, as opposed to failing at
runtime, or worse corrupting state without outright failing.

Note, to_tdx() is buried in tdx.c, i.e. isn't broadly reachable, and so
doesn't need the same treatment as to_vmx().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/main.c        | 2 ++
 arch/x86/kvm/vmx/posted_intr.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index aa5b44bb212b..95d89d809c19 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -11,6 +11,8 @@
 #include "tdx.h"
 #include "tdx_arch.h"
 
+#pragma GCC poison to_vmx
+
 #ifdef CONFIG_KVM_INTEL_TDX
 static_assert(offsetof(struct vcpu_vmx, vt) == offsetof(struct vcpu_tdx, vt));
 
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 4a6d9a17da23..24221ba553be 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -14,6 +14,8 @@
 #include "vmx.h"
 #include "tdx.h"
 
+#pragma GCC poison to_vmx
+
 /*
  * Maintain a per-CPU list of vCPUs that need to be awakened by wakeup_handler()
  * when a WAKEUP_VECTOR interrupted is posted.  vCPUs are added to the list when
-- 
2.55.0.691.gc56d675ccc-goog

