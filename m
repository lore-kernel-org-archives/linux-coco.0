Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613B65696
	for <linux-coco@lists.linux.dev>; Mon,  3 Apr 2023 14:05:03 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id o2so28107966plg.4
        for <linux-coco@lists.linux.dev>; Mon, 03 Apr 2023 07:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680530703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhwgcDtAklxhqM6EYQPuvUq6965STEsFa04g+nFznic=;
        b=Hel87nL2p8AdJk1YAXlMZNr6u+Kyo+BZ3Q4c7lJ4uY9DgXLnyJhjYijHU8kvz4xTAl
         lvAe0p7Mmzkp4d4j5eq4FfqeqenxwXTf6z2NGqxgESMZHL/fL2y+xbXQGxCHVFA9xo4h
         V0Snthjpt0jP4POzvJlQ4FNwbaDHXHQcZR6w0dcT8iFP11VdsmMpwqnY/5CjCblOgYmu
         cAC62agxmrtJ16rqlfD12Hb0rMFxVy18UwEQriL3uiNa6qhISCkNJZy5my1Ebae43KOD
         0hIvN8ny4TGjXoVj8JkjLtzY26lPcfLSwNQhYG1jC8J406wFY/zqTiEvJBNKfGIrgaVV
         quzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680530703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhwgcDtAklxhqM6EYQPuvUq6965STEsFa04g+nFznic=;
        b=W/MwB0gDqYnecjla7SdBSJCiJ6woK21jwFQqF1o8zjRm6dIh4GPDi6smsoO63dfXsQ
         UKjTwseY7jBhfhdE9q4ZNac8M0NpP4GUhHSBhKeq6WM64fWSh13NeEC38iS0OzxdrOeX
         LYYWjGHMrSXsrAwyoReG1OgIJmzJR2jLxbh+EP8khg3q+9yr5RFGqrgXLePLcPr2j0z1
         XfuBVIClPgXfLqSS1ix8wGJ5B8I9IhplE32TpcGzehKlqm0AqenyYvgKznIt8wD+/2Hd
         P5YpInPkOhYmzw2kAZzjYCPiP+q40i/qZAoONBoToaXhdxgjM52D3jcgNy7f/UDeV7jn
         BVig==
X-Gm-Message-State: AAQBX9cRuHfLc5JcKyZWbb5MuCrSSk2tIYn4RYARtk5pMOiISIEHMylX
	5IvOUTvWCWJLJyB02gSJXjg=
X-Google-Smtp-Source: AKy350YnS84lfoLQEq2h2XyjaFwgl6Kx+j2bUv9CN4OsPSXeoGN8xOUShHAKm7jSA2d910IbQAmmiw==
X-Received: by 2002:a17:902:d4c6:b0:1a1:cc5a:b07 with SMTP id o6-20020a170902d4c600b001a1cc5a0b07mr45012190plg.37.1680530702603;
        Mon, 03 Apr 2023 07:05:02 -0700 (PDT)
Received: from localhost ([47.89.225.180])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001a072be70desm6696500plz.41.2023.04.03.07.05.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Apr 2023 07:05:02 -0700 (PDT)
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
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [RFC PATCH 1/7] x86/entry: Move PUSH_AND_CLEAR_REGS out of paranoid_entry
Date: Mon,  3 Apr 2023 22:05:59 +0800
Message-Id: <20230403140605.540512-2-jiangshanlai@gmail.com>
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

Prepare to call paranoid_entry() with pt_regs pushed.

Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
---
 arch/x86/entry/entry_64.S | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index eccc3431e515..49ddc4dd3117 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -475,11 +475,13 @@ SYM_CODE_START(\asmsym)
 	testb	$3, CS-ORIG_RAX(%rsp)
 	jnz	.Lfrom_usermode_switch_stack_\@
 
+	PUSH_AND_CLEAR_REGS
+	UNWIND_HINT_REGS
+	ENCODE_FRAME_POINTER
+
 	/* paranoid_entry returns GS information for paranoid_exit in EBX. */
 	call	paranoid_entry
 
-	UNWIND_HINT_REGS
-
 	movq	%rsp, %rdi		/* pt_regs pointer */
 
 	call	\cfunc
@@ -530,14 +532,16 @@ SYM_CODE_START(\asmsym)
 	testb	$3, CS-ORIG_RAX(%rsp)
 	jnz	.Lfrom_usermode_switch_stack_\@
 
+	PUSH_AND_CLEAR_REGS
+	UNWIND_HINT_REGS
+	ENCODE_FRAME_POINTER
+
 	/*
 	 * paranoid_entry returns SWAPGS flag for paranoid_exit in EBX.
 	 * EBX == 0 -> SWAPGS, EBX == 1 -> no SWAPGS
 	 */
 	call	paranoid_entry
 
-	UNWIND_HINT_REGS
-
 	/*
 	 * Switch off the IST stack to make it free for nested exceptions. The
 	 * vc_switch_off_ist() function will switch back to the interrupted
@@ -587,9 +591,12 @@ SYM_CODE_START(\asmsym)
 	ASM_CLAC
 	cld
 
+	PUSH_AND_CLEAR_REGS
+	UNWIND_HINT_REGS
+	ENCODE_FRAME_POINTER
+
 	/* paranoid_entry returns GS information for paranoid_exit in EBX. */
 	call	paranoid_entry
-	UNWIND_HINT_REGS
 
 	movq	%rsp, %rdi		/* pt_regs pointer into first argument */
 	movq	ORIG_RAX(%rsp), %rsi	/* get error code into 2nd argument*/
@@ -903,8 +910,8 @@ SYM_CODE_END(xen_failsafe_callback)
 #endif /* CONFIG_XEN_PV */
 
 /*
- * Save all registers in pt_regs. Return GSBASE related information
- * in EBX depending on the availability of the FSGSBASE instructions:
+ * Return GSBASE related information in EBX depending on the availability
+ * of the FSGSBASE instructions:
  *
  * FSGSBASE	R/EBX
  *     N        0 -> SWAPGS on exit
@@ -915,11 +922,8 @@ SYM_CODE_END(xen_failsafe_callback)
  * R14 - old CR3
  * R15 - old SPEC_CTRL
  */
-SYM_CODE_START(paranoid_entry)
+SYM_FUNC_START(paranoid_entry)
 	ANNOTATE_NOENDBR
-	UNWIND_HINT_FUNC
-	PUSH_AND_CLEAR_REGS save_ret=1
-	ENCODE_FRAME_POINTER 8
 
 	/*
 	 * Always stash CR3 in %r14.  This value will be restored,
@@ -988,7 +992,7 @@ SYM_CODE_START(paranoid_entry)
 	UNTRAIN_RET_FROM_CALL
 
 	RET
-SYM_CODE_END(paranoid_entry)
+SYM_FUNC_END(paranoid_entry)
 
 /*
  * "Paranoid" exit path from exception stack.  This is invoked
@@ -1443,6 +1447,10 @@ end_repeat_nmi:
 	 */
 	pushq	$-1				/* ORIG_RAX: no syscall to restart */
 
+	PUSH_AND_CLEAR_REGS
+	UNWIND_HINT_REGS
+	ENCODE_FRAME_POINTER
+
 	/*
 	 * Use paranoid_entry to handle SWAPGS, but no need to use paranoid_exit
 	 * as we should not be calling schedule in NMI context.
@@ -1451,7 +1459,6 @@ end_repeat_nmi:
 	 * exceptions might do.
 	 */
 	call	paranoid_entry
-	UNWIND_HINT_REGS
 
 	movq	%rsp, %rdi
 	movq	$-1, %rsi
-- 
2.19.1.6.gb485710b

