Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFFA29992A
	for <linux-coco@lists.linux.dev>; Sat,  7 Mar 2026 01:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845615; cv=none; b=tbyeflEzgUbYsJLwjeiGbgVle51tEyCI5twMcp7d5xsx8vTsndOwXRyS6PSjvrpIG2iA7PtG1nn/j0vivMfP77sFc/Gv1s55J4XK66934/O+GUnT9WD/1FiPK6lCVCvq8TlIUaM24y6hGRmrMfFD21dC/De6pIvkL9RXWtKgojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845615; c=relaxed/simple;
	bh=ksnYJ5X86WbgcBRlSUFMRlXPK4HJhXyOZMPOHMjp2H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gdrlGTYW9I95xJiAV8HAslBZysZ5te6GdaGg+k4Vx9t9MID5ln7VDOaDBRZm854m5dxmGI/2Xgoptj/uEiScxUixAiOPIqBKCA0zDRqE3holKt4q2EiHyGYDdc1dVUMRX33k8r0RFhImBootIkRYHSlujboviOONTv4dmpIjBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XnyjInZi; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XnyjInZi"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-64ae222d87dso9048570d50.2
        for <linux-coco@lists.linux.dev>; Fri, 06 Mar 2026 17:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772845612; x=1773450412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUw9NhYmIBNJuB5E0xXDdMiSKNxtEhWoJKcE3kIR6ic=;
        b=ARVvktywRlo3MA+jH47/N7z+zw1yeq4IfxWYB1fDJEkwCySaHHBAp7pdJ48eAkcx9C
         5RzGoYkr14/dxV6Dnvgu0fD0j7zLNJHzSMm5h01+z04Fyhaxq13oYTnwDRWgrut13WNB
         VCmYoXvZpGgekPzNimPtgcEdJYHIqBfCunl0osYYZJR4ORisG7acnCCSWcA79PY63abB
         MegaR2gYY26KjEMHyrdUFHcDkFqM9OssBdbvWKpr6jLkAFoKdorBinlKU3D6xyNAD0JK
         gZY6Bwne/uQ/iDHDecgxhaDEQTCAWAiKCQEJ5tjjWKtxY0ao0OmTvLJYFtP9hSUiIYbX
         NN+w==
X-Forwarded-Encrypted: i=1; AJvYcCWDPi6oW4tuCNsU28jirCCJglD9TBlfZHdkr/mB+fT2yFhW3+dNSk3uVdzTYec/j6H3pKUZjtLp9ScC@lists.linux.dev
X-Gm-Message-State: AOJu0YxF0L7AQbUly/9W0lkoTWmxpErPU3AnlTJmZf5nGZWX7KQGxYf5
	rw+0ZS7bEA+uGgyR5/QW27C4tTpMZ0CLZKxyz7U16b9Wf382+Xot/rzctQ0WtwVowNX0nk/Baur
	a4B/hv/lU9+Zpl37hBcGeqYbRO9t9R5lNiihvSOQ1y1ITh7d4xE+O51QFvHb/Ui8pnDg5lMrLmE
	cuvH6OJgZWlw0imjU7iEgwuqhaQcK07kqdVKgZRgnCqfOfRQhHTIfaR5bF9VUX4n/6dO7J5hk1O
	NSThu2T2gQBZo8JZsSu
X-Gm-Gg: ATEYQzwL64OGkslW1BKBs1puuArCUtz6baj/dGY4sdT19GnRbxDLfpgwSTS00JbdH3H
	glrsIi3DXhNQBUmXQnHcmnJZdYAoRXpqw7MAHBXV4HPA+Jw37xBXVzY9Rt2rQ/LMxrbpM1JCL8z
	M0JEArIfV7nPMAKxYP7s4PsmQXUmY3gXIPqqxFNESJ5jJOEgJfNGn2rI3Zt+cdCOukxcaxbGyC2
	ivF6g3Af6Ynp6O6C5E5lm/9I+dogjJ6t1sBqlrCSUUabTgcIOVZwfWBshDrbujiWKIqZtb1R1hN
	EiDTHl3yxazMoo8S0vNkp06lKg44XsEq681HghD25P7pkWzKwaBPmj/hEapE8nFRlUGGD783X84
	5RWrmY5J/2Z1MMLoj/Mj5t5tCyDmqGBUrOS6le+0s2BKOZSdvipuH3wvhXGygKrC6WOo1AjBXRH
	wY+2Ibgiid4hlbNwSDOZCKEHQt1xEk8Qj1Z7dl886zAfVKTiA1H8O/XF102SRh
X-Received: by 2002:a53:84c2:0:b0:64c:a37b:53d2 with SMTP id 956f58d0204a3-64d141a4896mr3179873d50.39.1772845611914;
        Fri, 06 Mar 2026 17:06:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-64d1768f8e1sm243151d50.12.2026.03.06.17.06.51
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2026 17:06:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2be1bc0905bso4684911eec.1
        for <linux-coco@lists.linux.dev>; Fri, 06 Mar 2026 17:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772845611; x=1773450411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUw9NhYmIBNJuB5E0xXDdMiSKNxtEhWoJKcE3kIR6ic=;
        b=XnyjInZiGQGuI+7YnWKlLFQZzYSQMJY3vayqOLbdairwjUOWq+exxf89kFRbK9IMG7
         QfgCAnhxXHTuCSBMoRHvs9QAxY+CvUYDELEyY3NwisrNhpVQSxBEBP2u1JKwsyC10q6k
         LYo7w7epApYft4WV7KMYiMm8cnDkj51rbA6eQ=
X-Forwarded-Encrypted: i=1; AJvYcCWEKKrnU/E0+N4zagrudMZSwDEeTTeQghEowId1jZ++D/rlegBs3gazDbW/94e7w4x7yVZ9Czfdbjfh@lists.linux.dev
X-Received: by 2002:a05:7301:fa0f:b0:2bd:e892:b075 with SMTP id 5a478bee46e88-2be4dea8cfamr1393894eec.9.1772845610239;
        Fri, 06 Mar 2026 17:06:50 -0800 (PST)
X-Received: by 2002:a05:7301:fa0f:b0:2bd:e892:b075 with SMTP id 5a478bee46e88-2be4dea8cfamr1393873eec.9.1772845609534;
        Fri, 06 Mar 2026 17:06:49 -0800 (PST)
Received: from amakhalov-build-vm.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80cc1dsm2237336eec.3.2026.03.06.17.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 17:06:49 -0800 (PST)
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
Subject: [PATCH 3/4] x86/vmware: Report guest crash to the hypervisor
Date: Sat,  7 Mar 2026 00:42:37 +0000
Message-ID: <20260307004238.1181299-4-alexey.makhalov@broadcom.com>
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
index d9753b1aba58..8997295a5a5c 100644
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

