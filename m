Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362372C08AB
	for <linux-coco@lists.linux.dev>; Sat,  7 Mar 2026 01:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845616; cv=none; b=l9SQzZdMfJpzoV7uOOfDb2okQra6pIeHa+Gb9GePnB7b6+/WVKwYWqUz0jWCNZ1I6KmGOMEjPupLAfG1RaLOcuwvPSauxhybc4ZU9T5PmmQit/x5FL7hrRCCP5DOZPGUpg3+LzECoQhuK/YW+nNWl2NSXD4HRb5qG5qs5l5boVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845616; c=relaxed/simple;
	bh=rYYGRODllNK9eX0TUjsapgqgpHgysFWK4Kr8HBelE/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmrMpKSFA0LylNiPk5FVGpwIde0EcnZGhQRcqv804IuuALM7NIPLktKQUl1fwMcxhlSr1LvYxj6Zim41asolOabPd5yiEUhLePBEoUor/ya9RwLFn0N3GnmNrFq6iVHMNR+QWOAOhiDlH+qspYS7hNrycIL8t3xBD2cIqOb8JKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NWODL9NZ; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NWODL9NZ"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-7987531082aso98330617b3.3
        for <linux-coco@lists.linux.dev>; Fri, 06 Mar 2026 17:06:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772845613; x=1773450413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVGUdA4dy5MsWjDIDv+6CpBj4bGfDTWltsIW6DUSLms=;
        b=EITA/oW5w9Gu4zL4ju9w7cWJNWgwJn51VjKgjZZjAZlPTLWtLx65+so69exQcd3EsM
         c2PLUxCMW6gxcUzWXtuJiKsDNgDKAyDsqTVh3TJRC6kf/WPh4QrSDpa/x00b8Y9WUgqH
         0h62FhrMQZ689Pw/KO0XEX0QaeTElSx4hYWO4etXs0i5pDnsFt4WL6UVGrp3oNFwfDse
         gGS1V+sbjLBa3HmcKmfLaIHGzmjtAQAzUTHhqlL6P6kWIPR5HYt1JAo81xC8x0vWs8/d
         SsPS6yfMq6Ivp9p8D2Pjnb92mE5J/qPJSljhgtkduK5w+DMB2H0Uclt1Y8LxBVLfRC1I
         J5zA==
X-Forwarded-Encrypted: i=1; AJvYcCUp8DSJUlrW4bKDYDyUK7T3M38FjuZyZFoGNAWO40oD8YmgR5dMOvcgrwaTFT2TmlxMni8h03GxyGI/@lists.linux.dev
X-Gm-Message-State: AOJu0YykmpevVq1svGVPZwLrMa8MSc7WoWynNO4C/FKBAvlHQdgSPi8n
	Ro8FdiS6XHb7Y7z2jdId2oVpgXU0Yq4FaE+zAvjJ6/EpX6AVSHp32S2NRfj+KvYgSpgSvICKT/z
	d7M1UR06W8bVOnbr9U8GVtxs5ad6l+KRTzehLMUnyQiSTzz4cujvMEK8Q5DuaBr1Isqm8rbjW6N
	tMdevtV105Z1QiBb8i1zrWOMmQF8cTyvqcogVIeWfSJ2a11UxwpghOeDEbB8vtvKoz74BN59m2V
	5b+snQ+92wxfzNL8vFo
X-Gm-Gg: ATEYQzwYnucPfRVUZL65wNcrNme/wGnX3oiA7uxdtSAmUYtxqmAr6gdBsmdk09E/8Fo
	74oLFxOMROOxcQ039WQ53GC9wRnhiSy8LzTfcXp23jtPw3NTHQV7h/LUMRrttucN8P7bVeZ1Qcz
	HDrm4bmRMTHAly55hooaP9H4pOxu6Wbrk0pGa/fpHEAdmI0sMpAZJPwsNoWzFAlph4480frfzx0
	b6oUI13Kym6eipaFPwVAlZ7TomdDEYKbBl0a055gZ8dkf0Z0v8Ng7oUz9MPXJG5GBLSRQ46LLdU
	LKA2r786obgdjGIYuQBJz8oKCHz8E4ZC1QJ8yolRKofQlNOMBbU/ROg7lDmPQOiIkRsfLlphP6T
	OXczIJSUCRS76R/971A9hgcV3bSGVSOW+ItRYgSpF5M95bQ4wuhGoFMkj2/Ty3vohyI7R7uvttm
	u94mrrzV9+XZSx2yJwYrnHHTl1wUqTXGXMpSV1rtM0vSeDd9K1WDtdv8OR0sF5
X-Received: by 2002:a05:690c:61c2:b0:797:d1c3:fa8 with SMTP id 00721157ae682-798dd7c45cfmr36711197b3.66.1772845613180;
        Fri, 06 Mar 2026 17:06:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-798de542e42sm3105087b3.0.2026.03.06.17.06.52
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2026 17:06:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be232ef3d3so9348517eec.1
        for <linux-coco@lists.linux.dev>; Fri, 06 Mar 2026 17:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772845611; x=1773450411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVGUdA4dy5MsWjDIDv+6CpBj4bGfDTWltsIW6DUSLms=;
        b=NWODL9NZKYmWEIuLMQej3muqV3oBqcPnVkLCHbSn12Ru/+egay1buOnNfSYKH6krjV
         msZm9hoJmUkjRTdGSpVO/w99TVA+dPMClSoBfhwNitZ4uO+y/IiewafAeGzoQvVJF1Rb
         06VnjwJHUmrBS+UAT8U3rfHUKRhLUiHJR315w=
X-Forwarded-Encrypted: i=1; AJvYcCVB4dkvaTHjqo+GjeFjdy7+uqtOZsgHgLubmtFPnFPJojVGdYwGSRwb1lzXWCD4z1CYOfeZmuuJdEYI@lists.linux.dev
X-Received: by 2002:a05:7300:cd8a:b0:2be:142f:d499 with SMTP id 5a478bee46e88-2be4dfc61b1mr1673510eec.16.1772845611532;
        Fri, 06 Mar 2026 17:06:51 -0800 (PST)
X-Received: by 2002:a05:7300:cd8a:b0:2be:142f:d499 with SMTP id 5a478bee46e88-2be4dfc61b1mr1673488eec.16.1772845610837;
        Fri, 06 Mar 2026 17:06:50 -0800 (PST)
Received: from amakhalov-build-vm.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80cc1dsm2237336eec.3.2026.03.06.17.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 17:06:50 -0800 (PST)
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
Subject: [PATCH 4/4] x86/vmware: Support steal time clock for encrypted guests
Date: Sat,  7 Mar 2026 00:42:38 +0000
Message-ID: <20260307004238.1181299-5-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260307004238.1181299-1-alexey.makhalov@broadcom.com>
References: <20260307004238.1181299-1-alexey.makhalov@broadcom.com>
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
index 8997295a5a5c..e33400d4f2c1 100644
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

