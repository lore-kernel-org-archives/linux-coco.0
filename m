Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1D0186284
	for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 00:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101836; cv=none; b=PbP9vneCcy4WUxOW3W9YiWECoJ3mvTpw3VQ1XGllf83oeORvT6bt9kz4IoYUXA/BaVcopNiUtSx9MIdzCKv83WTgwrl97cIpZixyMnp+RM0x9UsYtGfHTpo6bzks8v+B2CPRgNHzcl2C1513rAum5fyd/cesG5oRc0IZMYuGusk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101836; c=relaxed/simple;
	bh=Zj2gWskcTdeCbRgEtbKYU2726zg6QEH0voYcKcQfhMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pr60uCNjlKsT+Xc7kHGt2+DcDIxHLuYpq/F0B9doECPO5wb+JuE9TSLYl66RXEFfmU06hWhtnV9vYhAfVL/ICdVvzPEoy4/x4CKFEkASggJfXZ29kgc6rR8RmO0bDufhsCXCxYzJEDCOz+xPM6oFpLM3o1LZU3SO6RHCetAaCGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=X0lT1JDr; arc=none smtp.client-ip=209.85.160.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="X0lT1JDr"
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-509046c5c7fso29587721cf.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 17:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101834; x=1773706634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiGZAwROU5TJxpiCLUT0uYKKo5HkD6AnGMRObmR/GVo=;
        b=byhz6rxs2LVAZ8JIZmyh8vWcvv9XccRDPpnMSdl9PPMSq/v+sgu4fZdGeSnqyuC9jj
         wO44TIqFCeeVLMcMTvcngZVXyNs3kefB7+UJ6V8F1VzDTlmj/FEfO6/6Ep5TuD3ZDEss
         xdfv5n7bhb4LDDewuQy1nHT+VeFcegJM7Nmt+VUL48a+VkkYauwyaBW5fKvXUOSYbety
         kBWO/SXAj7+3jOggRc6VouQYvUejkb6aQ/6qZ+VzJTWRig7HCGURO9d9Z1XkyfW6FQcC
         wikQagvlOIE42P1b3ZWEwnMMREw0XIgJ728MEN4+wAsGvbWkR3Mw76f2WBTY4V2MLNCl
         qANQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnnxp651dynxHeSmCC/c9xZiqEWvMZdRqd9LGCUzPBej24L9IEsrg2Nci/HNeNFtRSj3gTdEacRIse@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpe6IFILaKmeF1KVD01RPL1JRtsIKcb2hkjf1g3g9N7TtXAHL5
	XGIbX42lbl7L46+9ahVdG5zniys87ennpRULiGJD9dhtueCJ86QxURiMuAPDkNcEbBnOqax2uKi
	yqOWihYhS4U6Oi7wrV25CdX61+d40FcfYxDyj4ObupGqAL16ThOieIb+a3Iv2rVAFxNzfKbFxfp
	imd07hY6q4bN6zhNT47JyQOz1HwXtZLtpZ3KmqPN+P/rz+2gqsLtqXB04X0ZSqWLMRLpDbobQgy
	z1Ki7/hC7jx9nKo1+ls
X-Gm-Gg: ATEYQzz7OaKAqnTpysyCdj+OnIg7zNgQVll6Pvx25uXnr4Mpt93RVZdyl3Zr46ywAmq
	K40prV99/YyLwpPJI2MXyKDLR8aQX3BdzGvcAqcdJ88NobRJa4DFZ3Dm1Whl35PLHqNs9qTOyDV
	iEZiDoVT13l+n/Mx2mOJmdP+vsuTqYlm2SdtG0BjDRvKaq4I9ePB6ooZ3+ANWvuiqcS7xUc4pa3
	ghGCqK7HWzgJJZVdoAl+XExEIeCbgnMx8KvitVOImwPIL0xoddSBpxyrAtiIaDqKZhVh6OkNXXb
	wWSdYyKSgfCP2MbYzELk4AF6IcR5ACam05z6lI6HdcstjswaCCVMqFLqGn5s5idz7YeeUI7Zh5Z
	HDzy+55VbV7nrMzOhRTNk0+7Lj/hFZigPrgp4xZBYbMsQdD2dIItZNlQQVbJZDCsEMJkyE1Dybf
	X13HTSa6V/re2SZsuc/+D97YjKqMfXZa1WAWMdQRWStz9n4k2I6llI+4HTBaWc6Ys=
X-Received: by 2002:a05:622a:450:b0:505:e4ab:ce4 with SMTP id d75a77b69052e-508f470576emr175071501cf.11.1773101833816;
        Mon, 09 Mar 2026 17:17:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89a57a0fdfesm1461896d6.8.2026.03.09.17.17.13
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2026 17:17:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be21f89332so7716904eec.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 17:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773101832; x=1773706632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiGZAwROU5TJxpiCLUT0uYKKo5HkD6AnGMRObmR/GVo=;
        b=X0lT1JDrUM8m+eCmSBk0rWHILHkOPY4wDumC78mfI15EDYlH08wG9iwhSuNEyEkX64
         qhzqEizShTH1kG3r+MAJ884e0Q94X3r4+y7Zn+2JDyXH4yINx+/gEXwpq42XOySTKhT1
         xqAJZ9cnkbkJdsNXbOUZ4CmuG4CYz7XAhgAvw=
X-Forwarded-Encrypted: i=1; AJvYcCVVpPHUzeSZSWtS0FI6kbRwjCJ7TIdtyP2ul8Z7ndThWPSBS99+zewO1AcsP70V8nK2HzYSA/vrfsyT@lists.linux.dev
X-Received: by 2002:a05:7300:b90b:b0:2ba:9115:2fab with SMTP id 5a478bee46e88-2be4dfef8fdmr4822974eec.12.1773101832196;
        Mon, 09 Mar 2026 17:17:12 -0700 (PDT)
X-Received: by 2002:a05:7300:b90b:b0:2ba:9115:2fab with SMTP id 5a478bee46e88-2be4dfef8fdmr4822962eec.12.1773101831621;
        Mon, 09 Mar 2026 17:17:11 -0700 (PDT)
Received: from amakhalov-build-vm.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948324sm12678991eec.17.2026.03.09.17.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:17:11 -0700 (PDT)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: x86@kernel.org,
	virtualization@lists.linux.dev,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	mingo@redhat.com,
	tglx@linutronix.de
Cc: ajay.kaher@broadcom.com,
	brennan.lamoreaux@broadcom.com,
	bo.gan@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	linux-coco@lists.linux.dev,
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH v2 3/4] x86/vmware: Report guest crash to the hypervisor
Date: Mon,  9 Mar 2026 23:52:49 +0000
Message-ID: <20260309235250.2611115-4-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260309235250.2611115-1-alexey.makhalov@broadcom.com>
References: <20260307004238.1181299-1-alexey.makhalov@broadcom.com>
 <20260309235250.2611115-1-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Register the guest crash reporter to panic_notifier_list,
which will be called at panic time. Guest crash reporter
will report the crash to the hypervisor through
a hypercall.

Co-developed-by: Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>
Signed-off-by: Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h |  1 +
 arch/x86/kernel/cpu/vmware.c  | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index c23164503e54..bf6141353774 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -97,6 +97,7 @@
 #define VMWARE_CMD_GETHZ		45
 #define VMWARE_CMD_GETVCPU_INFO		68
 #define VMWARE_CMD_STEALCLOCK		91
+#define VMWARE_CMD_REPORTGUESTCRASH	102
 /*
  * Hypercall command mask:
  *   bits [6:0] command, range [0, 127]
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 9955f2ea0c84..c631e577348a 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -31,6 +31,7 @@
 #include <linux/static_call.h>
 #include <linux/sched/cputime.h>
 #include <linux/kmsg_dump.h>
+#include <linux/panic_notifier.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
 #include <asm/hypervisor.h>
@@ -451,6 +452,24 @@ static void __init vmware_paravirt_ops_setup(void)
 #define vmware_paravirt_ops_setup() do {} while (0)
 #endif
 
+static int vmware_report_guest_crash(struct notifier_block *self,
+				     unsigned long action, void *data)
+{
+	vmware_hypercall1(VMWARE_CMD_REPORTGUESTCRASH, 0);
+	return 0;
+}
+
+static struct notifier_block guest_crash_reporter = {
+	.notifier_call = vmware_report_guest_crash
+};
+
+static int __init register_guest_crash_reporter(void)
+{
+	atomic_notifier_chain_register(&panic_notifier_list,
+					&guest_crash_reporter);
+
+	return 0;
+}
 /*
  * VMware hypervisor takes care of exporting a reliable TSC to the guest.
  * Still, due to timing difference when running on virtual cpus, the TSC can
@@ -545,6 +564,8 @@ static void __init vmware_platform_setup(void)
 	vmware_set_capabilities();
 
 	kmsg_dump_register(&kmsg_dumper);
+
+	register_guest_crash_reporter();
 }
 
 static u8 __init get_hypercall_mode(void)
-- 
2.43.7

