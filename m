Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C682155A59
	for <linux-coco@lists.linux.dev>; Mon, 29 Jan 2024 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546272; cv=none; b=sypqyFWfkO7NTuEAq/d1vyPGxE7b7dmixXGnO3zNJRy6k/x0BZLH74ZVwQqOUxlEhivqT4Ewkxt5rEz0zRZTCjw3d8ludZoik/XnPTp9bblgqlq9191k37r0Kt5CJM9KRZZgf33sr7uJKnqB+nn4UpDmRcyEQwBKcQlfaTZQVWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546272; c=relaxed/simple;
	bh=Vv0bghzWikF0hRqV3J+Zqtj67Ynj9bVIOzXQeSr1MR0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qBEnFDjZht8ia0xTxbhqA2yNAhIZuuvHOzX3pm2Cqh+/0ffCWSnyC/HjDBvpNg1ccfhpsjR1KnNANy+P3FdNTKym6cLycDi8lUIen02QWHWoFio4nBp/cv55FB8IpSPTDWznsSpD+mBRhKE0nGz9ArCcsVIXkvoyY46xYi8Q6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=fail (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=lnbTimrl reason="signature verification failed"; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="lnbTimrl"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 40TGbI5I2234742
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 29 Jan 2024 08:37:18 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 40TGbI5I2234742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024011201; t=1706546240;
	bh=jnhiHc2vJcf7shopPtxezoFGdpgQ4x3ykCkhtXB1nVg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=lnbTimrlMHWAIptNbJLJlsWk/ZzejlJYo7i0NhbqKX9pzTjQwc1sC18gGk04/K1Vx
	 ZQoNUJVCAsPQDcfuiVOMC+hHMvmcHNR4gV30x3Reh/GArk3M0GuqP9J7HFMXw8ROrW
	 WDJIE4tPLzANlznjDrUZzesM7aG8dCKOk0avC3eQJesc3AZesr8FOoh+aWpeuRcF1R
	 1uwPPJQbs0aMUuaROMcO1xBvlD4dWvMjvHjWxiUQFBzRZem/0i5tZSs2ZZbjC2jfzw
	 ksMDFTp1rRWnnYhS0c3AA3Q408uLhT9kulckKPMW65ZJZefIQtXt37V/3hxCR9c/fw
	 pHH7xjAennTcw==
Date: Mon, 29 Jan 2024 08:37:15 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Dave Hansen <dave.hansen@intel.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "Theodore Ts'o" <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Jun Nakajima <jun.nakajima@intel.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Kalra, Ashish" <ashish.kalra@amd.com>,
        Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] Randomness on confidential computing platforms
User-Agent: K-9 Mail for Android
In-Reply-To: <276aaeee-cb01-47d3-a3bf-f8fa2e59016c@intel.com>
References: <20240126134230.1166943-1-kirill.shutemov@linux.intel.com> <276aaeee-cb01-47d3-a3bf-f8fa2e59016c@intel.com>
Message-ID: <82842879-FD34-4652-9714-AEE1F237EFF4@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 29, 2024 8:30:11 AM PST, Dave Hansen <dave=2Ehansen@intel=2Ecom>=
 wrote:
>On 1/26/24 05:42, Kirill A=2E Shutemov wrote:
>> 3=2E Panic after enough re-tries of RDRAND/RDSEED instructions fail=2E
>>    Another DoS variant against the Guest=2E
>
>I think Sean was going down the same path, but I really dislike the idea
>of having TDX-specific (or CoCo-specific) policy here=2E
>
>How about we WARN_ON() RDRAND/RDSEED going bonkers?  The paranoid folks
>can turn on panic_on_warn, if they haven't already=2E

That would be good anyway=2E
