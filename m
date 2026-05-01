Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9403DEFE3
	for <linux-coco@lists.linux.dev>; Fri,  1 May 2026 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662289; cv=pass; b=bOiN/Jec/c5tUZ1bt3S9yrcosvL21scjZp57dopmmMLD8UQlbBSl3Fbw6sVkwqUkNTzS3Bty258vBsKNaf9Xj+ACeLD1nN8AjLr2+uvE2El09FJ404SnoLn3ybwyrjQl8zVvLmH+S3gfqWTqt2/p/L5fluZRUyc0Gfn2xiTXymU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662289; c=relaxed/simple;
	bh=bebv1clrkuxRBvZuRjd20Nlr/TDaUWZ2u175JUHDsR4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/0x2T0fIV7YWd+v2Oenpt1bCp3iWwO7lI+1QsQUYO4bIRhzA8yrp3kI14rpW8oaMHAKaoaV8qz1GGbPm45lSbbxUVCuYRXwGk1IogrIRs4ZjaELv8/yPbh4Ivw1/1Sk53Nk/3m1hD2X6g5h9TBn1zSC7AO8WNHyU1urSSKfpFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gtudN2aL; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gtudN2aL"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso1380071241.2
        for <linux-coco@lists.linux.dev>; Fri, 01 May 2026 12:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777662286; cv=none;
        d=google.com; s=arc-20240605;
        b=lo3EWshYN+QilhK+kPIRAsmq4Q6Yz1PPV7b1sywbCEzriNJw5QsTGs0yxIHWS8XSGE
         IFCPIfxfAR5ayRf7od2tgz3yyqR13twP6+vtxsWjxWODKCONd5kfcSv+I748mZh4luHc
         Dci2zMya6bRr51iSV6zKa4t5UVBPWKh16QYgGhn2Zs7tLnhS/BriJ+pySDlaWPtndEoH
         FDlu6hxqK/vWX6FCNMoMQ6w1mpj0fs2CCCAOkWoQllglbLTalkPQEZfGbztMI3tQoJEK
         d5HfRm6sTD5i8EwpRU3W6hLhoJKykiATy1dJYBFnuPJ8AHKOsSlvY+9SQ69soXa0vpbC
         XQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=bebv1clrkuxRBvZuRjd20Nlr/TDaUWZ2u175JUHDsR4=;
        fh=Xxv0ir4FYEHszYza50wA/fr1IMLMbyqic3ajygWLMjU=;
        b=P2Rf+QF7g8na15owmcIgAjI80jOQSORQPag2UhKw3TxSo72yzOHi3oY0K/drx6mgeV
         dBfRqhS4jPNO4HqB3S1MEnVyz0h0Qzrww328yICUfrCeYDTaDeuNr0IKSaIIg0wRH7Us
         gVouqng8k+nk3TpqekPxKiynsvXwSOw+r3gEGEn1BSFm07Xf6hnpxxC+JsAy32QZMX+n
         SGgsTH/x6pbAluHSpOKkoMYzIwpSJalk7pQzMw4/jnHQPKPyXqXkiyXtSr8PsYGv4jJq
         j8ZWYNsZ5nEq8TEfbaI31sBR42gUfEJqW0MCHjenGkNXn+DtzCIYOZfZykPB/P4hjdAv
         gbcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777662286; x=1778267086; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bebv1clrkuxRBvZuRjd20Nlr/TDaUWZ2u175JUHDsR4=;
        b=gtudN2aLNFoRqUF5ZxcH5elJAXt788yT0gqcyWTi4lqogPSXAgnoOp0VWKtlYH8/4N
         oDilU7GSHg1KImh7/bcBJxZlCTjYa8VL7q0tP9tGXBvxmtcbuhvTWhDGAFmXvAnpk6Q0
         3jQ1H85krc0YEz0hCcXmgRR3CqY3o89eoPPgMii2c0w44021Q9UB3AF9U52teeK9Z94z
         vnqB+Efp1tgtbz8ZPY0cOI9Fe0zBPRIf6EAjWmfk06rCJZ30XP/JKvO6W0z3Ia6pPakI
         SaIf0i0d3kqrjZ516v0bip6KGhDzcpKYGa+ayKICPADS0P7iDGJZq/jaDwWNrYFJFPLN
         3nMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777662286; x=1778267086;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bebv1clrkuxRBvZuRjd20Nlr/TDaUWZ2u175JUHDsR4=;
        b=IwsK2bOdiY1AV+RNue46SxR0R74n4dF0XWLnPxmNZt82gM3tnBp4GtnlY+e6ZzRS5I
         C2xOsBrcrQaRbaU+9QBTSlUP4SnL1wmL5mDkDGMhWunACmS5Si1BQgPvdqY2ts+C2mBD
         1nDPr2I5d0XTuW4A3OKRHglUk0nUEeKZNG2Yy9TR4mvv5jMirgcGhTi3ymze0D2un0pX
         uEJRm4Dn6jRGym1MzRLumZ9BQvvb+YmgXJkgNTD2VpKogKy53IYX6d4NzyQob3f/DZpY
         ZtOt/sQLLrknds4/MhXJm0giBMVPBmvb21heEA9moEeXU6i9jyd09UqwRItRT78tU9ZJ
         ickg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZxUJAXthJyjTodyioWRks4T+xx3+2Y6FH7Zw73nVi3GPTgdjV0GJ25bf9ccdqefAkYouynEHhdrFm@lists.linux.dev
X-Gm-Message-State: AOJu0YxwePpLtyDtIkbiVwPbkdOBey9Jl+M7hL/r42zKJbh3+P5yBtPw
	tS1haNv9BfPqrHqhIaiobaiiOKjiXZU/aqYc9zmZ6t5b3FpJC4tBY8eWoVslm/NWwkxTQec4g3l
	speDlcNFYpwp0RZUjZetAVdCvctuKjo1D18VOsEX5
X-Gm-Gg: AeBDietUXVZuyzYIhdk7YWyuiZdo3qsjatJbfMBan1RoUScRuWJggTpHhkLl9+jwYDy
	cVO9/rWBOXxddkY4kItzkXQJqwoJtzFHfygYkMgg290DVE8cYLlVDfGU/qNtX75+FG6xXX/egJa
	+roXAuUbcKCBF3heHFJBPHIgRBBZ2HfKUBjjdedXXWn+mSad1xIms/1p62badNcFLVyd1m6ffVl
	OSCzMYrPDXnkekocbYKHXU/l36VkcY9F465lknw6xwC2WhMugwyUsvGgkYdfd6IYzEmTXLoE9CZ
	s8qf35sZdle9fzJ/fi4zR1TnX9bGNXUnJ1Sna8JGEG9yfrC1NnEpeAHSeDbNKIt+7Bh/qwwiaSX
	ufMtQIj+nNOl2nYw=
X-Received: by 2002:a05:6102:808d:b0:618:3503:5659 with SMTP id
 ada2fe7eead31-62d86a1cf6amr417508137.14.1777662286010; Fri, 01 May 2026
 12:04:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 12:04:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 12:04:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <112cc1213834de1ac97c71314a565ba7dc4af30b.1775874970.git.ashish.kalra@amd.com>
References: <cover.1775874970.git.ashish.kalra@amd.com> <112cc1213834de1ac97c71314a565ba7dc4af30b.1775874970.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 1 May 2026 12:04:45 -0700
X-Gm-Features: AVHnY4JWJ3U3t-qQAMoWKtwBg2sRUlPP1ctl-P2SiKHJIBgo7x_W8ikUl9ZrtSs
Message-ID: <CAEvNRgFVB_-i86RTanqLEeJDHujRXnKo6OnQXduPCwKz8So_kQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] x86/sev: Add interface to re-enable RMP optimizations.
To: Ashish Kalra <Ashish.Kalra@amd.com>, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, seanjc@google.com, 
	peterz@infradead.org, thomas.lendacky@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, ardb@kernel.org
Cc: pbonzini@redhat.com, aik@amd.com, Michael.Roth@amd.com, 
	KPrateek.Nayak@amd.com, Tycho.Andersen@amd.com, Nathan.Fontenot@amd.com, 
	jackyli@google.com, pgonda@google.com, rientjes@google.com, 
	jacobhxu@google.com, xin@zytor.com, pawan.kumar.gupta@linux.intel.com, 
	babu.moger@amd.com, dyoung@redhat.com, nikunj@amd.com, john.allen@amd.com, 
	darwi@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ashish Kalra <Ashish.Kalra@amd.com> writes:

>
> [...snip...]
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
