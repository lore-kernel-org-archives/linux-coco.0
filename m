Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44F72FB4
	for <linux-coco@lists.linux.dev>; Tue,  8 Jun 2021 09:54:54 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de [79.242.186.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id 504BD465;
	Tue,  8 Jun 2021 11:54:46 +0200 (CEST)
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
Subject: [PATCH v3 4/7] x86/sev-es: Run #VC handler in plain IRQ state
Date: Tue,  8 Jun 2021 11:54:36 +0200
Message-Id: <20210608095439.12668-5-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608095439.12668-1-joro@8bytes.org>
References: <20210608095439.12668-1-joro@8bytes.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

Use irqentry_enter() and irqentry_exit() to track the runtime state of
the #VC handler. The reason it ran in NMI mode was solely to make sure
nothing interrupts the handler while the GHCB is in use.

This is handled now in sev_es_get/put_ghcb() directly, so there is no
reason the #VC handler can not run in normal IRQ mode and enjoy the
benefits like being able to send signals.

Fixes: 62441a1fb532 ("x86/sev-es: Correctly track IRQ states in runtime #VC handler")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 2a922d1b03c8..b563fb747aed 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1354,8 +1354,7 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 		return;
 	}
 
-	irq_state = irqentry_nmi_enter(regs);
-	lockdep_assert_irqs_disabled();
+	irq_state = irqentry_enter(regs);
 	instrumentation_begin();
 
 	/*
@@ -1408,7 +1407,7 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 
 out:
 	instrumentation_end();
-	irqentry_nmi_exit(regs, irq_state);
+	irqentry_exit(regs, irq_state);
 
 	return;
 
-- 
2.31.1

