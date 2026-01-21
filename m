Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4BF25A334
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 00:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768956496; cv=none; b=jPb44bCtz6q0cdELY1KOsvA1y0w/2TjRhRfzDM6hpjhUYqumL3hry0Z2lvwJShEnIpwZqLZbW4J2XHc5hnrxcTRGvYQp5GviPY6hinYb1istc7eQ5FrG+3ZyNINA3IbJS8ZJdLuJHoPM1xc3HqOrpYCsPzZE6ZM5WXD9WZYOznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768956496; c=relaxed/simple;
	bh=A2DZn708F8sWtrvHdpVnrqmr5TaKxs/ftDh4T1qmt2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4GIiBXe6+iUtAMy/zQwt1mlr4DKs9oPl5OEy1QmjAJMhzWf5FhDqnFa195oSfoGQ+JlnPH9rSVVBO/+4w32hx9PqrzvkN0mCsbUDQjNGgKeAWvM7zhhGcSMM0SJqCzugdUkdCyy/FP7Vap3rnS61p+DJRIN0wgkqGXBWZeUcZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=HK+7gAwF; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="HK+7gAwF"
Received: from [IPV6:2601:646:8081:9483:12c5:bc8e:d949:3497] ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60L0lXU7239364
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 20 Jan 2026 16:47:45 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60L0lXU7239364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768956466;
	bh=PLqul68T6c3hK9aZKHKPNbSxtyK6Onpf5TAGFX6dfrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HK+7gAwFNpV1meW2l2g2qOWRjJeuUe0uzUSBUcC3MRTIUxo5tJQPXNdMy9Sd8mBiF
	 T6LSA6SvrpdXlDesdB7gdFFjAY5w7j4ElSIpnNmjca8RI0p/n/7gCBSS4lyOwfveMo
	 yEoCnzzgejoDMI0y+yh9+TdujsMamwKGIwnuqjVz89mdT1fQM/k3EEu8NI4/XTSG4G
	 8lNRNH/w64x0ciIv04lmbR2xAcqQSlwnZF5FJUto3bJep49564cHravWrQLlDgh2v/
	 IPsASNHjuym6Q2zV5QZcFo4A56Fxl1i2GmWjBSLKktCzMUYIHLdh6ZHSzYt8eqXvQd
	 qvk/JCV1907wg==
Message-ID: <589429e0-e8c8-4949-972b-42d5bbfd83a3@zytor.com>
Date: Tue, 20 Jan 2026 16:47:28 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/14] x86/realmode: make %gs == 0 an invariant
To: David Laight <david.laight.linux@gmail.com>
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
 <20260120195407.1163051-3-hpa@zytor.com> <20260120224014.29e7f326@pumpkin>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260120224014.29e7f326@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-01-20 14:40, David Laight wrote:
> 
> Would it be better to wrap that as (say) read_abs_32() since the
> objective is to read an absolute address (using the relevant zero segment
> register) rather than to read though either fs or gs.
> 
> Is this code all running in 32bit linear mode with non-zero cs/ss/ds
> segment registers and 'suitable' entries in the GDT?
> That mode makes my brain hurt :-)
> Or is there a fudge to get 16bit asm from the C.
> 

To address your specific question, no I don't think that is a good idea, since
it would imply that you can reach an arbitrary linear address, which is
definitely not the case.

At least this way the user has to look at what they are doing, which I think
is a good thing for this specific code.

	-hpa

