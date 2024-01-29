Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72B15AABE
	for <linux-coco@lists.linux.dev>; Mon, 29 Jan 2024 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706548076; cv=none; b=oGn2HMP3SgEpRac1jhl/oAUWIsDa9nEaOw0Ph1r3nNsIZL+G58Cb3emGnKmfOMcAQEtYx1mtrRki+8r60mw7SMN2fAFWR+Nj4Laqk319GZ87Ds6UGc6MugdZPucYeHUM6wUPkS6E5ABiXSK6Zhidw06VJzmHqnA2pnR6iCw01rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706548076; c=relaxed/simple;
	bh=0LKrBNn/tdgYxQG5tXJjBvRgb8P6qEb0b3d3tmgiVL4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Z087cgcZXw6nATZo7WRYwDQZhK90gZBKaO/5eRzyPUgCcafNcEsyh4K53hWTrdxcwfUOMe3XSjCQjlOWpgX0beYsW2Q98yXmQjbSrfLJ6apVqPN9fGVNYmc0Saf5y7JzZh2jSxFdZ3YgB4dZZl0g5Cy+QW29q9uI7EaEvNTia80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=fail (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=ZyG41W4t reason="signature verification failed"; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="ZyG41W4t"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 40TH7GOG2246529
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 29 Jan 2024 09:07:17 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 40TH7GOG2246529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024011201; t=1706548038;
	bh=5MgQaeiM+/jYwFflXcmFfBk4nscCJV22lLY8J+jZeMM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ZyG41W4tgHSLobFqHKGEupEcCs6PB4mbtcLDIHcTPTTwHOWrC6KexJsTVE/ff1ndU
	 5OhAYNEdR0F9PJ8N9QmcyiE/p4a/BsVtg9A3vkhIFlKrmuEPMfzdrOH+WrRUL5ZNAZ
	 XaSakUAOVmfiYPxnQA88cpcdKcvql9+I9IkyajGURzbsa2dFSlvldE7easV1Fr5a28
	 jPTOcYZ+w3RbBq3V9aYJ+pnfqIn+S8o50V4owFWZG/QUB9amNec8PPwVbpGZUlgk4u
	 eDWwBPjI0gtp3sv2rA0YBljxZi6YdWSs9/lDJYj2hjpzoTQZ/caRio78l6o8JJnVGY
	 oEyTNk0vyAYkg==
Date: Mon, 29 Jan 2024 09:07:13 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Dave Hansen <dave.hansen@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "Theodore Ts'o" <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Jun Nakajima <jun.nakajima@intel.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Kalra, Ashish" <ashish.kalra@amd.com>,
        Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] Randomness on confidential computing platforms
User-Agent: K-9 Mail for Android
In-Reply-To: <dqiaimv3qqh77cfm2huzja4vsho3jls7vjmnwgda7enw633ke2@qiqrdnno75a7>
References: <20240126134230.1166943-1-kirill.shutemov@linux.intel.com> <276aaeee-cb01-47d3-a3bf-f8fa2e59016c@intel.com> <dqiaimv3qqh77cfm2huzja4vsho3jls7vjmnwgda7enw633ke2@qiqrdnno75a7>
Message-ID: <B5BF8A36-DB2C-4CEA-8011-1708F84827D9@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 29, 2024 8:41:49 AM PST, "Kirill A=2E Shutemov" <kirill=2Eshutem=
ov@linux=2Eintel=2Ecom> wrote:
>On Mon, Jan 29, 2024 at 08:30:11AM -0800, Dave Hansen wrote:
>> On 1/26/24 05:42, Kirill A=2E Shutemov wrote:
>> > 3=2E Panic after enough re-tries of RDRAND/RDSEED instructions fail=
=2E
>> >    Another DoS variant against the Guest=2E
>>=20
>> I think Sean was going down the same path, but I really dislike the ide=
a
>> of having TDX-specific (or CoCo-specific) policy here=2E
>>=20
>> How about we WARN_ON() RDRAND/RDSEED going bonkers?  The paranoid folks
>> can turn on panic_on_warn, if they haven't already=2E
>
>Sure, we can do it for kernel, but we have no control on what userspace
>does=2E
>
>Sensible userspace on RDRAND/RDSEED failure should fallback to kernel
>asking for random bytes, but who knows if it happens in practice
>everywhere=2E
>
>Do we care?
>

You can't fix what you can't touch=2E
