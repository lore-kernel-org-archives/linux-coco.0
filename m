Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10F62C8B
	for <linux-coco@lists.linux.dev>; Thu, 21 Oct 2021 08:14:24 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2b5b0.dip0.t-ipconnect.de [79.242.181.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id 6768E29C;
	Thu, 21 Oct 2021 10:08:38 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Cc: Joerg Roedel <joro@8bytes.org>,
	Joerg Roedel <jroedel@suse.de>,
	Xinyang Ge <xing@microsoft.com>,
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
	Marc Orr <marcorr@google.com>,
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
Subject: [PATCH 2/2] x86/sev: Allow #VC exceptions on the VC2 stack
Date: Thu, 21 Oct 2021 10:08:33 +0200
Message-Id: <20211021080833.30875-3-joro@8bytes.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021080833.30875-1-joro@8bytes.org>
References: <20211021080833.30875-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

When code running on the VC2 stack causes a nested VC exception, the
handler will not handle it as expected but goes again into the error
path.

The result is that the panic() call happening when the VC exception
was raised in an invalid context is called recursively. Fix this by
checking the interrupted stack too and only call panic if it is not
the VC2 stack.

Reported-by: Xinyang Ge <xing@microsoft.com>
Fixes: 0786138c78e79 ("x86/sev-es: Add a Runtime #VC Exception Handler")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index a6895e440bc3..f39165b5fa34 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1319,13 +1319,26 @@ static __always_inline void vc_forward_exception(struct es_em_ctxt *ctxt)
 	}
 }
 
-static __always_inline bool on_vc_fallback_stack(struct pt_regs *regs)
+static __always_inline bool is_vc2_stack(unsigned long sp)
 {
-	unsigned long sp = (unsigned long)regs;
-
 	return (sp >= __this_cpu_ist_bottom_va(VC2) && sp < __this_cpu_ist_top_va(VC2));
 }
 
+static __always_inline bool vc_from_invalid_context(struct pt_regs *regs)
+{
+	unsigned long sp, prev_sp;
+
+	sp      = (unsigned long)regs;
+	prev_sp = regs->sp;
+
+	/*
+	 * If the code was already executing on the VC2 stack when the #VC
+	 * happened, let it proceed to the normal handling routine. This way the
+	 * code executing on the VC2 stack can cause get #VC exceptions handled.
+	 */
+	return is_vc2_stack(sp) && !is_vc2_stack(prev_sp);
+}
+
 static bool vc_raw_handle_exception(struct pt_regs *regs, unsigned long error_code)
 {
 	struct ghcb_state state;
@@ -1406,7 +1419,7 @@ DEFINE_IDTENTRY_VC_KERNEL(exc_vmm_communication)
 	 * But keep this here in case the noinstr annotations are violated due
 	 * to bug elsewhere.
 	 */
-	if (unlikely(on_vc_fallback_stack(regs))) {
+	if (unlikely(vc_from_invalid_context(regs))) {
 		instrumentation_begin();
 		panic("Can't handle #VC exception from unsupported context\n");
 		instrumentation_end();
-- 
2.33.1

