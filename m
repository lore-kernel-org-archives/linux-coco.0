Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B3046BF
	for <linux-coco@lists.linux.dev>; Sat, 24 Jan 2026 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769228778; cv=none; b=bMrzLcHsF6ZG88RsuiqnBrmZLn6Gfu6c/ojmVjktENhvJNFHWX2uCZ5XC8a2IYYsU45Ay4AMCoX91wZTlIgt4vos9Am8BtntxnxGCAumPcn/Ae4zM4LVZXsVXlo9zdcvvPjIPimC2RNDC3zkHz/i3AJzr8vZ34nFX6AGgswZ+L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769228778; c=relaxed/simple;
	bh=gXgVNmqj4CUZPJkKHISXZ1Lm13gLzr/gwIKvS0rmcRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4cHq2RlSt5Z7ZjWK++J94CecRJ7AC6jaXD97Z0Uh9HxRAZSnl6t7aS1FwtlEWe0c6n7tegQ7d8sbOP7Pjvh8ou8tnrObNP/K26XrasZybH5LfC0aqFoBkfhk6aNOdAWTltaWGgMJ9BVCBIaUKpe4b3PIphnCHziV31EMhUZuEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=EZp6PFFl; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="EZp6PFFl"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60O4P0Lu1323998
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 23 Jan 2026 20:25:10 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60O4P0Lu1323998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1769228735;
	bh=/VFeBB1HSydYrguYl5MYc81WIjhzvV3FgPc1l7OBfeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EZp6PFFldLlZrgsheVo1OwyMLrpSeoT4IXdcjolsDuMt1p3HgU6s9OvFqkpoP234A
	 f2xen/ucT0XCBv8Ek1oF6bcsKUE8GcHPT+s9EHeBk5sqBLnZvpPWfB4KmBa2JAv2WE
	 +6kTkanzZNp3LqG9/ktwR0R5vc/2mfNM++Cjbuok1ue6YnESr4+Aiem+sUjqVyYVsH
	 pX6Lg9A5csEBJb0jmKMSxZvSGBP4MG0aNuel1QR3dwupeR2gfCXUz+VD3lY4yYoxop
	 nFY19wN1mCzkSMFF2KxLOzUfSXp5/mAqMlWUKPWhx3sA2otOV9JMUGGVH1erq9zmTm
	 eDO2/OuNFznxA==
Message-ID: <981124b5-040e-400b-9912-15a65fdfdfdd@zytor.com>
Date: Fri, 23 Jan 2026 20:24:55 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/14] x86/boot: tweak a20.c for better code generation
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
        David Laight <david.laight.linux@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kiryl Shutsemau <kas@kernel.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
        x86@kernel.org
References: <20260119192923.651588-1-hpa@zytor.com>
 <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-13-hpa@zytor.com> <20260121114911.6adc2838@pumpkin>
 <alpine.DEB.2.21.2601240244460.6421@angie.orcam.me.uk>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <alpine.DEB.2.21.2601240244460.6421@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-01-23 19:00, Maciej W. Rozycki wrote:
> On Wed, 21 Jan 2026, David Laight wrote:
> 
>> No loops needed.
> 
>  A loop is needed because there can be a considerable delay from issuing 
> the I/O request to flip the A20 gate till the circuitry responding.  This 
> is particularly true with the command issued to the 8042 device, which is 
> a microcontroller running its own firmware that needs it time to process 
> an incoming request to drive one of the microcontroller's GPIOs.  There 
> was a reason for port 0x92 circuitry later added to the PC architecture 
> with the IBM PS/2 being called the "fast A20 gate".
> 

Indeed. I thought I had responded to this already but I hadn't, apparently.

Note that the "long" delay is 2^21 loops! That number wasn't taken out of the
air, either; we found machines that actually needed that many iterations.

In the case where A20 is enabled already, the loop terminates on either the
first or second iteration (the second iteration is when the value at 0x1000200
is exactly 1 higher than the value at 0x200.

Modern machines (Nehalem+) already have A20 enabled, and most machines of the
i686+ generation implement int 0x15 function 0x2401.

	-hpa

