Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525E716D9A6
	for <linux-coco@lists.linux.dev>; Tue, 28 May 2024 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716890153; cv=none; b=PoTPR/Oyl+sUc+kYwesImFf5YSMtBDNwkGRr9BSxOP4p8e115FE3ywHId53bTfrhvqjE3elV58lpt0YAQ0NIy+/P/vbqIElTkZ3Oh0Cv5s+YzI8/iW29UiQuFInj5Kobr1mTKt3HxxTTyC7K6nAu9G6GtthFNc5Dl6Wj3iw3kPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716890153; c=relaxed/simple;
	bh=hHQ9KRFxDt369JBke8P/ZWEer7oQx7aWq4kGcpCYmms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHbCxZJlzpc/+NJPPwvhXh0fiIOe3VmK1aLIUhTHvgz76Cfmlf72DEFpF1g/lVtzk32QtA6kcEhMCZ3zUxgbTfKuWja047cjMseMiRXs2U6vCtD8ExD3IbjQp5KFiYb8hP4YgmesVClz9Ijswpv0igx1dgQrmN/H2NvU9jUrnH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HM9ynKYJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HM9ynKYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716890152; x=1748426152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hHQ9KRFxDt369JBke8P/ZWEer7oQx7aWq4kGcpCYmms=;
  b=HM9ynKYJNwKdh/1ZWmAp11c6FHple4sJsjanidQHxWX5gOlEGAmRlapb
   CSK+59GtFdfbW0LLJLk1t1DYV4yWxr6qLrD2b08x7L0hbb38xSgR0u+mX
   AFAVrCOgA8eekwP6fbPXDpXXlPE+Ur4uzo94mmouPy1pcwjTuVO9N57OB
   O0NzK5qCWDxfPfjdDtQsrhzqUyLGsXN0AOjmViUbUaulPHVVRWurqewip
   mSh5I6k/UeVaXBTQ8rwDw6MKwHkjQSZy+WP7uAaqpJwYAo6LnjibBZlBL
   xKcVQVGxeST3kC7rWQzZUAKn7uLG22Jg4y3ZKQS2xIcxyOgraMtVBm4uX
   A==;
X-CSE-ConnectionGUID: p8eN/Mt9RLKlck5nWGFseA==
X-CSE-MsgGUID: 8DO7ntHlTfadjh9q6V44Qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13097800"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13097800"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 02:55:47 -0700
X-CSE-ConnectionGUID: 7XKH460fSwm5D/IsirCqgA==
X-CSE-MsgGUID: m26kk0SmSh69XFK2ZB689A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="34951819"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 02:55:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 0AA91A19; Tue, 28 May 2024 12:55:27 +0300 (EEST)
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
Subject: [PATCHv11 15/19] x86/acpi: Do not attempt to bring up secondary CPUs in kexec case
Date: Tue, 28 May 2024 12:55:18 +0300
Message-ID: <20240528095522.509667-16-kirill.shutemov@linux.intel.com>
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

ACPI MADT doesn't allow to offline a CPU after it was onlined. This
limits kexec: the second kernel won't be able to use more than one CPU.

To prevent a kexec kernel from onlining secondary CPUs invalidate the
mailbox address in the ACPI MADT wakeup structure which prevents a
kexec kernel to use it.

This is safe as the booting kernel has the mailbox address cached
already and acpi_wakeup_cpu() uses the cached value to bring up the
secondary CPUs.

Note: This is a Linux specific convention and not covered by the
      ACPI specification.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Tao Liu <ltao@redhat.com>
---
 arch/x86/kernel/acpi/madt_wakeup.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/acpi/madt_wakeup.c b/arch/x86/kernel/acpi/madt_wakeup.c
index 004801b9b151..30820f9de5af 100644
--- a/arch/x86/kernel/acpi/madt_wakeup.c
+++ b/arch/x86/kernel/acpi/madt_wakeup.c
@@ -14,6 +14,11 @@ static struct acpi_madt_multiproc_wakeup_mailbox *acpi_mp_wake_mailbox __ro_afte
 
 static int acpi_wakeup_cpu(u32 apicid, unsigned long start_ip)
 {
+	if (!acpi_mp_wake_mailbox_paddr) {
+		pr_warn_once("No MADT mailbox: cannot bringup secondary CPUs. Booting with kexec?\n");
+		return -EOPNOTSUPP;
+	}
+
 	/*
 	 * Remap mailbox memory only for the first call to acpi_wakeup_cpu().
 	 *
@@ -64,6 +69,28 @@ static int acpi_wakeup_cpu(u32 apicid, unsigned long start_ip)
 	return 0;
 }
 
+static void acpi_mp_disable_offlining(struct acpi_madt_multiproc_wakeup *mp_wake)
+{
+	cpu_hotplug_disable_offlining();
+
+	/*
+	 * ACPI MADT doesn't allow to offline a CPU after it was onlined. This
+	 * limits kexec: the second kernel won't be able to use more than one CPU.
+	 *
+	 * To prevent a kexec kernel from onlining secondary CPUs invalidate the
+	 * mailbox address in the ACPI MADT wakeup structure which prevents a
+	 * kexec kernel to use it.
+	 *
+	 * This is safe as the booting kernel has the mailbox address cached
+	 * already and acpi_wakeup_cpu() uses the cached value to bring up the
+	 * secondary CPUs.
+	 *
+	 * Note: This is a Linux specific convention and not covered by the
+	 *       ACPI specification.
+	 */
+	mp_wake->mailbox_address = 0;
+}
+
 int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
 			      const unsigned long end)
 {
@@ -77,7 +104,7 @@ int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
 
 	acpi_mp_wake_mailbox_paddr = mp_wake->mailbox_address;
 
-	cpu_hotplug_disable_offlining();
+	acpi_mp_disable_offlining(mp_wake);
 
 	apic_update_callback(wakeup_secondary_cpu_64, acpi_wakeup_cpu);
 
-- 
2.43.0

