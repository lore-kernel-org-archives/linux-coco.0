Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05C396B6F
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768996157; cv=none; b=bkuMqFi3V2c/ez4+qhD/6hPDTycxfe3O1gHwXqhtazxQloI6RrxHXyjuZn4IsH+gxcvqrGA3ZVXzs0yrskI4Ko9Hn055U2toEu32t0fWVfbcbLASGFEDNtK/ptfx9MmJjdCsdSTEY3uPazAXEoXGYNlRwgzoaMbiReI2046IdWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768996157; c=relaxed/simple;
	bh=9P1oxkkeGLl+73G/RPeJ2iahSpfwZQV1OvoeFEU4suU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PAE3BKMT4CYYgmuNfYsuh6hXGUXGbGErfclKcDuThBCcgNvx5uBi/yYX5T/ATn9etEoe8CB/WcDjW1MRFrHukuZn8989almWiqOUSfP2cnDVXl1ZAnT1Z2mJGAj685yg++faOsD1UKWOaon6G0rFJb8J7lWKpG0jqeHTKMvLpL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTuNS7bU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTuNS7bU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso54271605e9.3
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 03:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768996153; x=1769600953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITBIXZk62NEbtB+Nq7VhAQKuPqht3R7UkgTIbCgdcCA=;
        b=XTuNS7bU/p5uDn6fNXoigehip4B0y/ZO+T7yauetskfjbVXL8p6RIEPMUJjhgw8Qa1
         txVReoh0hlj/gP8M/osTZxFklQqB21Gtr9UPD3T3VoHwt296RnH042IsYUJgC/oINXfe
         Q+kwMt63xzGwr5qhu+RKSDsF+ifW1mj81aTl9OeJtva7V8zr2MlzE2QTVSN7fCb0batg
         3ujCkSXwaqbniDIPhgO7YEivVzG2BRFNG/p4x3kPKqeLL69yxxiYMgbFFf61Iy6pMsqy
         gMnQCCFcCeLrCQU3pRko2OxJepkd04kM0xjvAou3pha+7dZoM/GZOHf7JFyhaQ1RVJ7+
         Gr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768996153; x=1769600953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ITBIXZk62NEbtB+Nq7VhAQKuPqht3R7UkgTIbCgdcCA=;
        b=SrDeYe85rxmbHc/xwd2ACmhRmVscbL/HrkmInHozO43VuWAzKbZwSqlIHbwt0kds5A
         yQCpW8pmL7LVSTObX3Oe5z9ikWJtuKdzR7DFCQbXrF94z8NHG0PwEnL6jplepj4swGFs
         BdVZS5TPAeNCJ4oA3bqqZwD1f8mODsScE2saPJhT5YMV3VuY0DjUXL1GrhNO+E3nfSnM
         nT1U4uQPItNKC3DLx+PZI51evS9yPc94ocLzqayGvMxIJjqUSVFMjarI8igAM1ItfDMb
         xg/IjAv4O2a2pLZshQMudXPGlXrJuU/EZNf5RnALd97NXejKy3xZGk9h3wNYCXqahD2z
         4DMw==
X-Forwarded-Encrypted: i=1; AJvYcCUC+pKO0L8KFF7kVI20WRbTfnrCtySlhftQEqTX7Xbmuw5Nnl+fe3pNOOAAw9vw5V660+2y1hybvhMp@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2gX9eWDWo+5LyPKi/yCrFTKyDJjI7K2HVZBe6bzgemcLaYyO1
	JeM+QTkM0joPKP9TFaY7pWBDcjhXIGF5LhmQDfsR09IQ1u89LYTEL+eS
X-Gm-Gg: AZuq6aJd/sNJVE3ZMEGku6eC+azd/3KusQ9cMBkRhTgo48F2Mcdp8ELAJlEQd+v5INR
	mvwvJoggegG0gKBAsxu7NAlIfKfD/wwXLKx4e1NRHg29Dic4ygeTz07eSnHSIa21Ij+HZsSpxaQ
	aaxoFO4qb+chIpZzJtLefy6SdEOpWyBfy8ZumRWpthKdz0aG9IATsNcBhlMQscsFwH4zfvD8ySf
	omncg+HHKYeM99Mycqu3s229dOPHJE6P+K28o4SpuhF+z2z0Io3gisn0+uzBbS4b8lhhjGbmr/Q
	UkZbT+57NNYIOafL1Cz9UPABv5KBHrQr0GJ5SEiLNhfsaXpNqhBjuVnloWvmg9SHKXYqijdDMdM
	OfQi5hhbG3f4pgraZDE9NJX2+pu1bUInKcPJlzZ90wXGvHKju1EH0rTQfu4hOMPrZdnH5dia4z+
	FM0q//oE/Q/rfH8HU1TUzQ26MjZAwl62g78nlk2S/xUQ7XxurIW0MA
X-Received: by 2002:a05:600c:4fcb:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-4803e78fdb4mr79504775e9.6.1768996153461;
        Wed, 21 Jan 2026 03:49:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071besm357824995e9.10.2026.01.21.03.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 03:49:13 -0800 (PST)
Date: Wed, 21 Jan 2026 11:49:11 +0000
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
Subject: Re: [PATCH v1 12/14] x86/boot: tweak a20.c for better code
 generation
Message-ID: <20260121114911.6adc2838@pumpkin>
In-Reply-To: <20260120195407.1163051-13-hpa@zytor.com>
References: <20260119192923.651588-1-hpa@zytor.com>
	<20260120195407.1163051-1-hpa@zytor.com>
	<20260120195407.1163051-13-hpa@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Jan 2026 11:54:04 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> Do some minor tweaks to arch/x86/boot/a20.c for better code
> generation, made possible by the __seg_fs/__seg_gs changes.
> 
> Move the die() call to a20.c itself; there is no reason to push an
> error code upwards just to die() there.

Can't this code just do:
	sv = *0000:addr;
	val = *ffff:addr+10;
	if (sv != val)
		return 1;
	*0000:addr = ~val;
	io_delay();
	val ^= *ffff:addr+10;
	*0000:addr = sv;
	return val != ~0;

That inverts all bits, inverting one is enough.
No loops needed.

	David

> 
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> ---
>  arch/x86/boot/a20.c  | 24 +++++++++++-------------
>  arch/x86/boot/boot.h |  2 +-
>  arch/x86/boot/pm.c   |  3 +--
>  3 files changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/x86/boot/a20.c b/arch/x86/boot/a20.c
> index 52c3fccdcb70..38a1cad8a553 100644
> --- a/arch/x86/boot/a20.c
> +++ b/arch/x86/boot/a20.c
> @@ -53,24 +53,22 @@ static int empty_8042(void)
>  
>  static int a20_test(int loops)
>  {
> -	int ok = 0;
>  	int saved, ctr;
>  
>  	set_fs(0xffff);
>  
>  	saved = ctr = rdgs32(A20_TEST_ADDR);
>  
> -	while (loops--) {
> +	do {
>  		wrgs32(++ctr, A20_TEST_ADDR);
>  		io_delay();	/* Serialize and make delay constant */
>  		barrier();	/* Compiler won't know about fs/gs overlap */
> -		ok = rdfs32(A20_TEST_ADDR+0x10) ^ ctr;
> -		if (ok)
> +		if (rdfs32(A20_TEST_ADDR+0x10) != ctr)
>  			break;
> -	}
> +	} while (--loops);
>  
>  	wrgs32(saved, A20_TEST_ADDR);
> -	return ok;
> +	return loops;
>  }
>  
>  /* Quick test to see if A20 is already enabled */
> @@ -125,7 +123,7 @@ static void enable_a20_fast(void)
>  
>  #define A20_ENABLE_LOOPS 255	/* Number of times to try */
>  
> -int enable_a20(void)
> +void enable_a20(void)
>  {
>         int loops = A20_ENABLE_LOOPS;
>         int kbc_err;
> @@ -134,30 +132,30 @@ int enable_a20(void)
>  	       /* First, check to see if A20 is already enabled
>  		  (legacy free, etc.) */
>  	       if (a20_test_short())
> -		       return 0;
> +		       return;
>  
>  	       /* Next, try the BIOS (INT 0x15, AX=0x2401) */
>  	       enable_a20_bios();
>  	       if (a20_test_short())
> -		       return 0;
> +		       return;
>  
>  	       /* Try enabling A20 through the keyboard controller */
>  	       kbc_err = empty_8042();
>  
>  	       if (a20_test_short())
> -		       return 0; /* BIOS worked, but with delayed reaction */
> +		       return; /* BIOS worked, but with delayed reaction */
>  
>  	       if (!kbc_err) {
>  		       enable_a20_kbc();
>  		       if (a20_test_long())
> -			       return 0;
> +			      return;
>  	       }
>  
>  	       /* Finally, try enabling the "fast A20 gate" */
>  	       enable_a20_fast();
>  	       if (a20_test_long())
> -		       return 0;
> +		       return;
>         }
>  
> -       return -1;
> +       die("A20 gate not responding, unable to boot...\n");
>  }
> diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
> index 4d3549ed7987..584c89d0738b 100644
> --- a/arch/x86/boot/boot.h
> +++ b/arch/x86/boot/boot.h
> @@ -167,7 +167,7 @@ void copy_to_fs(addr_t dst, void *src, size_t len);
>  void *copy_from_fs(void *dst, addr_t src, size_t len);
>  
>  /* a20.c */
> -int enable_a20(void);
> +void enable_a20(void);
>  
>  /* apm.c */
>  int query_apm_bios(void);
> diff --git a/arch/x86/boot/pm.c b/arch/x86/boot/pm.c
> index 3be89ba4b1b3..e39689ed65ea 100644
> --- a/arch/x86/boot/pm.c
> +++ b/arch/x86/boot/pm.c
> @@ -106,8 +106,7 @@ void go_to_protected_mode(void)
>  	realmode_switch_hook();
>  
>  	/* Enable the A20 gate */
> -	if (enable_a20())
> -		die("A20 gate not responding, unable to boot...\n");
> +	enable_a20();
>  
>  	/* Reset coprocessor (IGNNE#) */
>  	reset_coprocessor();

