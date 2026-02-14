Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315B528504D
	for <linux-coco@lists.linux.dev>; Sat, 14 Feb 2026 01:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032429; cv=none; b=dZf4twq51JYunHKG5sWYFavmPUd1ZvuDF0ePL8u/lilPX7WKZrM9SwGRkNxE102xbeivcn4Ts8Vtj47af8VeYXhbJzUkvhJVRmpcfHIQI1FHx3oos0W2VdiT8SzO3/G1JqN5tCYg2NJ7/LzEKnoC9SLku/7H41STST3iiylox2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032429; c=relaxed/simple;
	bh=4EUvtuubXDsq2YIfpcwadRuQgjt5GtaI9Om4D5BZP9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KaY40eAJLFQGXRcV3yvamGE7U3ZFJ9PZbctD+AoN4sMObtgc1huJXeyq4yfUuwIyI7Cl11KER7EKxjwkE33tMjbHxLaJ1Ztj71lAnOQHLc1JX+/X86fxxe8xy+g0zGXnsIvRLzWlUdge+H/eqL2/TXufRAEOCszV+fe1yhmWAjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=shCK8nuX; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="shCK8nuX"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354c44bf176so1407096a91.0
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 17:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771032427; x=1771637227; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=W7MxKQiK0Ayh5SRrSHD6eYo36EclamwmJq0KYQ9dvh4=;
        b=shCK8nuXY8u14eD39ponYN+6YgoERtELY0Qz/QWm+Q5shV1crGUjerqfg4UlM8Jx6i
         a3yPVbnfIJFLABC4E40gWxW2tGCYNCmuoipIX2YK3TCDjvrpOSkE3QdKzUwtQAqttMY3
         Dd5wB2JucCSyNsorjv9fap17UJG6C5NlfsfxLZL3pnGuHKVppjfp2kedoASMXxrAn1G/
         iWKG/HDQNTIHw/8u/UGS5psqs4c08v55ojdDpndkhiswHD/PKASNNs+ATWt2JVAU7A31
         8lm2y4qecn2pGvPRLttZ3w8WCMHF85Ioaz40sKOtCGUa7/rO3Yp3xNd9V371MwoPIJ3Q
         vYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771032427; x=1771637227;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7MxKQiK0Ayh5SRrSHD6eYo36EclamwmJq0KYQ9dvh4=;
        b=nxKaw04dw111lKn7meU2QTcPAgesIY4HEh6kwfkz86WfZoC2+qVGwXQAiH9eBqkgEB
         3Kqw9rHbtlV5aeFCLCBoIBcrPiw6RTDpKmJchu9+gQSAz8Y1tJagWJA9YEjAmtqPE+lM
         uchWwt2HWa7oFUeLtMJ1ZPredY0NUfkBRrDuanIYXjeDF8pqeV5QHD1H26GtT0Xh2ud9
         qypy23O3LWdyOvQ1XyZ8N19NEADIWOvwDd4L28Lqbi1dTX9YYTaI6ybwP9l/hvZBSg38
         IOqGNYm1jwWSXnor9/rgF1z7qgt+1fAdOGgb9lX272h1o1eQcGiPqEYwSmRGACFD0xL8
         bFig==
X-Forwarded-Encrypted: i=1; AJvYcCVI9l2+J/8licC9qTSWFmoOY/c9r2C1XaleKvu+AJmzvD/o4NvMv4qxuU+39IACFYEPeJga5nZAVpeE@lists.linux.dev
X-Gm-Message-State: AOJu0YzQyosC2Ja3MGf6YA9fjpiW5rWvwTa6r+qcDfkyd2MxdA72QqgQ
	LZQIzEj42rqc+tnUuKuto9M80FvkBD7HvINA4ZSLFdWmUB2Eg99BkLUOg0acO4YB52bsZ+L67dr
	OfBaqnQ==
X-Received: from pjbfv20.prod.google.com ([2002:a17:90b:e94:b0:354:a52b:ba9d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c0c:b0:356:2eac:b649
 with SMTP id 98e67ed59e1d1-358448265e8mr1145384a91.7.1771032427400; Fri, 13
 Feb 2026 17:27:07 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 17:26:47 -0800
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260214012702.2368778-2-seanjc@google.com>
Subject: [PATCH v3 01/16] KVM: x86: Move kvm_rebooting to x86
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move kvm_rebooting, which is only read by x86, to KVM x86 so that it can
be moved again to core x86 code.  Add a "shutdown" arch hook to facilate
setting the flag in KVM x86, along with a pile of comments to provide more
context around what KVM x86 is doing and why.

Reviewed-by: Chao Gao <chao.gao@intel.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c       | 22 ++++++++++++++++++++++
 arch/x86/kvm/x86.h       |  1 +
 include/linux/kvm_host.h |  8 +++++++-
 virt/kvm/kvm_main.c      | 14 +++++++-------
 4 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index db3f393192d9..77edc24f8309 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -700,6 +700,9 @@ static void drop_user_return_notifiers(void)
 		kvm_on_user_return(&msrs->urn);
 }
 
+__visible bool kvm_rebooting;
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_rebooting);
+
 /*
  * Handle a fault on a hardware virtualization (VMX or SVM) instruction.
  *
@@ -13178,6 +13181,25 @@ int kvm_arch_enable_virtualization_cpu(void)
 	return 0;
 }
 
+void kvm_arch_shutdown(void)
+{
+	/*
+	 * Set kvm_rebooting to indicate that KVM has asynchronously disabled
+	 * hardware virtualization, i.e. that errors and/or exceptions on SVM
+	 * and VMX instructions are expected and should be ignored.
+	 */
+	kvm_rebooting = true;
+
+	/*
+	 * Ensure kvm_rebooting is visible before IPIs are sent to other CPUs
+	 * to disable virtualization.  Effectively pairs with the reception of
+	 * the IPI (kvm_rebooting is read in task/exception context, but only
+	 * _needs_ to be read as %true after the IPI function callback disables
+	 * virtualization).
+	 */
+	smp_wmb();
+}
+
 void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_x86_call(disable_virtualization_cpu)();
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 94d4f07aaaa0..b314649e5c02 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -54,6 +54,7 @@ struct kvm_host_values {
 	u64 arch_capabilities;
 };
 
+extern bool kvm_rebooting;
 void kvm_spurious_fault(void);
 
 #define SIZE_OF_MEMSLOTS_HASHTABLE \
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2c7d76262898..981b55c0a3a7 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1630,6 +1630,13 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
 #endif
 
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
+/*
+ * kvm_arch_shutdown() is invoked immediately prior to forcefully disabling
+ * hardware virtualization on all CPUs via IPI function calls (in preparation
+ * for shutdown or reboot), e.g. to allow arch code to prepare for disabling
+ * virtualization while KVM may be actively running vCPUs.
+ */
+void kvm_arch_shutdown(void);
 /*
  * kvm_arch_{enable,disable}_virtualization() are called on one CPU, under
  * kvm_usage_lock, immediately after/before 0=>1 and 1=>0 transitions of
@@ -2305,7 +2312,6 @@ static inline bool kvm_check_request(int req, struct kvm_vcpu *vcpu)
 
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
 extern bool enable_virt_at_load;
-extern bool kvm_rebooting;
 #endif
 
 extern unsigned int halt_poll_ns;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 571cf0d6ec01..e081e7244299 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5593,13 +5593,15 @@ bool enable_virt_at_load = true;
 module_param(enable_virt_at_load, bool, 0444);
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_virt_at_load);
 
-__visible bool kvm_rebooting;
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_rebooting);
-
 static DEFINE_PER_CPU(bool, virtualization_enabled);
 static DEFINE_MUTEX(kvm_usage_lock);
 static int kvm_usage_count;
 
+__weak void kvm_arch_shutdown(void)
+{
+
+}
+
 __weak void kvm_arch_enable_virtualization(void)
 {
 
@@ -5653,10 +5655,9 @@ static int kvm_offline_cpu(unsigned int cpu)
 
 static void kvm_shutdown(void *data)
 {
+	kvm_arch_shutdown();
+
 	/*
-	 * Disable hardware virtualization and set kvm_rebooting to indicate
-	 * that KVM has asynchronously disabled hardware virtualization, i.e.
-	 * that relevant errors and exceptions aren't entirely unexpected.
 	 * Some flavors of hardware virtualization need to be disabled before
 	 * transferring control to firmware (to perform shutdown/reboot), e.g.
 	 * on x86, virtualization can block INIT interrupts, which are used by
@@ -5665,7 +5666,6 @@ static void kvm_shutdown(void *data)
 	 * 100% comprehensive.
 	 */
 	pr_info("kvm: exiting hardware virtualization\n");
-	kvm_rebooting = true;
 	on_each_cpu(kvm_disable_virtualization_cpu, NULL, 1);
 }
 
-- 
2.53.0.310.g728cabbaf7-goog

