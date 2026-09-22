Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E3C4AA588
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 20:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108439; cv=none; b=phwHA4Uep/PBJ5j4D9+xKZm7J0Y+TepCp2d01e9LqhojPz6iNXTEO8Q9OfXRrjNQ++rtK19Oj2eghubGH3iVaU9zJCRsW7qa2WI7ok3+z5L0wWATDYeWTTN+FAOsS2KykSrDq/WUdZROBy54JD6k7peKhpG8/vg6sKebJmjEs+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108439; c=relaxed/simple;
	bh=eK2gYyjxU23XzTBH3YL1DD+OSCsdTj6l4nJL5/iHABo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l3MqfGi/9CC6J0cJHPeDBTnkpGqRrAmoLOc7mAkF+WDFAdDFUoCUtRO0iMDaPKaWq03klGrEQ3ZvRUBcUZ2Q57iHPKIjxAbbfoJD3p477QziyUQlIPeJxrz7dp96/FYBjSnZ6wVmY4G7Ns5wem7S2HcV69ODudFUGQU6ZA2rnPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fx3vqD2n; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fx3vqD2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790108434; x=1821644434;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=eK2gYyjxU23XzTBH3YL1DD+OSCsdTj6l4nJL5/iHABo=;
  b=fx3vqD2nRVSidG7dk3404tkxFRncQBC+qIPf2cvHdNsm6ePUiu+fqXmk
   o97TSMzRJAnHji8xef13IOdwMJvXA08M6/Vy/clgy4KycBsf5WI6evOoo
   pRob/Zs52tnSVm0zUvtsgu+LGiwcdz93HS4P1I9gG9sLEYkKEakzS6GY2
   7dnQBNGsnaFqfJGN+BI/OLfD0zH4NqADtvguVRxnis1HPOvfUK9yJh9dP
   E/rO2hSEvNzR90+y4nFs9MbG7suWn6KMTRwx1t4Zg6vg2/zXZC9KkKQ10
   uyEDxlNzlrSHzxOadwsQMVLarc6JoJ74s4N+znaJbpv6OVDigcewp4H+y
   A==;
X-CSE-ConnectionGUID: vU1bPBFdTmCbzY3NUug5YQ==
X-CSE-MsgGUID: uP1Mm5QETvqWqu+HnHV7rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101340425"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="101340425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 13:20:29 -0700
X-CSE-ConnectionGUID: ceG/PYNtTSSY/tomv9xkEw==
X-CSE-MsgGUID: XkHSb4+TRwKwgRfutnN8DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="269799188"
Received: from vverma7-desk1.amr.corp.intel.com (HELO [192.168.1.200]) ([10.125.110.60])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 13:20:28 -0700
From: Vishal Verma <vishal.l.verma@intel.com>
Subject: [PATCH v3 0/2] x86/tdx: Use TDVMCALLs directly for earlyprintk
Date: Tue, 22 Sep 2026 14:20:05 -0600
Message-Id: <20260922-b4-tdx_earlyprintk_tdcalls-v3-0-6ebaa599df10@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrq3pDGjElfcwhrR0KlUE0lYCI
 dzdgi5YsXyZyfePzJOz5NllNzJHnfW2qeNI9jtWlLJ+ELc6boYCTyITCVcpD7rPSbpqaJ2twys
 PupBV5XkqNCgEeVYSWQRaR8b2C367/7b/qCcVYRbnj9L60LhhqXcw//1DILZCHXDBU4UKlMmEA
 HWNZ6oORfNmc6jDFYWwSWGkpAajKTF4NHpNTdP0BekEllEhAQAA
X-Change-ID: 20260903-b4-tdx_earlyprintk_tdcalls-40d1b21a8ba2
To: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
 Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
 kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vishal Verma <vishal.l.verma@intel.com>
X-Mailer: b4 0.16-dev-62088
X-Developer-Signature: v=1; a=openpgp-sha256; l=2546;
 i=vishal.l.verma@intel.com; h=from:subject:message-id;
 bh=eK2gYyjxU23XzTBH3YL1DD+OSCsdTj6l4nJL5/iHABo=;
 b=owGbwMvMwCXGf25diOft7jLG02pJDFmbHnO/2FpVUrUw6kXpn2OPJp7UW8rMNMFD2vrM96yHh
 jtLez/Hd5SyMIhxMciKKbL83fOR8Zjc9nyewARHmDmsTCBDGLg4BWAi700YGTpljHzF5ggu8zk9
 Z238TdYWvZxHvbzpR19P8btr2pO8ai4jw2/Ga6VbPJJEGJb+vbo2y/Lewfv60SpB7x74XNaQDd/
 0gRMA
X-Developer-Key: i=vishal.l.verma@intel.com; a=openpgp;
 fpr=F8682BE134C67A12332A2ED07AFA61BEA3B84DFF

Background
==========

TDX guests have early_printk support, but it is through a roundabout way
using a #VE exception as a functional mechanism. The exception handler
has to use TDG.VP.VEINFO.GET to find out what faulted, and then issue
the TDVMCALL. Simplify this by using a TDVMCALL from the guest which can
directly perform the port I/O.

Patch details
=============

Patch 1 is a prep patch that moves the port I/O direction constants to
arch/x86/include/asm/shared/tdx.h.

Patch 2: Add a new earlyprintk=tdx option, which calls the new tdx_inb()
/ tdx_outb() helpers to perform the port I/O directly using TDVMCALLs.

The serial earlyprintk path is left as is - TD guests using this will
still take a #VE exception, and the exception handler will perform the
I/O.

Testing
=======

Added a counter for the number of COM1 port I/O #VEs handled:

  no earlyprintk     -  ~63000
  earlyprintk=ttyS0  -  ~61000
  earlyprintk=tdx    -  ~35000

The new tdx option nearly halves the number of #VEs handled.

Additionally, ran the usual suite of CI testing, which covers KVM self
tests, KVM unit tests, and Avocado KVM tests without any regressions.

Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
---
Changes in v3:
- Drop the ttySN and baudrate option parsing for earlyprintk=tdx (Dave Hansen)
- Link to v2: https://patch.msgid.link/20260921-b4-tdx_earlyprintk_tdcalls-v2-0-ad1fde3f25fd@intel.com

Changes in v2:
- Rebase to v7.3-rc4
- Move the TDX hypercall helpers into coco/tdx/tdx.c (Kiryl)
- Add a new earlyprintk=tdx option that implements the direct TDVMCALL
  path (Dave Hansen)
- Link to v1: https://patch.msgid.link/20260910-b4-tdx_earlyprintk_tdcalls-v1-0-4b2b1bf9001b@intel.com

---
Vishal Verma (2):
      x86/tdx: Move port I/O definitions to a shared header
      x86/early_printk: Add earlyprintk=tdx to drive the UART with TDVMCALLs

 Documentation/admin-guide/kernel-parameters.txt |  9 +++++
 arch/x86/include/asm/shared/tdx.h               |  6 ++++
 arch/x86/include/asm/tdx.h                      |  3 ++
 arch/x86/boot/compressed/tdx.c                  |  4 +--
 arch/x86/coco/tdx/tdx.c                         | 47 +++++++++++++++++++++----
 arch/x86/kernel/early_printk.c                  | 41 +++++++++++++++++++++
 6 files changed, 102 insertions(+), 8 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260903-b4-tdx_earlyprintk_tdcalls-40d1b21a8ba2

Best regards,
--  
Vishal Verma <vishal.l.verma@intel.com>

