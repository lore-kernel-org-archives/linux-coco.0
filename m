Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580FE2FB8
	for <linux-coco@lists.linux.dev>; Thu, 10 Jun 2021 09:12:06 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de [79.242.186.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id 675854CA;
	Thu, 10 Jun 2021 11:11:58 +0200 (CEST)
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
Subject: [PATCH v4 6/6] x86/sev-es: Propagate #GP if getting linear instruction address failed
Date: Thu, 10 Jun 2021 11:11:41 +0200
Message-Id: <20210610091141.30322-7-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610091141.30322-1-joro@8bytes.org>
References: <20210610091141.30322-1-joro@8bytes.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

When an instruction is fetched from user-space, segmentation needs to
be taken into account. This means that getting the linear address of
an instruction can fail. Hardware would raise a #GP
exception in that case, but the #VC exception handler would emulate it
as a page-fault.

The insn_fetch_from_user*() functions now provide the relevant
information in case of an failure. Use that and propagate a #GP when
the linear address of an instruction to fetch could not be calculated.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index a7045a5a94ca..80c0d8385def 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -270,11 +270,18 @@ static enum es_result __vc_decode_user_insn(struct es_em_ctxt *ctxt)
 	int insn_bytes;
 
 	insn_bytes = insn_fetch_from_user_inatomic(ctxt->regs, buffer);
-	if (insn_bytes <= 0) {
+	if (insn_bytes == 0) {
+		/* Nothing could be copied */
 		ctxt->fi.vector     = X86_TRAP_PF;
 		ctxt->fi.error_code = X86_PF_INSTR | X86_PF_USER;
 		ctxt->fi.cr2        = ctxt->regs->ip;
 		return ES_EXCEPTION;
+	} else if (insn_bytes == -EINVAL) {
+		/* Effective RIP could not be calculated */
+		ctxt->fi.vector     = X86_TRAP_GP;
+		ctxt->fi.error_code = 0;
+		ctxt->fi.cr2        = 0;
+		return ES_EXCEPTION;
 	}
 
 	if (!insn_decode_from_regs(&ctxt->insn, ctxt->regs, buffer, insn_bytes))
-- 
2.31.1

