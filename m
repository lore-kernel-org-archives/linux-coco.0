Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569AF2CAB
	for <linux-coco@lists.linux.dev>; Fri,  9 Dec 2022 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670592339; x=1702128339;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BSrPUYonGntiTXzc7J4wwmhKstgGiqEhA6jFvc+d+NI=;
  b=k07xX0gUyWCS3jH5YwuxrwlSCzBd0yVQQEzGT7av9MorFRE3yJqJOT2j
   wxyGI+jMimUeG8bhRui/i8IVv8YPCFMocsrNEFJ3CxbITN8yNOmF50cU1
   EE7ARDgpjjYsBblpMM0tKQDxUtbNJH1ziZ5uepHoofRWVNKTo8tLiC3eF
   vlG1cs4zd64cvV2iljCxI8jyGiQetK8Lyj/0pZ/5ffFI220Oh/OuFTgXt
   beHHoHSQjiI25IvOEarJHOUTPB1mE1ox3kYIEYnnqmjWvxuog6fLeJ8hD
   vaWL+wSjJDWhVJ3JQvQCzZwDUQW7+7j65o/htkZKR/8evShME+xI3Rhjb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="317483318"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="317483318"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 05:25:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="892670382"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="892670382"
Received: from elinares-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.38.98])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 05:25:33 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 3AACD109CE2; Fri,  9 Dec 2022 16:25:31 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Elena Reshetova <elena.reshetova@intel.com>,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 0/4] x86/tdx: Changes for TDX guest initialization
Date: Fri,  9 Dec 2022 16:25:20 +0300
Message-Id: <20221209132524.20200-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several changes to TDX initialization:

- Make early panic message visible to user;

- Relax SEPT_VE_DISABLE for debug TD. It helps to investigate bugs
  resulting in access of unaccepted memory.

- Make sure NOTIFY_ENABLES is off to eliminate possible source of random
  #VE.

The patchset makes use of ReportFatalError TDVMCALL. The definition of
the TDVMCALL has changed in recent GHCI update[1]. It now requires more
arguments handled by __tdx_hypercall(). The patch that expands
__tdx_hypercall() is the same as the patch included in TDX guest
enabling for Hyper-V.

[1] https://cdrdv2.intel.com/v1/dl/getContent/726790

Kirill A. Shutemov (4):
  x86/tdx: Expand __tdx_hypercall() to handle more arguments
  x86/tdx: Use ReportFatalError to report missing SEPT_VE_DISABLE
  x86/tdx: Relax SEPT_VE_DISABLE check for debug TD
  x86/tdx: Disable NOTIFY_ENABLES

 arch/x86/coco/tdx/tdcall.S        | 82 ++++++++++++++++++++++---------
 arch/x86/coco/tdx/tdx.c           | 57 ++++++++++++++++++++-
 arch/x86/include/asm/shared/tdx.h |  6 +++
 arch/x86/kernel/asm-offsets.c     |  6 +++
 4 files changed, 125 insertions(+), 26 deletions(-)

-- 
2.38.0

