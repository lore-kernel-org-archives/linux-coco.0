Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B836E465
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768948820; cv=none; b=QRUGdey6pcLYH2WzaF0WNNxaxRk8C2bFmMUP6neHtcWU7xz2AUwurAiN4s7l+7r/LmScAvsjuvE+Df93XkDS02yNX/jknpEa1fx97WCwFVzmWQdBuxZ1qRpWaH34TI0kvcsF+2Op+q+GL0MaSX3imwcQiwMMVVG0CXFKQHSnids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768948820; c=relaxed/simple;
	bh=GB7fouVDSBFUQRUZn3/zwCIsYYWoml5r47arSduQ0Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koTyIKpY3QCfLONJSAGD71xNMjSgXbKeN7/vEMlELdQaR9ZuBIJqVP2ZExQdnPTATogB4CdqOL+uPzj+Z0rLF9cSPFK8A1pzlE9a9750uO9MyJ8jTjoZ17x84PNll7WEQaDaA6qv31ZC1mNxdf0SR/EY0VJXXlILELFljcY0MnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDuIa0w8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDuIa0w8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee2715254so28120895e9.3
        for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 14:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768948816; x=1769553616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCHJwAgujuYqn6CDQYvDpbIbZ0yL9/wPyxks5czHWxc=;
        b=BDuIa0w8MJ4jh/vUci5WxrBAA5zRZ+INYLaYmmIFkdiuay1ayymfyJDqREKsT5WiHm
         ORhPvsKIDxA8bGIc74qFs8xd/8Q8TCc+aYg0cSdCBBCLohAzZb6mMfqm85PikDUgpO4j
         j3+WpyhndGbiNYj/8IL6xzB51Rk+ZTD60G9WhK2Jqn79NRe9W3pVdtEqKcSR9kb9pfhm
         3XgIevY5iiVfKd6WgtixdLkJfcENh1IzDfhTvtYfTj1vL3vYR6aadppJLarrn6uY+xKe
         lk2E96hN4cYnALfRAz6Cnm0KIGvvMikJxcDV8uZivAaemOqPj3ln1oCrs49hG2JYW0bu
         Ebng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768948816; x=1769553616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CCHJwAgujuYqn6CDQYvDpbIbZ0yL9/wPyxks5czHWxc=;
        b=sKir2BdFrCsEJmyImMigv1cuWd7LgXdPIaWV/qUT1RNPgtX9XjCFyuuyeY4wmk5dwD
         2+hT3GaGx4iQt+4FDSayLSpmakWKnyMKqQlMUZJDqBLyGjjINujssFt6KYbhWa5uRKxQ
         QllF8/wBblCLnAn4o7DEmzYydYdvKLxmvsr+fsv3pMFYZtBpmbm678kUflPCVgu9It6a
         fQcgicLDSbH0l50alwkl+M4JbxOnKnoAXGd9HA+kVOJ2SwuFZJHra8iFpH0fmmfUwSxY
         uMApFnCiohenTvvjdaryXwUVbMh39n3Sfc9mo8minrbfdSPWfxPO/jGxHP/j58pF3NeM
         vcow==
X-Forwarded-Encrypted: i=1; AJvYcCVRAK+TXLsOf6hYCYe6d0N8IQFdtnCiyayA9q5TXEypKt8HO9KwcyUKeB/E98NaCteZMsAJMurxVj0T@lists.linux.dev
X-Gm-Message-State: AOJu0YyRyn2ErBQZ2qjUxrhG8u21BpGQCRZGtqkEfI+LmcAZ2ThizdMj
	v2430xxCazTWMgA00yrXk9UY3TFN61eNt5q2JomIuDXKS8oSC/g+SpUJ
X-Gm-Gg: AY/fxX5tERiA/3qqNixsg/jwEvTnbreE5uLyv9TDzQbgyQvAvQx5VrCnozB7d7tSYfi
	ROnccNkOYpf5mDtbyVPEO7zLyV1LoeOcQZ7wA7UhQSyyQwNo6A7RheG7lxjaxrW0Wf0Gj3/BpA4
	ZhMmLxupjlB8DSVCanoS7LvFSSjXQ4f//bzC4d8I6/t0cPYKc+zHXyAx3hhWPEqz5OEPCVut43a
	f3cnh4Lwv8Q+xcbYdaWtGDNa3WRyjgYK3lrx1fz6DM8IG4I3psrS8NalrwsiIMLbv7QCUvASoJA
	sQEEtFFTYShYN0BYh7M4rnvDBCl0cjMkdFAbPC4RoFECvBavdusMflaqP2+xShWOCWlOjmyYAmG
	TJj6vP7cJGnashyhGE8/i5YI/JJSxC9oNor9lYcDTcaYvQxdITPoUqYY3FKi/DxwJiZEno75JYs
	IbhYKiDlemShq4+aX4iyRHgobzGykfTSqLWDECdFNVVMoXqfK93PzM
X-Received: by 2002:a05:600c:524a:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-4803e710fa6mr49545845e9.0.1768948816254;
        Tue, 20 Jan 2026 14:40:16 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804245320csm5144125e9.0.2026.01.20.14.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:40:16 -0800 (PST)
Date: Tue, 20 Jan 2026 22:40:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>, Andrew
 Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor
 <nathan@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v1 02/14] x86/realmode: make %gs == 0 an invariant
Message-ID: <20260120224014.29e7f326@pumpkin>
In-Reply-To: <20260120195407.1163051-3-hpa@zytor.com>
References: <20260119192923.651588-1-hpa@zytor.com>
	<20260120195407.1163051-1-hpa@zytor.com>
	<20260120195407.1163051-3-hpa@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Jan 2026 11:53:54 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> When accessing data that is not "near", either only one segment is
> used or one segment is always zero. Leave %gs == 0 at all times
> throughout the C code; this reduces the number of segment loads
> needed.
...
> diff --git a/arch/x86/boot/a20.c b/arch/x86/boot/a20.c
> index bda042933a05..3ab6cd8eaa31 100644
> --- a/arch/x86/boot/a20.c
> +++ b/arch/x86/boot/a20.c
> @@ -56,20 +56,19 @@ static int a20_test(int loops)
>  	int ok = 0;
>  	int saved, ctr;
>  
> -	set_fs(0x0000);
> -	set_gs(0xffff);
> +	set_fs(0xffff);
>  
> -	saved = ctr = rdfs32(A20_TEST_ADDR);
> +	saved = ctr = rdgs32(A20_TEST_ADDR);

Would it be better to wrap that as (say) read_abs_32() since the
objective is to read an absolute address (using the relevant zero segment
register) rather than to read though either fs or gs.

Is this code all running in 32bit linear mode with non-zero cs/ss/ds
segment registers and 'suitable' entries in the GDT?
That mode makes my brain hurt :-)
Or is there a fudge to get 16bit asm from the C.

	David




