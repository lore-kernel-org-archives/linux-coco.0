Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB46159575
	for <linux-coco@lists.linux.dev>; Tue, 27 Feb 2024 21:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709069119; cv=none; b=ODQKNZhEZAhUsyMxxaL96DOvUYsoxoAiGMqFPKTP3mOA2oKyzYvCacGQNJxLYVVN8sb5JyRT+HrIqPApJmlmEYkagqIX5M8pmMNX5lpni3QKaJN5dOgjql9N2QpHEAVPf10AHKAwVvRpk8g9YlgGkulNhTcEoDoM0onPPvwLY6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709069119; c=relaxed/simple;
	bh=210lCphqYKumbsSKrHahIq5zl6lhgbzI8RmOuXqd25g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UVTCFa/l2mgIOGn3vePyXvdi21XDXk3hzkQuIpQgtABeDXOlXa6roXW7UEp4JbiDHdqSbzXokKBqlplEZQ8rLva/a0jt+COI20OGFeHE5QB17V8ZRo9cSjodUA8gBvbwJHYm9TutLX+NwWwbg6gedhkREnYd32bllAZESdD60Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m72Qpcli; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m72Qpcli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709069118; x=1740605118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=210lCphqYKumbsSKrHahIq5zl6lhgbzI8RmOuXqd25g=;
  b=m72QpclinxbP5ePxbP/Dscc0c9VkvMMm2T7/8s/HSTG5I5pot6HEVQIZ
   iqGjJFad1uvf6IAW29/HKAZGI+jhdXBNulNLYB+/dXZmRTRhYcYGt4/Ae
   fCfFSkYdZRO/7xCrgdDhSlpBx0cmw1quVmUebTjM9YBhj/fkJF07r671N
   Mhzy4CG3v3U0jTGHD/H/rXYp4h2PFhfxCJLSCjh1vmHlA5vuxEouYjPcK
   wW4TDfjhCMk/urSAlX8Ca1B1D6RZlTRrcUQp2YC5LImR0eDQaBC3/lEfQ
   PbyInx5qcdLiYmOahAsTYU6RzZmEfTajp0uw7nQRnUxkpZe1o4+FYKwp7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3567082"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3567082"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 13:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="937032929"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="937032929"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2024 13:25:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id C91C61210; Tue, 27 Feb 2024 23:24:56 +0200 (EET)
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
Subject: [PATCHv8 17/17] ACPI: tables: Print MULTIPROC_WAKEUP when MADT is parsed
Date: Tue, 27 Feb 2024 23:24:52 +0200
Message-ID: <20240227212452.3228893-18-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227212452.3228893-1-kirill.shutemov@linux.intel.com>
References: <20240227212452.3228893-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When MADT is parsed, print MULTIPROC_WAKEUP information:

ACPI: MP Wakeup (version[1], mailbox[0x7fffd000], reset[0x7fffe068])

This debug information will be very helpful during bring up.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Baoquan He <bhe@redhat.com>
---
 drivers/acpi/tables.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index b07f7d091d13..c59a3617bca7 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -198,6 +198,20 @@ void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
 		}
 		break;
 
+	case ACPI_MADT_TYPE_MULTIPROC_WAKEUP:
+		{
+			struct acpi_madt_multiproc_wakeup *p =
+				(struct acpi_madt_multiproc_wakeup *)header;
+			u64 reset_vector = 0;
+
+			if (p->version >= ACPI_MADT_MP_WAKEUP_VERSION_V1)
+				reset_vector = p->reset_vector;
+
+			pr_debug("MP Wakeup (version[%d], mailbox[%#llx], reset[%#llx])\n",
+				 p->version, p->mailbox_address, reset_vector);
+		}
+		break;
+
 	case ACPI_MADT_TYPE_CORE_PIC:
 		{
 			struct acpi_madt_core_pic *p = (struct acpi_madt_core_pic *)header;
-- 
2.43.0

