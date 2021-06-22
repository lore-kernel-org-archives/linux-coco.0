Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B9A173
	for <linux-coco@lists.linux.dev>; Tue, 22 Jun 2021 14:48:49 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de [79.242.186.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id 0A56D133;
	Tue, 22 Jun 2021 16:48:41 +0200 (CEST)
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
Subject: [PATCH 0/3] x86/sev: Minor updates for SEV guest support
Date: Tue, 22 Jun 2021 16:48:22 +0200
Message-Id: <20210622144825.27588-1-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

Hi,

here are three small patches to update SEV-ES guest support in Linux.
It would be great to have at least patch 3 merged for v5.14 to avoid
future merge conflicts. It contains defines needed by KVM and X86
patches under development.

Thanks,

	Joerg

Brijesh Singh (1):
  x86/sev: Add defines for GHCB version 2 MSR protocol requests

Joerg Roedel (2):
  x86/sev: Add Comments to existing GHCB MSR protocol defines
  x86/sev: Use "SEV: " prefix for messages from sev.c

 arch/x86/include/asm/sev-common.h | 17 +++++++++++++++++
 arch/x86/kernel/sev.c             |  2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)


base-commit: be1a5408868af341f61f93c191b5e346ee88c82a
-- 
2.31.1

