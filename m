Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E759341654;
	Thu,  4 Dec 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852499; cv=none; b=UXXRtUKQoJ2hQaqCY8OnIEy3Mo/on/QljtZvNf5/fWb2JJGtqqlin1vhVEnc32WhYA6soeliEVFjZM4uLbmvWkFHK2C9A93+1bkhi1wtZfXUeFe2aPDaaQz2CDAdTvstMWPudN16UZg1RF7aZpS+UmAw6cy/3SOGmGcUxLpEcXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852499; c=relaxed/simple;
	bh=3dLQd6C5yviitFJEAXP0OWUPNDVC5V8HL1ZU4WcGoN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFP0LwQjzuV+OiA1EUj/KpJZNf3HgY3e7TPBCheBGsHTCT3e6uDx18/TQPS2low8BjUuzknly/ABfroHt7nnaFZ0l/fXR7YoXs9pt0nMTp/0jftYD48TntYcZ8knCMmokCZoNG/itXNjnnAzVaGWFZ+nG4FJ/TF4Vyg14bSMP8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jwnv2Us/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jwnv2Us/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C287C116C6;
	Thu,  4 Dec 2025 12:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764852498;
	bh=3dLQd6C5yviitFJEAXP0OWUPNDVC5V8HL1ZU4WcGoN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jwnv2Us/3qK5g5RbhD14930YiVhnu9CqsMTp1a3uPYCAOGawsvjkZYY7Hsa1VCIQP
	 oBHnWK0cTTl7LtXHpe00fC+mOGbeoEb0fPeM1LsTzL4UXXRqMwvFyrHpLeWGjl3QKh
	 ptVrW8T5kybuWUV+vmBe3FGS0R+DbJfXPtrKRv+1lvnBoh5pRD49N9EWBRpNX3wnv9
	 b0X7/7AEi4PMl7bW3SMd2UKyt/DNCYMz4XRbWEq/MsPZr6bcMXc0nRZ7FVEkmO+XzW
	 umeG0xQ5KzcnCA35pThn4LgBuZXgXed/kjDFB+AUFurPCeMFT0WfjoRzQCdasQmKSX
	 oniEG+La/Wl1Q==
From: Borislav Petkov <bp@kernel.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: <linux-coco@lists.linux.dev>,
	X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH 3/3] x86/sev: Carve out the SVSM code into a separate compilation unit
Date: Thu,  4 Dec 2025 13:48:08 +0100
Message-ID: <20251204124809.31783-4-bp@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204124809.31783-1-bp@kernel.org>
References: <20251204124809.31783-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Move the SVSM-related machinery into a separate compilation unit in
order to keep sev/core.c slim and "on-topic".

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/coco/sev/Makefile   |   2 +-
 arch/x86/coco/sev/core.c     | 377 -----------------------------------
 arch/x86/coco/sev/internal.h |  29 +++
 arch/x86/coco/sev/svsm.c     | 362 +++++++++++++++++++++++++++++++++
 4 files changed, 392 insertions(+), 378 deletions(-)
 create mode 100644 arch/x86/coco/sev/svsm.c

diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefile
index 3b8ae214a6a6..fb8ffedfc8b0 100644
--- a/arch/x86/coco/sev/Makefile
+++ b/arch/x86/coco/sev/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-y += core.o noinstr.o vc-handle.o
+obj-y += core.o noinstr.o vc-handle.o svsm.o
 
 # Clang 14 and older may fail to respect __no_sanitize_undefined when inlining
 UBSAN_SANITIZE_noinstr.o	:= n
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 4e618e596267..379e0c09c7f3 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -55,40 +55,6 @@ SYM_PIC_ALIAS(sev_hv_features);
 u64 sev_secrets_pa __ro_after_init;
 SYM_PIC_ALIAS(sev_secrets_pa);
 
-/* For early boot SVSM communication */
-struct svsm_ca boot_svsm_ca_page __aligned(PAGE_SIZE);
-SYM_PIC_ALIAS(boot_svsm_ca_page);
-
-/*
- * SVSM related information:
- *   During boot, the page tables are set up as identity mapped and later
- *   changed to use kernel virtual addresses. Maintain separate virtual and
- *   physical addresses for the CAA to allow SVSM functions to be used during
- *   early boot, both with identity mapped virtual addresses and proper kernel
- *   virtual addresses.
- */
-u64 boot_svsm_caa_pa __ro_after_init;
-SYM_PIC_ALIAS(boot_svsm_caa_pa);
-
-DEFINE_PER_CPU(struct svsm_ca *, svsm_caa);
-DEFINE_PER_CPU(u64, svsm_caa_pa);
-
-static inline struct svsm_ca *svsm_get_caa(void)
-{
-	if (sev_cfg.use_cas)
-		return this_cpu_read(svsm_caa);
-	else
-		return rip_rel_ptr(&boot_svsm_ca_page);
-}
-
-static inline u64 svsm_get_caa_pa(void)
-{
-	if (sev_cfg.use_cas)
-		return this_cpu_read(svsm_caa_pa);
-	else
-		return boot_svsm_caa_pa;
-}
-
 /* AP INIT values as documented in the APM2  section "Processor Initialization State" */
 #define AP_INIT_CS_LIMIT		0xffff
 #define AP_INIT_DS_LIMIT		0xffff
@@ -218,95 +184,6 @@ static u64 __init get_jump_table_addr(void)
 	return ret;
 }
 
-static int svsm_perform_ghcb_protocol(struct ghcb *ghcb, struct svsm_call *call)
-{
-	struct es_em_ctxt ctxt;
-	u8 pending = 0;
-
-	vc_ghcb_invalidate(ghcb);
-
-	/*
-	 * Fill in protocol and format specifiers. This can be called very early
-	 * in the boot, so use rip-relative references as needed.
-	 */
-	ghcb->protocol_version = ghcb_version;
-	ghcb->ghcb_usage       = GHCB_DEFAULT_USAGE;
-
-	ghcb_set_sw_exit_code(ghcb, SVM_VMGEXIT_SNP_RUN_VMPL);
-	ghcb_set_sw_exit_info_1(ghcb, 0);
-	ghcb_set_sw_exit_info_2(ghcb, 0);
-
-	sev_es_wr_ghcb_msr(__pa(ghcb));
-
-	svsm_issue_call(call, &pending);
-
-	if (pending)
-		return -EINVAL;
-
-	switch (verify_exception_info(ghcb, &ctxt)) {
-	case ES_OK:
-		break;
-	case ES_EXCEPTION:
-		vc_forward_exception(&ctxt);
-		fallthrough;
-	default:
-		return -EINVAL;
-	}
-
-	return svsm_process_result_codes(call);
-}
-
-static int svsm_perform_call_protocol(struct svsm_call *call)
-{
-	struct ghcb_state state;
-	unsigned long flags;
-	struct ghcb *ghcb;
-	int ret;
-
-	flags = native_local_irq_save();
-
-	if (sev_cfg.ghcbs_initialized)
-		ghcb = __sev_get_ghcb(&state);
-	else if (boot_ghcb)
-		ghcb = boot_ghcb;
-	else
-		ghcb = NULL;
-
-	do {
-		ret = ghcb ? svsm_perform_ghcb_protocol(ghcb, call)
-			   : __pi_svsm_perform_msr_protocol(call);
-	} while (ret == -EAGAIN);
-
-	if (sev_cfg.ghcbs_initialized)
-		__sev_put_ghcb(&state);
-
-	native_local_irq_restore(flags);
-
-	return ret;
-}
-
-static inline void __pval_terminate(u64 pfn, bool action, unsigned int page_size,
-				    int ret, u64 svsm_ret)
-{
-	WARN(1, "PVALIDATE failure: pfn: 0x%llx, action: %u, size: %u, ret: %d, svsm_ret: 0x%llx\n",
-	     pfn, action, page_size, ret, svsm_ret);
-
-	sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PVALIDATE);
-}
-
-static void svsm_pval_terminate(struct svsm_pvalidate_call *pc, int ret, u64 svsm_ret)
-{
-	unsigned int page_size;
-	bool action;
-	u64 pfn;
-
-	pfn = pc->entry[pc->cur_index].pfn;
-	action = pc->entry[pc->cur_index].action;
-	page_size = pc->entry[pc->cur_index].page_size;
-
-	__pval_terminate(pfn, action, page_size, ret, svsm_ret);
-}
-
 static void pval_pages(struct snp_psc_desc *desc)
 {
 	struct psc_entry *e;
@@ -343,152 +220,6 @@ static void pval_pages(struct snp_psc_desc *desc)
 	}
 }
 
-static u64 svsm_build_ca_from_pfn_range(u64 pfn, u64 pfn_end, bool action,
-					struct svsm_pvalidate_call *pc)
-{
-	struct svsm_pvalidate_entry *pe;
-
-	/* Nothing in the CA yet */
-	pc->num_entries = 0;
-	pc->cur_index   = 0;
-
-	pe = &pc->entry[0];
-
-	while (pfn < pfn_end) {
-		pe->page_size = RMP_PG_SIZE_4K;
-		pe->action    = action;
-		pe->ignore_cf = 0;
-		pe->rsvd      = 0;
-		pe->pfn       = pfn;
-
-		pe++;
-		pfn++;
-
-		pc->num_entries++;
-		if (pc->num_entries == SVSM_PVALIDATE_MAX_COUNT)
-			break;
-	}
-
-	return pfn;
-}
-
-static int svsm_build_ca_from_psc_desc(struct snp_psc_desc *desc, unsigned int desc_entry,
-				       struct svsm_pvalidate_call *pc)
-{
-	struct svsm_pvalidate_entry *pe;
-	struct psc_entry *e;
-
-	/* Nothing in the CA yet */
-	pc->num_entries = 0;
-	pc->cur_index   = 0;
-
-	pe = &pc->entry[0];
-	e  = &desc->entries[desc_entry];
-
-	while (desc_entry <= desc->hdr.end_entry) {
-		pe->page_size = e->pagesize ? RMP_PG_SIZE_2M : RMP_PG_SIZE_4K;
-		pe->action    = e->operation == SNP_PAGE_STATE_PRIVATE;
-		pe->ignore_cf = 0;
-		pe->rsvd      = 0;
-		pe->pfn       = e->gfn;
-
-		pe++;
-		e++;
-
-		desc_entry++;
-		pc->num_entries++;
-		if (pc->num_entries == SVSM_PVALIDATE_MAX_COUNT)
-			break;
-	}
-
-	return desc_entry;
-}
-
-static void svsm_pval_pages(struct snp_psc_desc *desc)
-{
-	struct svsm_pvalidate_entry pv_4k[VMGEXIT_PSC_MAX_ENTRY];
-	unsigned int i, pv_4k_count = 0;
-	struct svsm_pvalidate_call *pc;
-	struct svsm_call call = {};
-	unsigned long flags;
-	bool action;
-	u64 pc_pa;
-	int ret;
-
-	/*
-	 * This can be called very early in the boot, use native functions in
-	 * order to avoid paravirt issues.
-	 */
-	flags = native_local_irq_save();
-
-	/*
-	 * The SVSM calling area (CA) can support processing 510 entries at a
-	 * time. Loop through the Page State Change descriptor until the CA is
-	 * full or the last entry in the descriptor is reached, at which time
-	 * the SVSM is invoked. This repeats until all entries in the descriptor
-	 * are processed.
-	 */
-	call.caa = svsm_get_caa();
-
-	pc = (struct svsm_pvalidate_call *)call.caa->svsm_buffer;
-	pc_pa = svsm_get_caa_pa() + offsetof(struct svsm_ca, svsm_buffer);
-
-	/* Protocol 0, Call ID 1 */
-	call.rax = SVSM_CORE_CALL(SVSM_CORE_PVALIDATE);
-	call.rcx = pc_pa;
-
-	for (i = 0; i <= desc->hdr.end_entry;) {
-		i = svsm_build_ca_from_psc_desc(desc, i, pc);
-
-		do {
-			ret = svsm_perform_call_protocol(&call);
-			if (!ret)
-				continue;
-
-			/*
-			 * Check if the entry failed because of an RMP mismatch (a
-			 * PVALIDATE at 2M was requested, but the page is mapped in
-			 * the RMP as 4K).
-			 */
-
-			if (call.rax_out == SVSM_PVALIDATE_FAIL_SIZEMISMATCH &&
-			    pc->entry[pc->cur_index].page_size == RMP_PG_SIZE_2M) {
-				/* Save this entry for post-processing at 4K */
-				pv_4k[pv_4k_count++] = pc->entry[pc->cur_index];
-
-				/* Skip to the next one unless at the end of the list */
-				pc->cur_index++;
-				if (pc->cur_index < pc->num_entries)
-					ret = -EAGAIN;
-				else
-					ret = 0;
-			}
-		} while (ret == -EAGAIN);
-
-		if (ret)
-			svsm_pval_terminate(pc, ret, call.rax_out);
-	}
-
-	/* Process any entries that failed to be validated at 2M and validate them at 4K */
-	for (i = 0; i < pv_4k_count; i++) {
-		u64 pfn, pfn_end;
-
-		action  = pv_4k[i].action;
-		pfn     = pv_4k[i].pfn;
-		pfn_end = pfn + 512;
-
-		while (pfn < pfn_end) {
-			pfn = svsm_build_ca_from_pfn_range(pfn, pfn_end, action, pc);
-
-			ret = svsm_perform_call_protocol(&call);
-			if (ret)
-				svsm_pval_terminate(pc, ret, call.rax_out);
-		}
-	}
-
-	native_local_irq_restore(flags);
-}
-
 static void pvalidate_pages(struct snp_psc_desc *desc)
 {
 	struct psc_entry *e;
@@ -1589,56 +1320,6 @@ static int __init report_snp_info(void)
 }
 arch_initcall(report_snp_info);
 
-static void update_attest_input(struct svsm_call *call, struct svsm_attest_call *input)
-{
-	/* If (new) lengths have been returned, propagate them up */
-	if (call->rcx_out != call->rcx)
-		input->manifest_buf.len = call->rcx_out;
-
-	if (call->rdx_out != call->rdx)
-		input->certificates_buf.len = call->rdx_out;
-
-	if (call->r8_out != call->r8)
-		input->report_buf.len = call->r8_out;
-}
-
-int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call,
-			      struct svsm_attest_call *input)
-{
-	struct svsm_attest_call *ac;
-	unsigned long flags;
-	u64 attest_call_pa;
-	int ret;
-
-	if (!snp_vmpl)
-		return -EINVAL;
-
-	local_irq_save(flags);
-
-	call->caa = svsm_get_caa();
-
-	ac = (struct svsm_attest_call *)call->caa->svsm_buffer;
-	attest_call_pa = svsm_get_caa_pa() + offsetof(struct svsm_ca, svsm_buffer);
-
-	*ac = *input;
-
-	/*
-	 * Set input registers for the request and set RDX and R8 to known
-	 * values in order to detect length values being returned in them.
-	 */
-	call->rax = call_id;
-	call->rcx = attest_call_pa;
-	call->rdx = -1;
-	call->r8 = -1;
-	ret = svsm_perform_call_protocol(call);
-	update_attest_input(call, input);
-
-	local_irq_restore(flags);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snp_issue_svsm_attest_req);
-
 static int snp_issue_guest_request(struct snp_guest_req *req)
 {
 	struct snp_req_data *input = &req->input;
@@ -1703,64 +1384,6 @@ static int snp_issue_guest_request(struct snp_guest_req *req)
 	return ret;
 }
 
-/**
- * snp_svsm_vtpm_probe() - Probe if SVSM provides a vTPM device
- *
- * Check that there is SVSM and that it supports at least TPM_SEND_COMMAND
- * which is the only request used so far.
- *
- * Return: true if the platform provides a vTPM SVSM device, false otherwise.
- */
-static bool snp_svsm_vtpm_probe(void)
-{
-	struct svsm_call call = {};
-
-	/* The vTPM device is available only if a SVSM is present */
-	if (!snp_vmpl)
-		return false;
-
-	call.caa = svsm_get_caa();
-	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
-
-	if (svsm_perform_call_protocol(&call))
-		return false;
-
-	/* Check platform commands contains TPM_SEND_COMMAND - platform command 8 */
-	return call.rcx_out & BIT_ULL(8);
-}
-
-/**
- * snp_svsm_vtpm_send_command() - Execute a vTPM operation on SVSM
- * @buffer: A buffer used to both send the command and receive the response.
- *
- * Execute a SVSM_VTPM_CMD call as defined by
- * "Secure VM Service Module for SEV-SNP Guests" Publication # 58019 Revision: 1.00
- *
- * All command request/response buffers have a common structure as specified by
- * the following table:
- *     Byte      Size       In/Out    Description
- *     Offset    (Bytes)
- *     0x000     4          In        Platform command
- *                          Out       Platform command response size
- *
- * Each command can build upon this common request/response structure to create
- * a structure specific to the command. See include/linux/tpm_svsm.h for more
- * details.
- *
- * Return: 0 on success, -errno on failure
- */
-int snp_svsm_vtpm_send_command(u8 *buffer)
-{
-	struct svsm_call call = {};
-
-	call.caa = svsm_get_caa();
-	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_CMD);
-	call.rcx = __pa(buffer);
-
-	return svsm_perform_call_protocol(&call);
-}
-EXPORT_SYMBOL_GPL(snp_svsm_vtpm_send_command);
-
 static struct platform_device sev_guest_device = {
 	.name		= "sev-guest",
 	.id		= -1,
diff --git a/arch/x86/coco/sev/internal.h b/arch/x86/coco/sev/internal.h
index af991f1da095..039326b5c799 100644
--- a/arch/x86/coco/sev/internal.h
+++ b/arch/x86/coco/sev/internal.h
@@ -66,6 +66,9 @@ extern u64 boot_svsm_caa_pa;
 
 enum es_result verify_exception_info(struct ghcb *ghcb, struct es_em_ctxt *ctxt);
 void vc_forward_exception(struct es_em_ctxt *ctxt);
+void svsm_pval_pages(struct snp_psc_desc *desc);
+int svsm_perform_call_protocol(struct svsm_call *call);
+bool snp_svsm_vtpm_probe(void);
 
 static inline u64 sev_es_rd_ghcb_msr(void)
 {
@@ -87,4 +90,30 @@ enum es_result sev_es_ghcb_handle_msr(struct ghcb *ghcb, struct es_em_ctxt *ctxt
 u64 get_hv_features(void);
 
 const struct snp_cpuid_table *snp_cpuid_get_table(void);
+
+static inline struct svsm_ca *svsm_get_caa(void)
+{
+	if (sev_cfg.use_cas)
+		return this_cpu_read(svsm_caa);
+	else
+		return rip_rel_ptr(&boot_svsm_ca_page);
+}
+
+static inline u64 svsm_get_caa_pa(void)
+{
+	if (sev_cfg.use_cas)
+		return this_cpu_read(svsm_caa_pa);
+	else
+		return boot_svsm_caa_pa;
+}
+
+static inline void __pval_terminate(u64 pfn, bool action, unsigned int page_size,
+				    int ret, u64 svsm_ret)
+{
+	WARN(1, "PVALIDATE failure: pfn: 0x%llx, action: %u, size: %u, ret: %d, svsm_ret: 0x%llx\n",
+	     pfn, action, page_size, ret, svsm_ret);
+
+	sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PVALIDATE);
+}
+
 #endif /* __X86_COCO_SEV_INTERNAL_H__ */
diff --git a/arch/x86/coco/sev/svsm.c b/arch/x86/coco/sev/svsm.c
new file mode 100644
index 000000000000..2acf4a76afe7
--- /dev/null
+++ b/arch/x86/coco/sev/svsm.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SVSM support code
+ */
+
+#include <linux/types.h>
+
+#include <asm/sev.h>
+
+#include "internal.h"
+
+/* For early boot SVSM communication */
+struct svsm_ca boot_svsm_ca_page __aligned(PAGE_SIZE);
+SYM_PIC_ALIAS(boot_svsm_ca_page);
+
+/*
+ * SVSM related information:
+ *   During boot, the page tables are set up as identity mapped and later
+ *   changed to use kernel virtual addresses. Maintain separate virtual and
+ *   physical addresses for the CAA to allow SVSM functions to be used during
+ *   early boot, both with identity mapped virtual addresses and proper kernel
+ *   virtual addresses.
+ */
+u64 boot_svsm_caa_pa __ro_after_init;
+SYM_PIC_ALIAS(boot_svsm_caa_pa);
+
+DEFINE_PER_CPU(struct svsm_ca *, svsm_caa);
+DEFINE_PER_CPU(u64, svsm_caa_pa);
+
+static int svsm_perform_ghcb_protocol(struct ghcb *ghcb, struct svsm_call *call)
+{
+	struct es_em_ctxt ctxt;
+	u8 pending = 0;
+
+	vc_ghcb_invalidate(ghcb);
+
+	/*
+	 * Fill in protocol and format specifiers. This can be called very early
+	 * in the boot, so use rip-relative references as needed.
+	 */
+	ghcb->protocol_version = ghcb_version;
+	ghcb->ghcb_usage       = GHCB_DEFAULT_USAGE;
+
+	ghcb_set_sw_exit_code(ghcb, SVM_VMGEXIT_SNP_RUN_VMPL);
+	ghcb_set_sw_exit_info_1(ghcb, 0);
+	ghcb_set_sw_exit_info_2(ghcb, 0);
+
+	sev_es_wr_ghcb_msr(__pa(ghcb));
+
+	svsm_issue_call(call, &pending);
+
+	if (pending)
+		return -EINVAL;
+
+	switch (verify_exception_info(ghcb, &ctxt)) {
+	case ES_OK:
+		break;
+	case ES_EXCEPTION:
+		vc_forward_exception(&ctxt);
+		fallthrough;
+	default:
+		return -EINVAL;
+	}
+
+	return svsm_process_result_codes(call);
+}
+
+int svsm_perform_call_protocol(struct svsm_call *call)
+{
+	struct ghcb_state state;
+	unsigned long flags;
+	struct ghcb *ghcb;
+	int ret;
+
+	flags = native_local_irq_save();
+
+	if (sev_cfg.ghcbs_initialized)
+		ghcb = __sev_get_ghcb(&state);
+	else if (boot_ghcb)
+		ghcb = boot_ghcb;
+	else
+		ghcb = NULL;
+
+	do {
+		ret = ghcb ? svsm_perform_ghcb_protocol(ghcb, call)
+			   : __pi_svsm_perform_msr_protocol(call);
+	} while (ret == -EAGAIN);
+
+	if (sev_cfg.ghcbs_initialized)
+		__sev_put_ghcb(&state);
+
+	native_local_irq_restore(flags);
+
+	return ret;
+}
+
+static u64 svsm_build_ca_from_pfn_range(u64 pfn, u64 pfn_end, bool action,
+					struct svsm_pvalidate_call *pc)
+{
+	struct svsm_pvalidate_entry *pe;
+
+	/* Nothing in the CA yet */
+	pc->num_entries = 0;
+	pc->cur_index   = 0;
+
+	pe = &pc->entry[0];
+
+	while (pfn < pfn_end) {
+		pe->page_size = RMP_PG_SIZE_4K;
+		pe->action    = action;
+		pe->ignore_cf = 0;
+		pe->rsvd      = 0;
+		pe->pfn       = pfn;
+
+		pe++;
+		pfn++;
+
+		pc->num_entries++;
+		if (pc->num_entries == SVSM_PVALIDATE_MAX_COUNT)
+			break;
+	}
+
+	return pfn;
+}
+
+static int svsm_build_ca_from_psc_desc(struct snp_psc_desc *desc, unsigned int desc_entry,
+				       struct svsm_pvalidate_call *pc)
+{
+	struct svsm_pvalidate_entry *pe;
+	struct psc_entry *e;
+
+	/* Nothing in the CA yet */
+	pc->num_entries = 0;
+	pc->cur_index   = 0;
+
+	pe = &pc->entry[0];
+	e  = &desc->entries[desc_entry];
+
+	while (desc_entry <= desc->hdr.end_entry) {
+		pe->page_size = e->pagesize ? RMP_PG_SIZE_2M : RMP_PG_SIZE_4K;
+		pe->action    = e->operation == SNP_PAGE_STATE_PRIVATE;
+		pe->ignore_cf = 0;
+		pe->rsvd      = 0;
+		pe->pfn       = e->gfn;
+
+		pe++;
+		e++;
+
+		desc_entry++;
+		pc->num_entries++;
+		if (pc->num_entries == SVSM_PVALIDATE_MAX_COUNT)
+			break;
+	}
+
+	return desc_entry;
+}
+
+static void svsm_pval_terminate(struct svsm_pvalidate_call *pc, int ret, u64 svsm_ret)
+{
+	unsigned int page_size;
+	bool action;
+	u64 pfn;
+
+	pfn = pc->entry[pc->cur_index].pfn;
+	action = pc->entry[pc->cur_index].action;
+	page_size = pc->entry[pc->cur_index].page_size;
+
+	__pval_terminate(pfn, action, page_size, ret, svsm_ret);
+}
+
+void svsm_pval_pages(struct snp_psc_desc *desc)
+{
+	struct svsm_pvalidate_entry pv_4k[VMGEXIT_PSC_MAX_ENTRY];
+	unsigned int i, pv_4k_count = 0;
+	struct svsm_pvalidate_call *pc;
+	struct svsm_call call = {};
+	unsigned long flags;
+	bool action;
+	u64 pc_pa;
+	int ret;
+
+	/*
+	 * This can be called very early in the boot, use native functions in
+	 * order to avoid paravirt issues.
+	 */
+	flags = native_local_irq_save();
+
+	/*
+	 * The SVSM calling area (CA) can support processing 510 entries at a
+	 * time. Loop through the Page State Change descriptor until the CA is
+	 * full or the last entry in the descriptor is reached, at which time
+	 * the SVSM is invoked. This repeats until all entries in the descriptor
+	 * are processed.
+	 */
+	call.caa = svsm_get_caa();
+
+	pc = (struct svsm_pvalidate_call *)call.caa->svsm_buffer;
+	pc_pa = svsm_get_caa_pa() + offsetof(struct svsm_ca, svsm_buffer);
+
+	/* Protocol 0, Call ID 1 */
+	call.rax = SVSM_CORE_CALL(SVSM_CORE_PVALIDATE);
+	call.rcx = pc_pa;
+
+	for (i = 0; i <= desc->hdr.end_entry;) {
+		i = svsm_build_ca_from_psc_desc(desc, i, pc);
+
+		do {
+			ret = svsm_perform_call_protocol(&call);
+			if (!ret)
+				continue;
+
+			/*
+			 * Check if the entry failed because of an RMP mismatch (a
+			 * PVALIDATE at 2M was requested, but the page is mapped in
+			 * the RMP as 4K).
+			 */
+
+			if (call.rax_out == SVSM_PVALIDATE_FAIL_SIZEMISMATCH &&
+			    pc->entry[pc->cur_index].page_size == RMP_PG_SIZE_2M) {
+				/* Save this entry for post-processing at 4K */
+				pv_4k[pv_4k_count++] = pc->entry[pc->cur_index];
+
+				/* Skip to the next one unless at the end of the list */
+				pc->cur_index++;
+				if (pc->cur_index < pc->num_entries)
+					ret = -EAGAIN;
+				else
+					ret = 0;
+			}
+		} while (ret == -EAGAIN);
+
+		if (ret)
+			svsm_pval_terminate(pc, ret, call.rax_out);
+	}
+
+	/* Process any entries that failed to be validated at 2M and validate them at 4K */
+	for (i = 0; i < pv_4k_count; i++) {
+		u64 pfn, pfn_end;
+
+		action  = pv_4k[i].action;
+		pfn     = pv_4k[i].pfn;
+		pfn_end = pfn + 512;
+
+		while (pfn < pfn_end) {
+			pfn = svsm_build_ca_from_pfn_range(pfn, pfn_end, action, pc);
+
+			ret = svsm_perform_call_protocol(&call);
+			if (ret)
+				svsm_pval_terminate(pc, ret, call.rax_out);
+		}
+	}
+
+	native_local_irq_restore(flags);
+}
+
+static void update_attest_input(struct svsm_call *call, struct svsm_attest_call *input)
+{
+	/* If (new) lengths have been returned, propagate them up */
+	if (call->rcx_out != call->rcx)
+		input->manifest_buf.len = call->rcx_out;
+
+	if (call->rdx_out != call->rdx)
+		input->certificates_buf.len = call->rdx_out;
+
+	if (call->r8_out != call->r8)
+		input->report_buf.len = call->r8_out;
+}
+
+int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call,
+			      struct svsm_attest_call *input)
+{
+	struct svsm_attest_call *ac;
+	unsigned long flags;
+	u64 attest_call_pa;
+	int ret;
+
+	if (!snp_vmpl)
+		return -EINVAL;
+
+	local_irq_save(flags);
+
+	call->caa = svsm_get_caa();
+
+	ac = (struct svsm_attest_call *)call->caa->svsm_buffer;
+	attest_call_pa = svsm_get_caa_pa() + offsetof(struct svsm_ca, svsm_buffer);
+
+	*ac = *input;
+
+	/*
+	 * Set input registers for the request and set RDX and R8 to known
+	 * values in order to detect length values being returned in them.
+	 */
+	call->rax = call_id;
+	call->rcx = attest_call_pa;
+	call->rdx = -1;
+	call->r8 = -1;
+	ret = svsm_perform_call_protocol(call);
+	update_attest_input(call, input);
+
+	local_irq_restore(flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snp_issue_svsm_attest_req);
+
+/**
+ * snp_svsm_vtpm_send_command() - Execute a vTPM operation on SVSM
+ * @buffer: A buffer used to both send the command and receive the response.
+ *
+ * Execute a SVSM_VTPM_CMD call as defined by
+ * "Secure VM Service Module for SEV-SNP Guests" Publication # 58019 Revision: 1.00
+ *
+ * All command request/response buffers have a common structure as specified by
+ * the following table:
+ *     Byte      Size       In/Out    Description
+ *     Offset    (Bytes)
+ *     0x000     4          In        Platform command
+ *                          Out       Platform command response size
+ *
+ * Each command can build upon this common request/response structure to create
+ * a structure specific to the command. See include/linux/tpm_svsm.h for more
+ * details.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int snp_svsm_vtpm_send_command(u8 *buffer)
+{
+	struct svsm_call call = {};
+
+	call.caa = svsm_get_caa();
+	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_CMD);
+	call.rcx = __pa(buffer);
+
+	return svsm_perform_call_protocol(&call);
+}
+EXPORT_SYMBOL_GPL(snp_svsm_vtpm_send_command);
+
+/**
+ * snp_svsm_vtpm_probe() - Probe if SVSM provides a vTPM device
+ *
+ * Check that there is SVSM and that it supports at least TPM_SEND_COMMAND
+ * which is the only request used so far.
+ *
+ * Return: true if the platform provides a vTPM SVSM device, false otherwise.
+ */
+bool snp_svsm_vtpm_probe(void)
+{
+	struct svsm_call call = {};
+
+	/* The vTPM device is available only if a SVSM is present */
+	if (!snp_vmpl)
+		return false;
+
+	call.caa = svsm_get_caa();
+	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
+
+	if (svsm_perform_call_protocol(&call))
+		return false;
+
+	/* Check platform commands contains TPM_SEND_COMMAND - platform command 8 */
+	return call.rcx_out & BIT_ULL(8);
+}
-- 
2.51.0

