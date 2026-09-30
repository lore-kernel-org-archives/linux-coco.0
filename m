Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9238651597D
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 16:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786989; cv=none; b=rGpIsjxEeNwl9CtwCJeZU1kv1k/XIMqr+iJGWAlC+O/rISNfSaDLyxtysp9S4BHk78tz9IAHc0k5xLwxo8cfMXbRL0KOClgL6eXiHajEafoE0T0aCeqFgFOQRkYxZo05Wr1se1fS4xbb3jlDJDlisKERGB/xtQ/kZkg+se/r8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786989; c=relaxed/simple;
	bh=lrNhVw8O7Z5bKR2hECDWo9LI4wPDPZzK7RqRkIo0tYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o5IHdP54XzrNeiGXGKlTtWIqoDKB4ZYD3ugxbKaiaMVJCv631Z6SAArAkSQubGphO1SQ4pI9ch5KEWIwfVh3fhrMt+Te7qRcrZi5vb92Fr789bVDw1ptfKvCgz6UkdAM/nJrUP9Ysjx3qcloidcnJWegoNnTpc4/O01iXGNez8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HOkrkTYG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HOkrkTYG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95DB4143D;
	Wed, 30 Sep 2026 09:49:43 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A9A03F85F;
	Wed, 30 Sep 2026 09:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790786987; bh=lrNhVw8O7Z5bKR2hECDWo9LI4wPDPZzK7RqRkIo0tYc=;
	h=From:To:Cc:Subject:Date:From;
	b=HOkrkTYG/YbTkn5eyfqS5afO3Du8PmFgfxVoxBVqSusTSrNukE0pWZ1aX5nYZlvys
	 blUJUoabaDkqtrkoL6U187dBggR8gn0g6a5wQxaHmGOzJVxo/mmKHXnyKp/NJiL2E8
	 Wuja02T70TlspUUzByvme6jHB4JZZaYiLLz8Qf2E=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	steven.price@arm.com,
	gshan@redhat.com,
	aneesh.kumar@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	mark.rutland@arm.com,
	linux-coco@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v19] arm64: mm: Handle Granule Protection Faults (GPFs)
Date: Wed, 30 Sep 2026 17:49:30 +0100
Message-ID: <20260930164930.1388438-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steven Price <steven.price@arm.com>

If the host attempts to access granules that have been delegated to RMM
(for use as an RMM object or Realm Data), these accesses will be caught
and will trigger a Granule Protection Fault (GPF).

A fault during a page walk signals a bug in the kernel and is handled by
oopsing the kernel. A non-page walk fault could be caused by:

 * Userspace having access to a page which has been delegated. We don't allow
   mapping a delegated page (which may have Realm VM private data) to EL0.
   But if we do encounter this, trigger a SIGBUS to allow debugging

 * A kernel mode access is even more serious, except for the cases where :
   - Benign overreads e.g. load_unaligned_zeropad(), we should be able to fix
     this up.
   - A kdump kernel trying to access delegated page (donated by the primary
     kernel). We do not support this yet, but can be added in the later series.

There is ongoing work to unmap the guest_memfd backed private pages
from the linear map. We would additionally need to unmap the other
delegated pages too. For now handle the GPF and only fixing up kernel mode
accesses via kernel VA (which would cover both the legitimate cases above)

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v18:
 * Only fixup accesses via kernel VA
Changes since v17:
 * Pass untagged address to die_kernel_fault() - Sashiko
 * Explicitly check !user_mode() for fixups - Catalin
 * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
Changes since v16:
 * Update the commit description to indicate why we try to fixup GPFs
Changes since v10:
 * Don't call arm64_notify_die() in do_gpf() but simply return 1.
Changes since v2:
 * Include missing "Granule Protection Fault at level -1"
---
 arch/arm64/mm/fault.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 75c3e463df2ef..ded9288a5dd2f 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -914,6 +914,29 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
 	return 0;
 }
 
+static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
+{
+	const struct fault_info *inf = esr_to_fault_info(esr);
+	unsigned long addr = untagged_addr(far);
+
+	die_kernel_fault(inf->name, addr, esr, regs);
+	return 0;
+}
+
+static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
+{
+	/*
+	 * Userspace must not have a delegated page mapped in. If the kernel
+	 * is made to access it, then we have a serious problem.
+	 * Only fixup if the access came via kernel VA. e.g., load_unaligned_zeropad()
+	 */
+	if (!user_mode(regs) && !is_el1_instruction_abort(esr) &&
+	    !is_ttbr0_addr(untagged_addr(far)) && fixup_exception(regs, esr))
+		return 0;
+
+	return 1;
+}
+
 static const struct fault_info fault_info[] = {
 	{ do_bad,		SIGKILL, SI_KERNEL,	"ttbr address size fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"level 1 address size fault"	},
@@ -950,12 +973,12 @@ static const struct fault_info fault_info[] = {
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 32"			},
 	{ do_alignment_fault,	SIGBUS,  BUS_ADRALN,	"alignment fault"		},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 34"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 35"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 36"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 37"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 38"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 39"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 40"			},
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level -1 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 0 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 1 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 2 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 3 granule protection fault (translation table walk)" },
+	{ do_gpf,		SIGBUS,  BUS_OBJERR,	"granule protection fault" },
 	{ do_bad,		SIGKILL, SI_KERNEL,	"level -1 address size fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 42"			},
 	{ do_translation_fault,	SIGSEGV, SEGV_MAPERR,	"level -1 translation fault"	},
-- 
2.43.0

