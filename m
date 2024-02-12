Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6192038F91
	for <linux-coco@lists.linux.dev>; Mon, 12 Feb 2024 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707734701; cv=none; b=MFYGy0vHxbJRp6oZjjuaLI6spzG13eZeEbIN422HoCqLAjZoPhhit0CLpLZ/0VxHdq8ixcaMnebYbSfeAlhW6oBiYr+iRLZaNBjynvMdqfdiy7inMngnwMJF/EK2Y/yY5Wi2IUBGj7bbNfKvoMt+5foit2r0oiMdpfujt/0W+HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707734701; c=relaxed/simple;
	bh=S6F/Ky7eP00etA13aVi6LSez70wEvbCqE2JWP4lJSJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peFH9dQbG8wF+R8Mon3O5EBnJUnjFJCLn+Y44xblxYh4WDvbTr5LmbN4nHlHdKfeL2oWi8h0HwoyRuYd/EbqZWEv6wnZ/Lv2HQzB7LSE4xS/tfpUuH+KyAebteG5tsBWqzAN1ZyvhhDL2lGD1hgkJLfkvR1rassNZalZCMa/rbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdEO106k; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdEO106k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707734699; x=1739270699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S6F/Ky7eP00etA13aVi6LSez70wEvbCqE2JWP4lJSJ4=;
  b=gdEO106kRv1AkCxPfqVGoZ661OQJQZ9i1XHS6w4q2B3RFcr+GenWykBO
   x5/x4En2rlLJxWhZR44oSv8kMYRmwfYG+vxwTBxkZ9RipInFd3Je0UxxN
   WgQlfdLtW7319IMgDsn6iGytUU8lsTBTpL+81QBE67f5QytbhWCWANfZo
   rfjUPqjoRqr8Gpp0ezJeE08FMemKe3/CYmkWV0ZydoajwdqfSMA9bzOLh
   OkNqRs2iCqK/omXyySUDfPynsaIV71CHH3HhNP6nUy8vuxjjpf32V35QR
   T/bg7F1W/WfxhqOCId8E1Cjmn7y5+6KAaH7Oq7RsNvq/4ds/fc1geUuF7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1584997"
X-IronPort-AV: E=Sophos;i="6.05,263,1701158400"; 
   d="scan'208";a="1584997"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 02:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="935035575"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="935035575"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2024 02:44:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 013BE468; Mon, 12 Feb 2024 12:44:52 +0200 (EET)
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
Subject: [PATCHv7 02/16] x86/apic: Mark acpi_mp_wake_* variables as __ro_after_init
Date: Mon, 12 Feb 2024 12:44:34 +0200
Message-ID: <20240212104448.2589568-3-kirill.shutemov@linux.intel.com>
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

acpi_mp_wake_mailbox_paddr and acpi_mp_wake_mailbox initialized once
during ACPI MADT init and never changed.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/kernel/acpi/madt_wakeup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/acpi/madt_wakeup.c b/arch/x86/kernel/acpi/madt_wakeup.c
index 7f164d38bd0b..cf79ea6f3007 100644
--- a/arch/x86/kernel/acpi/madt_wakeup.c
+++ b/arch/x86/kernel/acpi/madt_wakeup.c
@@ -6,10 +6,10 @@
 #include <asm/processor.h>
 
 /* Physical address of the Multiprocessor Wakeup Structure mailbox */
-static u64 acpi_mp_wake_mailbox_paddr;
+static u64 acpi_mp_wake_mailbox_paddr __ro_after_init;
 
 /* Virtual address of the Multiprocessor Wakeup Structure mailbox */
-static struct acpi_madt_multiproc_wakeup_mailbox *acpi_mp_wake_mailbox;
+static struct acpi_madt_multiproc_wakeup_mailbox *acpi_mp_wake_mailbox __ro_after_init;
 
 static int acpi_wakeup_cpu(u32 apicid, unsigned long start_ip)
 {
-- 
2.43.0

