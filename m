Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D2916EBF6
	for <linux-coco@lists.linux.dev>; Tue, 28 May 2024 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716890160; cv=none; b=BlHKx+VnGtY/NR3ZsoNYE3Bg7VaaMXQqcIKxpbF8DpR5JU4S1lyfQjdz4oAio7Q7FCaEYpJqg3TpaovNmc0z65dygldsgWbBSNueT7/zIRq78FVJQ8s9aq7jCjedvkJhhhv9vKHoQUWGPNhZh4Qst3UAMqo4pXQY0TjKfYm/nM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716890160; c=relaxed/simple;
	bh=pNTsKqVQk55IiCN9cveVl7AHQE6wlgXgaA9ysVM35AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/JhrbS+bk1MJESExtXt8cuuDkhf2DfjOmPQLjxw2f2cS03AXi9iEzgHRJYkb2Dq4al1bRavhtkjVzOqbvJDtocY1+PhVY8fYFdiWjc+mb/7nx+JcyXg4BQ4jFVt+OsbW8n25I8utDv68t/CCVlnTiHsA2sr9IbUMvQkP2A4lvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzOxkUTL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzOxkUTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716890159; x=1748426159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pNTsKqVQk55IiCN9cveVl7AHQE6wlgXgaA9ysVM35AI=;
  b=BzOxkUTLVJUijhUth4jIhJosWKFOlkx44Oez2FwWyXGTLWUDekfb9nB2
   DKlqFeovzSsPvv/XLS4kNXYgveMnOTQKjqFwLyX4R8JM9Mhgptx0C7L4a
   y8vA3cwWcTQNiNHoGca3u99+axYrU4J+eBTTjXdgDL60MTETaX9tfxyR7
   DPMVFQ26qKO9I6vrEkOWqEIPwP7wuybL8lUrvhdK2dgIIDjRXqNuJdLeY
   KtkLnuumeI3+FQ9nrOmypQMIl/SSQShnxRImf0d5fMUR0EpPr6fZLOdmp
   TLMzI/TG0W4aSDsHhuN7NySAoYToV+1I6mrnzv/Gn6E4UuB1DwO+jUXxy
   w==;
X-CSE-ConnectionGUID: C1n9xsNTS0SxfElvZFqqjA==
X-CSE-MsgGUID: BaGSm9QNRCCLBakFXCzp9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13172236"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13172236"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 02:55:41 -0700
X-CSE-ConnectionGUID: zDIPCTM4R9OY5MQtlQjkcQ==
X-CSE-MsgGUID: po0/KbjLRleRGWauHTotJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="39984759"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2024 02:55:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id F164E909; Tue, 28 May 2024 12:55:26 +0300 (EEST)
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
Subject: [PATCHv11 14/19] x86/acpi: Rename fields in acpi_madt_multiproc_wakeup structure
Date: Tue, 28 May 2024 12:55:17 +0300
Message-ID: <20240528095522.509667-15-kirill.shutemov@linux.intel.com>
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

In order to support MADT wakeup structure version 1, provide more
appropriate names for the fields in the structure.

Rename 'mailbox_version' to 'version'. This field signifies the version
of the structure and the related protocols, rather than the version of
the mailbox. This field has not been utilized in the code thus far.

Rename 'base_address' to 'mailbox_address' to clarify the kind of
address it represents. In version 1, the structure includes the reset
vector address. Clear and distinct naming helps to prevent any
confusion.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Tao Liu <ltao@redhat.com>
---
 arch/x86/kernel/acpi/madt_wakeup.c | 2 +-
 include/acpi/actbl2.h              | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/acpi/madt_wakeup.c b/arch/x86/kernel/acpi/madt_wakeup.c
index d222be8d7a07..004801b9b151 100644
--- a/arch/x86/kernel/acpi/madt_wakeup.c
+++ b/arch/x86/kernel/acpi/madt_wakeup.c
@@ -75,7 +75,7 @@ int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
 
 	acpi_table_print_madt_entry(&header->common);
 
-	acpi_mp_wake_mailbox_paddr = mp_wake->base_address;
+	acpi_mp_wake_mailbox_paddr = mp_wake->mailbox_address;
 
 	cpu_hotplug_disable_offlining();
 
diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index ae747c89d92c..fa63362469aa 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -1194,9 +1194,9 @@ struct acpi_madt_generic_translator {
 
 struct acpi_madt_multiproc_wakeup {
 	struct acpi_subtable_header header;
-	u16 mailbox_version;
+	u16 version;
 	u32 reserved;		/* reserved - must be zero */
-	u64 base_address;
+	u64 mailbox_address;
 };
 
 #define ACPI_MULTIPROC_WAKEUP_MB_OS_SIZE        2032
-- 
2.43.0

