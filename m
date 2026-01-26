Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16B7257821
	for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 22:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769466093; cv=none; b=ZBKEGE1HZli6YT58ZSU4BSS9S1u0PVZanZVE4ZhIY7FKe605OJnLeOW8i1xeIvUnZLMMp/ts1t8W5D10Ig1iZXkzpVFYEAywUyGOITA7bMAehI95UMhpQNJascLTdhRvSImWq6dQdnhAHvWualyRwqQhE6oVtLk8cHDwvdAQkz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769466093; c=relaxed/simple;
	bh=XhISl/UhPWS3Ctz6+y84f9vMqMqt37/WqXUUnAS6v3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G71l11Aj59cK34kuKkLejuVs7Xo4mryHmkbUfzZyvbPqOF7HhG1SsMcA0uBsSKIJ2cU6Mm7nmULz7STyGGsJOCQ3qwyV7b+VPEF64Y0PEds8cZnC+sPIfCplx0Rgyh3SzWCVm9M8oKp28sRJXXVe2X4XJZwLVzej31vzYKYYneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=WKZt0jDi; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="WKZt0jDi"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60QMKoI83292772
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 26 Jan 2026 14:20:54 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60QMKoI83292772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026012301; t=1769466055;
	bh=Y5LE/jnbYZFyYkn+TSQ3sThKKbKQqID7J/IB+1WanBw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WKZt0jDiGX+kvf/T0QnGrEMcpoiak1IfJj5GGW3Lu6UREk0LlSKmKtUtRJ+d/Ymbj
	 /8F9/l8LANANp2N48YWqK6V9aE2VrzV1NHuVTv6oHRVPyyYz2ojIzWElyWv7MFiw5e
	 BQn2PQhM/eUqwFV9AqEXP8+hDftVYRNdHD1Ph3jZtqf9/963a8ylXcsw6fFiNadu05
	 aqODrIckO1/y8R7Vv1N2PxnpxyeGbIW/d2XUqin0Gaz0zv730PSlRGSEfgnPPfBQf+
	 WFO1zIBrRPPgvgHs4n6/YTo5cT2ftJ0xjuUHBZ9WG6TlKXN3yqLVfJIsso6jEisNI/
	 SpkH6kryTTN0w==
Message-ID: <643bfc24-8cc1-4f70-85e2-f6829c8e03db@zytor.com>
Date: Mon, 26 Jan 2026 14:20:44 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
To: Simon Glass <sjg@chromium.org>
Cc: ubizjak@gmail.com, linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        bp@alien8.de, dave.hansen@linux.intel.com, kas@kernel.org,
        kees@kernel.org, linux-coco@lists.linux.dev, mingo@redhat.com,
        nathan@kernel.org, peterz@infradead.org, pmladek@suse.com,
        rick.p.edgecombe@intel.com, tglx@kernel.org, x86@kernel.org
References: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
 <20260122185740.50298-1-sjg@chromium.org>
 <90DAAB54-CBF0-47BD-981A-FEDD26CDA0FD@zytor.com>
 <CAFLszTi+N7Yj0yYHKroypmBoFSx+9m5er8pgULsKbPuooFYj-A@mail.gmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAFLszTi+N7Yj0yYHKroypmBoFSx+9m5er8pgULsKbPuooFYj-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-01-26 13:19, Simon Glass wrote:
>>
>> Including the EFI stub doesn't mean using EFI to boot is required.
> 
> Yes, understood, but it adds bloat. More importantly it will lead to
> people assuming that the stub is always used and thus unwittingly blur
> the boundary between the stub and the kernel itself.
> 
> What is the actual need for this?
> 

I would argue that the opposite is more likely: someone inadvertently builds a
kernel without the stub, the bootloader goes down a legacy support path and
things seems to work... except for some platform subtleties.

The bloat is there, but it is small and is only in the on-disk kernel image;
it is zero at runtime.

As such, I don't think this option is a particularly good idea anymore. If
necessary, it could be hidden behind an EXPERT option, but I first wanted to
see who if anyone actually cares in a meaningful way to maintain this option.
Every option, after all, adds maintenance burden.

Note that the BIOS stub is unconditionally compiled and included, and that has
not been an issue.

	-hpa

