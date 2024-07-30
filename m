Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35978276
	for <linux-coco@lists.linux.dev>; Tue, 30 Jul 2024 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722364279; cv=none; b=FJaBGZvH+BOsVm41cwe348o40kWZwGj2Q/HCxNBQfIDtl1ojtcY9d92OeqGRdRXGaFnWbRKE03rMZ91KX59mRGEdlnxoq4pz9ewe5rg6omvRZRr6mezXpTHlbZDtQFmE8J872HPwNz7usxBPaSt9c2F1+ONLMe1JxNWGEymLE6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722364279; c=relaxed/simple;
	bh=qjbMSV72ozbsS2EaCpBgSnIUsymHPbRg6KvcPRWySMw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GZrh6PlP0h1ndNT58jc+iYZCL5Mugq7Rok9U1g1cR0DhlGAP/AWkpdkEOmGAIi0zRICJIFgJlj76kZphdGwdolnRzLzrsHMCI0f0rcqxoa23PaPWOyasFljgYGEAled931Qt99wwt1jAm1kqXDuVj0UvKZCtcuJ1OAahm7hbAXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TlH+f4u3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u6dBhDqt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TlH+f4u3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u6dBhDqt"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722364276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IZh0VLRLVNDot7WgZe2KHKmWYfaY2DBdRJamg3tTgzg=;
	b=TlH+f4u3GJfRfYAv5iKtno2SKtjd+Iylr8k72jKHBLHFUVa00fgGQv8kNTesM6yLn1dNvb
	X4ThTWRLTXwiMtTLMwTz/dZgaJ7DsdeXgPZKOEC+BVTKpo0FCIuzh8PROVYB4I7u3ZZyfV
	+AWXpew5k/y3rW7j4CthttZczbOvFfzs4KSI9/7IoC15zdMz3R2u0ydR8jOJZXjxtEH0/8
	67Ybp+nJu7H9f2k8zj0jzMXRiFNnlFtXA3wFB7N38CAURNse4/zQFBp09p5vJvaOPioXBD
	H6sMfSFfPFfukkzzySh/JhCclxUBFNkV3b5U+jjCEKH2kr3KuUi8wDOaRMPHUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722364276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IZh0VLRLVNDot7WgZe2KHKmWYfaY2DBdRJamg3tTgzg=;
	b=u6dBhDqtDZaV2O7U+QWTBZcAysVuZWio5rgAjBLzkF9MiyBANUk/iEQFmLfuZ5tjgJrWtn
	InL4XRAGchhG56Bw==
To: "Alexey Gladkov (Intel)" <legion@kernel.org>,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Yuan Yao <yuan.yao@intel.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Yuntao Wang <ytcoode@gmail.com>, Kai
 Huang <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>, Oleg Nesterov
 <oleg@redhat.com>, cho@microsoft.com, decui@microsoft.com,
 John.Starks@microsoft.com
Subject: Re: [PATCH v1 1/4] x86/tdx: Split MMIO read and write operations
In-Reply-To: <ff7cc8b32ae3829892d0dd5dcd3245d1db2684c0.1722356794.git.legion@kernel.org>
References: <cover.1722356794.git.legion@kernel.org>
 <ff7cc8b32ae3829892d0dd5dcd3245d1db2684c0.1722356794.git.legion@kernel.org>
Date: Tue, 30 Jul 2024 20:31:15 +0200
Message-ID: <87a5hy7mvg.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 30 2024 at 19:35, Alexey Gladkov wrote:
> To implement MMIO in userspace, additional memory checks need to be
> implemented. To avoid overly complicating the handle_mmio() function
> and to separate checks from actions, it will be split into two separate
> functions for handling read and write operations.

It will be split? The patch splits it, no?
>  
> +static int handle_mmio_write(struct insn *insn, enum insn_mmio_type mmio, int size,
> +		struct pt_regs *regs, struct ve_info *ve)

Please align the second line argument with the first argument in the
first line.

> +static int handle_mmio_read(struct insn *insn, enum insn_mmio_type mmio, int size,
> +		struct pt_regs *regs, struct ve_info *ve)
> +{
> +	unsigned long *reg, val;
> +	int extend_size;
> +	u8 extend_val = 0;

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

>  static int handle_mmio(struct pt_regs *regs, struct ve_info *ve)
>  {
> -	unsigned long *reg, val, vaddr;
> +	unsigned long vaddr;
>  	char buffer[MAX_INSN_SIZE];
>  	enum insn_mmio_type mmio;
>  	struct insn insn = {};
> -	int size, extend_size;
> -	u8 extend_val = 0;
> +	int size;

Ditto
  
>  	/* Only in-kernel MMIO is supported */
>  	if (WARN_ON_ONCE(user_mode(regs)))
> @@ -428,12 +504,6 @@ static int handle_mmio(struct pt_regs *regs, struct ve_info *ve)
>  	if (WARN_ON_ONCE(mmio == INSN_MMIO_DECODE_FAILED))
>  		return -EINVAL;

Thanks,

        tglx
