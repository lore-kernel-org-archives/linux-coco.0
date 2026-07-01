Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EBD3F4DFD
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912361; cv=none; b=Ms0FoU31EVexDR9MfsExAtvOdE5vokItAXI2UPAZrCc398t4UVk4otmckjnUcpMX5rbLKNIgakB6+BOGW5lvYTlEpoWk7D+Ifb9DGBIhrM7hRS/dSVbFheCO04w+bHbDsc8TWPKlywuki5zMRlyvi406Gab4GqAI1U6ToGdxbks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912361; c=relaxed/simple;
	bh=8nfXIomqSXgIICZsYr/d0hMEYIbWZJBgkVXniOZmk9c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=blZwgEk4wNq1ASAMVUxBw6OVK0ghzTI3tZw8+zbxXEyNiTG4wHUs8rTzevDs/kZzFql7sCLhgG31PbsWqV+8mpb7yPzGXU5EmJg/u4Tw3qqLtt9K9AwSqbJR43J0WphGsWUSjpXfO6zsm3zPricwKbJ/zzlIQoBVLZNmRpOP5cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rg2eCsG6; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rg2eCsG6"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so462076a12.3
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782912359; x=1783517159; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nfLgJd4SFiMfB5hvCG5v1jWKkuB92AfQ/vUitXihKB8=;
        b=Rg2eCsG6b5MBTFxaYh8tMykNGNqDgnk40zig64vH3aNaS/FQaW+T1Tti5Enl42GLxc
         UdYwYsFT1yyUP1HvtNnDw7fAQFOQ6S7bKHfTjMYT0DECwSidkrh4HEQs8EoeXJ1zHujb
         0r4zXjsKu4KhPCuQqw1qQBtuHI7eSCHKd7YJPYfq1FOKVQMUFn6Le8e2XhxwYa7mXDQT
         hItdH9giPp1dc/Iu0mXkl59e9stPn0MJZiupUVqAntvxfWVH9X875ftOCeZYk66xlOL9
         c1TxGddIv7gER/Ar388oEK77mDxDaWOhER1rVU9VIsO3HUmMCYHn2kAgXGUCOJIpRmLm
         UQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912359; x=1783517159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfLgJd4SFiMfB5hvCG5v1jWKkuB92AfQ/vUitXihKB8=;
        b=FkQa4Z0tj3qZItod+IeYItR4KvmM6JYDPSN3nOYOJJGgH5sNYzE5LEM+zGnZa10RZc
         M07bGr9PC5atrGrXV3tGeEcY1XNqmK0jG2zWindmR2JisSOPdn0IfdraaPrkKZEwjPd+
         q9zCc9x74Ibf7iFPi9Xhs1MGEu191QWBEJUbDcTc0O+i9PGuiPa4JBof4UVWeXnvvIGS
         5xGzxy6tr5boMUASmLgn4Rt2QEtSXBJxMvcL1fF8guFFcSj6rXGR+/TXauNs0hXqAJXP
         0WXvsEavB9KWQqsxJNKBooiBPS1weGPw2dMbqzXtLBoc3qYERNHtfF8RHC24nhwY9MVZ
         xrzA==
X-Forwarded-Encrypted: i=1; AFNElJ/FSXoGe9VKJMeMMyB1rwXqFGBIW7JU8pYI0rbRW75chlmFsQzEnyKEsuHfHcHMjp30sqIIxCPJYrV9@lists.linux.dev
X-Gm-Message-State: AOJu0YxXQ3HGrYu6UvYDYuqAiwDjD2fWypjwTUWFFCw6Z/9BeZAEACdf
	DLf8poweEW5TCiv7bKgjKbR2A0whLFFtDeALc+w3gpTD2XdLEUGVaCozMWIY7smJg3WeC0X+LKW
	svwwesQ==
X-Received: from pgcv24.prod.google.com ([2002:a05:6a02:5318:b0:c9a:c533:8316])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3944:b0:38d:fad1:cf2a
 with SMTP id adf61e73a8af0-3bfed1b2b94mr1854511637.13.1782912359138; Wed, 01
 Jul 2026 06:25:59 -0700 (PDT)
Date: Wed, 1 Jul 2026 06:25:57 -0700
In-Reply-To: <daac026e677c10b68740b16ed8ad2556bd9583f8.1780584300.git.kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1780584300.git.kas@kernel.org> <daac026e677c10b68740b16ed8ad2556bd9583f8.1780584300.git.kas@kernel.org>
Message-ID: <akUVZQ6SgK8wRetj@google.com>
Subject: Re: [PATCH v4 2/3] x86/insn-eval: Add insn_assign_reg() helper
From: Sean Christopherson <seanjc@google.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, pbonzini@redhat.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, kai.huang@intel.com, 
	xiaoyao.li@intel.com, binbin.wu@linux.intel.com, rick.p.edgecombe@intel.com, 
	david.laight.linux@gmail.com, ak@linux.intel.com, djbw@kernel.org, 
	tsyrulnikov.borys@gmail.com, x86@kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

In the shortlog, please capture that code is being moved out of KVM.  This isn't
"adding" a helper, it's moving and renaming an existing helper.   The misleading
shortlog is quite literally why I didn't look at this for a ~month, I thought it
was entirely outside of my normal scope.

On Thu, Jun 04, 2026, Kiryl Shutsemau (Meta) wrote:
> KVM's instruction emulator has a small helper, assign_register(), that
> writes a value into a sub-register with x86 partial-register-write
> semantics: 1- and 2-byte writes leave the upper bits of the destination
> untouched, 4-byte writes zero-extend to 64 bits, 8-byte writes overwrite
> the full register.
> 
> The TDX guest #VE handler needs the same logic for port I/O emulation
> to get 32-bit zero-extension right. Rather than copy-pasting the helper,
> lift it to <asm/insn-eval.h> as insn_assign_reg() so both can use it.
> 
> Rewrite the body using arithmetic instead of pointer punning so the
> helper does not depend on -fno-strict-aliasing 

Meh, building with -fno-strict-aliasing is 100% mandatory for the kernel.  IMO,
even so much as suggesting that strict aliasing is something worth shooting for
is a misleading and wrong.

https://lore.kernel.org/all/CAHk-=wh921g_+TJ33JRxRGFM2uruMdqG-SONfFOD9UOsLQJ_uw@mail.gmail.com

> or little-endian byte order,

Oh come on, this is low level x86 code used to write registers.

> and add <asm/insn.h> to the header's includes so it builds standalone in
> callers that have not pulled it in transitively.
> 
> No functional change.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> ---
>  arch/x86/include/asm/insn-eval.h | 25 +++++++++++++++++++++++++
>  arch/x86/kvm/emulate.c           | 26 ++++----------------------
>  2 files changed, 29 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/x86/include/asm/insn-eval.h b/arch/x86/include/asm/insn-eval.h
> index 4733e9064ee5..85251e718a77 100644
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
> @@ -46,4 +47,28 @@ enum insn_mmio_type insn_decode_mmio(struct insn *insn, int *bytes);
>  
>  bool insn_is_nop(struct insn *insn);
>  
> +/*
> + * Write @val into *@reg with x86 partial-register-write semantics: a 1-
> + * or 2-byte write leaves the upper bits of the destination untouched; a

Careful with the "upper bits" wording.  As Sashiko pointed out, this is used for
{A,B,C,D}H sub-registers as well, in which case the *lower* bits are also left
untouched.

> + * 4-byte write zero-extends to 64 bits (matching IN[BWL], MOV[BWL]
> + * etc.); an 8-byte write overwrites the full register.
> + */
> +static inline void insn_assign_reg(unsigned long *reg, u64 val, int bytes)
> +{
> +	switch (bytes) {
> +	case 1:
> +		*reg = (*reg & ~0xfful)   | (val & 0xff);

Sashiko's feedback aside, I strongly prefer KVM's approach as I find it much more
intuitive.  And its far, far more consistent with respect to the 4-byte and 8-byte
cases.

> +		break;
> +	case 2:
> +		*reg = (*reg & ~0xfffful) | (val & 0xffff);
> +		break;
> +	case 4:
> +		*reg = (u32)val;
> +		break;
> +	case 8:
> +		*reg = val;
> +		break;
> +	}
> +}
