Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690454;
	b=B+8L/yYxgYcwNK6sDzN2PAEjAH48WC1NoX0zsqLklyrmBb2ETkT/KTVqg7Z9LqEWJww9
	 gr5IUh6Piiwl0fmpA7O6jdELFHP1chTdT8kLCNbaPkqYXUFfQyBUlPNqD+2yWrXnb8FWD
	 dF8Fk//bsi4N5OYVgo4X92n72LvT4mqjg0VpldTr1/1fLSprBE2rwcjFPrqn8LHyKf4zq
	 48c5ao94CL0ey1hHxlW6AfrnaRQ1FvcUFmUJIwFKAJXKxLakivf87wESMjnSR9w3mnalt
	 E7u2gsDWrZQW7RSeFFwok7lhyAV3y4zX6Kbaz18K1LeKUuJaTgBfyqVK3wLO/rJBk3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690454;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NYnvmmVZ+DB0wY8M1R887gq0WKcmk09L6Gjh3jQPaE0=;
	b=l8pw2/PeAkJ1GpuUgD8cTtzo/qJO1VYVWlcLDFs1gCksOVH6zrPiJPS0hdzV1I+cWzSK
	 TfKveaPDQNYM3h6Q64FdYfwDchHQ8j47RMJb5CgQ9IhxeCazBqafCCSHaE/p1YQF7rzS0
	 gBXihV7Z3LJsIoheo94k3jbBT55XdVFAHgK9MFA/8nABL/xUSF0hdIeBOC1cV2o2wnh/0
	 4gcEXUkN1zltbD0ajZ3NPoGLUrxx/4uzZgdkWY6Xax2b4hsKbH7rcgKzBWclCxCaySbkg
	 gIrZ8l7+P3WdS7KVl6sBeAi/LdqFeyz6DRbzkbE46p8pKUN2H5MFfkf+MrbuKAIPXQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Lv2RrcKM;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75747606A324
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 07:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75747606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Lv2RrcKM
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2794795a91.1
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:20:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690454; x=1794295254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYnvmmVZ+DB0wY8M1R887gq0WKcmk09L6Gjh3jQPaE0=;
        b=Vjvw9UdBJ6f9Dhq/GFV0837e/v4tqU1eWRGiLTzoEdGxJdQXnvMP/MHw+rq9cWvTWa
         kYU5zEwBa5XWRjeyI0tmV+2YXMJBKxmCmQKQe7hLXgH8znrGyHHuSv3l/FU4VQSEsUj2
         iJmxtSt01J5TWzFngkBp3GwPzK8FCmRLR70ABp8REImsLrs/vxRjlX8kxvCm1lz+lhi5
         56E3bwCANGKFVFN/c0wcfuKQsw3ugiUd2Tt4Cl8xDI61O7DItV4fn2xxiWIdo+4gqfAA
         0dgIU63pjAzM3a/awfCP1MJpoiGgjg2SWM45sqLo6OQ4/E4vY5TjrCukjflmbjFBuN7E
         VFnw==
X-Forwarded-Encrypted: i=1; AKwUvBx6VdWplLEjJGxKn7t5qZ1NKrYtburRAHCUaPgXfTLlDWpXlrkMs+GwqW0p9vlLAT+6soVTEDh6NmaH@lists.linux.dev
X-Gm-Message-State: APuU4Z9hCDlrHg0TRAczvdrxbDlDWVhzhgGF1MAso9rqaqct/PQ9kUfK
	mkaMpgluAdosEErBgkecSKvnwkyrli4M3GuMrsqeugVtL4xFEsWPGYeMKBKVY8XzpbEZHFqCe+0
	X1h3LkoCUpyX1nUbWI6y12aP52wcKDlPxvxT2DLWdTwaAsxBA4XMMtCetSpHrwxrsIlRxGvBKXo
	RSpnEGgP3V94gS1OnKN0nE2y1VyMgSoPeGvHOCNBcx6IIa5vyGS2Yn279zoymgfyIkj6Kt1jEy1
	XIo6WT/q8sAAA==
X-Gm-Gg: AYBFou1WK3+o8UM2GK6o4GFrcs6IAEUCNjQWDnDYjAOIDEJDk/PdiS9LMT1fd6vuVeI
	lGhuHMerpZcbenMaaXMeTBUnZ7BQ/wOCiOVzkyB/Mtr8czcogbidUqbWXvv1CCcyQa+3nDICJdX
	HNBoeqD3lGQj6+jpjoDeHFTglkYB9wHn0izR7bs+bF/aoCDVMvtwruZSHR3iEAjtWJCIMYi7g45
	G3GgF9OHAAix8X100enJm+eCrpj2daL2FNe3eyanScWOnkCFaDSiCZTnuh+yqOp4nywmZeSOwzf
	Q0Bvz3zkU7dvxvw7iVahEzkA+tTR/13G/negRrvDxkbwu669f1jicvin983IEdTJSJE3g2o7X85
	qzrKti5/MT1ykkJ8qrFLm01LIuRDxbnkmNmLiwaTOEmOn2ThhihCEjrlqw8/ZG2xcv4PTyKyunc
	DCg0ALKfCu36+h1BCC79EoDNT/TSv3rEbF
X-Received: by 2002:a17:90b:4c09:b0:3ac:adce:60af with SMTP id 98e67ed59e1d1-3ae89724b12mr11433231a91.16.1793690453531;
        Mon, 02 Nov 2026 23:20:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae881d509fsm4497307a91.5.2026.11.02.23.20.53
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:20:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-537548d4bc0so54280991cf.2
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793690452; x=1794295252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYnvmmVZ+DB0wY8M1R887gq0WKcmk09L6Gjh3jQPaE0=;
        b=Lv2RrcKMj5q8JDdrwm0eb/4LJx5VT1lUxJaVfqoF9uFvS9PK/XuC9NUbOSlDMlxApQ
         qPH+ujm+WK6SB8lgi36/WYEFV3xLNvHafyq3C6v4r6P+tGPPQG+cZmWl09hdJmZor2Nu
         zRApuUQB0WZv+DcBBRw5xKCBa2Dwxm2AHouVI=
X-Forwarded-Encrypted: i=1; AKwUvBwI/pn2Z5IEDU5yrrdi33U4v+Bu7E+Bgx9ugIUdZ9rnRATDtsiTicsGedvUz7G2w1b2L5iufMdEAadN@lists.linux.dev
X-Received: by 2002:a05:622a:1f9b:b0:535:a5f8:a5c8 with SMTP id d75a77b69052e-542b83f24e7mr199085771cf.72.1793690446341;
        Mon, 02 Nov 2026 23:20:46 -0800 (PST)
X-Received: by 2002:a05:622a:1f9b:b0:535:a5f8:a5c8 with SMTP id d75a77b69052e-542b83f24e7mr199085311cf.72.1793690445453;
        Mon, 02 Nov 2026 23:20:45 -0800 (PST)
Received: from vertex.localdomain ([192.19.218.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498c379989sm18885491cf.19.2026.11.02.23.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:20:44 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Bo Gan <bo.gan@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	virtualization@lists.linux.dev,
	linux-coco@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] x86/vmware: Allocate shared storage for steal-time counters
Date: Tue,  3 Nov 2026 02:20:34 -0500
Message-ID: <52b57836c0c28abe1c4157646b39329c603ff77f.1792471114.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792471114.git.zack.rusin@broadcom.com>
References: <cover.1792471114.git.zack.rusin@broadcom.com>
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

Steal time accounts for time a virtual CPU waits to run on the host.
VMware updates a counter in guest memory, but encrypted guests currently
register private memory which the host cannot write.

Allocate the counters together instead of embedding them in every CPU's
per-CPU area, and share them before registering any address. Move setup
for all guests to an early initcall, after the page allocator is available
and before secondary CPUs start, so it can use the normal conversion API.

Keep the allocation for CPU hotplug. Enable accounting only after boot-CPU
registration succeeds, and retain pages whose encryption state is unknown
on failure. A secondary CPU's registration failure must not prevent the
other CPUs from unregistering their counters.

Suggested-by: Borislav Petkov <bp@alien8.de>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20261001235950.GHar7z9v3zfk8odoTh@fat_crate.local
Link: https://lore.kernel.org/r/20260309235250.2611115-5-alexey.makhalov@broadcom.com
Co-developed-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Bo Gan <bo.gan@broadcom.com>
Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v3: Replace the per-CPU infrastructure series with a packed allocation
and ordinary post-allocator conversion in the VMware driver.

 arch/x86/kernel/cpu/vmware.c | 130 +++++++++++++++++++++++------------
 1 file changed, 86 insertions(+), 44 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 34b73573b108..7b7469f2e7d6 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -25,9 +25,12 @@
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/clocksource.h>
+#include <linux/cc_platform.h>
 #include <linux/cpu.h>
 #include <linux/efi.h>
+#include <linux/mm.h>
 #include <linux/reboot.h>
+#include <linux/set_memory.h>
 #include <linux/static_call.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
@@ -145,8 +148,8 @@ static unsigned long vmware_get_tsc_khz(void)
 #ifdef CONFIG_PARAVIRT
 static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
 static bool vmw_sched_clock __initdata = true;
-static DEFINE_PER_CPU_DECRYPTED(struct vmware_steal_time, vmw_steal_time) __aligned(64);
-static bool has_steal_clock;
+static struct vmware_steal_time *vmw_steal_time __ro_after_init;
+static bool has_steal_clock __ro_after_init;
 static bool steal_acc __initdata = true; /* steal time accounting */
 
 static __init int setup_vmw_sched_clock(char *s)
@@ -228,7 +231,7 @@ static bool vmware_is_stealclock_available(void)
  */
 static u64 vmware_steal_clock(int cpu)
 {
-	struct vmware_steal_time *steal = &per_cpu(vmw_steal_time, cpu);
+	struct vmware_steal_time *steal = &vmw_steal_time[cpu];
 	u64 clock;
 
 	if (IS_ENABLED(CONFIG_64BIT))
@@ -253,21 +256,19 @@ static u64 vmware_steal_clock(int cpu)
 			     vmware_cyc2ns.cyc2ns_shift);
 }
 
-static void vmware_register_steal_time(void)
+static bool vmware_register_steal_time(void)
 {
 	int cpu = smp_processor_id();
-	struct vmware_steal_time *st = &per_cpu(vmw_steal_time, cpu);
+	struct vmware_steal_time *st = &vmw_steal_time[cpu];
 
-	if (!has_steal_clock)
-		return;
-
-	if (!stealclock_enable(slow_virt_to_phys(st))) {
-		has_steal_clock = false;
-		return;
+	if (!stealclock_enable(virt_to_phys(st))) {
+		pr_warn("failed to register steal time for CPU %d\n", cpu);
+		return false;
 	}
 
 	pr_info("vmware-stealtime: cpu %d, pa %llx\n",
-		cpu, (unsigned long long) slow_virt_to_phys(st));
+		cpu, (unsigned long long)virt_to_phys(st));
+	return true;
 }
 
 static void vmware_disable_steal_time(void)
@@ -278,12 +279,6 @@ static void vmware_disable_steal_time(void)
 	stealclock_disable();
 }
 
-static void vmware_guest_cpu_init(void)
-{
-	if (has_steal_clock)
-		vmware_register_steal_time();
-}
-
 static void vmware_pv_guest_cpu_reboot(void *unused)
 {
 	vmware_disable_steal_time();
@@ -302,16 +297,11 @@ static struct notifier_block vmware_pv_reboot_nb = {
 };
 
 #ifdef CONFIG_SMP
-static void __init vmware_smp_prepare_boot_cpu(void)
-{
-	vmware_guest_cpu_init();
-	native_smp_prepare_boot_cpu();
-}
-
 static int vmware_cpu_online(unsigned int cpu)
 {
 	local_irq_disable();
-	vmware_guest_cpu_init();
+	if (has_steal_clock)
+		vmware_register_steal_time();
 	local_irq_enable();
 	return 0;
 }
@@ -325,6 +315,76 @@ static int vmware_cpu_down_prepare(unsigned int cpu)
 }
 #endif
 
+static int __init vmware_steal_time_init(void)
+{
+	size_t size = PAGE_ALIGN(nr_cpu_ids * sizeof(*vmw_steal_time));
+	bool encrypted = cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+	unsigned long addr, flags;
+	int ret;
+#ifdef CONFIG_SMP
+	int hp_state;
+#endif
+
+	if (!has_steal_clock)
+		return 0;
+
+	vmw_steal_time = alloc_pages_exact(size, GFP_KERNEL | __GFP_ZERO);
+	if (!vmw_steal_time) {
+		ret = -ENOMEM;
+		goto disable;
+	}
+	addr = (unsigned long)vmw_steal_time;
+
+	ret = register_reboot_notifier(&vmware_pv_reboot_nb);
+	if (ret)
+		goto free;
+#ifdef CONFIG_SMP
+	hp_state = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					     "x86/vmware:online",
+					     vmware_cpu_online,
+					     vmware_cpu_down_prepare);
+	if (hp_state < 0) {
+		ret = hp_state;
+		unregister_reboot_notifier(&vmware_pv_reboot_nb);
+		goto free;
+	}
+#endif
+
+	if (encrypted) {
+		ret = set_memory_decrypted(addr, size >> PAGE_SHIFT);
+		if (ret)
+			goto remove;
+		/* Conversion need not preserve the zeroes. */
+		memset(vmw_steal_time, 0, size);
+	}
+
+	local_irq_save(flags);
+	ret = vmware_register_steal_time() ? 0 : -EIO;
+	local_irq_restore(flags);
+	if (!ret) {
+		static_call_update(pv_steal_clock, vmware_steal_clock);
+		return 0;
+	}
+
+	if (!encrypted || !set_memory_encrypted(addr, size >> PAGE_SHIFT))
+		free_pages_exact(vmw_steal_time, size);
+remove:
+	/* Keep pages with an unknown encryption state out of the allocator. */
+#ifdef CONFIG_SMP
+	cpuhp_remove_state_nocalls(hp_state);
+#endif
+	unregister_reboot_notifier(&vmware_pv_reboot_nb);
+	goto disable;
+free:
+	free_pages_exact(vmw_steal_time, size);
+disable:
+	vmw_steal_time = NULL;
+	has_steal_clock = false;
+	pr_warn("steal time disabled: %d\n", ret);
+	return 0;
+}
+early_initcall(vmware_steal_time_init);
+
 static __init int activate_jump_labels(void)
 {
 	if (has_steal_clock) {
@@ -350,25 +410,7 @@ static void __init vmware_paravirt_ops_setup(void)
 	if (vmw_sched_clock)
 		paravirt_set_sched_clock(vmware_sched_clock);
 
-	if (vmware_is_stealclock_available()) {
-		has_steal_clock = true;
-		static_call_update(pv_steal_clock, vmware_steal_clock);
-
-		/* We use reboot notifier only to disable steal clock */
-		register_reboot_notifier(&vmware_pv_reboot_nb);
-
-#ifdef CONFIG_SMP
-		smp_ops.smp_prepare_boot_cpu =
-			vmware_smp_prepare_boot_cpu;
-		if (cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
-					      "x86/vmware:online",
-					      vmware_cpu_online,
-					      vmware_cpu_down_prepare) < 0)
-			pr_err("vmware_guest: Failed to install cpu hotplug callbacks\n");
-#else
-		vmware_guest_cpu_init();
-#endif
-	}
+	has_steal_clock = vmware_is_stealclock_available();
 }
 #else
 #define vmware_paravirt_ops_setup() do {} while (0)
