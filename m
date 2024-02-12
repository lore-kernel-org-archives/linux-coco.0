Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE0A38DF7
	for <linux-coco@lists.linux.dev>; Mon, 12 Feb 2024 10:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707734705; cv=none; b=Mv61SjHxMn9z9L8/FcKCussi8V9FsrmPo2VsnLjpON0qTVWImGyknjRictzpdd5q3Br7Z/LrSr7GysvMLIyAXVDMvozNt+SIz3NFTUBY9jWYLXBoYfkPC6b9pJVUq2fw3s3bRepx6z2cN43BbOjSLD8y/VMq/XKSCBJCNWfNOTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707734705; c=relaxed/simple;
	bh=qz1krj0wC55JXx44sTGWHpxuKY8Fuz6UzO1qVRE49gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwLVI9h4LDKHYUqGVDmbsCdwokZDfTu1wxfDD5qHeyqvwRLOkN6nWf+VW9LCoADlJgPO7vfg0/w+PzMa6LgDFQqbr3kHzNEYW62Z+/a8KRt7eTdiQAL/oBFjt5p4tIeLOtWht8l/8Q7dmHJ5JtCqkACJXYipu8IKpK43ENakN+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0XSj5Tj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0XSj5Tj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707734702; x=1739270702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qz1krj0wC55JXx44sTGWHpxuKY8Fuz6UzO1qVRE49gA=;
  b=P0XSj5Tjlu++9okGylQBieEkSkxMIAgkysAmCLp2PFMT1M3407qBr/Lu
   29dN+/aNiokBpx9+hbuuDy/a0fPwS2uEEoEuPdoksg/QqhjwLICIPiqB5
   fEQQRzEWkXCgSJuJvM9UxQiOx1f5SjisIAJMWl5znZqZNUKw3Ko1pz1bh
   0PmWzc5VQMC9Bz+hAwRIenTmwUx7o9S3LQEo9v3X/TEtfOV4Ik9kLhx0R
   885XqCrlzGOzwuYLGmL0yG28YRpfXTHHRo522KAAbu8TaXgmp3ZkuYyKb
   C8V2zeUuJKGQ5W2N13LTgSBF+xLN0qRJEoqKANNx952CdPvZf3bZEsqKx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1584987"
X-IronPort-AV: E=Sophos;i="6.05,263,1701158400"; 
   d="scan'208";a="1584987"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 02:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="935035571"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="935035571"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2024 02:44:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id E8134A3; Mon, 12 Feb 2024 12:44:52 +0200 (EET)
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
	Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv7 01/16] x86/acpi: Extract ACPI MADT wakeup code into a separate file
Date: Mon, 12 Feb 2024 12:44:33 +0200
Message-ID: <20240212104448.2589568-2-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212104448.2589568-1-kirill.shutemov@linux.intel.com>
References: <20240212104448.2589568-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare for the expansion of support for the ACPI MADT
wakeup method, move the relevant code into a separate file.

Introduce a new configuration option to clearly indicate dependencies
without the use of ifdefs.

There have been no functional changes.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/Kconfig                   |  7 +++
 arch/x86/include/asm/acpi.h        |  5 ++
 arch/x86/kernel/acpi/Makefile      | 11 ++--
 arch/x86/kernel/acpi/boot.c        | 86 +-----------------------------
 arch/x86/kernel/acpi/madt_wakeup.c | 82 ++++++++++++++++++++++++++++
 5 files changed, 101 insertions(+), 90 deletions(-)
 create mode 100644 arch/x86/kernel/acpi/madt_wakeup.c

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5edec175b9bf..1c1c06f6c0f1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1108,6 +1108,13 @@ config X86_LOCAL_APIC
 	depends on X86_64 || SMP || X86_32_NON_STANDARD || X86_UP_APIC || PCI_MSI
 	select IRQ_DOMAIN_HIERARCHY
 
+config X86_ACPI_MADT_WAKEUP
+	def_bool y
+	depends on X86_64
+	depends on ACPI
+	depends on SMP
+	depends on X86_LOCAL_APIC
+
 config X86_IO_APIC
 	def_bool y
 	depends on X86_LOCAL_APIC || X86_UP_IOAPIC
diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index f896eed4516c..2625b915ae7f 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -76,6 +76,11 @@ static inline bool acpi_skip_set_wakeup_address(void)
 
 #define acpi_skip_set_wakeup_address acpi_skip_set_wakeup_address
 
+union acpi_subtable_headers;
+
+int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
+			      const unsigned long end);
+
 /*
  * Check if the CPU can handle C2 and deeper
  */
diff --git a/arch/x86/kernel/acpi/Makefile b/arch/x86/kernel/acpi/Makefile
index fc17b3f136fe..8c7329c88a75 100644
--- a/arch/x86/kernel/acpi/Makefile
+++ b/arch/x86/kernel/acpi/Makefile
@@ -1,11 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_ACPI)		+= boot.o
-obj-$(CONFIG_ACPI_SLEEP)	+= sleep.o wakeup_$(BITS).o
-obj-$(CONFIG_ACPI_APEI)		+= apei.o
-obj-$(CONFIG_ACPI_CPPC_LIB)	+= cppc.o
+obj-$(CONFIG_ACPI)			+= boot.o
+obj-$(CONFIG_ACPI_SLEEP)		+= sleep.o wakeup_$(BITS).o
+obj-$(CONFIG_ACPI_APEI)			+= apei.o
+obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
+obj-$(CONFIG_X86_ACPI_MADT_WAKEUP)	+= madt_wakeup.o
 
 ifneq ($(CONFIG_ACPI_PROCESSOR),)
-obj-y				+= cstate.o
+obj-y					+= cstate.o
 endif
 
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 85a3ce2a3666..df3384dc42c7 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -67,13 +67,6 @@ static bool has_lapic_cpus __initdata;
 static bool acpi_support_online_capable;
 #endif
 
-#ifdef CONFIG_X86_64
-/* Physical address of the Multiprocessor Wakeup Structure mailbox */
-static u64 acpi_mp_wake_mailbox_paddr;
-/* Virtual address of the Multiprocessor Wakeup Structure mailbox */
-static struct acpi_madt_multiproc_wakeup_mailbox *acpi_mp_wake_mailbox;
-#endif
-
 #ifdef CONFIG_X86_IO_APIC
 /*
  * Locks related to IOAPIC hotplug
@@ -370,60 +363,6 @@ acpi_parse_lapic_nmi(union acpi_subtable_headers * header, const unsigned long e
 
 	return 0;
 }
-
-#ifdef CONFIG_X86_64
-static int acpi_wakeup_cpu(u32 apicid, unsigned long start_ip)
-{
-	/*
-	 * Remap mailbox memory only for the first call to acpi_wakeup_cpu().
-	 *
-	 * Wakeup of secondary CPUs is fully serialized in the core code.
-	 * No need to protect acpi_mp_wake_mailbox from concurrent accesses.
-	 */
-	if (!acpi_mp_wake_mailbox) {
-		acpi_mp_wake_mailbox = memremap(acpi_mp_wake_mailbox_paddr,
-						sizeof(*acpi_mp_wake_mailbox),
-						MEMREMAP_WB);
-	}
-
-	/*
-	 * Mailbox memory is shared between the firmware and OS. Firmware will
-	 * listen on mailbox command address, and once it receives the wakeup
-	 * command, the CPU associated with the given apicid will be booted.
-	 *
-	 * The value of 'apic_id' and 'wakeup_vector' must be visible to the
-	 * firmware before the wakeup command is visible.  smp_store_release()
-	 * ensures ordering and visibility.
-	 */
-	acpi_mp_wake_mailbox->apic_id	    = apicid;
-	acpi_mp_wake_mailbox->wakeup_vector = start_ip;
-	smp_store_release(&acpi_mp_wake_mailbox->command,
-			  ACPI_MP_WAKE_COMMAND_WAKEUP);
-
-	/*
-	 * Wait for the CPU to wake up.
-	 *
-	 * The CPU being woken up is essentially in a spin loop waiting to be
-	 * woken up. It should not take long for it wake up and acknowledge by
-	 * zeroing out ->command.
-	 *
-	 * ACPI specification doesn't provide any guidance on how long kernel
-	 * has to wait for a wake up acknowledgement. It also doesn't provide
-	 * a way to cancel a wake up request if it takes too long.
-	 *
-	 * In TDX environment, the VMM has control over how long it takes to
-	 * wake up secondary. It can postpone scheduling secondary vCPU
-	 * indefinitely. Giving up on wake up request and reporting error opens
-	 * possible attack vector for VMM: it can wake up a secondary CPU when
-	 * kernel doesn't expect it. Wait until positive result of the wake up
-	 * request.
-	 */
-	while (READ_ONCE(acpi_mp_wake_mailbox->command))
-		cpu_relax();
-
-	return 0;
-}
-#endif /* CONFIG_X86_64 */
 #endif /* CONFIG_X86_LOCAL_APIC */
 
 #ifdef CONFIG_X86_IO_APIC
@@ -1159,29 +1098,6 @@ static int __init acpi_parse_madt_lapic_entries(void)
 	}
 	return 0;
 }
-
-#ifdef CONFIG_X86_64
-static int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
-				     const unsigned long end)
-{
-	struct acpi_madt_multiproc_wakeup *mp_wake;
-
-	if (!IS_ENABLED(CONFIG_SMP))
-		return -ENODEV;
-
-	mp_wake = (struct acpi_madt_multiproc_wakeup *)header;
-	if (BAD_MADT_ENTRY(mp_wake, end))
-		return -EINVAL;
-
-	acpi_table_print_madt_entry(&header->common);
-
-	acpi_mp_wake_mailbox_paddr = mp_wake->base_address;
-
-	apic_update_callback(wakeup_secondary_cpu_64, acpi_wakeup_cpu);
-
-	return 0;
-}
-#endif				/* CONFIG_X86_64 */
 #endif				/* CONFIG_X86_LOCAL_APIC */
 
 #ifdef	CONFIG_X86_IO_APIC
@@ -1378,7 +1294,7 @@ static void __init acpi_process_madt(void)
 				smp_found_config = 1;
 			}
 
-#ifdef CONFIG_X86_64
+#ifdef CONFIG_X86_ACPI_MADT_WAKEUP
 			/*
 			 * Parse MADT MP Wake entry.
 			 */
diff --git a/arch/x86/kernel/acpi/madt_wakeup.c b/arch/x86/kernel/acpi/madt_wakeup.c
new file mode 100644
index 000000000000..7f164d38bd0b
--- /dev/null
+++ b/arch/x86/kernel/acpi/madt_wakeup.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/acpi.h>
+#include <linux/io.h>
+#include <asm/apic.h>
+#include <asm/barrier.h>
+#include <asm/processor.h>
+
+/* Physical address of the Multiprocessor Wakeup Structure mailbox */
+static u64 acpi_mp_wake_mailbox_paddr;
+
+/* Virtual address of the Multiprocessor Wakeup Structure mailbox */
+static struct acpi_madt_multiproc_wakeup_mailbox *acpi_mp_wake_mailbox;
+
+static int acpi_wakeup_cpu(u32 apicid, unsigned long start_ip)
+{
+	/*
+	 * Remap mailbox memory only for the first call to acpi_wakeup_cpu().
+	 *
+	 * Wakeup of secondary CPUs is fully serialized in the core code.
+	 * No need to protect acpi_mp_wake_mailbox from concurrent accesses.
+	 */
+	if (!acpi_mp_wake_mailbox) {
+		acpi_mp_wake_mailbox = memremap(acpi_mp_wake_mailbox_paddr,
+						sizeof(*acpi_mp_wake_mailbox),
+						MEMREMAP_WB);
+	}
+
+	/*
+	 * Mailbox memory is shared between the firmware and OS. Firmware will
+	 * listen on mailbox command address, and once it receives the wakeup
+	 * command, the CPU associated with the given apicid will be booted.
+	 *
+	 * The value of 'apic_id' and 'wakeup_vector' must be visible to the
+	 * firmware before the wakeup command is visible.  smp_store_release()
+	 * ensures ordering and visibility.
+	 */
+	acpi_mp_wake_mailbox->apic_id	    = apicid;
+	acpi_mp_wake_mailbox->wakeup_vector = start_ip;
+	smp_store_release(&acpi_mp_wake_mailbox->command,
+			  ACPI_MP_WAKE_COMMAND_WAKEUP);
+
+	/*
+	 * Wait for the CPU to wake up.
+	 *
+	 * The CPU being woken up is essentially in a spin loop waiting to be
+	 * woken up. It should not take long for it wake up and acknowledge by
+	 * zeroing out ->command.
+	 *
+	 * ACPI specification doesn't provide any guidance on how long kernel
+	 * has to wait for a wake up acknowledgment. It also doesn't provide
+	 * a way to cancel a wake up request if it takes too long.
+	 *
+	 * In TDX environment, the VMM has control over how long it takes to
+	 * wake up secondary. It can postpone scheduling secondary vCPU
+	 * indefinitely. Giving up on wake up request and reporting error opens
+	 * possible attack vector for VMM: it can wake up a secondary CPU when
+	 * kernel doesn't expect it. Wait until positive result of the wake up
+	 * request.
+	 */
+	while (READ_ONCE(acpi_mp_wake_mailbox->command))
+		cpu_relax();
+
+	return 0;
+}
+
+int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
+			      const unsigned long end)
+{
+	struct acpi_madt_multiproc_wakeup *mp_wake;
+
+	mp_wake = (struct acpi_madt_multiproc_wakeup *)header;
+	if (BAD_MADT_ENTRY(mp_wake, end))
+		return -EINVAL;
+
+	acpi_table_print_madt_entry(&header->common);
+
+	acpi_mp_wake_mailbox_paddr = mp_wake->base_address;
+
+	apic_update_callback(wakeup_secondary_cpu_64, acpi_wakeup_cpu);
+
+	return 0;
+}
-- 
2.43.0

