Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5AD2C94
	for <linux-coco@lists.linux.dev>; Thu, 21 Oct 2021 08:14:25 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2b5b0.dip0.t-ipconnect.de [79.242.181.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by theia.8bytes.org (Postfix) with ESMTPSA id E8E227F;
	Thu, 21 Oct 2021 10:08:36 +0200 (CEST)
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
	Marc Orr <marcorr@google.com>,
	Cfir Cohen <cfir@google.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mike Stunes <mstunes@vmware.com>,
	Sean Christopherson <seanjc@google.com>,
	Martin Radev <martin.b.radev@gmail.com>,
	Arvind Sankar <nivedita@alum.mit.edu>,
	Xinyang Ge <xing@microsoft.com>,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH 0/2] x86/sev: Two fixes for SEV-ES VC stack handling
Date: Thu, 21 Oct 2021 10:08:31 +0200
Message-Id: <20211021080833.30875-1-joro@8bytes.org>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

Hi,

here are two fixes for recently discovered issues in the handling of
VC handler stack.

Please review.

Thanks,

	Joerg

Joerg Roedel (2):
  x86/sev: Fix stack type check in vc_switch_off_ist()
  x86/sev: Allow #VC exceptions on the VC2 stack

 arch/x86/kernel/sev.c   | 21 +++++++++++++++++----
 arch/x86/kernel/traps.c |  2 +-
 2 files changed, 18 insertions(+), 5 deletions(-)


base-commit: 519d81956ee277b4419c723adfb154603c2565ba
-- 
2.33.1

