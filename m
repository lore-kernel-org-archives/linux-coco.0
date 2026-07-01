Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C9F36F8EE
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925240; cv=none; b=OVH5IPZLFkBdWOYIahSQbR9EM3Zk/lzCJZMeT01xzAigwd+FeCWjwXbkReLEhqh+n+wcTTY9SQ2z7UUfuoL5rik79FUDcMz2J1cTcom9hw8E/NPmhUfOFQK9ZTj9EX8Pook7onugRbWDg1eblo7kFY+o0OCYN3fq8JuM2XFaNOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925240; c=relaxed/simple;
	bh=ulrrB51K3AYQ2OlwuYLkbpXtaaGcfRbDlWD4dwEzaZg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7H3su0Cni7vU/U5JWfPGnWuUH6AotMjR6GV9CLHa7e0XrjNRy8P/5fq/5eRE1DkmJrwoz6RD484hv020jGCZruvDXC/mMVN2+7WyGOa9/kgsQOG5iEnHFAyVCMUkD49ZrSLYMqjq67jhL8HXlCRyzm/npZeGCWgVv9yQyy70/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHvXRpRZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHvXRpRZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so5992925e9.1
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 10:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782925236; x=1783530036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLmV+G/PpTG3SW60cUQIz3Ts53d+g5oeBKqSg4USjMI=;
        b=DHvXRpRZsAV4eqyYs/VbOnfwI/6N7h0JY+YNLdQs3rxireD8Ewbc9Nu5tMLD1+bkVW
         jaJIjgiIrRcdMdwW6yucKTPoRYgbFJ7p3SFx5HpHFvvNWtT6sm/y75BCq02vE/3H3U7V
         mfoQkGdBxyLELD+OVJvCKrYjyWMalpvGZT1rT+i71nxTIIDSV2ZpNRfrlPSdYjq5Uyg5
         dfy0Dcn4VCvpCbZKNATOCfRY1LPBg+E4A6hp5pxu+BlVAdaw320QN4GCZVyeIDpHB28j
         fmh5g1ULDyDQEJLg1h4BPgHq92A0hxt975w1ZLoCim+w93cn2TVD/Mra60oF2gVKKcIl
         Nelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782925236; x=1783530036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SLmV+G/PpTG3SW60cUQIz3Ts53d+g5oeBKqSg4USjMI=;
        b=dp1ML3GnWOnHKRYUvRs9zQQ01+4SODbwWn0mysY/Xu2GVSHSDbYDHmrY21khrScMKA
         lVIjqaCHi0ngetYXezb5EghNFJu2FTfEXHo0xdDFS0+fMoY9GHABpfsSRw1sM0o4m/dT
         rR8rkxkZaTQ4ZYR7jxChbtJ9IyVMKwF9bUnAooT8OErtsZbL14q7Kz+rJH7P7mKle+7e
         YCzG0Wunz8/TOW4jLhyjNnWBW+vOtXAodG+sHoU9N6zCj8cMw8QYzD01ce0+a6MIf8cd
         kXiyXM8KUhbX69lbfDWWzbN+CNHFmO/rULo76eAIHhHvzGgVJ2R+Do0J0057v4EDdP4u
         g1cQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LhEt7TRUbI6nI0IGN1LHbDhkSR5khIKuFJdx2qEhJs+pH7PRFnaOV8AK69rLu74ywoXjS0570RksH@lists.linux.dev
X-Gm-Message-State: AOJu0YxQApLz9oThZb+HBScLo03OO2RM0kpBeGI1ehmX7Csg2n+QCuix
	ZX1nYISKARXZT0uiTvMJxHygEad7qWOLPSB8RVa1xoa4rPPTRVmMEDAs
X-Gm-Gg: AfdE7cloAc7rYzhCBQR08i0ihbTlKh973x7fz9VpXvifj405+57bh+zwTtiQylrH5qn
	+M15Em9Bl+wxeJLv53be2W1KCIjPbIDxILqjhVd1SohuoNblrabm+jBo6TbhLp7T46HAkgywF0q
	3SGqlBCBimJcDjqz1V8QiBZDVmBLtCXe15WJVhoLXnruxFiizVbuYGt3QFT9SKyfoYnySIhNLXz
	DEsvzozr1EflNuDY4b3pOV5sn3smL6D2LldMWF7xdZ61txrrtpNjr44RmvV0YdBIRjAZUykvzd+
	pHpb6FiJNxEugshlHixp3dz6ODXUHBuGh7BMfjsRzuMVbRpNpZ/mNsltY3uNJJO95nn4VovDFxS
	RczmbnxSxNZjJCIiti/WgzvWeFWEYpBFdMXnk8ERfmFtlhHLa3JhYF06XfmZabOOWEXJVy8m7I5
	n/GDvo1u1bgrWWbdZ2uCP0Arj2uB87jfwxAnWdSwgmmhoesA==
X-Received: by 2002:a05:600d:111:b0:492:53e8:3bc1 with SMTP id 5b1f17b1804b1-493c2b58b3fmr32580785e9.17.1782925235694;
        Wed, 01 Jul 2026 10:00:35 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be82fd71sm129586375e9.15.2026.07.01.10.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:00:35 -0700 (PDT)
Date: Wed, 1 Jul 2026 18:00:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, Dave Hansen
 <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Kuppuswamy Sathyanarayanan
 <sathyanarayanan.kuppuswamy@linux.intel.com>, Kai Huang
 <kai.huang@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, Andi
 Kleen <ak@linux.intel.com>, Dan Williams <djbw@kernel.org>, Borys
 Tsyrulnikov <tsyrulnikov.borys@gmail.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH v5 2/3] x86/insn-eval: Add insn_assign_reg() helper
Message-ID: <20260701180033.6e9c07aa@pumpkin>
In-Reply-To: <akUrORhAmRur-lHP@google.com>
References: <20260701110547.764083-1-kirill@shutemov.name>
	<20260701110547.764083-3-kirill@shutemov.name>
	<akUrORhAmRur-lHP@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 1 Jul 2026 07:59:05 -0700
Sean Christopherson <seanjc@google.com> wrote:

> On Wed, Jul 01, 2026, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > 
> > KVM's instruction emulator has a small helper, assign_register(), that
> > writes a value into a sub-register with x86 partial-register-write
> > semantics: 1- and 2-byte writes leave the upper bits of the destination
> > untouched, 4-byte writes zero-extend to 64 bits, 8-byte writes overwrite
> > the full register.
> > 
> > The TDX guest #VE handler needs the same logic for port I/O emulation
> > to get 32-bit zero-extension right.  Rather than copy-pasting the
> > helper, lift it to <asm/insn-eval.h> as insn_assign_reg() so both can
> > use it.
> > 
> > Add <asm/insn.h> to the header's includes so it builds standalone in
> > callers that have not pulled it in transitively.
> > 
> > No functional change.
> > 
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > Cc: stable@vger.kernel.org # prerequisite for the following 32-bit port I/O zero-extension fix
> > ---
> >  arch/x86/include/asm/insn-eval.h | 30 ++++++++++++++++++++++++++++++
> >  arch/x86/kvm/emulate.c           | 26 ++++----------------------
> >  2 files changed, 34 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/insn-eval.h b/arch/x86/include/asm/insn-eval.h
> > index 4733e9064ee5..0c87759816d3 100644
> > --- a/arch/x86/include/asm/insn-eval.h
> > +++ b/arch/x86/include/asm/insn-eval.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/compiler.h>
> >  #include <linux/bug.h>
> >  #include <linux/err.h>
> > +#include <asm/insn.h>
> >  #include <asm/ptrace.h>
> >  
> >  #define INSN_CODE_SEG_ADDR_SZ(params) ((params >> 4) & 0xf)
> > @@ -46,4 +47,33 @@ enum insn_mmio_type insn_decode_mmio(struct insn *insn, int *bytes);
> >  
> >  bool insn_is_nop(struct insn *insn);
> >  
> > +/*
> > + * Write @val into *@reg with x86 partial-register-write semantics: a 1-
> > + * or 2-byte write leaves the upper bits of the destination untouched; a
> > + * 4-byte write zero-extends to 64 bits (matching IN[BWL], MOV[BWL]  
> 
> The placement of the "(matching IN[BWL], MOV[BWL] etc.)" blurb is confusing.  I
> *think* you're trying to say this behavior matches that of MOVB, MOVW, and MOVL
> instruction mnemonics, but the blurb is buried in the snippet that specifically
> describes the 4-byte write behavior.
> 
> FWIW, I think giving examples does more harm than good, because the behavior isn't
> instruction specific, it's architectural behavior that applies to all writes to
> GPRs, as defined in "3.4.1.1 General-Purpose Registers in 64-Bit Mode".  E.g. for
> a MOV instruction that sign-extends a 32-bit immediate to a 64-bit registers, it's
> not that the instruction is exempt from the normal GPR semenatics, it's that the
> instruction performs a 64-bit write to the destination even though the source is
> only 32 bits.
> 
> And the B/W/L terminology isn't architectural, it's AT&T syntax.  E.g. trying
> to encode "movl" with NASM yields "error: instruction expected, found `movl dword'".
> Yes, the kernel uses AT&T syntax for assembly, but I think this helper should very
> explicitly document that it's emulating architectural behavior.
> 
> > + * etc.); an 8-byte write overwrites the full register.
> > + *
> > + * @reg need not be 8-byte aligned: KVM's instruction emulator points
> > + * into the middle of a register slot to address the high-byte
                 ^ it isn't really the 'middle'.

> > + * registers (AH, CH, DH, BH).  Use narrow stores for the sub-word
> > + * cases so that the access width matches @bytes.
> > + */
> > +static inline void insn_assign_reg(unsigned long *reg, u64 val, int bytes)
> > +{
> > +	switch (bytes) {
> > +	case 1:
> > +		*(u8 *)reg = (u8)val;
> > +		break;
> > +	case 2:
> > +		*(u16 *)reg = (u16)val;
> > +		break;
> > +	case 4:
> > +		*reg = (u32)val;  
> 
> IMO, it's worth keeping a short comment here, because even with the explanation
> above, I suspect most people will think the code is buggy.  E.g.
> 
> 		/* As above, zero-extend 4-byte writes on 64-bit CPUs. */
> 		*reg = (u32)val;

Or be even more specific and use '& 0xffffffff' rather than a cast.
Particularly since the casts of the RHS in the byte/short cases aren't
needed at all.

-- David

> 
> > +		break;
> > +	case 8:
> > +		*reg = val;
> > +		break;
> > +	}
> > +}  

