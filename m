Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22EC3D3306
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938890; cv=none; b=RN7rzXQTcHCP69qhQ5BRWA2eW/x1q2sBK0RvzH31if0A6LOg2HTOOn1m2KKRD4WleZVArnpC5TAF9yYm4oi0Ft7/enLztn2uR2PhGTOQvVnzQyouAz4NBK4kUOEtyXCShIgtTcROmSrhI/l3wNDxI8dM55jvwftHdCF+43ZyX7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938890; c=relaxed/simple;
	bh=m8gRuuuTyFCAMMN9zAqTEQx0XEIWv9pt5Vh6OjiLc0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTMND80IRIB+qXJQOgD7MgBiD3cAkTGMmraY94zkUw9PCKXR4tnpF1NS3eb1I6wLnTgqn+AY+AeNselaoqDCfHHBhiaYTBDnvfSBe8w6C5rF02e2ti87TdmW+OIfR4ebprBvcknHgwZqcGZwruGmoAkSVRxGJCLI7232bHSTDZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Kb3ZyuqZ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Kb3ZyuqZ"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD373899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:14 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD373899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938855;
	bh=wXdvFt4R/5a4cmS8eeVlkgYFGMed5QegZJpNK+GPF9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kb3ZyuqZwiX2BDjpOmaaLOc5bscNC1RuQeBNph7UizdgsG7EPCae6WfUGikhB4SSZ
	 qMeKjWpNvS9jF0bBtbM+rZM82W5aQ/Rxy8YAyVXAbVHfCZwkPKY76alYrOtzKsaDge
	 G7bPuU0vW1sVDkgLw5z8t3BC6HujXfdof34xnqwHgA6Fk7eiL5FB/Vt9Qok3maLYVE
	 ov2dObrOcX3JsFZECOTXmOSgfxjXbNLihHt0LOAWL/fASlcie81pyDok93t3Hg/QXK
	 1ta7LdXN9KCVG3PEx0C2H3NbudqQ0a4WPZY0y9h0z/i7+DdgeuZORL89O2d7gs6hvo
	 hHaVI/vZsE6Sg==
From: "H. Peter Anvin" <hpa@zytor.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kiryl Shutsemau <kas@kernel.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-coco@lists.linux.dev, x86@kernel.org
Subject: [PATCH v1     00/14] x86 boot code cleanups, batch 1
Date: Tue, 20 Jan 2026 11:53:52 -0800
Message-ID: <20260120195407.1163051-1-hpa@zytor.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119192923.651588-1-hpa@zytor.com>
References: <20260119192923.651588-1-hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin" (Intel) <hpa@zytor.com>

Uros Bizjak was kind enough to look over my RFC patchset, and so I
feel confident enough to call this a v1 patchset now.

The difference versus RFC are:

1. Remove .code16 from header.S (Uros Bizjak).

2. Split out the changed handling of the old (ancient by now) command
   pointer protocol into a separate patch - it had accidentally gotten
   mixed into two(!) mostly unrelated patches.

3. Added a missing barrier(); to a20.c, made necessary by having the
   compiler aware of fs/gs memory.

4. While changing a20.c anyway, tidy up and optimize the code a bit.

Again, the only potentially controversial thing here is removing the
options for non-relocatable kernels and building kernels without the
EFI stub. Those configurations should be considered obsolete, and they
don't add any cost to the runtime kernel.

This patchset also includes the removal of the gcc-specific version of
the RELOC_HIDE() macro, by Uros Bizjak, as the other changes in this
patchset makes that possible. Per Uros, this is holding back gcc
development, so it seems pretty important.

I am calling this "batch 1", because I have quite a few more cleanups
still being worked on; this patchset will be a prerequisite for those,
obviously.

This patchset is also available as a git tree:

	git://git.zytor.com/linux/kernel/boot.git hpa/boot1
	https://git.zytor.com/linux/kernel/boot/log/?h=hpa/boot1

The patches are:

    01/14: x86/realmode: remove I/O port paravirtualization
    02/14: x86/realmode: make %gs == 0 an invariant
    03/14: x86/boot: use <linux/compiler.h>
    04/14: x86/boot: modernize the segment structure for the header and setup
    05/14: x86/boot: call puts() from within die()
    06/14: x86/boot: add comment barriers for the different headers
    07/14: x86/boot: factor out the 16-bit startup code from header.S
    08/14: x86: make CONFIG_EFI_STUB unconditional
    09/14: x86/boot: make the relocatable kernel unconditional
    10/14: x86/boot: explicitly put the old command line pointer in header.S
    11/14: x86/boot: use __seg_fs and __seg_gs in the real-mode boot code
    12/14: x86/boot: tweak a20.c for better code generation
    13/14: x86/boot: simplify x86/boot/cmdline.c by using __seg_fs
    14/14: compiler-gcc: Remove obsolete RELOC_HIDE() macro (Uros Bizjak)

--- 
 arch/x86/Kconfig                    |  85 ++++---------------------
 arch/x86/boot/Makefile              |   4 +-
 arch/x86/boot/a20.c                 |  34 +++++-----
 arch/x86/boot/boot.h                | 116 ++++++++++------------------------
 arch/x86/boot/cmdline.c             |  79 ++++++++++++++++++-----
 arch/x86/boot/compressed/Makefile   |   2 -
 arch/x86/boot/compressed/cmdline.c  |  29 ---------
 arch/x86/boot/compressed/error.c    |   2 -
 arch/x86/boot/compressed/head_32.S  |   2 -
 arch/x86/boot/compressed/head_64.S  |   4 --
 arch/x86/boot/{ => compressed}/io.h |   0
 arch/x86/boot/compressed/misc.c     |   8 ---
 arch/x86/boot/compressed/misc.h     |   2 +-
 arch/x86/boot/compressed/tdx.c      |   2 +-
 arch/x86/boot/header.S              | 123 ++++++++----------------------------
 arch/x86/boot/main.c                |  43 ++++++-------
 arch/x86/boot/pm.c                  |   5 +-
 arch/x86/boot/regs.c                |   3 +-
 arch/x86/boot/setup.ld              |  26 ++++----
 arch/x86/boot/start16.S             | 108 +++++++++++++++++++++++++++++++
 arch/x86/boot/video-bios.c          |   5 +-
 arch/x86/boot/video-mode.c          |   5 +-
 arch/x86/boot/video.c               |   7 +-
 arch/x86/realmode/rm/wakemain.c     |   4 --
 arch/x86/realmode/rm/wakeup_asm.S   |  10 +--
 include/linux/compiler-gcc.h        |  25 --------
 include/linux/compiler.h            |   8 +++
 27 files changed, 316 insertions(+), 425 deletions(-)
