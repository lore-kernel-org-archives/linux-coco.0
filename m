Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069808;
	b=q3p3Z7EQK4MhtSECDRvhJwC38y8A1lU2JW9AJyEJbbcu8IT/XBuuIkvtJz3G4iH+9hOQ
	 sEc0dv9Xx8Q/W+7X3Pr4pmOk+JbPt5ooG3zM2KWjvuqGzpg0jgRch+inqx4pYtJ1QlG95
	 63uMIV0ct/KMTRq1KVg5C2Yi6DJa6wmkOhuDZvl4PEvXg+5TCB7PoC9AVgXULvoA0AySg
	 da8ykynS6OWD9jVYWwAXnFO4w+ZRnr0zi3TGRq3hDho58MNMByz/nd14XA3+ywoDvW612
	 ZSAGq0SeiA8eh9IPiH4n+8u6IkzVwxVAoqa0AA1x4Bk00Ll6elwvpV7+xPu+TB9kUWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=U1tHH5Mqf99jycLltqjXTRn5xKYAyrIr2aHOwRziEw8=;
	b=zFZeflIRI5RnecMaE8CbltFnHNaOcF8tAel6h95JBLXU9auKSUVvEP5MEt+fuG+epqia
	 4stt2YfJNoEWjNYaY40MVBjlI6ZE0FedY0Yj05Vj6+3Kdbb2aUu4zVmbb76vz3zDOc5jc
	 ThEp+cqxIL4PzTHfkm0K4pUoG3KDtXXlYgAm8tEtfvPrJGOmj22fs0Rd5xTDCGm79i6SX
	 0qVmai7alndlaO7C6OHzhBbPnMBdPSzPLo7UGzgmfyWZ/2h4M72yK6lDfl0XA67PKgNVZ
	 27HRBXCRh/AOaflprHUq9KT7G7KYsVUpC/KB/tokRFZLdyHV6LgeimZzK1n6waY5FJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VoFP301k;
	arc=none smtp.remote-ip=209.85.161.69
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255A9606A323
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 02:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 255A9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VoFP301k
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-702e606a3abso3897802eaf.1
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793069807; x=1793674607; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1tHH5Mqf99jycLltqjXTRn5xKYAyrIr2aHOwRziEw8=;
        b=VoFP301kfSK5sJU1AIpXiN6bjwaVOr48eQ+3N+os/Hrnn1zkOKSEbc9UwfBPcYB4NV
         XJQWhSKQmy79dvsQZuS0jLWfzUiMr88w2HX1ptyriq0t+FcIn5EuHMiTBZ3oepN1sB/S
         zzDwVxvHWAdmBwD3E5+oY4OYhgrXTF2pucZ88HQE0ZNFGYJzgh8gIGcma6UFIqtus13n
         52htBp9Ql/xXGDwzvw225cY/gW67Ao4/uiROqxPSN/iEboX7gfw89g5wEJ/bYlC05azg
         +4yfoOx3uIroF7IWN1i/lZTdSyrGZgHtaLQkUIiZES5cRapffgECmP58wn6U4S8KVomX
         yebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069807; x=1793674607;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1tHH5Mqf99jycLltqjXTRn5xKYAyrIr2aHOwRziEw8=;
        b=wGkMC1t6AOP7yNB2p5yc7YUc0RSNL9+UYk3bMv+VvjgNRVrd8czT1K+bBkRK0pOWkP
         ZI7bKUPRiV5XkbU0AF9tYmuKEeZvF/lVFLvJri7XRNPLYbTPMcZrJAnseuwq0rwTRjJB
         vIrvimb4WZs2xA9Cv/wPDdFsD8spmDU5aicL9cWwy1uqo4URKYIjDUU8+zr6pihi//l2
         UI2eLPu98f+7b64QNWH1ZMBEe9Hkm4AMfdwVNj/ah75d5XNGL4CJWg+YFR2x/Ve/CUE4
         /4OTLZLdjbuL2YkgDaebvS1YtMSwQX8eqyzC9e+iMmoPplLYFHxEUxdMgqFFMOPGrAOJ
         iGnw==
X-Forwarded-Encrypted: i=1; AKwUvBwDZ6KDdxVuUcbg6a/TWktwti4+UCgO7A2tCYtDfmWeZbwQwWPbJXHRUbte0dWmko9SdLJ/jAgplA/W@lists.linux.dev
X-Gm-Message-State: AFq9FYJbGUTPAdTw+tLcn8lz6S+a7ySiX+a0EDsas+m1rxXGvM19OZuY
	3Yh9FIPxOFxdxNt8mQByQmTolckR+pn7k/cBczNS6wKrdU9BdvB5oZXmvFgoaJzYqaEA5wgKvDt
	FNK64mInYQrFRgABZ7LrQqldd6etBeD01QQ==
X-Received: from ilbeu28-n2.prod.google.com ([2002:a05:6e02:2f1c:20b0:516:ba98:55b6])
 (user=kevinloughlin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:3929:b0:494:396:1205 with SMTP id 586e51a60fabf-4a83f49fec6mr6444601fac.14.1793069806655;
 Mon, 26 Oct 2026 19:56:46 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:56:07 +0000
In-Reply-To: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027025616.1632690-5-kevinloughlin@google.com>
Subject: [PATCH 04/13] x86/coco/sev: fix zeropad #VC on unaccepted memory
From: Kevin Loughlin <kevinloughlin@google.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>
Cc: virtualization@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sidharth Telang <sidtelang@google.com>, Punit Salian <psalian@google.com>, 
	Peter Gonda <pgonda@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Jacky Li <jackyli@google.com>, Steve Rutherford <srutherford@google.com>, 
	David Skidmore <davidskidmore@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

When dynamic memory unacceptance is active on AMD SEV-SNP, an accepted
4KB page may sit immediately adjacent to a 2MB block that has been
unaccepted via PVALIDATE(validate=false). Speculative unaligned loads
across the page boundary via load_unaligned_zeropad() (such as in
dentry path walk) trigger a hardware #VC exception with error code
SVM_EXIT_PAGE_NOT_VALIDATED (0x404) or SVM_EXIT_NPF (0x400) on the
unvalidated neighbor page.

Define SVM_EXIT_PAGE_NOT_VALIDATED (0x404) and invoke fixup_exception()
in vc_raw_handle_exception() when an SVM_EXIT_PAGE_NOT_VALIDATED or
SVM_EXIT_NPF #VC exception occurs in kernel mode at an EX_TYPE_ZEROPAD
instruction before dispatching to vc_handle_exitcode(), matching the
existing EX_TYPE_ZEROPAD handling in the Intel TDX #VE handler
(ve_raise_fault()).

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
---
 arch/x86/coco/sev/vc-handle.c   | 29 +++++++++++++++++++++++++++++
 arch/x86/include/uapi/asm/svm.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/arch/x86/coco/sev/vc-handle.c b/arch/x86/coco/sev/vc-handle.c
index f25d302efceb..1ed00771d87d 100644
--- a/arch/x86/coco/sev/vc-handle.c
+++ b/arch/x86/coco/sev/vc-handle.c
@@ -18,6 +18,7 @@
 #include <linux/io.h>
 #include <linux/psp-sev.h>
 #include <linux/efi.h>
+#include <linux/extable.h>
 #include <uapi/linux/sev-guest.h>
 
 #include <asm/init.h>
@@ -872,6 +873,29 @@ static __always_inline bool vc_from_invalid_context(struct pt_regs *regs)
 	return is_vc2_stack(sp) && !is_vc2_stack(prev_sp);
 }
 
+static bool vc_try_fixup_zeropad(struct es_em_ctxt *ctxt, struct pt_regs *regs,
+				 unsigned long error_code)
+{
+	unsigned long addr, fault_addr;
+
+	if ((error_code != SVM_EXIT_PAGE_NOT_VALIDATED &&
+	     error_code != SVM_EXIT_NPF) ||
+	    user_mode(regs) ||
+	    ex_get_fixup_type(regs->ip) != EX_TYPE_ZEROPAD)
+		return false;
+
+	addr = (unsigned long)insn_get_addr_ref(&ctxt->insn, regs);
+	if (addr == ~0ul)
+		return false;
+
+	/*
+	 * load_unaligned_zeropad() faults when an unaligned word load crosses
+	 * into an unaccepted page; round up to the crossed page boundary.
+	 */
+	fault_addr = (addr + sizeof(long) - 1) & PAGE_MASK;
+	return fixup_exception(regs, X86_TRAP_VC, error_code, fault_addr);
+}
+
 static bool vc_raw_handle_exception(struct pt_regs *regs, unsigned long error_code)
 {
 	struct ghcb_state state;
@@ -885,6 +909,11 @@ static bool vc_raw_handle_exception(struct pt_regs *regs, unsigned long error_co
 	vc_ghcb_invalidate(ghcb);
 	result = vc_init_em_ctxt(&ctxt, regs, error_code);
 
+	if (result == ES_OK && vc_try_fixup_zeropad(&ctxt, regs, error_code)) {
+		__sev_put_ghcb(&state);
+		return true;
+	}
+
 	if (result == ES_OK)
 		result = vc_handle_exitcode(&ctxt, ghcb, error_code);
 
diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
index e80676185092..38b8e0c2f5e2 100644
--- a/arch/x86/include/uapi/asm/svm.h
+++ b/arch/x86/include/uapi/asm/svm.h
@@ -101,6 +101,7 @@
 #define SVM_EXIT_AVIC_INCOMPLETE_IPI		0x401
 #define SVM_EXIT_AVIC_UNACCELERATED_ACCESS	0x402
 #define SVM_EXIT_VMGEXIT       0x403
+#define SVM_EXIT_PAGE_NOT_VALIDATED	0x404
 #define SVM_EXIT_PML_FULL	0x407
 
 /* SEV-ES software-defined VMGEXIT events */
@@ -237,6 +238,7 @@
 	{ SVM_EXIT_AVIC_INCOMPLETE_IPI,		"avic_incomplete_ipi" }, \
 	{ SVM_EXIT_AVIC_UNACCELERATED_ACCESS,   "avic_unaccelerated_access" }, \
 	{ SVM_EXIT_VMGEXIT,		"vmgexit" }, \
+	{ SVM_EXIT_PAGE_NOT_VALIDATED,	"page_not_validated" }, \
 	{ SVM_EXIT_PML_FULL,		"pml_full" }, \
 	{ SVM_VMGEXIT_MMIO_READ,	"vmgexit_mmio_read" }, \
 	{ SVM_VMGEXIT_MMIO_WRITE,	"vmgexit_mmio_write" }, \
-- 
2.56.0.307.g5fe7bd680c-goog

