Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A30471
	for <linux-coco@lists.linux.dev>; Wed, 16 Jun 2021 18:49:38 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de [79.242.186.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id D826B22A;
	Wed, 16 Jun 2021 20:49:30 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Cc: Joerg Roedel <joro@8bytes.org>,
	Joerg Roedel <jroedel@suse.de>,
	hpa@zytor.com,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Jiri Slaby <jslaby@suse.cz>,
	Dan Williams <dan.j.williams@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Juergen Gross <jgross@suse.com>,
	Kees Cook <keescook@chromium.org>,
	David Rientjes <rientjes@google.com>,
	Cfir Cohen <cfir@google.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mike Stunes <mstunes@vmware.com>,
	Sean Christopherson <seanjc@google.com>,
	Martin Radev <martin.b.radev@gmail.com>,
	Arvind Sankar <nivedita@alum.mit.edu>,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v6 0/2] x86/sev: Fixes for SEV-ES Guest Support
Date: Wed, 16 Jun 2021 20:49:11 +0200
Message-Id: <20210616184913.13064-1-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

Hi,

here are the remainig patches in my queue for SEV-ES guest support.
Changes to the previous version are:

	- Rebased to tip/x86/sev
	- Merged Boris' diff to patch 1 and fixed two minor issues in
	  the result

The patches are again tested with a kernel with various debuggin
options enabled, running as an SEV-ES guest.

The previous version of these patches can be found here:

	https://lore.kernel.org/lkml/20210614135327.9921-1-joro@8bytes.org/

Please review.

Thanks,

	Joerg

Joerg Roedel (2):
  x86/sev: Make sure IRQs are disabled while GHCB is active
  x86/sev: Split up runtime #VC handler for correct state tracking

 arch/x86/entry/entry_64.S       |   4 +-
 arch/x86/include/asm/idtentry.h |  29 ++---
 arch/x86/kernel/sev.c           | 180 +++++++++++++++++++-------------
 3 files changed, 119 insertions(+), 94 deletions(-)


base-commit: 07570cef5e5c3fcec40f82a9075abb4c1da63319
-- 
2.31.1

