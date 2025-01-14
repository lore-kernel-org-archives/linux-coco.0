Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720B01D5AD3
	for <linux-coco@lists.linux.dev>; Tue, 14 Jan 2025 17:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876021; cv=none; b=FhdHRgreChRYoU4Ul4NjirybDdEONJqzPdN9/8aEvcRXQYo+dBIwh/5WUsB6+lWtlvq6WsDMDwknfI2hxRlkzmPbfTla+1BaPg7WJy/a1G3occPyTr9irlUhFiz+i/L08OMfJheCgk9M3xFbjoTq56w4JNpl3fw6MJltb7q5EvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876021; c=relaxed/simple;
	bh=u70UZQQ6rrjlX6HwoBxIlEBWzFfCa1RmDu5GKrBIlwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eebqyPTTDxmkOPiXprr+BYNyGbzRoLgfww5aWTvi1DAnNEC/YyINB7i6rELHnAHLxS9rGC5Zt8QJiKQZ+wn86cc3pA0uoCxr6fKM4ji+i5vifI0gPwTE6W1UAVgObDHgUl4D04oMA+VjpxMv1mHRSk0a9z8LzYW2O/H44I5oOpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=lQoZUunX; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lQoZUunX"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b7041273ddso476101785a.3
        for <linux-coco@lists.linux.dev>; Tue, 14 Jan 2025 09:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1736876018; x=1737480818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AE0+MZyBKWqlPeBgME+af5vIGaihr4hRouPkFE36rIs=;
        b=lQoZUunXfXFTb08uXJpCAfGTu3PiRc2lANOPhJDEQg58OkBr2y8X/cT1QkprRZHGDd
         QW9MltV993PYKmMMnLC76mMW3IRygn2UEXyeWfPKZlsHveevBs6o/TfG6BSOJTtQQs5K
         NZnH8vk6pbg+amLOEaWAT9dk0cxi+2UEULpHxGTYwI6aGLY+KrMbb4H9a6tVUOlDzVHZ
         SksRAyar1YEA021PhwVFXTd2nKGaVjBo9AVtc7Ow+zFXlUb6UXqSPxbCFj0zTb9+v2pB
         QZwo4CLuQKvgjaLEJAb0ToNED+oz63dyDFw2WSH03yhiXPMzoKiEj8qxrxjIG6I7nq31
         Guag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736876018; x=1737480818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE0+MZyBKWqlPeBgME+af5vIGaihr4hRouPkFE36rIs=;
        b=criIIIJtEj5eMx6rgB4sEzct6YytVpbHgtCc8F9G0jG4hDKj0UxuXkP2fTvnQxPhWc
         nfbE0GFdZsUafjGqDEs99NMuAubqpuRZICgqooRCubbrMt7ycC524GIXbNprEYKtPPtk
         ///R7iQIU7LlhzjhsmIWft5DiAMvonkKXO7HuAdzkw5GZIYPG2r4jkKkIfnqFLxXHoqW
         rfyxVpOmB+Al0v8uzkHNiaJgiH8pXsNEeZYXTTAyEGqL9XuyGz1iOL7K+RZwgYsLWmq/
         W/sbb49j/E7+Gb9XrN5c0H0FOCwujxSVkErFWziTuTOryhg9I92JaR21/GlVlxxu+HQi
         G6gg==
X-Forwarded-Encrypted: i=1; AJvYcCUlqUCfCseyOjvGlWRYui+kFWFoVPndu5glAJNTcOqlGhEoTa7idq2R64jOmlN7eAh/JAasrqUPuRDp@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq4jqp++MSv+N+ys+E2dQPP5LipiBfFSkJWDjAnQj7BEiP+LxU
	nH/qED0obVAdxNJkS5QEaI5TnRmhPkOkSYlXgVb0VAxl+3QxBhl4kcLrkB8WznM=
X-Gm-Gg: ASbGncv8/IjWI4bxafToukEM/wW6z/CHkLvTvRACeYdN60Mc6Av16k+mdzNdoeILQUg
	TkiD97uV4nK3NLsD4mzEaaWuOtEgZootX7lGVGH+D0hA0i91PEVnLNN/LNhF3m2zKWjTuWwxHo2
	b+n8/lmguopM+emD+ghQpqNLo29Pls8u74m6KcqOtsNy/TDTiLOfkd2ilXcT4aryxoyrVVn9GeY
	SCVIWd1m2DhpAlw8eEmQG2qh7eLAb+bmh4bmTGgFKwrqBxQ4OiaWRg3aVWS5QlxzBcVsFrCA0BI
	FWJiJEpg1RDyQGf/rIpKdtpKuRdRBg==
X-Google-Smtp-Source: AGHT+IFRhteXjfiktcSVEFWKeer5Q7R8iGRjkKhk3nK9D37c1uhceHVW0TcXnbzSolSoDFgCOgCQYw==
X-Received: by 2002:a05:620a:2b9c:b0:7b6:67a6:5adb with SMTP id af79cd13be357-7bcd973d017mr4021472985a.21.1736876018296;
        Tue, 14 Jan 2025 09:33:38 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce350304bsm627970085a.71.2025.01.14.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 09:33:37 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tXknI-00000002OrX-426c;
	Tue, 14 Jan 2025 13:33:36 -0400
Date: Tue, 14 Jan 2025 13:33:36 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
	James Bottomley <james.bottomley@hansenpartnership.com>,
	linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-integrity@vger.kernel.org, x86@kernel.org,
	Joerg Roedel <jroedel@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
Message-ID: <20250114173336.GL26854@ziepe.ca>
References: <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca>
 <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
 <20241211150048.GJ1888283@ziepe.ca>
 <CAGxU2F7QjQTnXsqYeKc0q03SQCoW+BHbej9Q2Z8gxbgu-3O2fA@mail.gmail.com>
 <D6FSHG5Z9UJQ.CWQTAANBVIQQ@iki.fi>
 <6rwo7tkdst227kb4pwvr54w4mfz2zw3offux7mqfupi3rgwkaz@65yklvvqw6n4>
 <CAGxU2F4YQy-otsGtGiUHDiL7PGXic2_HzWL_+GHkn+Hs_ScGpQ@mail.gmail.com>
 <20250114130720.GJ26854@ziepe.ca>
 <2yyqhjkxl56uqv35smrq6mdddufcpoj7fgon4n6h6zwei4kryu@pkwhln6b57ga>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2yyqhjkxl56uqv35smrq6mdddufcpoj7fgon4n6h6zwei4kryu@pkwhln6b57ga>

On Tue, Jan 14, 2025 at 05:51:33PM +0100, Stefano Garzarella wrote:
>   Otherwise we need an intermediate module in drivers/char/tpm. Here we
>   have 2 options:
>   1. continue as James did by creating a platform_device.
>   2. or we could avoid this by just exposing a registration API invoked by
>   sev to specify the send_recv() callback to use. I mean something like
>   renaming tpm_platform_probe() in tpm_platform_register(), and call it in
>   snp_init_platform_device().

You should not layer things on top of things. If you have a clearly
defined driver write it in the natural logical way and export the
symbols you need.

Either export TPM stuff to arch code, or export arch code to
TPM. Don't make crazy boutique shims to avoid simple exports.

> > Meaning that you'd export some of your arch stuff for the tpm driver
> > to live in its natural home
> 
> @Tom do you think we can eventually expose sev API like
> svsm_perform_call_protocol(), svsm_get_caa(), etc.?

We have lots of ways to make restricted exports now, you can use them
and export those symbols. There shouldn't be resistance to this.

Jason

