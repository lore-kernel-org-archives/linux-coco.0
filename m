Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D548A14A4C8
	for <linux-coco@lists.linux.dev>; Mon, 25 Mar 2024 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711363219; cv=none; b=uXmnI5fJPn5EZPw3ecziz3vGJUfn/wDkHzHszyGKAQuosH3tg9clv9ryJySdqiOSH4ZK3ghUgngSztrXivydTf8R01k4iAPYeIShy51dDVlzZdtyHciDK94tmCboL4DTxyEZ5QTK6xV8Cs74G58wxDHfC7iFSLuwC/REyY5n9GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711363219; c=relaxed/simple;
	bh=4OahAA5tbkCWt5kWDDzHkciJDRb/0EhPa8AF3hktH9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=knRDTXLE0N7Zucy0k+PhcQNkNOCZdysTi0DZr+Mni0IGfiEzIH+COsAHhAgRQ2hFNLtwN8QOl31/M8ex1oK/BzgTgrF6VOTLDdr950boF81GRS5SectaSimGYXActjcUh5SQXvR+qdwqr9BieaRD6+krDm5rmRgnTdWL+U02Iaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iByEruk5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iByEruk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711363218; x=1742899218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4OahAA5tbkCWt5kWDDzHkciJDRb/0EhPa8AF3hktH9I=;
  b=iByEruk5saeg9EfAE2ePus6Oyc67gYlYSRKm3CTBw7CPvVjvBpmZuuG8
   jsN39PmA3WXCJSsMSzdXZ5FiKT2rJ9Sso0Y+KPYJCXlGPzgwRrM6ubkNl
   I5dJeKeB6P59Lh/XLKm+By3a+U99M2Rz3y1w8GWXX/TYh6IwqZqgtTfA8
   t6AnnNE64nwTJjtLb5fDi/A8ojkAnZlmpktVWHF1i2Ef5nFA/AP+/qyt6
   NhooELmyOZZRd4xnZGnHX0adyim2i6PkTOED6vPoUn5qIW/TVxBHNUCbx
   erPM9eQiiGxJojjKkrcovBQgiwi9qwj+3me8dejEf+O5B8RHT7hriiN0v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6561391"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6561391"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 03:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="937070155"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="937070155"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2024 03:40:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 97035F4F; Mon, 25 Mar 2024 12:40:05 +0200 (EET)
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
Subject: [PATCHv9 13/17] x86/acpi: Do not attempt to bring up secondary CPUs in kexec case
Date: Mon, 25 Mar 2024 12:39:07 +0200
Message-ID: <20240325103911.2651793-14-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325103911.2651793-1-kirill.shutemov@linux.intel.com>
References: <20240325103911.2651793-1-kirill.shutemov@linux.intel.com>
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

