Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9330ABA31
	for <linux-coco@lists.linux.dev>; Mon, 13 Feb 2023 23:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676332129; x=1707868129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yDoVpTAUfuRLKHuvAYJkruKvIjru3gmVTwuDctec5C8=;
  b=CSJRnkDpnb3DQ8a5puUCnCsCsMbESMZPLxJrwLRjvTd+x9q4unR6pm+/
   tPpzyPnDgUAkulDSj0ZD3SUeXHwdwGsBr//ZKa1Aa4Tmue/UDEv+tP4cw
   PuHH8TxnNzfjn3G2aNQQ551QJliOFvuB+ta1rbwemirRCKh90MOgKHA13
   w2IgVKM/VcZqWlw+WQZ5KV/ojprND8bk2tEasfeEjxSwPOh5YftRfxTeU
   cSM5CsCDlBokq9wYNdBlxV+wi+TrQJ7c26KQg0PX8wjI0FacxlT6tv28H
   ZPB324cwgd6tK47/x+B82BGR8wFWU/kXcQR3i/EIRj1bdoNTNWsMW2kEs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="329658416"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="329658416"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 15:48:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="668965311"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="668965311"
Received: from iannetti-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.49.216])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 15:48:46 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 5BB7810CA33; Tue, 14 Feb 2023 02:48:43 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 0/2] Kexec enabling in TDX guest
Date: Tue, 14 Feb 2023 02:48:34 +0300
Message-Id: <20230213234836.3683-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch brings basic enabling of kexec in TDX guests.

By "basic enabling" I mean, kexec in the guests with a single CPU.
TDX guests use ACPI MADT MPWK to bring up secondary CPUs. The mechanism
doesn't allow to put a CPU back offline if it has woken up.

We are looking into this, but it might take time.

Kirill A. Shutemov (2):
  x86/kexec: Preserve CR4.MCE during kexec
  x86/tdx: Convert shared memory back to private on kexec

 arch/x86/coco/tdx/Makefile           |  1 +
 arch/x86/coco/tdx/kexec.c            | 82 ++++++++++++++++++++++++++++
 arch/x86/include/asm/tdx.h           |  4 ++
 arch/x86/kernel/machine_kexec_64.c   |  2 +
 arch/x86/kernel/relocate_kernel_64.S |  6 +-
 5 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 arch/x86/coco/tdx/kexec.c

-- 
2.39.1

