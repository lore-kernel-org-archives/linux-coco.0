Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF114A4CC
	for <linux-coco@lists.linux.dev>; Sat, 24 Jan 2026 23:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296066; cv=none; b=YTAJfmqgvpJXIY+q/e1CgU32qszEdl9cM1Y4YZSrBM4DJFMPskPMwPjqKL5u/sVwChSdG1E+DDPn/OGDlQvcA4Fzqm5rZ2jXXoEVUNHqC1Oh5QGIT0ZT5xjUVqhvpgV7QgRsHyh9a9Ljcgw5QAFjLiJqbHKweSi7zyd1IUJKtZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296066; c=relaxed/simple;
	bh=XdRclpQNCqX0dBKBzXTJ7tNS318KuBUco8Gn5/CC7+o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8cezfytGfXtH49wSX6cJ4y7Wf6HxuyoPUwwiBXMsuOsld40G6zZOihnpCya6oARd9U7NDQTW5m5StvHZ7MobCz34D23Hlm/EsuhMDfNPC0luoVWQjGhpXuPZR67GpKWtFRo0oKVhZryEKx48T7sgDh32rK9+j/J4q4kgYDJIyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EI8b412M; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EI8b412M"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so33474265e9.3
        for <linux-coco@lists.linux.dev>; Sat, 24 Jan 2026 15:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769296064; x=1769900864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEL8IrKUsSqQwu2k31LQ413w8P8f+OHWaTO4r/AtvUA=;
        b=EI8b412MiTfs19QKVtNDCRVEbIbRyj5RP8UFKy7r2QNpFT8VXNL3ga2WrHNnHgr3f5
         JRBk2VOPPrYDfCx6W9uczU+bdP7k+HZdudQFjUyQEG+3xnYlgK+taYioeJhM7IBvJHPG
         QIAA+X+6N0ytg/oXDLVg8Qpl6sFjwK0BLokHdM3FeHNNGpmyKjw8eFGfKWm89jTY84Gx
         X1vmmhQfasWOh3TlhI7sY6HvmLPBBrVxxVc+nqxNlkPJWOYjUufLmQHfyk+26oeRCRn+
         oSyvJS4O6DkFNXUfl2mJzy+Zx8k7IJffai8E3WsW2+gg6Vsg/s8f491sIKdJkZ+ZB5Ai
         4D7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769296064; x=1769900864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PEL8IrKUsSqQwu2k31LQ413w8P8f+OHWaTO4r/AtvUA=;
        b=C1TUerrJar34ZYD8n2MS0REeUBSRX0RPyv5LAaQwpjUEjZ207K4bPgDOxkI0UEa5Dr
         EXiyky1f6gW7tiWYFKbPsEh/eqByHU4t1dVBg6PULnvfySYZrCICxAWEAPvyY8G/cfyk
         ffBy2gE4zP6l8z2jBv6+2ibwdIci49FynlZEfTWgFc7dfu0YT5wccUn9cAQ24HJn9ETg
         5bMSijeQsBuIgIvEJjIah8FNH0oz+bfL142+IQ+TLqVw29zN5LXzqVBftZI/CIqGnaxt
         IxtHNwxl1wtgmam6oWyYKU4eDqec1fzsyMf2jMPNrWIAwzEbNTsHp9zvaM0Pv1vScbR2
         Tq7w==
X-Forwarded-Encrypted: i=1; AJvYcCWtRQOhnpsfpMAOE598Itkb78socNnFdUpM60TT5xo118coLs4ilufrmD1hoNgDGM3n/ps/R3Bzy09A@lists.linux.dev
X-Gm-Message-State: AOJu0YwCj+OEI0h5xOJo8pLPOuI5satCdnTXVWvtpb9t31mkbMozrduK
	Ppj6UwQMgM5zP5EApSVi7Ghh8DR/ZcZg6W5jHbqqjZxK/xLb4pXwXaVh
X-Gm-Gg: AZuq6aJsYiDwVeJtptf5u0hNpIKq3O1ml0UdTsTuYuXtl+5GxqvDrvdIHV0MVai9G0l
	c19yD79lURWPNjhQDj3jg9HD+GPlusqRFPitfQII7dAZxiY4VlfifPJkPpY5a2sgmrKVvG/a1Xl
	hvuKDIR/o+GZFGZK8EuqOdHH8WSIXHbjalqXk6n5cSEtz6rC6ztoIdCmZ2CdlcHV5S0xDl9520h
	XqHk9zPDwJT9MjfJcSIeIykrOlhUyQRxjwUgGocqCMlprJXqGR1GooOevb+/wcF7ZwTHYSAZgwm
	AWHAYRQKXDy8NqmpfopM8NkXfrGptUCFTczFYHqtfQHoDBw8dJoEVxaiQTfXFi/s8Tbep1N2D/9
	YDLTdqS9yllRmdBzZZsQaXKZNfp7mR685H51ZBHhvfqW7A/SyMsjeffK3hfdCRHKY7MfxgYSBdA
	vqIo1l990we1tGn6F12OhuWH0DhZY7t9Tb1GsuKIE4IRn5RJxXpkWy
X-Received: by 2002:a05:600c:4f86:b0:47b:d949:9ba9 with SMTP id 5b1f17b1804b1-4805ce40c8cmr1981265e9.13.1769296063617;
        Sat, 24 Jan 2026 15:07:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e71503sm19168491f8f.25.2026.01.24.15.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 15:07:43 -0800 (PST)
Date: Sat, 24 Jan 2026 23:07:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Uros Bizjak
 <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>, Andrew Morton
 <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, "Peter Zijlstra
 (Intel)" <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v1 12/14] x86/boot: tweak a20.c for better code
 generation
Message-ID: <20260124230741.2b94b14c@pumpkin>
In-Reply-To: <981124b5-040e-400b-9912-15a65fdfdfdd@zytor.com>
References: <20260119192923.651588-1-hpa@zytor.com>
	<20260120195407.1163051-1-hpa@zytor.com>
	<20260120195407.1163051-13-hpa@zytor.com>
	<20260121114911.6adc2838@pumpkin>
	<alpine.DEB.2.21.2601240244460.6421@angie.orcam.me.uk>
	<981124b5-040e-400b-9912-15a65fdfdfdd@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Jan 2026 20:24:55 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On 2026-01-23 19:00, Maciej W. Rozycki wrote:
> > On Wed, 21 Jan 2026, David Laight wrote:
> >   
> >> No loops needed.  
> > 
> >  A loop is needed because there can be a considerable delay from issuing 
> > the I/O request to flip the A20 gate till the circuitry responding.  This 
> > is particularly true with the command issued to the 8042 device, which is 
> > a microcontroller running its own firmware that needs it time to process 
> > an incoming request to drive one of the microcontroller's GPIOs.  There 
> > was a reason for port 0x92 circuitry later added to the PC architecture 
> > with the IBM PS/2 being called the "fast A20 gate".
> >   
> 
> Indeed. I thought I had responded to this already but I hadn't, apparently.
> 
> Note that the "long" delay is 2^21 loops! That number wasn't taken out of the
> air, either; we found machines that actually needed that many iterations.

Ok, so you need a loop because it might take ages for the value read from
0x1000200 to change.
But there is no need to keep changing the value.
The comments in the code don't really stress that.

> In the case where A20 is enabled already, the loop terminates on either the
> first or second iteration (the second iteration is when the value at 0x1000200
> is exactly 1 higher than the value at 0x200.
> 
> Modern machines (Nehalem+) already have A20 enabled, and most machines of the
> i686+ generation implement int 0x15 function 0x2401.

I know some of the history.
And just read some more of the gory details...

A20 being disabled is there to make a 286 compatible with the older 8086 PCs
and any software that relied on address wrapping (rather than using it to get
an extra ~64kB in real mode).
That would be for dos and win 3.11...

The only 8088 and 286 cpu I used were on IO cards.

> 
> 	-hpa
> 

