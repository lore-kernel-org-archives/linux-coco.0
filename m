Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A4B1DA4C
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGFQeLWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697814785; x=1729350785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OLVOdxFnd1PuTcNaoWBVdKJvyZnZKOsxD6fGknmiUv0=;
  b=HGFQeLWwCRz6ban2T9+qkg78q2T/8d0HFfe9ZlwP4kMr39pCsJPeM4Yp
   Q+UufDt0UT//NuW9NwqkyzR9qgLaAD2X21cAsoXfO9QLJgZq0Nt7Qc51M
   CT7FxONNC37UouRfHsfxpSkjCnBYn1U20uzIELKLtQ21Qfdv4njC8/NyY
   YV8ENtDRJz2/a+VyFYMZMo2jy0V+hMV/66s2N/F9HO1uLzTuz9++qCfq+
   m2PcgP7ItX6gvp2BGIi8H9cvkxuBzfM8+2VCkrSfR6TamxNI+aiCOVZ0J
   /gRTRSmFBI30I9//AkVV/mDIjNppqPbiItfycPymQpjQ/A+9Rn+0mE2rH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="376893678"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="376893678"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 08:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="761080288"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="761080288"
Received: from dgutows1-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.39.237])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 08:12:56 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 5C61110A29D; Fri, 20 Oct 2023 18:12:45 +0300 (+03)
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
Subject: [PATCHv2 11/13] x86/acpi: Do not attempt to bring up secondary CPUs in kexec case
Date: Fri, 20 Oct 2023 18:12:40 +0300
Message-ID: <20231020151242.1814-12-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI MADT doesn't allow to offline CPU after it got woke up. It limits
kexec: the second kernel won't be able to use more than one CPU.

Now acpi_mp_wake_mailbox_paddr already has the mailbox address.
The acpi_wakeup_cpu() will use it to bring up secondary cpus.

Zero out mailbox address in the ACPI MADT wakeup structure to indicate
that the mailbox is not usable.  This prevents the kexec()-ed kernel
from reading a vaild mailbox, which in turn makes the kexec()-ed kernel
only be able to use the boot CPU.

This is Linux-specific protocol and not reflected in ACPI spec.

Booting the second kernel with signle CPU is enough to cover the most
common case for kexec -- kdump.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/kernel/acpi/madt_wakeup.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/x86/kernel/acpi/madt_wakeup.c b/arch/x86/kernel/acpi/madt_wakeup.c
index 4bc1d5106afd..9bbe829737e7 100644
--- a/arch/x86/kernel/acpi/madt_wakeup.c
+++ b/arch/x86/kernel/acpi/madt_wakeup.c
@@ -13,6 +13,11 @@ static struct acpi_madt_multiproc_wakeup_mailbox *acpi_mp_wake_mailbox;
 
 static int acpi_wakeup_cpu(int apicid, unsigned long start_ip)
 {
+	if (!acpi_mp_wake_mailbox_paddr) {
+		pr_warn_once("No MADT mailbox: cannot bringup secondary CPUs. Booting with kexec?\n");
+		return -EOPNOTSUPP;
+	}
+
 	/*
 	 * Remap mailbox memory only for the first call to acpi_wakeup_cpu().
 	 *
@@ -78,6 +83,23 @@ int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
 
 	cpu_hotplug_disable_offlining();
 
+	/*
+	 * ACPI MADT doesn't allow to offline CPU after it got woke up.
+	 * It limits kexec: the second kernel won't be able to use more than
+	 * one CPU.
+	 *
+	 * Now acpi_mp_wake_mailbox_paddr already has the mailbox address.
+	 * The acpi_wakeup_cpu() will use it to bring up secondary cpus.
+	 *
+	 * Zero out mailbox address in the ACPI MADT wakeup structure to
+	 * indicate that the mailbox is not usable.  This prevents the
+	 * kexec()-ed kernel from reading a vaild mailbox, which in turn
+	 * makes the kexec()-ed kernel only be able to use the boot CPU.
+	 *
+	 * This is Linux-specific protocol and not reflected in ACPI spec.
+	 */
+	mp_wake->base_address = 0;
+
 	apic_update_callback(wakeup_secondary_cpu_64, acpi_wakeup_cpu);
 
 	return 0;
-- 
2.41.0

