Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24732107
	for <linux-coco@lists.linux.dev>; Thu, 12 Jan 2023 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673518461; x=1705054461;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lSP+h+laxvUqeKdHg46PtrH3Xip8ADgfReT4ZBovqNw=;
  b=nUl481HWo1GkYrvQN8+kULqDxhlkDCVWNcVYgp4MIUIW51m8Sd0P8fUt
   hoc5dZtonykxfmtPaoPrinsOg1OiG+2moNL3FVIVKYMdVK5g2Y4xHRSXK
   iw6wLH8cN3v/8j62nfJHThs3GgZCERK3Hp0egZYUjpqhUQ8Du6UjzQsGu
   RElXj7v0lmXMDqgmnogbommRqEhILdnzCAxbWNfC9BWs0ZLyGkuxikC3u
   dGJ4DRD+6elkbdBw0bYnXOucTDuXLSet3GRJvoqG4vrKkNJ0PJfTyf4mf
   nmrL+swR+QsR1n1Dz2tCh8QAoUjiqdzx0gOs+cZS9Hd8m6k0fGBia6wCj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350892150"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="350892150"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 02:14:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="659722891"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="659722891"
Received: from glieseu-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.52.1])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 02:14:16 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 76330109AF0; Thu, 12 Jan 2023 13:14:13 +0300 (+03)
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
Subject: [PATCHv2 0/7] x86/tdx: Changes for TDX guest initialization
Date: Thu, 12 Jan 2023 13:14:00 +0300
Message-Id: <20230112101407.24327-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.38.2
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

v2:
 - Split the first patch;
 - Intoduce is_private_gpa();
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
2.38.2

