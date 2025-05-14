Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1CC28850B
	for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248114; cv=none; b=UT73Ua7uuxLbIiyjqnkyOvkpzvSTKL2VfIwm60Zi6PevuCc3+O93uKil63TsUeeaK3gA2i5f7bIGM104WKNJjV90QkP7z8t4a39EIzkJciY/PiWnL+1OyOg7xyZBjpXB2NznEb4jlxahz8t6eQqFqVpVrImNmy6ctfoqUNeb+As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248114; c=relaxed/simple;
	bh=jCrq91a6ZGUBMd0hXPZN1ZpYaiLLg06xn/FVy+YAfkM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uPvODyF41XjJlmXlsImDaFo/WHsCjzQhYNyNla0c2BtLyOJYRqcWZ/i+AEd10Jw9sXzaOYmGxnOYsofba6IXAPjwSMn6dOZgSmQmrp74SOGBHBTKfnZqBLXASyoqqywv4WhvxYC2h2WyqZ00u+08wQxLsJ0wEI5NV/ogRxfCQ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AND5p1Sc; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AND5p1Sc"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22e5cd14e48so960735ad.2
        for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747248112; x=1747852912; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sqs1ABBrK/SoRx/WU68XgIhBrfwY+6u36pWyXJ3N2cA=;
        b=AND5p1ScKDrhhzH9Ly5nRvnG0xd2GKvoiagh95W8Pto0mlKAxdB8RVr7pQSR+pCkZY
         tJ3vn/XixmkMOEHG3b6p4ld1fQCm3P1JGzeWNSzQzG+NmPuKCGFM3lljakxdxCKXXX1j
         Ia4wSTezZUQAGNnn8WoZhs1Xcp0sV+/GS4/R638aZRr4/qbsR1P9Fu9SGzrx1oMcm/tY
         ZYSty0/UcCqoYEfvtLFyLci8ilAo1YowXxFz5P/Y20kcFCuQav6a83b3OiWmwz++7SwW
         MU8pLQzAAy8KX+B3sONje/B0ZYgSmmA3FuNUWJdrF8pHzYeMhJhC87q07Uiy7D52+WXu
         cQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248112; x=1747852912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqs1ABBrK/SoRx/WU68XgIhBrfwY+6u36pWyXJ3N2cA=;
        b=fSpE45tU7nxHJPupcNhgQu5W/mYQx1wL9j1QzygiheYV6zy0iY64U5oGLWxAZqerx1
         Qpwo/aQIT7Ai/hvMiQwUgkMevFDB1zAVu4KJDJl4KKzNe1tbsS0wU3vO9wKzHStmTMZ1
         l07xhkjZxMJVgJpjc4syqKG9G3Kkfskdvc5zRJs52c8NRgHnSTqcO4wLpy9JJ85X0SoJ
         9+emG6Mo3ZWbbhjG6RZDDGToT+huZyKDWueIajThHdztbbVYCDuKyUnlSb0K6AGNgHtb
         8VGMixxsD3XG9c45sh6i6EdsnPMIIcowdd2NzCO2PtLPEFzKZPbkHvXi/45cIoDqHU82
         JZOw==
X-Forwarded-Encrypted: i=1; AJvYcCVnDg7sCxBIW8tppU+J7n4SqPLy6HEa3aGsQZyWvXR0Njf4kqATLlSJefl5E3TcDONFNPgK2slet7ZK@lists.linux.dev
X-Gm-Message-State: AOJu0YwkmuczmftjC69HSVzlBpF228F9YdiTZw4Kvdheu4u2ZjFQUhRo
	Hl5sBT/yCZ3ExrZecDDH90FRml8wj4OZRjs+rvYkjrV1hZ4r7+Yu8IpU9MRg2J7QfIDJfn4vChl
	ncF2rW5xNxY3o22+PsDW97A==
X-Google-Smtp-Source: AGHT+IEj0u063ItqXbBprVsscCCcufQDFXSgBslg6Ix6TcQKSTjaE0XjkqMYzsqDG1lkKArewjPTBhxYTeTzIsGYgg==
X-Received: from plnr13.prod.google.com ([2002:a17:903:190d:b0:227:967c:4f38])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ea0a:b0:220:e338:8d2 with SMTP id d9443c01a7336-231980fba76mr69818855ad.21.1747248112013;
 Wed, 14 May 2025 11:41:52 -0700 (PDT)
Date: Wed, 14 May 2025 18:41:34 +0000
In-Reply-To: <20250514184136.238446-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250514184136.238446-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250514184136.238446-2-dionnaglaze@google.com>
Subject: [PATCH v4 1/2] kvm: sev: Add SEV-SNP guest request throttling
From: Dionna Glaze <dionnaglaze@google.com>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

The AMD-SP is a precious resource that doesn't have a scheduler other
than a mutex lock queue. To avoid customers from causing a DoS, a
mem_enc_ioctl command for rate limiting guest requests is added.

Recommended values are {.interval_ms = 1000, .burst = 1} or
{.interval_ms = 2000, .burst = 2} to average 1 request every second.
You may need to allow 2 requests back to back to allow for the guest
to query the certificate length in an extended guest request without
a pause. The 1 second average is our target for quality of service
since empirical tests show that 64 VMs can concurrently request an
attestation report with a maximum latency of 1 second. We don't
anticipate more concurrency than that for a seldom used request for
a majority well-behaved set of VMs. The majority point is decided as
>64 VMs given the assumed 128 VM count for "extreme load".

Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: Peter Gonda <pgonda@google.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Sean Christopherson <seanjc@google.com>

Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 .../virt/kvm/x86/amd-memory-encryption.rst    | 23 ++++++++++++++
 arch/x86/include/uapi/asm/kvm.h               |  7 +++++
 arch/x86/kvm/svm/sev.c                        | 31 +++++++++++++++++++
 arch/x86/kvm/svm/svm.h                        |  2 ++
 4 files changed, 63 insertions(+)

diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
index 1ddb6a86ce7f..1b5b4fc35aac 100644
--- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
+++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
@@ -572,6 +572,29 @@ Returns: 0 on success, -negative on error
 See SNP_LAUNCH_FINISH in the SEV-SNP specification [snp-fw-abi]_ for further
 details on the input parameters in ``struct kvm_sev_snp_launch_finish``.
 
+21. KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE
+-----------------------------------------
+
+The KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE command is used to set a per-VM rate
+limit on responding to requests for AMD-SP to process a guest request.
+The AMD-SP is a global resource with limited capacity, so to avoid noisy
+neighbor effects, the host may set a request rate for guests.
+
+Parameters (in): struct kvm_sev_snp_set_request_throttle_rate
+
+Returns: 0 on success, -negative on error
+
+::
+
+	struct kvm_sev_snp_set_request_throttle_rate {
+		__u32 interval_ms;
+		__u32 burst;
+	};
+
+The interval will be translated into jiffies, so if it after transformation
+the interval is 0, the command will return ``-EINVAL``. The ``burst`` value
+must be greater than 0.
+
 Device attribute API
 ====================
 
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 460306b35a4b..d92242d9b9af 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -708,6 +708,8 @@ enum sev_cmd_id {
 	KVM_SEV_SNP_LAUNCH_UPDATE,
 	KVM_SEV_SNP_LAUNCH_FINISH,
 
+	KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE,
+
 	KVM_SEV_NR_MAX,
 };
 
@@ -877,6 +879,11 @@ struct kvm_sev_snp_launch_finish {
 	__u64 pad1[4];
 };
 
+struct kvm_sev_snp_set_request_throttle_rate {
+	__u32 interval_ms;
+	__u32 burst;
+};
+
 #define KVM_X2APIC_API_USE_32BIT_IDS            (1ULL << 0)
 #define KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK  (1ULL << 1)
 
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a7a7dc507336..febf4b45fddf 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2535,6 +2535,29 @@ static int snp_launch_finish(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	return ret;
 }
 
+static int snp_set_request_throttle_ms(struct kvm *kvm, struct kvm_sev_cmd *argp)
+{
+	struct kvm_sev_info *sev = to_kvm_sev_info(kvm);
+	struct kvm_sev_snp_set_request_throttle_rate params;
+	int ret;
+	u64 jiffies;
+
+	if (!sev_snp_guest(kvm))
+		return -ENOTTY;
+
+	if (copy_from_user(&params, u64_to_user_ptr(argp->data), sizeof(params)))
+		return -EFAULT;
+
+	jiffies = (params.interval_ms * HZ) / 1000;
+
+	if (!jiffies || !params.burst)
+		return -EINVAL;
+
+	ratelimit_state_init(&sev->snp_guest_msg_rs, jiffies, params.burst);
+
+	return 0;
+}
+
 int sev_mem_enc_ioctl(struct kvm *kvm, void __user *argp)
 {
 	struct kvm_sev_cmd sev_cmd;
@@ -2640,6 +2663,9 @@ int sev_mem_enc_ioctl(struct kvm *kvm, void __user *argp)
 	case KVM_SEV_SNP_LAUNCH_FINISH:
 		r = snp_launch_finish(kvm, &sev_cmd);
 		break;
+	case KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE_MS:
+		r = snp_set_request_throttle_ms(kvm, &sev_cmd);
+		break;
 	default:
 		r = -EINVAL;
 		goto out;
@@ -4015,6 +4041,11 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
 
 	mutex_lock(&sev->guest_req_mutex);
 
+	if (!__ratelimit(&sev->snp_guest_msg_rs)) {
+		rc = SNP_GUEST_VMM_ERR_BUSY;
+		goto out_unlock;
+	}
+
 	if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE)) {
 		ret = -EIO;
 		goto out_unlock;
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index f16b068c4228..0a7c8d3a7560 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -112,6 +112,8 @@ struct kvm_sev_info {
 	void *guest_req_buf;    /* Bounce buffer for SNP Guest Request input */
 	void *guest_resp_buf;   /* Bounce buffer for SNP Guest Request output */
 	struct mutex guest_req_mutex; /* Must acquire before using bounce buffers */
+
+	struct ratelimit_state snp_guest_msg_rs; /* Limit guest requests */
 };
 
 struct kvm_svm {
-- 
2.49.0.1045.g170613ef41-goog

