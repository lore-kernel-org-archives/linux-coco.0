Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E99360EC3
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917948; cv=none; b=M4703YQHKB0TOBL8Mhi5AVuGBULY2jdWnwtZTuXl9hfFFBQExlV3wq2lXBEbph+NaurRhJ/xRRIGWTgQ4Ui3DBbhAH48heZHhxYXSkfMdqlBdT4fOVuJ4iP0f5ZxaBY92InVaqAmbqfJOR2TdeZHQ7YFP/w7UeiVEbgYm9XJDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917948; c=relaxed/simple;
	bh=s7fFFa2eJMQ3eN2H7XJtrr9mTMWELH78gjwCpiFzx3o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pomGW4v9v5EJ0iPBjAiVKBmT8Tb1D9Q1LWyYqYdzOau8q+i7avSbht3EjZfsrHaEr2u/yCDJPqTaHw2d3epr7Js0k7E3tTSHLNFyswJCgwrMOyCjDEWMQdhcoQwPPHguQpSmnb1237wv+EIDQ2wPjET/XL7OgVd67itbFWx3O5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VMQ0QwYF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VMQ0QwYF"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ca5d2474c7so15895805ad.2
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782917946; x=1783522746; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vdTrJVjmaGZK4bIS2S2vPN6p/bM+L67mDpK1aprSBRM=;
        b=VMQ0QwYFM48r1bIpaQmanZITmZZviRyRCFkdsiprLWelWd5193ov/qxBt1vMjUCHO4
         Y3mAN0PyiVuC8FzfWKBIDvf9AHQQ4PrThVeywdeLFdhqkpOxi8VHhLYHNQnKbqZLl9bu
         TFnX6XE/gLbcqcIw64FmUUlwYMRZ/LLboZRhiTy33QY94oeuFdSbEyKvc4QLVks9Wgw9
         3IsyWeZyfj1ETliFTNouVLbO1Kcz50mTDONnm3PhQMqc05Ehvli4bqJbVhCWj9XRM1mP
         tuSAOH5UIbf8scx0GFbgf9uTD6TnVRl//2FlFod6pPpxEjXpm8t9mBuQTv7Tbk3gKMcv
         TbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917946; x=1783522746;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdTrJVjmaGZK4bIS2S2vPN6p/bM+L67mDpK1aprSBRM=;
        b=aasG38DflVV78L03LGbuxjKtQCm7FLbEF6Ug05Nr+My66eY8oPJnke8bEaHcaDpIZE
         Qj+QKMA6Q7XNDVCD+wwY9Cosuz+CqG87HkT4Oz5pUymftfhedo0QsIxa5VNoySjWYYO2
         oAdvtQo+G8sbfWDHtigmnmJDaWO//hHKZsSH9i66B8hjbKaEM9F98rVOC20zXyNBSp2O
         dTkoDdLbecQ5We59fJcj3uS3cdZVQR6s+UaaIh6XPqTUBk0DPmvrH303uMyChwLNNPi1
         GegOe+C6yEvKQLCNrnDeXTyX1mCKf5MWFxZWxrY3v5pynIh/EwOvsFgT9SpMO/sc+Pna
         B79Q==
X-Forwarded-Encrypted: i=1; AHgh+RobxS6YQrO89BJbHhr+J06Ie32OmlrlKpl3TtJksJ7kNHKa5yZP3BKxsUCztqvIq1v05kHiMypG4oZt@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8dD7EambBEL44HQD8uPK9N1SjN1VIwT0N/8UqIQdLSrXMDCFt
	8IOgXrk/qeTomAG++RYTO7TwvuN1GCZ1DuV+z7+Aq/sRTEa3wsJwYapp+mZLgRTIGRtfjklSqYU
	kbV0rBQ==
X-Received: from plbbi9.prod.google.com ([2002:a17:902:bf09:b0:2bf:195a:2b9d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74b:b0:2c7:fc03:fcf0
 with SMTP id d9443c01a7336-2ca91151163mr8962085ad.17.1782917946247; Wed, 01
 Jul 2026 07:59:06 -0700 (PDT)
Date: Wed, 1 Jul 2026 07:59:05 -0700
In-Reply-To: <20260701110547.764083-3-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701110547.764083-1-kirill@shutemov.name> <20260701110547.764083-3-kirill@shutemov.name>
Message-ID: <akUrORhAmRur-lHP@google.com>
Subject: Re: [PATCH v5 2/3] x86/insn-eval: Add insn_assign_reg() helper
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Kai Huang <kai.huang@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	David Laight <david.laight.linux@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Dan Williams <djbw@kernel.org>, Borys Tsyrulnikov <tsyrulnikov.borys@gmail.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> KVM's instruction emulator has a small helper, assign_register(), that
> writes a value into a sub-register with x86 partial-register-write
> semantics: 1- and 2-byte writes leave the upper bits of the destination
> untouched, 4-byte writes zero-extend to 64 bits, 8-byte writes overwrite
> the full register.
> 
> The TDX guest #VE handler needs the same logic for port I/O emulation
> to get 32-bit zero-extension right.  Rather than copy-pasting the
> helper, lift it to <asm/insn-eval.h> as insn_assign_reg() so both can
> use it.
> 
> Add <asm/insn.h> to the header's includes so it builds standalone in
> callers that have not pulled it in transitively.
> 
> No functional change.
> 
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Cc: stable@vger.kernel.org # prerequisite for the following 32-bit port I/O zero-extension fix
> ---
>  arch/x86/include/asm/insn-eval.h | 30 ++++++++++++++++++++++++++++++
>  arch/x86/kvm/emulate.c           | 26 ++++----------------------
>  2 files changed, 34 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/x86/include/asm/insn-eval.h b/arch/x86/include/asm/insn-eval.h
> index 4733e9064ee5..0c87759816d3 100644
> --- a/arch/x86/include/asm/insn-eval.h
> +++ b/arch/x86/include/asm/insn-eval.h
> @@ -9,6 +9,7 @@
>  #include <linux/compiler.h>
>  #include <linux/bug.h>
>  #include <linux/err.h>
> +#include <asm/insn.h>
>  #include <asm/ptrace.h>
>  
>  #define INSN_CODE_SEG_ADDR_SZ(params) ((params >> 4) & 0xf)
> @@ -46,4 +47,33 @@ enum insn_mmio_type insn_decode_mmio(struct insn *insn, int *bytes);
>  
>  bool insn_is_nop(struct insn *insn);
>  
> +/*
> + * Write @val into *@reg with x86 partial-register-write semantics: a 1-
> + * or 2-byte write leaves the upper bits of the destination untouched; a
> + * 4-byte write zero-extends to 64 bits (matching IN[BWL], MOV[BWL]

The placement of the "(matching IN[BWL], MOV[BWL] etc.)" blurb is confusing.  I
*think* you're trying to say this behavior matches that of MOVB, MOVW, and MOVL
instruction mnemonics, but the blurb is buried in the snippet that specifically
describes the 4-byte write behavior.

FWIW, I think giving examples does more harm than good, because the behavior isn't
instruction specific, it's architectural behavior that applies to all writes to
GPRs, as defined in "3.4.1.1 General-Purpose Registers in 64-Bit Mode".  E.g. for
a MOV instruction that sign-extends a 32-bit immediate to a 64-bit registers, it's
not that the instruction is exempt from the normal GPR semenatics, it's that the
instruction performs a 64-bit write to the destination even though the source is
only 32 bits.

And the B/W/L terminology isn't architectural, it's AT&T syntax.  E.g. trying
to encode "movl" with NASM yields "error: instruction expected, found `movl dword'".
Yes, the kernel uses AT&T syntax for assembly, but I think this helper should very
explicitly document that it's emulating architectural behavior.

> + * etc.); an 8-byte write overwrites the full register.
> + *
> + * @reg need not be 8-byte aligned: KVM's instruction emulator points
> + * into the middle of a register slot to address the high-byte
> + * registers (AH, CH, DH, BH).  Use narrow stores for the sub-word
> + * cases so that the access width matches @bytes.
> + */
> +static inline void insn_assign_reg(unsigned long *reg, u64 val, int bytes)
> +{
> +	switch (bytes) {
> +	case 1:
> +		*(u8 *)reg = (u8)val;
> +		break;
> +	case 2:
> +		*(u16 *)reg = (u16)val;
> +		break;
> +	case 4:
> +		*reg = (u32)val;

IMO, it's worth keeping a short comment here, because even with the explanation
above, I suspect most people will think the code is buggy.  E.g.

		/* As above, zero-extend 4-byte writes on 64-bit CPUs. */
		*reg = (u32)val;

> +		break;
> +	case 8:
> +		*reg = val;
> +		break;
> +	}
> +}
