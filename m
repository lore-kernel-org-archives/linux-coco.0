Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB54FB9A7
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057440; cv=none; b=TXRKsL4IKlKCYhEi+UVmlo7gbctBGzay5US0BAM6pXyXU07uYYRopLOexSKyqfXldUVc7I1uX/zgDSYV9bq+yOsrbX8pYUM/19hv31lj48NuzUQgkmbQ+CVvqm5kJcEvAFcUcxi/2YBG5jODGgzSfhvxeFWRX6PzQfg+5GazOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057440; c=relaxed/simple;
	bh=vLBwpA/W09CA4nuBN8wyhZ23eWcSQH6kAchso1GU80E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pICupHP3D8UAaY5ecAC0WpcKLkzY2m4nRcoLYx2yvb9OScmF3DaVt5Ts64u3SCb4YCVXHHT6K0aXIqApgcNBPJBSQP5u3SDLIhfUF0LIXH4LXIljk4XqAXZJ0eDwYSWdpFD41x8ny1ZKKSsJC4pFstOwOZnEXHgsQC5xwKpPy2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=we3WNWx5; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="we3WNWx5"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a9a19c8bdbso911563a12.1
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057436; x=1789662236; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8SjnCZzsDgkEIH+7JYFlN1mRbLf5pSXtHbHm73zeYY=;
        b=we3WNWx5/kVqvO2VPey1a+7o4CaRjPhEm212wpSOOa+Y3Hhn5FtxG1WjzflNi5TeIS
         WPKTjbouFpj+ngXadZCcD9MjDK/gmY3QwE4TQvNOnZmF1qpmJhARVpsvVa8uhs7Yyml6
         DILr+ze+gjW4SNukzQ0dst9OhG3phIvlySsePFe6q73AN/kM6jvaER1eXHOygYZ2A/Ye
         r23QktIDMA6MkHGMQG6FSVP2lH/pGRVMJvBxANQ1f2dKu/vrsyO9Kz/fSWTt7Joremnz
         xu+qXkSo7Uw5F7gOkomN3bhPlSN6Jf+goPp0+W01d8fezdanTYRorrxKENbj8NE1qQKQ
         dmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057436; x=1789662236;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8SjnCZzsDgkEIH+7JYFlN1mRbLf5pSXtHbHm73zeYY=;
        b=WrH1ziZrTpLMRzbKilLtXBPn73IBxF8al+zLovHW0LuRNf64qcPtj1rP+FuuFqOAxj
         DfRgUbfcZPdlJ3qPXHoxpYdELGc3At5zggW4znNCZkeMrejlxZbAKpcjmIZo6ubDWWmk
         hNBGMf6WwwIPUkX/Kn82aC0CPQZmC5hE8M4S0quMH5IRiN5jHgReGNnGCgjIYHHOxO1w
         0TUQXbLGxa2IeMGgc77Zn89RkWiiIip5gsts/+fZpmDJyna7Y2ottyUD4QKRWaE9ydhy
         R5kj0DnwtIwq0o5x4oWv3CZhmT1O58aBCBu4+XyPrsaZvfj13vyoQtdVoOL9pX53TuAC
         5mYA==
X-Forwarded-Encrypted: i=1; AKwUvBwe4rrv58lRoDzKQYWK226tru+3OsZIoT8/RutwDveVs2t8+7B1l97BbwW7wIx5WlB+VKPztSUt+R0I@lists.linux.dev
X-Gm-Message-State: AFuF++ngsBu7b9JmX+gJNyIY5NYZQUbMQHYtDYW0cZW3sACN2GET+M91
	EcuOztB7Nu3oyj0t4NvyHzKg/og4337AKyCS58B8HI9cz0PJGff4OUI6e5mT76lV66UmjRRUVfv
	TKA==
X-Received: from edqr4.prod.google.com ([2002:aa7:d584:0:b0:6a9:853c:f2bd])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:c28e:b0:6a6:75b7:4ff6
 with SMTP id 4fb4d7f45d1cf-6a9a3136f44mr1906127a12.8.1789057435775; Thu, 10
 Sep 2026 09:23:55 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:21:34 +0000
In-Reply-To: <20260910162343.4092060-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910162343.4092060-2-elver@google.com>
Subject: [PATCH RFC 01/10] KVM: x86/pmu: Acquire SRCU in pmc_is_event_allowed()
 to protect filter lookup
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dereferencing kvm->arch.pmu_event_filter via srcu_dereference() requires
holding kvm->srcu to guard against concurrent filter replacement and
freeing by kvm_vm_ioctl_set_pmu_event_filter().

Counter reprogramming can reach pmc_is_event_allowed() without holding
kvm->srcu. Specifically, on AMD SVM, toggling EFER.SVME via KVM_SET_SREGS
or KVM_SET_SREGS2 triggers synchronous counter reprogramming outside of
any SRCU read-side critical section:

  kvm_vcpu_ioctl(KVM_SET_SREGS{,2})
    kvm_vcpu_ioctl_x86_set_sregs{,2}()
      __set_sregs_common()
        kvm_x86_call(set_efer)()
          svm_set_efer()
            svm_pmu_handle_nested_transition()
              __svm_pmu_handle_nested_transition(..., defer=false)
                __kvm_pmu_reprogram_counters()
                  kvm_pmu_handle_event()
                    reprogram_counter()
                      pmc_is_event_allowed()
                        srcu_dereference(kvm->arch.pmu_event_filter, &kvm->srcu)

If userspace concurrently updates the filter (KVM_SET_PMU_EVENT_FILTER),
a concurrent free and subsequent use-after-free is possible.

Protect filter lookups directly in pmc_is_event_allowed():
1. check rcu_access_pointer() first for the common fast path;
2. acquire guard(srcu)(&kvm->srcu) only when a filter is present;
3. drop redundant outer srcu_read_lock() in kvm_pmu_trigger_event().

Found with Clang context analysis.

Fixes: a02a25a65246 ("KVM: x86/pmu: Reprogram Host/Guest-Only counters on nested transitions")
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/x86/kvm/pmu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index a7d60c8785cd..3ad1e696edca 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -536,6 +536,11 @@ static bool pmc_is_event_allowed(struct kvm_pmc *pmc)
 	struct kvm_x86_pmu_event_filter *filter;
 	struct kvm *kvm = pmc->vcpu->kvm;
 
+	if (!rcu_access_pointer(kvm->arch.pmu_event_filter))
+		return true;
+
+	guard(srcu)(&kvm->srcu);
+
 	filter = srcu_dereference(kvm->arch.pmu_event_filter, &kvm->srcu);
 	if (!filter)
 		return true;
@@ -1132,7 +1137,7 @@ static void kvm_pmu_trigger_event(struct kvm_vcpu *vcpu,
 	DECLARE_BITMAP(bitmap, X86_PMC_IDX_MAX);
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 	struct kvm_pmc *pmc;
-	int i, idx;
+	int i;
 
 	BUILD_BUG_ON(sizeof(pmu->global_ctrl) * BITS_PER_BYTE != X86_PMC_IDX_MAX);
 
@@ -1145,14 +1150,12 @@ static void kvm_pmu_trigger_event(struct kvm_vcpu *vcpu,
 			     (unsigned long *)&pmu->global_ctrl, X86_PMC_IDX_MAX))
 		return;
 
-	idx = srcu_read_lock(&vcpu->kvm->srcu);
 	kvm_for_each_pmc(pmu, pmc, i, bitmap) {
 		if (!pmc_is_event_allowed(pmc) || !cpl_is_matched(pmc))
 			continue;
 
 		kvm_pmu_incr_counter(pmc);
 	}
-	srcu_read_unlock(&vcpu->kvm->srcu, idx);
 }
 
 void kvm_pmu_instruction_retired(struct kvm_vcpu *vcpu)
-- 
2.55.0.1003.g10538fe699-goog

