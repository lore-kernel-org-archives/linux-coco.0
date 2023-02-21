Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D2D1FD7
	for <linux-coco@lists.linux.dev>; Tue, 21 Feb 2023 11:34:38 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D41F41EC059E;
	Tue, 21 Feb 2023 12:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1676979275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:in-reply-to:
	 references; bh=Zc+FvdgAq+QqiQboJPX6s91pJhvJT91tnVAaN+emh38=;
	b=VBNmsYxcKLZVuHnRS1XhM9NdJxTCjEriunvxze38rhNuEwfqjumJ2xLQ7uTwmNT0nMLrpm
	jViBRWcQ6njtPLADJ9X5GcgtnvhCXbNtIteqTn6R36G/qD+f1wefiWbDTvWVPKyAOIKUud
	hXSG82V1pwy/0NpnGnXuKcGEmAgy5kQ=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Dionna Glaze <dionnaglaze@google.com>,
	Joerg Roedel <jroedel@suse.de>,
	Michael Roth <michael.roth@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Peter Gonda <pgonda@google.com>,
	Tom Lendacky <Thomas.Lendacky@amd.com>,
	linux-coco@lists.linux.dev,
	x86@kernel.org
Subject: [PATCH -v2 00/11] SEV: Cleanup sev-guest a bit and add throttling
Date: Tue, 21 Feb 2023 12:34:17 +0100
Message-Id: <20230221113428.19324-1-bp@alien8.de>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Hi,

ok, here's v2 with the pending stuff fixed.

Thx.

Changelog:
----------

v1:
---
so I've been looking at Dionna's patches adding the SEV guest throttling
and that request issuing spaghetti was getting on my nerves. And it
would've become even worse with more stuff piling ontop so here's
a first round of cleanups before adding more stuff and making it an
unmaintainable mess.

The final result is a lot easier to read with proper separation of
functionality between functions. I want to get rid of more input/output
params being passed back'n'forth and use a struct instead and Nikunj's
patches have stuff which goes in that direction but first things first.

After the cleanup, the new stuff being added is a lot less code and
almost trivial. But I've been staring at this for a while now so it
could be only me who thinks it is trivial now. But we'll see.

Initial smoke testing seems to work ok but I might've introduced some
funky bugs, ofc.

Comments and suggestions are appreciated, as always.

Thanks and thanks, Tom, for the help!

Borislav Petkov (AMD) (7):
  virt/coco/sev-guest: Check SEV_SNP attribute at probe time
  virt/coco/sev-guest: Simplify extended guest request handling
  virt/coco/sev-guest: Remove the disable_vmpck label in
    handle_guest_request()
  virt/coco/sev-guest: Carve out the request issuing logic into a helper
  virt/coco/sev-guest: Do some code style cleanups
  virt/coco/sev-guest: Convert the sw_exit_info_2 checking to a
    switch-case
  crypto: ccp: Get rid of __sev_platform_init_locked()'s local function
    pointer

Dionna Glaze (3):
  virt/coco/sev-guest: Add throttling awareness
  virt/coco/sev-guest: Double-buffer messages
  x86/sev: Change snp_guest_issue_request()'s fw_err argument

Peter Gonda (1):
  crypto: ccp - Name -1 return value as SEV_RET_NO_FW_CALL

 Documentation/virt/coco/sev-guest.rst   |  20 ++-
 arch/x86/include/asm/sev-common.h       |   3 -
 arch/x86/include/asm/sev.h              |   8 +-
 arch/x86/kernel/sev.c                   |  33 +++--
 drivers/crypto/ccp/sev-dev.c            |  22 +--
 drivers/virt/coco/sev-guest/sev-guest.c | 173 +++++++++++++++---------
 include/uapi/linux/psp-sev.h            |   7 +
 include/uapi/linux/sev-guest.h          |  18 ++-
 8 files changed, 186 insertions(+), 98 deletions(-)

-- 
2.35.1

