Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAB36D0E
	for <linux-coco@lists.linux.dev>; Mon, 14 Jun 2021 13:53:44 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de [79.242.186.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id 67FC7465;
	Mon, 14 Jun 2021 15:53:42 +0200 (CEST)
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
Subject: [PATCH v5 1/6] x86/sev-es: Fix error message in runtime #VC handler
Date: Mon, 14 Jun 2021 15:53:22 +0200
Message-Id: <20210614135327.9921-2-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614135327.9921-1-joro@8bytes.org>
References: <20210614135327.9921-1-joro@8bytes.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

The runtime #VC handler is not "early" anymore. Fix the copy&paste error
and remove that word from the error message.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 651b81cd648e..4fd997bbf059 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1369,7 +1369,7 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 		vc_finish_insn(&ctxt);
 		break;
 	case ES_UNSUPPORTED:
-		pr_err_ratelimited("Unsupported exit-code 0x%02lx in early #VC exception (IP: 0x%lx)\n",
+		pr_err_ratelimited("Unsupported exit-code 0x%02lx in #VC exception (IP: 0x%lx)\n",
 				   error_code, regs->ip);
 		goto fail;
 	case ES_VMM_ERROR:
-- 
2.31.1

