Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13BB1D54A
	for <linux-coco@lists.linux.dev>; Tue, 16 Jan 2024 22:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705443218; cv=none; b=DXLRJQB04xhrMhjzF3xbIlVnXRBupWc4soSrPeNHRLKS177DuLv+T8PL1O1ljJ01MV3+QShbeIAuTAIKXUf5wMRfkSV/wrrRX7GheC2t0bYyqEtFbrDx5TiEFboPNk9UTSmPRqpIXUicQmUKh3ynCO6q9DJljIl9HPa3G7y207w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705443218; c=relaxed/simple;
	bh=uXUySLhnCG85bx+rOKM7Gu9Ss1FziVWmsqNmRvNkWVg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=pdp9enIJNdD4tIcH9/KGWLF5KfT/3Y2DWDXk0Z8A9EaQ9cajG2DZs10KPRaAJNaFoAmA8BgGd3CbtIupNFX+J6jUoLtpC7Vj7DGHgNJMpjw9Apk4MqDvoJG9SUdwhGBPYWn9XUsaFZ5IcCiWmxFVYHDFAmGKKPRzHKYZhpZdjfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FcEZIRLa; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FcEZIRLa"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-466f6d4b6d3so1478091137.3
        for <linux-coco@lists.linux.dev>; Tue, 16 Jan 2024 14:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705443215; x=1706048015; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXUySLhnCG85bx+rOKM7Gu9Ss1FziVWmsqNmRvNkWVg=;
        b=FcEZIRLa892/RovyeCzRNENzinsf+tGmMkFQS9DCJDSk9rwVLFm6e8f1PiIGEwERIC
         MzKa6XQpPvnj01s1bI7XB8gTGk+gIyHLOlfcH6Q9iCSKq6psFo8pwnS1a3ogI2c0OCms
         Mqq+n3TzDkWOObVOy5RbHBsGEtM0q7SBe2scl1EfZ8EcYTpO3SX1R+0NMKQZg47vQJOR
         Wk2DZOoyRH440DkcSs/eF063XtnNgC9xo87HzjYYJZ7c6g8q0iDpCSFIuJoow+vkXWhA
         pyesfjgvwNh8/ws5LBNjFo9ZSXiynNnL9nBKg70nFqC0MXpznJ7M9/ZBqYghkwPytM1U
         Fsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705443215; x=1706048015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXUySLhnCG85bx+rOKM7Gu9Ss1FziVWmsqNmRvNkWVg=;
        b=bLloX35/Ky/xvtR+OopxSfBu5hfnx9HVRHWKKk6cpWKzk+jNDMIkPJZnx6kVZOqmPh
         ED+9y8Zg9RkFvEO618Yejh8Rh7sKnwHRk1Iw+yJ/Y4c7fTYxx37nuV8MfwylJyZPx4KV
         tx0rNVrftFFtA87k0G8w+icX0+QkjxK++ODvNJkQX7ojImrW2XuS/1nQ31wmZHSQ6FeN
         yk6IOaaLxmbkidCDeXeZ6xxprBegy5xdYUteTK0iSc4GD+FlRaL5U6xaVJ/5YK9cxMUL
         1rh2DVJvdeosjztGJOmLN92Ip3stQdnUpnHR559Tsq2slaElBr4hXVAO6+TXHpnibPop
         HNVA==
X-Gm-Message-State: AOJu0YzWdxOPYaYwS230IEqki98RA4qflZ7mDTXirlAZ68NMuEr5Ct+c
	q37on0VRQAuIs8dgWCgh82hcdvxN4RsI6dRYQMkR1mnvEmSU
X-Google-Smtp-Source: AGHT+IEGScU0ZTL2QhTP1nMK173wqMj1xkpPYqcsbNcqk4CrqzbSWm31Y8eJbmw7bHyYix3JGRToRDf4tDjpfl1vLj8=
X-Received: by 2002:a05:6102:1811:b0:467:f7eb:8074 with SMTP id
 jg17-20020a056102181100b00467f7eb8074mr3965650vsb.29.1705443215629; Tue, 16
 Jan 2024 14:13:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZZ7YuEexYSaZYmLK@tassilo> <20240111223650.3502633-1-kevinloughlin@google.com>
 <20240112121725.3amxlumpifhagamb@box> <CAGdbjmLeyPhYfjVHPRa8LgNYjt9-rOPiyCodHoQOkEh9iQhjBg@mail.gmail.com>
 <20240115101239.nab725vuazvutgw6@box.shutemov.name>
In-Reply-To: <20240115101239.nab725vuazvutgw6@box.shutemov.name>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Tue, 16 Jan 2024 14:13:24 -0800
Message-ID: <CAGdbjmLrH_fZMS6pCX5pNKCJ2jLm1xAcJkHv5R4Z7MycvhbR5A@mail.gmail.com>
Subject: Re: [RFC PATCH v2] x86/sev: enforce RIP-relative accesses in early
 SEV/SME code
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Kelley <mikelley@microsoft.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Arnd Bergmann <arnd@arndb.de>, Steve Rutherford <srutherford@google.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Yuntao Wang <ytcoode@gmail.com>, 
	Wang Jinchao <wangjinchao@xfusion.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Brian Gerst <brgerst@gmail.com>, Hugh Dickins <hughd@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Joerg Roedel <jroedel@suse.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-coco@lists.linux.dev, Ashish Kalra <ashish.kalra@amd.com>, 
	Andi Kleen <ak@linux.intel.com>, Adam Dunlap <acdunlap@google.com>, 
	Peter Gonda <pgonda@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 2:12=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Fri, Jan 12, 2024 at 10:29:36AM -0800, Kevin Loughlin wrote:
> >
> > Per my tests, yes we can; I replaced the fixup_*() functions with
> > GET_RIP_RELATIVE_PTR()/PTR_TO_RIP_RELATIVE_PTR(), and guests with and
> > without SEV, SEV-ES, and SEV-SNP all successfully booted under both
> > clang and gcc builds.
>
> BTW, do we need both macros? Caller can do &var, right?

While I don't think the caller doing "&var" would work without passing
it as a separate argument like `GET_RIP_RELATIVE_PTR(var, &var)` (as
we would still need the original var's string name in the macro for
the inline assembly `#var(%%rip)`), we should nonetheless be able to
merge both into a single macro with one "var" argument. Specifically,
the only current difference between the macros is the input operand
constraint, and GET_RIP_RELATIVE_PTR()'s constraint will work for
both. I will make this change in v3.

> If we are okay with single macro, maybe rename it to RIP_RELATIVE_PTR().

With the merge into a single macro (and upon thinking about the
macro's behavior), I have a slight preference for
`RIP_RELATIVE_ADDR()` in v3 because it makes it clearer that the macro
behaves like the address-of operator "&" (just guaranteeing the use of
RIP-relative addressing to obtain the address). However, I'm happy to
go with RIP_RELATIVE_PTR() if you feel that's better.

> One other thing: I see you sprinkle casts to for every use of the macros.
> But why? void* can cast to any other pointer without explicit casting.

You're right; the casting is unnecessary. I'll eliminate it in v3. Thanks.

> > On Fri, Jan 12, 2024 at 4:17=E2=80=AFAM Kirill A. Shutemov
> > <kirill.shutemov@linux.intel.com> wrote:
> > >
> > > Also, is there any reason why GET_RIP_RELATIVE_PTR() and
> > > PTR_TO_RIP_RELATIVE_PTR() have to be macros? Inline functions would b=
e
> > > cleaner.
> >
> > I used macros because we need to use both the global variable itself
> > and the global variable's string name (obtained via #var in the macro)
> > in the inline assembly. As a secondary reason, the macro also avoids
> > the need to provide separate functions for each type of variable for
> > which we'd like to get RIP-relative pointers (ex: u64, unsigned int,
> > unsigned long, etc.).
>
> If we do it only on pointers, wouldn't void * -> void * be enough?

Only using pointers would indeed eliminate the secondary factor as a
reason to use macros. However, the primary motivation for a macro
would remain: we still need the string name of the variable for the
inline assembly.
