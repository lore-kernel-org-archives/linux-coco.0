Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874DF16B72B
	for <linux-coco@lists.linux.dev>; Tue, 28 May 2024 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716890154; cv=none; b=e3d3Vd5JgfGsg0fW/edL5Ui+4OT6Y40lJcuIJtkSFq5WidzMChVSHa/Asywxl6c8epjJltLl2Yk8NkUVhjyWx49OTpgM4b+VL8TTQ33i2iytbjCfWw87/cMNG65mEYTMKSVo603SNj5aMxLQ9l4cQM6yfi74XWmvdhMNqeVQvs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716890154; c=relaxed/simple;
	bh=20gmqRJLZ1DrMXHP1I23O7bcTlns6n1UTqdinHS1U3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAwI/7V1Emc9nxH6XJ9OWY1GJKrN+VZ6AV6ygaRkyk9CfsgcK5s7bYlTmN8XmF4N+V36xPDnFScFDHWGPezrjpoDZsaVe8KTlUxLzLl9YKTRMn0ZCzmA+91Ta366092RGqUfyelK2D0o/8Q+PQQMOKvVjyV0X/W2QKfJVO1ly8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOWb9H92; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOWb9H92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716890154; x=1748426154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=20gmqRJLZ1DrMXHP1I23O7bcTlns6n1UTqdinHS1U3c=;
  b=kOWb9H92jHYQBemG6pD2YIWZSIhcF59mtIfqgIu0cAiA57R6HqYoDN9q
   KpSzl6MfZGNV8qqCfqSAYC+tJ5NaqFfhuvAa7Ww4dHsp/0NjSc7KzNjGQ
   diMR/tvvLJ/taLAq3QM2qy4Km1C0mBs3NY7n6dxSsstgfejyiGRWB7MJs
   ZJn2CtaJXjOMS8uLtfZEpnv0dLKoOcBa8VlrH/IpOPDRDBfNIGijct2Cs
   SjEgsGNvkGERS3Ev4hLSOvyp8hMvUML47x9sJR5zbHvMD3Q2P20lwbndI
   e2iunDFvpOBJP945HI9N/X9j1ERxBWgyoBUR0Cun5pHcrEkpHV3z9pqYi
   g==;
X-CSE-ConnectionGUID: xjQmTbNZR6e5ALTfi3rUrw==
X-CSE-MsgGUID: F3JaUyvKRjSD5YF6VduUPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13097813"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13097813"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 02:55:47 -0700
X-CSE-ConnectionGUID: DN595e/5TnyhTE3kO5c0KA==
X-CSE-MsgGUID: nqm/7/BSQo2t1bnUcgj8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="34951820"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 02:55:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 18C18A56; Tue, 28 May 2024 12:55:27 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe  <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Baoquan He <bhe@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	kexec@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tao Liu <ltao@redhat.com>
Subject: [PATCHv11 16/19] x86/smp: Add smp_ops.stop_this_cpu() callback
Date: Tue, 28 May 2024 12:55:19 +0300
Message-ID: <20240528095522.509667-17-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
References: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the helper is defined, it is called instead of halt() to stop the CPU
at the end of stop_this_cpu() and on crash CPU shutdown.

ACPI MADT will use it to hand over the CPU to BIOS in order to be able
to wake it up again after kexec.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Tao Liu <ltao@redhat.com>
---
 arch/x86/include/asm/smp.h | 1 +
 arch/x86/kernel/process.c  | 7 +++++++
 arch/x86/kernel/reboot.c   | 6 ++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index a35936b512fe..ca073f40698f 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -35,6 +35,7 @@ struct smp_ops {
 	int (*cpu_disable)(void);
 	void (*cpu_die)(unsigned int cpu);
 	void (*play_dead)(void);
+	void (*stop_this_cpu)(void);
 
 	void (*send_call_func_ipi)(const struct cpumask *mask);
 	void (*send_call_func_single_ipi)(int cpu);
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index b8441147eb5e..f63f8fd00a91 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -835,6 +835,13 @@ void __noreturn stop_this_cpu(void *dummy)
 	 */
 	cpumask_clear_cpu(cpu, &cpus_stop_mask);
 
+#ifdef CONFIG_SMP
+	if (smp_ops.stop_this_cpu) {
+		smp_ops.stop_this_cpu();
+		unreachable();
+	}
+#endif
+
 	for (;;) {
 		/*
 		 * Use native_halt() so that memory contents don't change
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 097313147ad3..513809b5b27c 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -880,6 +880,12 @@ static int crash_nmi_callback(unsigned int val, struct pt_regs *regs)
 	cpu_emergency_disable_virtualization();
 
 	atomic_dec(&waiting_for_crash_ipi);
+
+	if (smp_ops.stop_this_cpu) {
+		smp_ops.stop_this_cpu();
+		unreachable();
+	}
+
 	/* Assume hlt works */
 	halt();
 	for (;;)
-- 
2.43.0

