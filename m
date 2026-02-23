Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693B03793BB
	for <linux-coco@lists.linux.dev>; Mon, 23 Feb 2026 21:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883031; cv=none; b=fRxAQzNvihgC2lz+gsS+vk6X+Z1LkwQcOw96qgZ/yMzL7MbhzwvfWXcLAQ34BySgQPGlM2nZOeQ0so2jHDkjkPZOpzi8yNG29eIut9jOgsaiOK0HB/aaqo0dyaAfsyj+NdUTfGPyqd0MVsmjorDRoDUpbPrm/DABBN0fUPYvyfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883031; c=relaxed/simple;
	bh=kxeW6DG1v1HKEQ+pz2m5v66qJI6E72ZH+f+bezuzOfc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rFogLW+kBdm0QYkmFlHSBC3givOJkjH6HImpc0mRFeS8BQwDwwASBuncTzzdnKo3eySR3eAe30O6sljrNcZYSqnobjslF8CSnQAwhMy2C3mfqBy8rO5oWPkdmGOF5EFR0ChaybiH7iVciRm0ix+o+BqOAQjpSlllEs0bx79F100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JRAKI1V8; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JRAKI1V8"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12737f276a2so8041309c88.1
        for <linux-coco@lists.linux.dev>; Mon, 23 Feb 2026 13:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771883029; x=1772487829; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pQoX++6jRv8xueXbzG+0cc+xPst310WvznBVds3LE6o=;
        b=JRAKI1V8Fweppg2wMFIEILuj4wLq4gwuNiVL15A3pkp/egocgATwiE45IOqnnVYvlr
         mF0zj2IZISBUAVHNcQkd7Uk6MtDuaWsTGelNt2uxkqjmrtIkSK3ReFNp/TJEzzrOghxj
         gN3QcTJKOAI0ZRHzmVtG0tlC5RWkpKbtxgb4PnY8xy5p2989TXJJRAUc2wWcrBteXNkb
         CCnFFMUoV9FyjM9fUBRUHxeCv9mQ2V1P0r/CKwmhi6+ur0ic0ROqf1lHZuq3aVlj5W81
         ONH0SpyY5GSXP82n7pOYIhyLAhATxf+pltLK+yxtHZZeQ+uMT/eQdQ5X/rOV8Qd9aPve
         POXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771883029; x=1772487829;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pQoX++6jRv8xueXbzG+0cc+xPst310WvznBVds3LE6o=;
        b=sF7cft6hIGDFbA0uWdTkT/0McwQO+X4ONawEdjzl9b1IaNI+WB8ItpozSKoautveR1
         KqW2Spelvfvo26s015Ox7sRHOVZeTnrRPoTKxw2uT829Q8guRGJerM4zX5iySVtR9uiW
         cXpShMVXCMrsEuN168uQJ7eHl98E4UYrCbEULJu0Lm5NZppxQcmH8BwRzh4PmytS3y3F
         zz0SE/ZvFzAEYM3U8ftaCsblKOa3f/cv1uKeSa/47W5lW3x8cH4bqqEflSkkfeuzjjfM
         y+sfkUpSatODG63Ni54bS1MJDdlPh6FtqsXfN25Uw9JCeDeRKHoW8lYl0YWvqyaY8yT6
         0/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNkohSbAGzErJXj5Y9CiB76KU4tUDc77KquhRJqR1ef1ojTm4AETBkjwhd2RhwcFQtTg9PQVE0szwh@lists.linux.dev
X-Gm-Message-State: AOJu0YzIeSSU355RGV8P/f4vbLTx8MaBYnDC9/FCiMV4Q4fnpQa1OVUU
	TCUb4x4WGU4ZAg3Pn4f1+rUVUkAuIn0669NOFzGHx8NBo19ImNd9IRXsS1yJn9ZwWz2KGRc1VGx
	TetzkIc8KEJmEdgfg34Kuew==
X-Received: from dlbur22-n1.prod.google.com ([2002:a05:7022:ea56:10b0:121:7afb:490])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4593:b0:11d:c22e:a131 with SMTP id a92af1059eb24-1276acda401mr4301273c88.3.1771883028380;
 Mon, 23 Feb 2026 13:43:48 -0800 (PST)
Date: Mon, 23 Feb 2026 13:43:36 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260223214336.722463-1-changyuanl@google.com>
Subject: [PATCH] KVM: TDX: Set SIGNIFCANT_INDEX flag for supported CPUIDs
From: Changyuan Lyu <changyuanl@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

Set the KVM_CPUID_FLAG_SIGNIFCANT_INDEX flag in the kvm_cpuid_entry2
structures returned by KVM_TDX_CAPABILITIES if the CPUID is indexed.
This ensures consistency with the CPUID entries returned by
KVM_GET_SUPPORTED_CPUID.

Additionally, add a WARN_ON_ONCE() to verify that the TDX module's
reported entries align with KVM's expectations regarding indexed
CPUID functions.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2d7a4d52ccfb4..0c524f9a94a6c 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -172,9 +172,15 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
 	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
 	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
 
-	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
+	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF) {
 		entry->index = 0;
+		entry->flags &= ~KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+	} else {
+		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+	}
 
+	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
+		     !!(entry->flags & KVM_CPUID_FLAG_SIGNIFCANT_INDEX));
 	/*
 	 * The TDX module doesn't allow configuring the guest phys addr bits
 	 * (EAX[23:16]).  However, KVM uses it as an interface to the userspace
-- 
2.53.0.371.g1d285c8824-goog

