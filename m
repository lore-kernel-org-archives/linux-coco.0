Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1B1CFEC9;
	Fri,  6 Sep 2024 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623440; cv=none; b=bqgSIaga4imQOY+rAQuOSXKoylwBtpjD9DlKGi4AWmFSWSwQkBxxGEgRPmwf9sW01WTly7EOZ20EYrblmIylpPMvNR+aHt546H0goA7puBq/f4E0KQS6J63QRMWOu3C40UFdJBxKCQkI9tXTLrgtjzOtuO339imNjJk0U2dwnaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623440; c=relaxed/simple;
	bh=JnKyWhG3EwoEsHqgyqI/LJMj6+JpBz8jATmIzJMWDQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AAWixdkc4vkASKUFhY6Sqx9HZg/gtYZscH4QRN6IPS+ue5fiGNk4QueSYAm8GWlx8j9OEbheHmW7hnyAd1IXM4IZQkxutCVunnvgk5Jk1dhAy/V2+BmrSMFU8ny1mmGL8d0/AXUFzgJ3JZS3i/baIIytdA72eX0dyVOlAFKNmyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iz0TkLye; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iz0TkLye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38B2C4CEC4;
	Fri,  6 Sep 2024 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725623439;
	bh=JnKyWhG3EwoEsHqgyqI/LJMj6+JpBz8jATmIzJMWDQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iz0TkLyeGmQP/nJAwVobGqSXXBFxO9PZMd+/ouQDuHczuvQn8KIIzLJ+zozrZ2BM9
	 gq2fTEy6u7jC0xr2Y/wFzzXRpSOGazouVgnbFCi/Be8QZ0xBh2c5UspEWjlYUnVgLC
	 U3t6KhlGzzUYicvqqrYfdNicm1dMnHo31RMyAozHZBZOtqAEgXgUC/AVmqZUW2abWW
	 ItmUDGVjKm/z2vNup0WoqPm7wcsltElxY8+va/UrOorSpRHSdzz3Ev4D8FPL/HTt7I
	 95j9vms1fazT8c1I7aQzaUXd7XfHIBqs1phVDlWpsH0ImQtNLMOiJFH1lYVGH4AEUw
	 SBaSERxkG4LYA==
From: Alexey Gladkov <legion@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: "Alexey Gladkov (Intel)" <legion@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yuan Yao <yuan.yao@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yuntao Wang <ytcoode@gmail.com>,
	Kai Huang <kai.huang@intel.com>,
	Baoquan He <bhe@redhat.com>,
	Oleg Nesterov <oleg@redhat.com>,
	cho@microsoft.com,
	decui@microsoft.com,
	John.Starks@microsoft.com
Subject: [PATCH v6 4/6] x86/tdx: Allow MMIO from userspace
Date: Fri,  6 Sep 2024 13:50:02 +0200
Message-ID: <0a299fe12c5d659ba95dfd14a36f224a4ccfceec.1725622408.git.legion@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725622408.git.legion@kernel.org>
References: <cover.1724837158.git.legion@kernel.org> <cover.1725622408.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Alexey Gladkov (Intel)" <legion@kernel.org>

The MMIO emulation is only allowed for kernel space code. It is carried
out through a special API, which uses only certain instructions.

This does not allow userspace to work with virtual devices.

Allow userspace to use the same instructions as kernel space to access
MMIO. Additional checks have been added previously.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Alexey Gladkov (Intel) <legion@kernel.org>
---
 arch/x86/coco/tdx/tdx.c | 43 +++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 636bf4013ef2..1e391897e34f 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -492,6 +492,32 @@ static int valid_vaddr(struct ve_info *ve, enum insn_mmio_type mmio, int size,
 	return 0;
 }
 
+static int decode_insn_struct(struct insn *insn, struct pt_regs *regs)
+{
+	char buffer[MAX_INSN_SIZE];
+
+	if (user_mode(regs)) {
+		int nr_copied = insn_fetch_from_user(regs, buffer);
+
+		if (nr_copied <= 0)
+			return -EFAULT;
+
+		if (!insn_decode_from_regs(insn, regs, buffer, nr_copied))
+			return -EINVAL;
+	} else {
+		if (copy_from_kernel_nofault(buffer, (void *)regs->ip, MAX_INSN_SIZE))
+			return -EFAULT;
+
+		if (insn_decode(insn, buffer, MAX_INSN_SIZE, INSN_MODE_64))
+			return -EINVAL;
+	}
+
+	if (!insn->immediate.got)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int handle_mmio_write(struct insn *insn, enum insn_mmio_type mmio, int size,
 			     struct pt_regs *regs, struct ve_info *ve)
 {
@@ -572,21 +598,14 @@ static int handle_mmio_read(struct insn *insn, enum insn_mmio_type mmio, int siz
 
 static int handle_mmio(struct pt_regs *regs, struct ve_info *ve)
 {
-	char buffer[MAX_INSN_SIZE];
 	enum insn_mmio_type mmio;
 	struct insn insn = {};
 	unsigned long vaddr;
 	int size, ret;
 
-	/* Only in-kernel MMIO is supported */
-	if (WARN_ON_ONCE(user_mode(regs)))
-		return -EFAULT;
-
-	if (copy_from_kernel_nofault(buffer, (void *)regs->ip, MAX_INSN_SIZE))
-		return -EFAULT;
-
-	if (insn_decode(&insn, buffer, MAX_INSN_SIZE, INSN_MODE_64))
-		return -EINVAL;
+	ret = decode_insn_struct(&insn, regs);
+	if (ret)
+		return ret;
 
 	mmio = insn_decode_mmio(&insn, &size);
 	if (WARN_ON_ONCE(mmio == INSN_MMIO_DECODE_FAILED))
@@ -786,6 +805,10 @@ static int virt_exception_user(struct pt_regs *regs, struct ve_info *ve)
 	switch (ve->exit_reason) {
 	case EXIT_REASON_CPUID:
 		return handle_cpuid(regs, ve);
+	case EXIT_REASON_EPT_VIOLATION:
+		if (is_private_gpa(ve->gpa))
+			panic("Unexpected EPT-violation on private memory.");
+		return handle_mmio(regs, ve);
 	default:
 		pr_warn("Unexpected #VE: %lld\n", ve->exit_reason);
 		return -EIO;
-- 
2.46.0

