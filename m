Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005061A9FB0
	for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 00:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101837; cv=none; b=No87Jpvft6xrCCHzq3HpVMhbJf9Eyvowjflqk7o7xl5g6IZshOziLWcepWC4K2RzlJd6SweXG4bstficKFWNERZAXzu9g979Ulu/UA9fyRuBe4PA/rBpAoJ95Me6YeY4cdFO9fNl/I55Rv8fS2WzPSLds6piYvW9z3A69a8g45U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101837; c=relaxed/simple;
	bh=rKD0SlqWqw8PldbinZpjfbtws753oTvboPLwBks61Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POpJCtAzeL1IWDQ1+q7BoPJDxePuRZaWt7xT94WN/wUA57sP4u9NH/PWU00HwTYRgP16mUXYIWe2cozoUxdYUFHHgFDphyCth7Jc58lbjxqTKATdodoF4QN1O/50LNysPypvUW78CC4hE+W98aa/6xxKutZDFBRqAHlktSnVUqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=csBr5+lH; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="csBr5+lH"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-899eabc5292so89650866d6.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 17:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101835; x=1773706635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zolKHaPCOFbG+Mda3dOxeNhtXRim55Oc2EZIL0u4Uc=;
        b=vEhaFv2nWFDizVbXDHQ0NZyMN7Ya/ljHbX7nTf6Sx52+H7TIkfpkMX7IQuTZUJ1g9R
         5S0cXpUbkPMNo+lzYffOnoO2vNuRmFRDjHZC7n/85+f/Z18slqP96Fzo3OLTI90vrkvP
         saQyGkMRvsSKIJVRtbGn/X5oDCQREZGf449QTTt2Wx8HlRkLQtJzf4FDq4o4sEoV55rh
         rU6mPDP2QLkalWIZi8WZmJggzKVOhmEQ3+P+fXf2shazRrQximPXC9khCmXG92WEwnVP
         5Kc71f2/Duq2Ttb6OrlLElhlJy27qNso9nPlbchCPdDT18MU7ySiHtfOj4T/gEtAeJqG
         HolA==
X-Forwarded-Encrypted: i=1; AJvYcCWySN6/0FIXfyWxVO4GKgV9zV/Z33W9yO1V3jFm8hfoUqkBpd2NUfgQ3nrPqOzPwRgVa2fhAE7NJO5e@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1gxTxvA0JLFaB9AuDW/lyn6iHLOpyRj/IhpuQzu2kY2qFDQu3
	H3MyGPu4DDlGiOCtOlTW6QB/dtEmcSJpH1Oe4VJ80gWJDFIyJqS6z/ca7ovtjmVzEVfQpta0+Ay
	Y5kHBILecZjPtEsEAuVpg304IzlJWdJ/oHE4dVLZGRMN+aFfJ8asmrXpE5elygbdGvzzqIRMxDS
	r4Z3WO2iF5klqaS5BGjnbh971pqv6/Q8k+T92BQuqqUWyE96P5wIs7BsfLIyJfoCKOkYU5cy972
	rhHHCdoDyp0f0wfQW/J
X-Gm-Gg: ATEYQzzj6hWKhy69xZdhhcDMuY3qgbAkdaucJCsVyFZcA8ZrcsRe+eQ1ELC5yjRH3Wo
	dlPesxnjrD1YBUyR8RUvRzeVyjBjrIWNrz9yqLg2XPNA/bNnEU3NsPIhGqLdyLExdnxbsmTA3uH
	LbcmzoUlEAWYrZQSavSR33xBT8xguvV1VOMDxq6y9/VTK6OfQD6F5YEgwkPtmFwoIVpnjbxXpFT
	m/joIdqMpel8nnuwPPwlDN3h5Pfn31EXDcUnnJO4G3g3R6UoIxDcnmF+ZOjl/KEwn3tU/QSfi8x
	8k2GFNvjf+tidzAnGAz8loIhwaZyIgwmJQaQ9TzfHAHOx0aqXgwfE63nqINo82FUvdNj+H0Lim8
	7HrSUmhdfQczbQue/ld/dirPsYcVYua2Q9er5s7zGUggZ5qEatm9h+FiTRLByY0H5c3uxzedgDu
	7FWhG2i5UQhi3IaTZ+jV0F8pHP4cWE0jSqfuK7s6aCqpWvhLrgfkDYK4IN84RZ
X-Received: by 2002:a05:6214:ac2:b0:899:a91a:2e08 with SMTP id 6a1803df08f44-89a30afef9emr195774686d6.52.1773101834773;
        Mon, 09 Mar 2026 17:17:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89a57be2d1bsm1405086d6.29.2026.03.09.17.17.14
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2026 17:17:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2be191ce356so9256483eec.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 17:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773101833; x=1773706633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zolKHaPCOFbG+Mda3dOxeNhtXRim55Oc2EZIL0u4Uc=;
        b=csBr5+lHCklauAt8EnU4EF49hxUHfCYrQP3V3jhJJqmk748GS0O4bFkmbrBTsRJZs+
         Xor69yxT9hAFqLLFJCHzTZDy7uCjAdOvoZo5H8h6x1lPFis3N8GghefKvCOmQDwZxP+d
         sE7Xi3Dzt1vOos+yHzjmXrol+HEwthsBWnEU0=
X-Forwarded-Encrypted: i=1; AJvYcCVJ1QCsLsJzTU8mfYBhgQTQkeX+MsI4TKlKj/HsvBV8b08/V2oqBTJpDqyw2KaKQHp4+b9I+9hwbkQT@lists.linux.dev
X-Received: by 2002:a05:7300:80cb:b0:2bd:cbc7:16e2 with SMTP id 5a478bee46e88-2be4deaee17mr5421666eec.13.1773101833419;
        Mon, 09 Mar 2026 17:17:13 -0700 (PDT)
X-Received: by 2002:a05:7300:80cb:b0:2bd:cbc7:16e2 with SMTP id 5a478bee46e88-2be4deaee17mr5421644eec.13.1773101832785;
        Mon, 09 Mar 2026 17:17:12 -0700 (PDT)
Received: from amakhalov-build-vm.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948324sm12678991eec.17.2026.03.09.17.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:17:12 -0700 (PDT)
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
Subject: [PATCH v2 4/4] x86/vmware: Support steal time clock for encrypted guests
Date: Mon,  9 Mar 2026 23:52:50 +0000
Message-ID: <20260309235250.2611115-5-alexey.makhalov@broadcom.com>
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

Shared memory containing steal time counter should be set to
decrypted when guest memory is encrypted.

Co-developed-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index c631e577348a..523a9b99847d 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -32,6 +32,7 @@
 #include <linux/sched/cputime.h>
 #include <linux/kmsg_dump.h>
 #include <linux/panic_notifier.h>
+#include <linux/set_memory.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
 #include <asm/hypervisor.h>
@@ -39,6 +40,7 @@
 #include <asm/apic.h>
 #include <asm/vmware.h>
 #include <asm/svm.h>
+#include <asm/coco.h>
 
 #undef pr_fmt
 #define pr_fmt(fmt)	"vmware: " fmt
@@ -379,9 +381,47 @@ static struct notifier_block vmware_pv_reboot_nb = {
 	.notifier_call = vmware_pv_reboot_notify,
 };
 
+/*
+ * Map per-CPU variables for all possible CPUs as decrypted.
+ * Do this early in boot, before sharing the corresponding
+ * guest physical addresses with the hypervisor.
+ */
+static void __init set_shared_memory_decrypted(void)
+{
+	int cpu;
+
+	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
+		return;
+
+	for_each_possible_cpu(cpu) {
+		unsigned long size = sizeof(vmw_steal_time);
+		unsigned long addr = (unsigned long)&per_cpu(vmw_steal_time,
+							cpu);
+
+		/*
+		 * There is no generic high-level API to mark memory as
+		 * decrypted. Intel's set_memory_decrypted() depends on the
+		 * buddy allocator and can fail early in boot if a page split
+		 * is required and allocation is not possible. Use AMD's
+		 * early_set_memory_decrypted() instead, which can perform
+		 * the split during early boot.
+		 */
+		early_set_memory_decrypted(addr, size);
+
+		/* That's it for AMD */
+		if (cc_vendor == CC_VENDOR_AMD)
+			continue;
+
+		set_memory_decrypted(addr & PAGE_MASK, 1UL <<
+				     get_order((addr & ~PAGE_MASK) + size));
+
+	}
+}
+
 #ifdef CONFIG_SMP
 static void __init vmware_smp_prepare_boot_cpu(void)
 {
+	set_shared_memory_decrypted();
 	vmware_guest_cpu_init();
 	native_smp_prepare_boot_cpu();
 }
@@ -444,6 +484,7 @@ static void __init vmware_paravirt_ops_setup(void)
 					      vmware_cpu_down_prepare) < 0)
 			pr_err("vmware_guest: Failed to install cpu hotplug callbacks\n");
 #else
+		set_shared_memory_decrypted();
 		vmware_guest_cpu_init();
 #endif
 	}
-- 
2.43.7

