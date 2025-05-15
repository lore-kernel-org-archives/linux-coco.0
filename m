Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CFE289823
	for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 22:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346659; cv=none; b=cLttYlE1OlNqCKEf8HNLzFSZpYY0ydV6KuxV+adbQtuE2h4TVSPn0KZ3mm836YVgWlxlK/mOjwVqP6bBaSV2SeGux4p9p3PiMopxwPor6YBPmgoq/SyLzIojMs3ioJitG2OeZeH/NjrS+pO7NFpL/HmqNywwA+WXddUdH1R7wQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346659; c=relaxed/simple;
	bh=6eVULcLPVdzazGE/wg9Pf+TgKc9aOyrX0eUUEgwYzJU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mxkHK525CP5L1ZIwpvShYfmz0QZSW8OvTEAVoeSziBKl9VJqALS7vkoBY0WqKCwF7AkTmYOSP+EBF8NlEhhx1Df2MZRfin1kq2POgD8uUyJr3EAHAAjRpOMwLEqPN2XnQqGUW5+LBn0Re1Vf5UnjneiCKZ+7QZLF/f4Z83KyA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yCdZIUXx; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yCdZIUXx"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22eb21a2788so19705355ad.2
        for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 15:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747346657; x=1747951457; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/61l/GG8ceY1HQ/1Mbz9W8+Z6NMWlwdTU/z1QWzDW24=;
        b=yCdZIUXxY9TRd3KQuwmwqXQlW58eUUveE6jSfmonFiVZDvKwj3IIQAWNwixb5U2gOT
         cjpwO4S/6PLu1XWebJ+ngoeeW191Lxbu9XJ5HQK940ES+n83eS2Qg3XmeSVDly8noVrU
         fo4KnoM7OiErivHNMJ5N3zgUA2vFXYVTChMMqmibc6IHWKcIWXeeglnmgJtjnLST7n1L
         /zhgXYvASAHCD0Hsrt0EW4M3UFnBeTfDGIEaozWSA25iyacj2K0Y8icZeBrkTn1eHR0f
         3YMAKpt9Hoi3x8oI7JILTavMieQhhgT5xjgSg9bIyej6AOkWibBBAL2Z6RKOzPTN5aBs
         vNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346657; x=1747951457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/61l/GG8ceY1HQ/1Mbz9W8+Z6NMWlwdTU/z1QWzDW24=;
        b=Vygzkub4XwMgQP5Zrhjy3Y+mI2m177HCP4MA/HJguwPxiSDVwQFLh9htdpV7yqDUUz
         4K2d+0KoLdCL08oAuA7ksC2PsKCPr7wi9nglNVBgPcDO+7OasNKe+SiTmK0J4jweOqks
         bT5weXgOl3CifWVnlmvkAMAUeV9t+pTPtkT846nbAnc5t2B2/kM79fxuDJZMP6Fb9NVL
         VyWtGiNZlvoWBzjLFesTD0i+nNKgGcl8ElvMXO+Nz0qK4m6MqcWMbAiGrqrzqi/0tO8A
         i4emFhpa2O26bjDIoUQv0F6B6M+q67xVXYC8JME6HI2ICucAiITWetpHs/wtZKV5Uloa
         CQBg==
X-Forwarded-Encrypted: i=1; AJvYcCWbRaW6iYIZ8TFGDAqZ+cu4jLgs6pd8ZwwsV9KKxMqst6JBII5Z/D6IXS+tKbP0d/Ybk/LBfBzOpDao@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvj6+ra14RYa7HhJt0Na23mfqkh+NDIMwLqDfiRG/1WZsRkglu
	AGq6Ev8+s464JRcTimCTQ0ayv94zlrHb+VNrllDXmSuWAApP+1GwxWa6nI+uaiHJKtrBF/8/bxS
	f4H4GqOLPfgKTpqGXHhDTB2lFPQ==
X-Google-Smtp-Source: AGHT+IEIogqWVI3jhvBuBHzH/RVC4nU9qls/xo8WHotmwx8ma/XGj5KxgExpQP3h4WgyLHLR1u3cujYZAXUA4Janbg==
X-Received: from plge2.prod.google.com ([2002:a17:902:cf42:b0:226:453a:f2db])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:19c4:b0:220:e655:d77 with SMTP id d9443c01a7336-231d452d0e3mr12729205ad.36.1747346657095;
 Thu, 15 May 2025 15:04:17 -0700 (PDT)
Date: Thu, 15 May 2025 22:03:59 +0000
In-Reply-To: <20250515220400.1096945-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250515220400.1096945-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250515220400.1096945-2-dionnaglaze@google.com>
Subject: [PATCH v5 1/2] kvm: sev: Add SEV-SNP guest request throttling
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
 .../virt/kvm/x86/amd-memory-encryption.rst    | 23 +++++++++++++
 arch/x86/include/uapi/asm/kvm.h               |  7 ++++
 arch/x86/kvm/svm/sev.c                        | 33 +++++++++++++++++++
 arch/x86/kvm/svm/svm.h                        |  3 ++
 4 files changed, 66 insertions(+)

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
index a7a7dc507336..35b04a10ed73 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -12,12 +12,14 @@
 #include <linux/kvm_host.h>
 #include <linux/kernel.h>
 #include <linux/highmem.h>
+#include <linux/limits.h>
 #include <linux/psp.h>
 #include <linux/psp-sev.h>
 #include <linux/pagemap.h>
 #include <linux/swap.h>
 #include <linux/misc_cgroup.h>
 #include <linux/processor.h>
+#include <linux/ratelimit.h>
 #include <linux/trace_events.h>
 #include <uapi/linux/sev-guest.h>
 
@@ -2535,6 +2537,28 @@ static int snp_launch_finish(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	return ret;
 }
 
+static int snp_set_request_throttle_ms(struct kvm *kvm, struct kvm_sev_cmd *argp)
+{
+	struct kvm_sev_info *sev = to_kvm_sev_info(kvm);
+	struct kvm_sev_snp_set_request_throttle_rate params;
+	u64 jiffies;
+
+	if (!sev_snp_guest(kvm))
+		return -ENOTTY;
+
+	if (copy_from_user(&params, u64_to_user_ptr(argp->data), sizeof(params)))
+		return -EFAULT;
+
+	jiffies = ((u64)params.interval_ms * HZ) / 1000;
+
+	if (!jiffies || !params.burst || params.burst > S32_MAX || jiffies > S32_MAX)
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
@@ -2640,6 +2664,9 @@ int sev_mem_enc_ioctl(struct kvm *kvm, void __user *argp)
 	case KVM_SEV_SNP_LAUNCH_FINISH:
 		r = snp_launch_finish(kvm, &sev_cmd);
 		break;
+	case KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE_MS:
+		r = snp_set_request_throttle_ms(kvm, &sev_cmd);
+		break;
 	default:
 		r = -EINVAL;
 		goto out;
@@ -4015,6 +4042,12 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
 
 	mutex_lock(&sev->guest_req_mutex);
 
+	if (!__ratelimit(&sev->snp_guest_msg_rs)) {
+		svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, 0));
+		ret = 1;
+		goto out_unlock;
+	}
+
 	if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE)) {
 		ret = -EIO;
 		goto out_unlock;
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index f16b068c4228..2643c940d054 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -18,6 +18,7 @@
 #include <linux/kvm_types.h>
 #include <linux/kvm_host.h>
 #include <linux/bits.h>
+#include <linux/ratelimit.h>
 
 #include <asm/svm.h>
 #include <asm/sev-common.h>
@@ -112,6 +113,8 @@ struct kvm_sev_info {
 	void *guest_req_buf;    /* Bounce buffer for SNP Guest Request input */
 	void *guest_resp_buf;   /* Bounce buffer for SNP Guest Request output */
 	struct mutex guest_req_mutex; /* Must acquire before using bounce buffers */
+
+	struct ratelimit_state snp_guest_msg_rs; /* Limit guest requests */
 };
 
 struct kvm_svm {
-- 
2.49.0.1101.gccaa498523-goog

