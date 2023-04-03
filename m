Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421E35696
	for <linux-coco@lists.linux.dev>; Mon,  3 Apr 2023 14:05:32 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id q102so27290473pjq.3
        for <linux-coco@lists.linux.dev>; Mon, 03 Apr 2023 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680530731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn2wKwx0EXmrg4KUjii9CLG1/m9PFl3nKLSeijJ1CpQ=;
        b=bpKyUkA1BBY1Z8ckFIx6sm8b6cCHlPM87VXGt5UEhc2HjF2VVp1oJCzKyVvcA3lOAo
         17R5cyzdXHXyhp0+HVocGg6LkmttssT7gvSXdAgjGl36dq8ejzCOrDYjKs9yCWjKZ/nU
         N4+PTIFOPadNrsJO2ZDeNJ/tMy3LO/8xYGHR9NhvpLOdo04i5UrCDXlc4RjhUuPIYH4O
         smVPF7cWsawXXpUnRln2PoRwwBbbSFvlOeq1PxciVcAhAE2BkVj1PKsvhKxk06JUI8jL
         5stDFNzAv80qVPEEJnx2w2qMP0gm6ZQYEam5LzVdE4ATvyP7KWrbaFn8AJNejem8o2bI
         ucQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680530731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn2wKwx0EXmrg4KUjii9CLG1/m9PFl3nKLSeijJ1CpQ=;
        b=HwFYofv4yEvARzjVusZ/U4p4hEVYQlxoKHqs7aP55Urn6dfpP9xv/10VM6xKP+7/ir
         dnAy+d18vNfIvPFTm09JqgFObYQ5puvmHFbZv6qfmgtXwgyJnwIgZA+qY5nk6xTLK8+J
         LEMrJAxpqo4ob7x3QnbEq9nEPGAEuoX8CtEvQtjwBEgXN6fcvhCKQ570ieXjNEkN7/u2
         vQRBwE1zOI+F23XD8ByhcOCUgaMt3TzorZk+fSS0qg4clEy6qwUYovZfFPBNEpaZC0E4
         SdkjXMlqD4Cl2Jkzk2lR9sECwrLzgBejcjv2636Rt2YK8Hq0QzYJ4xPfzKn8YPySzn4+
         xwVw==
X-Gm-Message-State: AAQBX9dJ05VjL1NtZUQp3Y8lwDevh3MqKJj6ZfSBHM21BxNQ6WCTO1Zd
	fpOh4TNx5AVuBEXM9uX4D0I=
X-Google-Smtp-Source: AKy350YMy6MWeagJFudQRTfciSmnNqn7Ihy86w3MRx93dio4hrdleDz+fZZhiUbRi9zPHWP23WD/Qw==
X-Received: by 2002:a17:903:2312:b0:1a1:a6e5:764b with SMTP id d18-20020a170903231200b001a1a6e5764bmr48814320plh.60.1680530731648;
        Mon, 03 Apr 2023 07:05:31 -0700 (PDT)
Received: from localhost ([47.88.5.130])
        by smtp.gmail.com with ESMTPSA id f19-20020a170902e99300b0019acd3151d0sm6649416plb.114.2023.04.03.07.05.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Apr 2023 07:05:31 -0700 (PDT)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	"H. Peter Anvin" <hpa@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Andy Lutomirski <luto@kernel.org>,
	Asit Mallick <asit.k.mallick@intel.com>,
	Cfir Cohen <cfir@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	David Kaplan <David.Kaplan@amd.com>,
	David Rientjes <rientjes@google.com>,
	Dirk Hohndel <dirkhh@vmware.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Jiri Slaby <jslaby@suse.cz>,
	Joerg Roedel <joro@8bytes.org>,
	Juergen Gross <jgross@suse.com>,
	Kees Cook <keescook@chromium.org>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Stunes <mstunes@vmware.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Raj Ashok <ashok.raj@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tony Luck <tony.luck@intel.com>,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [RFC PATCH 5/7] x86/entry: Use atomic-IST-entry for MCE and DB
Date: Mon,  3 Apr 2023 22:06:03 +0800
Message-Id: <20230403140605.540512-6-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20230403140605.540512-1-jiangshanlai@gmail.com>
References: <20230403140605.540512-1-jiangshanlai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <jiangshan.ljs@antgroup.com>

Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
---
 arch/x86/entry/entry_64.S       | 53 ---------------------------------
 arch/x86/entry/ist_entry.c      |  4 +--
 arch/x86/include/asm/idtentry.h |  4 +--
 3 files changed, 4 insertions(+), 57 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 2bb7ab8512dc..e4ddc793f841 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -621,59 +621,6 @@ _ASM_NOKPROBE(\asmsym)
 SYM_CODE_END(\asmsym)
 .endm
 
-/**
- * idtentry_mce_db - Macro to generate entry stubs for #MC and #DB
- * @vector:		Vector number
- * @asmsym:		ASM symbol for the entry point
- * @cfunc:		C function to be called
- *
- * The macro emits code to set up the kernel context for #MC and #DB
- *
- * If the entry comes from user space it uses the normal entry path
- * including the return to user space work and preemption checks on
- * exit.
- *
- * If hits in kernel mode then it needs to go through the paranoid
- * entry as the exception can hit any random state. No preemption
- * check on exit to keep the paranoid path simple.
- */
-.macro idtentry_mce_db vector asmsym cfunc
-SYM_CODE_START(\asmsym)
-	UNWIND_HINT_IRET_REGS
-	ENDBR
-	ASM_CLAC
-	cld
-
-	pushq	$-1			/* ORIG_RAX: no syscall to restart */
-
-	/*
-	 * If the entry is from userspace, switch stacks and treat it as
-	 * a normal entry.
-	 */
-	testb	$3, CS-ORIG_RAX(%rsp)
-	jnz	.Lfrom_usermode_switch_stack_\@
-
-	PUSH_AND_CLEAR_REGS
-	UNWIND_HINT_REGS
-	ENCODE_FRAME_POINTER
-
-	/* paranoid_entry returns GS information for paranoid_exit in EBX. */
-	call	paranoid_entry
-
-	movq	%rsp, %rdi		/* pt_regs pointer */
-
-	call	\cfunc
-
-	jmp	paranoid_exit
-
-	/* Switch to the regular task stack and use the noist entry point */
-.Lfrom_usermode_switch_stack_\@:
-	idtentry_body noist_\cfunc, has_error_code=0
-
-_ASM_NOKPROBE(\asmsym)
-SYM_CODE_END(\asmsym)
-.endm
-
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 /**
  * idtentry_vc - Macro to generate entry stub for #VC
diff --git a/arch/x86/entry/ist_entry.c b/arch/x86/entry/ist_entry.c
index 407571cc4a8c..946b3b537bd5 100644
--- a/arch/x86/entry/ist_entry.c
+++ b/arch/x86/entry/ist_entry.c
@@ -42,8 +42,8 @@ static __always_inline bool identify_ist_##sym_name(				\
 }
 
 DEFINE_IDENTIFY_IST(NMI, nmi, true)
-DEFINE_IDENTIFY_IST(DB, debug, false)
-DEFINE_IDENTIFY_IST(MCE, machine_check, false)
+DEFINE_IDENTIFY_IST(DB, debug, true)
+DEFINE_IDENTIFY_IST(MCE, machine_check, IS_ENABLED(CONFIG_X86_MCE))
 DEFINE_IDENTIFY_IST(VC, vmm_communication, false)
 
 static __always_inline bool identify_ist(
diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index b568f1de6da6..01f3152ffe82 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -454,10 +454,10 @@ __visible noinstr void func(struct pt_regs *regs,			\
 	idtentry_ist vector asm_##func func func has_error_code=0 stack_offset=CEA_stacks_NMI
 
 # define DECLARE_IDTENTRY_MCE(vector, func)				\
-	idtentry_mce_db vector asm_##func func
+	idtentry_ist vector asm_##func func noist_##func has_error_code=0 stack_offset=CEA_stacks_MCE
 
 # define DECLARE_IDTENTRY_DEBUG(vector, func)				\
-	idtentry_mce_db vector asm_##func func
+	idtentry_ist vector asm_##func func noist_##func has_error_code=0 stack_offset=CEA_stacks_DB
 
 # define DECLARE_IDTENTRY_DF(vector, func)				\
 	idtentry_df vector asm_##func func
-- 
2.19.1.6.gb485710b

