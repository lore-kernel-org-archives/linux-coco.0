Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692460;
	b=x0Ullj7w8odCTI/3517G03J/QzL7IBgcYZyguLyv/YzvS5WdY9XFUfrCI9dlmZt4XMQ7
	 GzyGj0ymDDWwK5pRaAkkllnsIp/kJE78GcBm2+riQ/SNeRvw0/DiidY8KYekN4ctKnlKR
	 LfWnM8B3INEAxJLWTxm75gDKQtTCiu1lTO9C33LziK+hZNFnXwYK8XKbXta1bDb3k94Ue
	 40z8f+N86ET7n+hkz0I5gorZbONEk33feUJgPMYpQHsI27ym4MmdtCQaWGPydwhmHCBvp
	 dp/qz6OkmEd8COaQuQVE3sL4mhDRLII/FVF+m6ykpfEvZUoF4YO99OcXs+UB1NZ3Y9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692460;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=SSKe6YFblVjuOlewl86JzUttzs9TwvUcFTxoEjaaYZQ=;
	b=pmdOgGuUfrb2APU96z+wOgnDCh1+94WpJ7/t7du9Fma6r13YGYcFUGMxDYSmU06wlF3D
	 5zPQ/3fexHTNFfasOtqiQ08yc9Z+4E4Su/sV/JcoS4JQZSfuXmAn6jpSb/Qvl1VxCgwP1
	 J/FfVhhcNPHIMfWx2RFmGap83Bk3W+BVEk2RGSuQgF/xFda5fGn1IQtACKu9HVd1OZ6I0
	 qKmGtLYDNkKVGqg3XsGSkxnVAZ8LZPDj6lCI4lqI0PeSZMOzlIrxkn3/9zHiqb2jBr6lY
	 l5Y85KtPfu7IVfpAK6ITFVbDt82WT39TF6NL81V6MPeLy2YCLjZuSqAo24bYqYOxm/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GILHWIvt;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F97A606A324
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 07:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F97A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GILHWIvt
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1873102a91.2
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793692459; x=1794297259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SSKe6YFblVjuOlewl86JzUttzs9TwvUcFTxoEjaaYZQ=;
        b=kkJy3S847i6X9QwnXBSs4corL26sa9DP47ZoeF75LZsaEfkBNSIceHMH5MJesO5Zde
         kZJuYgg4wCEQy1ABsLFCz4EfgBpoh2GrIyUbiWBPVLlZeoMETeGrhLM7MqGz2nmkq6A4
         IgczEWzVWCNk8tOlLHHnXSDYRZ6GKXEi7RUrs4aWaYS9LgHKAAMpFzYY/0GmGXPXWtMb
         4LKTyBmCAQW1jqNro3RaeyB2umMqjTft7hUAadf4VK+OiTpZ1UrgvFiN4z8sXIV24WAB
         M+kyJSdYvxJE1Xl2LGbPwTudSMx3DvTuZjV+6dQJmCgA6i6DbDXRD8OAbmCitBBrk/+R
         aP8w==
X-Forwarded-Encrypted: i=1; AKwUvBxcrGyx+QouPhvs4lhw+a/iFzFrWJRpC0y1Ucci548uOu9Zr0A+1lK8aOYXHQzOX+VGMBbk2Y+llWJV@lists.linux.dev
X-Gm-Message-State: APuU4Z9fHwy1HtldC63Bmkm+NyoDr1qfqpmBscWJW8kG4/JZgHEPcliX
	xRnQ1ArXoR9OCJ7692ULVPlQPUd0ku6zzf9fF9AmsMRY+/CC56QH7jKrta8rUGaNjgUcDI8vviy
	Klm4qRXrTWAEOiNPK0PK0PRAewPREXQ7EwIvf3VVYLpicKxBNdCj5wu5Rjw8w793dmCvFp6LMaJ
	X1KmQMQ3U6WvS0ula+nk+w2IeBGCHicQGH7NTGvGcGBTwp0Mn8Wy7YxrOL5hguHP45aoU3wL0dl
	OLNypouHj9BvA==
X-Gm-Gg: AYBFou3Xvvt3NWWcHYXW9il+UqMjb8S0hr6B9zlQp+nJGCk/fQ5BQCNslqAUfPdLO6g
	5I+FiCU+Unwl7QDJJZs4S0RqUYPGnoPXqrQp4fwWgaQuRnnw851ns33B1Wi4f3kj5rkh5kdvnSs
	84txxfHojfXoyXUb6Z6qjBp8ihZjN9fRDqevJabV5bJAIdzZEKo63//2Hn0BypmI/KiKDnKfyGT
	xJ6pwoxwXOBrjBr4VizYi26gYzoQcVxw5eG0QD0lEClYg206x3niqCGYlSlMPn+QJck/Lhc7U5j
	+Bxu9l2nZqOJnA7j7HpsUL1n2ZEnnYY+B1rE+eeFiMR6lG8mOvPB9VnL87X9vYZFLrp++jifmdZ
	Qsi5ZkfEMP5/RXObIJEKm2lST4djQXdLZMF4W5wGupuq5Xok7N8heZKkyBHm3N9FQxlB5RAmOrZ
	wrNxfq/YQlMBWGYYr2kSNacsm7Jx6phEtk
X-Received: by 2002:a17:90b:33ce:b0:3ac:ffb8:1809 with SMTP id 98e67ed59e1d1-3ae897e230bmr9445208a91.39.1793692459196;
        Mon, 02 Nov 2026 23:54:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c8297absm1350474a91.4.2026.11.02.23.54.18
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:54:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso4682294eec.0
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793692457; x=1794297257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSKe6YFblVjuOlewl86JzUttzs9TwvUcFTxoEjaaYZQ=;
        b=GILHWIvt4QJN0VkjG7F/fTGywguYsQi1PMYiTE/bNrBbcfy4eJMm0yMvdGRyR40GsC
         XU0xJNX/P/WqtF0mqQQCZQvQkGZChiQMzXSg5fGWnEUZDZNLJrJqzgZsCBe/Orae1PSQ
         +IOcjkMEylD+NbFFntEoWCU13nblY2zL8rF3k=
X-Forwarded-Encrypted: i=1; AKwUvBxlMDP+U6tOBmszLMtV7MdbY/v7botD7jXaDy4XMXgB4CcpmZr1g0RIFn+bNWZsERA28medyOOsRWmd@lists.linux.dev
X-Received: by 2002:a05:693c:41d4:10b0:35c:99e1:c755 with SMTP id 5a478bee46e88-36a4242c0e1mr18340263eec.38.1793692457477;
        Mon, 02 Nov 2026 23:54:17 -0800 (PST)
X-Received: by 2002:a05:693c:41d4:10b0:35c:99e1:c755 with SMTP id 5a478bee46e88-36a4242c0e1mr18340217eec.38.1793692456621;
        Mon, 02 Nov 2026 23:54:16 -0800 (PST)
Received: from vertex.localdomain ([192.19.218.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm50287635eec.11.2026.11.02.23.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:54:15 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex James <alex.james@broadcom.com>,
	Michael Kelley <mhkelley58@gmail.com>,
	linux-coco@lists.linux.dev,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/vmware: Map vTPM as private in encrypted VMs
Date: Tue,  3 Nov 2026 02:54:08 -0500
Message-ID: <e0e5389688fe4102b639c42295305e08f306a092.1793692366.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Alex James <alex.james@broadcom.com>

Encrypted VMware guests can use a virtual Trusted Platform Module
(vTPM) implemented by a paravisor, trusted code running alongside Linux
inside the protected VM. Its register page needs a private mapping so
accesses reach the paravisor instead of host device emulation.

The default ioremap() path maps device registers as shared. Without a
VMware private-MMIO override, this also applies to the vTPM registers,
preventing the guest from communicating with the paravisor's TPM.

Install is_private_mmio() for the vTPM's single register page when guest
memory encryption is active and firmware supplies a TPM event log. This
lets ioremap() select a private mapping for the device. Hyper-V already
does the same for its paravisor vTPM in hv_is_private_mmio(), added by
commit 812b0597fb40 ("x86/hyperv: Change vTOM handling to use standard
coco mechanisms").

[ zack: Moved the include and explained the private-mapping requirement ]

Signed-off-by: Alex James <alex.james@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 34b73573b108..afb40036ff49 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -26,6 +26,7 @@
 #include <linux/export.h>
 #include <linux/clocksource.h>
 #include <linux/cpu.h>
+#include <linux/tpm_ptp.h>
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/static_call.h>
@@ -374,6 +375,17 @@ static void __init vmware_paravirt_ops_setup(void)
 #define vmware_paravirt_ops_setup() do {} while (0)
 #endif
 
+/*
+ * VMware hypervisors use a paravisor to provide a secure vTPM device to
+ * encrypted VMs. The vTPM MMIO region must be mapped as private to ensure
+ * that it is handled by the paravisor.
+ */
+static bool vmware_is_private_mmio(u64 addr)
+{
+	return addr >= TIS_MEM_X86_LPC_BASE &&
+	       addr < TIS_MEM_X86_LPC_BASE + PAGE_SIZE;
+}
+
 /*
  * VMware hypervisor takes care of exporting a reliable TSC to the guest.
  * Still, due to timing difference when running on virtual cpus, the TSC can
@@ -442,6 +454,12 @@ static void __init vmware_platform_setup(void)
 #endif
 
 	vmware_set_capabilities();
+
+	if (IS_ENABLED(CONFIG_X86_MEM_ENCRYPT) &&
+	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
+	    efi.tpm_log != EFI_INVALID_TABLE_ADDR) {
+		x86_platform.hyper.is_private_mmio = vmware_is_private_mmio;
+	}
 }
 
 static u8 __init vmware_select_hypercall(void)

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
