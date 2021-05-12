Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455E12FAF
	for <linux-coco@lists.linux.dev>; Wed, 12 May 2021 07:55:17 +0000 (UTC)
Received: from cap.home.8bytes.org (p549ad305.dip0.t-ipconnect.de [84.154.211.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id 14ABF3E6;
	Wed, 12 May 2021 09:55:09 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org,
	Hyunwook Baek <baekhw@google.com>
Cc: Joerg Roedel <joro@8bytes.org>,
	Joerg Roedel <jroedel@suse.de>,
	stable@vger.kernel.org,
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
Subject: [PATCH 3/6] x86/sev-es: Use __put_user()/__get_user
Date: Wed, 12 May 2021 09:54:42 +0200
Message-Id: <20210512075445.18935-4-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512075445.18935-1-joro@8bytes.org>
References: <20210512075445.18935-1-joro@8bytes.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

The put_user() and get_user() functions do checks on the address which is
passed to them. They check whether the address is actually a user-space
address and whether its fine to access it. They also call might_fault()
to indicate that they could fault and possibly sleep.

All of these checks are neither wanted nor required in the #VC exception
handler, which can be invoked from almost any context and also for MMIO
instructions from kernel space on kernel memory. All the #VC handler
wants to know is whether a fault happened when the access was tried.

This is provided by __put_user()/__get_user(), which just do the access
no matter what.

Fixes: f980f9c31a92 ("x86/sev-es: Compile early handler code into kernel image")
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 6530a844eb61..110b39345b40 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -342,22 +342,22 @@ static enum es_result vc_write_mem(struct es_em_ctxt *ctxt,
 	switch (size) {
 	case 1:
 		memcpy(&d1, buf, 1);
-		if (put_user(d1, target))
+		if (__put_user(d1, target))
 			goto fault;
 		break;
 	case 2:
 		memcpy(&d2, buf, 2);
-		if (put_user(d2, target))
+		if (__put_user(d2, target))
 			goto fault;
 		break;
 	case 4:
 		memcpy(&d4, buf, 4);
-		if (put_user(d4, target))
+		if (__put_user(d4, target))
 			goto fault;
 		break;
 	case 8:
 		memcpy(&d8, buf, 8);
-		if (put_user(d8, target))
+		if (__put_user(d8, target))
 			goto fault;
 		break;
 	default:
@@ -396,22 +396,22 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
 
 	switch (size) {
 	case 1:
-		if (get_user(d1, s))
+		if (__get_user(d1, s))
 			goto fault;
 		memcpy(buf, &d1, 1);
 		break;
 	case 2:
-		if (get_user(d2, s))
+		if (__get_user(d2, s))
 			goto fault;
 		memcpy(buf, &d2, 2);
 		break;
 	case 4:
-		if (get_user(d4, s))
+		if (__get_user(d4, s))
 			goto fault;
 		memcpy(buf, &d4, 4);
 		break;
 	case 8:
-		if (get_user(d8, s))
+		if (__get_user(d8, s))
 			goto fault;
 		memcpy(buf, &d8, 8);
 		break;
-- 
2.31.1

