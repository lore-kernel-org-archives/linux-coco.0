Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96366348C45
	for <linux-coco@lists.linux.dev>; Thu, 28 May 2026 19:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779998307; cv=none; b=T4Cyxq3+9c1i4uv1rCXXXpcHG0zYKvrpcToWrBH5DDp7ynSHxLKsyg+ozGCCo+j38QT9WdBFxa0umq+pSvjpiDLpGFdSxhhCCfNyQtm1KQM8aEZDDhdpenIzzmRNhmsyA5y3zko//lA0Qw9ACGcA9XWjj1XanBInAIMvrpick10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779998307; c=relaxed/simple;
	bh=WTTIpQ7jQ/NRd9fEiQtD8QkYgfCehLlyMwVPbgSShLU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gxOh5pcCxDdHlUR0hBvk/Q9qOMp8R241IdvdD+RcQvoQUTR3OzhOv3eq0XRwR55P0aQSHUvYIKuVMcdoZ1J7QZj7YRRb25b5+hkhMjZkTHV9h3WRrvMcKpFMARiLzNu0i8kfKRq+BJuxO8pqPxXwnYBIVdrQKVZz7bWUh3w0OHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l70/d5Wg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l70/d5Wg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4904127c32cso43901025e9.2
        for <linux-coco@lists.linux.dev>; Thu, 28 May 2026 12:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779998304; x=1780603104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea+7QZi8CgY0HmyJuCQXCsEGJlQb2tlTWQbckXtNEc0=;
        b=l70/d5WgSbKC5Zc/lVTq7x56MwZI4UFlbDiq44TrTWalFlNzlvPJPmBPMYzP8hLqME
         LoCuui5/A02j/n5zpejc4FMtVVDGtBMwOKIN1rqdJ1Wj+E2O2gns5ol1t+4nJ2Hj61LR
         VyI6Aey419xrbD8WMQ0KtBtCVPteKbAxNS9wIYOaN+XY/O3MTXr4zrNUP9flXftes5v+
         HDBlQDuOVts8D8eAhDPur4zEeVBxIrRF/W6SzvhMWyhX9HIB1BBZwxHGtO34i3GHK+Hz
         g712sjF9mQoDqccZj0oAjfiMs298jOjGW7NI3ngjWjnlOUqSt/az3BQzERmxjKWOjrY5
         lflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779998304; x=1780603104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ea+7QZi8CgY0HmyJuCQXCsEGJlQb2tlTWQbckXtNEc0=;
        b=mbL25/Kp1cLm63OiHoxi7HpahzfYSoGPUkEj2FtekEl27S5z160e2tPP03ceaFwcwa
         b7iQ6TExCXL4TCMXqnQT2AiAyxZG/UKVmDKV+5/LxgEmqmWgdg1GvSvR5SLsgswNReOX
         oI++a1FS0EP3/jwckkzl5crZt2eXIZXwDN2DOjXhkbmwS7p+v1nSzT4sbEYCtsawj0ZT
         kP6f4dpDW9ji3KQthkwlJAWnTpshKqwigqTq46nP8nGA2tzqT53Lp2WJVy+Tojanv66Z
         S7vNdCYXl8LaUkMVFv4fzdt3XuaI+ShROlzCqrWXnMF0P8ak1B/i7cGU89sq8j29YV23
         agZA==
X-Forwarded-Encrypted: i=1; AFNElJ+X4JAKpz7G5TD7OJmHEGrz0mnHf+9YuFa0sC9Wy+yW3okMdAH2kKz1xGCv0YzgpNoyuyHBEohUr6A/@lists.linux.dev
X-Gm-Message-State: AOJu0YzjSe2w9KKc5lkQbGnq9MwOrGvnMoXTteqbneBK67K0J+iGzGTU
	y2N2G7h22eWKdtNXXPvdroEh4Ucaye5toeC3xdOCNB75R1HkX8AdIdu4
X-Gm-Gg: Acq92OHDoOVCWyl9vbzYEPJTobpyUEkkI787J8jhCkhKSl1IpxGlVhE5b5dP6ezD55e
	mmQ1y70ai/VoS8lYf8/qqikEXWH1y/MvuihMhXUqkYUSyKKt6MFMcjzxUgiVbKRCf1U9fZ4nbWb
	Wx+5sAyzU03PuVa6DQ8mEMzM+wq+1d0oGCQ2u5lfbk1z0myCTnSruwf/AAZxqPV9GoFjn5t4Ot8
	vYaBaIBeKCI5mB8+q1hZq5Dxw7JvQfZLSMJAbM+XdlmAEA6muwJyNzY9/qi/URHxk7hawNZjYmu
	6I1/zsVV3pMOF30rwRjKUOcRVEB+aEwwR5j+00ggkyDrAW2FqSfC3paVDCi68rYupIQu2/TMyQQ
	Mg9GgzbHZhGOfQIa8w75h/DNWcDoYVP4BO9GuLZmcicCWjef3rcmzKQNSlVEJQy6LZnKtcXw0Xd
	UJ2NFsWr6YgExlbohQ/Hp0oAItTNfFU1GvX9jZeYEXISrkgh/rFlyGSFSyMdcGxBGKV4+KXPdF1
	Tutgx0OZg==
X-Received: by 2002:a05:600d:8496:20b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-4909bfcc3bcmr676545e9.19.1779998303798;
        Thu, 28 May 2026 12:58:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49091d57c0dsm93170965e9.0.2026.05.28.12.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:58:23 -0700 (PDT)
Date: Thu, 28 May 2026 20:58:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin"
 <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Kuppuswamy
 Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Kai Huang
 <kai.huang@intel.com>, Sean Christopherson <seanjc@google.com>, Borys
 Tsyrulnikov <tsyrulnikov.borys@gmail.com>, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] x86/tdx: Fix zero-extension for 32-bit port I/O
Message-ID: <20260528205822.26840d6e@pumpkin>
In-Reply-To: <ahgUBLjBRGhxULu3@thinkstation>
References: <20260527120544.2903923-1-kas@kernel.org>
	<20260527120544.2903923-3-kas@kernel.org>
	<5ed6121c-314e-4cf0-9a11-b0661c87c694@intel.com>
	<ahgUBLjBRGhxULu3@thinkstation>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 May 2026 11:14:38 +0100
Kiryl Shutsemau <kas@kernel.org> wrote:

> On Wed, May 27, 2026 at 10:45:28AM -0700, Dave Hansen wrote:
> > On 5/27/26 05:05, Kiryl Shutsemau (Meta) wrote:
> > ...  
> > > -	/* Update part of the register affected by the emulated instruction */
> > > -	regs->ax &= ~mask;
> > > +	/*
> > > +	 * IN writes the result into a sub-register of RAX. Only the
> > > +	 * 32-bit form zero-extends; the smaller forms leave the upper
> > > +	 * bits untouched:
> > > +	 *
> > > +	 *   insn  dest  size  bits written     bits preserved
> > > +	 *   inb   AL    1     RAX[ 7: 0]       RAX[63: 8]
> > > +	 *   inw   AX    2     RAX[15: 0]       RAX[63:16]
> > > +	 *   inl   EAX   4     RAX[63: 0]       (none, zero-extended)
> > > +	 *
> > > +	 * 'mask' only covers the low 'size' bytes, which is exactly the
> > > +	 * range affected for size 1 and 2. For size 4 the write also
> > > +	 * clears RAX[63:32], so widen the clear-mask.
> > > +	 */
> > > +	if (size == 4)
> > > +		regs->ax = 0;
> > > +	else
> > > +		regs->ax &= ~mask;
> > > +  
> > 
> > Is there any way we could do this with fewer comments and more code?
> > 
> > I mean, there's only three cases. Why have;
> > 
> > 	u64 mask = GENMASK(BITS_PER_BYTE * size - 1, 0);
> > 
> > When there are only 3 possible cases:
> > 
> > 	1 => 0xf
> > 	2 => 0xff
> > 	4 => 0xffff
> > 
> > and one of those cases needs a special case on top of it.
> > 
> > Maybe something like this?
> > 
> > 	/* Clear out part of RAX so part of args.r11 can be OR'd in: */
> > 	switch (size) {
> > 	case 1:
> > 		/* inb consumes lower 8 bits of r11: */
> > 		regs->ax &= ~GENMASK_ULL(7, 0);
> > 		args.r11 &=  GENMASK_ULL(7, 0);
> > 		break;
> > 	case 2:
> > 		/* inw consumes lower 16 bits of r11: */
> > 		regs->ax &= ~GENMASK_ULL(15, 0);
> > 		args.r11 &=  GENMASK_ULL(15, 0);
> > 		break;
> > 	case 4:
> > 		/* inl is weird and zeros the whole register: */
> > 		regs->ax &= ~GENMASK_ULL(63, 0);
> > 		/* But only consumes 32-bits from r11: */
> > 		args.r11 &=  GENMASK_ULL(31, 0);
> > 		break;
> > 	default:
> > 		/* Probable TDX module bug. Illegal in[bwl] size: */
> > 		WARN_ON_ONCE(1);
> > 		success = 0;
> > 	}
> > 
> > 	if (success)
> > 		regs->ax |= args.r11;
> > 
> > It might need a temporary variable for args.r11, but you get the point.
> > That's basically the data from the comment but written as code.  
> 
> I hate how verbose it is. All these GENMASK_ULL() make it hard to
> follow.
> 
> What about the patch below. Inspired by kvm's assign_register().
> 
> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index 65119362f9a2..460b9fbabf14 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -693,8 +693,8 @@ static bool handle_in(struct pt_regs *regs, int size, int port)
>  		.r13 = PORT_READ,
>  		.r14 = port,
>  	};
> -	u64 mask = GENMASK(BITS_PER_BYTE * size - 1, 0);
>  	bool success;
> +	u32 val;
>  
>  	/*
>  	 * Emulate the I/O read via hypercall. More info about ABI can be found
> @@ -703,10 +703,33 @@ static bool handle_in(struct pt_regs *regs, int size, int port)
>  	 */
>  	success = !__tdx_hypercall(&args);
>  
> -	/* Update part of the register affected by the emulated instruction */
> -	regs->ax &= ~mask;
>  	if (success)
> -		regs->ax |= args.r11 & mask;
> +		val = args.r11;
> +	else
> +		val = 0;
> +
> +	/*
> +	 * IN writes the result into a sub-register of RAX.
> +	 *
> +	 * Only the 32-bit form zero-extends; the smaller forms leave
> +	 * the upper bits untouched.
> +	 */
> +	switch (size) {
> +	case 1:
> +		*(u8 *)&regs->ax = (u8)val;
> +		break;
> +	case 2:
> +		*(u16 *)&regs->ax = (u16)val;
> +		break;
> +	case 4:
> +		/* zero-extended */
> +		regs->ax = val;
> +		break;
> +	default:
> +		/* Probable TDX module bug. Illegal in[bwl] size. */
> +		WARN_ON_ONCE(1);
> +		break;
> +	}

Just write it as normal arithmetic code:

	/* IN writes the result into a sub-register of RAX. */
	switch (size) {
	case 1:
		regs->ax = (regs->ax & ~0xfful) | (val & 0xff);
		break;
	case 2:
		regs->ax = (regs->ax & ~0xfffful) | (val & 0xffff);
		break;
	case 4:
	default:
		/* 32bit 'INB' will zero the high bits. */
		regs->ax = val
		break;
	}

Succinct, obvious and readable.

-- David


>  
>  	return success;
>  }

