Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4309852ED36
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057455; cv=none; b=YZFC1vcTsqiD1VCN8+fR8lsUCVu50uidRp4rG6v0thcxFgpRUsvScP4KryAJ3qsvlJW9w6aliwIn4sDc5cIFcJ9ZUksbikekt40YC6c6dMX1sb7asRNdu4dwfqOtotKAazHKXwhaMkUfH8Izc5pN0fjr2gPEI7VOh+m1DX7nyBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057455; c=relaxed/simple;
	bh=pxrnsvzW8MKgeFG0MarEtyI0HnlG7oA7pNmC3DpRc9U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XNM/3f8YWGoCSUAZe6B8sEO5DmEN/oaxw1ooS41HLSOfKhbJWZv7P7z1iuVRW7gFjjFbVZhAgvk/Gc1iXN/FhOSvWnToPriG6/yblJrKmT/GlSI+YP6KJmuIEDtgnk0uOiWvC9D9WL2EZ6G8+Hee8d8s/LUl8j1Z4bohmjKAfeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YUw8kB/C; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YUw8kB/C"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49ccfad90f1so137345e9.0
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057449; x=1789662249; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHI1zbWWi1BOEuhxInEo9eXwbPIfP+RyCmucdS/YFCg=;
        b=YUw8kB/CRyuz4LbVLgaoEQQHn6q8ft45qSqMM1IYuHzo0vc9tWdoUd0nM7qrZE69wY
         vGiWamKtmWBcxBTWnm9iC1Qu3EC2Rc3yx2/9j/m2Q66L3UKjyUQ3R1Sv72AIzCtGQQo3
         sgVF6CRxl2d76KJx/UdTZvX9AKanZ+fWsN+Cvnn64a5iJa4jf9l4J8PfwazolT0/USNg
         P2dWGuaJa0HXFtpvhG3WKWIk11p6Ldlwprpw2Rl8OStF+nLY3S47y4JJMYp+jFLA1wA5
         OVecoAa410yV6vgnFc0T0q4v576gH+zMxFOlcFhYCQznLbQx3rY+YD6AR+qdkfFtESiM
         CDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057449; x=1789662249;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHI1zbWWi1BOEuhxInEo9eXwbPIfP+RyCmucdS/YFCg=;
        b=jTwZxAxPZ31qrAC511H/bZN4qlDDAId9GsB+vAiId360VgNBDlKeqeUYP/hTKEGzpD
         t5QEey8aXyi0NOimdJXPp+cD3gcEeJq/ELHzXBMh1iK74eY9nBXs3bB2jrSuNpNvHORX
         K1p/T6/u5ZOmJBWnjargrXpi7CN5dCTQtlUt7MOkb/nzSpSdP/Hwc26dtCGMXd6krICQ
         M/Yse0wbFGqamo0lg9cfrm363UZrcKSgr+stiGxu6OJjLHYXOz3afqJ5lHNw4y4WNGI4
         tWEXpxl4xcvN98e2s5WYG7c8gO0KXYETk+dWnGRskIwgDSrNWBt2jVjz8hl+oiA5pvJP
         cg9g==
X-Forwarded-Encrypted: i=1; AKwUvBwnwFp4GEJk5ypnGYX4EvaegHseiro+LZJPUTanyF5rGO9AjW3QgGu6q+KoJynbKK1kJ3cyAuDObDdY@lists.linux.dev
X-Gm-Message-State: AFuF++nQE9PNrMJC0SBo+uG/9ufWFzSQdSNJvmB8Gsr9xp85VAIM8rYu
	5PgzoMTXQUZbOuVWPXyBGzxTmXChlPdXJhZ+2v8nCex+KpLltZWdnMbiA57fThuKYOX246jb4C2
	1QQ==
X-Received: from wmhj22.prod.google.com ([2002:a05:600c:3016:b0:49d:1474:3527])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c29:b0:49c:fc6c:be03
 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr410272355e9.26.1789057448808; Thu, 10
 Sep 2026 09:24:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:21:43 +0000
In-Reply-To: <20260910162343.4092060-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910162343.4092060-11-elver@google.com>
Subject: [PATCH RFC 10/10] KVM: x86: Enable CONTEXT_ANALYSIS with opt-outs
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Enable Clang context analysis (-Wthread-safety) for x86 KVM.

Because virt/kvm/ objects are built directly into the x86 KVM module,
this also enables checking for common KVM sources.

Temporarily opt out sources that require more invasive annotations:
mmu/mmu.c, mmu/tdp_mmu.c, i8259.c, and xen.c.

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
---
 arch/x86/kvm/Makefile                    | 8 ++++++++
 scripts/context-analysis-suppression.txt | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 0474604ab8a1..a93b54b00ae2 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -1,5 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS := y
+
+# Opt out x86 objects pending context annotations:
+CONTEXT_ANALYSIS_mmu/mmu.o             := n
+CONTEXT_ANALYSIS_mmu/tdp_mmu.o         := n
+CONTEXT_ANALYSIS_i8259.o               := n
+CONTEXT_ANALYSIS_xen.o                 := n
+
 ccflags-y += -I $(srctree)/arch/x86/kvm
 ccflags-$(CONFIG_KVM_WERROR) += -Werror
 
diff --git a/scripts/context-analysis-suppression.txt b/scripts/context-analysis-suppression.txt
index 1c51b6153f08..666c4ca54708 100644
--- a/scripts/context-analysis-suppression.txt
+++ b/scripts/context-analysis-suppression.txt
@@ -17,6 +17,7 @@ src:*include/net/*
 src:*include/linux/bit_spinlock.h=emit
 src:*include/linux/cleanup.h=emit
 src:*include/linux/kref.h=emit
+src:*include/linux/kvm_host.h=emit
 src:*include/linux/list*.h=emit
 src:*include/linux/local_lock*.h=emit
 src:*include/linux/lockdep.h=emit
-- 
2.55.0.1003.g10538fe699-goog

