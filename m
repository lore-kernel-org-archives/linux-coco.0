Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3012FB4
	for <linux-coco@lists.linux.dev>; Tue, 22 Jun 2021 14:48:51 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de [79.242.186.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id 070142DF;
	Tue, 22 Jun 2021 16:48:43 +0200 (CEST)
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
Subject: [PATCH 3/3] x86/sev: Use "SEV: " prefix for messages from sev.c
Date: Tue, 22 Jun 2021 16:48:25 +0200
Message-Id: <20210622144825.27588-4-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622144825.27588-1-joro@8bytes.org>
References: <20210622144825.27588-1-joro@8bytes.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

The source file has been renamed froms sev-es.c to sev.c, but the
messages are still prefixed with "SEV-ES: ". Change that to "SEV: " to
make it consistent.

Fixes: e759959fe3b8 ("x86/sev-es: Rename sev-es.{ch} to sev.{ch}")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 87a4b00f028e..a6895e440bc3 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -7,7 +7,7 @@
  * Author: Joerg Roedel <jroedel@suse.de>
  */
 
-#define pr_fmt(fmt)	"SEV-ES: " fmt
+#define pr_fmt(fmt)	"SEV: " fmt
 
 #include <linux/sched/debug.h>	/* For show_regs() */
 #include <linux/percpu-defs.h>
-- 
2.31.1

