Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659483A8EC
	for <linux-coco@lists.linux.dev>; Mon, 12 Feb 2024 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707734711; cv=none; b=l9bk9qEHlhgSsuQHPG5xwJoS4wBS/kZUu2DjaCoeIoZkdGuLafFxjuWp9ZD6cuFyLvB/AS1Ry9WDAkVZ2660sA7YIwc2hgcDrEBoMY17KFufOCc1PIuTGct/BqStghaix6z/Ge+kzMFqKI+Itd6a0YgrOMUkEQKurCjQ8m3+0v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707734711; c=relaxed/simple;
	bh=Z3vEItFOpb/ayuVNTPFqaC8pjBMvLFGfG4ld+bFARLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abzYJ0bun/+E+AGzIc5NDZAVD5tMhrimDTW+zxwYAtCvSzitU1PAHAs69xMSlzXOVmTjKUxNwqmZKLXc8e9CQhp9wad4Yulhl2agwqEiwJ11orfVgodG+041GMfGp21Hdo+AYC6a4ggAP7lmgamYLB38FSgsAIGmJS9BC1mWGPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSa8EAMv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSa8EAMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707734708; x=1739270708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z3vEItFOpb/ayuVNTPFqaC8pjBMvLFGfG4ld+bFARLw=;
  b=dSa8EAMvPAU+1tfaTzCKGBm1ZpfQ4caZEe3kJT7rZrQlIpNxgoppw/eL
   rmSXS7yTeSJb8LNun1SdsmrmT1dG33CtSX06atesMnB9GHKsaMllRu6Oy
   2lr/gW2ffBKZBv/dLBOguiZuQFpYZWGreJgYsgahdrZ4f1aGwzVpLYR7M
   XX5zqBIs64h5alxVAzwFp548KzyjlH/uR8WG24QBRcAYNPQl8yI2CcCbe
   9UcbbgaNian8jjvLVOuPEgcaSz9GpQXik49WK31Kd8aI/ABMeb26W23G/
   wdv7pccw4Mrp3bzx6psfby3LjcdWOMin75rMMUAWKCrtwFqA8Z6WsLb6O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1585093"
X-IronPort-AV: E=Sophos;i="6.05,263,1701158400"; 
   d="scan'208";a="1585093"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 02:45:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="935035608"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="935035608"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2024 02:45:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 8994A682; Mon, 12 Feb 2024 12:44:53 +0200 (EET)
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
Subject: [PATCHv7 12/16] x86/acpi: Rename fields in acpi_madt_multiproc_wakeup structure
Date: Mon, 12 Feb 2024 12:44:44 +0200
Message-ID: <20240212104448.2589568-13-kirill.shutemov@linux.intel.com>
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

To prepare for the addition of support for MADT wakeup structure version
1, it is necessary to provide more appropriate names for the fields in
the structure.

The field 'mailbox_version' renamed as 'version'. This field signifies
the version of the structure and the related protocols, rather than the
version of the mailbox. This field has not been utilized in the code
thus far.

The field 'base_address' renamed as 'mailbox_address' to clarify the
kind of address it represents. In version 1, the structure includes the
reset vector address. Clear and distinct naming helps to prevent any
confusion.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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
index 9775384d61c6..e1a395af7591 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -1117,9 +1117,9 @@ struct acpi_madt_generic_translator {
 
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

