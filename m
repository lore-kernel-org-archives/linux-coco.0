Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBD62DEA6B
	for <linux-coco@lists.linux.dev>; Thu, 16 Oct 2025 22:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760653700; cv=none; b=pTnhUZoL3dte8O2RY3yW02YT3HJAtSCZTuOFDZtUN/EN4YtGfw9kSfEz7Fuy5uE9pGs/Up3HcMGhxiG5BK1hfXQeFIARHGMCgrxMXBpdO3eKIca8MzRm0VC5b/nsajjou9UWAXeGDeZPgTcagRg99hXQTN9Bqx537uQiodW2cwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760653700; c=relaxed/simple;
	bh=bawSMseT0CqNbdyIWWkFAuACxkZoXEqOQliCkUUeOWE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rEojR1BRZ1X4Q5HUSPgZl6n4V0O9JxdNM+LUUvkTs9te298zLM3PSDhZBr5CG8k0nQs5SxjRffRpfsifJZOAXjt/Yh80ST8v8w9HY8nXH4oYMh4SqZv2jDa7aqtCMtq5/DouhVvljq9Q10glok2IOcbbfw8AZwksMu0TfCqQY2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EOHnXzec; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EOHnXzec"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33428befc08so2942831a91.2
        for <linux-coco@lists.linux.dev>; Thu, 16 Oct 2025 15:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760653699; x=1761258499; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohe5whqaVI6MNw62Ja9bMHiL/FYf6oWYICNGFV1EN3Y=;
        b=EOHnXzeczQAFexQh57mYWk1kH6GkcLMdHmpVQzoflHn3nVm9OGsJE4D5r/RusunLbX
         wnJXu7b56oRRgmUqAm1y1qENrtblmuHK8yTbMEwSlbw/CO4Y0FVX94BWgeZ0uquMcrKJ
         FKqnUJcYuf199T7Hf1EtaRL+O5rO7peO7HsHq5qI0YXDF+1c9VFO2XX9CPBC50VjyD1b
         dNtTR1a+8w2aLjE1R48xUUEWmpTrV+9Tw4NaXikWm7otK7jt/TkHBSYuHkq5uxPLjgtR
         S3brjtKKVz4bEIyHwlOw3CqGTPL5dPokQ6GiM4LrNSZTmktaK/poAgadjeK0MTy0j8cr
         Y6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760653699; x=1761258499;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ohe5whqaVI6MNw62Ja9bMHiL/FYf6oWYICNGFV1EN3Y=;
        b=HKq/YcmRwfvRNnJGroD5Jb836GbKzAwTD8T4t59jU+vYB2oFChwSdRl7IoqgUZ3Utq
         pfh0nN+hneLNSJlBUzBr+Cf1hMeFXgHKiuuaehtxFJgWr1mVP18XNkkIxhIFCpEuJpLi
         9Prm/aidlis0ZmIYrSFEkpEdsdJEhGY3Di0YQpdgVjt0NC9YrsCvGAojkHAj5CxPcJDL
         AmDOfW5E2k9FkZb2BZQZYJ5mFmLi0uMrfvAOPN1KTv05pjxwqBJyqDYTPh1bXOW1W+B7
         RkdsQRbb3IHrtLaRCCtlUhjFHqFKg/gMnDa50rGJTHvQviQaWegGV9DV4Ik+8o/X+rH9
         M1TA==
X-Forwarded-Encrypted: i=1; AJvYcCXzAx4J1BNwpGfMiFXuaL+DRe+jGEck0JTiI9PYwz4rn59/zuz7yJCeWpYavZ6Qlq+Xk0r0uwk27Jx/@lists.linux.dev
X-Gm-Message-State: AOJu0YzOUvm6jivbc06AxyKYCStIIWJqwhy2psEFV71f5v/XnaHJoRnX
	W8E4ir2ZZGYptBZ7fhMiWdQj1Lk6T61hSWfYMxNea8jMEWO/zoOWjlDGtNwae9oplL9lGRstzwH
	A41DJAw==
X-Google-Smtp-Source: AGHT+IHEsNMvTZlam2jisTHrsVJg/i/9Fu9TLaM2OcVaUKqK6KMKAv8tlmP6fh1nAXeNkUWB5CqnY8FjWds=
X-Received: from pjsc4.prod.google.com ([2002:a17:90a:bf04:b0:33b:9fa3:a535])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244b:b0:334:7bce:8391
 with SMTP id adf61e73a8af0-334a86500d6mr1818085637.56.1760653698581; Thu, 16
 Oct 2025 15:28:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 15:28:12 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016222816.141523-1-seanjc@google.com>
Subject: [PATCH v4 0/4] KVM: x86: User-return MSR cleanups
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="UTF-8"

This is a combo of Hou's series to clean up the "IRQs disabled" mess(es), and
my one-off patch to drop "cache" from a few names that escalated.  I tagged it
v4 since Hou's last posting was v3, and this is much closer to Hou's series
than anything else.

v4:
 - Tweak changelog regarding the "cache" rename to try and better capture
   the details of how .curr is used. [Yan]
 - Synchronize the cache immediately after TD-Exit to minimize the window
   where the cache is stale (even with the reboot change, it's still nice to
   minimize the window). [Yan]
 - Leave the user-return notifier registered on reboot/shutdown so that the
   common code doesn't have to be paranoid about being interrupted.

v3: https://lore.kernel.org/all/15fa59ba7f6f849082fb36735e784071539d5ad2.1758002303.git.houwenlong.hwl@antgroup.com

v1 (cache): https://lore.kernel.org/all/20250919214259.1584273-1-seanjc@google.com

Hou Wenlong (1):
  KVM: x86: Don't disable IRQs when unregistering user-return notifier

Sean Christopherson (3):
  KVM: TDX: Synchronize user-return MSRs immediately after VP.ENTER
  KVM: x86: Leave user-return notifier registered on reboot/shutdown
  KVM: x86: Drop "cache" from user return MSR setter that skips WRMSR

 arch/x86/include/asm/kvm_host.h |  4 +--
 arch/x86/kvm/vmx/tdx.c          | 28 ++++++++++-------
 arch/x86/kvm/vmx/tdx.h          |  2 +-
 arch/x86/kvm/x86.c              | 56 +++++++++++++++++++--------------
 4 files changed, 53 insertions(+), 37 deletions(-)


base-commit: f222788458c8a7753d43befef2769cd282dc008e
-- 
2.51.0.858.gf9c4a03a3a-goog

