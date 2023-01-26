Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE7B28EC
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 22:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674772204; x=1706308204;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YX8QAiiXUItRHweILuMEEYUWmvws790j6lQ7xYB5yyE=;
  b=L2+ViBa7VEW861kOD0EgcAFjVZJmMfllqrIcQpZbSyFC/kr95IwzG+T9
   EC7M0huPaj61fjxWxFqqvI9RV3AzKiJMDk9l7jphggDPfaHiqBlDC4fiM
   Wr41mYcmAnPzR72GExPfLTCmtfGRPdiLM4QANdX7IdpZJpYjno9djMhBy
   xS1hX+xBoLjjRkyEKYkNYNTycxsqdBNGB1pOqX6bQrjcFUL5l9azB+vcq
   c4tb2fnB/aUYNyZp8mZ6X8UsNMOoWaTczlaY3vboOdQX19MT1dMhoFZ7u
   bHryiwLLf795MEru8Od1cNeJI/e9C4wBosVnFpfV4Ooe624qw1NIs+R91
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="389342070"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="389342070"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="751770915"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="751770915"
Received: from smadjatx-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.210.179])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:06 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 4241610DB5B; Fri, 27 Jan 2023 01:12:03 +0300 (+03)
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
Subject: [PATCHv2, RESEND 0/7] x86/tdx: Changes for TDX guest initialization
Date: Fri, 27 Jan 2023 01:11:52 +0300
Message-Id: <20230126221159.8635-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resend v2 of the patchset. I believe it is ready to be applied. Changes
are pretty straight-forward and got tested properly (famous last words).

Changes to __tdx_hypercall() are also required for Hyper-V TDX guest
enabling.

Several changes to TDX initialization:

- Make early panic message visible to user;

- Relax SEPT_VE_DISABLE for debug TD. It helps to investigate bugs
  resulting in access of unaccepted memory.

- Make sure NOTIFY_ENABLES is off to eliminate possible source of random
  #VE.

The patchset makes use of ReportFatalError TDVMCALL. The definition of
the TDVMCALL has changed in recent GHCI update[1].

v2:
 - Split the first patch;
 - Introduce is_private_gpa();
 - Apply Reviewed-by from Dave;

Kirill A. Shutemov (7):
  x86/tdx: Fix typo in comment in __tdx_hypercall()
  x86/tdx: Add more registers to struct tdx_hypercall_args
  x86/tdx: Refactor __tdx_hypercall() to allow pass down more arguments
  x86/tdx: Expand __tdx_hypercall() to handle more arguments
  x86/tdx: Use ReportFatalError to report missing SEPT_VE_DISABLE
  x86/tdx: Relax SEPT_VE_DISABLE check for debug TD
  x86/tdx: Disable NOTIFY_ENABLES

 arch/x86/coco/tdx/tdcall.S        | 83 ++++++++++++++++++++++---------
 arch/x86/coco/tdx/tdx.c           | 62 ++++++++++++++++++++++-
 arch/x86/include/asm/shared/tdx.h |  6 +++
 arch/x86/kernel/asm-offsets.c     |  6 +++
 4 files changed, 131 insertions(+), 26 deletions(-)

-- 
2.39.1

